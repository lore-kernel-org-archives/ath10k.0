Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 699B5CA9ED0
	for <ath10k@archiver.kernel.org>; Tue, 13 Oct 2026 01:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LFghOFxfEaRKd6WYvXC1xqjFlvjsz2IM7ZvFQDLcxP8=; b=WNvdHoG+3OpmEQek4yEGWvfEyg
	q5dkg/Qve8Z5XFq2CNbqJyHnqbs7CG13MnnjRIZmecs6Yne0VAECr4VA9i+MFckaoNErpNig4n6Z0
	bwfxmLm/oMxtsCSmr6my69rUFYAKWiEXlfat3MNotcr2N4eZy0Ieep3cO23Jp4MR8Ol0TE3DGLhaG
	hA30JoeLhr5uHrJAT82KskEiAGPl0UNJryuew3NGhH/lvn9OlxgnSA3T+72rHKEdaWm600wWyAL5j
	tTjGt3Vi86TvRDVhnUd2cTdsvJCaFA8cgDDWHwIQpQWBEJjZPTJ/Wld9/YVGFMqPrYo4POcGW/w6S
	yyX+974A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGRQK-0000000Bkse-1UVD;
	Tue, 13 Oct 2026 01:35:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGRQH-0000000BkrQ-0iWS
	for ath10k@lists.infradead.org;
	Tue, 13 Oct 2026 01:35:22 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CJN7pq2911813
	for <ath10k@lists.infradead.org>; Tue, 13 Oct 2026 01:35:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LFghOFxfEaRKd6WYvXC1xq
	jFlvjsz2IM7ZvFQDLcxP8=; b=h1uyUaiPEiwYeO/mymHt4NdQbBeQAd8ZyMkkAP
	+r/qj2NYCF0DZDLwVX5D106jh5tvOwkmKCvnqiaKaJagcb/nA/f/9C71LtxjhLlo
	bLHnu9ibBAvStNeyF1Sx5kHHWwe9hVqL3opFsmDcc0ohLJgaMI56MS6o79HsKOQg
	6vdAI67fnoyjXqNfwCvnff2jAkr5XEYUkitL1bnq6w9KlTNhVxQ9yI6g9y4iJpRj
	fhLEdFHkOaviP2z4GbkGq8AUdf+JgIIgPI1HrGtfCoktl6H6IvCgtlPX1nxto06d
	XXwEkmfd0TxzSEM1yiDtkU2b/ScAgMT99Jk5cEs2iyw7954g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h940w1kab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 13 Oct 2026 01:35:19 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35c902e0da2so118373eec.1
        for <ath10k@lists.infradead.org>; Mon, 12 Oct 2026 18:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791855318; x=1792460118; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LFghOFxfEaRKd6WYvXC1xqjFlvjsz2IM7ZvFQDLcxP8=;
        b=QBc/09bWl8hzEEDUHlk53M9DYT/xxSMLB5MMjKWAiuigmRN23wTtOCuimFKj9PmeQ/
         7E2NzdXE1EUivmFQKueV5JdSDCVzUNrzPsCNXbi7uzY4/h/PVo1oy+NpcbUAwuywg9Qn
         gjSrbBAStL+VrnpKJADFO8a4oCXieJ5XO7nVgOLJg9hAnUqCsTRXglpnXUPL4cyPlwoh
         /9psgZrgwhvZ6F3ye/zSC8uP8eGT6yWKhKEiHG+BixesDYf8kVz9MvdxxPesSoJUhE6J
         P1rtkIMK3eOmmJYxLrdl+1ZCcWjlrepKRY38fzicWThv1Zr4x/JkvevDhpn3iMDpV/P/
         4wNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791855318; x=1792460118;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LFghOFxfEaRKd6WYvXC1xqjFlvjsz2IM7ZvFQDLcxP8=;
        b=XwEWwl274oQah9Ib2shc3TKvlI/ZRrDS33zA+yiEyOVq4Gx2+5GezJjhB/Pzk4VIZI
         DCR4I2UDRo4CN/ocTyzHz271E+f2gkU3q2yU9ozEQc36nArYcXA+0Wt9Be6eU5KCPCL2
         jPjQEMmFXl+s1ZnX610X5+0bhACQbQ1fiQDySZe1kLltLL9OjO91UZb3wA6aGZ1i8f5B
         4gmQad8UyF2CNNEdn2jBBgNuQJh+P4C2bUuv7Lnmtdh84Kxp/N3R4ENJbRaNfl+Pr9d2
         3CACE1wxv+Y7gKy40rKP/SeJmbdd6iN1OY6i6sIRGp1jY5saqiIAsFzrAWdqIGZQEVGB
         oehQ==
X-Gm-Message-State: AFq9FYJycKi3hp45+kAgnswc0VAMqD41tBDvUkV5f+nQ1fMVlyKep/R1
	6rnNanUeWXrBJBbrIinaDS+yvfAFO0tkpDI64V//NPjWx1R+uR621hlfcYY0/jZnPcdtjajLdfI
	SK2RMBOXqQwnslo0KIQvVjB98Hyu6TfKmxAFQ+zzRbpBTtWgOT1n2dyHkAIPC38mg
X-Gm-Gg: AYBFou22Uo7wyb0Qm2yf0emZtL7gc23nqnJzrvuUoXhcA7x3oyODLD7Lsg2lM1fL6i1
	N0YR+IRC3q8E6etqQq/2zHKV9WMFc47sYZ20lKCSyG54Lem2X4k27PTnlsUWeeQg3eEuTyV3N1D
	8X8Z2dlEmq9le8VM9LnSK6DLd7krACeTkEKeVBFi+G2uR9O0SbnbDCSPzpegLbAhIa/EV64CAAO
	0onzO8MgkJyCWbF5QdQrPDEA2C2cVmxqx3pu+DgkwquFimRkz8Th2Ao5EhGSfDPaLaW8O4onDop
	zJKfFNCDCHX8IHNbpqV2P8zgpFj1rtQVyuSxMtYw14rva+tHKnod5Pwx4LvNNubRFEquCyt68t1
	fk/sj8oaanJU9wGszM13jjSA0eyzcB1cBCn0=
X-Received: by 2002:a05:701b:280e:b0:13c:d071:f97c with SMTP id a92af1059eb24-16a5b97ae60mr16069692c88.11.1791855317910;
        Mon, 12 Oct 2026 18:35:17 -0700 (PDT)
X-Received: by 2002:a05:701b:280e:b0:13c:d071:f97c with SMTP id a92af1059eb24-16a5b97ae60mr16069652c88.11.1791855317120;
        Mon, 12 Oct 2026 18:35:17 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a31f6f5csm32829335c88.11.2026.10.12.18.35.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 18:35:16 -0700 (PDT)
Message-ID: <97179203-e4fe-4309-a4ed-025408703cf3@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 18:35:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-next-20261012
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ov99QfEgQlPkPAq7LRYnqorUML7dIaMT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAwNiBTYWx0ZWRfX58rxuJmbGtcu
 Y9waMthclMUZHaunUHxVbSSYy48DDw1SIQ0FmycT3XxlVHI3LSSi1CT/0PNAzOl/ctOoJlT97AJ
 kOHlYNGtJZNiO588Zyq2YAv3QgmWyscPAfdOXENKo0ncaojE08cCjfwPtRL4iQ6WPUVwj0MeW5f
 +XQ/09J6sQTWMNouYvewV7xpMoa9gASUpWc9evxu+T780kyqHTlCqEMuPgLa7FQpJLgi4vssP6O
 Zt86UsO07sqsc3ix/6u7V7Izk1bRrzZQES51HhIgxKAJc+bnc+dW9//MIuYxmtKxb7q/nJmCYOo
 364p7Y5mIS8jAusMFPCfMU5AY7XdB7rSv4K6WfFlshZHkO/jVXZjAAGScUfy42l/xtW+s8K3rfP
 6W8n/i5hxsGT3v9I+64BduqCwd+taYE/cRX1Fp/Qfx1rTcFN+MJaT5WTw10Mo3//stP/BUhzQBc
 X3B6wEvfcurt2ClCr2Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAwNiBTYWx0ZWRfX7ON+IOZh8tYB
 0wNRtv+hX69NISf9UU2FiHsNnobmdhqs6znl51j8L0/MUdh1FphZifqcL2gL/wHNi7y3QggxGX6
 dD9az19r1lbLOMuoW8LO3b1OYUsKe5s=
X-Authority-Analysis: v=2.4 cv=ftZJ914f c=1 sm=1 tr=0 ts=6acd8ad7 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=6KfbWdwkAnXCE2h2UTEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: ov99QfEgQlPkPAq7LRYnqorUML7dIaMT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_06,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130006
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_183521_330824_51C33123 
X-CRM114-Status: GOOD (  10.78  )
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

The following changes since commit f49defea7668d8c68ec19fa085ef3da6075561c7:

  Merge git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net (2026-10-01 11:02:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-next-20261012

for you to fetch changes up to 4aa45334eb23d40bf31c43405daea9b73469f2a6:

  wifi: ath12k: avoid IDR mutation during vif mgmt TX cleanup (2026-10-12 18:00:36 -0700)

----------------------------------------------------------------
ath.git patches for v7.4 (PR #3)

Nothing special here, just a bunch of assorted cleanups and bug fixes
spread across the ath family of Wi-Fi drivers.

----------------------------------------------------------------
Aaradhana Sahu (2):
      wifi: ath12k: Make RXDMA buffer ring size configurable per memory profile
      wifi: ath12k: Fix NAPI resource leaks in AHB external IRQ paths

Albert Esteve (1):
      wifi: ath10k: clear QMI if failed during init

Baochen Qiang (1):
      wifi: ath11k: fix unbalanced IRQ enable/disable during suspend/resume

François Roux (1):
      wifi: ath12k: skip hardware rfkill setup on Microsoft Surface devices

Jeff Johnson (1):
      wifi: ath12k: Remove unused HAL_RX_REO_QUEUE_INFO macros

Jiale Yao (7):
      wifi: ath12k: Reserve space for a string terminator
      wifi: ath12k: validate MAC/PHY capability count before saving
      wifi: ath10k: avoid IDR mutation during TX cleanup
      wifi: ath11k: avoid IDR mutation during pending mgmt TX cleanup
      wifi: ath11k: avoid IDR mutation during vif mgmt TX cleanup
      wifi: ath12k: avoid IDR mutation during pending mgmt TX cleanup
      wifi: ath12k: avoid IDR mutation during vif mgmt TX cleanup

Johannes Berg (1):
      wifi: ath6kl: don't take RTNL in del_virtual_intf

Nerijus Bendžiūnas (1):
      wifi: ath9k: refuse spectral scan control while the hardware is disabled

Pavankumar Nandeshwar (1):
      wifi: ath12k: Increase RXDMA buffer ring size for default memory profile

Rosen Penev (1):
      wifi: ath9k: delete channel-context timers on deinit

Vitor Soares (1):
      wifi: ath12k: advertise interface MAC address pool

 drivers/net/wireless/ath/ath10k/htt_tx.c           | 12 +--
 drivers/net/wireless/ath/ath10k/qmi.c              |  1 +
 drivers/net/wireless/ath/ath11k/core.c             | 21 +-----
 drivers/net/wireless/ath/ath11k/mac.c              | 33 ++++----
 drivers/net/wireless/ath/ath11k/mac.h              |  2 +-
 drivers/net/wireless/ath/ath12k/ahb.c              | 41 +++++++++-
 drivers/net/wireless/ath/ath12k/core.c             | 37 ++++++++-
 .../net/wireless/ath/ath12k/debugfs_htt_stats.c    |  2 +-
 drivers/net/wireless/ath/ath12k/dp.h               |  8 +-
 drivers/net/wireless/ath/ath12k/dp_rx.c            |  2 +-
 drivers/net/wireless/ath/ath12k/hw.h               |  1 +
 drivers/net/wireless/ath/ath12k/mac.c              | 87 ++++++++++++++++++----
 drivers/net/wireless/ath/ath12k/mac.h              |  2 +-
 drivers/net/wireless/ath/ath12k/wifi7/hal_desc.h   | 26 -------
 drivers/net/wireless/ath/ath12k/wifi7/hw.c         |  6 ++
 drivers/net/wireless/ath/ath12k/wmi.c              | 17 +++++
 drivers/net/wireless/ath/ath6kl/cfg80211.c         |  2 -
 drivers/net/wireless/ath/ath9k/channel.c           |  2 +
 drivers/net/wireless/ath/ath9k/common-spectral.c   |  9 +++
 19 files changed, 217 insertions(+), 94 deletions(-)

