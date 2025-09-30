Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 260D0CAC5B9
	for <ath10k@archiver.kernel.org>; Tue, 30 Sep 2025 05:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H02vmDbMMdEjOybcZvmm/GRKXq+gslFZMruW6xhFCYw=; b=4VakY1OOqfLonpFdH3/x/qT4HM
	0j6eCtzpWKCK+j/l+tOqLZydE/paC9016sJqt1Jbto8MMGBzQRA71lB/UJQFWOEFR8/8peu85bqks
	ieegpsjg6ZDbxPeSSMuo2/7fCkah2EZKw0Jgm9PPICFoXrz1ICu+qCr3yagn1vo9TJvpKIClKcjrP
	kpJwt3/AM71dgXVlKPdOZikfUmb/S+ZGh0QYB/gv8HtkaDn6M9nVSlnbp9kF9ltOTqecy8iNWAqKn
	Ee/NdAuODNua6AA7APN/IQlolTRJZ/QdE47P3OoXS1fTKLskqvalhMj5oil94kR1FVl7WHGHMaFZP
	SOxnZX0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Sj9-00000004El8-0xiz;
	Tue, 30 Sep 2025 05:16:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Sj6-00000004Eko-3Mcl
	for ath10k@lists.infradead.org;
	Tue, 30 Sep 2025 05:16:38 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4HN1i014639
	for <ath10k@lists.infradead.org>; Tue, 30 Sep 2025 05:16:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H02vmDbMMdEjOybcZvmm/GRKXq+gslFZMruW6xhFCYw=; b=E9fJ0gkqmULGu6r6
	JNh2xAYq8riuWdIMQ1ZHtgbxktQ2TmYvn20fwTS3yE7n3xV2UOYYkah8jIb5Hywn
	4nbIqkPmzMILGvYO+2nGelL9v6EjTjK0YoWggF4dxIlQRSn2AY/BezvVD3+fhDug
	UwClFfQ2kpCPcciG0d2MyrpE+Y43nHHNGSnR6M8uhzT0wf9Q1ijt4kyw9KFeMb0q
	goJMdq9SgvAmsTtg8szSLSQifTBYEzUT/cZzOvGvWBvTvTl7o7TJcGwCDcsGeuf9
	YoAJgLjKM99NvJUebsp98rVWTogoK6sTZbN0/LISXdkgOzo9UC5ZKORBpsHU9nLM
	vLLEqw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6vqyqnq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 30 Sep 2025 05:16:34 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-27ee41e062cso51103725ad.1
        for <ath10k@lists.infradead.org>; Mon, 29 Sep 2025 22:16:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759209394; x=1759814194;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H02vmDbMMdEjOybcZvmm/GRKXq+gslFZMruW6xhFCYw=;
        b=NiUXweyXZ8Vcix8XzIKJHwLDCYp9LFH2YO8CRIT0laU4ZYffbk/1ofxmf/g14IYca5
         vB7XsvmqCMaYtdkw6rWBGhT9/V6wJQ9+iH6H41ySHG3Im7JAbn8vLq1vH4nivZ10e94y
         /AaEETwWYDA3bcscI2Hk31J3+j14tyaJQm64I3Qj7n1XX44Yd41YEMLU5GTFHBXIeYSu
         cQnAmryGg6lkL94JDXoxE+SXis0Rm2w6ma473DZ8uqMy+7wbanwlsNNuvGahMm/4o5zr
         VQK8IH6IDRF6606yJYWjFZsw6Z6baq0LMBuDbbpDh82Ghe6K3yiiy6JPW9f7zcNyoHkE
         Xgbw==
X-Forwarded-Encrypted: i=1; AJvYcCVPnIRnL8YXdYhDZIOcb6RMf8RqxZVa9cBFip75ifekV2TdlgNxTHe8tE3xcFsR+aPrLUQquuE=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywhg+XbSIP8RYFTf83NMIcYfiV+JYWTUMZ81aZ4ymcKn1KywXc8
	VjvnZqe/r6ub6wX3UtoiWJjG6zwWitOefynjJEitxzaGlJrpHRA1tW+6K9FEhS+RJ3Z+G8E9tqb
	3iyygKBk8dz3Dlvwk7bpnCaUFgZ6n1IK768Wpe7iz/OqrqoSReNIL0b6B0leifXwgVM8VYPSt
X-Gm-Gg: ASbGncv57SdUxnEjGs/eTGlpNUtrRkcynQX7t7ox/xu/AGu/pydzl5L/qT8eMdXxCOv
	4mE8WaA6bmOiibnqFdqTmBoAF6d9fNmOJw5Cswe+DeO3Bg7rPDBuWThFa66AjHNorwrX5x6IHed
	9bjiiboe634FDzHk8inTw5jL3azSmFqMU6NamrSgaf/uubpMKi+9EVT694jSTvkGNtJCOtJFqbo
	zHDAxtPUPortjvqL4CHG9oN1eWQiOlMEXn1vqfMnhxOtQeMJCD4jKytuIfzTcQnSpKuJ8+vLXEM
	yaB/TLwVAGSK7EUx+T/92GDWDS6x3HJa90+pd363b8CP1h+egicxqJDMs8FRcTuEVXksCIUySmS
	nb32XNK/hycSy25mg3ERKlLM2t85ClLW9YwhFCgXlkAU=
X-Received: by 2002:a17:903:3d06:b0:269:8f2d:5221 with SMTP id d9443c01a7336-27ed49b30cbmr197691455ad.9.1759209393647;
        Mon, 29 Sep 2025 22:16:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElVv7EYDT7b5Mi2v0IfgJsNyuquhPIoQt8a4oukRcnZZVOR8JHadilEM1KzwuxceOirc0osw==
X-Received: by 2002:a17:903:3d06:b0:269:8f2d:5221 with SMTP id d9443c01a7336-27ed49b30cbmr197691065ad.9.1759209392942;
        Mon, 29 Sep 2025 22:16:32 -0700 (PDT)
Received: from [10.133.33.193] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed68821d3sm148402325ad.83.2025.09.29.22.16.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 22:16:32 -0700 (PDT)
Message-ID: <3033dd6a-8eba-4ff7-9ef3-b311b64e3d6d@oss.qualcomm.com>
Date: Tue, 30 Sep 2025 13:16:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current v2] wifi: ath10k: Fix memory leak on
 unsupported WMI command
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, jjohnson@kernel.org,
        kvalo@qca.qualcomm.com
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
References: <20250926195656.187970-1-loic.poulain@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250926195656.187970-1-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XBsoEJQDYplhCRoiBrOnlbyKb_gsa9oW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxNyBTYWx0ZWRfX65Cx6HbZJYue
 dcxUplpQb5M3tdz6FLUV+xhEaW/BrPpzjPBoZOM3AOIiwsjgdP0JlgDcqe1GwaKIWesnGiONqqy
 uJiwSyNzSLcpiVV639GZoG2ENQ7LUk/FkgnD4nDZP4o9PtAliain0lxz5fkxtWTkd/PZ7/dBGRM
 xl4yIlgknCDAW8cTQPgZbORAPUU9nARsDQxUHB3nUwZcQ3wqu7JAmaqDV9fnY74JQ2cMCu/Wkv4
 fUuuCREShXe2utIzT+/5WPvE8IztK699uZK9ntOf8rQHLL4faXSCfVQTjl+DkilCTI4tYxnRW35
 OAwLuX55uFCsh3+VehPls3b7ovMU+Px0PYs5jSygPQmTYes4m3vxnoQEXduG42l7qP2ci0GSqYT
 LO79l/CkiDyQAo5xMvCw2/L5SbF3ew==
X-Authority-Analysis: v=2.4 cv=IeiKmGqa c=1 sm=1 tr=0 ts=68db67b2 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=-TLifRbWatlCRcOkvmUA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: XBsoEJQDYplhCRoiBrOnlbyKb_gsa9oW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_08,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_221636_901133_FFDE91B0 
X-CRM114-Status: GOOD (  16.48  )
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



On 9/27/2025 3:56 AM, Loic Poulain wrote:
> ath10k_wmi_cmd_send takes ownership of the passed buffer (skb) and has the
> responsibility to release it in case of error. This patch fixes missing
> free in case of early error due to unhandled WMI command ID.
> 
> Tested-on: WCN3990 hw1.0 WLAN.HL.3.3.7.c2-00931-QCAHLSWMTPLZ-1
> 
> Fixes: 553215592f14 ("ath10k: warn if give WMI command is not supported")
> Suggested-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

> ---
>  v2: Fix typo in commit message (s/responsabily/responsibility)
> 
>  drivers/net/wireless/ath/ath10k/wmi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
> index cb8ae751eb31..b4aad6604d6d 100644
> --- a/drivers/net/wireless/ath/ath10k/wmi.c
> +++ b/drivers/net/wireless/ath/ath10k/wmi.c
> @@ -1938,6 +1938,7 @@ int ath10k_wmi_cmd_send(struct ath10k *ar, struct sk_buff *skb, u32 cmd_id)
>  	if (cmd_id == WMI_CMD_UNSUPPORTED) {
>  		ath10k_warn(ar, "wmi command %d is not supported by firmware\n",
>  			    cmd_id);
> +		dev_kfree_skb_any(skb);
>  		return ret;
>  	}
>  


