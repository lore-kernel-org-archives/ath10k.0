Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD10C43602
	for <ath10k@archiver.kernel.org>; Fri,  3 Jul 2026 13:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ymluYMdTXrBgRp9HUa28auzpvVc2fSgjsJq4S7Nyu7s=; b=ZgdSR1kBpzV0JJ+D+QpV6Aw1//
	GNs6JtiUZ5ctB09IAb3WHxVtbfbNCa95a+ZBv+KdsyAkucWYker4O5qIDVRrVAkuE+RdUzM8eb7Ff
	3rviTDVYwlyXhLcioIQjYyo0LSsvhf6ndC6FlY68wBdsKNiiCQOZc3GcVC2HT6gwavY/mo5IkNn7O
	8/BAFKUAvdXmqzUbU0nDjvAgrm2WhA2YgFZ4u6hpIYYkdAzuzD0k1b0trItLqQXX9shaz/3V8OVgI
	claWB1b6SzLAhkXYOb2grLSOHmla1wdN6rcrFmPygX6xLgNlc4Ya9qbs8IPDBb/V9h+5n6bSs0162
	AphowVYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfeDB-000000078IF-3sT1;
	Fri, 03 Jul 2026 13:45:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfeD8-000000078De-1p7x
	for ath10k@lists.infradead.org;
	Fri, 03 Jul 2026 13:45:44 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663D1608053899
	for <ath10k@lists.infradead.org>; Fri, 3 Jul 2026 13:45:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ymluYMdTXrBgRp9HUa28auzpvVc2fSgjsJq4S7Nyu7s=; b=SRcHTfPKElZH7zR5
	N6x+mjOo4lfkFtVGi8gtj5mc8cpAnKNjUlj5WEbvsYAjET476Wivw5BFYgWov6/g
	C4T1ow2dY8Ar7eHAKGP5glgAU/9fwADqrA6ZGf7ujm5y0tKidxdl5eftbtZGQnAU
	uOXKnwufHmthmj4tntMfgvDVtSPg+7y5pkxHKiM+7pooMz6tRqWhacQZy81kVdDJ
	OatAi2KdZxut9XIFAFo4IcdwSuC2P8Q9HPLlVgeiYo8ZE0lylKX/P1d4mgVEIOxA
	2Y0KqX6PB6ExMOmRAj7MfpBRJLRec0Q1zu5ap2R2vbwi7ISn13veBJwpLnTkchYc
	sI9pog==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6dkkg4rr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 03 Jul 2026 13:45:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e53b8a302so59034885a.1
        for <ath10k@lists.infradead.org>; Fri, 03 Jul 2026 06:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783086341; x=1783691141; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ymluYMdTXrBgRp9HUa28auzpvVc2fSgjsJq4S7Nyu7s=;
        b=aamWdekiyvVSqZqpeyC2M/V858Dhtic8PEiDvSI8COfRpbEzujTQUKM8GRC81hWSHz
         o9j1hZaLutKV0AsjfAxL9GlCiV//m/IZvAAfcAlY3Z143VGgIdCrvdEa8vWCiuax1QYE
         imyPYmd9Pp9Kr3G4wVNSnNgtwFS+NTKNfcspHOgb14I73R8AkRtNtej77FjU+4cHYfbK
         2iSDPb8N0IS6a9F5m9BHkoaG3uEcsb6r5/kxIWTaEPY8SmxUwfQZgwRHWvnPwEFdaYKG
         T3vZz1Ag0ka2lvLoyc7oerJn/oBZ4FiWe6SyNs+Ji03VV+/yQqGaLdU4W2mwyBuY8lp/
         zajQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783086341; x=1783691141;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ymluYMdTXrBgRp9HUa28auzpvVc2fSgjsJq4S7Nyu7s=;
        b=dw6NGfZHdMdoJx5eiUB0UxM8WvgNREMxsrZLwCX9hpaBeK1j2eN2EZy9JyeeSHNbZU
         ff5VS1zv5Dvg4aaDMbOC6RiERppgWLaOIE7ztO7+8mKjg7KR/rNhv044kVMWFeqXk8yO
         tLOlxKOkjIy/Pc6+MrL/c3bIlVMx4M1Any0+89fkx9ztbBW8kKsZ35FsybWRANdvwIEF
         WqNO3gP5y+/n0+EWYLE/P45m/KL5yG/h4FdAbLBd9IjU+8weLROo5O4/HPrWETPfJCYw
         uMMseJwgl8RWJogm5hrto3fY6WQ/Va04iwsOvz6Aq+rnWJDvYwivRwNS9U4URmZEHlAs
         pHww==
X-Forwarded-Encrypted: i=1; AFNElJ+lKtCTJJ2MCEzkrtB2caYKZQRK7bD3shPDzo7NSUS5PmXCuBDnosZ1TLo5j9CeUKLspZJTdak=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzqc+0S7HDTUcPvmx3Bm23BudtAMWjIW9uyz+0GIAMcz7N+YyqJ
	qRQoVwqEdJCoKKbVwxfHxtcRBPRJVd2+1O+J4vyluOMiOTV/x72pQ4bSOIWn6sLpmNFsevKSnVW
	efaLE6RWYTI8lc1u8R8lXOn/6DLNdG5SMqGQP2ytswT+e76x3+/I3i6MaxQo2rFei
X-Gm-Gg: AfdE7ckEj6zbSiykKdWvD7geZKbqZnl1wRbLLaZ5H+xF8xr/RyjIKLz8RD15306QDDv
	7I99H9HvtuL4DW952DfUusi0UAMqteszYSRFe++Q/XtCR35aWA/FjpL7ngieD6+txwkZAD16irf
	DCxyeHP6p/OC14GITlBDrWIPcHPV0ldhiC0drE6RifvOF0/MUq67VKPJW3BVyj+gDceGjMADFCm
	P5a38ifQgDsWaZZhk7sp6/ywOmlG1+KGIbZlhs4V9/bF1NHivSitQnCX+cMWBFRbSFMjTrbV3Zq
	qLuTt5IZFd+nd9YR6V43IG/eZfM6ClLLe5WNeoOpzuCyYhRTi2+oB9K+eR3mEjpgAAye4RoPHEx
	60gNK26KoqqGg4tavm4NxmhccBhvkB2KFCsiezXPyDhhRnFRC/xxK3ZrAmVh4yd4e9pECLnaNHo
	hg42+U1Tg3cMPTJnw4AyaRDCwYEmV6GcL5NBh1x2VK/CY+ABBdCXQ9lTCxLz++4hg=
X-Received: by 2002:a05:620a:6846:b0:915:efa6:d70a with SMTP id af79cd13be357-92e784d06e2mr1356655685a.49.1783086340500;
        Fri, 03 Jul 2026 06:45:40 -0700 (PDT)
X-Received: by 2002:a05:620a:6846:b0:915:efa6:d70a with SMTP id af79cd13be357-92e784d06e2mr1356641385a.49.1783086339645;
        Fri, 03 Jul 2026 06:45:39 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:809d:5d56:19d9:ff8b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6059e4csm286135466b.1.2026.07.03.06.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 06:45:38 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 15:45:20 +0200
Subject: [PATCH v8 7/9] Bluetooth: hci_sync: Add NVMEM-backed BD address
 retrieval
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-block-as-nvmem-v8-7-98ae32bfc49a@oss.qualcomm.com>
References: <20260703-block-as-nvmem-v8-0-98ae32bfc49a@oss.qualcomm.com>
In-Reply-To: <20260703-block-as-nvmem-v8-0-98ae32bfc49a@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEzNSBTYWx0ZWRfX95qcRtAzDq8U
 Db8vWMy8rVvj/2tqP9WiT2iu5Pk/F1blZ648plQOz9KxHtby9NnkXQqej8zR37KztXKleALDPha
 lMIa5S8sh+6o2LSKUXpd2/hcNWKs9VmNR07YdvLpzamd6j9A9LeZ2HmClNMlAebf8FWS2w5GUaB
 pahGe+oxy5flXQ3HozLjN3m+NJ3M24KT+mmSpPGKyiZIIwf/0qxGSV1dgAt06w76r/Tt/ctvkF3
 jyHIbNWenA0LDZd4/akUl/JiSgnAbzqrAF4hCoozido1Ep5FPXiDAgzCZnfOGRG6M9+ng94bgj2
 8nctG5M0hp2u8eK27NW/2WYftNbzSOX3fSpwTo75HdrR6na8XvjCIfzST00kaQy0WtcNLCVoUEi
 ntF2e7/mpY5Dlrn7pJWZoVPgfClj4tx8xxr1byVeTkt/Wsh3PYNF47EHeNB+elcODj2ZmTeyc1i
 xT3M67Wn6q4SribHTGA==
X-Authority-Analysis: v=2.4 cv=LeUMLDfi c=1 sm=1 tr=0 ts=6a47bd05 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=QyXUC8HyAAAA:8 a=WlRemHVO3nz1l1IDBnUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: qDTDvCTXL_IKs5q4Fkmro2CBPJlVbeg7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEzNSBTYWx0ZWRfX3JoBH9QLJxDG
 hSlmefdmyK0I5JJXrljBhiXJlHAyEHw9Hd7UyAkJMCaBe1G3rBk/8pzrhU8XWg7GHhJNdK0aDU8
 BHY5bxDCFf3VH7gQlVOeBxb5dqLZHXM=
X-Proofpoint-GUID: qDTDvCTXL_IKs5q4Fkmro2CBPJlVbeg7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_064542_726907_84D4054A 
X-CRM114-Status: GOOD (  21.34  )
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
diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
index b05bb380e5f87715e2a4ac38aa7e7eb77c48549f..8f2a2d0f76adc3dd9cbe235d5ad0ed5e1667fcb6 100644
--- a/net/bluetooth/mgmt.c
+++ b/net/bluetooth/mgmt.c
@@ -617,7 +617,8 @@ static bool is_configured(struct hci_dev *hdev)
 		return false;
 
 	if ((hci_test_quirk(hdev, HCI_QUIRK_INVALID_BDADDR) ||
-	     hci_test_quirk(hdev, HCI_QUIRK_USE_BDADDR_PROPERTY)) &&
+	     hci_test_quirk(hdev, HCI_QUIRK_USE_BDADDR_PROPERTY) ||
+	     hci_test_quirk(hdev, HCI_QUIRK_USE_BDADDR_NVMEM)) &&
 	    !bacmp(&hdev->public_addr, BDADDR_ANY))
 		return false;
 
@@ -633,7 +634,8 @@ static __le32 get_missing_options(struct hci_dev *hdev)
 		options |= MGMT_OPTION_EXTERNAL_CONFIG;
 
 	if ((hci_test_quirk(hdev, HCI_QUIRK_INVALID_BDADDR) ||
-	     hci_test_quirk(hdev, HCI_QUIRK_USE_BDADDR_PROPERTY)) &&
+	     hci_test_quirk(hdev, HCI_QUIRK_USE_BDADDR_PROPERTY) ||
+	     hci_test_quirk(hdev, HCI_QUIRK_USE_BDADDR_NVMEM)) &&
 	    !bacmp(&hdev->public_addr, BDADDR_ANY))
 		options |= MGMT_OPTION_PUBLIC_ADDRESS;
 

-- 
2.34.1


