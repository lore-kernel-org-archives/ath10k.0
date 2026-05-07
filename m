Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD45CD3439
	for <ath10k@archiver.kernel.org>; Thu,  7 May 2026 15:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kVKEAS8GhVMCCsKzWvqDs3cunTV/p/7YyYFmPXPEJtI=; b=Vbsqd3M0FDxduQ0hdUb8h8CU+Z
	szaChwwVS6k/BmcE8+Yt4F+Y0MK0/Ku8TTgjOxzfBcHQoloqf0cHd2WCJxc0DFm0Rfe0OF5/ThSL1
	OxpZuNixKcJc7Y5EYaZjfOfjzEgauF/G2Disj5PILFvc/7s6t4wSvsgX/GYJxodAjpKXZ215cZEmW
	/zhZi7v95NpvwPqFkDgpk6nN4uLAWnSA6ll2J0+gm3vHSJTWutERNnYLf0jhkYh2is2Ziupa08jbY
	ylS45lZY3ukpQuIf58h/8tvhZ9Y/2QsrpD6p90zZ2miEdulxwd5jKXMiDrWZBhcdOv07wOCys80pY
	pGYJ9VuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL0b3-00000004Aj6-2dNC;
	Thu, 07 May 2026 15:25:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL0b0-00000004Agf-3usN
	for ath10k@lists.infradead.org;
	Thu, 07 May 2026 15:25:04 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6479EPc13463977
	for <ath10k@lists.infradead.org>; Thu, 7 May 2026 15:25:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kVKEAS8GhVMCCsKzWvqDs3cunTV/p/7YyYFmPXPEJtI=; b=OBsau1YP7Yy+Iv0k
	Uq5fle1uCLNF61w2iOsc5BgnzsyKJrCSbaMr3P4ys20u8HSD5tSJmzwaB3UsTu1/
	65eX6tYgK/vJ2IVXY1nORGIG2vRygbP9teOOJffIvXS9DQq/l+CTaCkjAQPuPRXG
	1ScKblMYBSjQFTZjjKwMpQ8ytpsegGBp9EB0LwFrONQgBdA8et8K4uclP2xCXQio
	f6cC/i5TRqDx0gumanbzk9exuVFBX0rmg9+a3QZ6CUuFWfgXkx5gnzYYGO+Aa+co
	KjEk5eF+GrUEiIC+/d3AGbGi+HC8STjRLvTuU8aN+urzheNgt37w6Ospq8pnDa43
	1SueFg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0hvn2saa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 07 May 2026 15:25:02 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-948b41f95deso1391718241.0
        for <ath10k@lists.infradead.org>; Thu, 07 May 2026 08:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778167501; x=1778772301; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kVKEAS8GhVMCCsKzWvqDs3cunTV/p/7YyYFmPXPEJtI=;
        b=G+NM4YAidrEMc7hAir9hb18MdiNKnDGGDwWaZ+Y2GqF2FsgFXk6KTVq+QEYrjr+Lcq
         KKvE8rpgOtpBOLeP1BohJQwHeEIASG02p/6EGnAWJmZq5U4sE0vzku2urW5SHDX99fNb
         Tp8P/jlHukk5BNDCOLQChW3FSOdJnv3rE7LQzJvzGIOJHTm5NLA4gYKUYzb9xAi8TCTK
         Y6tBinOZxT2l9mi3tCxuIujL+wLB3IDRJYOf5xKu0pSk4QFAhl2k2Zt3O4Pw5vlYLCQd
         IkehDINk9kbZAni7IE3JtcHqAXvP0SSc9xNjrRJoWJRwCsu5CDwLAsCB7s3FwgwaRdyC
         6H5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778167501; x=1778772301;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kVKEAS8GhVMCCsKzWvqDs3cunTV/p/7YyYFmPXPEJtI=;
        b=XaqjmdJr/kY7cyl8vPoczOgKSapyk6XL3u1lnjDO6vNGDeJkKO9hTs+grFalvnG5cg
         Q/JucLqowiaI3Tl1JbMYAOd7nehq0fU94DpTv2BQuiBA6YrJpDnv8yWW56Vg8AgwRAsk
         Ke9uXSZOk+QkLAycfue+KYgKedCyXsc0zU3jt9NugOwU0T4io4ef78pMhlWOm9xHwytQ
         mNjZHiMrUFJ61kw5MTlfMq7cuGGdd+rkgT2qQx8L7H4QKCWV6DBqOCkjJkeVVP22mAjv
         hJoutWX39L7iI4UDsd9HaATPZMi+DXF06rWGl4apfwFnbFANgAlh2LcfvA+iEH7EAQs1
         CrPA==
X-Forwarded-Encrypted: i=1; AFNElJ+k+i4L1QpF0V0GPWdzFN5PC1yt9xVHgPFeO7u3fhTQiq4H5Mwivh1g9TWpJokb2T63PidIUiw=@lists.infradead.org
X-Gm-Message-State: AOJu0YyPLld7AWveCVPgMAlZF92xUGmAvk9TwREcOumPRYmWQDiz7Hkp
	1TbPpL/pGvwYftRorn+QQ7HEvbtVoXq04mXEb3xJKqrZCNdp8NqrIIuXLvVM/eW/P6C/w6MhaJ2
	gTtHA1kEkySY791XBvnKFCwBSVxZq/BU11yOxf7BdpadRxq7KpwIW7OiF3YSUwD+m
X-Gm-Gg: AeBDieuskg8TXM1nTjvgPRX5FQl/LXm4Zjmw/osX/3ioyna1D2EaObo8f+RifMhJAmd
	uz3I5Ijv5nv0EC3HpVbaW9SCX+WccziqB6vwzLos1uIMzGu54UiRrvRWP8yPB6u33WFiquTGjkY
	eiL9WBEFale9l7Y0zWeBtEVbHHGss+mJV421y6pO1eHUeoJ1r9Tobqa9b3ucRhyju1ttFzvrFIt
	S7DKLb6d0aTrBUq80VyFV6b5YjkHBol7aYhFQrRWTxJWADWp66YEL1jS11UTifnXvoQRsYRgZWX
	v/g0juaHmGBNZTugyirnzLEpkoyni5wTYu6xdJ1Kl9FvrTg9lovLW4KCLMdp36F7ONZYugXci2E
	MaHZmUsK2rzeAM7gAQzOpknykbxcvVkXoZ5UYE7VGtYpr2W9u03CBNRAFG09GkA5HCn5VP8Cigr
	lBLubPNbpo9ODlN/SrUpz9LLl7FNo=
X-Received: by 2002:a05:6122:a07:b0:56b:8e17:25f5 with SMTP id 71dfb90a1353d-575595c4094mr5143511e0c.11.1778167501319;
        Thu, 07 May 2026 08:25:01 -0700 (PDT)
X-Received: by 2002:a05:6122:a07:b0:56b:8e17:25f5 with SMTP id 71dfb90a1353d-575595c4094mr5143393e0c.11.1778167500580;
        Thu, 07 May 2026 08:25:00 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:b16a:3475:ec42:bcfa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bca583dd7e4sm240966b.58.2026.05.07.08.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 08:24:59 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 07 May 2026 17:24:41 +0200
Subject: [PATCH v2 6/8] Bluetooth: hci_sync: Add NVMEM-backed BD address
 retrieval
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-block-as-nvmem-v2-6-bf17edd5134e@oss.qualcomm.com>
References: <20260507-block-as-nvmem-v2-0-bf17edd5134e@oss.qualcomm.com>
In-Reply-To: <20260507-block-as-nvmem-v2-0-bf17edd5134e@oss.qualcomm.com>
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
        Saravana Kannan <saravanak@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE1NCBTYWx0ZWRfX/MuDLlW7hzIH
 D81nGScAGS9NJBmqEgJNjBYPFSvw9nuBINtuur43cycmlB5g6EjXneRNsryU1Ly5arjwGw3ZZEG
 KiDyRubZ+M60coC1ittIo4PYmtEEPKybLqLMgWNnISDAIueWxq2rUYqyrGPUPd4uPNv3X/nU/6/
 QFN/ZpQojfZO99bKP+Jvrz7PrnBHFiSE81ZToOGS0hv+2XHBGeBbbFjgcK9dqLhoGBsLfWBazti
 iX7Y1F6qqdt8IgHwLs+DD02heMQPqX+b/Ifi2Bk5+OuR+9Zh/APewYkCunoxjVIdgpE4P943u5/
 6Jc3vwFthfouLu3wSL1qNA0k6/CZLIF+JDxIM60axNI0CviKaAPXlw9b0KDI7GVRtkO5DpmbyMI
 eRyeaDlwx35DkxtGPOy++WSqEpK+A8u8Vz3QQVwDlAWqoMfSwiEsSK+rlrCvt5LTAnhC03JReck
 oks8dHYhfBeoxOyQ3VA==
X-Proofpoint-ORIG-GUID: 1s-ByGJ4460SX-c3UEuze3qB5-hj--WS
X-Proofpoint-GUID: 1s-ByGJ4460SX-c3UEuze3qB5-hj--WS
X-Authority-Analysis: v=2.4 cv=ZZ4t8MVA c=1 sm=1 tr=0 ts=69fcaece cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=tQ7bI2BnKgK5Av-YYOwA:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070154
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_082502_987668_FCD08395 
X-CRM114-Status: GOOD (  20.91  )
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
 include/net/bluetooth/hci.h | 18 ++++++++++++++++++
 net/bluetooth/hci_sync.c    | 39 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 56 insertions(+), 1 deletion(-)

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
index fd3aacdea512a37c22b9a2be90c89ddca4b4d99f..589ccdfa26c1281d6eb979370523fff0d7920302 100644
--- a/net/bluetooth/hci_sync.c
+++ b/net/bluetooth/hci_sync.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/property.h>
+#include <linux/of_net.h>
 
 #include <net/bluetooth/bluetooth.h>
 #include <net/bluetooth/hci_core.h>
@@ -3588,6 +3589,37 @@ int hci_powered_update_sync(struct hci_dev *hdev)
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
@@ -5042,12 +5074,17 @@ static int hci_dev_setup_sync(struct hci_dev *hdev)
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


