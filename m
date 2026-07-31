Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07FFEC54F54
	for <ath10k@archiver.kernel.org>; Fri, 31 Jul 2026 14:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AN1hgiiAoYSEc22S0IPUHYzAb+H+vIEA+bbNrXR6jng=; b=CLq79nPcuzheOdVITHxxY/LFoB
	ktuPSKXJytFnDt6r0PwZTrhDnVsEhyguBYtD0+ZaDu2McSbT8Mm67i03Af3HkCfdsNRamMXJcJ/Kz
	qkjRfdf1NRJ45umbLxOE07PnpniC8nW9wPzdOjEklBusmRQEKqSTySD77mFk1B7T8okRcoCH9b48M
	5D1uSDcY+1O4K+k1frgZjKxQ+j6OmP8YXPktryrkc4Sfnxg7t/PISdk3CloSQFXcXwbaaooPHilUT
	zHZXX51JnTBYG308tnp8S4/3FwEC9A10o7ydG2kVQzOqMrtipQCos6HfMPre1D5VAnmGmXkbkomxG
	5ii/7i1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoOU-0000000Ckxj-2SZ0;
	Fri, 31 Jul 2026 14:39:26 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoOR-0000000Ckwr-1BWD
	for ath10k@lists.infradead.org;
	Fri, 31 Jul 2026 14:39:24 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-697bd21fdc2so1864268a12.1
        for <ath10k@lists.infradead.org>; Fri, 31 Jul 2026 07:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785508761; x=1786113561; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AN1hgiiAoYSEc22S0IPUHYzAb+H+vIEA+bbNrXR6jng=;
        b=FHC6jy9pKdB2yhzsaj+JI/zLKUZ454UUW8UobPcYHlNtWYyXxMRb5+ADkAgx2apfRI
         Iur8u00UI3rkTvKbpYfqQgXWgGQd9bdmlzHreA9Ghb+fMXxT4gkoDJvt3HVi2NiYwk1r
         CHb8avOG1yxl2ZB+egajZl8Aml4WMiaXytjJ0yhQpqpk9xqYIZq8+lWNvInqM9ihxQ27
         /JlD7EUaYxM9qYSikTpYlHL7JcPBkpgILrrUHrPDCNzcu/npLe3PQFkUziMoTeG4ghbH
         r5a4ny7ve1tG/3RJxw4EmGa+PfixIiKdsROlQhHVecTHVXHLsC27REXHwzOvAEZ94QHE
         gRaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785508761; x=1786113561;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AN1hgiiAoYSEc22S0IPUHYzAb+H+vIEA+bbNrXR6jng=;
        b=MBPhwH3ma5Y/N4pwKuzr8a7uunyuNS4E1GsY3xCLgb1u3XBsxGSZSr11FZG7eo7V/9
         Gv+aNf6T3USWrhTMsyXDtTYx1WKsVCh8BPrX5xSCrglaOKqkVhGHeOTloDvKQtt+Mg+d
         Gslv3EEey9sjojP9wLlKQW+opoa4AvuBztMB0/rKnWr3uN9u3QltMtJykMrxFnuHnQvf
         4F0gh2xRUYgmKtTHRFi5AOkrqVWoEwIfIfeENOL9hr+N3b+SqT+lHZgcfGCCY//SkY+0
         4tqHgHGbXm0I5QRJNH8PMJLfJ1y9K90WXLpKBPYMokMQaa985mgWIsTo+4iPzqT1muBh
         GDKw==
X-Forwarded-Encrypted: i=1; AHgh+RrmEteV5PxSdzkidf59cz25mjwQ2artis0hAA3UPty+V/xj3F7KUcO8ab4tphO8/jP04spmY7Y=@lists.infradead.org
X-Gm-Message-State: AOJu0YxS0dTUE9KBabqsRy3JmLNfdVDqLuZ8oMgzMDxCjiKDKOeA2D90
	Ib9lyR23jLOJoFpZalHf3MiTnH/NAVOkkKxUlX1FI7ynyIaUoHRwH5uj
X-Gm-Gg: AR+sD13W2H8cAlcZPWLFg1Q1Vv4eXIbdf8BhnghAv69sniNxOR1X5+PAHRPspyVJUXU
	HcpLGesK4f4VHuW1EK7ZvcfpO9AMZhUoCLg2L+CABM4vhfX5pjb2Bl4H4OOp2vG58Xl+vYL+/fr
	oxmjGliD5Nc+/BJW6SAW0W4mMduBr64EiLTMPOm4GPO8g2kpNFzy3qiERFqgDBz1dWXvwV63eWX
	9MiYqUKKps7azX7uWzfHpSJOe8680Oi+OhhMJSWHbBjgiHZGOsxSjLYXPjIekk64ajr/eF9Ms7X
	aSHvvd9SzSpg/QwgCnfwpSr5J9NjGOK7cCGwqeWYEuaneru8o7yIhz+sIgidvEU98Z9LkaPDA4y
	tMtvQCWpo7EpyjMhurolgAtlXrodLQ7ZX1WIA6zpZxaMh5W9V5GWZV9Z4TRdtai0HEIshLjTOBc
	+HEx3oR5tULwbP5XfvMny7FhMlWXMoO5F7sQaHb1Ipsw2KDXqkCWNvRkLC3CmW3Q==
X-Received: by 2002:a17:906:4784:b0:c16:12ff:dc8b with SMTP id a640c23a62f3a-c1fd26df3c9mr145773966b.54.1785508745515;
        Fri, 31 Jul 2026 07:39:05 -0700 (PDT)
Received: from localhost ([188.65.190.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd3cc3b64sm163629266b.27.2026.07.31.07.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 07:39:05 -0700 (PDT)
Date: Fri, 31 Jul 2026 16:39:01 +0200
From: Richard Acayan <mailingradian@gmail.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: david@ixit.cz, Jeff Johnson <jjohnson@kernel.org>,
	Johannes Berg <johannes.berg@intel.com>,
	Kalle Valo <kvalo@qca.qualcomm.com>,
	Michal Kazior <michal.kazior@tieto.com>,
	linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH RFC v2] wifi: ath10k: make in-order rx amsdu buffers
 persistent
Message-ID: <amyzhVgSeYO6MptG@rdacayan>
References: <20260719-ath10k-a-msdu-v2-1-f479bb9d1217@ixit.cz>
 <0b9f80bf-73e8-4e9d-9726-b8816c9a364b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0b9f80bf-73e8-4e9d-9726-b8816c9a364b@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_073923_350291_2A9E21E3 
X-CRM114-Status: GOOD (  27.09  )
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On Thu, Jul 30, 2026 at 07:24:00PM -0700, Jeff Johnson wrote:
> On 7/19/2026 2:45 PM, David Heidelberg via B4 Relay wrote:
> > From: Richard Acayan <mailingradian@gmail.com>
> > 
> > The WCN3990 might split MSDUs among multiple "in-order" indications. The
> > driver needs information from previous indications to handle MPDUs that
> > are not started by the same indications that complete them. Move the
> > list that tracks unprocessed MSDUs to the driver state so the driver can
> > handle MPDUs that are split in this way and be less confused.
> > 
> > Fixes: c545070e404b ("ath10k: implement rx reorder support")
> > Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> > Co-developed-by: David Heidelberg <david@ixit.cz>
> > Signed-off-by: David Heidelberg <david@ixit.cz>
> > ---
> > This one we have in-tree forever.
> 
> I'm transcribing a few comments from my review agent (which may overlap
> Sashiko). I have not vetted them for correctness. Hopefully I placed them at
> the correct spots!
> 
> > 
> > Changes in v2:
> > - checkpatch & style. (Jeff)
> > - Improve comments.
> > - Link to v1: https://lore.kernel.org/linux-wireless/20260210021249.12132-2-mailingradian@gmail.com/
> > ---
> >  drivers/net/wireless/ath/ath10k/htt.h    |  4 +++
> >  drivers/net/wireless/ath/ath10k/htt_rx.c | 50 +++++++++++++++++++++++++-------
> >  2 files changed, 43 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/net/wireless/ath/ath10k/htt.h b/drivers/net/wireless/ath/ath10k/htt.h
> > index 25c6b2e2f81c8..07c3dc088f07b 100644
> > --- a/drivers/net/wireless/ath/ath10k/htt.h
> > +++ b/drivers/net/wireless/ath/ath10k/htt.h
> > @@ -1924,16 +1924,20 @@ struct ath10k_htt {
> >  
> >  	bool tx_mem_allocated;
> >  	const struct ath10k_htt_tx_ops *tx_ops;
> >  	const struct ath10k_htt_rx_ops *rx_ops;
> >  	bool disable_tx_comp;
> >  	bool bundle_tx;
> >  	struct sk_buff_head tx_req_head;
> >  	struct sk_buff_head tx_complete_head;
> > +
> > +	u8 rx_in_ord_split_tid;
> > +	u16 rx_in_ord_split_peer_id;
> > +	struct sk_buff_head rx_in_ord_split;
> >  };
> >  
> >  struct ath10k_htt_tx_ops {
> >  	int (*htt_send_rx_ring_cfg)(struct ath10k_htt *htt);
> >  	int (*htt_send_frag_desc_bank_cfg)(struct ath10k_htt *htt);
> >  	int (*htt_alloc_frag_desc)(struct ath10k_htt *htt);
> >  	void (*htt_free_frag_desc)(struct ath10k_htt *htt);
> >  	int (*htt_tx)(struct ath10k_htt *htt, enum ath10k_hw_txrx_mode txmode,
> > diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
> > index ab2d373b4750d..732bd3a2f9992 100644
> > --- a/drivers/net/wireless/ath/ath10k/htt_rx.c
> > +++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
> > @@ -291,16 +291,18 @@ void ath10k_htt_rx_free(struct ath10k_htt *htt)
> >  		return;
> >  
> >  	timer_delete_sync(&htt->rx_ring.refill_retry_timer);
> >  
> >  	skb_queue_purge(&htt->rx_msdus_q);
> >  	skb_queue_purge(&htt->rx_in_ord_compl_q);
> >  	skb_queue_purge(&htt->tx_fetch_ind_q);
> >  
> > +	skb_queue_purge(&htt->rx_in_ord_split);
> > +
> >  	spin_lock_bh(&htt->rx_ring.lock);
> >  	ath10k_htt_rx_ring_free(htt);
> >  	spin_unlock_bh(&htt->rx_ring.lock);
> >  
> >  	dma_free_coherent(htt->ar->dev,
> >  			  ath10k_htt_get_rx_ring_size(htt),
> >  			  ath10k_htt_get_vaddr_ring(htt),
> >  			  htt->rx_ring.base_paddr);
> > @@ -841,16 +843,18 @@ int ath10k_htt_rx_alloc(struct ath10k_htt *htt)
> >  	htt->rx_ring.sw_rd_idx.msdu_payld = 0;
> >  	hash_init(htt->rx_ring.skb_table);
> >  
> >  	skb_queue_head_init(&htt->rx_msdus_q);
> >  	skb_queue_head_init(&htt->rx_in_ord_compl_q);
> >  	skb_queue_head_init(&htt->tx_fetch_ind_q);
> >  	atomic_set(&htt->num_mpdus_ready, 0);
> >  
> > +	skb_queue_head_init(&htt->rx_in_ord_split);
> > +
> >  	ath10k_dbg(ar, ATH10K_DBG_BOOT, "htt rx ring size %d fill_level %d\n",
> >  		   htt->rx_ring.size, htt->rx_ring.fill_level);
> >  	return 0;
> >  
> >  err_dma_idx:
> >  	dma_free_coherent(htt->ar->dev,
> >  			  ath10k_htt_get_rx_ring_size(htt),
> >  			  vaddr_ring,
> > @@ -3156,16 +3160,20 @@ static int ath10k_htt_rx_extract_amsdu(struct ath10k_hw_params *hw,
> >  	struct rx_msdu_end_common *rxd_msdu_end_common;
> >  
> >  	if (skb_queue_empty(list))
> >  		return -ENOBUFS;
> >  
> >  	if (WARN_ON(!skb_queue_empty(amsdu)))
> >  		return -EINVAL;
> >  
> > +	msdu = skb_peek(list);
> > +	rxd = HTT_RX_BUF_TO_RX_DESC(hw,
> > +				    (void *)msdu->data - hw->rx_desc_ops->rx_desc_size);
> 
> Dead rxd computation before the loop — VALID, MINOR
> 
> Lines 3168–3170 compute rxd via skb_peek(), but the while loop at 3172
> immediately dequeues the same SKB and unconditionally recomputes rxd at lines
> 3175–3177. The pre-loop assignment is never read. It's dead code. The original
> patch must have introduced this when restructuring (the pre-existing code
> likely used rxd from before the loop). It should be removed.

This was removed on 20 January 2026 before v1 was submitted. It seems
this v2 is based on applying the commits to the pre-2026 patch.

