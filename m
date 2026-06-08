Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A33CD8C9F
	for <ath10k@archiver.kernel.org>; Mon,  8 Jun 2026 10:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hw/eHeJkR5tO+NdQr98v8wmguro8AATIDIzpZLKzK2E=; b=s7+d31FLE+1Vj1
	diRtKcdfZ5/EgXw1MmgslMaWYT5nkOYi1WHKDvPNIMs14KHD90u/zmWutHlsWEwg0tmDcO6c8Nqum
	HyWXwMwWgl3JM57vEnTiHkdDCVJh8QG3/aNjv1GiQd14ASl562qaa/jn+B8OIRdJKkIGyj3/PMJVn
	x3Maq7FgqcB6ODX+uk/qecMP06N0pHAByYiYtdxezrI5KENXJ1GkifweEfUp/OAlV9V/TWOiB+2SC
	E4U9/nvIerVX/biWXx/5gyfPt7WJWk2e5KCTnZfXvQExSyqTY4CSJBcwEZhr9seYd24rz4xJgXdE2
	IVhP4M5A61MmaGkt12+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWXZ9-00000003Mat-0Ex4;
	Mon, 08 Jun 2026 10:50:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWXZ6-00000003Ma5-2bqo
	for ath10k@lists.infradead.org;
	Mon, 08 Jun 2026 10:50:46 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586OuBo2832965
	for <ath10k@lists.infradead.org>; Mon, 8 Jun 2026 10:50:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hw/eHeJkR5tO+NdQr98v8w
	mguro8AATIDIzpZLKzK2E=; b=mtXioEHn1HMmoInhBE01qgoDocjx9KnU89yr8g
	QoN5WkV4prt+rvEA9e0SfeLQEvEzM3zgMsBNPckmdH/3BxX8Wg0AAbLGSgSoF2+t
	LXDHTpbTItdGAB5qgRGOfVG67fJXuiDZt+Wmefo1FwYqnWsZDTqUXGUdnjjObmhm
	EdUHmTbG21T3V856a2LN4DzrRlDdmcxCB6KxG4v9jbe2jsjZOwR9qc6f8CoBCQHj
	jNcftOQKWCiRiJ+nfH6q4pSl49lY5gloMEZA72wj74W06dGE8K/1udrCWnkuFaQR
	ivxjhZbmi+AdVZlewSY4r2KR1wQneQJkBRmMpaVZJc/+djog==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embmrfhfg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 08 Jun 2026 10:50:42 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8cea4854fe3so81490026d6.1
        for <ath10k@lists.infradead.org>; Mon, 08 Jun 2026 03:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780915842; x=1781520642; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hw/eHeJkR5tO+NdQr98v8wmguro8AATIDIzpZLKzK2E=;
        b=H2BWb+IglyPdE33wcZw9ldQ3S5NymMc2vUIx5BcbJ9BHCS9WrhLOlNf1GtZvb1T8CR
         BU90R8kZoO7OPGigGfwzibZWTjKdvyHNxPkPttUszseFFDON+bzna1IyTSg1xXTFc12o
         cWAfYl16TTdam2qKds99XO8SVqyG6se+Yw+IeAyeQM0ipwcOD78UifEXraLQZLSe6hfn
         d3ERTuGnf+sLCVwG2LpCUjrEjm+9qMULCQWPG3uZ+xK1R6gdTfZP2rKRYTFMTtXxFFg6
         kLXetCey1dvKIjJIabbkig8gagTPMbsx1x4DdlW10HVU6M6LhchpkLXS5WdvtAzcV8tQ
         Vh3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780915842; x=1781520642;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hw/eHeJkR5tO+NdQr98v8wmguro8AATIDIzpZLKzK2E=;
        b=VQIuwoO+GcZJxDh808jR3tx/AfWN62QGByfluC3Atj7jtH+0im68zn0yJxqaAqBlNH
         /p+s+rqnNvndbPkqgvaVFMDRZj+gyv1NXi6Zv2V/WXGtPtyOOYLe4as8vVKHD45bk2UQ
         6x2dv86bUzq2jRFawEO7brYPrRMTj6hFvjFyX/mktjMdpCRat6C1h4xS49INwaiyUfIO
         /8KhVkgpcwWKONgO0stMTWBzmqUy4hC8uLEt4Nh2FNUnpcx90EGeKeuqt6N93S/dX4tM
         HS6eOLk7mhYzmsJroJDa98ZCrh947S7sE0dsBoHWylUKvbP/UeskYby929ZS6OGI35a+
         bk0A==
X-Forwarded-Encrypted: i=1; AFNElJ9TLr5OuPtQlN77y2aEleG6UwtucO54wXTWp6/PiJCGDVwiynoRhkk0kYkxfU44PERFptJsZ0M=@lists.infradead.org
X-Gm-Message-State: AOJu0YwqsKpiIWcrO8IVoYOYs4NSRCoryHP2H9U2zhdgCDvGBaMw/X3k
	1tn3he5BjpFe1f+QDkRKw0u3ubXNWMspHcaAQFV7Uu7w1tKkbl+Z5E+fa8gaQ7M2TYAysJyVlw7
	Ifh/T6VNclZaq+DGQOTd63T2CTnb5pjwKlfOE+DZ69PmeJh5XulftY4rsm28DEYUI
X-Gm-Gg: Acq92OHIqXTBHd+PBPqRnG9iwqXDVm1pTdue+7UW0nZ3M7byc1PEx2euoAdaafkyQHf
	+J+CUHXIcqsVKXHsundJcQz2YQI17JOdDtbcQowMAt8jEIIODJf19k+160JZxDxwBQfXK2YquFD
	d6eK84fXlmqPgJCiZDUITi5G49OXyyOuLN9Sup1578tdqXbdTGKJ/2cAN3AFMjh4UHlml73qKIF
	q7poPHaAIMNXff0G5K2u1YCvFg9jSauHvplizZWhceBGwHsSZwDxmhSpokzk9qLjLE4O0ucYZBy
	KPrPJapMC0k7TG2TDwbGtWlFXGdnqpfHDb3aD7Leb17wUlvzZdY7xAGjKswJ3EZUB6tbIjLQGSm
	1IVeqVPnnwATSIGIAN8hBvlwTITC8a49hkKwI3+3vFvfbuk//cHcjx3PONcia7KG+mvok1b4J0W
	+EmvxdVuJKD/QhbJAPF8Rsobgc6MgXvnKCvJMuxrcVwlHvcaVRSyIPLO4TGrmkK0G1J5o0RU6FK
	w3HI+mGyrMZ
X-Received: by 2002:a05:622a:6096:b0:517:917d:e3d3 with SMTP id d75a77b69052e-51795bbf2b1mr200561761cf.36.1780915841920;
        Mon, 08 Jun 2026 03:50:41 -0700 (PDT)
X-Received: by 2002:a05:622a:6096:b0:517:917d:e3d3 with SMTP id d75a77b69052e-51795bbf2b1mr200561291cf.36.1780915841490;
        Mon, 08 Jun 2026 03:50:41 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:cc96:22ae:323b:9eff])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf051e9aa33sm850399866b.24.2026.06.08.03.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 03:50:40 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v3 0/7] Support for block device NVMEM providers
Date: Mon, 08 Jun 2026 12:50:37 +0200
Message-Id: <20260608-block-as-nvmem-v3-0-82681f50aa35@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH2eJmoC/3XMyw6CMBCF4VchXVvSC1dXvodx0dJBGinVjjYaw
 rtb2LhQN5P8k5xvJgjBApJ9NpMA0aL1Uwq5y0g3qOkM1JrURDBRsUI0VI++u1CFdIoOHC20ZA0
 02qhWkTS6BujtcwOPp9SDxbsPr82PfP3+pSKnjFbKCAl1yVumDh4xvz3U2Hnn8nTIKkbxUUpWf
 ykiKbrnNRhTclnAD2VZljcPNGyg+QAAAA==
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEwMSBTYWx0ZWRfX0cwrm6xBV65D
 WrlCoL/DHDIi7Fiq4NQFyqQmptWgzZmb4QE53q4ot3xBZecUBH6pVicilzcdtP9+kbYo0ZM9a8A
 8fYwF1c8p5RaT/zGc60cJXVbubO1g675EgmYU5ZHSJWyZWOk4DKgqC+RHkpNx4vfQBlaEjdhBrW
 W/7Nz4P365knhnKGKMGqlXwTE+x1ptwgz3fXNWU3YmnuiiW8hGIV57R3yOYN4YijDbNWy6iNKpN
 jPf3f364x0C4yCIi2KiWqpPvjoXun3hfkaU4GOcroGygnK2fgXzm/phChrCmxac3Nw52BDrqMlA
 TrdvK0CJ/6t1Z15jz0bwQBS/10Xy+Kwl63KBx65vRyQXUWRnoVTTiVLGDhv5IDT2bn1NiKcNk3+
 6aAHyl0ZuSzHb+PL41gZ+FTDKv5hegNRvNewDtxqoDg+l0HGAyS3LznlVoDmunJ2lPXS2WWciAa
 umFWA6zIexKS0UP3XuQ==
X-Authority-Analysis: v=2.4 cv=B5eJFutM c=1 sm=1 tr=0 ts=6a269e82 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=VT4XjZGOAAAA:8 a=EUspDBNiAAAA:8 a=K84096E0MCUURokRqYgA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=6CpsfURP9XNmmWg3j1mJ:22
X-Proofpoint-GUID: G1NafR_vDS1QsTC0ia7GjVg8HZQ8tnIk
X-Proofpoint-ORIG-GUID: G1NafR_vDS1QsTC0ia7GjVg8HZQ8tnIk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_035044_791337_EE5AED82 
X-CRM114-Status: GOOD (  18.25  )
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

Loic Poulain (6):
      dt-bindings: mmc: Document support for nvmem-layout
      dt-bindings: net: wireless: qcom,ath10k: Document NVMEM cells
      dt-bindings: bluetooth: qcom: Add NVMEM BD address cell
      net: of_net: Add of_get_nvmem_eui48() helper for EUI-48 lookup
      Bluetooth: hci_sync: Add NVMEM-backed BD address retrieval
      Bluetooth: qca: Set NVMEM BD address quirks when address is invalid

 .../devicetree/bindings/mmc/mmc-card.yaml          |  29 ++++
 .../net/bluetooth/qcom,bluetooth-common.yaml       |   9 ++
 .../bindings/net/wireless/qcom,ath10k.yaml         |  16 ++
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts |  39 +++++
 block/Kconfig                                      |   9 ++
 block/Makefile                                     |   1 +
 block/blk-nvmem.c                                  | 171 +++++++++++++++++++++
 drivers/bluetooth/btqca.c                          |   5 +-
 drivers/nvmem/core.c                               |  13 ++
 include/linux/nvmem-consumer.h                     |   6 +
 include/linux/of_net.h                             |   7 +
 include/net/bluetooth/hci.h                        |  18 +++
 net/bluetooth/hci_sync.c                           |  39 ++++-
 net/core/of_net.c                                  |  49 ++++--
 14 files changed, 397 insertions(+), 14 deletions(-)
---
base-commit: 47c4835fc0fed583d01d90387b67633950eba2b2
change-id: 20260428-block-as-nvmem-4b308e8bda9a

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>


