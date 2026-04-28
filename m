Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44156FF885A
	for <ath10k@archiver.kernel.org>; Tue, 28 Apr 2026 14:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Q1pBVZE4xUj8/QalPHOJhwaMsZksGiJpCvGtPNlm6s=; b=zYtahZPQGDSruWt54freew7pIF
	xm8JljL2KMRh2Cnar8GAroz6IpPwUT0MAgSaRdoN9SybZd1rUL/YxNpthOrb94vY2TqnyaiUICbUH
	6zrspR/dfLlg0whePaXYHV66ruE+Z3VYAwV7nUwkZJMO7ndD3brDcfm9SvuCY67e7Wk+FKARqbt7Y
	dSqnPZ3ZtWwuIkKDqYAolJ4WhVU7knubv9yDMaJH7J79FZl7FaU8syJBgfjh/8dokwVxS0S/rJRTZ
	QuHgXxwCPoNJsXCHWwWZ7q6WrnfGOQqafD7cDza5MeCOLmnzyfBC2NzzkPqNv73uN6XXFxxALnKe3
	vsPHhqkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHjLZ-00000001ds9-3ovY;
	Tue, 28 Apr 2026 14:23:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHjLX-00000001dp0-36NU
	for ath10k@lists.infradead.org;
	Tue, 28 Apr 2026 14:23:33 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S9riVZ2111945
	for <ath10k@lists.infradead.org>; Tue, 28 Apr 2026 14:23:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2Q1pBVZE4xUj8/QalPHOJhwaMsZksGiJpCvGtPNlm6s=; b=EcpAQh6T9qPyWr8l
	yo7/iDh2mvD2DmoZ3LQIwNGfL8V4wJTtdC2zRUwwoXlwlRKw7tuOUg6KOifU/4CP
	UrnUdvNmG+IvkyXs+9OstpsQK6fmAMM9MszTdh+SBWw4GJhbcoH2O2H0sCXclvQ7
	zoQQHAxmYz57Lr4TzeDb6+Jr7aXyC6L2tYn3tLfT/nfiK/O4c/WIlXw5WlgrjQBl
	/Hew6k6EWh6JBV4EyzP1TFMWHhfVzoCxdksYi8IHo4xF23hRwQ2L8nqYY0/RS+8H
	ksRpS6lFHVd3bJAYFxshm0dDtohw4J3Yyx1GzURiV5VtZ3cRULJSRIAlJ418s5Qh
	CVh6MA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtdmbm0hh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 28 Apr 2026 14:23:31 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56f694e2ab8so9653876e0c.1
        for <ath10k@lists.infradead.org>; Tue, 28 Apr 2026 07:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777386210; x=1777991010; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Q1pBVZE4xUj8/QalPHOJhwaMsZksGiJpCvGtPNlm6s=;
        b=MCnZoLOUW5rkMkJMaB3aj/+o0nhfCTdDuoLt3Ukx+epWU3goaAlhbmM6zq/xYrWxrP
         fm25Z35thXYw2iF5wp/oiXe+Jtijxp+VMMwSt17/gLdIctDR6kOPfEbYBnAkV73CtHvp
         jiuEj0rtavWrb7k+jVWyIQXd/ppCvYX3Sry3RKjnR9HfMRZs4QCZAn7VplFgQEjotHeg
         K/EtsS2pb1gOCAcTiuNpesAIQF5UBv23s/vEZdVJusJ349LabmCXIO4zDpViJRP2kcV9
         KiVhqKLL+eFaufaTqEchBIQVLZ16WBeaIm9OGZXI/PwjJVPe9yPStgfKFOrFXIdHDls2
         jAhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777386210; x=1777991010;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2Q1pBVZE4xUj8/QalPHOJhwaMsZksGiJpCvGtPNlm6s=;
        b=VS9Z3iPKnPeSleWBrUxtpLIceDvWA6k77dsnXBZz3HHNkO4NGRJlTI2FHuziY3JUHp
         VIlJJo5F+h3MBijI/pbyyojhcCdXRlhHQyq5i5DEBRF7IW35J5DMX2a9nsHUr9C+pW8J
         OtAeUjkNeZC6v6m75aa3bXSn9IuSf9tP2uOMN1w/D4gMBuv3Jbp7r9MHmqR0U0ikaKGb
         u5qKzUzLL6t07vkRY/F24aRmsIOKrCn+AKEFJ0cg3+geExBInxbPwdIPdk2nRskSaIej
         hObtmCUyod689SlrdtBuv+z3NBlhg+2rAvdHzT666SPt8T86awXkf1tG8KgedDH1/ipO
         MUeQ==
X-Forwarded-Encrypted: i=1; AFNElJ+K12BnNYCHQ1mkwcLEdi/ykev1H9vts3qGBHhj1cen0PMo8fP0pksrB7+Fc7lY6hBbw4l7YsU=@lists.infradead.org
X-Gm-Message-State: AOJu0YyV4ujb8f+HdfKkzMarrk0xUwDzc0oB72mHfYXNBN1z7ZqcsdVK
	9BGF3CpoqKnq7DNk5TUHRak4K1trVZe6iBMweZl/oxFCnhiIrNOlACs8gBJfWzz7DufMrHf0sSo
	/qtfs57VlAfqxv+ySupAvWXBOoIBN0F13t0ZB/bNF4tkCdjMcO1hstlChsAIZxYTY
X-Gm-Gg: AeBDievUmJdVfffXkRnWMGbyZYc2GAKY/L9tAFLnrwQySWlgkp/M0DRT+JJ35GKFKg7
	KK2bSUfq8NAfUw3J0IitrfIukdum5v8Nzq8o9rnCfPyv7obtq/M70ekmbzzs2AaSDAWkLLuOgni
	6scaoi3TteoniJIP/SKtRv/S613FwXig+nokmsFR/i5et+vaCUwVoInZVTzsmw8RrU6euVkWmN2
	1NYpAZMH5SRE3RzxKW01A6UUDcAirLaFVarcQ1M6BRgZFfp9aE3y6AbFs715yazpFh9ktyK8yZd
	26gBuJonl75TIMxPwLrPDs2NoCQ3Q1lyUBIjWhBauYzzC1i8ypjrZgqTkm8nMpRRY7vWFBlr8YR
	rgOe3V4b8KXw4mbZ27yChtz7x0ICcyxTEa5JwSIICZmSeAiY7Skws8lOP63GWA7St8hobuNbAXg
	UR6S62XC9RA1MCwbLQn84P8zRt8M8=
X-Received: by 2002:a05:6122:83c3:b0:56e:f262:9113 with SMTP id 71dfb90a1353d-573a574bd4emr1580869e0c.14.1777386209914;
        Tue, 28 Apr 2026 07:23:29 -0700 (PDT)
X-Received: by 2002:a05:6122:83c3:b0:56e:f262:9113 with SMTP id 71dfb90a1353d-573a574bd4emr1580768e0c.14.1777386209190;
        Tue, 28 Apr 2026 07:23:29 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:653f:4d28:6a78:a6ca])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80ba9b8c8sm107072666b.48.2026.04.28.07.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 07:23:28 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 16:23:12 +0200
Subject: [PATCH 7/9] Bluetooth: hci_sync: Add NVMEM-backed BD address
 retrieval
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-block-as-nvmem-v1-7-6ad23e75190a@oss.qualcomm.com>
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
X-Proofpoint-GUID: 445iVc08AcVPzhU6Mh9OdhQFo2K0Fd1S
X-Authority-Analysis: v=2.4 cv=PcrPQChd c=1 sm=1 tr=0 ts=69f0c2e3 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=teJl78XSWlBvCPfQsyoA:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: 445iVc08AcVPzhU6Mh9OdhQFo2K0Fd1S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEzNiBTYWx0ZWRfX7rAC9NyQWsT0
 5a0N6RD9X4zNFY0isS7AEDwFk4sA8P7ZBGkSWB1bquVJHYln+Vm4Mq+pilXhw52HLBqhmhUZTOa
 6lWcljHaS85y0Am17KIbL0P+fhMtnC91X98IzZg66wFAMZzRFmEhYtmqvFRO7SBFNU8JwSQJ/j/
 NOQXqPz0gmhEzmdKIzPNq8IxXrvrzJ2zjZpXJQ9d3TMZjL4t4m6sOCTHwOEp3LR/qIzfqwVoInt
 lZ0+nRyAvyjlI44Ln1XsiiF1q/GD2s0I5XOstOfWc4Sdxnmi6hA51BXNCmMQaNBI2vxhSC81eHd
 nUw+sS644Bd3WxztNOwDEJQjSukb1vAhlRk0Da45tY2P+Yj5PtgJIA0FtpDbJUADc7SiBft7wqg
 06tZqUOGL27dGYW0/yJMEm6NE8u3tGPo2E9CJgK/4cKOomTMIpKmvGFsD+yjFPit3UsDaXRFJMO
 rRUHKTpAQC84MFZ4OWw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_072331_812542_80132AD8 
X-CRM114-Status: GOOD (  21.61  )
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

Some devices store the Bluetooth BD address in non-volatile
memory, which can be accessed through the NVMEM framework.
Similar to Ethernet or WiFi MAC addresses, add support for
reading the BD address from a 'local-bd-address' NVMEM cell.

As with the device-tree provided BD address, add a quirk to
indicate whether a device or platform should attempt to read
the address from NVMEM when no valid in-chip address is present.
Also add a quirk to indicate if the address is stored in
big-endian byte order.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 include/net/bluetooth/hci.h | 18 +++++++++++++++
 net/bluetooth/hci_sync.c    | 56 ++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 73 insertions(+), 1 deletion(-)

diff --git a/include/net/bluetooth/hci.h b/include/net/bluetooth/hci.h
index 572b1c620c5d653a1fe10b26c1b0ba33e8f4968f..7686466d1109253b0d75edeb5f6a99fb98ce4cc6 100644
--- a/include/net/bluetooth/hci.h
+++ b/include/net/bluetooth/hci.h
@@ -164,6 +164,24 @@ enum {
 	 */
 	HCI_QUIRK_BDADDR_PROPERTY_BROKEN,
 
+	/* When this quirk is set, the public Bluetooth address
+	 * initially reported by HCI Read BD Address command
+	 * is considered invalid. The public BD Address can be
+	 * retrieved via a 'local-bd-address' NVMEM cell.
+	 *
+	 * This quirk can be set before hci_register_dev is called or
+	 * during the hdev->setup vendor callback.
+	 */
+	HCI_QUIRK_USE_BDADDR_NVMEM,
+
+	/* When this quirk is set, the Bluetooth Device Address provided by
+	 * the 'local-bd-address' NVMEM is stored in big-endian order.
+	 *
+	 * This quirk can be set before hci_register_dev is called or
+	 * during the hdev->setup vendor callback.
+	 */
+	HCI_QUIRK_BDADDR_NVMEM_BE,
+
 	/* When this quirk is set, the duplicate filtering during
 	 * scanning is based on Bluetooth devices addresses. To allow
 	 * RSSI based updates, restart scanning if needed.
diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
index fd3aacdea512a37c22b9a2be90c89ddca4b4d99f..f87cb6ae85c3a5754fe79f415ba05dd177f75fad 100644
--- a/net/bluetooth/hci_sync.c
+++ b/net/bluetooth/hci_sync.c
@@ -6,6 +6,7 @@
  * Copyright 2023 NXP
  */
 
+#include <linux/nvmem-consumer.h>
 #include <linux/property.h>
 
 #include <net/bluetooth/bluetooth.h>
@@ -3588,6 +3589,54 @@ int hci_powered_update_sync(struct hci_dev *hdev)
 	return 0;
 }
 
+/**
+ * hci_dev_get_bd_addr_from_nvmem - Get the Bluetooth Device Address
+ *				    (BD_ADDR) for a HCI device from
+ *				    an NVMEM cell.
+ * @hdev:	The HCI device
+ *
+ * Search for 'local-bd-address' NVMEM cell.
+ *
+ * All-zero BD addresses are rejected (unprovisioned).
+ */
+static int hci_dev_get_bd_addr_from_nvmem(struct hci_dev *hdev)
+{
+	struct device *dev = hdev->dev.parent;
+	struct nvmem_cell *cell;
+	const void *ba;
+	int err = 0;
+	size_t len;
+
+	cell = nvmem_cell_get(dev, "local-bd-address");
+	if (IS_ERR(cell))
+		return PTR_ERR(cell);
+
+	ba = nvmem_cell_read(cell, &len);
+	nvmem_cell_put(cell);
+
+	if (IS_ERR(ba)) {
+		bt_dev_warn(hdev, "Error reading BD address from NVMEM (%ld)\n",
+			    PTR_ERR(ba));
+		err = PTR_ERR(ba);
+		goto done;
+	}
+
+	if (len != sizeof(bdaddr_t) || !bacmp(ba, BDADDR_ANY)) {
+		bt_dev_warn(hdev, "NVMEM BD address has incorrect format\n");
+		err = -EINVAL;
+		goto done;
+	}
+
+	if (hci_test_quirk(hdev, HCI_QUIRK_BDADDR_NVMEM_BE))
+		baswap(&hdev->public_addr, (bdaddr_t *)ba);
+	else
+		bacpy(&hdev->public_addr, (bdaddr_t *)ba);
+
+done:
+	kfree(ba);
+	return err;
+}
+
 /**
  * hci_dev_get_bd_addr_from_property - Get the Bluetooth Device Address
  *				       (BD_ADDR) for a HCI device from
@@ -5042,12 +5091,17 @@ static int hci_dev_setup_sync(struct hci_dev *hdev)
 	 * its setup callback.
 	 */
 	invalid_bdaddr = hci_test_quirk(hdev, HCI_QUIRK_INVALID_BDADDR) ||
-			 hci_test_quirk(hdev, HCI_QUIRK_USE_BDADDR_PROPERTY);
+			 hci_test_quirk(hdev, HCI_QUIRK_USE_BDADDR_PROPERTY) ||
+			 hci_test_quirk(hdev, HCI_QUIRK_USE_BDADDR_NVMEM);
 	if (!ret) {
 		if (hci_test_quirk(hdev, HCI_QUIRK_USE_BDADDR_PROPERTY) &&
 		    !bacmp(&hdev->public_addr, BDADDR_ANY))
 			hci_dev_get_bd_addr_from_property(hdev);
 
+		if (hci_test_quirk(hdev, HCI_QUIRK_USE_BDADDR_NVMEM) &&
+		    !bacmp(&hdev->public_addr, BDADDR_ANY))
+			hci_dev_get_bd_addr_from_nvmem(hdev);
+
 		if (invalid_bdaddr && bacmp(&hdev->public_addr, BDADDR_ANY) &&
 		    hdev->set_bdaddr) {
 			ret = hdev->set_bdaddr(hdev, &hdev->public_addr);

-- 
2.34.1


