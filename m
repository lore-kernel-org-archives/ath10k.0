Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 394B5FF60C8
	for <ath10k@archiver.kernel.org>; Tue, 31 Mar 2026 05:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=31xwpGW3H5Whz8PFsjKKjlh0jWlzMoRYXFHnb54DDmU=; b=YKR1tXkrX7i9g9tnECq1OnMSBo
	ZzHO1TjKBtVYj6157YECIP/IOXHFm6Epzkuv5I80VaBvMVvRdXIuvhK/zXOzf8k4GA+NDgAzmCMj0
	qNL2w4o0CthsZLmniPJIrNPPQMF1tUaeT8fzFhaGoiq8FaVGGTT9qbQIcBCt88JUbp34Qap1b9nYa
	HSo71p1W/7I1gmSI0KZeSOb72V4MbiXd1llERiaV5RQ2UArk9yu2Y6b0B7m7mH1gdoZBTwUp9u2ac
	+kCD6GN2PD8i3OTMnc1KCm4VjAkqmPQF4mNZEgt9AC7drKcryGfiuesKxBVGDnAYRL1nzzrPaxkqF
	cbtfCykw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7RLr-0000000CIWO-1z8O;
	Tue, 31 Mar 2026 05:09:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7RLp-0000000CIW3-3Ilh
	for ath10k@lists.infradead.org;
	Tue, 31 Mar 2026 05:09:18 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UNesRi3721886
	for <ath10k@lists.infradead.org>; Tue, 31 Mar 2026 05:09:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	31xwpGW3H5Whz8PFsjKKjlh0jWlzMoRYXFHnb54DDmU=; b=QEp2dXwz5F8spfvQ
	c2E2dQtp31YkIJnEucl2+Oc5pAvdh6LeciQ1pHrGRdLAP5bDT6S9fgwtXwD9994/
	sRAdrywyaIc6JsVwRAdAuEqC6WHp0Hzoh52DRiVZrVT2Yx2jQoKRdwQkguf+EQAS
	UpWPj74GqFQAY8/W6NNlRuVFR9YvKLXqvtXMrhtfAKeP5qgtLVW7KAN93WNn5BOt
	8138hvHVD+p8ZSyUHu1lnzk50b1KNV9GbwvzU4wjqn4NbJnEh+7wFolsyidy0XxR
	/Zh3FppVABlvNgKCgWgnuj2u4okvBiSHVcv9HxhshWhuWkvPpuYK+jCtG834BcST
	qyfelA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7pvmuv4y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 31 Mar 2026 05:09:16 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-358e425c261so6596644a91.3
        for <ath10k@lists.infradead.org>; Mon, 30 Mar 2026 22:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774933755; x=1775538555; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=31xwpGW3H5Whz8PFsjKKjlh0jWlzMoRYXFHnb54DDmU=;
        b=SQtVDM0oaKzEhEGN2+w6kM8IrEVXHOgYkDTJeXYTuRcRySuN09sC1uLO3aCQpAH/hU
         CqWIZFhGMcpU+gthQukCV6Enk0ys3TKk7eYO3fUkBPTjVh7zP4BVE6S6PdZqY50qM+hu
         WA9M5Cwq8NSdRDPgcPeq62NTeog+j8baGdAWHm1SqG449UL2fRUpfC3qpDIl2dzuJ0EE
         vCHZj9h0SRtVMPG5A1VsBR//1qaSJIEnPFqOk75YO5G0lctNn0cS2x5BcYSsIdO+r7lO
         rPf8MnsE8ggElXXU7P1xwWLYKy3DuzybJ7SQfNQmYZXtPN83MK5/MYUPeFG4ET1cWtq5
         bUOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774933755; x=1775538555;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=31xwpGW3H5Whz8PFsjKKjlh0jWlzMoRYXFHnb54DDmU=;
        b=UvqfjxNfL4QH2bhkhOEpJLIABJSD/oPaGp6BazVQCc5xqvLHVp+QbkLO9dNqLxSVJ5
         6UhRqa8wJVJgLamJ2MgxKKN6cRP5OessxwLwQhqmwyEU4uhMTXoDwgaNfe7pvhtDsBno
         laYjNJD7LhiKmGEkLLbgbVf6UpZLWflJb6CgPv6xV25/db0Y7cFqOGwouzeY4TYbwMg8
         e/r+l6dKCq1NMLX8ZFpSppreCsHw3CmBfT88Pd6QVSM5CP7tSOAwA/jp6mEITOgRptmY
         ipkxqA/wMD47T1xegeWhxPSFGY8wsvSJEE8/dmXFAuUFVduXpglgmXjebRifZbQI3ue3
         qmxA==
X-Forwarded-Encrypted: i=1; AJvYcCVpV5mmkH3VUEGm4K7nt8STYUsiF0twmvvEN/nII39HgZQfmdgscZGOFcDLYhO3JRvztK0U4fA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzIE1EQYx8E2/95r9MUVofjL5a9unUy93f3A+yXP86PeG32oh/G
	AvDvzX2l9b1+oxOMvzfCxN/ap56Q1I6orSMYBISosrzF5nokxnwMbsX7aeaEBKN5qLSKd/xGyhH
	aXE6tyZDBKc9+ssCy7KeaDJtaZNwxNlRJAReQJ8vPKGRAvVz1ME1LBJQHxFwWSwnQeirv9aXE
X-Gm-Gg: ATEYQzznjiuiCshlxAPFEcLx+YUEiWM2Dq4Q7lrMO/kD8pnXdc0uZo9zSokblW6Xhtr
	KpJKYXbSkJWiAGWgYKUx56/AlU7/JBCglIBvZTwYtD3mSKus93pPidWJ0mav8IXcFFcG9ZD9I5x
	Qpl3vxugdkbgAhUs4YnFexEi9wp1Xe6QXipDqY8IbnnaDkO+sM1BPqnUyAL7wqxgAsYjgZzuZUZ
	ItL7xZ29i52q9YQBBZpHprTVwjQ3iZi9j88Y0+yooI5VOMyDFqcIxvall8LssilwbMhBrFsfghR
	4hhANN9f5uBvt3oB2Vt0bUWesWoGRJPDpGuunaGMgGPKL+/6PpsYJfcTWZOR1lz8ZlNuBcVwJv9
	ZRUqd/3HyHcjCix+lavTfXM11tE1DC2s44a8iLj+lwjHMiXUfgqPPfozQYuNTviRnfv3azEs5sy
	iGGjX7AOn4ZlAHsSDbHA==
X-Received: by 2002:a17:902:ce8c:b0:2b0:a957:304 with SMTP id d9443c01a7336-2b0cdc22fc5mr161202575ad.6.1774933755384;
        Mon, 30 Mar 2026 22:09:15 -0700 (PDT)
X-Received: by 2002:a17:902:ce8c:b0:2b0:a957:304 with SMTP id d9443c01a7336-2b0cdc22fc5mr161202315ad.6.1774933754890;
        Mon, 30 Mar 2026 22:09:14 -0700 (PDT)
Received: from [10.133.33.81] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24265aa9fsm95009055ad.20.2026.03.30.22.09.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 22:09:14 -0700 (PDT)
Message-ID: <323b5222-a105-4701-8342-9131660fe803@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 13:09:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ath10k: skip quiet mode for WCN3990 to prevent
 firmware crash
To: Malte Schababerle <m.schababerle@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
References: <20260322124822.230492-1-m.schababerle@gmail.com>
 <20260322124822.230492-2-m.schababerle@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260322124822.230492-2-m.schababerle@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mt4J0NNYMGJwpO0gri9brT_whF3tDQmU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA0NSBTYWx0ZWRfX8OvV7lzZTd39
 cOQaOinWM4Qhd/od7/KVMh6IiWDtgWqBW5+fJuL4kdb1/p4h/V1wGKilO9vq+nsPiY3Yht/TzL7
 VCD1QF/mvbOm//Ej+JkNF38sqZfeo+Sl9o6CrgZ72Iy582DGylF4epInnaVeGogw0eiYzbAu/eO
 TJLtiNWvnZwv2E0TJ0yp0em7zsLzeMskYBlOf2rPjNMKJsQoQuK6zgpXwbfzHrVtTiEs2hhPaUo
 aZZmMVNNmcziqsZqXOTz5jaB+Dw4KjPLUjIqCFEevf1jd23DGMaR1jQwUQ/QCZUCy6sJaP7v+yP
 dhh+c3UiB0iswu4RGR/7MiKiuiGX+0XXkeLCLYn7T+TF34GDHFMMExmAURWE1QyFCWIOCrXu0eS
 1qjbSgdCr3QpqGm3mgeqN3x0o8nZJhsp1qycIOrZ5FpOpVGrhGcPKfjQvpVwZQzYteBEAI3yLei
 BJn7OjKmCEiaty4bGyQ==
X-Proofpoint-ORIG-GUID: mt4J0NNYMGJwpO0gri9brT_whF3tDQmU
X-Authority-Analysis: v=2.4 cv=S9rUAYsP c=1 sm=1 tr=0 ts=69cb56fc cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=Nm7j3lLI2G_-0-y7RwkA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_220917_974941_474B10DF 
X-CRM114-Status: GOOD (  20.56  )
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



On 3/22/2026 8:48 PM, Malte Schababerle wrote:
> WCN3990 firmware (WLAN.HL.3.2) crashes deterministically when the
> quiet mode WMI command is sent during ath10k_start(). The crash occurs
> at PC=0xb0008e20 in wlanmdsp.mbn, ~17ms after the subsequent
> vdev_create command, and cascades into a full modem crash.
> 
> Commit 53884577fbcef ("ath10k: skip sending quiet mode cmd for
> WCN3990") addressed this for HL2.0 firmware by gating quiet mode on
> WMI_SERVICE_THERM_THROT. HL2.0 did not advertise the service bit, so
> the guard was effective. However, newer WCN3990 firmware (HL3.2)
> erroneously advertises WMI_SERVICE_THERM_THROT via its TLV service
> map despite still being unable to handle the quiet mode command.
> 
> Skip quiet mode unconditionally for WCN3990 using QCA_REV_WCN3990()
> instead of relying on the service bit.
> 
> Tested on OnePlus 7T (SM8150/WCN3990) with WLAN.HL.3.2.0.c2-00006
> and WLAN.HL.3.2.0.c2-00011 (both crash without patch, both work with):
> - wlan0 comes up without crash
> - WiFi scanning works
> - NetworkManager recognizes the interface
> 
> Fixes: 53884577fbcef ("ath10k: skip sending quiet mode cmd for WCN3990")
> Signed-off-by: Malte Schababerle <m.schababerle@gmail.com>
> ---
>  drivers/net/wireless/ath/ath10k/thermal.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/thermal.c b/drivers/net/wireless/ath/ath10k/thermal.c
> index 8b15ec07b1071..33f299f414710 100644
> --- a/drivers/net/wireless/ath/ath10k/thermal.c
> +++ b/drivers/net/wireless/ath/ath10k/thermal.c
> @@ -136,6 +136,16 @@ void ath10k_thermal_set_throttling(struct ath10k *ar)
>  	if (!ar->wmi.ops->gen_pdev_set_quiet_mode)
>  		return;
>  
> +	/* WCN3990 firmware crashes on quiet mode despite advertising support.
> +	 * See also commit 53884577fbcef ("ath10k: skip sending quiet mode
> +	 * cmd for WCN3990").
> +	 */
> +	if (QCA_REV_WCN3990(ar)) {
> +		ath10k_dbg(ar, ATH10K_DBG_BOOT,
> +			   "skip quiet mode for WCN3990 (known crash trigger)\n");
> +		return;
> +	}
> +
>  	if (ar->state != ATH10K_STATE_ON)
>  		return;
>  

Malte, the firmware team needs firmware dump to understand this issue, would you be able
to help collect it?


