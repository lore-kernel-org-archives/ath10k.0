Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B3EFF886D
	for <ath10k@archiver.kernel.org>; Tue, 28 Apr 2026 14:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oEdzPlvkzmsz9XRBy398mVsjWjXUxo2umSQ5Z50zP28=; b=thCeYKXKSE+pSwAs237U8gVPxw
	FAKPTTftb7Ea/XqSS+vTVgzy0lymSAcuTTujtqTvqOLv+KfWhLChH2m0439jLD2n4Yed2bB4gwh51
	ebJP2d20RbZHDJV3Ul75U4pUIWKFLj2KJHlMUAFjJBa/UgK3PspbbI6/m4iCDkSdieJwWD/fKtCM0
	v/ojgQOjjSVJzcP0UbXXh+CwvvaSEXWYqm17Hht4KQDxDFaKuAkcp5/oTsLtd4y6LLJBxg01LSUmC
	DCvvG5r5bk7l2taYclut9Ivz4vP2CqC3RXVIU2kLOM89arIeET0+NdVmkP/WDCbVxa12oMxfUGFlw
	/Ni2b+FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHjLd-00000001dwJ-1OrT;
	Tue, 28 Apr 2026 14:23:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHjLa-00000001dry-28lh
	for ath10k@lists.infradead.org;
	Tue, 28 Apr 2026 14:23:35 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SA3w5Q3275204
	for <ath10k@lists.infradead.org>; Tue, 28 Apr 2026 14:23:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oEdzPlvkzmsz9XRBy398mVsjWjXUxo2umSQ5Z50zP28=; b=PQ+wYtuQpw3oPdCo
	Gv/gVuNnwt/v0F9FkMF60jbuMEHY4L14JYQaQUOwHFH1G3xmd8JGROy1iaQc3qCf
	xacYJ5iFZhhEvfINckpnl7pe5XdKIR8RrXz7NmcKQkcfYMsZ8670/KE+i9433HVY
	I3uzks2RvFKVhlkSnnkcQhsQxSe6Dwpsp2xugO+/dXf+pDwjajCKcGCmOEUySDpy
	Q7yvsCalSlXcw5IhBPFHJd69TWdMafW4FPvkDPWc8Wd8Qr/L/Dxn3e4F1h1+zzVp
	2Opc/mqH2z6oKmknDbAJV3AgLHGknJwt8JpiVaaMnqAYbOAWwooOJgnk7FlbifJU
	5umC6g==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtttjgy7b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 28 Apr 2026 14:23:33 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56fb91588deso7089735e0c.0
        for <ath10k@lists.infradead.org>; Tue, 28 Apr 2026 07:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777386213; x=1777991013; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oEdzPlvkzmsz9XRBy398mVsjWjXUxo2umSQ5Z50zP28=;
        b=G0GtA1vryQTfpB3uhJcrw6sztCBAPZdqNZKXUb9mvYFhcG8fNNZKlCDIjMLPTL/sRc
         AHYCBLKssrLqd5cOBtW9vV/9+42lJa3diC3pJ74QKpLrWIxPKYdFo/DBKOBhOJiAUL3w
         KY4g0SodnONSY/wXAPRfWaroFWtQskyINRFTi+jNk4c/xDb+q/DAKX3xeBE9pLGueTRZ
         NcOtVda1PVMP1KDPFy6uR94oqkjaXFWQ2D0yH2ZTjBZqdZGauTlaOhB+iprYeO4FuMnj
         OaFa5ZNvWmDqZpBqW0duvnlDBNXs2ODP2lMQY27ODc7ZcrZWCQG+coqHZQSHbCUi9hY5
         ODRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777386213; x=1777991013;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oEdzPlvkzmsz9XRBy398mVsjWjXUxo2umSQ5Z50zP28=;
        b=SJ6R0pxfel1atx6EggUN56WmC/1Tyc54IvW6YOFCPpwd5n7J9U3d1X1B7r2g1XwZGj
         Kq39TO9zLbJTgkYb90n7orol+a3Ozuq593PKHRcPCAKN5EV2KSYkAi9jjVTdcilyaRV8
         /5NhQ7VvApoZx/u0wRy2VgakrMg7npBjR/H7Ar4oJ2ZslLzc/viG7OED1EMmfT3OXpkW
         chKWehtck3PhbB8pEfvWRNsMuCcduOduu1bji+ClloeisZpKFvN72o6FYMI4rxb60LSX
         /AXDkoCbpyoFwIS/a8OE4YyT2DvDz0G6VjBqTPlbAa9EMw1qXzOxAr3P6nlX7WrOqVaR
         35Rg==
X-Forwarded-Encrypted: i=1; AFNElJ+C1f2taqa61CKFLbc67pczp9vwgbAk0IaIgmhkmJ9fdQ1SqXTZLPZDOG4I6qsEsSs/7mIf/fI=@lists.infradead.org
X-Gm-Message-State: AOJu0YygqdUE4aJVBl06NWF/2BdBV/3byyyJnZLbgwH5OIHCboXSQR4e
	43EOoxd0jWZ4Vsu7juzqlpf1o9Q2w+xSwArr/2zELCNY9u/DHQfpfWwaGC9SCM7pFJTW4lGlSNK
	QCotU96Fzut1CqKpYRlo/CXvFuGeuPdsWJdbxraWl+y+xokhyTl+WXfUIhC/GbPst
X-Gm-Gg: AeBDiesKeCwBlsDNi3tJvc5WDi2ZCd3J/ugy5kBIN4oBk8aoUdungpYu6E15Rierrsp
	dtyujHRLxKayu+ZxbZXNwPfCNRkXz2+yAQeoyqWeeTi8uufVw5R8a/t2AgyEvqtkj4Zd9xqs6Rm
	CW8Df1D/KTRoI0Ozg/C4xGzGYYU63sgxexoY0RnDuyiVV6b7qx4jkJ+Sv0DtLkvNWnBjcVWL5Fm
	XcSmNyLgL/kT+yOydUohLuUUGZERIBnT4dlTXjt+NJdl/ZGo2lHCeTa79G6YHNBg3gKKYcDssxQ
	24LazePkvoCH52bMC8lAd75+Ifi4I9nGTGDtEoQd5fDXPvzGGIX16XCycpJrkNngpwA9MSmLaSG
	2FDeV1UGLhLav53d2Y6kpMEuuXAAD2iKy9pAT8716NLgWpZGUqBPQgLJcnK87PVTFnNSCl+jl/F
	oYSOmEiZQl5pgwuIVocdl87vUdjXo=
X-Received: by 2002:a05:6122:4d04:b0:56d:b50d:3ee7 with SMTP id 71dfb90a1353d-573a55191e1mr1867560e0c.2.1777386212629;
        Tue, 28 Apr 2026 07:23:32 -0700 (PDT)
X-Received: by 2002:a05:6122:4d04:b0:56d:b50d:3ee7 with SMTP id 71dfb90a1353d-573a55191e1mr1867307e0c.2.1777386211467;
        Tue, 28 Apr 2026 07:23:31 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:653f:4d28:6a78:a6ca])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80ba9b8c8sm107072666b.48.2026.04.28.07.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 07:23:30 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 16:23:13 +0200
Subject: [PATCH 8/9] Bluetooth: qca: Set NVMEM BD address quirks when
 address is invalid
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-block-as-nvmem-v1-8-6ad23e75190a@oss.qualcomm.com>
References: <20260428-block-as-nvmem-v1-0-6ad23e75190a@oss.qualcomm.com>
In-Reply-To: <20260428-block-as-nvmem-v1-0-6ad23e75190a@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEzNiBTYWx0ZWRfX47P9zBGCyKLn
 pt5NG4MGYBrtma1MBB96/sT/K7qH8IuU7zvW1zrCCEe9oyhX93eLcLlRveSYtGh7Ii4/rkaNilg
 g3MomEcJKRuZ5YISHiz9byGz3w3nl3e7Wnt6m37KhY+q/HJtM5r9Cy6wTpHjxLEU468msJwT3Ei
 FwqGURLXVjYSl5eQzfGYKYQTgPctLk5OjmxkAbNCrRFQE2wjJEGZh/i/bgBMTDuwA9Jq8dkZg5r
 AxRfIPeMXixO0yCM9qgH0Gxr1xGzUizxcGxFU5JfdchdL1r6ditTsYKda2ZEnd4yABIewDo+IJH
 RR74udThX4frHtNOQAb1SDhjWIjweGj5jdsE1l8rDEsLsc+xRCzRllMWetcxfpibJupu2x+8Y9h
 u5NCyBqWiIC8kSpaZn2WMxbFu9zKrUA0sjdAlLBIooGu1BlaYq5j352aXIyuTiG9mRuA4HRElbk
 XcdqL7oMZmhY18G147g==
X-Authority-Analysis: v=2.4 cv=TZKmcxQh c=1 sm=1 tr=0 ts=69f0c2e5 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=99fXo_IpyjsNTNVBUdkA:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: Plwh4PqhAU7a8t_tk_zQTXph_PI6QwIK
X-Proofpoint-ORIG-GUID: Plwh4PqhAU7a8t_tk_zQTXph_PI6QwIK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_072334_713845_14DEC5DC 
X-CRM114-Status: GOOD (  14.19  )
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

When the controller BD address is invalid (zero or default),
set the NVMEM quirks to allow retrieving the address from a
'local-bd-address' NVMEM cell. The BD address is often stored
alongside the WiFi MAC address in big-endian format, so also
set the big-endian quirk.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/bluetooth/btqca.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index dda76365726f0bfe0e80e05fe04859fa4f0592e1..df33eacfd29fa680f393f90215150743e6001d5b 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -721,8 +721,11 @@ static int qca_check_bdaddr(struct hci_dev *hdev, const struct qca_fw_config *co
 	}
 
 	bda = (struct hci_rp_read_bd_addr *)skb->data;
-	if (!bacmp(&bda->bdaddr, &config->bdaddr))
+	if (!bacmp(&bda->bdaddr, &config->bdaddr)) {
 		hci_set_quirk(hdev, HCI_QUIRK_USE_BDADDR_PROPERTY);
+		hci_set_quirk(hdev, HCI_QUIRK_USE_BDADDR_NVMEM);
+		hci_set_quirk(hdev, HCI_QUIRK_BDADDR_NVMEM_BE);
+	}
 
 	kfree_skb(skb);
 

-- 
2.34.1


