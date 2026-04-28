Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5AF3FF886F
	for <ath10k@archiver.kernel.org>; Tue, 28 Apr 2026 14:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=n4/CmuMpXrsR4zeR3KixXMkaiDP4I+U9UFoAoRmEES8=; b=3SGTSybqjXKxpR
	4fzEq32Bb0VbnMQ8bN8GY/ode5qfLxbsSrHPH2yrLPwUwtwsCpP3I6JETF7GxZaC0NcJwdT52Sieq
	aVLk7EjIkRXwt5ZMHluUEAB1LHdFhRgu3Uzq1IOx5oL7CuQBol9tySwn2fyIWWtO/07N7ez2Dg60l
	xbGOjLehto234ziplir/gavSEolQU5eoVYxlnR9Xdok19YuoPD5mrQaaiAeJwxcBpBUuAXb/4KQ19
	nWz0FWm9k0zS9OQaykobhRKF11RJUUaOJchMMqfUrdPamVdlei/XsWwqfyj2HZEQCePThHqlhYPAM
	XNV6+wFxy3UuKLKe9ipQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHjLI-00000001ddB-1zaI;
	Tue, 28 Apr 2026 14:23:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHjLF-00000001dcL-1G53
	for ath10k@lists.infradead.org;
	Tue, 28 Apr 2026 14:23:14 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SA48pC3275552
	for <ath10k@lists.infradead.org>; Tue, 28 Apr 2026 14:23:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=n4/CmuMpXrsR4zeR3KixXM
	kaiDP4I+U9UFoAoRmEES8=; b=C9wFGBxwZbGqSpHYgzveA7EzaOmjjhvoKBHZZ8
	EZIfHBft9olSpK+OhwZGiP8bPv1yK+KpIVsBI5PUL5E+mu9jB6if/7LVM4B6xmv5
	3hCmLavmsPtblF2qJN5Z1NOuhRr0Qnbt34yW5yE/2skFuZby1sOPsBSR5O7KO0DW
	gLXSq7zvnCVtvzb3q7hj48z9bx1EFTSYAM3m3VgSDG4yMqCqRNW+5hMfKXeZITx8
	nU+eLTWivLYFiAH3TbfvvXf60/bZevkdcOt22fWAwFXS1Q5IfmAaVvBcgp00F08e
	h2DNFP5BZWUTJ1aBVvOKg7Oc1ynB5HzYRSI7gVi2vr4rmqig==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtttjgy4x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 28 Apr 2026 14:23:11 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-479ef25c477so5864389b6e.1
        for <ath10k@lists.infradead.org>; Tue, 28 Apr 2026 07:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777386191; x=1777990991; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n4/CmuMpXrsR4zeR3KixXMkaiDP4I+U9UFoAoRmEES8=;
        b=JaDY2b1bDsY3CHwwSIEfquUVag+d1sz0QGpc9Jkt2eWFOj+76oFTtOSzUPFvrWPioh
         Qs6VSJhlNp2z+xUoQHoO/la87P8QW+CcFB0N3itJESEjp3jYQFJUq4/5A9yK9NwiGflq
         Lkx0lvb52bGC/HDR3KHjWsWf52IWMQ2QMg9auwvQjz+Qo+re4M9UOAJV8SNuyvQN6rHC
         wr1dtzltP5bdfr4AFAbbXBgUCrY82RkHfg7bY4xltSZPRpK75+iNaeeiQcO/wJ66SfVj
         YpAmE0+miZluHobTD2ri7UPea5gDz45Zw81gBI91usBRBCJNu1XFOEslkap+es/zY5uV
         1KAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777386191; x=1777990991;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n4/CmuMpXrsR4zeR3KixXMkaiDP4I+U9UFoAoRmEES8=;
        b=NK4ZKTyPoZOd6tRlE0+Bv/suke9eW5CAAdRBjhrsodZCrEDL45fZAn1dPR6oYtGi/+
         eWGi7YGBTVoprg71y6XfvXqO40NfDY3y6nA1l78+yw8qyrmq0dMtAN4EbS6bcN7u5GwM
         Nqdkwpf88h6lXugrZzpq7JBMX6JpmWlE4A5o7425WpTAkKvzXyc44lb34OXhI5BJtBKo
         stNVK/ML1pwww3pIgUnZmSIf7pEnibONLcUfL8d8vsUZzP2XnDW8ZZPnjAc4tKfcm7JZ
         PeRXn3Wmm3/DIebCyMhs5V77WBBMuamVSra6lY6ibxqIOutoB4HzMoVATZrGivWYcbRB
         wAVA==
X-Forwarded-Encrypted: i=1; AFNElJ9+nMrEjY/HhDTUPLwmGdjfXK/i6fEzhdCj5LXZLKmrNUSbiWtonCRtsl8L0lNa2KexTliIdZ8=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywc4bNpmWrXi5vEO7Hwt5RqJ2a2/uIiEpJxRNrAAqwIF3DTJVs+
	FjLwr7ACOtCiCicjg5Wcubjbc1E1E2XnfQps399edRF+fkzgn+C1JiosOcBmQWHLq2U/1hOJzeZ
	Mr6h90Isxz6wzYvDsj7RaQ6nsrNQzZJnQZElKPc4XTQLPPYcr0hFLpPlADjFqa1K4
X-Gm-Gg: AeBDieukWlTBKX0Ik2SZQgp1nQILUJBtjJipg9W2IlnNnCT7s3fw/ITqYmE6ZeSPqIX
	ktu3exQHeSJmHFQuSCbgnuZRaZQN+w+q14Wb32Tj623c7eo7ZAqXMvTyISq+MnBwDQyXrjeaCvL
	q/t28GX31qo2ZhlaVtZjiZX+K6cX1muMWBGfpu8deWFjnmyRztxl5BpI1HS+pO14DqEc/X3RFqH
	5ZjAbkMU9RFwtNPX+idEz5Ih505PGgsBOLRUx63D+9Rv8a2Fp8BGwXJ/KZvz/mtiUJTzzt58BhP
	Izkrt1qKfxG6YOxheqRoMppkSEauxcGjAhtxig9mf6Bwf7pGAd2mFlZvNguO6WNmc7FX9IEofuj
	pxZxnvp865VtaZtoaU3OeFRXCXww0XD/S+/s/GkCUWXNZAFaGcLaPMR0sq4TH+AtQXeV77z9DFV
	AU9tt0460EO8vuYBI026JvZg0l8hs=
X-Received: by 2002:a05:6820:1ca6:b0:694:a339:43ac with SMTP id 006d021491bc7-6965cb8b5fdmr1505732eaf.42.1777386190990;
        Tue, 28 Apr 2026 07:23:10 -0700 (PDT)
X-Received: by 2002:a05:6820:1ca6:b0:694:a339:43ac with SMTP id 006d021491bc7-6965cb8b5fdmr1505690eaf.42.1777386190463;
        Tue, 28 Apr 2026 07:23:10 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:653f:4d28:6a78:a6ca])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80ba9b8c8sm107072666b.48.2026.04.28.07.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 07:23:09 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH 0/9] Support for block device NVMEM providers
Date: Tue, 28 Apr 2026 16:23:05 +0200
Message-Id: <20260428-block-as-nvmem-v1-0-6ad23e75190a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMnC8GkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEyML3aSc/ORs3cRi3byy3NRcXZMkYwOLVIuklETLRCWgpoKi1LTMCrC
 B0bG1tQDuQjwMYAAAAA==
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
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEzNiBTYWx0ZWRfX2JnpywcgjAe1
 q3tJtAZqrhKNICneNoDMg7PLf8mO3ExiRlda6pFK5413ly0rFdRNUcAUggja7qaFGEvuy/4/XRA
 09aW6Xa1TGJcOQfbF0mnEakvzuJr1Z+06TPuqCJUtO5Oox61j9uvNl2SEaCDyT2mtES6tskBsmk
 Ky+424yorVk+Fa8zF5AfsHYlTok9fpF2rUQzmdev48MIrVrvoBm3Ty33LRMRGvAtHgSvssO9iHN
 XHVoko1I+mOv0W4YTU88v2sBILgZhK0eDXMrrL/FuB+RzRaGBAWMk9tFPLbI3LLWI3AEwVc6qi+
 9ftfPQ4NCY6zt+XDREa0T/764rlQ0CKNmQONPvR3382PVJ0XlG0zXNvEuyCH1MoS6rjo56KurhM
 lZjIboBLrhM2aZe0DipNh+1oLHXGDFGVNnlqOaEvDN2xmKaurIwvqKuVAyZGxEv0PUPhN/WywxM
 rrqGa4PcYq0Tjy940pg==
X-Authority-Analysis: v=2.4 cv=TZKmcxQh c=1 sm=1 tr=0 ts=69f0c2cf cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=VT4XjZGOAAAA:8 a=EUspDBNiAAAA:8 a=d2RCo21-rtVxI0NFAHcA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22 a=6CpsfURP9XNmmWg3j1mJ:22
X-Proofpoint-GUID: SX_8JlxoRWalt6QxUlUGgMus8ggDOqHq
X-Proofpoint-ORIG-GUID: SX_8JlxoRWalt6QxUlUGgMus8ggDOqHq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_072313_509913_5CF735BC 
X-CRM114-Status: GOOD (  15.83  )
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

Note that this is currently limited to eMMC-backed block devices, as
only the eMMC core associates a firmware node with the block device
(add_disk_fwnode). This can be easily extended in the future to
support additional block drivers.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
Daniel Golle (1):
      block: implement NVMEM provider

Loic Poulain (8):
      dt-bindings: mmc: Document support for nvmem-layout
      arm64: dts: qcom: arduino-imola: Describe boot1 NVMEM layout
      dt-bindings: net: wireless: qcom,ath10k: Add NVMEM MAC address cell
      arm64: dts: qcom: arduino-imola: Get WiFi MAC from NVMEM
      dt-bindings: bluetooth: qcom: Add NVMEM BD address cell
      Bluetooth: hci_sync: Add NVMEM-backed BD address retrieval
      Bluetooth: qca: Set NVMEM BD address quirks when address is invalid
      arm64: dts: qcom: arduino-imola: Get Bluetooth BD address from NVMEM

 .../devicetree/bindings/mmc/mmc-card.yaml          |  20 +++
 .../net/bluetooth/qcom,bluetooth-common.yaml       |  10 ++
 .../bindings/net/wireless/qcom,ath10k.yaml         |  10 ++
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts |  30 ++++
 block/Kconfig                                      |   9 ++
 block/Makefile                                     |   1 +
 block/blk-nvmem.c                                  | 164 +++++++++++++++++++++
 drivers/bluetooth/btqca.c                          |   5 +-
 include/net/bluetooth/hci.h                        |  18 +++
 net/bluetooth/hci_sync.c                           |  56 ++++++-
 10 files changed, 321 insertions(+), 2 deletions(-)
---
base-commit: 47c4835fc0fed583d01d90387b67633950eba2b2
change-id: 20260428-block-as-nvmem-4b308e8bda9a

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>


