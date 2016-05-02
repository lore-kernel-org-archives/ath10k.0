Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ax8a3-0000X7-Gg
 for ath10k@lists.infradead.org; Mon, 02 May 2016 07:47:48 +0000
Date: Mon, 2 May 2016 09:47:18 +0200
From: Jesper Dangaard Brouer <jbrouer@redhat.com>
Subject: Re: [Codel] fq_codel_drop vs a udp flood
Message-ID: <20160502094718.56d8e7b0@redhat.com>
In-Reply-To: <1462132553.5535.207.camel@edumazet-glaptop3.roam.corp.google.com>
References: <CAA93jw6QLyx9EaS+ntB0D3duoysu_Z-UYyQfHnRa=pfqPDfWOw@mail.gmail.com>
 <1462125592.5535.194.camel@edumazet-glaptop3.roam.corp.google.com>
 <865DA393-262D-40B6-A9D3-1B978CD5F6C6@gmail.com>
 <1462128385.5535.200.camel@edumazet-glaptop3.roam.corp.google.com>
 <1462132553.5535.207.camel@edumazet-glaptop3.roam.corp.google.com>
MIME-Version: 1.0
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
To: Eric Dumazet <eric.dumazet@gmail.com>
Cc: Jonathan Morton <chromatix99@gmail.com>, "codel@lists.bufferbloat.net" <codel@lists.bufferbloat.net>, ath10k <ath10k@lists.infradead.org>, make-wifi-fast@lists.bufferbloat.net

On Sun, 01 May 2016 12:55:53 -0700
Eric Dumazet <eric.dumazet@gmail.com> wrote:

> On Sun, 2016-05-01 at 11:46 -0700, Eric Dumazet wrote:
> 
> > Just drop half backlog packets instead of 1, (maybe add a cap of 64
> > packets to avoid too big burts of kfree_skb() which might add cpu
> > spikes) and problem is gone.
> >   
> 
> I used following patch and it indeed solved the issue in my tests.
> 
> (Not the DDOS case, but when few fat flows are really bad citizens)
> 
> diff --git a/net/sched/sch_fq_codel.c b/net/sched/sch_fq_codel.c
> index a5e420b3d4ab..0cb8699624bc 100644
> --- a/net/sched/sch_fq_codel.c
> +++ b/net/sched/sch_fq_codel.c
> @@ -135,11 +135,11 @@ static inline void flow_queue_add(struct fq_codel_flow *flow,
>  	skb->next = NULL;
>  }
>  
> -static unsigned int fq_codel_drop(struct Qdisc *sch)
> +static unsigned int fq_codel_drop(struct Qdisc *sch, unsigned int max)
>  {
>  	struct fq_codel_sched_data *q = qdisc_priv(sch);
>  	struct sk_buff *skb;
> -	unsigned int maxbacklog = 0, idx = 0, i, len;
> +	unsigned int maxbacklog = 0, idx = 0, i, len = 0;
>  	struct fq_codel_flow *flow;
>  
>  	/* Queue is full! Find the fat flow and drop packet from it.
> @@ -153,15 +153,26 @@ static unsigned int fq_codel_drop(struct Qdisc *sch)
>  			idx = i;
>  		}
>  	}
> +	/* As the search was painful, drop half bytes of this fat flow.
> +	 * Limit to max packets to not inflict too big latencies,
> +	 * as kfree_skb() might be quite expensive.
> +	 */
> +	maxbacklog >>= 1;
> +
>  	flow = &q->flows[idx];
> -	skb = dequeue_head(flow);
> -	len = qdisc_pkt_len(skb);
> +	for (i = 0; i < max;) {
> +		skb = dequeue_head(flow);
> +		len += qdisc_pkt_len(skb);
> +		kfree_skb(skb);
> +		i++;
> +		if (len >= maxbacklog)
> +			break;
> +	}

What about using bulk free of SKBs here?

There is a very high probability that we are hitting SLUB slowpath,
which involves a locked cmpxchg_double per packet.  Instead we can
amortize this cost via kmem_cache_free_bulk().

Maybe extend kfree_skb_list() to hide the slab/kmem_cache call?


> +	sch->qstats.drops += i;
> +	sch->qstats.backlog -= len;
>  	q->backlogs[idx] -= len;
> -	sch->q.qlen--;
> -	qdisc_qstats_drop(sch);
> -	qdisc_qstats_backlog_dec(sch, skb);
> -	kfree_skb(skb);
> -	flow->dropped++;
> +	sch->q.qlen -= i;
> +	flow->dropped += i;
>  	return idx;
>  }


-- 
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  Author of http://www.iptv-analyzer.org
  LinkedIn: http://www.linkedin.com/in/brouer

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
