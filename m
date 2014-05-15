Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WkjDB-0004RK-Ja
 for ath10k@lists.infradead.org; Thu, 15 May 2014 00:07:50 +0000
Received: from [192.168.100.236] (firewall.candelatech.com [70.89.124.249])
 (using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id 6D93440A339
 for <ath10k@lists.infradead.org>; Wed, 14 May 2014 17:07:27 -0700 (PDT)
Message-ID: <5374053F.40804@candelatech.com>
Date: Wed, 14 May 2014 17:07:27 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Any ideas on how to fix rssi?
References: <5373FAA0.8090801@candelatech.com>
In-Reply-To: <5373FAA0.8090801@candelatech.com>
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
To: ath10k <ath10k@lists.infradead.org>

On 05/14/2014 04:22 PM, Ben Greear wrote:
> I'm seeing incorrect signal strength when running a rate-vs-range
> test through an attenuator.  Maybe the FIXME below is the reason?
> 
> Any suggestions on what needs doing here?

Actually, it wasn't (just?) this...the patch below makes the numbers look
good, but obviously there could be a better fix:

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index ccbc363..f26f296 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -1218,8 +1218,13 @@ static void ath10k_htt_rx_handler(struct ath10k_htt *htt,
        mpdu_ranges = htt_rx_ind_get_mpdu_ranges(rx);

        /* Fill this once, while this is per-ppdu */
-       rx_status->signal  = ATH10K_DEFAULT_NOISE_FLOOR;
-       rx_status->signal += rx->ppdu.combined_rssi;
+       if (rx->ppdu.combined_rssi) {
+               rx_status->signal  = ATH10K_DEFAULT_NOISE_FLOOR;
+               rx_status->signal += rx->ppdu.combined_rssi;
+       }
+       else {
+               rx_status->flag |= RX_FLAG_NO_SIGNAL_VAL;
+       }

        if (rx->ppdu.info0 & HTT_RX_INDICATION_INFO0_END_VALID) {
                /* TSF available only in 32-bit */
@@ -1342,7 +1347,8 @@ static void ath10k_htt_rx_frag_handler(struct ath10k_htt *htt,
        }

        /* FIXME: implement signal strength */
-
+       rx_status->flag |= RX_FLAG_NO_SIGNAL_VAL;
+
        hdr = (struct ieee80211_hdr *)msdu_head->data;
        rxd = (void *)msdu_head->data - sizeof(*rxd);
        tkip_mic_err = !!(__le32_to_cpu(rxd->attention.flags) &



> 
> Thanks,
> Ben
> 
> 
> static void ath10k_htt_rx_frag_handler(struct ath10k_htt *htt,
> 				struct htt_rx_fragment_indication *frag)
> {
> 	struct sk_buff *msdu_head, *msdu_tail;
> 	enum htt_rx_mpdu_encrypt_type enctype;
> 	struct htt_rx_desc *rxd;
> 	enum rx_msdu_decap_format fmt;
> 	struct ieee80211_rx_status *rx_status = &htt->rx_status;
> 	struct ieee80211_hdr *hdr;
> 	int ret;
> 	bool tkip_mic_err;
> 	bool decrypt_err;
> 	u8 *fw_desc;
> 	int fw_desc_len, hdrlen, paramlen;
> 	int trim;
> 
> 	fw_desc_len = __le16_to_cpu(frag->fw_rx_desc_bytes);
> 	fw_desc = (u8 *)frag->fw_msdu_rx_desc;
> 
> 	msdu_head = NULL;
> 	msdu_tail = NULL;
> 
> 	spin_lock_bh(&htt->rx_ring.lock);
> 	ret = ath10k_htt_rx_amsdu_pop(htt, &fw_desc, &fw_desc_len,
> 				      &msdu_head, &msdu_tail);
> 	spin_unlock_bh(&htt->rx_ring.lock);
> 
> 	ath10k_dbg(ATH10K_DBG_HTT_DUMP, "htt rx frag ahead\n");
> 
> 	if (ret) {
> 		ath10k_warn("failed to pop amsdu from httr rx ring for fragmented rx %d\n",
> 			    ret);
> 		ath10k_htt_rx_free_msdu_chain(msdu_head);
> 		return;
> 	}
> 
> 	/* FIXME: implement signal strength */
> 
> 


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
