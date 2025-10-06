Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 769A2CAC5B8
	for <ath10k@archiver.kernel.org>; Mon,  6 Oct 2025 16:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aCx5vCUHglohbFtZcwRnf+9BWw1KFYF96ZfRMd8b8e0=; b=Rz6K2jrLsH7/bGZJ8rElZcj28b
	12G4g/2zyd/5CpVFlM45TLuxC62XOKfOBRv/69X2+JfILKNgDCC8+RBpEDYVv0+ybdi0eA+bv+7Vp
	ur3v5oWwoKw7fvUY9z0O97iUhPMCEmIo4+GsYdpwuuupMT1m8W60RWRgvEoEege/eUzzhBJOAUnL6
	gMYBEIipZo8iXizVK3eP60vsE9D/J6JfiRxC+OhdJvLeR/50Tc4Pomdqakm1AP0Y5kMaulwkWiWIh
	qEwy5XSBRpBTVIweqAGDn3aMC/ymsjliwlz1ETrBL1HRHaBRLaZVl44O+Ng2uVCiOXxiUrHNT1Tcj
	xIIeDNXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5oRJ-00000000S0g-3DRC;
	Mon, 06 Oct 2025 16:51:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5oRG-00000000Rz6-3Tqn
	for ath10k@lists.infradead.org;
	Mon, 06 Oct 2025 16:51:56 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 596E7VuB012993
	for <ath10k@lists.infradead.org>; Mon, 6 Oct 2025 16:51:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aCx5vCUHglohbFtZcwRnf+9BWw1KFYF96ZfRMd8b8e0=; b=hx7D1XsHjCv39C4W
	CEJCdZg4wawRx/rAy+XwOXJfKjLtnSOjh5QrLdsKBW7S4Z6A6NBQmFrIkhUi/6qw
	sLM/e+huxK+FWs927m8kmqbcD9Z8zyFctqX6NmC/Fn12Rx0WBuzhJcaMxgGSvzHM
	D8Fm47Qa6KFGcJXzJKcB7V6/ISlmBIwA58KERmTP0HNA4nooGjRe7TxgyZTdUhXN
	Di6t9lbE9IHW0j9+P5OtM/dTU2itDNzqNvyEBoD9M/N8MmPnKuul/x3kwzKXuzFH
	elevAkZzWekMCL5Ve2EQwmHd8k/tZkyrCj5GjDVQK3fZkLvlfaQndllPtcJw36kK
	qXGDew==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49js9dvqrb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 06 Oct 2025 16:51:53 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-781269a9049so8696170b3a.2
        for <ath10k@lists.infradead.org>; Mon, 06 Oct 2025 09:51:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759769513; x=1760374313;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aCx5vCUHglohbFtZcwRnf+9BWw1KFYF96ZfRMd8b8e0=;
        b=YDVqpwWAiy2fT4BowwPdZfU2f54W6q6vSxb1VQw2r8HE/x4ZHZiuvwzYRPC6mhbaNi
         CEcBsc2AzS7MQr1xOYGRmfKvfP1CNX1p6Cm6asXQvuh5tGYy3u0Ib7Q1HBvmC+1fenWn
         mKEvPXjcgwbGuPtsLmDEXZuhc89wVz4ETMTLbulW9d3pDF655qUMH+r0ZkqsNGXSuOmF
         GfphcBcTa6XzG+2Qo3mBnWP2CH3hBqtcRYWp9VxnHKWFh8mspoEusM9XpzE9xhMHVPKO
         EPxGQoVFuJoEVIR2N7RVZB7UkkqOg7reMGIvv7ISz2azLQebHKYmaDSa/ya1kf0rx4x/
         4U2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVcPmjHC2eCC0gwpIfOlztdXIhk2Tq5WnaOLmYoAQKlgilWmCetuIVrswB5kIpVryd2o2dgaNI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7I6ogI9QUAJjli+CSJBXcK1PdhEVKGYMeiT+ZEznqklxL8VqQ
	vWskyEGbR4XFcIvMxJYoGAOFAFhIY40SafbzlOYTA4dAzC89trrF0wOEnhBA+ZMNa/1j38/mcqt
	UJzl0Sn9rGE/eb4W3P9RVK6WqMaXU6aiTbp8xPkycnIiBFr+NXyDC6NwuqMZSh72q
X-Gm-Gg: ASbGncvF2xlswavc6sgzUVsz592wyzULGVcrEBFc5/e6hw78pXDz/Vo7nEisF1yIkTz
	i09Yf2udxiJRCEqpv03iNRQFJ/liyHnp1a0ClgyF0xa1HmIvXMQSAR4O1ybVhn6VaZHXBe4l0Zy
	FJzLsNzul0vbbLfBPuiImpiJp6HkTmWqaKlVCKhnK6Xwsf7NKNy+fjneQU3brPjByOofkV/0fT2
	e/eNgudBv47Gy37ZbFoBg5uE0D/dzDQcPZlmByytwwziSWdcyfZN85rN6vvs27R/bXi51OgINbE
	BVIdzS6mnQ7x8V4kUxKeGOZl/Ctgs0xaqi2hpJ5EmeuQZJmzwH2JC286c2mLIrCRjYXchXP49r3
	5wf1lDQ==
X-Received: by 2002:a05:6a00:cc3:b0:77c:6621:6168 with SMTP id d2e1a72fcca58-78c98cfe33cmr12970352b3a.30.1759769512650;
        Mon, 06 Oct 2025 09:51:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjnzLkv6OnvbfH2XheORbcoIkytkatzvBBOtJvnWxceAZbgVilRU6aprK7/tQRV5PadLpY+w==
X-Received: by 2002:a05:6a00:cc3:b0:77c:6621:6168 with SMTP id d2e1a72fcca58-78c98cfe33cmr12970329b3a.30.1759769512183;
        Mon, 06 Oct 2025 09:51:52 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b0205336csm13293176b3a.45.2025.10.06.09.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 09:51:51 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: jjohnson@kernel.org, kvalo@qca.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
In-Reply-To: <20250926195656.187970-1-loic.poulain@oss.qualcomm.com>
References: <20250926195656.187970-1-loic.poulain@oss.qualcomm.com>
Subject: Re: [PATCH ath-current v2] wifi: ath10k: Fix memory leak on
 unsupported WMI command
Message-Id: <175976951148.3451922.9085792171850947526.b4-ty@oss.qualcomm.com>
Date: Mon, 06 Oct 2025 09:51:51 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=Hrl72kTS c=1 sm=1 tr=0 ts=68e3f3a9 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=wXeUjoMwVmF5acqhv3kA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: i69eBXIZDPOJVxhQzfa4Cpq4qH5QGMd0
X-Proofpoint-ORIG-GUID: i69eBXIZDPOJVxhQzfa4Cpq4qH5QGMd0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwNCBTYWx0ZWRfX1RINGYCh7kRq
 ZU3tZe777YkJ0yItcuX6FQayKVvdb5Hqr/ALly2wuFTUDNEpcIXreu7INEl3EGTgh8SOeilrWmL
 2pQSpy7MXV9BoOpTNcdXXiTJhUuhXPoX2wNdkXAzA6116G3phPs0q1X33YOxTw8Jtm9cEgrd2Pi
 sNnIsVwLDdgGlWziJRSdiFeYzp2rpssKxvft2lfq7EoxUMfxSGNP7vA1K5WFjZcPJDTcpeiBarO
 X58R7Sgpa1I355ijz03OQg1r2ZHZ4ywGnSziQu6n2tA771BflGlqQW0z38MycfGi8ZsMDqS0p9m
 fnaIqqBielN5A/IlOn805j83XLf5Wmrb2TzSvnCn+F+A9P0wJo+LvI2zOt9s9EUeihTZQJaU2xG
 cHUGY3w0o77lh6wDruxmt1ONP2uT3Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_095154_878054_ADADC9B9 
X-CRM114-Status: UNSURE (   9.26  )
X-CRM114-Notice: Please train this message.
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


On Fri, 26 Sep 2025 21:56:56 +0200, Loic Poulain wrote:
> ath10k_wmi_cmd_send takes ownership of the passed buffer (skb) and has the
> responsibility to release it in case of error. This patch fixes missing
> free in case of early error due to unhandled WMI command ID.
> 
> Tested-on: WCN3990 hw1.0 WLAN.HL.3.3.7.c2-00931-QCAHLSWMTPLZ-1
> 
> 
> [...]

Applied, thanks!

[1/1] wifi: ath10k: Fix memory leak on unsupported WMI command
      commit: 2e9c1da4ee9d0acfca2e0a3d78f3d8cb5802da1b

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


