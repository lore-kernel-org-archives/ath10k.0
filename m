Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3018FC4332F
	for <ath10k@archiver.kernel.org>; Wed,  9 Nov 2022 16:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d7x8YiUIwJdqUfpBS+i+Mi4CHOfsSjpOQrCxTWKLyoo=; b=NZP8QEjskfwloR
	9zvm0bmYoC+82H2wR63roZD7WRyk1rlo06eqO3FrwTfBG6DImmorHoSbJXfdVDhuHzFxctaueD+tB
	sHdJBbC++L3GbFvqA9BWMjevksnTu0ZKEk9SPoDO6IbNrNhxm+7ARl+T3SWNA0bzj3kjh9VA6bHsn
	LahglBEyYRUM/IQtkpH3thHLEG9yDCPVhzDnY1MdxBMk93Xx/THWzIUJPMu+KP38YRbzzXWNQMxnn
	KdEkxuS6/eoYePIMbh1wnuZthVZuAD0mKTRSfc0ze130s8gcPDXufB6aGsptiQ4W6s3Mv2pV3yHVT
	lBRIA+6aLLihcv5936SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oso54-00F5AN-Op; Wed, 09 Nov 2022 16:37:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oso2c-00F3Uf-IA
	for ath10k@lists.infradead.org; Wed, 09 Nov 2022 16:35:08 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2A9GTqLE028995;
	Wed, 9 Nov 2022 16:34:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=RntDMw5xqUv2PusgpyxEjzB7JxSqBHT4WmfZXV2PjDE=;
 b=iAasq3X3Fkm9dsexjIzY2UkVn0+LS9v4gqxUWlD42p/tK8OOs3MD2rTG+wOAd5x7dsS5
 CnCGLDDescuyZKqRHkfpgvsJ4zoXMg50MaEwghJCTIn/PBFwSa4cQVHT+TlZsDzAV1IJ
 Rbglz5z2aCYGEx4yHasFJvPmaNTi/deTQ6vNSq9XuwGhEZb/DZdgdHRHDekrT9sRixT3
 lIfzSi5/KH3VlawETVesJ1xk7t28b/Nqa9aHbiQBekhlfJdUOdaEJ9tm/wvaiZYMe+rz
 j7TgD/DDmx2Fi2rzmZ0NryD0ixVKdCKRpA/nLZKId6+OBPk+PBEeFpnyTbwPwNQDIFDN uQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3krfrpr0jj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Nov 2022 16:34:54 +0000
Received: from pps.filterd (NALASPPMTA02.qualcomm.com [127.0.0.1])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 2A9GUQVp025176;
	Wed, 9 Nov 2022 16:34:54 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 3kngwm0ytu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Nov 2022 16:34:54 +0000
Received: from NALASPPMTA02.qualcomm.com (NALASPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A9GYrim028490;
	Wed, 9 Nov 2022 16:34:53 GMT
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 2A9GYrLn028489
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Nov 2022 16:34:53 +0000
Received: from [10.110.45.55] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Wed, 9 Nov 2022
 08:34:52 -0800
Message-ID: <4e81efea-23f1-e52c-b0b4-abf445ed5f15@quicinc.com>
Date: Wed, 9 Nov 2022 08:34:51 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] wifi: ath10k: Fix resource leak in ath10k_pci_init()
Content-Language: en-US
To: Xiu Jianfeng <xiujianfeng@huawei.com>, <kvalo@kernel.org>,
        <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
        <pabeni@redhat.com>, <rmani@qti.qualcomm.com>
CC: <ath10k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20221108133858.53308-1-xiujianfeng@huawei.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20221108133858.53308-1-xiujianfeng@huawei.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Ohkn7-XpSZ17OwMxEJ7nooLsjNdfRHkF
X-Proofpoint-GUID: Ohkn7-XpSZ17OwMxEJ7nooLsjNdfRHkF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-09_06,2022-11-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 clxscore=1011 mlxscore=0 bulkscore=0 phishscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211090125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_083506_665993_50E5A3FC 
X-CRM114-Status: GOOD (  21.07  )
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

On 11/8/2022 5:38 AM, Xiu Jianfeng wrote:
> When ath10k_ahb_init() fails, it does not unregister ath10k_pci_driver,
> which will cause a resource leak issue, call pci_unregister_driver() in
> the error path to fix this issue.
> 
> Fixes: 0b523ced9a3c ("ath10k: add basic skeleton to support ahb")
> Signed-off-by: Xiu Jianfeng <xiujianfeng@huawei.com>
> ---
>   drivers/net/wireless/ath/ath10k/pci.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
> index e56c6a6b1379..22f8f8b20762 100644
> --- a/drivers/net/wireless/ath/ath10k/pci.c
> +++ b/drivers/net/wireless/ath/ath10k/pci.c
> @@ -3800,8 +3800,10 @@ static int __init ath10k_pci_init(void)
>   		       ret);
>   
>   	ret = ath10k_ahb_init();
> -	if (ret)
> +	if (ret) {
>   		printk(KERN_ERR "ahb init failed: %d\n", ret);
> +		pci_unregister_driver(&ath10k_pci_driver);
> +	}
>   
>   	return ret;
>   }

imo neither the existing code nor the modified code is correct.

the driver is attempting to register to support two different buses.

if either of these is successful then ath10k_pci_init() should return 0 
so that hardware attached to the successful bus can be probed and supported.

only if both of these are unsuccessful should ath10k_pci_init() return 
an errno.

so I suggest
	int ret1, ret2;

	ret1 = pci_register_driver(&ath10k_pci_driver);
	if (ret1)
		printk(KERN_ERR "failed to register ath10k pci driver: %d\n",
		       ret1);

	ret2 = ath10k_ahb_init();
	if (ret2)
		printk(KERN_ERR "ahb init failed: %d\n", ret2);

	if (ret1 && ret2)
		return ret1;

	/* registered to at least one bus */
	return 0;
}


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
