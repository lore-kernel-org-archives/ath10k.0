Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE0AC71147
	for <ath10k@archiver.kernel.org>; Wed, 11 Jun 2025 19:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IzZh7++TWPnt7YAqqfAhztYsaqI1nC4j1vdMdoyOJp4=; b=CD808jvUtDHzVw
	9aeyOeXaNAGCEhJQI+FHzPKNOXCVUgjYEk0ABAKGwvxtgOoZRwJLd2uvTfS8lg1frO6dNgcKPoGDj
	m93neZRZDCElOsUTY/K/epQq7dKOIxwNLWKXU7nzua+wQ8DAW3ksIxUPigzLEDGUe6ORrVKMqi5Gr
	L5LVv21o+0wwUFmOIizZMIGbuE26gytNBw9250uy6W6aGHqtybN0AVw1K01z6/oyN6nTV+gCf71bt
	TRBIUOHKw+8NDzfN6sCSiuL8cKIhFk3EggoTws1PEMsa0Y+wOTLvBF4pMMUD0j1b9McxAJ5XyJFxO
	TTiOEcnujZjTBAhrCCzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPRYP-0000000B4DO-1GKH;
	Wed, 11 Jun 2025 19:56:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPO5S-0000000AZ7F-2uJM
	for ath10k@lists.infradead.org;
	Wed, 11 Jun 2025 16:14:04 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B9DIEx013866
	for <ath10k@lists.infradead.org>; Wed, 11 Jun 2025 16:14:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=IzZh7++TWPnt7YAqqfAhzt
	YsaqI1nC4j1vdMdoyOJp4=; b=S9nwzEEnytmD5lsY3JIK/u2CxjjnuBzwa2Z4K+
	En/lXI5srBKNpC6TCq81bBvRIs2kl2iTorlABiOoBrB73JPxPRO8pQ2MMDXbZSdj
	/3pkzw0KNnMk80rSIpIoL/csMMouRrMWK42SGare5klQ7lMd0iMxuQskVp5JpJ3+
	quST39cipuIM/aldhh3TpSVaNg41pVuT4LY8zaftX4VNppysWhNUKaqCAuzAYWoH
	cZ0LX9sc52OrzgBBDa5dckOoW6alBlcfKTtSC+BrPlfShG3WoeMi5qL+PMuZd2Yk
	qJzzFl70vd6H16ZyCeDe9ahEZr+8wX3mE6PIcmVUTMk3pB0g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 476fmnd7ff-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 11 Jun 2025 16:14:01 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-740270e168aso41155b3a.1
        for <ath10k@lists.infradead.org>; Wed, 11 Jun 2025 09:14:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749658441; x=1750263241;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IzZh7++TWPnt7YAqqfAhztYsaqI1nC4j1vdMdoyOJp4=;
        b=K+aWWuDpCm9h4mBN0cYnRigQJqYiQBPQS+Jv/Cem3LCmIwNqQvz9SdAd3noYNiEdeW
         2FOY4yizh9iCgO7vinvjnGI7S5k5oJGOVTmY7UnzQ3SShvbdLzBGBrP+9paclNx7sL7Z
         Ozhy8Ndo2H+Z/d2Hs7p3NRpTGlSp1MO0+OGC5m0pxGhIqqB20OQh4J7zjN/d/pgueTSu
         n119rhkMM6rewrsZ7cGMusnIkpzpcGL0qYSMHndBC/G3XaJxkytEM2hRDfXjfwf1Wsig
         J7k2dBh78OewaSxrZizEB1HVW8IWm2U/U6QrqjDegrQcf6pcr47YJtESVXT/A/cGolUb
         ZeWw==
X-Forwarded-Encrypted: i=1; AJvYcCVgql871Ri+prVsrlQclU7e1kW1fvNlt+0/nGD4vlO0AAuhNMNslk0x6dKi4vl8EQKmxTP+5UI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwgzEy890EHKoO5jaL6ZWgsUsOZBQfjSugiySJKKrYT9YJfnEGF
	9NICwRsUgx+JqqcK6wOzYn8tBnZ77DwzqYiq42Nav6tCIV0Kpohwwsh43Ivp1sF88p7yX0Wl5KH
	rle4qj188oN3enVogagdresBcPii50VOv0zC+rP5ZgDpqyYeyErF8T3DAD796q5d+
X-Gm-Gg: ASbGncvpd4bHPWsQKqFL8xe+VFQjAWh8xhb1CCs5hRhT7oSsOq2y2Hf7qXdeIUfEfKj
	4hbl77M1Hn4k+qGt4m3o2SX18x8ou1B4q8dJ+uLtB7tMoOD32nYSr8SSaF70Ck+fLU1wEDeVpGJ
	16IZ0V6s/QV9WsBrQAggrX/V1xIoHlyeIl1iJO0gNoQM4MjWkuFoKdUWcXImUOqadt5SyYFw2so
	f7H1Bm0y7z1NXoFGBrLtw7jFWaTkuibk8xiKY6rd0wACzfB4EDFqyjyKimwWEWZ3FQDzspovByL
	gBD3dbWyMBoIN7B8Tm0jZWsjIyz5CsyevOwoEv0nMNiY/4f7yRDqUMD3WJc=
X-Received: by 2002:a05:6a00:2314:b0:736:a8db:93bb with SMTP id d2e1a72fcca58-7486cb21d0dmr5341551b3a.5.1749658440965;
        Wed, 11 Jun 2025 09:14:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/6SRDJJ5564j6vwuGUZRBSXLBvt48Y+4pJb7MX/NqEakaLAuxT3fRBYYzZ/dhUftkuTCdKw==
X-Received: by 2002:a05:6a00:2314:b0:736:a8db:93bb with SMTP id d2e1a72fcca58-7486cb21d0dmr5341521b3a.5.1749658440551;
        Wed, 11 Jun 2025 09:14:00 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482cdf1c41sm9443708b3a.149.2025.06.11.09.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 09:14:00 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: [PATCH ath-next 0/5] wifi: ath: Add missing includes of export.h
Date: Wed, 11 Jun 2025 09:13:53 -0700
Message-Id: <20250611-ath-unused-export-v1-0-c36819df7e7b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEGrSWgC/32NQQ6CMBREr0L+2k/aIjS68h6GBbYfaSIt9heCI
 dzdygHcTDKZmTcbMEVHDNdig0iLYxd8NvJUgBk6/yR0NntQQtWikQK7NODsZyaLtE4hJrS9vNS
 NsvJRaci7KVLv1oN5h1/d05qgzcngOIX4Oc4WeeR/uItEgWToXFmtje7VLTCX77l7mTCOZRZo9
 33/Aq7uSK3DAAAA
X-Change-ID: 20250610-ath-unused-export-df19562d1b37
To: Jeff Johnson <jjohnson@kernel.org>,
        =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: Xtq-MBuTvq2orSp-GvBTINX6RaqF0CfZ
X-Proofpoint-GUID: Xtq-MBuTvq2orSp-GvBTINX6RaqF0CfZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDEzNiBTYWx0ZWRfXy2f7+yAy6fM0
 ZdDWWZPNasw8XhS1vd3f7/NSOaDQzeQZpFzqqjZvIIwYjA4GNb3p/fHyDxpyFhLxv7S5axL9yzf
 yVY+vNrpacs1ek+RPJwuqTrkadWk5LS+5FDNV0zifjYJuCTy30iTxrFWK6U6vqbE5HwmN8GIR0G
 hgRhgOyweTGTzyoEbjRQoq8pM8D8zbotGTm85sJg9WRFomLPfWMA4YG1HPHsK80DKNpNxin8f2u
 hgRnVWnFfo5nUH3h0iSBk7Xp4n3XePqEJo3TOdrlF1XamiVZYlw9RFkqVFE8DGweo3TKJyrX7gR
 5BlI/iEBsDvSzT82U79WM4koNsYatLbkbdWpbHwWh7gsHFJ2T01Ijp7hGhsMe77wzBQZ5fhVKGX
 4/+0ydWJBu1WS4shvW2cOjA5qsA03Cy8zpUxruy7QDp1Kvt4Xu8SwcmLiYo0eM8g+AC0sGTJ
X-Authority-Analysis: v=2.4 cv=K8wiHzWI c=1 sm=1 tr=0 ts=6849ab49 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=pn7C01q4hUtA5Nn5QkAA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_07,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 mlxlogscore=645 phishscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506110136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_091402_776082_834BC321 
X-CRM114-Status: UNSURE (   9.48  )
X-CRM114-Notice: Please train this message.
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

commit a934a57a42f6 ("scripts/misc-check: check missing #include
<linux/export.h> when W=1") added a check which is now generating
warnings. Fix the ones in drivers/net/wireless/ath/...

---
Jeff Johnson (5):
      wifi: ath: Add missing include of export.h
      wifi: ath9k: Add missing include of export.h
      wifi: ath10k: Add missing include of export.h
      wifi: ath11k: Add missing include of export.h
      wifi: ath12k: Add missing include of export.h

 drivers/net/wireless/ath/ath10k/bmi.c            | 2 ++
 drivers/net/wireless/ath/ath10k/ce.c             | 2 ++
 drivers/net/wireless/ath/ath10k/core.c           | 2 ++
 drivers/net/wireless/ath/ath10k/coredump.c       | 2 ++
 drivers/net/wireless/ath/ath10k/debug.c          | 2 ++
 drivers/net/wireless/ath/ath10k/htc.c            | 3 +++
 drivers/net/wireless/ath/ath10k/htt_rx.c         | 3 +++
 drivers/net/wireless/ath/ath10k/htt_tx.c         | 2 ++
 drivers/net/wireless/ath/ath10k/mac.c            | 1 +
 drivers/net/wireless/ath/ath10k/trace.c          | 2 ++
 drivers/net/wireless/ath/ath11k/ce.c             | 2 ++
 drivers/net/wireless/ath/ath11k/core.c           | 2 ++
 drivers/net/wireless/ath/ath11k/coredump.c       | 2 ++
 drivers/net/wireless/ath/ath11k/debug.c          | 2 ++
 drivers/net/wireless/ath/ath11k/debugfs.c        | 2 ++
 drivers/net/wireless/ath/ath11k/dp.c             | 2 ++
 drivers/net/wireless/ath/ath11k/fw.c             | 2 ++
 drivers/net/wireless/ath/ath11k/hal.c            | 2 ++
 drivers/net/wireless/ath/ath11k/pcic.c           | 2 ++
 drivers/net/wireless/ath/ath11k/qmi.c            | 2 ++
 drivers/net/wireless/ath/ath11k/trace.c          | 2 ++
 drivers/net/wireless/ath/ath12k/core.c           | 2 ++
 drivers/net/wireless/ath/ath9k/common-beacon.c   | 1 +
 drivers/net/wireless/ath/ath9k/common-debug.c    | 1 +
 drivers/net/wireless/ath/ath9k/common-init.c     | 1 +
 drivers/net/wireless/ath/ath9k/common-spectral.c | 1 +
 drivers/net/wireless/ath/ath9k/common.c          | 1 +
 drivers/net/wireless/ath/ath9k/dynack.c          | 1 +
 drivers/net/wireless/ath/ath9k/hw.c              | 1 +
 drivers/net/wireless/ath/main.c                  | 1 +
 30 files changed, 53 insertions(+)
---
base-commit: 2b404d0c06adaeeebd355bd727ef600706b28197
change-id: 20250610-ath-unused-export-df19562d1b37


