Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A44C35FF6
	for <ath10k@archiver.kernel.org>; Thu, 13 Mar 2025 18:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=awOPnnsbd+ZITDDV/+JLRdAlqUsZWoQ4R77EaysafPU=; b=aY2Sm+QgkU1wPNpmP1eiJaH01F
	sblsuGw3YqvrXdTq2QpCYTIticOb5Z4mNxjVngNurlpow43bRDrLPws9VFTCUacJ8tktYSx6Bw3oi
	V7W9pHFjVK0BnLRgMzFy2dsSawxxR0mGSuoR/bXBXXgaWbI0GOdvCBVeDESnsAnkoBdIH9nirIKSB
	cTbx5+lazPzQBbsoW+uyQUOwcnzdF4U0/ndyvXRQht4ogXP/a0K4Olpb71jii3CHrSdV/LLnG+sH+
	KZfR5YfyAA0yGP43/yV5jjeikaC2N9/xTezNY0Jr9N0MzbPz1c7sBbtH0fHouyl5p9146SBQ3ULY9
	l3vRBRXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsmu1-0000000C6RK-1xOZ;
	Thu, 13 Mar 2025 18:03:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsmNb-0000000C2wL-3Reb
	for ath10k@lists.infradead.org;
	Thu, 13 Mar 2025 17:30:01 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DAa09D003492
	for <ath10k@lists.infradead.org>; Thu, 13 Mar 2025 17:29:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	awOPnnsbd+ZITDDV/+JLRdAlqUsZWoQ4R77EaysafPU=; b=Fs2aRRl5KVkinpOp
	HDdew9bXb3MLMqoaPfl1Yg8hIq22hLlUFwd5DMitu/g4zIwo5Rk7IsNDNq2FIK7P
	jt3WQT+tvfhKkI/tD978Fb6V0Y8ezSlqS6enzQw51MDarjjRHOKY0Na/yuT/yDFt
	YJrAD6P2OD7bLWOVx6NsOt9g8qNO6VV6PooGCm7gEvEs5JrAY2kjbQtMfrWfX+bZ
	s2ij7Ircmlup0VIQ3q/1VsrgM3X6veip0gXKCstyyOVpD9z5Mu+soI3bIhvs/9OD
	LnDI+NDlEc/VS3EqZba5Xwc4pWfkGbfsY790lXktLDxhmrPbQLFQJEgDwO1G48Xz
	2txrHA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45b96yck1m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 13 Mar 2025 17:29:58 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-223a2770b75so22855945ad.1
        for <ath10k@lists.infradead.org>; Thu, 13 Mar 2025 10:29:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741886997; x=1742491797;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=awOPnnsbd+ZITDDV/+JLRdAlqUsZWoQ4R77EaysafPU=;
        b=BFVgAcWfei4mCSPALG/lu1aRg9o9P14axlInUmT5S66cnBUaHldxYvqbM5dlDv9rUR
         xf6iUOK9XzMJxfVbI+k8wr1wBSbtOv80aXKZmFboufxK2JSJOX8nZxAZOoE6P4NhNFEc
         lkTL28qs46rg8v5IFR+LZHQ5LViCyrTmjFs5gNdEL+g7NIotik5BgmGNhSlrKgAmVwrp
         BwoQy65q2nARcbgFDsdJHZ7UX+KscvPVgCSt33AY1VM7dtBH1AUMDwnamWRZpCGYsiK5
         WKU8VW6aq7DfZBY8za0dwf+h6cZNOfCBhWFKdirnHGBigvrRfIR7LnUx3b7AOldFA9vs
         Qk7w==
X-Forwarded-Encrypted: i=1; AJvYcCWyJM3XLZWQ0f3JBqlLubzKnBjfBzMJHI+IZO/ktMf/MjJueXmstrzuevlVhmg+aj4F1uUOCVQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YyEkCk1fTT3EWWAYIhIO4wTE/7EDbQYMeJ3VpspsuifdSiUALr7
	VSZpqhol7Zg5fkSd7qcCjcZm0wrmKt+UoyntdpHwibyP58s1olaWIlG/DAAAC3w7FV842MxtE6B
	IKeWYVm7bAXlS876F4qwSvJ2q5DvGwBO0XbvZcfE6j6NqA0tkBQjNZv5LPlECdTgwyjHH
X-Gm-Gg: ASbGncut8coXrDTgVdtyA59Cpbfb4FJKad9uyRGI+hzRFKTHz/oPXkl154OISa2OPg3
	pLhQaOnuuBq9/Nx1GG+mmuXIyoA4gxbazAhpgIRo5qN8+4JZNR+qdv/V3MTmDHZ+heWuwZjUmHh
	r9kaixrsefkrpEZkPyCsedOENHBji57unyf+77UDmaIJMiiOhQjPViq2BHyGgL320YD68ZhlXGp
	aElRoHgZpvvI5iMyHM+wgXIe8odL+ogBwQVmX5d4Z9+WWH5wlVDq4tKozPX0tc7uJj46ECMcyFS
	18CkLFWPwv3aMBp4hTBQrAcL5UxpI41ugqd8DaQCfa2UcnkGd5oT2kNbI4TpnymDFWDHKcKq+Ce
	29pwEvWNX
X-Received: by 2002:a05:6a00:8d2:b0:736:339b:8296 with SMTP id d2e1a72fcca58-7371f17e455mr494950b3a.18.1741886997437;
        Thu, 13 Mar 2025 10:29:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPhq47TWkIDcRQxoDx44xKFXPM4TKX8MLJNf13Xta2UOYeZHJ1f+/yEahV1YT+F1aEcUgnFQ==
X-Received: by 2002:a05:6a00:8d2:b0:736:339b:8296 with SMTP id d2e1a72fcca58-7371f17e455mr494906b3a.18.1741886996826;
        Thu, 13 Mar 2025 10:29:56 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73711529531sm1608998b3a.2.2025.03.13.10.29.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 10:29:56 -0700 (PDT)
Message-ID: <fdaab417-62b7-4151-be35-34fb7a354eae@oss.qualcomm.com>
Date: Thu, 13 Mar 2025 10:29:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath10k: Drop of_get_property() call
To: "Rob Herring (Arm)" <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250312234228.1243477-1-robh@kernel.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250312234228.1243477-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Vru_Vxn-K9RUoXQH1Xw_MNKcLD5PUAtL
X-Authority-Analysis: v=2.4 cv=I+llRMgg c=1 sm=1 tr=0 ts=67d31616 cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=e70TP3dOR9hTogukJ0528Q==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=syD-WeZVJwOIrOENAgcA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: Vru_Vxn-K9RUoXQH1Xw_MNKcLD5PUAtL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_08,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 phishscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503130133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_102959_887582_9320F09A 
X-CRM114-Status: GOOD (  25.16  )
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

On 3/12/2025 4:42 PM, Rob Herring (Arm) wrote:
> There's no need to check the property presence and length before calling
> of_property_read_u8_array() as it will return an error if the property
> is missing or the length is too small. The return errno doesn't matter
> to the caller, so no change in behavior there.
> 
> Change of_property_read_u8_array() to of_property_read_variable_u8_array()
> as the former allows properties to be longer than the requested length.
> Now the property has to be the exact length requested as the removed
> check required.
> 
> This part of a larger effort to remove DT functions like
> of_get_property() and of_find_property() which return raw DT data
> having no reference counting.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  drivers/net/wireless/ath/ath10k/core.c | 22 ++++++----------------
>  1 file changed, 6 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
> index b3294287bce1..db7444af251d 100644
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -1889,7 +1889,7 @@ static int ath10k_download_cal_file(struct ath10k *ar,
>  static int ath10k_download_cal_dt(struct ath10k *ar, const char *dt_name)
>  {
>  	struct device_node *node;
> -	int data_len;
> +	int data_len = ar->hw_params.cal_data_len;
>  	void *data;
>  	int ret;
>  
> @@ -1900,28 +1900,18 @@ static int ath10k_download_cal_dt(struct ath10k *ar, const char *dt_name)
>  		 */
>  		return -ENOENT;
>  
> -	if (!of_get_property(node, dt_name, &data_len)) {
> -		/* The calibration data node is optional */
> -		return -ENOENT;
> -	}

note that there is one instance where .cal_data_len = 0

so i suggest that there still needs to be an early return here to avoid
kmalloc(0):

	if (!data_len)
		return -ENOENT;

> -
> -	if (data_len != ar->hw_params.cal_data_len) {
> -		ath10k_warn(ar, "invalid calibration data length in DT: %d\n",
> -			    data_len);
> -		ret = -EMSGSIZE;
> -		goto out;
> -	}
> -
>  	data = kmalloc(data_len, GFP_KERNEL);
>  	if (!data) {
>  		ret = -ENOMEM;
>  		goto out;
>  	}
>  
> -	ret = of_property_read_u8_array(node, dt_name, data, data_len);
> +	ret = of_property_read_variable_u8_array(node, dt_name, data, data_len, data_len);
>  	if (ret) {
> -		ath10k_warn(ar, "failed to read calibration data from DT: %d\n",
> -			    ret);
> +		/* Don't warn if optional property not found  */
> +		if (ret != -EINVAL)
> +			ath10k_warn(ar, "failed to read calibration data from DT: %d\n",
> +				    ret);
>  		goto out_free;
>  	}
>  

this could made even cleaner using cleanup.h functionality (all of the gotos
could disappear). perhaps I'll do that as a follow-up patch on top of your patch.

/jeff

