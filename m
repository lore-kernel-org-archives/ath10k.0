Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B12DC55162
	for <ath10k@archiver.kernel.org>; Thu, 30 Jul 2026 16:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=B4zwD6yt/500H48+4ETnP6OGaSwFDNT4rMvE93Qd9n4=; b=Df+7t6XFZbW7rD
	0h9Ro5NQIpQALwBHVbq6FnXYLem5X1qRl0otUSfX6BgQzC0Tz5EMfwQj4F0ynoil37u3TBgwwotG3
	g1CNWPEOlyM4LP0JkzQmzslLYO+vV5Ar7mHQKqdoVAxXQFc9VfvUci1UExaIt3PgOPhMoN5ZCzF5h
	MeRVYTkreXd5at5HPVTcmMG7HknPeDSP6z/Eg4W8rWwkokDcL93Qypv+a8G1Dc/st27riOwDIQel4
	pFxLG/Ts+yIKDHWUM61E0aC8CK0wDRewgBqLJefHRSObnyBgpFde1DT2uAFnnCmbrcgkCEE48yK0t
	ECDC6j57qRsICtoXEdHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTBb-0000000AuK0-1Onr;
	Thu, 30 Jul 2026 16:00:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTBY-0000000AuJd-0auR
	for ath10k@lists.infradead.org;
	Thu, 30 Jul 2026 16:00:41 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UFQqph1490188
	for <ath10k@lists.infradead.org>; Thu, 30 Jul 2026 16:00:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=B4zwD6yt/500H48+4ETnP6
	OGaSwFDNT4rMvE93Qd9n4=; b=kNdbGaExZTGsb0OciycAs2Ibt11TyFMMA/hOfU
	nEwR4Zj7O0NKp3BKDXZgCROzPJ5SeYdpPioCR8/xjyLPEQnK3zLnqojpfwMjKQAy
	wL2UeDPOCHXqF+KmD2kUogWrcpJXb8jyZ5cczDbs3NwmalJJosvTyGnhRuBHRsXq
	HKwD2Mio9kL22DPaCIrK0vxSBsgyUyAuYqMqHOkzcVyHK30z8/rUQqvb0vXtb0dQ
	VnP5Lp5L21e/SRgQ97WrTjEQQmafCMiSs7UVzAe8kQ7TZStU4Ez5MNDOZTAvWNdv
	+8Tajc2N9Y/02ZXVpjEXz9FuHkdAQSIMDxIvWrT/eE1Tw50A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8md0dm5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 30 Jul 2026 16:00:38 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1a97644aso25861481cf.2
        for <ath10k@lists.infradead.org>; Thu, 30 Jul 2026 09:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785427237; x=1786032037; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=B4zwD6yt/500H48+4ETnP6OGaSwFDNT4rMvE93Qd9n4=;
        b=PRqiwGpK54GtywN7qF7xHwNPBCU+SEpxN4KgjPf4Obwl7bihbymUnQdK2wk+C07ZuN
         tVHWZ/1Zz8Khnz7946h85gCXl4UhpI6jl8H8L16Fhg4PvYQoON3pWdFG3ruWmkGDPDI4
         qajvIq9+kzYm1b4BgJlpcS2+4wlUOLSskf638Tzj5hnP/1m13m9YesPWAfZTf9Im5Y8O
         e682qV73tbJiElet30Q0EuEGHVNmTfgy+YDqxikmgzeB/h/MHP8qtx8ihJKbkg/yf8Qi
         TVDvwZcFoFKjIfM/XFX4vGVIlJmhL9lW/44Ia0svtLoxjmUOgYHqQnAQro2RXqQkm5Gt
         KOoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785427237; x=1786032037;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=B4zwD6yt/500H48+4ETnP6OGaSwFDNT4rMvE93Qd9n4=;
        b=fjmn54iPDKcBnGnwTUmG60dlA6jznoKX/W7haX0v3QTNjs8ulE/b5r2OXn9xBn1MKP
         tik7AHHTkqAaDnAvaUZIwW+TEHCiFH0+loVKdYiSjAkLutvjJsr1+ntlV8O0J6Rd+W2f
         CaRKzFtnEHy3szeETgVs8ZjVTseFp/K4OAWUSgqB9oiaqLGfWUWVFysAIg8X8HCa9pP/
         ePjmWFbOS5Q8YJr1IfwqAw1MgBKi+hzbnTRnILUEKbAyrmIkK88aDHb9sOWzmwhiYqRv
         nxwvZ/TuPZLRGEocb4cxvBrgakimXc+wkdwbBP0F3CpHgvxZxync4lLpuYklIOZ5DBaF
         PJZQ==
X-Forwarded-Encrypted: i=1; AHgh+RrjfQ4lq20GCiq2Fpav+VBFbZEYxRNNoL57KLiKgF6Djqjjl8JkTA8sjlJPF05yqOjtNBzxotU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5RYVCk2/gL6cHtpqcPdZ25t3A/LIdhY1u+e99BNE8LNGWuhpj
	5iL8KfVMFmisK9KrBTwnNh9oDwgHyi78u6FBBZCjj6W9E/zqyzjhnNgFAjiLPuhb131prHsKbjt
	dInv8UArz+Gk5ifXE7E8KfNiLKWQfoxD8U3qlK6poVdhHk1c5IAghAbyO3YvjyqCM
X-Gm-Gg: AR+sD11L3LhVtNSfQ23WT4Eh1i36k6CNweVm5YNLneykGn4UngMyJsqS7+YtwtLccgm
	0HDJzqgCIkiW8R81gjUVfqUujdsd3fGEXyIt4BSvhNqpPBrZnW/w7GUpCZhAnqDzCw5Sn42tjYH
	DNctR8do1VWqCGjkC2jzqw+AJUJTVrYlGL3PyAHyoHDYgJ8z8iBQGhHOdp9oxJkMok6rWU3QPZS
	qh+AmoKJdsTKELm11FRDc8lvEFwNAW7oGawkKMXau5SzDKAKSkn14a5jtW+h+lTSGOEKkfbj6u4
	rVXYCx53otb/C4ROBUyQMK8kKwj6sXnm3RqEBNKTx2mLzz2Vw8TsZpuHwzxybkxT2h8ZVss8OOu
	dZfvJuScObj33YDJrM8nAOGVsMCINN464UYwZxtVRd9Ab0Pz+wjhaC/6lvm+IPJNG9A6JX8Mghh
	ohWQUWw6du0YR/TK7gsqZTV+eEnpMXMWikCdJyXQ==
X-Received: by 2002:a05:622a:111:b0:51a:8c9c:7f3e with SMTP id d75a77b69052e-52b386c3e76mr34024091cf.65.1785427236265;
        Thu, 30 Jul 2026 09:00:36 -0700 (PDT)
X-Received: by 2002:a05:622a:111:b0:51a:8c9c:7f3e with SMTP id d75a77b69052e-52b386c3e76mr34022661cf.65.1785427235260;
        Thu, 30 Jul 2026 09:00:35 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:61cd:dcd3:c61a:ac3c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fa8bb6deesm85168066b.53.2026.07.30.09.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:00:34 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v9 00/10] Support for block device NVMEM providers
Date: Thu, 30 Jul 2026 18:00:30 +0200
Message-Id: <20260730-block-as-nvmem-v9-0-f72935817dbf@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAB51a2oC/3XRS07DMBAG4KtUXuNqPH53xT0QCyce04imgRgiU
 NW743STSMYbS7+l+TSPG8s0D5TZ6XBjMy1DHqZrCf7pwPpzuL4RH2LJDAENKHS8u0z9Ow+ZX5e
 RRq46CY5cF4MPrBR9zJSGnwf48lryechf0/z78Bex/japRXDgJkSUZLXwEJ6nnI+f3+HST+N4L
 A9bxQU3RYOtFCxKl4SlGLWQihqK3BQDdS+yKA6NE0lDCFI3FLVXfKWooihtBZLpEHvTUPROEVg
 puiheE5RVp5Q8NBSzU7DuxRQlAZadxD4qExuK3RQLolJsUWQih6ApQXANxe0VWSluncgFktilX
 vn/Ln2/3/8APLF6V50CAAA=
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
        Saravana Kannan <saravanak@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Piotr Kwapulinski <piotr.kwapulinski@intel.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=UZphjqSN c=1 sm=1 tr=0 ts=6a6b7526 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=VT4XjZGOAAAA:8 a=EUspDBNiAAAA:8 a=B2QLtKVpp-MixIsELHEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=6CpsfURP9XNmmWg3j1mJ:22
X-Proofpoint-ORIG-GUID: 1oyOMcpLGgrl1kYQ2Xt5hPOkJoAL-0yW
X-Proofpoint-GUID: 1oyOMcpLGgrl1kYQ2Xt5hPOkJoAL-0yW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEyMCBTYWx0ZWRfX3wloXNQo/kU8
 BssY0xwnz/WoA5sjYsbeywl8fK3z5hBRlEXjU4NuP6KKDeGEtMsSYnnd12bKVuGqtKfBRxP1bFA
 gMz6MasahnnlDLfk28BXU+AuabLS3SA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEyMCBTYWx0ZWRfX/dylrHJud8JN
 HjijBMAGRDgs8Qx62gmBZjSbWHd7oMS11uyU1qOefKDOlR6a28W6FgBSrXUKqEyWEgxuqClnchb
 lVKwde+lsDBGj6j07oo+eHPG2ZkKy+/xlQTDzaizspyOwdJX3E8A6SDYjUCdFKboWqWcI69uDFw
 OCh49j32CSBSwVL2IobqkgoAPQ7VvJfh6LaD5iJpOZtNwnnz/pwIDYKlm1zzMglj+IZE2tOWKQU
 nIz1+otBVE9yOCDRWEmOwCMojEbQvkK9v5JZwMt1mfXsR2I0FXM8cwlLGJBtSOM9VBnBBxFZUf/
 GNSDdG8EXSS2QbfKL2lGMA/yY7EDOxecf6a+SmPpJek16rugmHrXzYqr07vz7ktfoUsrlXB6CL7
 KhfvnzELHylx1n1/nzQGCxx2KTjg/SY1tno82wBvf5WjPqXNAQjGgJCG63yuzvyPEiTHyxIZc24
 JYheATDXTcdHR+8/g4w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_090040_299235_37EFFBDD 
X-CRM114-Status: GOOD (  21.13  )
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
Changes in v9:
- Add nvmem support for partition blocks, not only disk (Christoph)
- Prevent concurrent exclusive access to the block device on read (Christoph)
- Add comment about nvmem being a side channel for block device access (Christoph)
- Link to v8: https://lore.kernel.org/r/20260703-block-as-nvmem-v8-0-98ae32bfc49a@oss.qualcomm.com

Changes in v8:
- block: Fix bdev->bd_nvmem on registering failure (sashiko)
- net: of_net: of_get_nvmem_eui48() now also rejects all-ones cells (sashiko)
- Bluetooth: mgmt: account for HCI_QUIRK_USE_BDADDR_NVMEM in
  is_configured() and get_missing_options() (sashiko)
- Reword blk-nvmem KCONFIG help text to satisfy checkpatch
- Link to v7: https://lore.kernel.org/r/20260701-block-as-nvmem-v7-0-3fe8205ef0a8@oss.qualcomm.com

Changes in v7:
- Rework bindings/dts so that the eMMC boot partition can be a nvmem fixed-layout
  and not a child of fixed-partition. (Rob)
- Add Support for fixed-layout as the nvmem device node itself
- Remove "block: partitions: of: Skip child nodes without reg property"
  This is no more required in this series and will be submitted separately (Rob)
- Add missing linux/cleanup.h and linux/device.h includes (Bartosz)
- simplify nvmem_register() error path using dev_err_probe() (Bartosz)
- nvmem_device forward declaration to blk_types.h (Bartosz)
- Add hci_dev_get_bd_addr_from_nvmem() kernel-doc for return value (Piotr)
- Link to v6: https://lore.kernel.org/r/20260629-block-as-nvmem-v6-0-f02513dcd46d@oss.qualcomm.com

Changes in v6:
- blk_nvmem_add() returns int, error properly propagated (Bartosz)
- Redundant if (bdev->bd_nvmem) guard removed in blk_nvmem_del() (Bartosz)
- Size guard changed from UINT_MAX → INT_MAX to avoid signed overflow in config.size (sashiko)
- BLK_OPEN_RESTRICT_WRITES removed from blk_nvmem_reg_read() (sashiko)
- Link to v5: https://lore.kernel.org/r/20260612-block-as-nvmem-v5-0-95e0b30fff90@oss.qualcomm.com

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
Loic Poulain (10):
      dt-bindings: mmc: Document fixed-layout NVMEM provider support
      dt-bindings: net: wireless: qcom,ath10k: Document NVMEM cells
      dt-bindings: bluetooth: qcom: Add NVMEM BD address cell
      nvmem: layouts: Support fixed-layout as the nvmem device node itself
      block: partitions: of: Attach partition fwnode to the block device
      block: implement NVMEM provider
      net: of_net: Add of_get_nvmem_eui48() helper for EUI-48 lookup
      Bluetooth: hci_sync: Add NVMEM-backed BD address retrieval
      Bluetooth: qca: Set NVMEM BD address quirks when address is invalid
      arm64: dts: qcom: arduino-imola: Describe NVMEM layout for WiFi/BT addresses

 .../devicetree/bindings/mmc/mmc-card.yaml          |  23 ++++-
 .../net/bluetooth/qcom,bluetooth-common.yaml       |   9 ++
 .../bindings/net/wireless/qcom,ath10k.yaml         |  16 ++++
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts |  32 +++++++
 block/Kconfig                                      |  11 +++
 block/Makefile                                     |   1 +
 block/blk-nvmem.c                                  | 104 +++++++++++++++++++++
 block/blk.h                                        |   8 ++
 block/genhd.c                                      |   4 +
 block/partitions/check.h                           |   1 +
 block/partitions/core.c                            |  15 ++-
 block/partitions/of.c                              |   3 +
 drivers/bluetooth/btqca.c                          |   5 +-
 drivers/nvmem/layouts.c                            |  13 ++-
 include/linux/blk_types.h                          |   4 +
 include/linux/of_net.h                             |   7 ++
 include/net/bluetooth/hci.h                        |  18 ++++
 net/bluetooth/hci_sync.c                           |  41 +++++++-
 net/bluetooth/mgmt.c                               |   6 +-
 net/core/of_net.c                                  |  52 ++++++++---
 20 files changed, 352 insertions(+), 21 deletions(-)
---
base-commit: 5174c725cd98c717af2a4fabb7615a11b3ab4b9f
change-id: 20260428-block-as-nvmem-4b308e8bda9a

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>


