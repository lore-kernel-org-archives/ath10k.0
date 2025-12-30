Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC839EE01F6
	for <ath10k@archiver.kernel.org>; Tue, 30 Dec 2025 23:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GaHFmXFU2LgOEbPPkpReuSY4xCJ4+sCSY2NisbXzuSg=; b=Kp68BLUfPWWu64k8PaFhlDrv2+
	ktMMEuF+fPSh2wZWA/mTPwtWLbA+1pgPxAHSI0R47iBaJE7NuG9WT6g5/lBsIEpDms4gvL2XqQXru
	LV3znMimyJd8U5/AMEi6zmP80BeD+XHjCl9uj192zAb3SySJPhI/aGynwURwfFqN2pOmkGWtVC55s
	NTUGsBkPsHLfv3prwsp3H8bmUVa+xNFw5tY3r3MbfBK6hk85Y6YG52DbJhMjfiw1hrSThEx4zExbJ
	MwpnsfdFmzOptQjqhiYWmP1gGrtheftVjDE3HbnNQzVJlqkAujOgIL1gh1OFpTxSUssJhVlxCQlQV
	SW+j84cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vajGC-00000005RxK-0bI8;
	Tue, 30 Dec 2025 23:36:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vajG8-00000005RvF-2ePM
	for ath10k@lists.infradead.org;
	Tue, 30 Dec 2025 23:36:14 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUA7RCi2578005
	for <ath10k@lists.infradead.org>; Tue, 30 Dec 2025 23:36:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GaHFmXFU2LgOEbPPkpReuSY4xCJ4+sCSY2NisbXzuSg=; b=Yv+o7+LzjZXcCX2b
	7JPyh9dZxYnPFPvoaXJK+MZLcII6w+nYNiZlcGovs9KUL0M8ZAZQW+bKoRxT5K7c
	4VyrMpDe2wrLxh7H6zVdTw23s5WWApL1T7WfQyUl1+WpGYZeMtoBFLPfh5rweUXv
	XKiMK3lCGnzN/qZSN+3vePKariXpGxjeIMaS7tt7COionftMy9+7mhzjPxMVYBMY
	KpZgSA+zu7cfJ/eIxEwYMwO/FSxXleDRFmAD6gjGdZkxUudT8CBl4KeblAzHC/un
	iVOGmwPvW+yRLgYJwQaQV/69BxbPPEdOQdzBtNnx1IGNgu17Bgi3KIVoB/FKafN5
	6ysvvQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bbqk1ccya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 30 Dec 2025 23:36:12 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f4d60d1fbdso292995161cf.3
        for <ath10k@lists.infradead.org>; Tue, 30 Dec 2025 15:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767137771; x=1767742571; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GaHFmXFU2LgOEbPPkpReuSY4xCJ4+sCSY2NisbXzuSg=;
        b=QE+ONHaFwFJad6IOTSozGrjMGLzfXCa35dW0MyTBgVdcrMxECQ991tP9QvMV2R7/fx
         HS5g2YUJ+0TOK6wE0mm545951mf0n6DMj9PoEnhsFemF47x2/IzuvocpjNV4maFHrg+M
         jiU1p37IWCGyxCqaitrkWlB/88KgttYGnor4fjViCnr4OVONy4LHJf6N3K4vSpcWQ8df
         rULqURtYXRNZpIL1JuYVABD0bkE+xQJtSPhozBaRK2YsVuftZpwonfqkPrGFh3o27/Bq
         N89Br2s+p1Gnnu4anbDxE8J8+lH1GUslEw7ijG+yGhCsg9JeAtDW4N7zHIp/Y9Wns+kt
         ijOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767137771; x=1767742571;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GaHFmXFU2LgOEbPPkpReuSY4xCJ4+sCSY2NisbXzuSg=;
        b=JDTOy16LOPvwWjoL5jjEBVN2/FTwPunEu3qPlHAo5//Gu2SrurU5PHFkIZHkrdlnLs
         Frse9RTxJACtaQU2lJWjCBLOnQY/s2vufxzEllPuEluWd43DixhqnMCy/NFWf+AHjk1b
         RERkIIbkZzbVY4XVWEVeg3r6K4oxTD6UQ18AaFGLwuiUMi7UPJN/TyeuL1BMNSy71up/
         T0TU8kF1+algwyVh0iku+/FxUd44mLcwsljLy4+rW+ktlnJyTqJNwi8bzqcC8V1bnnmK
         Dgl1s2b5z4VNOOytgacPkFeH73HYBRThxFRg7lLrFraOEOkfK4YkGsSqEt3otRQSFrf4
         2g9A==
X-Forwarded-Encrypted: i=1; AJvYcCV2UzJ79Fp+gfd8Jf8k9GgBpb8xuvAnqcVw277utl4SNwpddnOCRmpkwZpVVmvxHVeXbRGWF24=@lists.infradead.org
X-Gm-Message-State: AOJu0YxzG3oz31VOLWSVdAurLjhrbOeO6BO0dmFmL92kYKWxFIv17N/q
	hs1iXoHwcWhGurkwjjrqemY7b15Y4yP5N/yqx6OP4IrXPSvR0noSIrftBmUpxcPg0t8DRuPCic8
	uq+pycy+z5WN881R2+7E+tO2e8icZKSLfO7fJJdXtMsK1PIXP3HOxSPXSUQ72mnDQ
X-Gm-Gg: AY/fxX4wHpzt6CS0osmikOCWIyRAHrrZd2PK2FB/y9B/MgqboOsWT2gxuef3vWosyTK
	C+YPQw/vC6S9ALMATbrL9o6sCNAdG0bxn6ww/6VrlBLn8pDrNNTygQSKRbjCPr7CUUKopwSzNGH
	jZ534l1OzCgQyok2SJop+m/xTrnRZa8u9ABcmagV/6YY+reHWQoJiFOk8iq1YvnV82lKFMsDbjc
	HXaSgXwG2hwgC6Zj4bJ2hkkt1igBvQnb7pa006Mksa4aqbWVAapAOGLkz+fhIqfGsskh4TxOXlM
	fHt2pSqX5UAfyWK528YQ9EMML3pPMjVc/JRd6z9cEiFtDfOTXjVw4InAADvOUGxIcSBQ/teIfzn
	vK/nLoEPZxM0634P9PRuPQm7gur4hpozmrV7UOg4tFp5F0Of2UnLbQRqCAbaMIYde0IC87LFK7Y
	Ru3Kh3/WGW2ePuJ3R27EAS+JU=
X-Received: by 2002:a05:622a:28f:b0:4ee:1563:2829 with SMTP id d75a77b69052e-4f4abdaad3cmr497925311cf.72.1767137771251;
        Tue, 30 Dec 2025 15:36:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF7BCqXmSeXpjNJMgSVwWhyvWdlkv5tk6ilmCUcGI8RE1/asO6kLVQNDkJuRevRigqYoaXlzw==
X-Received: by 2002:a05:622a:28f:b0:4ee:1563:2829 with SMTP id d75a77b69052e-4f4abdaad3cmr497925031cf.72.1767137770776;
        Tue, 30 Dec 2025 15:36:10 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18620337sm10349574e87.86.2025.12.30.15.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 15:36:10 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 01:35:53 +0200
Subject: [PATCH 03/14] Bluetooth: qca: fix ROM version reading on WCN3998
 chips
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-wcn3990-pwrctl-v1-3-1ff4d6028ad5@oss.qualcomm.com>
References: <20251231-wcn3990-pwrctl-v1-0-1ff4d6028ad5@oss.qualcomm.com>
In-Reply-To: <20251231-wcn3990-pwrctl-v1-0-1ff4d6028ad5@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-pm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1411;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=dsdXZ95EeYH9C3J7omxSTW2//MbnLXvg26+sdstW5a8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpVGHks3ladrkLXuAKtpF6vTDXvxft+w/1qQfxX
 qPTZ4Pi+fqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVRh5AAKCRCLPIo+Aiko
 1X1XB/9RVAlu0fS0XyVVNsfzMyzV7ZUtWWfh4tVhINiynx0u4UygowO8h7lO24yuVEKKVUSTBHJ
 b8NAbdOwfEjJFZXEWol5x8ywChGdEwbxHR8bd44LeF80FJA8rlZlbgp/bs2mKAvCreZsyofEnZf
 +OOl+6Cu5kLFc6XDte7pn1yPsPv0OOMiZgodEdd5Q9eXgVpyzbaX625o4PSLYrcfAuxIPOE7oyc
 3wZydLNC3ueDiOeKRhr2+Rc4tPFuwf7vP2z/THMgsn315cBcWgPx9uHF6jFM3elHZxpD1j6gBTr
 Pm6F4L60wOXU6YCQkgQY2jTpWojPNK1V4OsD9CXb3lP/spvn
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: bYtIMDdNNS_UW2aCswlk778w4IQwnQER
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDIxMSBTYWx0ZWRfX2t6tBrDqfyEg
 BczinaepMaEH+wNNAau4N8FLH92yUfg65I/AUYFzwFBId6XJk6S4jwAWLZ7kLlvNAGHovyD/Ge3
 XKYc8nhW1MSsErFmIPYHohKvx0JTt2+SleozCBhLDuKnW/85nEDCeRGIhmH7H5t43ghAgh50AhS
 wPkzrSWDygmj+vKX01NG70KboYPLqCfQPVCmODFapOgHS7sWcWdJlrUTODhTEiO7Pm/l8wMGqOe
 7jgMPG6JT5EVf71WkmV3mcelgUm6QyCcAnH5im7cJTOLAdFZVLABP87HJvzy0RB6Paf3hAGIDrW
 duaTGT27BMT9q7jMSC2etvFQW/D9V7nvSGCCeq0Xy1cRPA2MaJe6+N9TZPtvTvzeeLWp/IIL0Ip
 swnsw3dqoBN1UCu8zAef6CikGbX0U545MuS/JPTpjsVZ+U+PMzP49nwl+o5P3TXMRMrzkoXCpaR
 JOpDLT9bIYm6JfwAU2Q==
X-Authority-Analysis: v=2.4 cv=Tf6bdBQh c=1 sm=1 tr=0 ts=695461ec cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=TaVSYX7Pq2PjI-6xwy8A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: bYtIMDdNNS_UW2aCswlk778w4IQwnQER
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_04,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300211
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_153612_676191_94F75C3F 
X-CRM114-Status: GOOD (  12.27  )
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

WCN3998 uses a bit different format for rom version:

[    5.479978] Bluetooth: hci0: setting up wcn399x
[    5.633763] Bluetooth: hci0: QCA Product ID   :0x0000000a
[    5.645350] Bluetooth: hci0: QCA SOC Version  :0x40010224
[    5.650906] Bluetooth: hci0: QCA ROM Version  :0x00001001
[    5.665173] Bluetooth: hci0: QCA Patch Version:0x00006699
[    5.679356] Bluetooth: hci0: QCA controller version 0x02241001
[    5.691109] Bluetooth: hci0: QCA Downloading qca/crbtfw21.tlv
[    6.680102] Bluetooth: hci0: QCA Downloading qca/crnv21.bin
[    6.842948] Bluetooth: hci0: QCA setup on UART is completed

Fixes: 523760b7ff88 ("Bluetooth: hci_qca: Added support for WCN3998")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/bluetooth/btqca.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index 7c958d6065be..86a48d009d1b 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -804,6 +804,8 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 	 */
 	if (soc_type == QCA_WCN3988)
 		rom_ver = ((soc_ver & 0x00000f00) >> 0x05) | (soc_ver & 0x0000000f);
+	else if (soc_type == QCA_WCN3998)
+		rom_ver = ((soc_ver & 0x0000f000) >> 0x07) | (soc_ver & 0x0000000f);
 	else
 		rom_ver = ((soc_ver & 0x00000f00) >> 0x04) | (soc_ver & 0x0000000f);
 

-- 
2.47.3


