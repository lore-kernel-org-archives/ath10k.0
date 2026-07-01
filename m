Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 997E1C43458
	for <ath10k@archiver.kernel.org>; Wed,  1 Jul 2026 16:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9YSak8Ew9R23ftO3G6++eI4jZmwu0q3/SECsCEcQvU4=; b=A+hhjJlSnHEjjOywQyV9TBJY71
	Ah5TlGSeIghGo0u8DXO7LRxbCnu7yoHvVpTGbPi7fwasePVCDUz5Ix60wp716rbDzXK/7ElaU0eIi
	sQ0Bb3iM7QzMU8YYYhyjUFRtG/cxOFwIqp6QKkCbj6siGDlGJhYA9CJTDQBB8CbAJ/lNGteJfsQUC
	Ss4N03f/2LQNG1DT9HwZeA3LgVvkWfLG1BnTAr5zbiZF+PQMQ9T00DmwARJFp38HYYNQFyTUjIx7V
	fZrAA45AaGE4rbHzDCaba1A+vywYgJq9Er9Cg51OxhNOUZZhejBCl88Gqxrzqj9GhN5t8tP1cCIf8
	c6qDW8hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wexNH-00000002Sxd-168m;
	Wed, 01 Jul 2026 16:01:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wexN4-00000002SsM-1aFM
	for ath10k@lists.infradead.org;
	Wed, 01 Jul 2026 16:01:11 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661Fo9NX1551181
	for <ath10k@lists.infradead.org>; Wed, 1 Jul 2026 16:01:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9YSak8Ew9R23ftO3G6++eI4jZmwu0q3/SECsCEcQvU4=; b=RmfiO339KZkoqVcU
	OC2aMvDyZNB1SRsiSe4KdSthLLl9QAzoJPKGzYyRnpg+aN5IiJU5YtT6TW5gvXJH
	H7LOBPJqGiKZY3M2Oqmi7yzZwf3Lt7dHrTaVzqDINMl0dJ2BeXptzOxdZAwmp2TB
	A8SW5c2astmVOiHFj04qj2M7OF4XzpBGjCtjeyFJ24BfVr/cXFzWgF/s+p4Nm1he
	c6x7fU4Y1Kt2nF0VU9RjcdQjSAfVGVIQCvsnw7gdktfZYCscoWmcGCC8ytFkKTT2
	6AbgaHDSjlcmls9cLaGTFaDvh1ZLNr+7c1FvyGFbMYtlkfPplUxv1Stal1HPSdHy
	FIhzbg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4kgw4wra-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 01 Jul 2026 16:01:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e66f9e2baso83643985a.0
        for <ath10k@lists.infradead.org>; Wed, 01 Jul 2026 09:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782921664; x=1783526464; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9YSak8Ew9R23ftO3G6++eI4jZmwu0q3/SECsCEcQvU4=;
        b=FWKFv1qFfaVQUDFS5mblM9fbfxz3wY3MFUHxCn0TZnzWCHBLb70/YkOsW87Iwxf56k
         rLnMI8w4bNt5MN7QYxQKgUN72YxjaZQEdY4OO1y8KpBl6q4Qk8YKg1Wjj+1ItMjbTfyY
         nVCTsRu6vY4zkAlbRxHIJahZSjOI5agEVg93gPDaqb9Lmf1eC8WsQ7xsgib3jCCRLE3z
         5yl9MI4L06ctrBUiq2E87sglmTPPxKAdUDCksH+eupGDgouxlgJN+GFtfax0ehygFrAb
         aXo1lXIfBPQvbeozFEQU5An5C2R5P+ZFdIVoNoi3wsKa3jtjMi5j1XJ5hcpafOxIATul
         TByQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782921664; x=1783526464;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9YSak8Ew9R23ftO3G6++eI4jZmwu0q3/SECsCEcQvU4=;
        b=Lsp5Vxu/wXC1UeKhj09WbvOmU2aBOyDce6kXt5abyVx2mNxmzEoQtuoDoEilN8kH0K
         5+0aXEGkHyHspMRyx6uDYnlfg6wIOH6y/6IcaiB19Sv3AhnMciv/62HVnlzzOWDcmMly
         gWQWtSvZCf8Mr0KRiDtZe6axa/70qFcZLplmgbkp1J66QZD7NY5WMx46jH136NZat0LA
         F9yco5qIwxaE+wRHdpHq3X4+SeYnO22LaiHXKZEHMqLBcYncxr20vrrPyjIhsxhtBVuu
         si6ug8WdmFillHzfgkWDHjG/PfdGNmHmQw+Pp1jhj+qxB6ReNsLj5vxLYhisn7Z4pNrO
         MqMw==
X-Forwarded-Encrypted: i=1; AFNElJ+XN/PIK8TMsV1gzLTgCDUurgrwYohu7XIU0Z/tHZkwkqgQqTMkkYlfOEFNkR/ndqAqgKA+1dA=@lists.infradead.org
X-Gm-Message-State: AOJu0YxTfbhraKomfG4nmtc80Wi8o5W3tXiziE8EAjvvM553ruszsPuB
	aiB2WZpamAfkmwnejCRRZ/O62+Xoh6ah4yqHTfmyNexCpSETQHXgC1MT7atDK6jy1xza6UnfCz+
	LTheGIsqymKSMAIX0vlHt6Omkcd85TFnAfrV3Zlj11aGFukari+A8BozFBInKvm7K
X-Gm-Gg: AfdE7cmqCYNHWoKe1hilOCy6YS/CagPDiT2Gw3QRDN92dfmYoYiLKI202jdtMxFluIq
	2fM+bhNE+lrfDtabqiRYyIX/HurFhKjm4DQ68Xq3365t8aeue/oNnX+6bjstAH4p1ICS1PXaJ7f
	Pj4xE+SNx9wyOQHiRe30/ub6Rplv5sqiH+sA3P8SlvPs4F+jo4uhPar1vwiRTNlh+mcd4XP1iOr
	BGCIfqIWmC0I37IOM7Vo9HqxKZk/028kp8LgSF2nOe1qtTSy0I7YS0DHmel7XGZOfTVYi3m4h2f
	tIap0majc5y5MNnLd7KmqUOxSvjWBez2oReRmufIn+8jpnrsNcjwlQ/XGKFPfCnPFSOwyTo2t1U
	z6bjoM/f7juuGFtB1doPoNWEcOBw9vQYCbCnyhUcTstQP/bWtm2JTNuk7aT1OSXsc/p3aNtoEte
	JUfNHFQa0kIh6KGBA3Ioe42g98LjAhtBJhHvu4H6/QlE8j50/UcaoS1uufnd13WXo=
X-Received: by 2002:a05:620a:2987:b0:92b:6805:919d with SMTP id af79cd13be357-92e7b473836mr228639285a.69.1782921663982;
        Wed, 01 Jul 2026 09:01:03 -0700 (PDT)
X-Received: by 2002:a05:620a:2987:b0:92b:6805:919d with SMTP id af79cd13be357-92e7b473836mr228543885a.69.1782921657091;
        Wed, 01 Jul 2026 09:00:57 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:809d:5d56:19d9:ff8b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288d19e03sm296613066b.4.2026.07.01.09.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 09:00:53 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 18:00:31 +0200
Subject: [PATCH v7 7/9] Bluetooth: hci_sync: Add NVMEM-backed BD address
 retrieval
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-block-as-nvmem-v7-7-3fe8205ef0a8@oss.qualcomm.com>
References: <20260701-block-as-nvmem-v7-0-3fe8205ef0a8@oss.qualcomm.com>
In-Reply-To: <20260701-block-as-nvmem-v7-0-3fe8205ef0a8@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Co2PtH4D c=1 sm=1 tr=0 ts=6a4539c1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=QyXUC8HyAAAA:8 a=UCHyucM7ZhvORosJgB0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: -COOohOlRC5Cpw8IU6NDOaU2udVMPp0E
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE2OSBTYWx0ZWRfX3Bb9khgOv8hx
 0Gm5ffK0ppKOa4El+gqBRtHonJNWeO6qJOXJ7ybgg3JG43NUR3yfrpGg+UCmyiTnkjiqHQMJPe/
 qmj0NIMiMjo6Dni8wX72cmQOwCY0KGs=
X-Proofpoint-GUID: -COOohOlRC5Cpw8IU6NDOaU2udVMPp0E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE2OSBTYWx0ZWRfX9HYxwt+Hqage
 3Jf/3MKtm2MqB+lkQjPYMmlC13aZ96Y5kCmEQbjYPsO/1Tm1YCr50q3mmS617gu56VzBhYj4s5L
 yjTxF/3RUJTNGs9bsFFcojPNHn6CuJ45p01j90YtyuH/rw2NHUVWbcq86PcdezDPeCuYR80k6bN
 5KntAgSFX7pY0wAcOBQsHk3PX/z+USG3CNpFN4XNz1tZjfOwiT6HY3gRwQL2JbKgT4D0A2nJOIX
 xJYy3jvTdnvdC08W5a/pRpzXM+E+2iBw76PI5zVlJs0/SksKRYio8W/zGve/6SKLyVl/BmqIg+T
 wq0omP0A1l9KSdgtkY1wE4H2rapmfSSDBs8tXvnGCVMOaAmnd43p4X6PdkJAnHhlGKBzkAX5EDK
 F6zshEjNZmHZa9PJMg36MdgneNRx/CM9MMp5aKa06N+u1PvW9E0uQ9d7JJfbjSC20XF8DEdh+VU
 D0edWGLapO3KAMxAzCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_090106_454224_0FD04EB9 
X-CRM114-Status: GOOD (  21.35  )
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
 2 files changed, 58 insertions(+), 1 deletion(-)

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
index fd3aacdea512a37c22b9a2be90c89ddca4b4d99f..56248d4abcb5b1d9993962a9f6bf60bf865b8d7b 100644
--- a/net/bluetooth/hci_sync.c
+++ b/net/bluetooth/hci_sync.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/property.h>
+#include <linux/of_net.h>
 
 #include <net/bluetooth/bluetooth.h>
 #include <net/bluetooth/hci_core.h>
@@ -3588,6 +3589,39 @@ int hci_powered_update_sync(struct hci_dev *hdev)
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
@@ -5042,12 +5076,17 @@ static int hci_dev_setup_sync(struct hci_dev *hdev)
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


