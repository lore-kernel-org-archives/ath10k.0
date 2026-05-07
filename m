Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 311DACD3444
	for <ath10k@archiver.kernel.org>; Thu,  7 May 2026 15:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ll9F+OHyaqBGDElRAI8+n6uN+ffWtRJkbXYf6NPAuHA=; b=E9E2lrIsABJrJJ
	IYFixvHD4DTZA1euMnhA/5/QgG8HAMSEw1qe5r6QqdKiXR7o4oQr69ugZzL3docG6MpvXQBFpb3zH
	NRZm853QFiUMyyi0/uI5J3js8C9ASvK7OHwon0dWO0PUF4kiGFQvp2bnEuB2z4QVZlmrzsSVC/EXR
	OSreMU54XBiWgxmVF7OhcfU/HH3ofFBLLur5z7t0Hi5KvR+QcscAkciQRMJZdgQCRLjTf6mOG2xBl
	A8siiDa7yEMzCvszCv6Qm/OLIVQEgubwwSZhl63wR9fKIj4CksM4EjpQkIf5v6j6VaSG/akRzJFug
	GY+ehGRo6vpeQ3ZNtTRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL0ao-00000004AYX-3tAp;
	Thu, 07 May 2026 15:24:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL0al-00000004AXm-46w0
	for ath10k@lists.infradead.org;
	Thu, 07 May 2026 15:24:49 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647EQ4891425037
	for <ath10k@lists.infradead.org>; Thu, 7 May 2026 15:24:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Ll9F+OHyaqBGDElRAI8+n6
	uN+ffWtRJkbXYf6NPAuHA=; b=k8h5R0ijahFzuRDRmRUn7uXdx+KyXMsH+h7rLk
	3jP7PVt5uJcLOJpzMXlNU1oI4smB0XWqzpO4A7gHp0Gd6Jd//fnWaZZ3rADFAiJ+
	1uGBcuWQJ6zUf4Gjaowq09Fwm2EBJjF5YIiU+w4qZxG/36UvxIHfLqSBlrT1Ke55
	yGBqQFFVyDI6fR65KG7eeuyae6g2o3x/znT0M9ZJPJ54/sezk3mf8FwBpMAebbw0
	3tL5x+jWjmpR0kpz4jgt9u1gV+SuJrdQPmWhPLV+6uxxh/uENLdap5bnY6pn2ZwY
	ad+QtWucv8jO94JFtso3NYpj60iyhE97916RLysWnKrpo2GQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0pqfsquc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 07 May 2026 15:24:46 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56fab6d9242so2266622e0c.0
        for <ath10k@lists.infradead.org>; Thu, 07 May 2026 08:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778167486; x=1778772286; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ll9F+OHyaqBGDElRAI8+n6uN+ffWtRJkbXYf6NPAuHA=;
        b=LX1wLCvDM7f12oT51ODzloeejIShDDKDpJCxv4uKi2d2a5vHJ8X4vJHAEEy3QUIwwf
         tJ6bb2iZk+bnv4+w1vkUGQCDXbNFjDbW6ThJoGz6CePS+QqRh3GuWwBkO91/xXxN997h
         FDoySq11bs7izHjqPuBP03KATdlwN+orZeF4/n74SR+yV+2WB1RNr06dCmel/mWpilFP
         fBZ2GIFj37KRwT4ECQWZKsmbdP6aOb9YdovYufZA31J4gx19RdFS/7xAvN5cGQz+IogO
         unjfZy7op+SY45UFMTqJDmeDNT0wejszSro5vot4ro0EUsxg0wfSERQFTpDp836egmG9
         dLbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778167486; x=1778772286;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ll9F+OHyaqBGDElRAI8+n6uN+ffWtRJkbXYf6NPAuHA=;
        b=NQJIeARgjQSRqlSIIk0edr47rie+94jBAkou3l4fjg00owCMUHCFywfWSxQrHqPdbf
         sgVRU6ELW/yAB2SHQ++hoswZVeYLmPtUoA5UNm+YIMpQUHwfG2Zu4DXIPxcqT8YNsHHO
         m/M8FnRdLhue45yIvKUH+v5e8XRlrDExFozGgdDF0eC0TSaO4DbKimV5m/o7AWpiatbQ
         jlHPJ/ZrhCTdLONwpf9Dew4pIFEIBcXgxYKzFu/9Zu2x+g3DOMqijM9L7R7ZH0ZAHJ/A
         5EYx+T++YmGVXJdxoT1xh9NU/wj+SMYBfmAOR5ByM9c6XZ1mHCB97/4Ud5nQjZgncX+Q
         ewMQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Whogd/vi/dUTKASjhwZb/Ov8EbuOaKzhnlQyegSazsLMBxH2ZPXlShZiFOv4NziQ6b/9Y7qw=@lists.infradead.org
X-Gm-Message-State: AOJu0YyFQk0hMs3/4+fHFpGKlr5pt6/YLHQn+digYywUb+cdcVyQtSqb
	a4UpmCuaGxCloV8wXREOTjjvhLwMCb64bpyHkNX96i9bbwaUM8XWxmqAunM4ZIHD/9GlMFJ9ife
	2X0bkaL6nXKMmgIb22fpLJEnpZnjgFu0YooYmebekSn9RFz6wCKuv3fflNAUUIE8L
X-Gm-Gg: AeBDieuX1w9IHLUssspcuPKRXP2DlgseEkg0KZmqpw1q5+EfC00B29fkjPufdtOeSn4
	yH9NAEcEr7mQO3d9xD6L/7iuio++R2kr7OmXUhIaLbi7jIhTQLVNOATb00WNybB9egQ5cU+oGCe
	HiZHw29avce0yPkii/ztbYK2/OExXvf/rvOAtiMigH8evkHuPqKmBp4IGdalMWSi05yHA/8Rq7N
	w0mu4STUHvGxKvhsdHSX+tH1gGnuvpD4DnISpe5RbeLoceK6jsU57zdY5f4jYMXgh6MQjtowUx0
	Uaob1xphbu40pRJOWMLbeYaPr9892P3SGu9Z1xZE/+NnVtZyTgyBWCIn0QOXzywSMBllQw7M4Np
	aqcpClhk80j+VTSkI9MIu9nNyBCpBkAJwm120/o8XhvNSLx0trfPG5ff2P8crcQpal4JvaGZw18
	KtorE6odxSWv2mI8PWqlQ4JC+mQJA=
X-Received: by 2002:a05:6122:3d01:b0:56b:9b7b:83e7 with SMTP id 71dfb90a1353d-57559517fbamr4919047e0c.7.1778167485613;
        Thu, 07 May 2026 08:24:45 -0700 (PDT)
X-Received: by 2002:a05:6122:3d01:b0:56b:9b7b:83e7 with SMTP id 71dfb90a1353d-57559517fbamr4919017e0c.7.1778167485065;
        Thu, 07 May 2026 08:24:45 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:b16a:3475:ec42:bcfa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bca583dd7e4sm240966b.58.2026.05.07.08.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 08:24:44 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v2 0/8] Support for block device NVMEM providers
Date: Thu, 07 May 2026 17:24:35 +0200
Message-Id: <20260507-block-as-nvmem-v2-0-bf17edd5134e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALOu/GkC/3WMQQ6CMBBFr0Jm7ZBSEMGV9zAsBhilkbba0UZDu
 LuVvZufvJ+8t4BwMCxwzBYIHI0Y7xLoXQbDRO7KaMbEoJWuVaUb7Gc/3JAEXbRssepL1XDTj9Q
 SJOke+GLeW/DcJZ6MPH34bP1Y/N6/qVigwppGXfJhX7SKTl4kf7xoHry1eRro1nX9AlXgVHSzA
 AAA
X-Change-ID: 20260428-block-as-nvmem-4b308e8bda9a
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=TJB1jVla c=1 sm=1 tr=0 ts=69fcaebe cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=VT4XjZGOAAAA:8 a=EUspDBNiAAAA:8 a=ePHxKecWVazTPeOO2bAA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=6CpsfURP9XNmmWg3j1mJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE1NCBTYWx0ZWRfX2wCe4Hv60Lp7
 8tP6YTpESPs4XC584QCsyBkGt/5keQiwVqQiG+ajzddTHsw7c8EPQC8I1Olq+7+Z2+u+RcdOt67
 WcKFrIHAJ8cnQlQybL2HIGx3ElmWd0qBxlXoGwGl9yopemJ0r81mHbmAMpsQxDCEzqnD1iK27Kf
 r0gFh8ivh7HI4j6o+uauznFgYZnhNZ4k1W8cgBxEZYF4vrvnUVWnZAcaW49kEav4tIk6b15JNMj
 phhaI8xaDV+lfPM6yD43seUgq/PLHIBuvIEsnTZeSaTTT9ebxnqGKCDYCqr6rtc+554KEyRZ+Y6
 TfP9AGqpuCMd/yFXuZjxqFrlni1wt14sPki8puaEZIkEds9/l3bgREV7vgmqhUTwjvvQY5d25j4
 jAZQi88KtHDKC7x441tOIgRkFus67pXXZZHkBofyRluZ5NkoSjIP+xtnKDQVZ9utyaayOyfohZJ
 BLRC8PfLrXm3ttVXSFA==
X-Proofpoint-GUID: a68HVfL7v8SO7GlZktXZdGNjUNpMcMv0
X-Proofpoint-ORIG-GUID: a68HVfL7v8SO7GlZktXZdGNjUNpMcMv0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070154
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_082448_157088_8CA1AE8B 
X-CRM114-Status: GOOD (  17.09  )
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

On embedded devices, it is common for factory provisioning to store
device-specific information, such as Ethernet or WiFi MAC addresses,
in a dedicated area of an eMMC partition. This avoids the need for
and additional EEPROM/OTP and leverages the persistence of eMMC.

One example is the Arduino UNO-Q, where the WiFi MAC address and the
Bluetooth Device address are stored in the eMMC Boot1 partition.

Until now, accessing this information required a custom bootloader
to read the data and inject it into the Device Tree before handing
control over to the kernel. This approach is fragile and leads to
device-specific workarounds.

Rather than adding a new NVMEM provider specifically to the eMMC
subsystem, the new support operates at the block layer, allowing any
block device to behave like other non-volatile memories such as EEPROM
or OTP.

This series builds on earlier work by Daniel Golle that enables block
devices to act as NVMEM providers:
https://lore.kernel.org/all/6061aa4201030b9bb2f8d03ef32a564fdb786ed1.1709667858.git.daniel@makrotopia.org/

It also introduces an NVMEM layout description for the Arduino UNO-Q,
allowing device-specific data stored in the eMMC Boot1 partition to
be accessed in a standard way.

WiFi and Ethernet already support retrieving MAC addresses from NVMEM.
Bluetooth requires similar support, which is also addressed.

Note that this is currently limited to MMC-backed block devices, as
only the MMC core associates a firmware node with the block device
(add_disk_fwnode). This can be easily extended in the future to
support additional block drivers.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
Changes in v2:
- Fix example nvmem-layout cells to use compatible = "mac-base"
- Squash WiFi MAC and Bluetooth BD address consumer patches into the nvmem layout patch
- Fix possible use-after-free in blk-nvmem: bnv (nvmem priv) linked to nvmem lifetime
- Simplify nvmem-cell-names from items: - const: to plain const:
- Factor out common NVMEM EUI-48 retrieval logic
- Reorder changes
- Link to v1: https://lore.kernel.org/r/20260428-block-as-nvmem-v1-0-6ad23e75190a@oss.qualcomm.com

---
Daniel Golle (1):
      block: implement NVMEM provider

Loic Poulain (7):
      dt-bindings: mmc: Document support for nvmem-layout
      dt-bindings: net: wireless: qcom,ath10k: Add NVMEM MAC address cell
      dt-bindings: bluetooth: qcom: Add NVMEM BD address cell
      net: of_net: Add of_get_nvmem_eui48() helper for EUI-48 lookup
      Bluetooth: hci_sync: Add NVMEM-backed BD address retrieval
      Bluetooth: qca: Set NVMEM BD address quirks when address is invalid
      arm64: dts: qcom: arduino-imola: Describe NVMEM layout for WiFi/BT addresses

 .../devicetree/bindings/mmc/mmc-card.yaml          |  24 +++
 .../net/bluetooth/qcom,bluetooth-common.yaml       |   9 +
 .../bindings/net/wireless/qcom,ath10k.yaml         |   9 +
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts |  34 ++++
 block/Kconfig                                      |   9 +
 block/Makefile                                     |   1 +
 block/blk-nvmem.c                                  | 188 +++++++++++++++++++++
 drivers/bluetooth/btqca.c                          |   5 +-
 drivers/nvmem/core.c                               |  13 ++
 include/linux/nvmem-consumer.h                     |   6 +
 include/linux/of_net.h                             |   7 +
 include/net/bluetooth/hci.h                        |  18 ++
 net/bluetooth/hci_sync.c                           |  39 ++++-
 net/core/of_net.c                                  |  47 ++++--
 14 files changed, 395 insertions(+), 14 deletions(-)
---
base-commit: 47c4835fc0fed583d01d90387b67633950eba2b2
change-id: 20260428-block-as-nvmem-4b308e8bda9a

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>


