Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qg0-x236.google.com ([2607:f8b0:400d:c04::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1awxTU-0001rU-NL
 for ath10k@lists.infradead.org; Sun, 01 May 2016 19:56:17 +0000
Received: by mail-qg0-x236.google.com with SMTP id w36so8039216qge.3
 for <ath10k@lists.infradead.org>; Sun, 01 May 2016 12:55:56 -0700 (PDT)
Message-ID: <1462132553.5535.207.camel@edumazet-glaptop3.roam.corp.google.com>
Subject: Re: [Codel] fq_codel_drop vs a udp flood
From: Eric Dumazet <eric.dumazet@gmail.com>
Date: Sun, 01 May 2016 12:55:53 -0700
In-Reply-To: <1462128385.5535.200.camel@edumazet-glaptop3.roam.corp.google.com>
References: <CAA93jw6QLyx9EaS+ntB0D3duoysu_Z-UYyQfHnRa=pfqPDfWOw@mail.gmail.com>
 <1462125592.5535.194.camel@edumazet-glaptop3.roam.corp.google.com>
 <865DA393-262D-40B6-A9D3-1B978CD5F6C6@gmail.com>
 <1462128385.5535.200.camel@edumazet-glaptop3.roam.corp.google.com>
Mime-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Jonathan Morton <chromatix99@gmail.com>
Cc: make-wifi-fast@lists.bufferbloat.net, "codel@lists.bufferbloat.net" <codel@lists.bufferbloat.net>, Dave Taht <dave.taht@gmail.com>, ath10k <ath10k@lists.infradead.org>

On Sun, 2016-05-01 at 11:46 -0700, Eric Dumazet wrote:

> Just drop half backlog packets instead of 1, (maybe add a cap of 64
> packets to avoid too big burts of kfree_skb() which might add cpu
> spikes) and problem is gone.
> 

I used following patch and it indeed solved the issue in my tests.

(Not the DDOS case, but when few fat flows are really bad citizens)

diff --git a/net/sched/sch_fq_codel.c b/net/sched/sch_fq_codel.c
index a5e420b3d4ab..0cb8699624bc 100644
--- a/net/sched/sch_fq_codel.c
+++ b/net/sched/sch_fq_codel.c
@@ -135,11 +135,11 @@ static inline void flow_queue_add(struct fq_codel_flow *flow,
 	skb->next = NULL;
 }
 
-static unsigned int fq_codel_drop(struct Qdisc *sch)
+static unsigned int fq_codel_drop(struct Qdisc *sch, unsigned int max)
 {
 	struct fq_codel_sched_data *q = qdisc_priv(sch);
 	struct sk_buff *skb;
-	unsigned int maxbacklog = 0, idx = 0, i, len;
+	unsigned int maxbacklog = 0, idx = 0, i, len = 0;
 	struct fq_codel_flow *flow;
 
 	/* Queue is full! Find the fat flow and drop packet from it.
@@ -153,15 +153,26 @@ static unsigned int fq_codel_drop(struct Qdisc *sch)
 			idx = i;
 		}
 	}
+	/* As the search was painful, drop half bytes of this fat flow.
+	 * Limit to max packets to not inflict too big latencies,
+	 * as kfree_skb() might be quite expensive.
+	 */
+	maxbacklog >>= 1;
+
 	flow = &q->flows[idx];
-	skb = dequeue_head(flow);
-	len = qdisc_pkt_len(skb);
+	for (i = 0; i < max;) {
+		skb = dequeue_head(flow);
+		len += qdisc_pkt_len(skb);
+		kfree_skb(skb);
+		i++;
+		if (len >= maxbacklog)
+			break;
+	}
+	sch->qstats.drops += i;
+	sch->qstats.backlog -= len;
 	q->backlogs[idx] -= len;
-	sch->q.qlen--;
-	qdisc_qstats_drop(sch);
-	qdisc_qstats_backlog_dec(sch, skb);
-	kfree_skb(skb);
-	flow->dropped++;
+	sch->q.qlen -= i;
+	flow->dropped += i;
 	return idx;
 }
 
@@ -170,14 +181,14 @@ static unsigned int fq_codel_qdisc_drop(struct Qdisc *sch)
 	unsigned int prev_backlog;
 
 	prev_backlog = sch->qstats.backlog;
-	fq_codel_drop(sch);
+	fq_codel_drop(sch, 1U);
 	return prev_backlog - sch->qstats.backlog;
 }
 
 static int fq_codel_enqueue(struct sk_buff *skb, struct Qdisc *sch)
 {
 	struct fq_codel_sched_data *q = qdisc_priv(sch);
-	unsigned int idx, prev_backlog;
+	unsigned int idx, prev_backlog, prev_qlen;
 	struct fq_codel_flow *flow;
 	int uninitialized_var(ret);
 
@@ -206,16 +217,15 @@ static int fq_codel_enqueue(struct sk_buff *skb, struct Qdisc *sch)
 		return NET_XMIT_SUCCESS;
 
 	prev_backlog = sch->qstats.backlog;
-	q->drop_overlimit++;
-	/* Return Congestion Notification only if we dropped a packet
-	 * from this flow.
-	 */
-	if (fq_codel_drop(sch) == idx)
-		return NET_XMIT_CN;
+	prev_qlen = sch->q.qlen;
+	ret = fq_codel_drop(sch, 64U);
+	q->drop_overlimit += prev_qlen - sch->q.qlen;
+
+	/* As we dropped packet(s), better let upper stack know this */
+	qdisc_tree_reduce_backlog(sch, prev_qlen - sch->q.qlen,
+				  prev_backlog - sch->qstats.backlog);
 
-	/* As we dropped a packet, better let upper stack know this */
-	qdisc_tree_reduce_backlog(sch, 1, prev_backlog - sch->qstats.backlog);
-	return NET_XMIT_SUCCESS;
+	return ret == idx ? NET_XMIT_CN : NET_XMIT_SUCCESS;
 }
 
 /* This is the specific function called from codel_dequeue()



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
