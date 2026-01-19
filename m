Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 978F8D29C4B
	for <ath10k@archiver.kernel.org>; Mon, 19 Jan 2026 17:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SuVJjvlCTXRFYAFx0rLVTZXUOY4TgeWGafNaZ/GaNBM=; b=hQTJ9d1jFvVGuz/6nwPdCnUjgB
	RcTHyuP1SExsUVkjI48XozBbRK7QG6ge8bA5yvQrBsgL2x0BYszxNGFeVvR0f+DDVLPWctovTXy2h
	lo0cBO74skExpGNeubo1N+03pSHf13k/JnI0bModobrxPYbAvr7NjCFZOhsbu2wVQ4o8s+IOLBDxe
	+ffMBJsSiSGW6vjFj9+ZNA79vLafkKdyrl1BZoiMTdm026spM+y8WlwwBLQe3mmMRmMAT5wYqlOEZ
	OcVgB3SxMIB6q0phMosbcoYViDNAghPBzO3ddIuZFLj9pgGbT0FNuTEr1HymVWKAHf7ZJohI2AZDd
	B3DAjs+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsjV-00000002ajE-3jQ8;
	Mon, 19 Jan 2026 17:08:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsjU-00000002aii-0L33
	for ath10k@lists.infradead.org;
	Mon, 19 Jan 2026 17:08:05 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J9nSFl2966239
	for <ath10k@lists.infradead.org>; Mon, 19 Jan 2026 17:08:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SuVJjvlCTXRFYAFx0rLVTZXUOY4TgeWGafNaZ/GaNBM=; b=Phequo9SA/a/PCp6
	NlJTaZczZwRqq5IeMCtKydM+r4rs+si1FNopaHWIet3RsQT+eS/jbWhJJh4fyxQO
	vQXM0Hw4lqk1857DMIpaXnUu7ev9iFLv/J5BqPXm3ENvNSCnP509TEa/l89uiQP4
	z5LO2Db6QVmS+wvwIG0Q1efI2idKPV3YdotGlQ3o+skN5/LP+9pp9t5i9vfA3pvE
	9Fi9E2QDq0GPHSjbtgrpE3BPCE4hqTjlJTQilOjHxdfwJHUYv1ALyfhY6FVP0C1X
	IeuoGR6RPRPKAkDHRAgrv+8ozc3DifumhNmTn+Fckove1eazGIRhNp3V7ceZYNqp
	uE+Eqg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsjaa9961-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 19 Jan 2026 17:08:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c53919fbfcso1096989585a.2
        for <ath10k@lists.infradead.org>; Mon, 19 Jan 2026 09:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768842483; x=1769447283; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SuVJjvlCTXRFYAFx0rLVTZXUOY4TgeWGafNaZ/GaNBM=;
        b=XjxgKVZRtqSQfm/1Vn9+uJyBEJoqvlFiXio+mUVcMksvkcuU61gYodcl9v4KYWt8gv
         7btqKeIO0+Q1LsPjpHexRZ+y4KZWwxv6D3RnpsDdMP/pXLWG1BIvhWTD/cWzHCK75IMl
         fNg8kZJ8VZ+pZjPfe0fQCSZqhWpww8xAvbUD17dLrOk1B+/qDkGCK8TZwMSOivQAMAJE
         ROotA6WnTt46q0l5cKYG7qZuY69jyxVs4aw65k2SUyoRnHlCvrlCDUdRtwRi6bE6zait
         jup0BGt+Mw8LtLfi/Ghzl+F1nnSbObP/8mz7OzxvXP6wNUmv9zZtHOvkmIhc/KUhSeNW
         w1VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768842483; x=1769447283;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SuVJjvlCTXRFYAFx0rLVTZXUOY4TgeWGafNaZ/GaNBM=;
        b=fNa/QD5fifbVwvPrYeDqmn6w/4p7yiHn2mOfHfn6PX3nyZi5gShEBZjEcu3CD6ZJbH
         frJCEPUzGRGW5I/QFRHhKE69Gue+BiAfhe3wP7xcOljdGpOprDJ3/Q6ML2tfsZRpTLW3
         bLrrVhd3qryB5WQ6WFBW66t3b0AVS8uM/ALoy+w/CcrcakdmYOrsPXqZdbF3buCsxXlO
         W1TssXqXhiPPmgO+u4dxPHGV2DX6MbW3sy2vcVGm+AxaohRPvRuwrhDsBvEQghRTwEay
         3mN+v5syYpNjSoUQGHRblKHw0XpuoNiGdGvMgvpiVUhxkP6LtDJNbLQVigitpg6HfkDu
         Tucg==
X-Forwarded-Encrypted: i=1; AJvYcCXPXi5ejqQBMCrabqsImhT/0L8d6bWw7YD6Q12QT8ciKSU8NzNSqzzzxruEwg+uPNIjI3yFByc=@lists.infradead.org
X-Gm-Message-State: AOJu0YypUc84f2hYVDoY8o6LHEUGFlD6+BPViN57uXf6IbtrVqtbptCI
	p3KeoZiJl+7l7BGctyJSJ3Ly3j/Ya0fa1DU/VbFL/tbpzdUQ9KxPlewF4Zsvg8pNFokwLAnahb5
	WZX7xXah5NriF74YsAECaFksEg+LbgYcs99lEBNwByNwWyKzEvJddW7w276wiCSEE
X-Gm-Gg: AY/fxX4i4qFH3pml+Q9GA6/8aL5cqunr+Vp0BWBIpvfX83eq6e59epZmwfx/4xo8+8r
	x5CkW4ryWj9u/X47J95VM24BI5FaaRXo4pxLUfTq8MG3r2U0s4dHX3dScDHn6B58P+Bf2FH1beY
	lH5u+BdxJcPwH5h2CbG/v10/+G3pgPbeuwI3DqgEoimkervRVFf1xO0syRf2uzYn4oDoIWKyxbG
	k6KWiSzBAaPDvmYlAaoytCgqYK4CLjuFxrZIKgCXRLT7f7tQqWnOadJt3LqsdJJkho62KGMNuiB
	lSa1kvxkbJ9IEVNoXj2i+N6qCeEJVdeiUcwgO6vrSAlkwSje/P1RJrlhRf05Au4fH18QnsJDFuR
	ZX1I7y57VtY9LjjbWgAE0saz6sa5Y6F/lmLyGb0YrNp7xXW5510TSr7vz2GCWk5++3m0rimQMpu
	2XlZ51RbxrfvXbuOOMGqN/MWo=
X-Received: by 2002:a05:620a:31a0:b0:8b2:e6b1:a9a6 with SMTP id af79cd13be357-8c6a66c833dmr1553064685a.17.1768842482475;
        Mon, 19 Jan 2026 09:08:02 -0800 (PST)
X-Received: by 2002:a05:620a:31a0:b0:8b2:e6b1:a9a6 with SMTP id af79cd13be357-8c6a66c833dmr1553058985a.17.1768842481942;
        Mon, 19 Jan 2026 09:08:01 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384e790a9sm32661211fa.26.2026.01.19.09.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 09:08:01 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 19:07:55 +0200
Subject: [PATCH v3 1/8] Bluetooth: qca: enable pwrseq support for WCN39xx
 devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-wcn3990-pwrctl-v3-1-948df19f5ec2@oss.qualcomm.com>
References: <20260119-wcn3990-pwrctl-v3-0-948df19f5ec2@oss.qualcomm.com>
In-Reply-To: <20260119-wcn3990-pwrctl-v3-0-948df19f5ec2@oss.qualcomm.com>
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
        linux-pm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2075;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=8ro0A6tVVAR8N1a3EJt6gZeL+nfKC2FamuLo+mTTcgM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpbmTtJkjq8QRehFWdJgm9SxyOHvINLBQgHL/BO
 cfn6uEaosiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaW5k7QAKCRCLPIo+Aiko
 1dYSB/4mAIVY1Uxgf8lpFuKOsE8xM/V+Rh7rNNYEBCcBFyqY7YknsndW1uZpnqvilai7bnfI/Op
 nIxt8kq+/NYZJbRHnSlbUFkqCBgOfzIxabuLUwlljRP28UvhPnIcKmvYzcHsx0/1O7vql3olS48
 Rx6E+Te7MXS+JhR1nrjfchlvXIxv3ZBIJR7zHMHfh47GMNJ7qSKkKmWM27Jr2glV9rskj/gYjLC
 F/mOIczZumwoeoKoWIXqv85nKT2P6BzJCeT83mPZsp53Fgpp61D6nn07ZRvR/mv+o1FpbSRVqtc
 6ErJ+ElIWpYIknQPzscQ5kNNhH4dp2bX58K59Ooi0UUUoofS
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDE0MyBTYWx0ZWRfXx/BJECbJ/vEC
 kpVOcSZKyYDoUUlQ4ygtjOGNwudRWfJZEBwQCdQfuCy8vI0j3kRP1ly2YLv0XsCz4tYfUDKSgUL
 QGb92KmVhFlx4cgbhyY8kBNOGiim+TRV/CBxDU3qny274Qvj9qILAmh0zShNw1Yr9kMMiPuA+qJ
 W5V8FJ0s/G1lJJTSmGhY7Vpn6doU2n2YoF8WeB1TQ7KrwZxQ6GZIzQrKRRtSVNKfFNM05JNEyaL
 RW6F0AK0dLI3frqRwKq8K2swshHfbBV8vHoRcVnyr68kCeH8DzQ6pWYdLkgKxaX4GVHAr/VgTCN
 SwY4lAlylflb65YGOdgd4Hw9Zhs3gpEyZ/w7rsKYktaLIB2pvVf2nP01PBZPyhGHQTY64sej/en
 ePILnYxiQUw+sv4dmj03jR9uajesG59jUoALNy910SwobKWWNmHToJy7lzcVHy+WGeU7ynRWL3l
 uku8yNYk9DM0X4I2q1w==
X-Proofpoint-ORIG-GUID: 5a2g3HjDztn233tJ9QJyMiQet2rqhoL8
X-Proofpoint-GUID: 5a2g3HjDztn233tJ9QJyMiQet2rqhoL8
X-Authority-Analysis: v=2.4 cv=L8gQguT8 c=1 sm=1 tr=0 ts=696e64f3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=WNkeAZsnUospxCs8hJ4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_04,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_090804_129686_6ADF5503 
X-CRM114-Status: GOOD (  13.68  )
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

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
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


