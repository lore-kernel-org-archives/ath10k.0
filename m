Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B0ACD8CAD
	for <ath10k@archiver.kernel.org>; Tue,  9 Jun 2026 07:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Bc3f7a+PYfloRmVgEBrBcpB0oTfwi5E+mma25qPWbOk=; b=R3qR7Fr9U5L4S+
	iA6IxOFc51X/CC83mMTXfT9JWwyYUyxnxYMAXjeaVq3ZAhjlbMoE73dpdIgFnlQJ2mxy64D/DVKEj
	fYUIHZncm1bIJs8Aoa+0FIl11Ko9WXSiBdyTTnwz2Tf15ixbkaFXlbjP6S8zF6Rf/a75eJVHQKzBn
	sD/r77LpO3BlohdJqVQCaHeVkxQwPle/3yMfAqjo7KmdGDt12z2yOM1dvbUWb+k20zp4AFkqc9Ls7
	sSc3/Vh4Vu7IPp3P3ls8G8oEDP+abM+uPFyX9gFQURxy3kC/pkME722/bxy8Sm6uSvLqa1DN+l5nb
	/Km5bn/8C6zfMOZ8MI8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWrGv-00000004zg9-0fDI;
	Tue, 09 Jun 2026 07:53:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWrGt-00000004zfR-1FlV
	for ath10k@lists.infradead.org;
	Tue, 09 Jun 2026 07:53:16 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597jFWE1567021
	for <ath10k@lists.infradead.org>; Tue, 9 Jun 2026 07:53:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Bc3f7a+PYfloRmVgEBrBcp
	B0oTfwi5E+mma25qPWbOk=; b=WR2QPOXwAlDHo4kjWwPXq3+xqjQzqWZz/pOcCn
	u1uCdF685AbfbOlFdnPrcH/j6V7rO8USss5dSXfwz89jmNigTZUeMK3NonHngtfK
	G/8yYKsOkYlsr4g3ARnOMmaF5EHU5PzGgc8apKsYdw1r7iq4ZIsWfK54nJGNKH9k
	8vxKIh55tLswEYjd1yGZVHvYGYYJWlji4dYKCdbjd9z8DR8G7Ws0zLD8v4d2/Tnj
	/WxErNGnw/JruqCd1kh1DdW3HZMMiwE5IlWw2ltxTM4Sg+dzaIbRstne4GFjzOAZ
	9owjpFeQyLPNhq/p2duVdx940wVJp6iLnCh6O4NCeXflyThg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeqgg14b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 09 Jun 2026 07:53:14 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51787404d3eso93325381cf.1
        for <ath10k@lists.infradead.org>; Tue, 09 Jun 2026 00:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780991594; x=1781596394; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bc3f7a+PYfloRmVgEBrBcpB0oTfwi5E+mma25qPWbOk=;
        b=f2IgFlNoN3wC4zcWwKAnwmnHuPuE+tFTFdmmDKqSiQAbCl+J8TH8H1Y5HUrdYDav2F
         9YH7tLaS0oUAe0zUo/O4dSef4MZxl57qEG3RyifBI+jmFdFbMDPQ2extZV+us/XbAgl1
         i3I7ZmeUCJKMdPSOaWh2qYoQanC1SbSx/KJCzQsJi7l0PC6HjDFdyS2uf86hh2Jh0OGz
         DBTnC/KpzrJ5FfR58FdjcqMfChkU2g9r8drnl+ewwJbeP1yVCH7hQsCt8daNHMfD7nFf
         m1n2Lx299H6WGacpYXv+lKl0/Ab3URbsydzlOf8Scw6LyyNC4phNJV7k+/TnZpZ8oF8+
         iYGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780991594; x=1781596394;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bc3f7a+PYfloRmVgEBrBcpB0oTfwi5E+mma25qPWbOk=;
        b=pmtvg+Z535XHlgzjwEBMux/Lg3GXMni7rCJSwvf/81oq48ZR3xYPAtPKG0aB2BbJS4
         Mj3a+0l4HWKNIFxWDIiPnUR2nMEUcVKHwQ6k7smSrioHex7QxYDhrTtnjyNmyHWvexs/
         qo/0UR29clRbAuGVoDkkKWDdu6E/+VhGLR9GBj7BZlONFte/T5aCpnugeSdmJNLv0mUj
         7xQvzsK3Ftpy504Tii+5ZPDl477e+Y4ts0C3y8jXhUQ8TQLnXm+oVCbWBXMfApYVdFqg
         j9uO+zw/GudBz7mpT78L3WjdrydUbyQXZlqJWLKQfLkpypq/SSH9CF9SVtuoiSayvH1k
         65pA==
X-Forwarded-Encrypted: i=1; AFNElJ9ogW0O2EfUdMLP1ptrIE6HYFzz4ZjoYGG4/uL9oas0WyQxAmwD2P3qM0hybgiYqFXkx5ZO2VA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8HwpJvWJ49WsmMC6ZX4pvfTQImN2/c4P8BDR4+W5LUEWTFuRI
	wt2KHHVdFtHC8fma1rb+hTW4Gt3jGZQFS6C/DvYppT74dsNiDsgmjhoOFxZem+rI3ZpZEdNTAyl
	lOZ977dqLZ823XQqc7p5fvLXG9qk6pKhrLC7soOlcQPUb0QlCy/qwP/j9k3ob6fS4
X-Gm-Gg: Acq92OG/P65KtW2qFd/QGjiTCBMQ6Wg88HA3Xj2pq7p+3WElQoZM214L1R0A8AJl6jY
	ekTp77/GDCh21Lt7NofSnDkIiOEzgMcCZhdmjasTz/DSg4HIIMyhnpl0Dsv5zDfx/aaBso/MXI2
	bnt/y/yMf3ljfzJpWlguDfb6ocW0+ZP1e0LH8H8qbplBm9FlU24X12a5FX4Bc6pXPDj2+H0EC0Y
	cNzDf4ziOShc45BuHQF0a/ig5cY8bRM6fDb5TRPmUS9iEPmqKserrNp1UfV3MKyH7Myyb04jIXZ
	ZzPscv/vwf13qSXRyph8vToPzu2mXvD+Ialr4LYenuakaNiyyZ6lROKzQ52MD2G0ShBCDefK+Sy
	oTCWrjT1zY/RXoYMtGmmSIq3HzBAhiTvASD0j5DO2SbS+kFDOpT+mYhUJ120A1H/E4hnOjva9+u
	whLMkPYDiXoULIsVcCGXho+EV/Bfpms6V18ItrPdrBnC8OwO5+WEmfYSsY9BtJ1gDjWX+xpuSyl
	xGkb/qZaHWF
X-Received: by 2002:a05:622a:120b:b0:516:d73d:2a34 with SMTP id d75a77b69052e-517959d300emr266975501cf.5.1780991593745;
        Tue, 09 Jun 2026 00:53:13 -0700 (PDT)
X-Received: by 2002:a05:622a:120b:b0:516:d73d:2a34 with SMTP id d75a77b69052e-517959d300emr266975221cf.5.1780991593301;
        Tue, 09 Jun 2026 00:53:13 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:cc96:22ae:323b:9eff])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e64303892sm8121631a12.0.2026.06.09.00.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 00:53:12 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v4 0/8] Support for block device NVMEM providers
Date: Tue, 09 Jun 2026 09:52:25 +0200
Message-Id: <20260609-block-as-nvmem-v4-0-45712e6b22c6@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADnGJ2oC/3XOSw6CMBCA4auYri3pg0Jx5T2Mi4EO0ghUqTYaw
 t0tbFggm0n+SebLjMTjYNGT02EkAwbrretjpMcDqRrob0itiU0EExlLhaZl66o7BU/70GFH01I
 yjbo0UACJR48Ba/tZwMs1dmP9yw3fxQ983u5SgVNGMzBCYq54weDsvE+eb2gr13VJHGQWg1gVx
 fKNIqJS1jxHYxSXKe4oclUytv1FRkWLTPNaMQCp/ijTNP0AkmAc1D8BAAA=
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA3MyBTYWx0ZWRfXx4lQFWQvOI2b
 Q0gzMND6Ow7uLx1CPg+mdySw8UnjCzJ6/u65QYJ/lIUy5WtUCZrCMVBj4+hRptnmyVWMY94NanA
 fLP2W1rZ6I00x/jYJkwBpoV6mUb0BJEjfIgsRUD0iosJ5RwS4wtqSjv19+m5LvH+81h66Zi3u29
 qr7o73aTcFfT9jiz8HF1L6HEk998M3GvCzuuoXF9R4d42TjxJqtBr7iSPAM0N276lkaOEs1Dkcs
 y22J3KSEKQjplhxTlashS3JnPwTjAbi5jj23LyxsMXn1ZxaqIFj1cZcZfjUVHCKL14uuvs1QPpL
 jEG8YTTu0lkx20yRA+bZOBh+XOpMawoXA0Xjfz/6ocleyb5xt/2HjXszBI0HDpmzquOtDbpNjJH
 MJUX+2ogKXkdaLcouXBVITXIohlZcVrdK89/wWcoUaMcldBbl/0kT4YI6G1JnHtVjm9k77vztQS
 M61aLqDb7A7D5ioLa6w==
X-Proofpoint-ORIG-GUID: mPHZUcuDusqmZ74mNujb-KXpsCg0iGo_
X-Authority-Analysis: v=2.4 cv=KdHidwYD c=1 sm=1 tr=0 ts=6a27c66a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=VT4XjZGOAAAA:8 a=EUspDBNiAAAA:8 a=4dfaE-bLb2wR0_rHmkcA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=6CpsfURP9XNmmWg3j1mJ:22
X-Proofpoint-GUID: mPHZUcuDusqmZ74mNujb-KXpsCg0iGo_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_01,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_005315_349218_EB7D2D42 
X-CRM114-Status: GOOD (  17.84  )
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

Loic Poulain (7):
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
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts |  39 +++++++
 block/Kconfig                                      |   9 ++
 block/Makefile                                     |   1 +
 block/blk-nvmem.c                                  | 114 +++++++++++++++++++++
 drivers/bluetooth/btqca.c                          |   5 +-
 include/linux/of_net.h                             |   7 ++
 include/net/bluetooth/hci.h                        |  18 ++++
 net/bluetooth/hci_sync.c                           |  39 ++++++-
 net/core/of_net.c                                  |  49 ++++++---
 12 files changed, 321 insertions(+), 14 deletions(-)
---
base-commit: 47c4835fc0fed583d01d90387b67633950eba2b2
change-id: 20260428-block-as-nvmem-4b308e8bda9a

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>


