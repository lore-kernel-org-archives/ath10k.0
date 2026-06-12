Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0754BCD98CE
	for <ath10k@archiver.kernel.org>; Fri, 12 Jun 2026 13:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PWJIctf3Xhmc1Sr2xNkWiIgvHAObX6zOuqPQdVoDfTc=; b=K7hxSv8CiAKTIqXZ3srKwGkn+w
	Z9fEC2WZEXUAje6gqDBGoIhWkYgap3mw54d+0ezOeL2WuYLgLOVlWBXOCLoHQCxedgs+wjnhxV1wC
	RQ7pj2IUQFtoYe+lmMzKaU+RXYIVMuZAEJyi3itLjAPVvgm22BODiImfrGpSTUKY59yrXSqThTFPd
	ffQLSPuW9auuesy9XI7qwhOh/jXILYIIF02DhH7YVhUGdZtHxIuHulc0kto4h/5v7rOSyxD5rxaIF
	LTnYbHKTyuSqnxjewJeDQqYo6DKCA4nf4VUEf8DqqviBQPK0xL8+IZK1dnId3UNwCu4TYZl2a6Lg9
	ceNMEDoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1pA-0000000Ax7o-0BH8;
	Fri, 12 Jun 2026 13:21:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1p6-0000000Ax2V-0tv1
	for ath10k@lists.infradead.org;
	Fri, 12 Jun 2026 13:21:26 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65CCj6We3721522
	for <ath10k@lists.infradead.org>; Fri, 12 Jun 2026 13:21:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PWJIctf3Xhmc1Sr2xNkWiIgvHAObX6zOuqPQdVoDfTc=; b=V2Cv/JFe4AaVKnXN
	5SHFfRRmkZthJcnQ77krCOWPD8LYZDGipdVZicvw6WB3JHNXAuttbEK/5FX/x8Tf
	Gk3si35te1+j/J5Od+9N7puqwPrSfEmysFJL4Keqji4YrXEvlpotbY4nTCXjXlx0
	9i0bAmE22kWQDNL13yDYbyDOgWjWTGxSgughOOLFmNocxDpSMxakjcYhMJ4slj2l
	hnTc+whwWG2E4YXnhDQduOMOTuBlAOhkP9A0KTC8ipH5sZhhNx1EvIrvochc6Ji0
	M7djkelH6RmSfvKYMDjaaOD0/OqnSETlFlGjYUwYOwJEkMpGEx7B6G3XOXD8e2Nd
	7UCxvw==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er1cbke6w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 12 Jun 2026 13:21:23 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7e6ed99d4dbso1211400a34.0
        for <ath10k@lists.infradead.org>; Fri, 12 Jun 2026 06:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781270482; x=1781875282; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PWJIctf3Xhmc1Sr2xNkWiIgvHAObX6zOuqPQdVoDfTc=;
        b=ETSP5oiNvj32dqDgOqpmpI9ADwwJ3UB+CaE6717xg2WeCAEhLii6BLNgrahBAiHsY4
         WQ4aL7FGaKyq5nToIlIrkTUZVRi8nZVlhpjuRTD1kHXxmrENwwcrlHi/ahk+E00xa8z+
         7Yaa9xCmyj2CdyXOXfW7SYxCHmM+B++ZBbcpDOz7iztlaWEU/dYS1cEX5FancL2HMLBU
         a7mlVFU4O6170DXOI7WxWB8hMO3h9ietF3e8z1JL2KJxz0pCgkNHhke6lTM4MdyCW73K
         j0tOtsDWhP/XkInrTTMy7sSRGBkpDf2QhS+r8a7HvkOCmxM5H0K5WEpiRoQrtsur3c8U
         92Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781270482; x=1781875282;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PWJIctf3Xhmc1Sr2xNkWiIgvHAObX6zOuqPQdVoDfTc=;
        b=IrJ/TnG8TCLU3d/SmHiYsEBCfGePv6qLTYvf74GPtrCJKAq7G9VU0qVQD4dSybDl2b
         nGKwpCAl/HFn63PLlgH43DwX0aaHFeYSDthSThPc7aUQqL61o7ivWz1YkLSXK1ggp8SG
         uw1KU3KCOXgntAv9xAXj/qintu1coO7nyxZ5v56YzoBkpFxeTfWQ2ZkxhK6/EmspRXTA
         MHPWx3GNxpM1+MyvWVgZK5+jjaL62v01ZIelKKZ57DwQTKBEePGqDGN/j2NjIgch6xf+
         pxijyufGrGqEPgUeXltoWm71M8Suy+JbXLj6u1lhcOkfbjFb7mHE3a8Fsu2IHh0seEWB
         QpZg==
X-Forwarded-Encrypted: i=1; AFNElJ98ui4silIJMKIwSLX36JzrewMLfr4K9Mwbb7LoRdGbTBhSBYmkrhtIS1G43QMTuRMKuGyNSP4=@lists.infradead.org
X-Gm-Message-State: AOJu0YyxTEbvNcCZNTvrUonEYZCklXg9Y5J3Jfy1MajwsswtNU2yuufo
	jxJf+NgVLJfo/OSBQaj4itwYHSDe8z8K2iSxcVY3MnUuxUQTTxXjLZQZfy/dgKOEdn+a6H0ZPXd
	bYf2u8KkzShKcfWt/PrxB16+Hk2+EvshsYPWeponERBpP5PGQTiX9y93z+gGv+tHW
X-Gm-Gg: Acq92OGp3RRDnmFWXttya5f/ca3Jj4WFRvIkP5qHENBgjkhRTjZ/AD1Ri1aDMkFlfvr
	Sx7AhtifCVhRz2WYB+UzvxI+7QKR3mFCrVyavxx2/wVwJRgXTSS5tTkwAYR36klRfrJ+POPXeWA
	qFprSEqSw68/3dzcD6ZIANejRXOunsJXfs9QqJ7/TbOX2h9xSOzyUd66pxfVk5FqPTWDsrqD+ni
	jWqzloLdykv4gVEr2ZXLktkz/leXnWrXmzaNnoxzCwOJs2945ZTc/ghhXBsj9+wv+UgcuwAf8lA
	FdvMtHwjmzrgpLXJKueOMy/TBNc7KuIKfULPorcX3/byMoIJT1IqBtBV7R9qQx1xwqWRz5Tla0c
	o5uZdGg5t8Z7GFK245laNLv506auAgq60KbCpom6g0UizD7c7333e9RY88Q5aob4x5q6x5wMN7c
	/nggOC7fTGyAZ7FDYfhk4ymTOiUdzJHpJyikKrTANoLXvG4jViDWR6qLp3pJUZF0NKA+coeUeA
X-Received: by 2002:a05:6820:6ae8:b0:69d:5b59:2414 with SMTP id 006d021491bc7-69edc798a18mr1609519eaf.42.1781270482351;
        Fri, 12 Jun 2026 06:21:22 -0700 (PDT)
X-Received: by 2002:a05:6820:6ae8:b0:69d:5b59:2414 with SMTP id 006d021491bc7-69edc798a18mr1609484eaf.42.1781270481928;
        Fri, 12 Jun 2026 06:21:21 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:3510:32cf:db6:13c6])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfe6f9c46f0sm59986866b.1.2026.06.12.06.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:21:20 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 15:20:59 +0200
Subject: [PATCH v5 7/9] Bluetooth: hci_sync: Add NVMEM-backed BD address
 retrieval
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-block-as-nvmem-v5-7-95e0b30fff90@oss.qualcomm.com>
References: <20260612-block-as-nvmem-v5-0-95e0b30fff90@oss.qualcomm.com>
In-Reply-To: <20260612-block-as-nvmem-v5-0-95e0b30fff90@oss.qualcomm.com>
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
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: 22sEMMOf3JtYoCEpaG_-TVrpPhGFvR6x
X-Proofpoint-ORIG-GUID: 22sEMMOf3JtYoCEpaG_-TVrpPhGFvR6x
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDEyMiBTYWx0ZWRfXxIzCo6/Lm9BB
 7greSs2JY7Y3kVGJj3dkdIKb8rPqOrxAjBRyfor6M62S8Lo3QSL3MNg2yKIyHSH9ue/mPN4hNzi
 d76fuyU2FlMmoGG/6Ev9NbCjbhPmKPg=
X-Authority-Analysis: v=2.4 cv=S57pBosP c=1 sm=1 tr=0 ts=6a2c07d3 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=tQ7bI2BnKgK5Av-YYOwA:9 a=QEXdDO2ut3YA:10 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDEyMiBTYWx0ZWRfX8rnzn9KbNfYh
 YmgItmXNZyP0bUGSFQiV+WlhBDNpHIZitNj9OE+e/R3FqV99Tk4ixTOt6JOZqg82Y5amqakLc4l
 O5DcbMUn8XHShzZ4R+eAps5ILZoD2V7ZD2sB7XM4ZkivW8kpmB+pkQlZqIPf+uJRpvN9kkCYwWC
 5ng4KV6zoOGUeiC5t/Yu4mTU46jAhwFL7GlTcs4/C2nlnk6QYx7GI4Za4uyMpFK63x+57RJy+QU
 5C1b4iSVocRk5jyVgOpkpCXCtrPssPvwjEvyS6qL3+K/Pd6Y74kL7/FgSaNllmy603TJpQSo+1O
 QlttqZO0eXr5BPbXZwgvNnJEcy4KCYhilwPkCOy4I8P2fSwB5oBG5FA0WwWjTDLI7FNvb7XpExg
 NGJR/o2gbhRJxbcPLnqTleToXM05144HxWfnoMggtZeYxRWu1lll2xHot6GC3UPnjJ1PwaI5PS6
 NcM3f9hHCZeFKzJmlKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606120122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_062124_434789_21829CE5 
X-CRM114-Status: GOOD (  20.93  )
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


