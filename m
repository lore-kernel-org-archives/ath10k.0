Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62254C7EE2C
	for <ath10k@archiver.kernel.org>; Thu, 24 Aug 2023 15:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6aL6TWks0A4mW3+cXAEXeqGJ/BtWfWWUNR7Ee8HJqw8=; b=27X3Dd27GVrVvw
	LLdbz32JQLSqpvDwy6kpkc6K2VSCLyRAchmAqwV1D4PX2tapXlp5KFcfI8HHdo11E6xd6sVRt+RB9
	fYJnLxIMHWN7tTVd6jyH5TFT6nL6qzQvoXzM4hmVrN8XzCgVeuZiL4YFn9QwZqi4mL+litdFxjBtC
	kWAcYFSgarQ6ykAp/O+TvPuC7fu/brkwRRgjBgdAbJa5hCaC56Da4hmLj6umA7pXnnO11B4GQ2rBn
	ba9of329DGsCkXMa7HgTopKF6DVCv6QR4WjGZ4H2zitaXnlpDx2O0AlmvYGVTTdSla8TWMRWYtzAc
	c45pecTO2a/teDRoSi8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZCEY-003MW0-0U;
	Thu, 24 Aug 2023 15:26:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZCET-003MUQ-2b
	for ath10k@lists.infradead.org;
	Thu, 24 Aug 2023 15:26:52 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37OEZIS5001500;
	Thu, 24 Aug 2023 15:26:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=yEbqS9zhCPZYpnokmS+VjXXWNaPRQ0bmPoV5SyFrWdM=;
 b=n2TJh8UhrGpS0ZkUn5oJ+AS4T/K5d+rP5dB51GIhXH0iMjgsFQGPljq8z2Ow6wsRAolb
 oNqjAUTQqfbykhWDxPTefYE9rnbvxzK2DFKcoMREasdRh3eZ0n3GGpn1B0dG1FRypqcG
 ps1+c2wKvF/7ZfrzkIfU4Y8f54GJzi8WQbUp07NXI97n8fo0wCnn3rg5x2gnYec5dk06
 hEMiiCaSndphNSvGextrBZLVAJCsNU+uqP7Ro1KUjF2jkMiLW/7RdWgdbpwMOYpYEa11
 EA3O1BwN/8jA6he7OFuxNwqvrsQ63U3qqqa//x/kal6hwf3FjZ4nG8bqITeImSvrOZ2a wA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sp1r3sb08-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Aug 2023 15:26:38 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37OFQbYV025748
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Aug 2023 15:26:37 GMT
Received: from [10.48.247.99] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Thu, 24 Aug
 2023 08:26:36 -0700
Message-ID: <11ee12c9-e851-4afe-b80e-15e9e46a51d0@quicinc.com>
Date: Thu, 24 Aug 2023 08:26:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] [v3] wifi: ath10k: cleanup CE ring initialization
Content-Language: en-US
To: Dmitry Antipov <dmantipov@yandex.ru>
CC: Kalle Valo <kvalo@kernel.org>, <linux-wireless@vger.kernel.org>,
        <lvc-project@linuxtesting.org>, <ath10k@lists.infradead.org>
References: <997f4b09-7087-4788-aa2a-ef835ce6ebb3@quicinc.com>
 <20230824055117.42309-1-dmantipov@yandex.ru>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20230824055117.42309-1-dmantipov@yandex.ru>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: nRwpgeUVGEwupxiHOAkMAhhfDKSTMsNo
X-Proofpoint-GUID: nRwpgeUVGEwupxiHOAkMAhhfDKSTMsNo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-24_12,2023-08-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 phishscore=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308240129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_082649_975567_ACC67534 
X-CRM114-Status: GOOD (  21.26  )
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

On 8/23/2023 10:51 PM, Dmitry Antipov wrote:
> Commit 25d0dbcbd5c7 ("ath10k: split ce initialization and allocation")
> changes 'ath10k_ce_init_src_ring()' and 'ath10k_ce_init_dest_ring()'
> so these functions can't return -ENOMEM but always returns 0. This way
> both of them may be converted to 'void', and 'ath10k_ce_init_pipe()'
> may be simplified accordingly.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>

> ---
> v3: split to smaller units per Jeff's suggestion
> v2: change 'ath10k_ce_alloc_rri()' to return -ENOMEM in case
> of 'dma_alloc_coherent()' failure and fix error handling in
> 'ath10k_snoc_hif_power_up()'
> ---
>   drivers/net/wireless/ath/ath10k/ce.c | 38 ++++++++--------------------
>   1 file changed, 10 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/ce.c b/drivers/net/wireless/ath/ath10k/ce.c
> index c27b8204718a..ace92c636733 100644
> --- a/drivers/net/wireless/ath/ath10k/ce.c
> +++ b/drivers/net/wireless/ath/ath10k/ce.c
> @@ -1352,9 +1352,9 @@ void ath10k_ce_enable_interrupts(struct ath10k *ar)
>   }
>   EXPORT_SYMBOL(ath10k_ce_enable_interrupts);
>   
> -static int ath10k_ce_init_src_ring(struct ath10k *ar,
> -				   unsigned int ce_id,
> -				   const struct ce_attr *attr)
> +static void ath10k_ce_init_src_ring(struct ath10k *ar,
> +				    unsigned int ce_id,
> +				    const struct ce_attr *attr)
>   {
>   	struct ath10k_ce *ce = ath10k_ce_priv(ar);
>   	struct ath10k_ce_pipe *ce_state = &ce->ce_states[ce_id];
> @@ -1389,13 +1389,11 @@ static int ath10k_ce_init_src_ring(struct ath10k *ar,
>   	ath10k_dbg(ar, ATH10K_DBG_BOOT,
>   		   "boot init ce src ring id %d entries %d base_addr %pK\n",
>   		   ce_id, nentries, src_ring->base_addr_owner_space);
> -
> -	return 0;
>   }
>   
> -static int ath10k_ce_init_dest_ring(struct ath10k *ar,
> -				    unsigned int ce_id,
> -				    const struct ce_attr *attr)
> +static void ath10k_ce_init_dest_ring(struct ath10k *ar,
> +				     unsigned int ce_id,
> +				     const struct ce_attr *attr)
>   {
>   	struct ath10k_ce *ce = ath10k_ce_priv(ar);
>   	struct ath10k_ce_pipe *ce_state = &ce->ce_states[ce_id];
> @@ -1427,8 +1425,6 @@ static int ath10k_ce_init_dest_ring(struct ath10k *ar,
>   	ath10k_dbg(ar, ATH10K_DBG_BOOT,
>   		   "boot ce dest ring id %d entries %d base_addr %pK\n",
>   		   ce_id, nentries, dest_ring->base_addr_owner_space);
> -
> -	return 0;
>   }
>   
>   static int ath10k_ce_alloc_shadow_base(struct ath10k *ar,
> @@ -1662,25 +1658,11 @@ ath10k_ce_alloc_dest_ring_64(struct ath10k *ar, unsigned int ce_id,
>   int ath10k_ce_init_pipe(struct ath10k *ar, unsigned int ce_id,
>   			const struct ce_attr *attr)
>   {
> -	int ret;
> -
> -	if (attr->src_nentries) {
> -		ret = ath10k_ce_init_src_ring(ar, ce_id, attr);
> -		if (ret) {
> -			ath10k_err(ar, "Failed to initialize CE src ring for ID: %d (%d)\n",
> -				   ce_id, ret);
> -			return ret;
> -		}
> -	}
> +	if (attr->src_nentries)
> +		ath10k_ce_init_src_ring(ar, ce_id, attr);
>   
> -	if (attr->dest_nentries) {
> -		ret = ath10k_ce_init_dest_ring(ar, ce_id, attr);
> -		if (ret) {
> -			ath10k_err(ar, "Failed to initialize CE dest ring for ID: %d (%d)\n",
> -				   ce_id, ret);
> -			return ret;
> -		}
> -	}
> +	if (attr->dest_nentries)
> +		ath10k_ce_init_dest_ring(ar, ce_id, attr);
>   
>   	return 0;
>   }


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
