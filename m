Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE8FC55167
	for <ath10k@archiver.kernel.org>; Fri, 31 Jul 2026 02:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZQoI3G7BPgfzmJi/xWF6ywnQxpARjLNuk85Wk6DNVbw=; b=RAaGXFOgFOeAy84xa6Y9uoAcyw
	dcy3cJfyVQkSF8bSXNzK3MsqJKWJyBs1S+/ImdB9+P7jxLfNx5jcIavUWCsbf1eJ4GPdPiaWdms7T
	qdLRnp8aQU0tIOqwEuG3Fm3pe2ShithraDkbjfAN46hf6YaKJFUHLna23QAzsVT1X4x9YYQODropd
	XDm0nrft+0Do30etppejuimQeVSXbADg1LtkKacvfINX0A23hLpwEKHVF8LLt653aM+WS62kIPDJI
	CbYPrgkTaSngjjKkiNimaAMvY8C7O676vxYZLWYDyQ7Cg385B56R3hKkO/TMV/pysE026nPCmSxOJ
	2LhtwEdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpcuy-0000000BchR-3ykY;
	Fri, 31 Jul 2026 02:24:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpcuu-0000000Bcgp-46Ag
	for ath10k@lists.infradead.org;
	Fri, 31 Jul 2026 02:24:11 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V2LDCC2645629
	for <ath10k@lists.infradead.org>; Fri, 31 Jul 2026 02:24:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZQoI3G7BPgfzmJi/xWF6ywnQxpARjLNuk85Wk6DNVbw=; b=HPOOOKTUiEvSajhz
	QPOLI8zorirKYsJCA7bSgGwtPhyLUzG7y/dFQgSy8KZRHeiG/dWQENRKR/M2Y3Vj
	kO0Jx43n6jAHHHfsdzcQgjX86Iw69f/YkRB2ndeVbi0l69A2fWC2ELDcT2OI5MhZ
	WKMJRlyzOeDxN7kiLSNAtNIJXY64JMoBAv1V06Z6gGT4IkxiLIzgn6mXgOSCjUw+
	wGhdrIPN5vf4emTuDImRj0fcBgzCpQv9sXmeMKfFG6Em8xq0OxghJXgKIJIGNDi6
	va0/aYuTHrecCbDpDA7yFHaeaaTPWuRGYvMLxePUeIufx+0X0IZ9eOE1ujangbYz
	8KmsKg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frjuk808h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 31 Jul 2026 02:24:06 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb6dd278512so299639a12.3
        for <ath10k@lists.infradead.org>; Thu, 30 Jul 2026 19:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785464646; x=1786069446; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZQoI3G7BPgfzmJi/xWF6ywnQxpARjLNuk85Wk6DNVbw=;
        b=SLx3T0ipuve3F5EaiWHv5BGf0qltNlleoxfLzEFqlj3pn+hfvZCN2rcv/+Vts4mYol
         OLXjE8EQIO+RtLHrxUarmHd6vySlCqBJ2lnVis30N1jKaElUSkqOuLr7fLC11GUMk3To
         9rJmn13NdQxCcxbSTH9Fl9+GEK8jGCkF6p3lrcD1S7i9jUAbbLELm2oGxhmguRRqric0
         utANAM48KMzaZ3iyMjU2nEaroOAF6Fdsj4RSQYttPFDcGIw9OkaMbyp+i/N32ToWRjEr
         gB9cdXa9dUlE+rLDgtqDSCBuEEoHJBnyweXOGPklJ2DZklfLm31/7a9k3Yfxny45++qd
         +eNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785464646; x=1786069446;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZQoI3G7BPgfzmJi/xWF6ywnQxpARjLNuk85Wk6DNVbw=;
        b=RukrMruBKCtG8flQijxyyuVELftrvHzU1vgsbRsvA1QytmLrzPY3OrDxBgQp1CG6aa
         nOqZFmmIlIAN6H06/n7KfKqkckxO5QKPg0PpiznFEOXMG1SGiv+AMK3mpj5ZkgbFfQ1D
         YgRhNxUnXTqPMDoF0eXB7mVu1gfHJgkTm3KJdwIMIttoey/dAeq+ZuOZBa1RWmck3a5B
         bx91jZo9MKV8lt8Nt7WCwownyePa1KDJCaGLxLHXrhBV3jZ60V3Cc4MMK31PfiqEVOsR
         eTF9um+qrkc4Gl0AyfV7H18SVIx6omsRPyfB5gkTkGtmEkBhlnA9DhBE/LN1KuTfuu8p
         486w==
X-Forwarded-Encrypted: i=1; AHgh+RpBpftLVkBqHkCendSPxSzbEW5OyjQzzedghTUUeAUy5nV2O4R5SbdwkfHVSoiNPQJKPlRiMKo=@lists.infradead.org
X-Gm-Message-State: AOJu0YyNs+xxomdndEpClpfNJjBZKSnzBv+Ep3c60Fw8Z0nhscCNvMax
	OHq/CFlJZWYRJ36X74LTffNgHEbT7pCOFJZIiBi49QmG1NsaJrTu+vkk1TStMNa+smsxu+Ol69Q
	BZGxokIcPHItkohzyZtC3UwB/Hz+1WPevY5Fl7HdIiVl+VyHe0zavcAPrzOFYg5Vc
X-Gm-Gg: AR+sD11XCubAFoAcUTbxekcOKS4egRbDXW+n3NQpBIoBUD+qM/1MBIv8RBK/J4A2wGQ
	wu90pjt62Ch1TzIJYsfqFd+n3MvBjLduJWH+x+7Q0bXolpaL0u5MHEoM2ox3LNKqis2nUMA0AdY
	XR/jBYZN+W5ENNHd80n0SiiIRt855aY8iygXcAGv7Pl4ZN8ZyXYcYiHqakzsjnJ7iQIO/CMWtum
	4XWcerJYmwpRYWcO9SP+hTE5JVXOZFPMdh+/f6fOZ5rz4RFH8ITLvdsXzc6LdG+zZfvGPaWJNAV
	vwrMT66nJ0p6uNub7iIES8+NOO0K//kFPi93M3KgV88XJ516+zz9JyXI87bYTB23I3dMjGFx97l
	JU6wq6sUnAwhP5ui3efZ0cLmg/+7PhDsUB8JLSUj3E3gBo3N8magVYxnT90s=
X-Received: by 2002:a05:6a20:548c:b0:3c3:954d:279a with SMTP id adf61e73a8af0-3c91b1f34c5mr45046637.33.1785464645775;
        Thu, 30 Jul 2026 19:24:05 -0700 (PDT)
X-Received: by 2002:a05:6a20:548c:b0:3c3:954d:279a with SMTP id adf61e73a8af0-3c91b1f34c5mr45011637.33.1785464645243;
        Thu, 30 Jul 2026 19:24:05 -0700 (PDT)
Received: from [192.168.1.9] (103.sub-97-215-187.myvzw.com. [97.215.187.103])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153aee6790sm595372eec.28.2026.07.30.19.24.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 19:24:04 -0700 (PDT)
Message-ID: <0b9f80bf-73e8-4e9d-9726-b8816c9a364b@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 19:24:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2] wifi: ath10k: make in-order rx amsdu buffers
 persistent
To: david@ixit.cz, Jeff Johnson <jjohnson@kernel.org>,
        Johannes Berg <johannes.berg@intel.com>,
        Kalle Valo
 <kvalo@qca.qualcomm.com>,
        Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, Richard Acayan <mailingradian@gmail.com>
References: <20260719-ath10k-a-msdu-v2-1-f479bb9d1217@ixit.cz>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260719-ath10k-a-msdu-v2-1-f479bb9d1217@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDAxMSBTYWx0ZWRfX9GsWblq82uWM
 4cLE0taipqbKDL/ZHhOlQRa6uPUPkq1LgNa38E48n1LUELx0R/kvRerxF1r2D7k5QksaQe2avBS
 MdZ4UGdi160ntnkumBCR8+s89ILsM+E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDAxMSBTYWx0ZWRfX2fcPphDrmYj8
 tLS4rFQSUMy7QZqFvyovd13tTbBb3G6JmQ96QQr8EllqPXmcMxeXLPdKIXYrUa+EXFLBPZp/YIF
 rwU+dsweOGXczhB+z0Oe2DQT+zwxHtvpebkRHkLSwt6f09t4VQ2gLtvgYpqbfmFctHHjPuN56re
 YJgNcaiPFyaIUU7wZ4c5KZfViZxj8KHGJX6cETwamvinKVG1rcNVUlJwfjOHomWejb4Psoco6rU
 3gTXXJtWIK8JW6U7k+B0+V6e7RDAk65a4U8y2NR2BB9xNmBbxyp+QhcJyBAfPwJUcWT0RsriARI
 KVVGiFCUqlkbojK6lx3+RpD1I+UVymmcafbi74o7orRfIMs8F6uO8EQozGnW6IbQ+WOAb5owGUG
 r7IGI9TsMHsaAgXoUqrV8ZMwRHG5CHrQPdZP7IsI5GNA7kD+J0Kdbxq41J2bZLxZ+r/FfDAHReA
 PXkj7mLBoiVvPNJrk0A==
X-Proofpoint-GUID: 2idqsOnbI_tKtbR3w6ZFkVLOxFHr2Znv
X-Proofpoint-ORIG-GUID: 2idqsOnbI_tKtbR3w6ZFkVLOxFHr2Znv
X-Authority-Analysis: v=2.4 cv=bbRbluPB c=1 sm=1 tr=0 ts=6a6c0746 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=UaEkX0D7FlC0tWE/LoNF7Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=7m40zdTuHQOX8Ya2pEUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_01,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 suspectscore=0 clxscore=1015
 spamscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310011
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_192409_139201_389266B0 
X-CRM114-Status: GOOD (  35.80  )
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

On 7/19/2026 2:45 PM, David Heidelberg via B4 Relay wrote:
> From: Richard Acayan <mailingradian@gmail.com>
> 
> The WCN3990 might split MSDUs among multiple "in-order" indications. The
> driver needs information from previous indications to handle MPDUs that
> are not started by the same indications that complete them. Move the
> list that tracks unprocessed MSDUs to the driver state so the driver can
> handle MPDUs that are split in this way and be less confused.
> 
> Fixes: c545070e404b ("ath10k: implement rx reorder support")
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> Co-developed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> This one we have in-tree forever.

I'm transcribing a few comments from my review agent (which may overlap
Sashiko). I have not vetted them for correctness. Hopefully I placed them at
the correct spots!

> 
> Changes in v2:
> - checkpatch & style. (Jeff)
> - Improve comments.
> - Link to v1: https://lore.kernel.org/linux-wireless/20260210021249.12132-2-mailingradian@gmail.com/
> ---
>  drivers/net/wireless/ath/ath10k/htt.h    |  4 +++
>  drivers/net/wireless/ath/ath10k/htt_rx.c | 50 +++++++++++++++++++++++++-------
>  2 files changed, 43 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/htt.h b/drivers/net/wireless/ath/ath10k/htt.h
> index 25c6b2e2f81c8..07c3dc088f07b 100644
> --- a/drivers/net/wireless/ath/ath10k/htt.h
> +++ b/drivers/net/wireless/ath/ath10k/htt.h
> @@ -1924,16 +1924,20 @@ struct ath10k_htt {
>  
>  	bool tx_mem_allocated;
>  	const struct ath10k_htt_tx_ops *tx_ops;
>  	const struct ath10k_htt_rx_ops *rx_ops;
>  	bool disable_tx_comp;
>  	bool bundle_tx;
>  	struct sk_buff_head tx_req_head;
>  	struct sk_buff_head tx_complete_head;
> +
> +	u8 rx_in_ord_split_tid;
> +	u16 rx_in_ord_split_peer_id;
> +	struct sk_buff_head rx_in_ord_split;
>  };
>  
>  struct ath10k_htt_tx_ops {
>  	int (*htt_send_rx_ring_cfg)(struct ath10k_htt *htt);
>  	int (*htt_send_frag_desc_bank_cfg)(struct ath10k_htt *htt);
>  	int (*htt_alloc_frag_desc)(struct ath10k_htt *htt);
>  	void (*htt_free_frag_desc)(struct ath10k_htt *htt);
>  	int (*htt_tx)(struct ath10k_htt *htt, enum ath10k_hw_txrx_mode txmode,
> diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
> index ab2d373b4750d..732bd3a2f9992 100644
> --- a/drivers/net/wireless/ath/ath10k/htt_rx.c
> +++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
> @@ -291,16 +291,18 @@ void ath10k_htt_rx_free(struct ath10k_htt *htt)
>  		return;
>  
>  	timer_delete_sync(&htt->rx_ring.refill_retry_timer);
>  
>  	skb_queue_purge(&htt->rx_msdus_q);
>  	skb_queue_purge(&htt->rx_in_ord_compl_q);
>  	skb_queue_purge(&htt->tx_fetch_ind_q);
>  
> +	skb_queue_purge(&htt->rx_in_ord_split);
> +
>  	spin_lock_bh(&htt->rx_ring.lock);
>  	ath10k_htt_rx_ring_free(htt);
>  	spin_unlock_bh(&htt->rx_ring.lock);
>  
>  	dma_free_coherent(htt->ar->dev,
>  			  ath10k_htt_get_rx_ring_size(htt),
>  			  ath10k_htt_get_vaddr_ring(htt),
>  			  htt->rx_ring.base_paddr);
> @@ -841,16 +843,18 @@ int ath10k_htt_rx_alloc(struct ath10k_htt *htt)
>  	htt->rx_ring.sw_rd_idx.msdu_payld = 0;
>  	hash_init(htt->rx_ring.skb_table);
>  
>  	skb_queue_head_init(&htt->rx_msdus_q);
>  	skb_queue_head_init(&htt->rx_in_ord_compl_q);
>  	skb_queue_head_init(&htt->tx_fetch_ind_q);
>  	atomic_set(&htt->num_mpdus_ready, 0);
>  
> +	skb_queue_head_init(&htt->rx_in_ord_split);
> +
>  	ath10k_dbg(ar, ATH10K_DBG_BOOT, "htt rx ring size %d fill_level %d\n",
>  		   htt->rx_ring.size, htt->rx_ring.fill_level);
>  	return 0;
>  
>  err_dma_idx:
>  	dma_free_coherent(htt->ar->dev,
>  			  ath10k_htt_get_rx_ring_size(htt),
>  			  vaddr_ring,
> @@ -3156,16 +3160,20 @@ static int ath10k_htt_rx_extract_amsdu(struct ath10k_hw_params *hw,
>  	struct rx_msdu_end_common *rxd_msdu_end_common;
>  
>  	if (skb_queue_empty(list))
>  		return -ENOBUFS;
>  
>  	if (WARN_ON(!skb_queue_empty(amsdu)))
>  		return -EINVAL;
>  
> +	msdu = skb_peek(list);
> +	rxd = HTT_RX_BUF_TO_RX_DESC(hw,
> +				    (void *)msdu->data - hw->rx_desc_ops->rx_desc_size);

Dead rxd computation before the loop — VALID, MINOR

Lines 3168–3170 compute rxd via skb_peek(), but the while loop at 3172
immediately dequeues the same SKB and unconditionally recomputes rxd at lines
3175–3177. The pre-loop assignment is never read. It's dead code. The original
patch must have introduced this when restructuring (the pre-existing code
likely used rxd from before the loop). It should be removed.

> +
>  	while ((msdu = __skb_dequeue(list))) {
>  		__skb_queue_tail(amsdu, msdu);
>  
>  		rxd = HTT_RX_BUF_TO_RX_DESC(hw,
>  					    (void *)msdu->data -
>  					    hw->rx_desc_ops->rx_desc_size);
>  
>  		rxd_msdu_end_common = ath10k_htt_rx_desc_get_msdu_end(hw, rxd);
> @@ -3257,17 +3265,16 @@ static void ath10k_htt_rx_h_rx_offload(struct ath10k *ar,
>  	}
>  }
>  
>  static int ath10k_htt_rx_in_ord_ind(struct ath10k *ar, struct sk_buff *skb)
>  {
>  	struct ath10k_htt *htt = &ar->htt;
>  	struct htt_resp *resp = (void *)skb->data;
>  	struct ieee80211_rx_status *status = &htt->rx_status;
> -	struct sk_buff_head list;
>  	struct sk_buff_head amsdu;
>  	u16 peer_id;
>  	u16 msdu_count;
>  	u8 vdev_id;
>  	u8 tid;
>  	bool offload;
>  	bool frag;
>  	int ret;
> @@ -3292,64 +3299,85 @@ static int ath10k_htt_rx_in_ord_ind(struct ath10k *ar, struct sk_buff *skb)
>  		   "htt rx in ord vdev %i peer %i tid %i offload %i frag %i msdu count %i\n",
>  		   vdev_id, peer_id, tid, offload, frag, msdu_count);
>  
>  	if (skb->len < msdu_count * sizeof(*resp->rx_in_ord_ind.msdu_descs32)) {
>  		ath10k_warn(ar, "dropping invalid in order rx indication\n");
>  		return -EINVAL;
>  	}
>  
> -	/* The event can deliver more than 1 A-MSDU. Each A-MSDU is later
> -	 * extracted and processed.
> +	if (!skb_queue_empty(&htt->rx_in_ord_split)) {
> +		/*
> +		 * It might still be possible to handle this case if there is
> +		 * only one peer that splits at each given moment. We are
> +		 * bailing out because we should have a test case for this
> +		 * before trying to fix it.
> +		 */
> +		if (tid != htt->rx_in_ord_split_tid ||
> +		    peer_id != htt->rx_in_ord_split_peer_id ||
> +		    offload) {

Dead offload disjunct — VALID, MINOR

ath10k_htt_rx_h_rx_offload() at line 3346 drains rx_in_ord_split entirely (via
__skb_dequeue loop). After it runs, the while (!skb_queue_empty(...)) loop at
3348 never executes. Therefore a split (-EAGAIN from
ath10k_htt_rx_extract_amsdu) can never occur for offload frames. The ||
offload condition at line 3316 in the split-validation guard is unreachable.
It should be removed for clarity.


> +			ath10k_warn(ar, "split amsdu did not resume immediately\n");
> +			htt->rx_confused = true;
> +			ath10k_core_start_recovery(ar);
> +			return -EIO;
> +		}
> +	}
> +
> +	/*
> +	 * The event can deliver more than 1 A-MSDU or continue a previous one.
> +	 * Each A-MSDU is later extracted and processed.
>  	 */
> -	__skb_queue_head_init(&list);
>  	if (ar->hw_params.target_64bit)
>  		ret = ath10k_htt_rx_pop_paddr64_list(htt, &resp->rx_in_ord_ind,
> -						     &list);
> +						     &htt->rx_in_ord_split);
>  	else
>  		ret = ath10k_htt_rx_pop_paddr32_list(htt, &resp->rx_in_ord_ind,
> -						     &list);
> +						     &htt->rx_in_ord_split);
>  
>  	if (ret < 0) {
>  		ath10k_warn(ar, "failed to pop paddr list: %d\n", ret);
>  		htt->rx_confused = true;
>  		ath10k_core_start_recovery(ar);
>  		return -EIO;

rx_in_ord_split not purged on pop_paddr error — VALID BUG

Lines 3335–3339: on pop_paddr error, htt->rx_confused = true and
ath10k_core_start_recovery() are called, but
__skb_queue_purge(&htt->rx_in_ord_split) is missing. If a split is already in
progress (queue is non-empty) when pop_paddr fails on the continuation event,
the existing SKBs are stranded. The default: path at lines 3371–3377 does
purge the queue, making this an inconsistency. This will leak DMA-mapped SKBs.

>  	}
>  
>  	/* Offloaded frames are very different and need to be handled
>  	 * separately.
>  	 */
>  	if (offload)
> -		ath10k_htt_rx_h_rx_offload(ar, &list);
> +		ath10k_htt_rx_h_rx_offload(ar, &htt->rx_in_ord_split);
>  
> -	while (!skb_queue_empty(&list)) {
> +	while (!skb_queue_empty(&htt->rx_in_ord_split)) {
>  		__skb_queue_head_init(&amsdu);
> -		ret = ath10k_htt_rx_extract_amsdu(&ar->hw_params, &list, &amsdu);
> +		ret = ath10k_htt_rx_extract_amsdu(&ar->hw_params,
> +						  &htt->rx_in_ord_split, &amsdu);
>  		switch (ret) {
>  		case 0:
>  			/* Note: The in-order indication may report interleaved
>  			 * frames from different PPDUs meaning reported rx rate
>  			 * to mac80211 isn't accurate/reliable. It's still
>  			 * better to report something than nothing though. This
>  			 * should still give an idea about rx rate to the user.
>  			 */
>  			ath10k_htt_rx_h_ppdu(ar, &amsdu, status, vdev_id);
>  			ath10k_htt_rx_h_filter(ar, &amsdu, status, NULL);
>  			ath10k_htt_rx_h_mpdu(ar, &amsdu, status, false, NULL,
>  					     NULL, peer_id, frag);
>  			ath10k_htt_rx_h_enqueue(ar, &amsdu, status);
>  			break;
>  		case -EAGAIN:
> -			fallthrough;
> +			htt->rx_in_ord_split_tid = tid;
> +			htt->rx_in_ord_split_peer_id = peer_id;
> +
> +			return -EIO;

frag flag not saved across -EAGAIN — VALID BUG

frag is a local extracted from the current event's header (line 3296). On
-EAGAIN (line 3366–3370), only tid and peer_id are saved. When the
continuation event arrives, ath10k_htt_rx_h_mpdu() at line 3362 is called with
the frag from the new event, not the original split event. If the original
said frag=1, the fragments will be misprocessed by mac80211 on continuation.
This needs rx_in_ord_split_frag added alongside _tid and _peer_id.

>  		default:
>  			/* Should not happen. */
>  			ath10k_warn(ar, "failed to extract amsdu: %d\n", ret);
>  			htt->rx_confused = true;
> -			__skb_queue_purge(&list);
> +			__skb_queue_purge(&htt->rx_in_ord_split);
>  			ath10k_core_start_recovery(ar);
>  			return -EIO;
>  		}
>  	}
>  	return ret;
>  }
>  
>  static void ath10k_htt_rx_tx_fetch_resp_id_confirm(struct ath10k *ar,
> 
> ---
> base-commit: 0718283ab28bc3907e10b61a6b4be6fefa1cbb2f
> change-id: 20260719-ath10k-a-msdu-c49334eb091d
> 
> Best regards,


