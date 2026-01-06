Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E1D4CD042C
	for <ath10k@archiver.kernel.org>; Tue,  6 Jan 2026 01:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GaHFmXFU2LgOEbPPkpReuSY4xCJ4+sCSY2NisbXzuSg=; b=cYUbfklM5IUkMqbg3IqqKi4Q4f
	uza8XZmXp0KdRcOkQYXNxO7AjBsKPnp2/ZOYaIiiZFa/kM5QVj4IBup+C6OJGWpKTZb/OpbAohfY9
	2GT2zhbbWOvDrkmIGsZzoCVhOWn6wNJpNRFLLDwogEMcPn286x1XNv9336fkQVrq4pDH3TPbw2JSH
	2f0h8pUlrzM7MTCzmRI63Nlq0eeC0Gg/Ynjht8v+TopfDyQakqhTf2xDdDwC4UuwxJlRifsrm/bV1
	x2jbUwpU6qnUdFtMyuaZ3ilSiKSYt9mRS+ahumPlvvZv82tGra2ro10QhRlZh5Jp6g/1b41XgfBL+
	XDajcnOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcvRx-0000000CHYC-4At6;
	Tue, 06 Jan 2026 01:01:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcvRv-0000000CHWj-2rrI
	for ath10k@lists.infradead.org;
	Tue, 06 Jan 2026 01:01:28 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6060nKYr2969871
	for <ath10k@lists.infradead.org>; Tue, 6 Jan 2026 01:01:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GaHFmXFU2LgOEbPPkpReuSY4xCJ4+sCSY2NisbXzuSg=; b=FNtmA+uqDXK2qSBS
	BUWgcuR3OppC1hKq3nWeBpTUXK2T71UtYJ153i/xIEdbjpOBSlBElqSkfok6IUUk
	KoVA0XQ9sC3PUqboONYiMsz3575kuXR9XQ+G42Jmn0vzcEy6JL1pzQHC10Pcwjbm
	3lm84sMxioth8bpYw0BwhsxrWKSIZWYmmmF1xlKUoPyxwB4LuAdZ6TBZxMrtt2qW
	Cpcn4fG20r8MMhitTzewqb9YWMYMga/g4vGl23tYeR2ZBYMC7O6AaX9LfaPR0I86
	ps+zRRoeK4C76VlnfjnrTj7SDESx7BT99udzguI4W4jp7S+fzHWmn5Kuxyn2N0MF
	DwzfGw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bggsvs7pu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 06 Jan 2026 01:01:26 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee0c1c57bcso15253851cf.2
        for <ath10k@lists.infradead.org>; Mon, 05 Jan 2026 17:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767661286; x=1768266086; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GaHFmXFU2LgOEbPPkpReuSY4xCJ4+sCSY2NisbXzuSg=;
        b=HDH8q4BRqE2fDkwcuh4sG+QyrWrmuwZdLus/BTYedqNIzZpEd7eP4cVZ3fuFQ9Wcao
         gusbiITQrgnBjizyolux11AhwTtLBM0m9R4pWnc4tf93x2fehVAnsK0xFMtyRGoTp7tN
         KT9+gK3adYsg8YRW2ORalExt47CoTs8nH8EUVIxuDA2LovR0xLFjnSCkt+nDjRki7fdo
         U3EwuwejgM6Vrg6RFiYO2PR9q9D2RCGzh64eRyY3Lq6jN7qaN/ttS9jsjNT6FIRNUq0g
         D5AqaHywi0zw4fYkEDTam67NWX3pVbiBFG8ES4IgvmZx/27v+s6b9qcW3rNWruKcURXY
         o33A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767661286; x=1768266086;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GaHFmXFU2LgOEbPPkpReuSY4xCJ4+sCSY2NisbXzuSg=;
        b=bLpXnCn5SlfUgZeuR3oCfVe7Th+jsI+78A3JME1MMz+APq0Wo8FWsjdnmSQKD+AJlZ
         2V3G4JYwIEcLh8PU1Vjeux8E+agBuhd4oZ1AAlcaRoZHbvTmk/i0BgaxHKLbzUOIR3v4
         0dClsO2fRryk69EHzmcB/0lYCCqm3exGjESQhyg0QzCVIoaq2xTOm/rEDwD84m5mGQxb
         nA5PMtGeIQMfHgVrhgcpYrUI0PCXJ6kKUkKeBjrFnPLnLbTdmgK930gvsNWuphEaXuYK
         CTvckI38pgMKfkVHbc+Du0/A4t20SU92xj+IsU6toVMhe3KwuMFi/PjvsZRafWfPW9T1
         1ZQA==
X-Forwarded-Encrypted: i=1; AJvYcCUoxd6X7XFRjRMHR/SQCKewYmJpFMzY9JO0vgF4R65ypONMGBCQdV9/7m8Eu3oIebBDU2gpJ50=@lists.infradead.org
X-Gm-Message-State: AOJu0YxIDoJu79EXPIJ7QiqM57de5En7zz/tlixENuvGiudDWQr1SztG
	CKFmHW9obPpz6VrCa+6k+TS7wOf3k3ev3TDSevdDXRgGyCmgu6EsDuIwAwsLyd14O73Dil4hj+j
	CVY8AyFf4JrIQMrd4XrTknKWjB2IJa7tBxTSddcboSM3G18tel2tTAn2pVpfAB7l2
X-Gm-Gg: AY/fxX6mRrFNlQn8t6UvRr0K5oYMvUmG05/5liD4w0sB/3sFt0QT/0tE9ARjYEZXyTf
	K7LNbyUjAoNqUynAcNG8LD2TOPIC/rQObekC3kW/89Qw9wykSboAvFVF/1Ww2IfMVED1B6FOBE/
	qKt0wZFLZrbhQTC7mCSAT8W3ksTMEUXmCuuT9d2G4zIDgSmApU90g+HisdIXb4w7jhCob/sU2cJ
	n0K2dl1Q7muO4e/qicNIGBLq4L01cCBWZZPJ6zQDsmPNj4opjFEALaNE7V9jSXHWJND4QXjjLQn
	PEaqyskmNaDIHpsPoMKpN93KxnnbCntJqmLQf72wIGLUAOlYxUqBgfdSVe18LQQ6VigvXvzy6FZ
	tIxWDytZNNs8qwd/O2iM/H9KjIKHBivYZSqJ8PoCPYfuB2D9ghPXezwENH2x4p+MOob2iDCEHhK
	fTy66WerzJuFvQ2wfX30nJzY4=
X-Received: by 2002:ac8:5d08:0:b0:4f0:22df:9afe with SMTP id d75a77b69052e-4ffa77afd7amr21505711cf.51.1767661285900;
        Mon, 05 Jan 2026 17:01:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHs53x/m4TYSBTf7oNnfpXpWQiTG4FUqY7QH3p2oA8FkA/fqepE9/ee56v4AUWgte/Y03Kz2A==
X-Received: by 2002:ac8:5d08:0:b0:4f0:22df:9afe with SMTP id d75a77b69052e-4ffa77afd7amr21505131cf.51.1767661285458;
        Mon, 05 Jan 2026 17:01:25 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65cea8b1sm181082e87.6.2026.01.05.17.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 17:01:23 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 03:01:13 +0200
Subject: [PATCH v2 03/14] Bluetooth: qca: fix ROM version reading on
 WCN3998 chips
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-wcn3990-pwrctl-v2-3-0386204328be@oss.qualcomm.com>
References: <20260106-wcn3990-pwrctl-v2-0-0386204328be@oss.qualcomm.com>
In-Reply-To: <20260106-wcn3990-pwrctl-v2-0-0386204328be@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpXF7YJdQaWvZTNPcWs2gdp9XunrWj6EarCWIme
 3YqpUhN4W6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVxe2AAKCRCLPIo+Aiko
 1cTICACDFkWrMGC3XZY++CL+qe3yvTY8ryAmNeucwr0WK34X9AKvFdmwRsb6nQ3xCCyBuf/Zxrn
 LrU5qZ7i8x6M3QXeiHcWuEJ55n2SVVjslkCCSKRHJNSUtXZl5SzJ95eOwU4EHRRjzTiY2XpHv94
 fdzBvHkP9YoJlKY/OJFfDFHt4gCOnVZYqNMnMd6/BP+l52Jwst0YJVYLBZHubi1eb+GZ24dOHh9
 yJ0XVU0rS2ENYJj4BE9SpRR/HKSI574v7NDOmJEhtdWhrajQKiEv/iutve/w5HbftIFoRipT6nc
 owAWMs+FBiKwb+rGVEMGBWHljRYcQSGLPf4wK2jfRlAJzbcO
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: GnXPdM-KpWndI_8u6mWm9AkxTA2PmhOy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDAwNyBTYWx0ZWRfXwMTp+DCPxHIs
 nusuxQWZ6WkCNoq1UAhnsF2N1PGCiKKAQO5jsujNKg6w6UvX1Qx58KARfKmDH0NtD2BaOjQdpoP
 4NDqRG03kvvmdK/rPQZZR2gB7X/3FsVdxmuObHxJhXf4AroOjE2WzZt8le/CNjlX3+IPSW0/J+V
 Dp/8/Wmw2Eqa0N3gXAQ22WWovedRKemmTvX0F6XQyJHtsPFZ9l3dwCGR55FIdNWI+Q7CbXxjBt3
 R5uaqS1ZicoHbZll71a58QbUeq2B/562xKDjoNuy3BEj8uBX8yZq7ovYV/HbHa26/82nPXqxrmB
 FHoe4u9ByQ1GXDBQRSUxgZMzONszrAoJO3/Qeo8f5Zv2SuDSEv1nTNfUxKark10qf14rLEWVQsF
 krLLntYuRluQszqr2eY5Rz4OUCw3pxMbQ4iVmgiP4ahOboZ+OjzmIiA8hb7eysurrplbmHmyAVN
 K0z5aAIJFFRx57tC9hQ==
X-Proofpoint-ORIG-GUID: GnXPdM-KpWndI_8u6mWm9AkxTA2PmhOy
X-Authority-Analysis: v=2.4 cv=Yv4ChoYX c=1 sm=1 tr=0 ts=695c5ee6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=TaVSYX7Pq2PjI-6xwy8A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_170127_845266_C6A014A1 
X-CRM114-Status: GOOD (  12.84  )
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


