Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB1CFCD98CE
	for <ath10k@archiver.kernel.org>; Fri, 12 Jun 2026 13:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=N1CimfNGzeKqFKCWpq+lvsmNvHBjXLnVmVAB9wSi3oU=; b=uRwL9wt2Bn76mr
	TYg+5yOKjPZDkRafF3cF6iCKAdt++K9sgNtkVxSxp3S2rTsZJQewTdOpj0e9pBas78KkyPSGN0ZuD
	jyRVZrXqWwbYQosriX4XC/zJxra9nLWQVHf8Lu2JP5pKX5Ye2ygCWzPpqghQ08iVSFaJyZR6qXiCy
	IAdr2MVhNqL3OQy2OMJhPBYfWIKvFrwtObR0ZrMoPzmstTTUFgBrXDQmhxY4YZzT1iSRBdC19/nC8
	TLpnF4pwOLU5P0JJTNDYwzkxHKIF/uiJPyBeZqUuKFMWzKgXJiGRVjnfSp7VLGGSxPXnd30RpXxql
	OVHNOUMwn0o/ZB2NDmAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1ol-0000000AwnD-3JXL;
	Fri, 12 Jun 2026 13:21:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1oi-0000000AwmG-1vl8
	for ath10k@lists.infradead.org;
	Fri, 12 Jun 2026 13:21:01 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65CCj4Va3733341
	for <ath10k@lists.infradead.org>; Fri, 12 Jun 2026 13:21:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=N1CimfNGzeKqFKCWpq+lvs
	mNvHBjXLnVmVAB9wSi3oU=; b=oaJQapJLrzpwrAd1P0fqL/Enj+7GGiLmyyIkgE
	IpUoFqTTWP10vsWx/Xg1UOSE4POfkZYqAILg19xsc1JQHg08RGu0ckRWYak2OUMb
	nXwBOKdplLb8F/C7uPC7wofZZy3UwQprLAjDKUasFbS/qoo8VarphtlqwUrI2EWH
	pWOEBWoBfttfxYnl5pXNq7Bu49adNtN9J1QN5d7OhmM/jBmm+cMRQQGaMGP2OkbG
	1/WZp/f4Sf4GUJSB74sJnvoEAYS5Ln5sN+dUd+rZJhuJQeM6uqszs8vy1BTN8xvF
	mH7zIP2wlG4foxVhYPJ5lWR1nWv9+lx2FO8eN0CiR9UgHj9Q==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er2r72xh2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 12 Jun 2026 13:20:59 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-964172af027so846340241.3
        for <ath10k@lists.infradead.org>; Fri, 12 Jun 2026 06:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781270459; x=1781875259; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N1CimfNGzeKqFKCWpq+lvsmNvHBjXLnVmVAB9wSi3oU=;
        b=PyI/kYDPFCcKSXF+fulKZ2JNWt5+FoT1J+ifw77tBjW23I4H7P5eI47/qYqT6p1jXb
         ONzon7AGAejOZt3a0fVstbO7FRl4oW4FhnbXkLC41Aho+xficznF0tazO//AVQmPnViB
         VaXWAU2vonL6D4M8YnlCJlZMDQQU3uLgNfGlwX14oJScj3CpQ90yjVsAVh4Ze8u3uavu
         aMjjfSrvGLv1h4WaFo8r4ZKHBrtLbIHVUZAy9qEgAs32wvW1pqoL0Lc0N+XzIuADW3jX
         exyHrzB0M16uaBudak/1jOoWFWPTJrCk7Y0UIXx5uAwZr296CfoihidhKG2HgEl83ZI3
         EmBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781270459; x=1781875259;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N1CimfNGzeKqFKCWpq+lvsmNvHBjXLnVmVAB9wSi3oU=;
        b=OkLXeci626nKWgQXaAb4LjPl4Zn/Pp3D7JC3GniR1ugiywkJInKiOQnWGUOPhgMACp
         MP+rA6FdKGRdn72t8KyelS4r2smFfoLBp2r1HtS3NZyGQMEAOWjvUuix5t4S4qJjmqBm
         GL2WWCK+TPeYM2KHUdj6TpGx3VGg8Y/F/Lu9sz6aRTXTXjh1rWBuuCOznp4mI9Qm2esc
         yl8YlLGKvd7mVodIPdm78s62zwCXVgQOfO/vdCNHBnEMTlciQO3Hfd/ZiLzmlLkxnto0
         m2J0WekSaFSYo9ittIVk5bMxUEx/M+IMip95Lrue5uy4bwWqZIjioHBnXzK+Sb037t1Z
         62Mg==
X-Forwarded-Encrypted: i=1; AFNElJ8e6M0/Cz5OWZi3SS6ywHzZ1p/r6dFkHCv98OuKXXrh//WCVT+PrNohQsqXN+1Yu2D2msB6Bfk=@lists.infradead.org
X-Gm-Message-State: AOJu0YyBX/xE3IZFCZpAyK7RRjZSe5L+d5uLj/2zn31uASB13XEixbUp
	QQS4Ly5i1fpN+Zvgj5MyHi8Z9KI+5zRnmuDbic0nl/9+v7II8cpr3prkgK6dcwTlRhlRwohYtVP
	zmF2xxQMMRurDeHbYwjH6KRctbJkgSrcKK+fx9vYX8TEGWybpEQLKd/xiA1UGyoGh
X-Gm-Gg: Acq92OE19n9A1IhFSe7A6v7QIaLLiivBttZ6KQVZpHFR4++q8Ac6PAVMglNYvM00ygg
	FVTR8z2UhVtFZQtGXoqSvlqmu3d7Kq0kdDFG+D+pQJaaYJ3Zfp8LiF1DQirLgG5Pto61IsS/hTY
	mvMqjqG35NmB828TOlxbps4jJxJc0ArXvZiSiPEf37UBEnlBTUvXqyLaLkOG0421/TG66VjDjS+
	9mIcwXOhebsxVMYI17IpVYM722fNRR8+UL7ClUnfn4f/gnQ751ciqAg1OUNKiegQxbR9idU9aX4
	Dmxna+Xht1tAOltEFyF1gtSfLv7KCg19rAtWQGmdT01SAzmLErrBYVvgS/+6sdkDj54801aBO2c
	pVhLAjnOD0hA4uDoLPn9seAXKU4XXTZsRVZWb58XO8IO5DfK27xE3A8m8mg+wwDaMzcpaeWQDks
	gFrgfHdd3T+P3/v6sYdOTzTpeQPMoxHXLCqLYtCMQoaoA83nV5j5NddmhIeGCfSXzC6LjZoH8u
X-Received: by 2002:a05:6102:580c:b0:6ef:dc8c:9367 with SMTP id ada2fe7eead31-71e88adcb08mr1374076137.5.1781270458872;
        Fri, 12 Jun 2026 06:20:58 -0700 (PDT)
X-Received: by 2002:a05:6102:580c:b0:6ef:dc8c:9367 with SMTP id ada2fe7eead31-71e88adcb08mr1374007137.5.1781270458425;
        Fri, 12 Jun 2026 06:20:58 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:3510:32cf:db6:13c6])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfe6f9c46f0sm59986866b.1.2026.06.12.06.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:20:57 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v5 0/9] Support for block device NVMEM providers
Date: Fri, 12 Jun 2026 15:20:52 +0200
Message-Id: <20260612-block-as-nvmem-v5-0-95e0b30fff90@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALUHLGoC/3XOzW7CMAzA8VdBOS8ocT6actp7IA5O40I02rAGo
 k2o777AhUmlF0t/S/7Jd5ZpipTZbnNnE5WYYxprmI8N6044HonHUJuBACs0OO7PqfvimPlYBhq
 49ko4cj5gi6weXSbq488T3B9qn2K+pun36Rf52K5SRXLBLQZQ1BjZCvxMOW+/b3ju0jBs62APs
 cBLMaJZKFAV38uGQjBSaVpR1EuxYvmLqooD62RvBKIyK4r+r7QLRVdFm0YCWQ/Q2TfKPM9/L61
 ZOoUBAAA=
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: MLzrzCSYIhPDxUA6vvuD4pKddoxRsR6o
X-Authority-Analysis: v=2.4 cv=RJGD2Yi+ c=1 sm=1 tr=0 ts=6a2c07bb cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=VT4XjZGOAAAA:8 a=EUspDBNiAAAA:8 a=H1RoBJpM21yDxn_SvroA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=6CpsfURP9XNmmWg3j1mJ:22
X-Proofpoint-GUID: MLzrzCSYIhPDxUA6vvuD4pKddoxRsR6o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDEyMiBTYWx0ZWRfXyeRQcSRTSuLs
 96PbF5ZGKvRM8L/5jk0dpqBhDEJbvgON5Q/ddJ+IrL1rjVWRtcaBoynpVvRFVMuDUxemNuL7q6f
 QIdo061lSVhK9OCQR0ZLr4y3CdbXQJMIT5mAeon9g+9McPtBoiEepRf3CYwF4kCFj3WxvxxGr1f
 5vpjz5nqkl5TCK8IMt6UP+SD6U/QZBybI5n00jCieozsS2CwMpD/OhdQJ5lcInHyT8aUc0tmRq8
 iC+W7GTtgflJ6iZp4MZEvI+jynCmcsmLWfjyeS5jh/vnN0dEylC04Cd4OrCpBq6R8cDGeypCEOj
 UZ7Ytvq8E5lURqSeHeEfYbUKws8nwsXL0cRlRwAEjk7136e/DC/MDtE+b13jtPzxMoHgw9zlVVk
 /9HsR4++8F5jmXW+fB34QvH5gYE0QGEUF8HqFMrzQvwIb28IoqoVnHUutjTI4X0ZgxXLGnxBuPR
 hAFn8OXtwYPTkz4SUcg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDEyMiBTYWx0ZWRfX8i918OehWlIt
 0miUIf3WRdKrHl3jQGUN0hZmcB8n5ojP/lpvBlvYxSvxX3ASoX/I/Pj8VwxR4g6B7xEhqMGkn4r
 HnzY8k4CKtXAN0YHSa8Jm+eVozAZK8g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_062100_535502_C21A2219 
X-CRM114-Status: GOOD (  19.67  )
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
Changes in v5:
- Fixed ath10k binding issue + extended commit message (Krzysztof)
- Moved blk-nvmem handling to block core instead of a class_interface
  This allows correct/robust integration with block device life cycle (Bartosz).
- block: partitions: of: Skip child nodes without reg property (sashiko)
- Link to v4: https://lore.kernel.org/r/20260609-block-as-nvmem-v4-0-45712e6b22c6@oss.qualcomm.com

Changes in v4:
- Fix squash issue (dts commit incorrectly squashed) (Konrad)
- Use devres for nvmem resources (Bartosz)
- use __free() destructor helper when possible (Bartosz)
- Fix value return checking for bdev_file_open_by_dev
- Link to v3: https://lore.kernel.org/r/20260608-block-as-nvmem-v3-0-82681f50aa35@oss.qualcomm.com

Changes in v3:
- Fixed missing 'fixed-partitions' compatible in partition (Rob)
- Fixed clashing nvmem cells, document calibration along mac (Sashiko)
- Remove workaround to handle dangling nvmem references after
  unregistering, this is a generic nvmem framework issue handled
  in Bartosz's series:
   https://lore.kernel.org/all/20260429-nvmem-unbind-v3-0-2a694f95395b@oss.qualcomm.com/
- Validate mac (is_valid_ether_addr) before copying to output buffer
- Link to v2: https://lore.kernel.org/r/20260507-block-as-nvmem-v2-0-bf17edd5134e@oss.qualcomm.com

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

Loic Poulain (8):
      block: partitions: of: Skip child nodes without reg property
      dt-bindings: mmc: Document support for nvmem-layout
      dt-bindings: net: wireless: qcom,ath10k: Document NVMEM cells
      dt-bindings: bluetooth: qcom: Add NVMEM BD address cell
      net: of_net: Add of_get_nvmem_eui48() helper for EUI-48 lookup
      Bluetooth: hci_sync: Add NVMEM-backed BD address retrieval
      Bluetooth: qca: Set NVMEM BD address quirks when address is invalid
      arm64: dts: qcom: arduino-imola: Describe NVMEM layout for WiFi/BT addresses

 .../devicetree/bindings/mmc/mmc-card.yaml          |  29 ++++++
 .../net/bluetooth/qcom,bluetooth-common.yaml       |   9 ++
 .../bindings/net/wireless/qcom,ath10k.yaml         |  16 +++
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts |  39 ++++++++
 block/Kconfig                                      |   9 ++
 block/Makefile                                     |   1 +
 block/blk-nvmem.c                                  | 109 +++++++++++++++++++++
 block/blk.h                                        |   8 ++
 block/genhd.c                                      |   4 +
 block/partitions/of.c                              |  20 ++--
 drivers/bluetooth/btqca.c                          |   5 +-
 include/linux/blk_types.h                          |   3 +
 include/linux/blkdev.h                             |   1 +
 include/linux/of_net.h                             |   7 ++
 include/net/bluetooth/hci.h                        |  18 ++++
 net/bluetooth/hci_sync.c                           |  39 +++++++-
 net/core/of_net.c                                  |  49 ++++++---
 17 files changed, 345 insertions(+), 21 deletions(-)
---
base-commit: ccb7390d6cdb23b298a6e2a7028ec134dfc4db10
change-id: 20260428-block-as-nvmem-4b308e8bda9a

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>


