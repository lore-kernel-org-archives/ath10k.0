Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WkiVL-0001B0-Qx
 for ath10k@lists.infradead.org; Wed, 14 May 2014 23:22:32 +0000
Received: from [192.168.100.236] (firewall.candelatech.com [70.89.124.249])
 (using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id A8F9040A39A
 for <ath10k@lists.infradead.org>; Wed, 14 May 2014 16:22:08 -0700 (PDT)
Message-ID: <5373FAA0.8090801@candelatech.com>
Date: Wed, 14 May 2014 16:22:08 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Any ideas on how to fix rssi?
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

I'm seeing incorrect signal strength when running a rate-vs-range
test through an attenuator.  Maybe the FIXME below is the reason?

Any suggestions on what needs doing here?

Thanks,
Ben


static void ath10k_htt_rx_frag_handler(struct ath10k_htt *htt,
				struct htt_rx_fragment_indication *frag)
{
	struct sk_buff *msdu_head, *msdu_tail;
	enum htt_rx_mpdu_encrypt_type enctype;
	struct htt_rx_desc *rxd;
	enum rx_msdu_decap_format fmt;
	struct ieee80211_rx_status *rx_status = &htt->rx_status;
	struct ieee80211_hdr *hdr;
	int ret;
	bool tkip_mic_err;
	bool decrypt_err;
	u8 *fw_desc;
	int fw_desc_len, hdrlen, paramlen;
	int trim;

	fw_desc_len = __le16_to_cpu(frag->fw_rx_desc_bytes);
	fw_desc = (u8 *)frag->fw_msdu_rx_desc;

	msdu_head = NULL;
	msdu_tail = NULL;

	spin_lock_bh(&htt->rx_ring.lock);
	ret = ath10k_htt_rx_amsdu_pop(htt, &fw_desc, &fw_desc_len,
				      &msdu_head, &msdu_tail);
	spin_unlock_bh(&htt->rx_ring.lock);

	ath10k_dbg(ATH10K_DBG_HTT_DUMP, "htt rx frag ahead\n");

	if (ret) {
		ath10k_warn("failed to pop amsdu from httr rx ring for fragmented rx %d\n",
			    ret);
		ath10k_htt_rx_free_msdu_chain(msdu_head);
		return;
	}

	/* FIXME: implement signal strength */


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
