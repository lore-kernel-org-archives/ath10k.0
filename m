Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1DFECD37BE
	for <ath10k@archiver.kernel.org>; Tue, 12 May 2026 05:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R3WVS27hxBhKrbgJ3+rq5wwXRFIK9loO1HMhH90xRqs=; b=cqFeIQnw+uPYVmpI0qj6fhGrhM
	y2J51V2OCm9X5fg9vJSEcjHu/OjnI9AmLT41YPp3aMGuY1Dsz1GMbAPSiopN8qmOBPvH0HH+7bK9g
	cbOSp8vc3DvSmEons0URizk+hD149WU+NhaF5rwQhDtbUt2ECCwHApN5q25hW/Ut7XssnRsRSNR4O
	OUDXMGaA6ahTu6PGO9xzcPva8WC31RetA2w5eHmxv6AP6TqrxyFoH4L4potaJTDVpLmNyFBy+rhj1
	dkljm48uvVqc6+vruZ/37cV9MMULgu80ihx9zX1LS0L5o/sZq5jjvQHqvN/H5lLY5ABgPo8z+adB3
	6GVrStsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMfIx-0000000FXJY-0E9s;
	Tue, 12 May 2026 05:05:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMfIu-0000000FXID-1JtH
	for ath10k@lists.infradead.org;
	Tue, 12 May 2026 05:05:13 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C54NmQ2994872
	for <ath10k@lists.infradead.org>; Tue, 12 May 2026 05:05:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R3WVS27hxBhKrbgJ3+rq5wwXRFIK9loO1HMhH90xRqs=; b=dSFNvU0BI7IGOcSm
	0H6pJ6Mvfmm9XNLiNyQo/39EqNXgU61zDQT3n2iBYuKJ8DIpaPxTkhjPOfjwNvLz
	8hPliQTXIDI0lOOiXhw95ALFPZasz+luNdBrkB+BHIczgwA3JnIHcMXwxQ1RkxBm
	jN49lezAmBkvAcXOzI/ChrY/wYV8aRi14yMmetM11lrfIct+YZAA9gPZg32TzZcA
	Uiu9NRIDyEO4eFX76GxA9/rZiYTaTrVe3xGsKXwxK+H0zzB44Wi9aVmJB8xTMexZ
	FHsOi0m+fUNsr6Tnz267vBhWlps5CYP1T8f0Ll0BYizPl7oehY3T3wWDA9smbDQo
	gRUcAg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv0sj6n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 12 May 2026 05:05:11 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-837c4eb3bdfso3457676b3a.2
        for <ath10k@lists.infradead.org>; Mon, 11 May 2026 22:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778562310; x=1779167110; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R3WVS27hxBhKrbgJ3+rq5wwXRFIK9loO1HMhH90xRqs=;
        b=dffMLRGxCsdJYvAQ7Js2RqAvsKziO2KJqT0BZrR8MqlFeSOyuQkBTkS2J5u8v2Ob7Z
         K0PE5BdYchVhSXjo2/gZB4lnFJHt8cSixlUTTOM1cXdS2heRfHKFxK/Lk/i5f9nbYWnP
         Kg5mlFTO3dmXQa9fTg9+CQL6Bonll+RDFwW/HpiUmJStbDM7YevqQGb4ZUj4W40gn5ot
         0NRFuTtRU/0zuMBFuxFC1m3sm5mTrtpVtS0f3zMyI4IJtbXT2Yf214KIaqusBV9cxLpE
         PcFwOJMXJms92Q5m/6dC+ezIFOQyRqC3/q3Zd2Ufe+7Jqlfo7RcqaikKCPY3Lh8aO44v
         lRnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778562310; x=1779167110;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R3WVS27hxBhKrbgJ3+rq5wwXRFIK9loO1HMhH90xRqs=;
        b=JeBYHdjIIbJSIxmWrwEIepwjm+TWLHsFV0bWTdqiBcQEiLdZS372rH1/2oXWWsW8oE
         w15ZB+zIa0SwGwIu500SgdIOig6zj5ztaqV6IM1Qmb94ojw7C4cfaMtX3Q/akMhvuUxs
         /2fu1yx61FgIPTlWON741vb7Q+BcwpuKbSS4zMajbqvYTJb7/kCfXcWRyVEwLRoPPkGd
         OJR4p/etliB31gR84JZdIlyjcplRvuTUl/ZFzjfXTY5B1o0/MxTxw1P/hQlrBAAS8fk1
         0JrdmZCgK9mT7Kw7QUC4yDmGD9IuJ2S4r0bmiZ145nfNeE/IIsM07uSKcx0hCqmb7h9u
         khaQ==
X-Forwarded-Encrypted: i=1; AFNElJ8MzkXI5g6aBB2izeFOX74eWZsKy779qqEDTnnqhLEkTd9AIYkgr7XMT29Eol1ocHW/Qw2vq/Q=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0J5ht9e4m7M6tbE9AA80rhFjrsxHPACLad8xXGMYT8WCZYgnb
	Bd6fejXMEe4nZQPIp/kk9Xvu+hsLsSCjKGVp3Ty9TD9eemTaEs31mkLj8MlLVavS5uRjkY6hLB/
	F+1HAIWGf0Js96o5uTKZkzGoNITFm9vWYQ5s6hTY86m0fYdw+lQgp6A3UmVDFfsp86Dff7Jjk33
	uiUQ==
X-Gm-Gg: Acq92OEHNeDyTPMb3ZaU9tNxdqIBjsXVCiCqaiLdPxTm1BF/ikuwAmKGmqHhSZ23cUT
	yCjgxyH14TXeFIsiG6scvGmLaCnsY7s5kc2oMuLLU5YOAi9TeGY/B/QXjMzP4oig9hPTVLOY81M
	EacES3JM5cxHsKTZ03jHRGqmp5B31cBcCD0it8IaX8qH5waULP9FCQVk2cC0R5EARd5sG1ZT8UD
	qYvXb9XLWvaV/R9QtrBhXWs6AAtNTqrgA2sTt6nyfTtshEvSn3I+EwU+Gz9D8Rlw6JTwMv91xO/
	9gQ7Q3I5gwlB63ty23AP7rCw/dKcitAV2sXu6FAX2pPCnhqhf5v9nxsF1D5NjKkVdZUItIsuTRU
	b5/wLVm2/C5xJaVyruJsHp6A28v+0xS1iAO2WYE1Fsa8YSwx1L5XhY1VQ0sR4g//oce5abNPxGv
	9jH5rlkkW2BUdJ4fBKE8k=
X-Received: by 2002:a05:6a00:a0a:b0:82c:8c6a:682b with SMTP id d2e1a72fcca58-83a5b9d81ccmr26070542b3a.19.1778562309673;
        Mon, 11 May 2026 22:05:09 -0700 (PDT)
X-Received: by 2002:a05:6a00:a0a:b0:82c:8c6a:682b with SMTP id d2e1a72fcca58-83a5b9d81ccmr26070510b3a.19.1778562309138;
        Mon, 11 May 2026 22:05:09 -0700 (PDT)
Received: from [10.133.33.178] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965d35b3bsm20464683b3a.24.2026.05.11.22.05.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 22:05:08 -0700 (PDT)
Message-ID: <ba888d18-6b05-45fc-b8c7-a6f5a5470342@oss.qualcomm.com>
Date: Tue, 12 May 2026 13:05:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2] wifi: ath10k: skip WMI and beacon
 transmission when device is wedged
To: Kang Yang <kang.yang@oss.qualcomm.com>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260428061737.37-1-kang.yang@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260428061737.37-1-kang.yang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PN0/P/qC c=1 sm=1 tr=0 ts=6a02b507 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=EIYY-h-vi8t0s74smRsA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: qtQvRWkx6zrRxvFnhPwtGzzhHgyuOLeh
X-Proofpoint-ORIG-GUID: qtQvRWkx6zrRxvFnhPwtGzzhHgyuOLeh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDA0NSBTYWx0ZWRfX3TCwEI/JPN6v
 uCFrkv/0CJN9JZAwL6uMgYfQ8Ik+he/68pJtf0Cdv6v9sOCV65eU15OAhQX/gTA3i9Dz9q/Px/+
 6jgJ54YhD5YqlErcIfkKlNbLfeaSxZ8Xmtwv4H+ntP7a0XRU0zSHEK9Z72EkHCkJ0bON4dBoqt/
 kpYOCoszp+sAhN2kNcJnCvAU/Ucig0bGyI7gxu2QjSyukelnX2QtR4+X2P1D0r+ZDhBmD+WvK8D
 RcMcmq1rDFGVL6yj5QPRoj9H6oqkLafeXulZJCm1YOAdDe5Tb6BZakY07huGnNhVQAeRtJ47rV6
 KakFrMRfx7Njvz4nFSk1t1kDJI7S57YiBxLraPY3mB/QJu9zJJvSgttEz8HL2HQKdtngz3qBI5x
 o6svUiz8nLnb9BaOpLfNQ88D/nTzPZAc54hPtdT9SxDxVQmdHExFQykKXvHA0hGglURtyyrCZPw
 oKq5LMWM2VbCC3ISNZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015 spamscore=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_220512_478259_02DE1940 
X-CRM114-Status: GOOD (  12.29  )
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



On 4/28/2026 2:17 PM, Kang Yang wrote:
> In ath10k_wmi_cmd_send(), the current code detects ATH10K_STATE_WEDGED
> and sets ret to -ESHUTDOWN, but still proceeds to transmit pending
> beacons and calls ath10k_wmi_cmd_send_nowait().
> 
> This can lead to incorrect behavior, as WMI commands and beacons are
> still sent after the device has been marked as wedged, and the original
> -ESHUTDOWN return value may be overwritten by the result of the send
> path.
> 
> The wedged state indicates the hardware is already unreliable, and no
> further interaction with firmware is expected or meaningful in this
> state.
> 
> Fix this by skipping beacon transmission and the WMI send path entirely
> once ATH10K_STATE_WEDGED is detected, ensuring consistent return values
> and avoiding unnecessary firmware interaction.
> 
> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
> Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189
> 
> Fixes: c256a94d1b1b ("wifi: ath10k: shutdown driver when hardware is unreliable")
> Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


