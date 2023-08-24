Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10860C3DA6F
	for <ath10k@archiver.kernel.org>; Thu, 24 Aug 2023 15:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iR1hV8PhpetpKAYqmoP1nzyHKqhOoDJZDk+mNBoTdxs=; b=CHOdw/Z0GYibQ4
	FzwoD8obdQQ20SdWAXS8BWdvD8d4Pbp7mi3td9orihEZ02/Sj9mylwchS1FU4qwKTWfLg0/m5tINS
	mi+U5aBsTc2Ud0we8H4UhmW1hqfrWgBlda/YSuNISRdJ987HpeIBnK+IwD1omE0e7Brl++NmMeIpj
	7+LCSVYMby+rs/I0m+TlmM+4z3YYzFnaKo7gYiiX3t7kEV4jqTB2KxnNK4lMa2pX44dYHtBy9J1ID
	8l0Cqle0fOmcnIx9p35kg2G2qtKp818Tr9XuSkkDZaacgKaNLq96edJinkR0sCiY2u0Q6SH/cktB5
	twbmanYNOgbc9yMmWoEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZCEt-003MeJ-0r;
	Thu, 24 Aug 2023 15:27:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZCEr-003MdE-14
	for ath10k@lists.infradead.org;
	Thu, 24 Aug 2023 15:27:14 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37OEWIgb014886;
	Thu, 24 Aug 2023 15:27:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=pvzSXBpucKtbNqoG5/Fnxor3GK2Pxe/r4rxJIFnYNHg=;
 b=QMV+Xfm5kdI2EQ5Y4uBuQpW1iNAIBgGV6tQYZTm2vWnKb7rvtwXJ1XbsFDWc/SXfilm0
 Y7Qsfdfvr91hTMPAFjFgbOgUziV5bmTof+1AspakrOXiUCp2uujHceuHZPlBd2fU4oHp
 hBEZ5ZBPNUiVcZ548VZKq+ZzBeTQTzxyF0X7KGj6/jn6s3DEr5d4Uf9WI9NoW+em+7zb
 WnsNGq9FJO8adkCSlOqmSqo6oF48DvB0JHLyg6rM5PR8tb2NsPTE3ANch/EzzDeUt3aw
 RKIT0FYB+wceCjV9DONtsRZaEUDfQd2EoR+NYfVmyXjAfBmcQH5cY2h/XF1hmHFsdKji zw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3snvuw9xmv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Aug 2023 15:27:09 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37OFR9VK026439
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Aug 2023 15:27:09 GMT
Received: from [10.48.247.99] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Thu, 24 Aug
 2023 08:27:08 -0700
Message-ID: <cb767f19-a7d7-47e5-a36f-c950b2d5b2b4@quicinc.com>
Date: Thu, 24 Aug 2023 08:27:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] [v3] wifi: ath10k: cleanup CE pipes initialization
Content-Language: en-US
To: Dmitry Antipov <dmantipov@yandex.ru>
CC: Kalle Valo <kvalo@kernel.org>, <linux-wireless@vger.kernel.org>,
        <lvc-project@linuxtesting.org>, <ath10k@lists.infradead.org>
References: <997f4b09-7087-4788-aa2a-ef835ce6ebb3@quicinc.com>
 <20230824055117.42309-1-dmantipov@yandex.ru>
 <20230824055117.42309-3-dmantipov@yandex.ru>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20230824055117.42309-3-dmantipov@yandex.ru>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: AT-6xlxt_28SPoslNIBkEZOLZCJ5ETFn
X-Proofpoint-ORIG-GUID: AT-6xlxt_28SPoslNIBkEZOLZCJ5ETFn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-24_12,2023-08-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308240129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_082713_372575_70398631 
X-CRM114-Status: GOOD (  21.45  )
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
> Convert 'ath10k_pci_init_pipes()' and 'ath10k_snoc_init_pipes()'
> to 'void' and thus simplify 'ath10k_ahb_hif_power_up()',
> 'ath10k_pci_qca988x_chip_reset()' and 'ath10k_snoc_hif_power_up()'.
> 
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>

> ---
> v3: split from the larger v2 patch
> ---
>   drivers/net/wireless/ath/ath10k/ahb.c  |  6 +-----
>   drivers/net/wireless/ath/ath10k/pci.c  | 17 +++--------------
>   drivers/net/wireless/ath/ath10k/pci.h  |  2 +-
>   drivers/net/wireless/ath/ath10k/snoc.c | 16 ++--------------
>   4 files changed, 7 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/ahb.c b/drivers/net/wireless/ath/ath10k/ahb.c
> index 76efea2f1138..c3a2eeb5542d 100644
> --- a/drivers/net/wireless/ath/ath10k/ahb.c
> +++ b/drivers/net/wireless/ath/ath10k/ahb.c
> @@ -655,11 +655,7 @@ static int ath10k_ahb_hif_power_up(struct ath10k *ar,
>   		goto out;
>   	}
>   
> -	ret = ath10k_pci_init_pipes(ar);
> -	if (ret) {
> -		ath10k_err(ar, "failed to initialize CE: %d\n", ret);
> -		goto out;
> -	}
> +	ath10k_pci_init_pipes(ar);
>   
>   	ret = ath10k_pci_init_config(ar);
>   	if (ret) {
> diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
> index 8e05326400bb..f6988075cd83 100644
> --- a/drivers/net/wireless/ath/ath10k/pci.c
> +++ b/drivers/net/wireless/ath/ath10k/pci.c
> @@ -2524,15 +2524,13 @@ void ath10k_pci_free_pipes(struct ath10k *ar)
>   		ath10k_ce_free_pipe(ar, i);
>   }
>   
> -int ath10k_pci_init_pipes(struct ath10k *ar)
> +void ath10k_pci_init_pipes(struct ath10k *ar)
>   {
>   	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
>   	int i;
>   
>   	for (i = 0; i < CE_COUNT; i++)
>   		ath10k_ce_init_pipe(ar, i, &ar_pci->attr[i]);
> -
> -	return 0;
>   }
>   
>   static bool ath10k_pci_has_fw_crashed(struct ath10k *ar)
> @@ -2697,12 +2695,7 @@ static int ath10k_pci_qca988x_chip_reset(struct ath10k *ar)
>   		 * sufficient to verify if device is capable of booting
>   		 * firmware blob.
>   		 */
> -		ret = ath10k_pci_init_pipes(ar);
> -		if (ret) {
> -			ath10k_warn(ar, "failed to init copy engine: %d\n",
> -				    ret);
> -			continue;
> -		}
> +		ath10k_pci_init_pipes(ar);
>   
>   		ret = ath10k_pci_diag_read32(ar, QCA988X_HOST_INTEREST_ADDRESS,
>   					     &val);
> @@ -2840,11 +2833,7 @@ static int ath10k_pci_hif_power_up(struct ath10k *ar,
>   		goto err_sleep;
>   	}
>   
> -	ret = ath10k_pci_init_pipes(ar);
> -	if (ret) {
> -		ath10k_err(ar, "failed to initialize CE: %d\n", ret);
> -		goto err_sleep;
> -	}
> +	ath10k_pci_init_pipes(ar);
>   
>   	ret = ath10k_pci_init_config(ar);
>   	if (ret) {
> diff --git a/drivers/net/wireless/ath/ath10k/pci.h b/drivers/net/wireless/ath/ath10k/pci.h
> index 480cd97ab739..3b3ded87aef9 100644
> --- a/drivers/net/wireless/ath/ath10k/pci.h
> +++ b/drivers/net/wireless/ath/ath10k/pci.h
> @@ -238,7 +238,7 @@ void ath10k_pci_free_pipes(struct ath10k *ar);
>   void ath10k_pci_rx_replenish_retry(struct timer_list *t);
>   void ath10k_pci_ce_deinit(struct ath10k *ar);
>   void ath10k_pci_init_napi(struct ath10k *ar);
> -int ath10k_pci_init_pipes(struct ath10k *ar);
> +void ath10k_pci_init_pipes(struct ath10k *ar);
>   int ath10k_pci_init_config(struct ath10k *ar);
>   void ath10k_pci_rx_post(struct ath10k *ar);
>   void ath10k_pci_flush(struct ath10k *ar);
> diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
> index 4f835ad60080..815df15f58fb 100644
> --- a/drivers/net/wireless/ath/ath10k/snoc.c
> +++ b/drivers/net/wireless/ath/ath10k/snoc.c
> @@ -939,14 +939,12 @@ static int ath10k_snoc_hif_start(struct ath10k *ar)
>   	return 0;
>   }
>   
> -static int ath10k_snoc_init_pipes(struct ath10k *ar)
> +static void ath10k_snoc_init_pipes(struct ath10k *ar)
>   {
>   	int i;
>   
>   	for (i = 0; i < CE_COUNT; i++)
>   		ath10k_ce_init_pipe(ar, i, &host_ce_config_wlan[i]);
> -
> -	return 0;
>   }
>   
>   static int ath10k_snoc_wlan_enable(struct ath10k *ar,
> @@ -1078,17 +1076,7 @@ static int ath10k_snoc_hif_power_up(struct ath10k *ar,
>   
>   	ath10k_ce_alloc_rri(ar);
>   
> -	ret = ath10k_snoc_init_pipes(ar);
> -	if (ret) {
> -		ath10k_err(ar, "failed to initialize CE: %d\n", ret);
> -		goto err_free_rri;
> -	}
> -
> -	return 0;
> -
> -err_free_rri:
> -	ath10k_ce_free_rri(ar);
> -	ath10k_snoc_wlan_disable(ar);
> +	ath10k_snoc_init_pipes(ar);
>   
>   err_hw_power_off:
>   	ath10k_hw_power_off(ar);


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
