Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB2B6CD4F21
	for <ath10k@archiver.kernel.org>; Wed,  4 Sep 2024 17:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nb2WfbAzhEtZm4ZzGkKQiikMPZLxi1bKX/rDYc1ct00=; b=KLkcrrqb2+ucV9UtxKnop+Iaze
	7LeTZJ4kIxY7Sx2chtJL+lQXXXvIn8nfuIPpGMgG5fuCGf2fFCrlhYvVzVzO3dmEXfvd1bM+4Tvhg
	hhZJCE+f/+onMMSUh5MG8+LLqRzXylLRSMAT3NHenCMtP3LwMyG0LUghcGuuQuGi1NMkATWmCmkvY
	TqUZsOZrtbiGFZYka2lZs9zR0JtJQi5zCpcjF6kpkPCRJEfUmiA4z/nahqWVo9e8ucNy+MfLdQ1AP
	1HGau28uYOEPESoz0GL5mw3uAotUUYKbF+704pnaVQ3fyVr0f5c/jSyr19mshSMEtFqzgfubuK/20
	2jadY4cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sltqd-00000005T7y-1rqq;
	Wed, 04 Sep 2024 17:31:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sltqZ-00000005T7F-3VXL
	for ath10k@lists.infradead.org;
	Wed, 04 Sep 2024 17:31:13 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 484AUmJZ010617;
	Wed, 4 Sep 2024 17:31:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nb2WfbAzhEtZm4ZzGkKQiikMPZLxi1bKX/rDYc1ct00=; b=XtSMkypc3ZFbhNsm
	CAW7tSYVBRmIodDinTR9gwWUMnoleYRYaKUX157P8iA51xN4HprZY0IRfOBriEZm
	Ky7P8mEp3MeaTk+M4xpXjUQ9ySg7CGsyeZf60tWocrq3awgiGZdqduWHTIcWvtvG
	fBkkK4On2339umXGWOjdTEWqn+A4NKJ+eqrTs04AjeaFYxAQX9YY3p9Qi7uEoV/L
	xMQoI0ydJ1mygHefJtheEeyZ+KZTTi+joX3XSKcbXdUCSc6gbLkxPIF2MkCdnPLg
	Szz4IJrgtgSP8FSHF9Cq5J7R3/LX2u+sjXYhsHilwWI+NLC9oFkyFG0yAc2V1oYX
	GK4ETA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41bvbkkdjg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Sep 2024 17:31:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 484HV6RO028481
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Sep 2024 17:31:06 GMT
Received: from [10.111.180.250] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Sep 2024
 10:31:06 -0700
Message-ID: <8b7d9777-e239-4173-bec5-607e15b98130@quicinc.com>
Date: Wed, 4 Sep 2024 10:31:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath10k: add USB device ID for Atheros QCA9377-7
To: Tomas Paukrt <tomaspaukrt@email.cz>, <ath10k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <22t.ZbsX.5bWREDtSGGB.1cqQpF@seznam.cz>
Content-Language: en-US
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <22t.ZbsX.5bWREDtSGGB.1cqQpF@seznam.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: X9n80iZPUtfJzds4W0Yp194yJf-dcHS8
X-Proofpoint-GUID: X9n80iZPUtfJzds4W0Yp194yJf-dcHS8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-04_15,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 mlxscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1011
 mlxlogscore=785 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409040133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_103111_915611_9C06B11A 
X-CRM114-Status: GOOD (  17.36  )
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

On 8/30/2024 4:28 AM, Tomas Paukrt wrote:
> Add USB device ID for modules based on Atheros QCA9377-7 chipset like
> 8devices BLUE bean or SparkLAN WUBQ-159ACN.
> 
> Tested-on: QCA9377 hw1.1 USB
Since Tested-on is not an official upstream tag there should be a blank line
between it and the official tags.

Also the Tested-on tag should include the firmware version information as well.

See
<https://wireless.wiki.kernel.org/en/users/drivers/ath10k/submittingpatches#tested-on_tag>

> Signed-off-by: Tomas Paukrt <tomaspaukrt@email.cz>
> ---
>  drivers/net/wireless/ath/ath10k/usb.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/usb.c b/drivers/net/wireless/ath/ath10k/usb.c
> index 3b51b7f..60441ff 100644
> --- a/drivers/net/wireless/ath/ath10k/usb.c
> +++ b/drivers/net/wireless/ath/ath10k/usb.c
> @@ -1106,6 +1106,7 @@ static int ath10k_usb_pm_resume(struct usb_interface *interface)
>  
>  /* table of devices that work with this driver */
>  static struct usb_device_id ath10k_usb_ids[] = {
> +	{USB_DEVICE(0x0cf3, 0x9378)}, /* Atheros QCA9377-7 */
>  	{USB_DEVICE(0x13b1, 0x0042)}, /* Linksys WUSB6100M */
>  	{ /* Terminating entry */ },
>  };


