Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80127CD11BF
	for <ath10k@archiver.kernel.org>; Tue, 19 Mar 2024 16:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=76FBrYkTVRQX+oieYkb18dKDyRyzsr5zGFP3yiN5Bko=; b=d1RaYYbUwjlH7MBMn5B9ADtIZv
	jExxsR10QMD29QGtOOXMks0kGl9nLeaLxIlcN7HlzmGRmazxmihF9KXw4JKQEEy/1asL/vXdH9VUJ
	YnUuIQ7oZ9GP/K9Ep1VShsH+1frhIApW05qb4szh4DRTfxG++RRRgmeklWTjr1H/upMTdarpzJmDj
	r9mKnyirLwoU/aY+7lgUtleANyckJNU4W5tu7YLgT5yv4PrnoVu110Ie+bzNKiMx0cXXDv6H6ASAm
	TIJV4mFK8SppK8diKbsURV10Sn+KlsjNXNzuPfMpogbZkk3uwkLGk35M9OGsEQtfoQBn0IE9tggv+
	aq6L/J+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmbyD-0000000DH89-2SKq;
	Tue, 19 Mar 2024 16:05:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmby9-0000000DH77-2xP6
	for ath10k@lists.infradead.org;
	Tue, 19 Mar 2024 16:05:43 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42J7gHtD003008;
	Tue, 19 Mar 2024 16:05:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=76FBrYkTVRQX+oieYkb18dKDyRyzsr5zGFP3yiN5Bko=; b=QB
	bHlBfnvu6fauPfwwr8qnI5sEMfB+ruQiwgxduKmASnMePVTtisbRWWPoDGDGmqUB
	fXpv1DZ07oYNXofaZB5xZKH09e6Jj1h5hQ+4hYbqC/y7lUf+wpCioBQewgoCFbbq
	1cvyOec1Ukw9jR5pZmRx5m5YitsD4EDl3dMUsRoOHBT9/RFOYM71dClqhZHECnFV
	pEgoDqs0q+U56JUVR0OAA8MvX+cpzGEARruxqCkhciMcYd3k1U4L0JXk6kTN7n/H
	Hfx3CGkj1r6qcQ9XeqdES4C+leksc/1pfAU4Ybk9ncJwUEETbKRKChC0m5orN7Pu
	nJajWLULHVCQILFHQGhw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wy2ea1neb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Mar 2024 16:05:26 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42JG5P81012416
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Mar 2024 16:05:25 GMT
Received: from [10.110.120.226] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 19 Mar
 2024 09:05:25 -0700
Message-ID: <8771e856-3d9f-41c6-88c8-3c75e77b2aab@quicinc.com>
Date: Tue, 19 Mar 2024 09:05:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ath10k: allocate dummy net_device dynamically
Content-Language: en-US
To: Breno Leitao <leitao@debian.org>, Kalle Valo <kvalo@kernel.org>,
        Jeff
 Johnson <jjohnson@kernel.org>
CC: <kuba@kernel.org>, <keescook@chromium.org>,
        "open list:NETWORKING DRIVERS
 (WIRELESS)" <linux-wireless@vger.kernel.org>,
        "open list:QUALCOMM ATHEROS
 ATH10K WIRELESS DRIVER" <ath10k@lists.infradead.org>,
        open list
	<linux-kernel@vger.kernel.org>
References: <20240319104754.2535294-1-leitao@debian.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240319104754.2535294-1-leitao@debian.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: G2z2VFNzoiPUQ-p5f6B4Qkr-CYI79EiI
X-Proofpoint-GUID: G2z2VFNzoiPUQ-p5f6B4Qkr-CYI79EiI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-19_05,2024-03-18_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 spamscore=0 phishscore=0 impostorscore=0 malwarescore=0 adultscore=0
 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403190123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_090541_798048_B8136A8E 
X-CRM114-Status: GOOD (  20.06  )
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

On 3/19/2024 3:47 AM, Breno Leitao wrote:
> Embedding net_device into structures prohibits the usage of flexible
> arrays in the net_device structure. For more details, see the discussion
> at [1].
> 
> Un-embed the net_device from struct ath10k by converting it
> into a pointer. Then use the leverage alloc_netdev() to allocate the
> net_device object at ath10k_core_create(). The free of the device occurs
> at ath10k_core_destroy().
> 
> [1] https://lore.kernel.org/all/20240229225910.79e224cf@kernel.org/
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
>  drivers/net/wireless/ath/ath10k/core.c | 10 ++++++++--
>  drivers/net/wireless/ath/ath10k/core.h |  2 +-
>  drivers/net/wireless/ath/ath10k/pci.c  |  2 +-
>  drivers/net/wireless/ath/ath10k/sdio.c |  2 +-
>  drivers/net/wireless/ath/ath10k/snoc.c |  4 ++--
>  drivers/net/wireless/ath/ath10k/usb.c  |  2 +-
>  6 files changed, 14 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
> index 9ce6f49ab261..3736517002f6 100644
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -3673,11 +3673,14 @@ struct ath10k *ath10k_core_create(size_t priv_size, struct device *dev,
>  	INIT_WORK(&ar->set_coverage_class_work,
>  		  ath10k_core_set_coverage_class_work);
>  
> -	init_dummy_netdev(&ar->napi_dev);
> +	ar->napi_dev = alloc_netdev(0, "dummy", NET_NAME_UNKNOWN,
> +				    init_dummy_netdev);
> +	if (!ar->napi_dev)
> +		goto err_free_tx_complete;
>  
>  	ret = ath10k_coredump_create(ar);
>  	if (ret)
> -		goto err_free_tx_complete;
> +		goto err_free_netdev;
>  
>  	ret = ath10k_debug_create(ar);
>  	if (ret)
> @@ -3687,6 +3690,8 @@ struct ath10k *ath10k_core_create(size_t priv_size, struct device *dev,
>  
>  err_free_coredump:
>  	ath10k_coredump_destroy(ar);
> +err_free_netdev:
> +	free_netdev(ar->napi_dev);
>  err_free_tx_complete:
>  	destroy_workqueue(ar->workqueue_tx_complete);
>  err_free_aux_wq:
> @@ -3708,6 +3713,7 @@ void ath10k_core_destroy(struct ath10k *ar)
>  
>  	destroy_workqueue(ar->workqueue_tx_complete);
>  
> +	free_netdev(ar->napi_dev);
>  	ath10k_debug_destroy(ar);
>  	ath10k_coredump_destroy(ar);
>  	ath10k_htt_tx_destroy(&ar->htt);

looks like there is a pre-existing issue that the order of operations in
_destroy() doesn't match the order of operations in the _create() error path.

but the placement of your changes looks ok to me


> diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
> index c110d15528bd..26003b519574 100644
> --- a/drivers/net/wireless/ath/ath10k/core.h
> +++ b/drivers/net/wireless/ath/ath10k/core.h
> @@ -1269,7 +1269,7 @@ struct ath10k {
>  	struct ath10k_per_peer_tx_stats peer_tx_stats;
>  
>  	/* NAPI */
> -	struct net_device napi_dev;
> +	struct net_device *napi_dev;
>  	struct napi_struct napi;
>  
>  	struct work_struct set_coverage_class_work;
> diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
> index 5c34b156b4ff..558bec96ae40 100644
> --- a/drivers/net/wireless/ath/ath10k/pci.c
> +++ b/drivers/net/wireless/ath/ath10k/pci.c
> @@ -3217,7 +3217,7 @@ static void ath10k_pci_free_irq(struct ath10k *ar)
>  
>  void ath10k_pci_init_napi(struct ath10k *ar)
>  {
> -	netif_napi_add(&ar->napi_dev, &ar->napi, ath10k_pci_napi_poll);
> +	netif_napi_add(ar->napi_dev, &ar->napi, ath10k_pci_napi_poll);
>  }
>  
>  static int ath10k_pci_init_irq(struct ath10k *ar)
> diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
> index 0ab5433f6cf6..e28f2fe1101b 100644
> --- a/drivers/net/wireless/ath/ath10k/sdio.c
> +++ b/drivers/net/wireless/ath/ath10k/sdio.c
> @@ -2532,7 +2532,7 @@ static int ath10k_sdio_probe(struct sdio_func *func,
>  		return -ENOMEM;
>  	}
>  
> -	netif_napi_add(&ar->napi_dev, &ar->napi, ath10k_sdio_napi_poll);
> +	netif_napi_add(ar->napi_dev, &ar->napi, ath10k_sdio_napi_poll);
>  
>  	ath10k_dbg(ar, ATH10K_DBG_BOOT,
>  		   "sdio new func %d vendor 0x%x device 0x%x block 0x%x/0x%x\n",
> diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
> index 2c39bad7ebfb..0449b9ffc32d 100644
> --- a/drivers/net/wireless/ath/ath10k/snoc.c
> +++ b/drivers/net/wireless/ath/ath10k/snoc.c
> @@ -935,7 +935,7 @@ static int ath10k_snoc_hif_start(struct ath10k *ar)
>  
>  	bitmap_clear(ar_snoc->pending_ce_irqs, 0, CE_COUNT_MAX);
>  
> -	dev_set_threaded(&ar->napi_dev, true);
> +	dev_set_threaded(ar->napi_dev, true);
>  	ath10k_core_napi_enable(ar);
>  	ath10k_snoc_irq_enable(ar);
>  	ath10k_snoc_rx_post(ar);
> @@ -1253,7 +1253,7 @@ static int ath10k_snoc_napi_poll(struct napi_struct *ctx, int budget)
>  
>  static void ath10k_snoc_init_napi(struct ath10k *ar)
>  {
> -	netif_napi_add(&ar->napi_dev, &ar->napi, ath10k_snoc_napi_poll);
> +	netif_napi_add(ar->napi_dev, &ar->napi, ath10k_snoc_napi_poll);
>  }
>  
>  static int ath10k_snoc_request_irq(struct ath10k *ar)
> diff --git a/drivers/net/wireless/ath/ath10k/usb.c b/drivers/net/wireless/ath/ath10k/usb.c
> index 3c482baacec1..3b51b7f52130 100644
> --- a/drivers/net/wireless/ath/ath10k/usb.c
> +++ b/drivers/net/wireless/ath/ath10k/usb.c
> @@ -1014,7 +1014,7 @@ static int ath10k_usb_probe(struct usb_interface *interface,
>  		return -ENOMEM;
>  	}
>  
> -	netif_napi_add(&ar->napi_dev, &ar->napi, ath10k_usb_napi_poll);
> +	netif_napi_add(ar->napi_dev, &ar->napi, ath10k_usb_napi_poll);
>  
>  	usb_get_dev(dev);
>  	vendor_id = le16_to_cpu(dev->descriptor.idVendor);

I've pinged the development team to see if they can validate this on hardware
-- I don't have any ath10k setups.

Will ack this once I get confirmation.

/jeff

