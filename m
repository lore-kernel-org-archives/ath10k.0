Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZEVU0-00084j-Aq
 for ath10k@lists.infradead.org; Mon, 13 Jul 2015 04:36:48 +0000
Received: from [192.168.1.108] (c-67-168-92-223.hsd1.wa.comcast.net
 [67.168.92.223])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id 457A640A339
 for <ath10k@lists.infradead.org>; Sun, 12 Jul 2015 21:36:21 -0700 (PDT)
Message-ID: <55A34044.1060009@candelatech.com>
Date: Sun, 12 Jul 2015 21:36:20 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Making 10.1.467 based CT firmware do mgt-over-htt
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k <ath10k@lists.infradead.org>

I have been working on making my CT firmware able to do mgt frames
over the normal HTT transport instead of over wmi.  This should significantly
improve APs that are trying to deal with stations going out of range.

A fairly trivial change in the firmware lets ath10k in station mode associate in both
OPEN and WPA2 (I did not test further at this time).

But, on the AP side, this same change ends up with probe responses going
out with 10 bytes missing from the end of the frame.  If I simply do a skb_put(foo, 10)
before sending to firmware, then AP mode works (OPEN, against ath9k AP).

But, this skb_put() breaks the station (OS crashed and rebooted).

I can probably find a particular set of logic that puts or does not put
the 10 extra bytes accordingly, but I am curious if anyone knows any reason
that AP mode frames are different.  I did find some code
in firmware that basically subtracts 10 bytes from length:
len -= (sizeof(struct ieee80211_frame) - WAL_DE_ETHR_HDR_LEN))

This happens for all native wifi pkts though.  Is there some reason why a
probe response (and maybe other mgt frames?) would not be built for native
wifi?

use_frags in htt_tx.c will be TRUE in my case, because htt version is 2.2 in
my firmware.

My driver patch looks like this currently:


diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index c2c1f2d..d291121 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -570,6 +570,7 @@ struct ath10k {
         DECLARE_BITMAP(fw_features, ATH10K_FW_FEATURE_COUNT);

         bool p2p;
+       bool all_pkts_htt; /* target has no separate mgmt tx command? */

         struct {
                 enum ath10k_bus bus;
diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 815f7fc..a07ce92 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -1932,6 +1932,15 @@ void ath10k_htt_t2h_msg_handler(struct ath10k *ar, struct sk_buff *skb)
         case HTT_T2H_MSG_TYPE_VERSION_CONF: {
                 htt->target_version_major = resp->ver_resp.major;
                 htt->target_version_minor = resp->ver_resp.minor;
+
+               if ((htt->target_version_major >= 3) ||
+                   /* CT firmware with HTT-MGT */
+                   (htt->target_version_major == 2 &&
+                    htt->target_version_minor == 2))
+                       ar->all_pkts_htt = true;
+               else
+                       ar->all_pkts_htt = false;
+
                 complete(&htt->target_version_received);
                 break;
         }
diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index 2f3f7e0..850eb72 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -459,6 +459,10 @@ int ath10k_htt_tx(struct ath10k_htt *htt, struct sk_buff *msdu)
         }
         skb_cb->htt.txbuf_paddr = paddr;

+       if (ieee80211_is_mgmt(hdr->frame_control)) {
+               skb_put(msdu, 10);
+       }
+
         if ((ieee80211_is_action(hdr->frame_control) ||
              ieee80211_is_deauth(hdr->frame_control) ||
              ieee80211_is_disassoc(hdr->frame_control)) &&
@@ -546,7 +550,7 @@ int ath10k_htt_tx(struct ath10k_htt *htt, struct sk_buff *msdu)
                    "htt tx flags0 %hhu flags1 %hu len %d id %hu frags_paddr %08x, msdu_paddr %08x vdev %hhu tid %hhu freq %hu\n",
                    flags0, flags1, skb_len, msdu_id, frags_paddr,
                    (u32)skb_cb->paddr, vdev_id, tid, skb_cb->htt.freq);
-       ath10k_dbg_dump(ar, ATH10K_DBG_HTT_DUMP, NULL, "htt tx msdu: ",
+       ath10k_dbg_dump(ar, ATH10K_DBG_HTT /*_DUMP*/, NULL, "htt tx msdu: ",
                         msdu->data, skb_len);
         trace_ath10k_tx_hdr(ar, msdu->data, msdu->len);
         trace_ath10k_tx_payload(ar, msdu->data, msdu->len);
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index c4ad1dc..ee7be8b 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -2309,7 +2309,7 @@ static void ath10k_tx_htt(struct ath10k *ar, struct sk_buff *skb)
         struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
         int ret = 0;

-       if (ar->htt.target_version_major >= 3) {
+       if (ar->all_pkts_htt) {
                 /* Since HTT 3.0 there is no separate mgmt tx command */
                 ret = ath10k_htt_tx(&ar->htt, skb);
                 goto exit;


Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
