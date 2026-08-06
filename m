Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C809C55ABF
	for <ath10k@archiver.kernel.org>; Thu,  6 Aug 2026 14:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KOatdI4aMcMRWWupN6j4vSQEII+iBiMgRDvmtcwV5UU=; b=Pw+9xVqLNeSYxL
	9OhkF/Z+U1oXqsGnLfN2M2sHA++tyKv4D87HlTMkGqVHTGkTcLgFWODokj2VgCJPtmRkQ4yxCTESq
	ew/RTSKPlwVoNjU47NJO51G4sawsSUVmq77FtWmAFqTBt0thIQeh8EOkXE7wEK/W4+cSzFsV/PQI5
	aXQr0oxw/8/MsMgijVNTx27Vv53l/SRZVze9AB7PaxomIuKKi8bAH4dkMSdj7nj2Vhc/ffFDRbA7f
	iLVBtDK/8s2NshVGwnuHAva8t8EyTHlf+WKNNna3hwbQPlojtxaRAiDOgkrDYbzEZi5IfYsvHlyz/
	Zc5UDSIA79thBqHI8U8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrzFB-00000005zRZ-3oAu;
	Thu, 06 Aug 2026 14:38:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrzF9-00000005zRF-38Bt
	for ath10k@lists.infradead.org;
	Thu, 06 Aug 2026 14:38:49 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nmWQ1228278
	for <ath10k@lists.infradead.org>; Thu, 6 Aug 2026 14:38:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KOatdI4aMcMRWWupN6j4vS
	QEII+iBiMgRDvmtcwV5UU=; b=RjcgnDjD7rXq621tdLNp0nqLSaOMdz6o3MPcdI
	Iuf3My0+UGmRS0A4DFicF4P4snOzYSW0fBws4JUV2NJth8tRFHcIxyWSaeydEykc
	Wz/cur26D/Ti8Aa3LQfw6c/W9zoNs8QAFIo+8Us5gXXlnK02aH+yLhr+XsjjuxDC
	oqLtmB11Y+SW3b2MndVmlYfAT8IfSsclYbF0qnth7S8rJhu47aM6975plUxNqXhP
	DpxZz+/Bfz1zLXjHWcvQmNWnklmOyh/MTR4+UzaSoeELtG04uqDbfjmFE8wJy8BP
	FLAP+/gwUz9Aomz4qxaTptDyyVgv+pYEWEN5IEY0mVhr9Hmg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvqduhhb3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 06 Aug 2026 14:38:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5283df62d68so25617581cf.0
        for <ath10k@lists.infradead.org>; Thu, 06 Aug 2026 07:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786027126; x=1786631926; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KOatdI4aMcMRWWupN6j4vSQEII+iBiMgRDvmtcwV5UU=;
        b=fQX1nUvpwv4gy7guLx1jb0b0Fq5faCvOLrCGB5VI5RA3PFOJGTjHpRa2XHrl6ETT21
         Zo+aJbwQNbmW9ovHQmwk469aTP66+MvzGQvghSR6MLvdAvsm2I/4tIjaHQOwrnI7kxCU
         KbZAm9xdT57UV+zJWMxplaWHkzeU16SS/FJbejgpLow2983FR7GrJzwnJo3qa+6MG5tI
         C6O0e/fXBqfSGR0p0PiDASLKxHmPb3DZEC5PH8hner7TfGFYMdHshYqjKn2XF4q5DUkY
         F+vCGX0BZmel48au/EcHw3J+dOLKDTlUbUaHr9tD6ZcK9UKxQSTD3TxHT9nnB8C+jpIy
         uSsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786027126; x=1786631926;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KOatdI4aMcMRWWupN6j4vSQEII+iBiMgRDvmtcwV5UU=;
        b=EIiQJLqBvK8maeeevK9PVZhYGQaQRi5KvqR25pqNermNVzHhbvx7ZfEQnOrn07qRgY
         uSf1G8wjnLoHF6NIhF9DHwEM3tmklz1nLd4zpUsN9xCOE01Y1OSfmlPxd/SI6a7N+Qsj
         rwyBwFpjqTj9AySSCABuZ0tuTHWXC3dguHAs9h6fo+xdtwPcfueOUnyCXI0ERAJZHPah
         N6qXow7tss4tDY2Nnb32U6J5JT+KWxl6EibQmskjDrA2Xk0qfk2s5iuLa8lViD+CzNh0
         hdzC/tAo0nVot/6MTIZBYskdW+eGoVvgB60VgDoYb1K38oxIa9MJCGXKMTSrS/WinAcU
         XIVA==
X-Forwarded-Encrypted: i=1; AHgh+RpXAkCGFxbr08zwxMZDk/vb7aN7g63I9FHWJ7SiPobx6KoERKYz8mHfPo/RJqbpkOWXYft1Eac=@lists.infradead.org
X-Gm-Message-State: AOJu0YwMcGEvuVgnQWPYnQyV2EmS+iMj59Ppqh25dNoI5fj0c9XA5ZnB
	dOh97aBMxFcgwb+3Hk29CKGh04+bTDCbpzMOn+1csw3DN2Ttt6kLzYJcT/EifRW7aTycFnsJGYn
	Sr9tItHe7P1g0k5DdXz1FAVOVrtWwNcZBzfKHM0yKrmT9U2H2SEC4ObmRA3vEAVYm
X-Gm-Gg: AR+sD138vxdOgL8nbi5LGYmie6uHwFVVK4CX/0IFZK0U7D0O1u/V25hnsXDNWXTekSJ
	woXMGhCClo9kUfF2u46NR62+IVpD3V/AyKVsMddOAXq7cKu8h7ViXi786m2iTE8YpkdrvFo+wvF
	Aa64sBnpXNN8zo2oIZhVKlK3eO1BlhmJx2/aC8uNmZwDKFsg9mVOvLQpodVRk3v+fRUDzsqiNiB
	cAYrBEkizw7Tfdb25nFjBw239wbnjdxfA8kIJtbEBb+V54f1kLqGL1612BBoskK2hKdqJQEMo4h
	SDzza7ChJB9ytsFO623XnBDJ6N1Wan3A3YdmuHehAlf9By/oMjit7PXR5FmPl+9/CxEeus0tjqs
	wTopvxSq3KwDd5x7OVzjYQUmYP1aMcRsW6XK4JRY+QTVEMK16ub2l0kTkxuX5SSRpGFWzFPrlco
	nlPP9y2qpsWRKFsPdFfL23HO3svL46US4U6yBMtfazXyw8tZDSeA==
X-Received: by 2002:a05:622a:13c9:b0:51b:ecca:f2e0 with SMTP id d75a77b69052e-52ce5f44c7dmr149088971cf.5.1786027125967;
        Thu, 06 Aug 2026 07:38:45 -0700 (PDT)
X-Received: by 2002:a05:622a:13c9:b0:51b:ecca:f2e0 with SMTP id d75a77b69052e-52ce5f44c7dmr149087731cf.5.1786027125394;
        Thu, 06 Aug 2026 07:38:45 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([90.85.108.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2036276e58sm270552166b.28.2026.08.06.07.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 07:38:44 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v10 00/10] Support for block device NVMEM providers
Date: Thu, 06 Aug 2026 16:38:33 +0200
Message-Id: <20260806-block-as-nvmem-v10-0-be598b2a5606@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAGmcdGoC/3XRzU7DMAwA4FdBOZPJcf458R6IQ9I4rGJdoYEKN
 O3dSXdZpZCLJVvK559cWKFlpMKeHi5soXUs43yuiYDHBzYcw/mN+JhqgSGgAYWOx9M8vPNQ+Hm
 daOIqSnDkYgo+sProY6E8/tzEl9eaH8fyNS+/twar2KpdahUcuAkJJVktPITnuZTD53c4DfM0H
 Wpgm7jiXdFgGwWrErOwlJIWUlFHkXfFQDuLrIpD40TWEILUHUXtFd8oqipKW4FkIuJgOoreKQI
 bRVfFa4J66pyzh45idgq2s5iqZMB6kzQkZVJHsXfFgmgUWxWZySFoyhBcR3F7RTaK2zZygSTGP
 Cjf+2m/UyQ0it82suildsKmmP9RrtfrH1naay/kAgAA
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
        Christoph Hellwig <hch@lst.de>,
        Piotr Kwapulinski <piotr.kwapulinski@intel.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: net7jSTSYqmTwq1XDxKZ0nguTd6ndFBQ
X-Proofpoint-ORIG-GUID: net7jSTSYqmTwq1XDxKZ0nguTd6ndFBQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDExNCBTYWx0ZWRfX9nwVw9Bumh3c
 z2SVqFzxBhy5D9XBpTrotfHW6499hmBZFdQ5w4spl0fsSV24rVkjb31IhTQgG8JZcJFOqGBbo3H
 tEm7riZN2FTavBW0egB+7Co40+JDMdDnJW6jMH6WRZ7zWoj1BHQEiZg4XxuS1wP2VyNIR0JKBQ9
 j/Yqq1KRi42GUGOJ4XGOnA6EWROQE8RtWaJ0aaLN/b+EgZboLRQxkW/NlxKR8lcBmvGAmPp41V/
 ihYTuNCZXHX4lC6pWMcEJ5mzDY0XeGPbbI9Oxfv29M16/O5/JbgKWiziWfZ5dktjBZ0qvDbYnQh
 tnr3k3EyxaaKhzeVvgHxUVrvPkkyyK41OWhIHpWQepoVtKpjGAOA+kgzvweROkmLA7e32kAMAx0
 R9Vw7W4u1D7mfKvGAoqd/AE2veV/kF+Un1ozq2ChffBdIFBdrg8kbMBqug5srJt1r93GypE+AKu
 RYHCW3htR4opFa+1X4Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDExNCBTYWx0ZWRfX6/JiWMi48rBw
 kucIhzy6zuKH1aHGXgTIf+IMbYlC5F3kMXCWc4o7XHPh90nDevEZXq3mfFDQfgRFy2JDLbyTQH3
 VBlZOK3u3FXmuXy4FdewsEEOkvrnoHU=
X-Authority-Analysis: v=2.4 cv=bdtbluPB c=1 sm=1 tr=0 ts=6a749c77 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=JDRa4Jy4r6/BpSpxP2cCow==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=VT4XjZGOAAAA:8 a=EUspDBNiAAAA:8 a=tqjjm0btxrnhZIKebqcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=6CpsfURP9XNmmWg3j1mJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_073847_816674_2630B769 
X-CRM114-Status: GOOD (  19.39  )
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
Changes in v10:
- block/blk-nvmem: simplify read error handling (Christoph)
- block/blk-nvmem: verify dev_t wasn't reassigned before reading (sashiko)
- block/blk-nvmem: drop __free() cleanup for explicit of_node_put() (Christoph)
- block/blk-nvmem: init static nvmem_config fields at declaration (Christoph)
- block/partitions/of: fix fwnode ref leak on skip/abort/error paths (sashiko)
- Link to v9: https://lore.kernel.org/r/20260730-block-as-nvmem-v9-0-f72935817dbf@oss.qualcomm.com

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
      arm64: dts: qcom: arduino-imola: Add NVMEM layout for WiFi/BT

 .../devicetree/bindings/mmc/mmc-card.yaml          |  23 ++++-
 .../net/bluetooth/qcom,bluetooth-common.yaml       |   9 ++
 .../bindings/net/wireless/qcom,ath10k.yaml         |  16 +++
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts |  32 ++++++
 block/Kconfig                                      |  11 ++
 block/Makefile                                     |   1 +
 block/blk-nvmem.c                                  | 112 +++++++++++++++++++++
 block/blk.h                                        |   8 ++
 block/genhd.c                                      |   4 +
 block/partitions/check.h                           |   1 +
 block/partitions/core.c                            |  25 ++++-
 block/partitions/of.c                              |   3 +
 drivers/bluetooth/btqca.c                          |   5 +-
 drivers/nvmem/layouts.c                            |  13 ++-
 include/linux/blk_types.h                          |   4 +
 include/linux/of_net.h                             |   7 ++
 include/net/bluetooth/hci.h                        |  18 ++++
 net/bluetooth/hci_sync.c                           |  41 +++++++-
 net/bluetooth/mgmt.c                               |   6 +-
 net/core/of_net.c                                  |  52 +++++++---
 20 files changed, 370 insertions(+), 21 deletions(-)
---
base-commit: 5174c725cd98c717af2a4fabb7615a11b3ab4b9f
change-id: 20260428-block-as-nvmem-4b308e8bda9a

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>


