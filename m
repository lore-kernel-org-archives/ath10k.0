Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B53B0C55162
	for <ath10k@archiver.kernel.org>; Thu, 30 Jul 2026 16:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SkfAnMQDHbMi2DKEw9B9JDdOl1z4aZR7BlMrHcVf2Tg=; b=eVOvHD616zt9fdFHyvkUiXXNXp
	f8sKAEZBJCF4s9Yd/6lv9Lg9R9k81rtNg5yF49Rv4NHxWVAEj4rqmu3+/P/v90bfWL2XUvga8Nhss
	DxBDu3uD4Ms6hqRQBNdXbcKC9h5HPHeYWj0f2zaCf4G9xMy1vjEyi5Wh+ZxvF5FrdTyiSqSEfQCh+
	pavnqLT09ghiHp2yn1Zn//h9Of6vAo1uKhFbUDo8Rjz9ELhAdTwL3VxHlwa809QPshRjMHOQrHX1h
	jG1DhAHAIbdixq3UOH3s4DrItvBI2f/+HYUdcYAHmEjqcBcFoJulsjpzePX+qYyb6p196hExk3s0q
	0aOu10Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTC7-0000000Augn-3urg;
	Thu, 30 Jul 2026 16:01:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTC1-0000000AuZY-1FKM
	for ath10k@lists.infradead.org;
	Thu, 30 Jul 2026 16:01:14 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UFQtYm1371737
	for <ath10k@lists.infradead.org>; Thu, 30 Jul 2026 16:01:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SkfAnMQDHbMi2DKEw9B9JDdOl1z4aZR7BlMrHcVf2Tg=; b=m9ZRq7Zcpf4SX/0j
	07az4tsNyxygzxx0jGpkEFKXtE69KsY+pvmxU8kru2Soo2PyeV3MyKJgjZkw6jI3
	QPxMl5KWLwrKjtNsJne4Ex9tIUA4p82ohR93tv9ZM6OagZSu2lsaxyL55z/rSODk
	+j3KguZLZff4K9Vm+v/ft5FwigwdlavJMcqt0OZlncKcBxAsqgC+R7R6GDOMYbCQ
	APIRfx+H1oxtBJpUEH8AerqH8BvZon688ty2ZHscFjKSbvWij8bkCS2UUkCBu+At
	oHWu8O+0hyM2d8C0JpaeOdupEnBpHhZIhfboMIPkJENyjrudzNCBJ6nIOW/YNpP/
	kaVyTg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr6yfrypm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 30 Jul 2026 16:01:08 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1eb52e1fso42581591cf.0
        for <ath10k@lists.infradead.org>; Thu, 30 Jul 2026 09:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785427267; x=1786032067; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SkfAnMQDHbMi2DKEw9B9JDdOl1z4aZR7BlMrHcVf2Tg=;
        b=g9HKZlaoQhhORqMFKQZxRq1hnnrmqBqJtYRplQoWNrHouUK4hMb9Io5m70pxV601L0
         fMYZJI7d3nVsCF1Smmq5jyTsZzQqmuQtcu2q5SsacdxHYP7AHym9arDoswtnliJrULec
         PP/7LGkARUcrvTY5zGmdMtClTouhCpVb8W/ibN4+GVKU9ApeDOhBEy1fgCzHeV3LuAs0
         nGZBX9Dsj2FAhSTbLRJb5Uuv4199sAOPJe4+oIW+RTtaIj4yftpXdd21yCTAgSfKBl8B
         KFEIXGbrr14A8V2gcrAG1xnskhSLF8kb1FMYQZax/WdjauMPWBzY6XyljXKcVKHb0J1z
         Bg+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785427267; x=1786032067;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SkfAnMQDHbMi2DKEw9B9JDdOl1z4aZR7BlMrHcVf2Tg=;
        b=qsVcbJvgnOHCYXTjCI73fCM4b73sKI6TPeQ0TH4A/RT8CddzM/YXMgww/aGOVgHy+/
         TWO/fwgAGZK4kFQ2fCzy1Y329LSPtTfGqn6b8uAKVHDH83bEE4FVfIs8cCTZj5BiMu5i
         1KaQWU2CJn8UW/UB4ApPybIJrhpXbLOlAOBwekU5tcFhp74UP4/L2ze7u7Jv9PM5Tpya
         iAPF7Qqz97JTwdxzjqyK+fOE9eDyWC2sWJWI5ZyM4xkVDhsrXZ5GI4maj6d/sFSapbsd
         /Yzts0rGR6eEh1sDdJPgGciyPVGQiLP2v74dv6pcoxnvwtMDIYI3/wPKpusiJqgJRTXc
         qkkw==
X-Forwarded-Encrypted: i=1; AHgh+RpWhS5c2GM52a1p/+GrAzm5j/nc+Qm73q9+KbjB67nz594x23zb3I8vQJ9XYBXclLZQaA4VkMg=@lists.infradead.org
X-Gm-Message-State: AOJu0YzB36xNvlmtZi9G41MAjuxin5EptnKxOlR7J88OUBExttbL/KYr
	MySGAQtwqUKuWjUELdMfZuJXOQTs84y7BiEoAeuV6iNcO6eusS/jy1UYqZf2Kkmr7Lu4ZjUg5YS
	WisHE76Bd/teoCzGdSWkW+mdMZRvff4PZ9CGraogMgjH491t304KRMeCQ88868COI
X-Gm-Gg: AR+sD11OaEtBqT/r4dfjkTad68C0QWnzR+6geKjkTWO53glOi0pKvqvdIIqUxgccZut
	5UrRwFZGRYDpJTntObJucNNOyz4fPKwJBYcIf+4qJJxnkd2yOatzVM+s6OjpW2mcrHwqOjYb2f5
	ZdC1/IHo44M1jsXoXdY4a1BPRYRs8RnDEJvMiylc+/fQnWkslPNLQ2SCzBqPDTvf1KIKdp34whc
	QfbyGTLJqAuFIjd23xPWUzbUF3Ydap0R+RmqNHTGQHPsPAphBmBFzXyi+bCbhrSq7tPV1I1zpWY
	RebvCAlDK3AoR8GqWuvrPeOldpWoB9n+v17iHwmn12dRtJfjx97QCUYCx2zHE+W+BvM4fqu0OsV
	UwZVol/xMAhXa99MuIGuo8PauClkA0hQILE/l62Eb6mbxFoAGToYHetFmpwUdkpcxfdrfyaMWCO
	SD/BQAbQWavou1oetx6qWM7iTBUudpmVlVvybgRmqtSEoztRJO0z1O
X-Received: by 2002:a05:622a:4b17:b0:51c:7b12:5fda with SMTP id d75a77b69052e-52b38711458mr31946551cf.86.1785427266086;
        Thu, 30 Jul 2026 09:01:06 -0700 (PDT)
X-Received: by 2002:a05:622a:4b17:b0:51c:7b12:5fda with SMTP id d75a77b69052e-52b38711458mr31941961cf.86.1785427261386;
        Thu, 30 Jul 2026 09:01:01 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:61cd:dcd3:c61a:ac3c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fa8bb6deesm85168066b.53.2026.07.30.09.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:01:00 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 18:00:38 +0200
Subject: [PATCH v9 08/10] Bluetooth: hci_sync: Add NVMEM-backed BD address
 retrieval
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-block-as-nvmem-v9-8-f72935817dbf@oss.qualcomm.com>
References: <20260730-block-as-nvmem-v9-0-f72935817dbf@oss.qualcomm.com>
In-Reply-To: <20260730-block-as-nvmem-v9-0-f72935817dbf@oss.qualcomm.com>
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
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Piotr Kwapulinski <piotr.kwapulinski@intel.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEyMCBTYWx0ZWRfXwJQKJGwY61hm
 6io+fiabzo5YpEZRia54GoacPyZj9kkwi8gphej25gafNkFb1ypa2/moCPQrPTu/Le0g51ai4Nu
 bNQ5JiCjtAc8SXt6RHClrHyuecFL2NHuQpyDurieWZ8M3IimNjhomL3wn+bdjRf/hxX3if5a/JO
 GhfRP3g3nqy2A5PzwkxCIMFxbe50cN+5rInkkVJg6RGS8UukcPF1rNGZfybFDemFrE1LJTBnvDI
 zZDXkV1bwoUXO4IGekJfJoOTCDm2PmH8wEYEjTQIfM7V7aJO/3IqmsHHYG5BHE5RZ3kt43ivbF6
 7KZy8Xln7aPPis4f9wcz5yAHAimZpg9Oik+UTRDgLtckwhk4iwbv0hEzmLlVNJVvCbEOfHzfqug
 JolD8Fg4QECLBh1IqD7hwzBnrp4E6qWTemgD+HmzDWoz3hHp9Bm8KkC3SJR1EvIrQW/gLaqdCTM
 ZlPbR1+cBaRc/Kv8sKQ==
X-Proofpoint-GUID: 6OHiM7QGJsbrZsythcVuC075qfCX486K
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEyMCBTYWx0ZWRfX9lk0mu83ky66
 BsIc5DOPHaExw2YkItXx/u+Lt7yx21iUkfLii/QTQ0t4iaJKubt08uJ5hxk5sRpvDEHElYmr2dn
 yDjdtuK4sOEiKEZiOskT/As/ZntT+tk=
X-Authority-Analysis: v=2.4 cv=Tv3WQjXh c=1 sm=1 tr=0 ts=6a6b7544 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=QyXUC8HyAAAA:8 a=ZruV3ba3MPUC-7CJ7xEA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 6OHiM7QGJsbrZsythcVuC075qfCX486K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_090109_508175_52F240D0 
X-CRM114-Status: GOOD (  21.36  )
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

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Piotr Kwapulinski <piotr.kwapulinski@intel.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 include/net/bluetooth/hci.h | 18 ++++++++++++++++++
 net/bluetooth/hci_sync.c    | 41 ++++++++++++++++++++++++++++++++++++++++-
 net/bluetooth/mgmt.c        |  6 ++++--
 3 files changed, 62 insertions(+), 3 deletions(-)

diff --git a/include/net/bluetooth/hci.h b/include/net/bluetooth/hci.h
index 38186a245f14dbd2a26cbc331e7f1b3e72f1a607..145ab94e51482f903f4c9133d8c97561ac1c1e00 100644
--- a/include/net/bluetooth/hci.h
+++ b/include/net/bluetooth/hci.h
@@ -161,6 +161,24 @@ enum {
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
index 3be8c3581c6caadeeea56e14e09d4123deb4ec03..c0ed7fb14d19bd79429a6892ec1c7cc89bc7ab3a 100644
--- a/net/bluetooth/hci_sync.c
+++ b/net/bluetooth/hci_sync.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/property.h>
+#include <linux/of_net.h>
 
 #include <net/bluetooth/bluetooth.h>
 #include <net/bluetooth/hci_core.h>
@@ -3593,6 +3594,39 @@ int hci_powered_update_sync(struct hci_dev *hdev)
 	return 0;
 }
 
+/**
+ * hci_dev_get_bd_addr_from_nvmem - Get the Bluetooth Device Address
+ *				    (BD_ADDR) for a HCI device from
+ *				    an NVMEM cell.
+ * @hdev:	The HCI device
+ *
+ * Search for 'local-bd-address' NVMEM cell in the device firmware node.
+ *
+ * All-zero BD addresses are rejected (unprovisioned).
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+static int hci_dev_get_bd_addr_from_nvmem(struct hci_dev *hdev)
+{
+	struct device_node *np = dev_of_node(hdev->dev.parent);
+	u8 ba[sizeof(bdaddr_t)];
+	int err;
+
+	if (!np)
+		return -ENODEV;
+
+	err = of_get_nvmem_eui48(np, "local-bd-address", ba);
+	if (err)
+		return err;
+
+	if (hci_test_quirk(hdev, HCI_QUIRK_BDADDR_NVMEM_BE))
+		baswap(&hdev->public_addr, (bdaddr_t *)ba);
+	else
+		bacpy(&hdev->public_addr, (bdaddr_t *)ba);
+
+	return 0;
+}
+
 /**
  * hci_dev_get_bd_addr_from_property - Get the Bluetooth Device Address
  *				       (BD_ADDR) for a HCI device from
@@ -5072,12 +5106,17 @@ static int hci_dev_setup_sync(struct hci_dev *hdev)
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
diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
index d23ca1dd089365fe4606600c68475dceb561e5ee..42b6866f96a4c81850d98041b34b7fcb0f9d0e47 100644
--- a/net/bluetooth/mgmt.c
+++ b/net/bluetooth/mgmt.c
@@ -614,7 +614,8 @@ static bool is_configured(struct hci_dev *hdev)
 		return false;
 
 	if ((hci_test_quirk(hdev, HCI_QUIRK_INVALID_BDADDR) ||
-	     hci_test_quirk(hdev, HCI_QUIRK_USE_BDADDR_PROPERTY)) &&
+	     hci_test_quirk(hdev, HCI_QUIRK_USE_BDADDR_PROPERTY) ||
+	     hci_test_quirk(hdev, HCI_QUIRK_USE_BDADDR_NVMEM)) &&
 	    !bacmp(&hdev->public_addr, BDADDR_ANY))
 		return false;
 
@@ -630,7 +631,8 @@ static __le32 get_missing_options(struct hci_dev *hdev)
 		options |= MGMT_OPTION_EXTERNAL_CONFIG;
 
 	if ((hci_test_quirk(hdev, HCI_QUIRK_INVALID_BDADDR) ||
-	     hci_test_quirk(hdev, HCI_QUIRK_USE_BDADDR_PROPERTY)) &&
+	     hci_test_quirk(hdev, HCI_QUIRK_USE_BDADDR_PROPERTY) ||
+	     hci_test_quirk(hdev, HCI_QUIRK_USE_BDADDR_NVMEM)) &&
 	    !bacmp(&hdev->public_addr, BDADDR_ANY))
 		options |= MGMT_OPTION_PUBLIC_ADDRESS;
 

-- 
2.34.1


