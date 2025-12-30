Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A67A1EE57C6
	for <ath10k@archiver.kernel.org>; Tue, 30 Dec 2025 23:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5zzqm3vWt+G5X81VnTc/HMamR4mFoNc+f/SQq1irb68=; b=kKZkocAEyZoj8jbUd1wP5Eppu0
	JKBJ8JBBiTRyETJLWsYvW9SkPKCFoabf1TN7Whx2wJJ4qcRnmkJbPbSKNJ/O8ZaVP+sOy6288ofIl
	CmVamOxmoyAZa199SUPuYrBfgSPXL/ab47XvGL8pauq2KP/qg3Qi2/OMh2y0GDURJVKQN1v15QGyh
	kr+I8x2VJ2MxWD4ZyLbn/GusUuRnaO8dqKjjNq6YDnte4DC9z+vCoay7GlAbksujPd1hd9LLxCCnK
	d95eAEGvj1OXFeT45FwT2gDHG1vRtVrXMyAqG3Y4tUn3YCvhFX3VmEDjcaVzWSqwi1lIKFK8+d9LU
	96zv/T4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vajGB-00000005Rx2-3Vr0;
	Tue, 30 Dec 2025 23:36:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vajG8-00000005Ruh-02B9
	for ath10k@lists.infradead.org;
	Tue, 30 Dec 2025 23:36:13 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUB4gq12672739
	for <ath10k@lists.infradead.org>; Tue, 30 Dec 2025 23:36:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5zzqm3vWt+G5X81VnTc/HMamR4mFoNc+f/SQq1irb68=; b=e6K48ciDEEdSVIk1
	V5URzU4EmIaNi+mTWu3/CM0TJ0FSs7gV/tn2Ua5J/MGr7ubda0KYd9jbWLZ3LhUC
	DIxsGwxjtbpxf6qnSRvRYW7tQyimoHG8nQCTMUc5BrFE4unSNsDFH3653SGPqhBD
	a1K4811xoS2DlJjyO0LU84S9Vc64qKW+jEgvjTd4iBIFFxa8B/E0IRFodDtMbYjE
	FY1xmPZ3xulWcRUYhzTP1wW4fT90lELBoqTgN/1+z2a9UolIvHL2300hJafBHFX3
	2Oau6tWOr7pkxmdKB4JpBOk/qlokuVLOQ+Y7zFVZTxvUXnEePHYi7nla/anAwKTq
	j0N1Xw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc4fctp6f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 30 Dec 2025 23:36:10 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88a43d4cd2bso128261436d6.1
        for <ath10k@lists.infradead.org>; Tue, 30 Dec 2025 15:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767137770; x=1767742570; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5zzqm3vWt+G5X81VnTc/HMamR4mFoNc+f/SQq1irb68=;
        b=JU4mKhiGctfs1BrI4x+qUEBuFrlzGn7KklcQFAzae/NRtyyaw3Pyvy7f0i4GZorm9r
         9hsMsMDbIUQnRaMbNpzn5DoYksmPZVpQ9TGizPtU73ONZaESFTnrIGutkk0fLfv2OwNk
         SRFQEA3bEnFu5hpWKz/ow6o1+vjAA6lozP7NtCZNJojzTAQM4B0TUEoydag2u8eodIVO
         CPJFYOIbNXsu4Puyg2ZN7xRICHg5Wco+yJmOv6wxBWZVeFNhWAFhYuqe22KudZ7Xgg+5
         JUtLL+xRx5qmzxsu/YMhSL8VYejXBNrAKViAjYBcRMykLMjsL/maqKmpyqSkpJmG80Cs
         NNLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767137770; x=1767742570;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5zzqm3vWt+G5X81VnTc/HMamR4mFoNc+f/SQq1irb68=;
        b=dnIVbliOXllAmYiwxdabbWx6X+D7Cu3GzbAB7jMudfRkFMvB9C2LIjWCA4RgGju8wN
         jnZp1IPgvCP9a50PQY2V/hmVss6asJyHyk/vqHD1ndPZC9ULQ2++WPZmSooq4SnXUGlo
         VKmhdkgNH7ZYJxfxTFjWd7ZtNVfb0mH1YuJHtwgSzRow15PZfzYXu/G7EGQ1EmZJg3pl
         oSx2jjWHaHvRiF62ne17oOupuoD1lNxHjOHnqvwNWi0RJ2tmWffODmZJqIXeJhHKCDHy
         /YE9R4YZj3uswp2KJGN7rWgUQnM/Dab5gdeaRv7LQQk4Kpad5ehwv2LhDK2WZrK1Ihzb
         WQhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnmm7ZPKqguhvKHi3KmIJH2blE8lTYe0qaSu1h766o4iuUuKxTmnsIU+2oYi46aGvaWI+I/eQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6CHatrLky7MQrgfQNqZGp3cFk4ltzeQJ/g5GobVgcz0EdlMSD
	sWh30F5C431Cc1aN5IKhlUtxohqR0In+Le7/f6GkGTJY8Ar8kWH3Z4py+dIePCWYFctrZLMKwjw
	Qbvtzh1dmzmmX2FQmqg9O4CTAVfLMhlvNGNRMrvvun47buNIYf62tZYAwN3UXGm4r
X-Gm-Gg: AY/fxX5f1MY5QzK8eg1IiA11twOA56wCva9t7JcAfQxWghEgwsgqrUKqeGOKlYq7VwR
	uvDn/0ZvRBYFr7vXuhP659NOgvWUoQpSCgSD+yWEkl00luZhRxYPbAswEBLVu/CUpFYNEYppFWa
	Ngqge8kKK/8LkeJJOste7IuhcqKrR0MSXUjy2dDaCpWhcepRddUs3VTM3JhgjKy5AM4tVERUyHs
	KSkftwg5CDBy3m3cbUdL0codbVmGjyZCMkbX1omV4Quv3jTzzxaPkGdbbo+05pZs5v1pYrVjXr/
	H/oyd7+14BgQu7Lb9snu3ULPAM0rN6uTTfns5VrejFbWySuMfs/mgj1PxfR6HIECCMl+DRlQ7Vv
	r618tioQLToSIiR2dyMi4eeLbkdFxct1JJsy/KQxSGJdsqeG5oq2GxcLK9o3+Os/kksIalAhJHi
	IKeKmz6mj9OXfx8qG1KlUAlFQ=
X-Received: by 2002:a05:6214:23cb:b0:880:4c15:599b with SMTP id 6a1803df08f44-88d81667282mr560504866d6.14.1767137770085;
        Tue, 30 Dec 2025 15:36:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFdWALg7FWe8HnFIGfMzmshFveG7DXhOdt7rpEnzHy14H+14CgajaaMGSxFNnYetgNtZv2I/A==
X-Received: by 2002:a05:6214:23cb:b0:880:4c15:599b with SMTP id 6a1803df08f44-88d81667282mr560504496d6.14.1767137769569;
        Tue, 30 Dec 2025 15:36:09 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18620337sm10349574e87.86.2025.12.30.15.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 15:36:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 01:35:52 +0200
Subject: [PATCH 02/14] Bluetooth: qca: enable pwrseq support for WCN39xx
 devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-wcn3990-pwrctl-v1-2-1ff4d6028ad5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2002;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=AG1LuEu35/QXARVDmQljJ6/X6wU6zxwBmWxtwK9pVwc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpVGHjmoSFavXQi3JlRn+Z2QMO9Tk/0rtLaWUNv
 pHS4GewQyOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVRh4wAKCRCLPIo+Aiko
 1S++B/9RyP7SAXCM/MZIkkTS9QxNyh/wJ1yzA3IFsGEWaw0uinf2VvjekVO4joaHHPKkGhTVXDd
 8BOqELjg7HLDo5E1037L+ZFMPTHeJeTqMUid/ELoPcdLZzqFsN0icUg6ALx/Biexleanj6SfQLQ
 VI0jBlNA5Y0PD8nXFxMvT2d6TxwiDTXbl/iCXW3yVBSjbA4Dk/M2d3/seAshcy0Ci6TBPs99q2K
 NO0sLSXgMLMIJGTcl4+XgowZ7CpnomXgFJstjr695of/roCI/KEg0DV2hQ2eITfnhRuKG8x+zwd
 lKpcwSLnv4Ji+P4FuzzfBz0AVoluNcbIwH2ysn4q3yNZdf8r
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 3hDz48XkxtqCxYxHf_fx_yE2SRbKDfiC
X-Proofpoint-ORIG-GUID: 3hDz48XkxtqCxYxHf_fx_yE2SRbKDfiC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDIxMSBTYWx0ZWRfX1xmCz7062gl0
 40Gz0auBjtZM13KRihr4ZccqJg8R4ys5CFjx8ILlxpfGdFjLIaTR0621pcH3pa1RZj+3OnjxnPu
 UURuLfjYO1GDY8wWv48PNZhc1+TsrjaywDB3fKYnk7iuiAbNt/JqnxqZ/7whWLDwemLn4R/uGrq
 4VJaKw4xbu/vaTbiQUEOnPcxGE15UOLvl1qcXJuCHYBtjnSdy9wj8U19k6+9Roo1y3BB3fYNnnC
 xGAKTuHhXUbp/52YV7tyg0VhbdZivZCZ9iRTgJoayciLDDqhHeQSiDhJ8SEtDl3BPpIRf3lpdfm
 WBIyoBOem7Zp8wnWsew9XAtn/mjChHKcRaeO5U/G6LFzuO1eFTUuQdPwr6yPiqN+rN0pvJszOqM
 W+C+wEyM8RX3jv9VvDzNNJDFxJFvWiHCeAmyZZ6VioKNv5W8BZRB1LtWhUF6z/8W36o89DtHkvP
 8Z8tOR1yfNOjkFR5Rfg==
X-Authority-Analysis: v=2.4 cv=foHRpV4f c=1 sm=1 tr=0 ts=695461ea cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=7G4NRjGX0UlV4bIyNksA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_04,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300211
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_153612_186529_5D085FA8 
X-CRM114-Status: GOOD (  13.23  )
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

The WCN39xx family of WiFi/BT chips incorporates a simple PMU, spreading
voltages over internal rails. Implement support for using powersequencer
for this family of QCA devices in addition to using regulators.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/bluetooth/hci_qca.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index b54350317a43..d1402a344063 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -2230,6 +2230,18 @@ static void qca_power_shutdown(struct hci_uart *hu)
 	qcadev = serdev_device_get_drvdata(hu->serdev);
 	power = qcadev->bt_power;
 
+	switch (soc_type) {
+	case QCA_WCN3988:
+	case QCA_WCN3990:
+	case QCA_WCN3991:
+	case QCA_WCN3998:
+		host_set_baudrate(hu, 2400);
+		qca_send_power_pulse(hu, false);
+		break;
+	default:
+		break;
+	}
+
 	if (power && power->pwrseq) {
 		pwrseq_power_off(power->pwrseq);
 		set_bit(QCA_BT_OFF, &qca->flags);
@@ -2241,8 +2253,6 @@ static void qca_power_shutdown(struct hci_uart *hu)
 	case QCA_WCN3990:
 	case QCA_WCN3991:
 	case QCA_WCN3998:
-		host_set_baudrate(hu, 2400);
-		qca_send_power_pulse(hu, false);
 		qca_regulator_disable(qcadev);
 		break;
 
@@ -2414,6 +2424,11 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	}
 
 	switch (qcadev->btsoc_type) {
+	case QCA_WCN3950:
+	case QCA_WCN3988:
+	case QCA_WCN3990:
+	case QCA_WCN3991:
+	case QCA_WCN3998:
 	case QCA_WCN6855:
 	case QCA_WCN7850:
 	case QCA_WCN6750:
@@ -2438,12 +2453,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 			else
 				break;
 		}
-		fallthrough;
-	case QCA_WCN3950:
-	case QCA_WCN3988:
-	case QCA_WCN3990:
-	case QCA_WCN3991:
-	case QCA_WCN3998:
+
 		qcadev->bt_power->dev = &serdev->dev;
 		err = qca_init_regulators(qcadev->bt_power, data->vregs,
 					  data->num_vregs);

-- 
2.47.3


