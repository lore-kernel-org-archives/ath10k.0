Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58992C43602
	for <ath10k@archiver.kernel.org>; Mon, 29 Jun 2026 08:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ROn9v0tvgRhtd8/CTMTZwIAPSCSAz0ITaREV9z+qQSM=; b=0K/LjFdbdHU4t2
	op3Ok11atrwh66G61sUzvwLDNYYWPPORovTyI3qmuNwARPyhkbC4raU8AigkmhPjDthRrafw8/FYz
	xMeYAeMO5aTQ34/syyYUouPnEnMbUMwiDgKjY4TOlmy6D9bTBG22+E5dtA8LLa/DVxy8V6OlqGGUL
	ka4jn2o0KoPH3c2llzb/pWvyzgwwISB4vWkj3Wav2aVeLBEfJ70toT+QN7f3IKxJkJMoC6Gb4I/Mm
	qfJwWELkYTpcvCyvC9mWfYdQZcJ6M/BqWf4tKjFWWTxq5jraVG/9NjEo9vETxaum+2zgknATsjcBN
	OcpiK43KbHkRs8AMoAUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we7m7-0000000E3FX-178W;
	Mon, 29 Jun 2026 08:55:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we7m4-0000000E3EV-3Wlt
	for ath10k@lists.infradead.org;
	Mon, 29 Jun 2026 08:55:30 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6rIVo2097160
	for <ath10k@lists.infradead.org>; Mon, 29 Jun 2026 08:55:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ROn9v0tvgRhtd8/CTMTZwI
	APSCSAz0ITaREV9z+qQSM=; b=mqAyC2wxQhZS2ovM9mNJAg7mTkn2NP/ArBRizo
	HorI3yy9cIat3+pLF/BEGIMyk7RxiCKeIkAFd1IUpDthEILE1w9X32KzI1gUY8U1
	Sg31Ttl5stwiNLDI06MFwpS9jge4RxzTjDKBnzt+QAvUd59BDvv4eSEeQeYL331e
	UXa1aivfstgStHG5uUcx3/Lri67wjkG4KhjDRHZAd9KoAAr3NbiAUcZKucR7+HYO
	BqeguYzbMNs4xDq4Pkd8p+ZoJ0HAng+AScYFchvItcFG4wS2Dz54h3fLbe4ERvfU
	teDWyLJSGouV36nyZgxyHLvBJhHEugSbwagYZtnAkbQo9ZGw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27t7wfag-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 29 Jun 2026 08:55:26 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5a787be4ee9so5186151e0c.1
        for <ath10k@lists.infradead.org>; Mon, 29 Jun 2026 01:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782723326; x=1783328126; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ROn9v0tvgRhtd8/CTMTZwIAPSCSAz0ITaREV9z+qQSM=;
        b=Uci8KtJTPduDXRHQw+OidA4Jbonq4JHQwKbfM4fnAitGtWKeujQEwTyLaPJyR6u7Wk
         Eu8Y74PDRcWhKPQKbGv8zX5OUVfJqDj5uAKCUB4ELA6Qc9BuHQpT6lWpv/LZ4ZOBtSkX
         WlH6J5W0ooDtJBNal9NBtX7KkVp9Cg3w8x3syOytfzJPxiBjDzJSJq5jy7839CkWJh+B
         ph6TkdIaFO9iQfJmBeAsBZz+8CIm3LFF/PCeq4EaZAzb27Y/pjMYw12LMvXe+SpGTByq
         vJxIvojr2XnVV+K9h7aISWVZ6HlClQL9gr0cuKWRCyx1A6F0dMYlEAc+Ol+qHTGOM3sc
         zCsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782723326; x=1783328126;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ROn9v0tvgRhtd8/CTMTZwIAPSCSAz0ITaREV9z+qQSM=;
        b=EZSgPZN2rgJuUBWtNBjqRIuwcM78YpOMockEuohGsuF7Hc78DYuHANW9qLtNJybjRW
         3JkMBft+pQlaLpvRDAreLk96fmU4mnVmz0lqkCGrpR07TQRTXrvUAmYcoONNtQMi2L5/
         AgIW6Atu+pJ1yvKNuzmPOsmZ0LoqFsFxrPbXdTrmxs3NVwJ/ao/GpW/1dk2/Ik7pbosU
         gDIEbz0bamad8I5MTMQs2siy5U5+tfiH9ZDj7UyFkze+EkRqEXDHAJBAi9eKBGxOsE4s
         79W1LaU6rzS1WRGbmkI5oCRvVGCsFonzlQ7L9vYI2u3B5mrhbkY1RPiITl6s2e5ZxkF2
         47tA==
X-Forwarded-Encrypted: i=1; AHgh+Rr8/JdA7aMzvNIzifJn4gYs7DXYkbInt7sJMWMnuy6NIzijdgLS/Qdthokv8K3yweKVQVpBchg=@lists.infradead.org
X-Gm-Message-State: AOJu0YzKePn6ylNDbQmDkChvoB33cOALKS3kTYqwGj27QOCsJnqo6Lg9
	3EBoyVrKa2VheEUgHSMR/ZFH9tnu4pVZGfNtTX3ilta403qIwi2dQQCyOHMZf0KcmGkqCzL/2sT
	tvJBXMrJNruRiiVxGsRK76UCQo0XIOvkvnEExHFx3T6l4QbFRZaZHEYs1g7bP3301
X-Gm-Gg: AfdE7clc5UmFgGK1cJhHB9AAkyU89WAJaQVapx9cUX5607T8EdSqk/4JnS1vY3A6JWM
	PKhVjdpjwaP6kS26ZphA1u2wgJAFwtoEBMkfgXhem0ngJIR0hxp/2TLXq4S8I7VrgPtXIXmH0Tj
	kMNzk9mxvGkVv8w6reef1OLZZ6eBNj4yQVew3aaulDZryug3Ap1WDugpwSMv5j8mjDvWwaiybkU
	AazZOLsBtFfsO5qPI9K7oN1d9YnEOdWNSJRgurE1QtAlXvov5CMwuz4uFqlGNVDm9+Kx9IZNuc9
	vIcc8qdOnLpLleAKffrr3YbDWSHHaIGmauiFcuq2LuxhoXqZgJSv0TOHj12pPnOjmZdPz4YiEwb
	bUKCX/C3LbPjPpvMH1ocFu5WXYdRIWYD5R9tbJ9cFADMM//alor5AkTpBhnMQ8z0a0Q5EqEPQ0P
	MmbSf4Wp5cDFMA3vp53TZ/0ThTz9qyzf+qZ3Y9o2QHbO8EPHap57WQYWAjgUUQiL9vRBZU0Dleo
	loivP+H7rU1qenu8o0H
X-Received: by 2002:a05:6122:328b:b0:5bb:d0ab:5ed3 with SMTP id 71dfb90a1353d-5bd69c2f7bemr8037543e0c.1.1782723325760;
        Mon, 29 Jun 2026 01:55:25 -0700 (PDT)
X-Received: by 2002:a05:6122:328b:b0:5bb:d0ab:5ed3 with SMTP id 71dfb90a1353d-5bd69c2f7bemr8037516e0c.1.1782723325270;
        Mon, 29 Jun 2026 01:55:25 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f4bc8016sm6558981a12.25.2026.06.29.01.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 01:55:23 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v6 0/9] Support for block device NVMEM providers
Date: Mon, 29 Jun 2026 10:55:19 +0200
Message-Id: <20260629-block-as-nvmem-v6-0-f02513dcd46d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPcyQmoC/3XQTWrDMBAF4KsErasgjX4sZ5V7hC4ka9SIxlZrt
 aIl+O6dZJOA683AG3gfw1xZxTljZYfdlc3Ycs1lomBfdmw4++kNeY6UGQiwQoPj4VKGd+4rn9q
 II9dBCYcuRN97RqWPGVP+uYOnV8rnXL/K/Hv3m7xtN6kmueDWR1DYGdkLfyy17j+//WUo47inw
 W5ig4diRLdSgJSQZIcxGqk0bijqoVixvkWR4sA6mYzwXpkNRT8r/UrRpGjTSUAbAAa7oZgnRcJ
 KMaT0BgW9OqXUi3+UZVn+AO4OA1zLAQAA
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
        Loic Poulain <loic.poulain@oss.qualcomm.com>, stable@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3MSBTYWx0ZWRfX5ehAvkwNuA6Y
 hlEg2ZWT2Qh5n4VbCswK5o8AqWtC00mndJiekeOZE4tG80pvvqAQJ+UjdwxfoDYHKHJSY2SFgBN
 j/9swXXj2QkmeA++nJVbOvYTpw8e0HSNYmDtjhBaTDhUWj5qt3l18uErtA2j0kaZF8tTrtgsl42
 +yurOghvgSKuyz1XC/EdupIXrF0R6xnTl6EHADR6HBjovG4ccHuMd5oveMKVjqlEZXU6dA/S2sk
 O3sKJkBxKJOI/v5tVgOfFAM0rmHfr1ExoV4IK0mortIKvuhJcDbsn1IPZ43CL0mdXeV0rKCJRlc
 QhO/luUabJQmi7cDBh3cFC4sXzo9dPPLkQR8XnhBoSKlyxqayE6VPa8cr8/zh5VeKns4ygJHDde
 kVF99t0xXVosql3XLknYWIecNTyHDWf8Kx67afZ1fuxJbyq+dFjG9vq5smrg2DusC8f5HAjMkNe
 x1k3/IMWDwQMlFylWhA==
X-Proofpoint-GUID: -iPN0U_LeU0ABaQq7ISyvPJKiRYcAJ7n
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3MSBTYWx0ZWRfXxQyl9J6AOdFF
 qRyDQESNFKlopKjk1+1+wQWkk6xytHjLYrUm1QZSeZxYB8T1NBdnBQzpptnqPe8iF/8TglLgnJH
 BGnwPlgiE/iyWnjEIoXFWzNFj0QzunM=
X-Proofpoint-ORIG-GUID: -iPN0U_LeU0ABaQq7ISyvPJKiRYcAJ7n
X-Authority-Analysis: v=2.4 cv=BdnoFLt2 c=1 sm=1 tr=0 ts=6a4232fe cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=VT4XjZGOAAAA:8 a=EUspDBNiAAAA:8 a=H1RoBJpM21yDxn_SvroA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
 a=6CpsfURP9XNmmWg3j1mJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_015528_900032_27A66978 
X-CRM114-Status: GOOD (  20.66  )
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
 block/blk-nvmem.c                                  | 111 +++++++++++++++++++++
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
 17 files changed, 347 insertions(+), 21 deletions(-)
---
base-commit: 47c4835fc0fed583d01d90387b67633950eba2b2
change-id: 20260428-block-as-nvmem-4b308e8bda9a

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>


