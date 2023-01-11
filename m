Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 483F4C54EBE
	for <ath10k@archiver.kernel.org>; Wed, 11 Jan 2023 07:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hvRVpoWQ/rCf0vPnWIlAaHK1yaSUsIS6vdXiWNtMI+c=; b=kGBUlRFWB2+F35
	oD8U9BzG9Rfc0sYqvIqi7tnkS5tYhKr8+L3ARs0Uf4hLtHNwCxO3oK3901gUoxOowIVSNgL0+bKyO
	u86gQlRPuEPJftxxxmzLkKWgM2+1Hzsjcz+v4L4jpFErOWavVXk6H2dw1s5K/UagB804hZTF4N1vn
	00+ina8fkdUAdOLOw5RosD/dq1KW5EBXTyls219Uq87QtxXakPtpkXjNdrhkrUSzqJPrFu6P04F+G
	/Fm1B0gILk2RpsC/UuW/T4Kt7L+wvQ4JyrH2K7D4Ym0PNrCag8dphNW3/ISoEDF69u9IONAQkve3u
	vJ+d0NqNcnERydOhQskQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFV6X-009wWh-RZ; Wed, 11 Jan 2023 07:00:57 +0000
Received: from mail.as201155.net ([185.84.6.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFV6T-009wUs-Ou
	for ath10k@lists.infradead.org; Wed, 11 Jan 2023 07:00:56 +0000
Received: from smtps.newmedia-net.de ([2a05:a1c0:0:de::167]:43346 helo=webmail.newmedia-net.de)
	by mail.as201155.net with esmtps  (TLS1) tls TLS_DHE_RSA_WITH_AES_256_CBC_SHA
	(Exim 4.96)
	(envelope-from <s.gottschall@newmedia-net.de>)
	id 1pFV6J-0001jT-1S;
	Wed, 11 Jan 2023 08:00:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=newmedia-net.de; s=mikd;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID; bh=AVLCQVUbfoUNXVRhzUIRuDBYTKefpF2Oq65eiuhxedU=;
	b=bJbknLFVxVi9e+/mC41D3nNDSSLFs/MebbqzDCeAlPC9Kvc+uhmRzpoARCW4L/6AcvVaUPtTc4Ha5gGko0RuB952sxANXXplmkZMmEO/rwxZqYIDwVC+Gxd3+9lmQ7RCYo3CEeJ7+n6hwjNpAWp1gyWCM3RPd/BQP84J87GsoTE=;
Message-ID: <bb866144-1127-2310-503b-7895b7339ecb@newmedia-net.de>
Date: Wed, 11 Jan 2023 08:00:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101
 Thunderbird/109.0
Subject: Re: [RFC v2] wifi: ath10k: Implement duplicate detection for
 non-offloaded PCIe
To: Zhi-Jun You <hujy652@gmail.com>, linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org
References: <20221206073004.22608-1-hujy652@gmail.com>
From: Sebastian Gottschall <s.gottschall@newmedia-net.de>
In-Reply-To: <20221206073004.22608-1-hujy652@gmail.com>
X-Received: from [81.201.155.134] (helo=[172.21.254.3])
	by webmail.newmedia-net.de with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.72)
	(envelope-from <s.gottschall@newmedia-net.de>)
	id 1pFV6J-0009uj-5L; Wed, 11 Jan 2023 08:00:43 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_230054_299501_7C2801FB 
X-CRM114-Status: GOOD (  18.72  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
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
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

this patch causes severe performance issues on 988x

Am 06.12.2022 um 08:30 schrieb Zhi-Jun You:
> Chips like QCA9984, IPQ4019 doesn't do duplicate detection in firmware.
> Implement it in driver so it can skip a check in mac80211.
>
> Check only the first skb since all the skbs in amsdu share the same
> header.
>
> Tested-on: QCA9984 10.4-3.9.0.2-00159
> Signed-off-by: Zhi-Jun You <hujy652@gmail.com>
> ---
> V1 -> V2: fix typo in txrx.c
> I am not sure what's the formal name for chips like QCA9984 so I will
> call it non-offloaded PCIe for now.
> ---
>   drivers/net/wireless/ath/ath10k/core.h   |  1 +
>   drivers/net/wireless/ath/ath10k/htt_rx.c | 51 ++++++++++++++++++++++++
>   drivers/net/wireless/ath/ath10k/txrx.c   |  3 ++
>   3 files changed, 55 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
> index f5de8ce8fb45..6b4f5208f32f 100644
> --- a/drivers/net/wireless/ath/ath10k/core.h
> +++ b/drivers/net/wireless/ath/ath10k/core.h
> @@ -436,6 +436,7 @@ struct ath10k_peer {
>   		enum htt_security_types sec_type;
>   		int pn_len;
>   	} rx_pn[ATH10K_HTT_TXRX_PEER_SECURITY_MAX];
> +	u16 last_rx_seq_ctrl[IEEE80211_NUM_TIDS + 1];
>   };
>   
>   struct ath10k_txq {
> diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
> index 438b0caaceb7..e241eab4cce1 100644
> --- a/drivers/net/wireless/ath/ath10k/htt_rx.c
> +++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
> @@ -1344,6 +1344,56 @@ static char *ath10k_get_tid(struct ieee80211_hdr *hdr, char *out, size_t size)
>   	return out;
>   }
>   
> +static void ath10k_htt_rx_h_check_dup(struct ath10k *ar,
> +				      struct sk_buff_head *amsdu,
> +				      struct ieee80211_rx_status *status)
> +{
> +	struct ath10k_hw_params *hw = &ar->hw_params;
> +	struct sk_buff *first;
> +	struct ath10k_peer *peer;
> +	struct ieee80211_hdr *hdr;
> +	struct htt_rx_desc *rxd;
> +	struct rx_mpdu_start *rxd_mpdu_start;
> +	u16 peer_id;
> +	u8 tid;
> +
> +	if (skb_queue_empty(amsdu))
> +		return;
> +
> +	first = skb_peek(amsdu);
> +	rxd = HTT_RX_BUF_TO_RX_DESC(hw,
> +				    (void *)first->data - hw->rx_desc_ops->rx_desc_size);
> +
> +	rxd_mpdu_start = ath10k_htt_rx_desc_get_mpdu_start(hw, rxd);
> +	peer_id = MS(__le32_to_cpu(rxd_mpdu_start->info0),
> +		     RX_MPDU_START_INFO0_PEER_IDX);
> +
> +	spin_lock_bh(&ar->data_lock);
> +
> +	peer = ath10k_peer_find_by_id(ar, peer_id);
> +	if (!peer)
> +		goto out;
> +
> +	hdr = (void *)ath10k_htt_rx_desc_get_rx_hdr_status(hw, rxd);
> +	if (ieee80211_is_data_qos(hdr->frame_control))
> +		tid = ieee80211_get_tid(hdr);
> +	else
> +		tid = ATH10K_TXRX_NON_QOS_TID;
> +
> +	if (ieee80211_has_retry(hdr->frame_control) &&
> +	    peer->last_rx_seq_ctrl[tid] == __le16_to_cpu(hdr->seq_ctrl)) {
> +		__skb_queue_purge(amsdu);
> +		goto out;
> +	}
> +
> +	peer->last_rx_seq_ctrl[tid] = __le16_to_cpu(hdr->seq_ctrl);
> +
> +	status->flag |= RX_FLAG_DUP_VALIDATED;
> +
> +out:
> +	spin_unlock_bh(&ar->data_lock);
> +}
> +
>   static void ath10k_htt_rx_h_queue_msdu(struct ath10k *ar,
>   				       struct ieee80211_rx_status *rx_status,
>   				       struct sk_buff *skb)
> @@ -2356,6 +2406,7 @@ static int ath10k_htt_rx_handle_amsdu(struct ath10k_htt *htt)
>   		ath10k_htt_rx_h_unchain(ar, &amsdu, &drop_cnt, &unchain_cnt);
>   
>   	ath10k_htt_rx_h_filter(ar, &amsdu, rx_status, &drop_cnt_filter);
> +	ath10k_htt_rx_h_check_dup(ar, &amsdu, rx_status);
>   	ath10k_htt_rx_h_mpdu(ar, &amsdu, rx_status, true, first_hdr, &err, 0,
>   			     false);
>   	msdus_to_queue = skb_queue_len(&amsdu);
> diff --git a/drivers/net/wireless/ath/ath10k/txrx.c b/drivers/net/wireless/ath/ath10k/txrx.c
> index da3bc35e41aa..69422d2bd9bc 100644
> --- a/drivers/net/wireless/ath/ath10k/txrx.c
> +++ b/drivers/net/wireless/ath/ath10k/txrx.c
> @@ -219,6 +219,7 @@ void ath10k_peer_map_event(struct ath10k_htt *htt,
>   {
>   	struct ath10k *ar = htt->ar;
>   	struct ath10k_peer *peer;
> +	int i;
>   
>   	if (ev->peer_id >= ATH10K_MAX_NUM_PEER_IDS) {
>   		ath10k_warn(ar,
> @@ -237,6 +238,8 @@ void ath10k_peer_map_event(struct ath10k_htt *htt,
>   		peer->vdev_id = ev->vdev_id;
>   		ether_addr_copy(peer->addr, ev->addr);
>   		list_add(&peer->list, &ar->peers);
> +		for (i = 0; i <= IEEE80211_NUM_TIDS; i++)
> +			peer->last_rx_seq_ctrl[i] = USHRT_MAX;
>   		wake_up(&ar->peer_mapping_wq);
>   	}
>   

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
