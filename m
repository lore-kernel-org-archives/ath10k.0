Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1874CCC6B33
	for <ath10k@archiver.kernel.org>; Thu, 15 Oct 2026 14:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S2pLh6KbXd9OKT880BVflHuBCk2sw7UKfLHTzSWPYoQ=; b=o1+jS4Ongqf7hv03hof/fVza0d
	t0gG1dJSEeOMsU+LMWuqhDpF19rZpd81ijg/ekWBRmHuuCwA0KVyWltO9RBG+TccSjZtr+IJsp7hW
	anBNZUbDsQiqK72w5u85Oy7uG5cBC14Z5myffUDmPUrvVXmTLcZW3xqNGkLZzBiMShZWdjo50xQGm
	jaAHPIIazqAR7axGmC5SrOe3jIjkLvKWYs1Feritb6cwz6V+s/tXVnIxvkcnnKgchifAcO4NqxvEg
	cMOM9Q6yRR4gFLAnafP1S0ZYlLpwDdqRIKUWwO/LUY4iwNVYaSD5yPvMYXFS7pLjplpKGWkHfZ/EN
	WaLzwDJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHMPn-00000000MTj-23NC;
	Thu, 15 Oct 2026 14:26:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHMPe-00000000MLA-41iu
	for ath10k@lists.infradead.org;
	Thu, 15 Oct 2026 14:26:34 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jfCC1955778
	for <ath10k@lists.infradead.org>; Thu, 15 Oct 2026 14:26:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S2pLh6KbXd9OKT880BVflHuBCk2sw7UKfLHTzSWPYoQ=; b=YcwVFhyxfMrHENEp
	raSVyukRIDGjDfYeppHUHgebFWXvB4LYRB/MVNCe/T/B7RdYx5JkudSK4UqQBcHJ
	LNttiBotdFqZdwtMcrYDh7plOiWvJwkwbdlayekdVub022QeynZH/RrBn/N8YfOW
	ZPZGSU+xOAdSpJKpsd4FETRMc+wybVA17KYfkKj6AkFddmV29+Oo3e6iBGKiI1dS
	PLSdBVWwWYiY2hW0ZrFHmGe1AiKPVyGmZJLtyfxcKVdFz2rS4cvBekyHb7neTyuk
	Yik6xQXnx966gznMXS3l5wpdIpuG+mlqTGWQEQEZCFhCIRwXwj2lQqJJyL0tzGml
	d/ghQw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakdeubj3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 15 Oct 2026 14:26:29 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7cb225252f4so28026137.0
        for <ath10k@lists.infradead.org>; Thu, 15 Oct 2026 07:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792074389; x=1792679189; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S2pLh6KbXd9OKT880BVflHuBCk2sw7UKfLHTzSWPYoQ=;
        b=dZwIh8+y9tNRc0VaSo8lMc2BOIvovsOeiqIH4k8H+dHrehyqvx0uwHuIc7gw6AsNd0
         TDI8pw69Okc0hyt6yX3W0AOCRXAtxhP16FwosQceIl+fRuw63q1YiFc1GZE/TSPbaqAF
         UUmV/Z8OBQDBjb83WLV+6hCKm89RuZzm+5eBpfnAmpbR1jKVjgjuMuySlcQVOa/aj/bZ
         dCx05K9kTLLN0q61Wu/eTCTQcjlHk8iaooAddoIaEcfwLQ/2K420JW8qPARI6G+6P7vF
         G7gMzmVg5FZnnspcQALEw889xNB6WWJkuT/pLBAN6Wks6Qb3uwNc2T9BMOMgnqHu7ppj
         2Cvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792074389; x=1792679189;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S2pLh6KbXd9OKT880BVflHuBCk2sw7UKfLHTzSWPYoQ=;
        b=tL/LSwYgoFqco/p3iAzESvynykm8CEpKxo5Q+rXt8N9lt7WEAuB1xrBz1iMSu/kCxc
         qYvF6Lf9EAlS9ru7VREK6KC/NJ9iD7uj3d4KQww6hydpybuCTDaHlL6twKSGx5cmScUl
         eJ+lcm3N13BDET3Rf+hwudYliwdfrq2UGqFME8ReQDaoOuygQfZAkUkVaucz8hfHFjci
         B8uWQYjrgGUftsNpbrNL3aIwuYVq2dNzlOc80uIc7bOXFk4JPyogVuGvRBEJqhgcngyz
         RTHjA3NtjORLa9Jbjx0oHy+HARb28spolLrcqS7vDLZVshwPtdIjC8+PJJ8f5bAXjoDe
         mF8g==
X-Forwarded-Encrypted: i=1; AKwUvBxL8M3iKeoEWSCT0ui1RYUeLFDKaqthMPnIs+0rU7LIwY6bYXVcBw7TWWC8pIF/1Mt+7mfc9m0=@lists.infradead.org
X-Gm-Message-State: AFq9FYJj0OXw8d6snhSuT9gbXBm/x+5CPCoY35cu2T6nB7BGs5H0dAqm
	ZGgn026FG+L5ULp6Mf3AkefH0bU1P+mL75nhpnjpyeNnEBT6I4p31Y46Y0KzlzWss8IDId0M0pi
	Sv7DwjGAa06jk/LpszVNN/U2GOyWlK82NpRmOThkBQHFQ6a0SQ8PHGOEGEQhh9Mkj
X-Gm-Gg: AYBFou1g7NEjaJsx2VfDtrsq6h7/XJWAzKapl/PfJlMe6u4p6Sy2FvB1DX70OYhqKaa
	y8cBl/uGXT8yCYrkH4c+LxHYMS2np/K+uWBqFFmFxAE7evKWbQajbN7iYno4IT9OWQqLW0IjF3N
	i9c58032GvCQnaqpVyY3npY2krclcOirqWwXHYi4CiY/5YYp6qy8TsQlKx867WpCQW2Z1BQ1XlG
	Pk60+vlzBaqzVSJ5qtH69gAmrJ4RopHDYhnLpHpLChwP0UtGfcGItl1vBdVCrqgR6ovuXZ6zzj6
	fBbQG8yycl7TJQ6hqi9N0IemWDqyQyxuEus7ZUlvi9+yYungJhoprTLMxRluidGd1hg+79Dxkfj
	O5U9NJiDfpiWtlZE5r10sUBvNl/iJZZQ4lyew2uzK6pL5E2BBJoo0N/ImcLT+Wyh6qEjKKSIhGL
	pwNKiQt8Uk//yzeYs1A3kItfvVarsewaSM4gOAYTc1dlnPFjeimzU=
X-Received: by 2002:a05:6102:1941:b0:7cc:14d:52e4 with SMTP id ada2fe7eead31-7cc180e4504mr55362137.8.1792074388830;
        Thu, 15 Oct 2026 07:26:28 -0700 (PDT)
X-Received: by 2002:a05:6102:1941:b0:7cc:14d:52e4 with SMTP id ada2fe7eead31-7cc180e4504mr55320137.8.1792074388076;
        Thu, 15 Oct 2026 07:26:28 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:5402:5e0b:9ef0:9b5b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd6428b3sm69083145e9.1.2026.10.15.07.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:26:26 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 16:26:04 +0200
Subject: [PATCH v11 5/7] Bluetooth: hci_sync: Add NVMEM-backed BD address
 retrieval
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-block-as-nvmem-v11-5-f890ac74f87d@oss.qualcomm.com>
References: <20261015-block-as-nvmem-v11-0-f890ac74f87d@oss.qualcomm.com>
In-Reply-To: <20261015-block-as-nvmem-v11-0-f890ac74f87d@oss.qualcomm.com>
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
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Eric Dumazet <edumazet@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Piotr Kwapulinski <piotr.kwapulinski@intel.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=OdENnRTY c=1 sm=1 tr=0 ts=6ad0e295 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=QyXUC8HyAAAA:8 a=ZruV3ba3MPUC-7CJ7xEA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: eTHnC8k5v6oIKWq5SDN2MfnI6OK2tgev
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1NyBTYWx0ZWRfX3LKpqqvdpZRT
 NJxD9cjuXUjM/qMJjsCSLbwEtjopdC1Rgs7Rv96dOU6Fz2GSnC0mgg2FJRam74uyk3Dzl27DPPz
 T6ViWa42lSKUFsqXUuMBvkViWAb0obbYc3+tZ7ol4GiREHnFlh/NdAtNVPBYwrIXA/Va7PoBdqm
 kna8QPsNfNtgba3K3KhkmRJzghrHy2VOgmKZDEwBK1nhNmthN7Wus+j6QBlQF62upqGSazyhIQ1
 8xBBQr0ry+joR6KWmlGJrGfwdeWqLOXCMQXK8cUNnbd7AFcMCiDRE0LaN2K9GUcwwZY+reOYWXZ
 acy5p6+88319MXumdwvyHofGTu6AX7IeigpHULLn1hgYqWdw9OFS53BgkaBJmpeDtKNj4GVn3yv
 cAWixHm0i7pu4/fGIxzuDuCzEE0ulBvDgzHjJreGrjDAhjmNBx9iRgyor8LvFra52QWxLQFG5+f
 FKblikmtWqGYlQek7HQ==
X-Proofpoint-GUID: eTHnC8k5v6oIKWq5SDN2MfnI6OK2tgev
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1NyBTYWx0ZWRfX1JqApzeV1TD2
 Afye7f0uMh22kFIBy6GoxhKaHJBnouyC2wxom6G9KSJiB5guSjVz+vp9howqOgJcOmAf5xh8AQY
 oWGFGM3IluTqkIaFTh8wAOlyUqvyGBg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_072631_907430_5D36C376 
X-CRM114-Status: GOOD (  21.50  )
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
index 1641d879dbda997604518207ffd5dd4b02c7bf04..ed8ebdf259fa323a6d02ba6f1d75b15b6945eed1 100644
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
index efbd2e5387c0b2cefec5a9919c4295fa41acca0a..a0f1f8fc39c38028b291014c33eb424856794fd4 100644
--- a/net/bluetooth/hci_sync.c
+++ b/net/bluetooth/hci_sync.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/property.h>
+#include <linux/of_net.h>
 
 #include <net/bluetooth/bluetooth.h>
 #include <net/bluetooth/hci_core.h>
@@ -3771,6 +3772,39 @@ int hci_powered_update_sync(struct hci_dev *hdev)
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
@@ -5332,12 +5366,17 @@ static int hci_dev_setup_sync(struct hci_dev *hdev)
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
index 3b9c82bd2f027e987447e50c0072ad0b5a3227b1..4520cd160a6c145c1bd27c197d5b2f617ec504dd 100644
--- a/net/bluetooth/mgmt.c
+++ b/net/bluetooth/mgmt.c
@@ -613,7 +613,8 @@ static bool is_configured(struct hci_dev *hdev)
 		return false;
 
 	if ((hci_test_quirk(hdev, HCI_QUIRK_INVALID_BDADDR) ||
-	     hci_test_quirk(hdev, HCI_QUIRK_USE_BDADDR_PROPERTY)) &&
+	     hci_test_quirk(hdev, HCI_QUIRK_USE_BDADDR_PROPERTY) ||
+	     hci_test_quirk(hdev, HCI_QUIRK_USE_BDADDR_NVMEM)) &&
 	    !bacmp(&hdev->public_addr, BDADDR_ANY))
 		return false;
 
@@ -629,7 +630,8 @@ static __le32 get_missing_options(struct hci_dev *hdev)
 		options |= MGMT_OPTION_EXTERNAL_CONFIG;
 
 	if ((hci_test_quirk(hdev, HCI_QUIRK_INVALID_BDADDR) ||
-	     hci_test_quirk(hdev, HCI_QUIRK_USE_BDADDR_PROPERTY)) &&
+	     hci_test_quirk(hdev, HCI_QUIRK_USE_BDADDR_PROPERTY) ||
+	     hci_test_quirk(hdev, HCI_QUIRK_USE_BDADDR_NVMEM)) &&
 	    !bacmp(&hdev->public_addr, BDADDR_ANY))
 		options |= MGMT_OPTION_PUBLIC_ADDRESS;
 

-- 
2.34.1


