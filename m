Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x235.google.com ([2a00:1450:4010:c03::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XBSbW-0003IP-DK
 for ath10k@lists.infradead.org; Sun, 27 Jul 2014 17:51:27 +0000
Received: by mail-la0-f53.google.com with SMTP id gl10so4601104lab.40
 for <ath10k@lists.infradead.org>; Sun, 27 Jul 2014 10:51:02 -0700 (PDT)
MIME-Version: 1.0
Date: Sun, 27 Jul 2014 10:51:01 -0700
Message-ID: <CABnBrYV27yNECG6PPWp2Gsz5w3azbEzGc4n5TcfavvUBbN8U_g@mail.gmail.com>
Subject: [RFC] extract seqno from sta->last_seq_ctrl
From: Denton Gentry <denton.gentry@gmail.com>
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Cc: Michal Kazior <michal.kazior@tieto.com>

[Sending to ath10k list as I think ath10k is the only impacted driver right now]

I believe there is a minor problem in
[PATCH v2] mac80211: add support for Rx reordering offloading
http://www.spinics.net/lists/linux-wireless/msg124812.html

sta->last_seq_ctrl is the seq_ctrl field from the last seen packet. To
get the sequence number it needs to be byteswapped and shifted 4 bits;
patch below.

This mostly impacts Windows clients, because Windows sends 100-200
frames before sending ADDBA. This results in a starting seqno which is
quite large due to the 4 bit shift, and the ieee80211_sn_less() check
at the top of ieee80211_sta_manage_reorder_buf drops subsequent frames
until the sequence number catches up.


From d0647db58d13533e5441c07f95b23e912976c87b Mon Sep 17 00:00:00 2001
From: Denton Gentry <denton.gentry@gmail.com>
Date: Sun, 27 Jul 2014 08:24:36 -0700
Subject: [PATCH] extract seqno from sta->last_seq_ctrl

This depends on:
* [PATCH v2] mac80211: add support for Rx reordering offloading

sta->last_seq_ctrl is the seq_ctrl field from the last
header seen, need to byteswap and shift it 4 bits to
extract the sequence number.

 net/mac80211/iface.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/mac80211/iface.c b/net/mac80211/iface.c
index 77cd025..1903220 100644
--- a/net/mac80211/iface.c
+++ b/net/mac80211/iface.c
@@ -1171,7 +1171,7 @@ static void ieee80211_iface_work(struct work_struct *work)
                        mutex_lock(&local->sta_mtx);
                        sta = sta_info_get_bss(sdata, rx_agg->addr);
                        if (sta) {
-                               u16 last_seq = sta->last_seq_ctrl[rx_agg->tid];
+                               u16 last_seq =
le16_to_cpu(sta->last_seq_ctrl[rx_agg->tid]) >> 4;

                                __ieee80211_start_rx_ba_session(sta,
                                                0, 0,
-- 
2.0.0.526.g5318336

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
