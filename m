Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3256D6072220
	for <ath10k@archiver.kernel.org>; Mon,  2 Nov 2026 16:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3o6NwTI4;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EGDhH31Z;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C7tuWykX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=s2E5loI5QzOdo4ew1vQKih9z8VadZE7soKVzNqeQSpk=; b=3o6NwTI4tW9WJge2VgWut1/hf4
	2BN7bmGCgmFqXgoOVWo8mg/EA2mIX20hTVLE1VpexXyYzNKuqvHtaDuhu1uWpmoQ0zmAXdpfG9jcu
	+5mRPTrM17nEJExdmBvSsFOkKjPrS/aFHykTYwXhpxovnHdXaNOHfdlSk5VkK4TYc2az5I74fuWL0
	Ngg4DnPJnAwSTqvZcQP8f0pwR8Qh9hSoaXZ9R86yeEr5uVXjLNYHfrPghfwc4cG0ZZxqZGnabxrkK
	b08XP88kjBOATQz28YJbUekW1YWIMK0sLtOQ5xjQh7U9E7oKTvUTbiwAM4w1ZvuOCqxHKtqNjqa9r
	nXaPDCLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNush-0000000HHzA-2Oxh;
	Mon, 02 Nov 2026 16:27:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNuse-0000000HHxO-3El9
	for ath10k@lists.infradead.org;
	Mon, 02 Nov 2026 16:27:34 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpNJu4070520
	for <ath10k@lists.infradead.org>; Mon, 2 Nov 2026 16:27:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=s2E5loI5QzOdo4ew1vQKih
	9z8VadZE7soKVzNqeQSpk=; b=EGDhH31ZGDal6o1bjWyNGFzeopWyrBhihaYUAY
	oTrVhVT85GEo3whpJ3kB5IBaxnRwds9Kf1wrHGyXInPzZ09DQbgLBoa52Xxss/+e
	WqQyghA//btJ1wUVP21gU9mlbzvPTKDQkGh2p1oBqN4YC+thbsLk7IeAKRv8zAAf
	pqZc5or66JdQjqN408Ffam+NKwhSdVHaUGmoYIEGwi3whS0qOwMRlmUYxy9bH4iM
	eDe1oFG+rculWjEIIQUqFsfzc779qxItP6k9W6rLsqCfKf/9Fq8LeMiyPY6Ocb39
	sYevgYphTWBXSqP14Vf0v8Mm5VoHXUMzdchc3nrVxLWCjaHg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpss5h9ea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 02 Nov 2026 16:27:31 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-99081ea787eso2681125241.0
        for <ath10k@lists.infradead.org>; Mon, 02 Nov 2026 08:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793636851; x=1794241651; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=s2E5loI5QzOdo4ew1vQKih9z8VadZE7soKVzNqeQSpk=;
        b=C7tuWykXXazK7meigkg4l/BaoNCFjuqVijHLZyNLow5he+aHOmk4vxrTWMTwXTgrsL
         GzvdLazaueb6F/DHo3yke0b9zUe3L8nySA53RbD7KV7f+nhEN25Om5gdmEG2uPJENAIB
         kncCfpXf7DkpuFLraYRThEklTGCSzAaejxSNOqdEGmwtP644bYRkxdFaNhm6R62mnh9W
         V0xi/9tPeC7M9jGGmGPoodIF+YBW9UwSIUh8aPh/EHxGcsrr8TiIz6BgM4TDd0SvO3OV
         IlS/3xt2qtBS9pUsOyXaaYJhBCpLFxY95yLPsKP2aqC8Zq+ArNf7JAW4U1g3ytZvxIL5
         JM5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793636851; x=1794241651;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=s2E5loI5QzOdo4ew1vQKih9z8VadZE7soKVzNqeQSpk=;
        b=W8//w6VSmXBFIcJPFB+qwvLs65M9KvJx43CtMeEOtGf2EIhnBdfUH3yK6gmCGx3DDH
         urZFpB1HIDOFgzXEMsBPqKgNVHfDhZmkDnr6ZaBmw9wfD1r/eMl2cvTCXHavYGAVzp9h
         SOZSs+/bsi2r+rb3vh8nvEw1NMm2D5cs0jvwK0yCJQzeAlPxpI6y6NJSOYHLpJ3luEuk
         tUjAyWFJrpETEF7XuEgVP6PtybfTkjXdp4UN1f8dlihJ1zSwmYXzMjh6kMZhPVBEWM8Z
         txyTC/crsFQbfNDMv6YVA6bMZfI5cNY++Doq0xpbbsJBUBZK1uwOS+N7/6I5NOTUWUwY
         fNNg==
X-Forwarded-Encrypted: i=1; AKwUvBwrGlktnNbeTkUE9Spf5AJjoSWNjmkDRz7NccZb54fPihlW2ecSxbmq2s7DpVVn1DjIOFDV+dQ=@lists.infradead.org
X-Gm-Message-State: APuU4Z9WQlG3YtRvxvC2fF2Hg/iKSp21y/l4fSdcoofKOTz2sMfp9OKU
	rxL2j7J5CwN4YaYGOFOlTbkeEObBcreilBlvL3UZiun3OBkTMuqTWndt4VtpSu5Uz5j7UQhHOHZ
	YwTA050DegbWISOcH/JpnJtptYDRer9c61sQTyehXpTLucdWcqxITdu8Fx+7+yPO/
X-Gm-Gg: AYBFou1eKA1cQzc8rpQUPDi6UsQ3oLxXYaUIVfWv/+tvCMClm6BC/dbaIqtRrc3zWEj
	KrCY87Zxn8FZe0JuVBfdjHwbS4lYtyFyhfYU6oqbdUlptCkq9/ZbkRO5owli0XWlZfpOtUxMjzb
	PigATcyZTDFTHFsCRvVtTXGBakqSsPX+ZIjroZwMsgWotLavx7QkGoEmU26i9cbjIA/yPWfgZ7G
	Te94R/SNfkQ0DdUnvthgfMl0d365Y8/GhGCkzwDEOSMPCx1a1PATeJjkZWvc/+kCsiYcv+ddjGh
	SqS0KwEoJJAdnqQ1rJ8BR2Yt5T45T+h65TL91o2AU/cG7tUs+Scg7HeFkfKuUS2CPOSTjqJwI8+
	FakSTUU7zA8AfV/p7TSf/1o2I898u6FBP3VysSSKfGLOL8qiNAbKcz264Zy792F6l/jF4MZNtPC
	1UY1Vd+3Ha5roSXZCTZSAJKLGhBn5QorioDKCg0TFQgyZROVWtD7VFjcbPZXbIC+b7qfaH5MTzw
	KXN5O8ZfvbtRzhFYKRj9oxNVMqt
X-Received: by 2002:a05:6102:512c:b0:7c3:99a3:314a with SMTP id ada2fe7eead31-7d072bc74c1mr4164742137.9.1793636850213;
        Mon, 02 Nov 2026 08:27:30 -0800 (PST)
X-Received: by 2002:a05:6102:512c:b0:7c3:99a3:314a with SMTP id ada2fe7eead31-7d072bc74c1mr4164585137.9.1793636844939;
        Mon, 02 Nov 2026 08:27:24 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b959c1sm20490695f8f.45.2026.11.02.08.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 08:27:23 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v12 0/2] Support for block device NVMEM providers
Date: Mon, 02 Nov 2026 17:27:19 +0100
Message-Id: <20261102-block-as-nvmem-v12-0-f4a2a681087d@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOe56GoC/3XSzU7DMAwH8FeZeqaT43zvxHsgDknjsIp1hRYq0
 LR3x92llUIukWIpvzjO/9bMNPU0N6fDrZlo6ed+vPJG4NOh6c7h+kZtn7jQIKABha6Nl7F7b8P
 cXpeBhlZFCY5cTMGHhg99TJT7n4f48sr7cz9/jdPv44JFrNUqtYgWWhMSSrJaeAjP4zwfP7/Dp
 RuH4chLs4oLbooGWyjISszCUkpaSEUVRW6KgbIXyYpD40TWEILUFUXtFV8oihWlrUAyEbEzFUX
 vFIGFolnxmoBHnXP2UFHMTsGyF8NKBuSZpC4pkyqK3RQLolAsKzKTQ9CUIbiK4vaKLBS3vsgFk
 hhzp3ztp/1OkVAofn2RRS+1EzbFXFEEbIwDU8YO1sSQ9i5i0Dy8mrPFV4DQpbPmNzsObmdVdva
 /Cd/v9z833sFUdAMAAA==
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
        Christoph Hellwig <hch@lst.de>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=VORIDNPX c=1 sm=1 tr=0 ts=6ae8b9f3 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=VT4XjZGOAAAA:8 a=EUspDBNiAAAA:8 a=rVis_EDdIu0y_XEmomoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22 a=6CpsfURP9XNmmWg3j1mJ:22
X-Proofpoint-ORIG-GUID: wDtmn54P58BgVV9Pv6iKykwJaAN7waDJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2NSBTYWx0ZWRfXwPxDhki6sn5i
 8v4nzBWMlgllf7QVK23i5cv/PQTAhmbD0eJu4UricXMi3AYNsZrVKaVms7RzY66Yqu8JaTPDxeV
 +uQVQ6K/gFJQIzSiPgIyoMxVYTksulyjkwL6QkA6Y6/r4qXLmMb03Gt4/w29dJQ33NIBSsxYhrW
 vvEjQ+6OHz4tY+OChR2QtWmTacduZze1guR0ABA9F+9zGQ7qvA/LXhIR5jzj8UvyHYpsgsuNGUk
 gcGMg+er2/Ph8vtN8hhmBH2k5vKV5DFGvfsSgaAiJw8/p7FLz9MgA5NTJWCYVZRnMGThzpNCTew
 lntfybnnJF9eFbtSkLlHBr+J4eiJ6saKrQ2IhKl71leCZpAyMK29dPkWfAeZEekwdi4R3K+qQUM
 zg0eThATk9ceLULdWy/1/7UzNGAgLfYjKPCt4FGV56ZuODcjTkMLYIhrhpVVdN8G1zvFpjqMInO
 NrKia0xhs+nSKxqz/gA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2NSBTYWx0ZWRfX92nBpFhgWVEv
 tw/A9d/bQXYR4tkMiAUG17JCflX2Avqi7fhiTxzFXIzK6Ny6ebVv2ng1AdEVHjbnCPXY1ttnalQ
 +gC/jPKTT/JuCHh+NxIkqZpVPUxZi84=
X-Proofpoint-GUID: wDtmn54P58BgVV9Pv6iKykwJaAN7waDJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_082732_938701_BFF4B638 
X-CRM114-Status: GOOD (  23.58  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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

Note that this is currently limited to MMC-backed block devices, as
only the MMC core associates a firmware node with the block device
(add_disk_fwnode). This can be easily extended in the future to
support additional block drivers.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
Changes in v12:
- Simplify the series and remove consumer changes (BT/Net) that will be
  submitted separately.
- Link to v11: https://lore.kernel.org/r/20261015-block-as-nvmem-v11-0-f890ac74f87d@oss.qualcomm.com

Changes in v11:
- Rebase on linux-next + resend
- Link to v10: https://lore.kernel.org/r/20260806-block-as-nvmem-v10-0-be598b2a5606@oss.qualcomm.com

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
Loic Poulain (2):
      block: partitions: of: Attach partition fwnode to the block device
      block: implement NVMEM provider

 block/Kconfig             |  11 +++++
 block/Makefile            |   1 +
 block/blk-nvmem.c         | 112 ++++++++++++++++++++++++++++++++++++++++++++++
 block/blk.h               |   8 ++++
 block/genhd.c             |   4 ++
 block/partitions/check.h  |   1 +
 block/partitions/core.c   |  25 +++++++++--
 block/partitions/of.c     |   3 ++
 include/linux/blk_types.h |   4 ++
 9 files changed, 166 insertions(+), 3 deletions(-)
---
base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
change-id: 20260428-block-as-nvmem-4b308e8bda9a

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>


