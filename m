Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C3D4EDA69A
	for <ath10k@archiver.kernel.org>; Tue,  3 Mar 2026 16:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KYInzzJjsnnU1zrSS2VPuJ6KrmGRMortrB9S+4pnuA8=; b=RNVnGW6UP+NlHraZQMvtQV+Krc
	lM9BMUe/OCoSwe8z7SbFwjevldwET5N+R3khnoqQRAkoBmw4xC1jK0i5529/Ji8blXAfgswjMir0l
	a+DiyzAI1o3Ly/jNHAu27rYV6rxWzyyDW2sGDEmghgiBrHx3iqoKB0e0aDNapV9D55Aczsr0Ln+LZ
	dzWB7IJdPPx6/ql0/LrEBW10Jv87IlpFlGHDi9ynsfPfWGWD49cw1huErkJTbbEVjPUmc8dbY5HbP
	GgFS7pgaK7EyyGqZD7z2opcpVhilnMSzvsmTBW/KuW0DRJQE+/aSfXcxHM4a7LgITvawJu8s7SlFU
	hj8ZrU3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxSbK-0000000FYs2-3G7F;
	Tue, 03 Mar 2026 16:28:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxSbH-0000000FYqH-3CwS
	for ath10k@lists.infradead.org;
	Tue, 03 Mar 2026 16:28:01 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239muU03100276
	for <ath10k@lists.infradead.org>; Tue, 3 Mar 2026 16:27:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KYInzzJjsnnU1zrSS2VPuJ
	6KrmGRMortrB9S+4pnuA8=; b=hD0AiqE5rRSUQro3xKz4TZduHfTaFPIKLOs74Q
	2mtGoArBTujZj1syc0yN8Q5twKRpTwQAFtYPzY/4tMdlBYuVwbnjEMFwVAfTuZYv
	/V0CE59OX+OetbaSoZYK1KeI1vvq0HU9o/3Ac3ZxAeNAe7v7JhlpdVK1734rXe1V
	bQVyx/rSjc0l2xDteMKPm2CJwIgFtE7NzHvNVZDWUURgsWHVUemjrlK6h2dVCAMT
	wZQsLywuMp9sS9ItHHFO/2FkyQRf6miZWUD++N1QDbWPs7idT9tkQPfDlHe4QB9K
	Tj4v2cAh0lJ7PyAFxBXcxNpi/DGs0xgFU7VBp8yvcnH5I+uA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnuqu1mee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 03 Mar 2026 16:27:58 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1276e71652fso10218940c88.0
        for <ath10k@lists.infradead.org>; Tue, 03 Mar 2026 08:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772555277; x=1773160077; darn=lists.infradead.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KYInzzJjsnnU1zrSS2VPuJ6KrmGRMortrB9S+4pnuA8=;
        b=kA+8CFAzBVfECF7NqxOaa3rOpGmR/vhLtjGoC0Vv6Z4nFs/n7hEtMANnQbdY5ITS2O
         B9ztoosAnDiAPeEpiu/g5ThDsDHYXfU2GfbXBnY8vl8J2pyQqUeRxMIeBewBAC+EkXhN
         Klv4Xus4Fo6ybcwMtjT471aVEFL0YImx1bqaBUg4jmsxaBoYA+oLlORH5i/k7q36f+hZ
         ck0uFq22cs/KWlw6IJvCoJgEho5tBCHKj7H8Oo6hpU7ZOQrUJqhAJopJ1RwXdga+mItO
         81t/57u8HrC6lJ6OKx5OCuJwVDu+GC3faq1YG3QGoXxxxfgAsbB85pUGwIK13xCip9ZQ
         AGCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772555277; x=1773160077;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KYInzzJjsnnU1zrSS2VPuJ6KrmGRMortrB9S+4pnuA8=;
        b=gnMzpqgP2yrImZQ6EdJWbK2IxCFW0wCxkH3LgcswkcsoCEaGFWshgys88CH9WGbjlS
         dK9vAq/u+HjKKwVuGPCol2HdGrhSJhRcAMI4FzC61c6o4Lcmne94HMTzu1VjzBfae0H0
         MOICPv4Z3uVcF7xnE+pSn0poTRN1o5IJokBnP/p0fpeBoLpNdy+aSmgrHmgbwHziwaEk
         7BEieitz7S+8sTQemLAg5hhKYJqLvIZRxyB2M2h3WHE6F2Nh5DzgvHaJ1fTLhCkyuEkX
         35yJQH8oEUfGbuct6m69yxuiMblo6Nkz8bF8y0KWXL0emksH7QMPCk06VOsZtnyymdPa
         dAEg==
X-Gm-Message-State: AOJu0YxqCQ4Pq3AXcXrX4eGQqm886VsJVzXmbSIVQF6+y3pmL5Maq1sd
	B43BiORWYt3Gpky9jGxkrO4b0hhV+1uQxsCEsniirzA265eYRGXF4UrpslJG8awOfscEd3vcd6/
	3pfxsDT++SIYVspg3G6M3pd2OgNV0mETqpCSeMri1UKmWvphYZ1te5Bq1Um/oiyJ4
X-Gm-Gg: ATEYQzxTOsZwxC42uES4sKdGVEFm3tdeFd4kMxt9RFX5DWeK4R5pQ3PW52StU30DSEF
	5e+VcDy8AIxvfmnWooC7Z132BtuTNniaPt0dRluwkl6rLMG5aLnyWGTCc2oz8psZNrsT04VTieD
	gavLhS/cqhs2marGmDBYqbtmZDmx6P6sWEhJSzgom1FJkigBfnbWgfBI+9wutnLUSMcQd9A1m5z
	SdXjRQ3yrhIXGXKlufREfBuuRceclwFEL/kFoC4+In5lxoEA170J1Qh2JCRvXybcCyjZFFj6CM4
	2RKvLBe9ASrPsewGA8dw5rikkvCiddoQQOgla6y8stt3xxCQrZ4N8iYnlo1I1TbnHL5VHLEv1ZX
	s7vGyHRkvQNaLfUHhsqU9PuZOyb2xuHuQPme89gPtL8Yp5szTBMwajrsYPw==
X-Received: by 2002:a05:7022:6296:b0:11b:9386:8265 with SMTP id a92af1059eb24-1278fc7e36bmr6954128c88.42.1772555277446;
        Tue, 03 Mar 2026 08:27:57 -0800 (PST)
X-Received: by 2002:a05:7022:6296:b0:11b:9386:8265 with SMTP id a92af1059eb24-1278fc7e36bmr6954110c88.42.1772555276815;
        Tue, 03 Mar 2026 08:27:56 -0800 (PST)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12789a32633sm19601264c88.9.2026.03.03.08.27.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 08:27:56 -0800 (PST)
Message-ID: <79e82568-e951-43f4-ac87-2319245a5490@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 08:27:55 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-next-20260303
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=M85A6iws c=1 sm=1 tr=0 ts=69a70c0e cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=bNXkL-wRCx4twWDb0eEA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: D9xA3j3htVkotEdt9J7_--TmgLjFxaPC
X-Proofpoint-ORIG-GUID: D9xA3j3htVkotEdt9J7_--TmgLjFxaPC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDEzMSBTYWx0ZWRfX/WEGpcx6DLgZ
 YYYQVKjZVuKr1cP5jEhAf+aMZUjizq9Y7TR9pOw2zarcS4qkb6pnLl2g1olrY5pnoJPDgqfsl9k
 GYaTAmk+NF+qDx5lz/rVbUt4OlvWuECB1N+DUzhwVsFixkNJmjnYhsDaQucq8WAltmTWZFPoj5O
 EWEsaS6Ic+Jk2EaAPW74XFZO8buhiNJ4x2K3IQRkqyuWQiMF/HvfRsidJMcE8+3M+USONLc5Ksc
 Xv+tWToJM/p7qpoU6jigwYbfIBZIBe/KdyQgAb+u3UzXj77eCW61DkT/0pIe8aOkoStTnLTY52N
 I6ETe8y9RT+lXJoWG7puHHC6z07Azym5LagESUKO39cs5mkyALjXRbASkLJucuqbK0rreb5PgVt
 IdH8AHpoNzUAWZ+eXumrcX7lpFuf932OvQfuXZTxevfiLOM91rRhhhiqC2Nn/bK+Fh9KhwT1rh6
 gOCk/Ip0Ekum8nk8CDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-03_02,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_082759_928435_A9399DD0 
X-CRM114-Status: GOOD (  11.03  )
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

The following changes since commit 8bf22c33e7a172fbc72464f4cc484d23a6b412ba:

  Merge tag 'net-7.0-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net (2026-02-19 10:39:08 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-next-20260303

for you to fetch changes up to cf7cbf97c630c3414302945617b8ac405e2b0dd7:

  wifi: ath12k: Remove the unused argument from the Rx data path (2026-03-02 13:02:05 -0800)

----------------------------------------------------------------
ath.git patches for v7.1 (PR #1)

For ath12k:
Add basic hwmon temperature reporting.
Enable monitor mode on IPQ5332.

Also a few small cleanups and bug fixes across ath drivers.

----------------------------------------------------------------
Aaradhana Sahu (1):
      wifi: ath12k: Enable monitor mode support on IPQ5332

Alejandro Colomar (1):
      wifi: ath9k: Fix typo

Baochen Qiang (1):
      wifi: ath12k: fix indentation in ath12k_qmi_aux_uc_load()

Bjorn Andersson (1):
      wifi: ath11k: Silence remoteproc probe deferral prints

Karthikeyan Periyasamy (1):
      wifi: ath12k: Remove the unused argument from the Rx data path

Maharaja Kennadyrajan (1):
      wifi: ath12k: add basic hwmon temperature reporting

Ramya Gnanasekar (1):
      wifi: ath12k: Set up MLO after SSR

Zilin Guan (1):
      wifi: ath11k: fix memory leaks in beacon template setup

 drivers/net/wireless/ath/ath11k/ahb.c         |  10 +--
 drivers/net/wireless/ath/ath11k/mac.c         |  28 +++---
 drivers/net/wireless/ath/ath12k/Makefile      |   1 +
 drivers/net/wireless/ath/ath12k/core.c        |  23 ++++-
 drivers/net/wireless/ath/ath12k/core.h        |   3 +
 drivers/net/wireless/ath/ath12k/dp_rx.c       |   2 -
 drivers/net/wireless/ath/ath12k/dp_rx.h       |   2 -
 drivers/net/wireless/ath/ath12k/mac.c         |   4 +
 drivers/net/wireless/ath/ath12k/qmi.c         |   2 +-
 drivers/net/wireless/ath/ath12k/thermal.c     | 124 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/thermal.h     |  40 +++++++++
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c |  25 +++---
 drivers/net/wireless/ath/ath12k/wifi7/hw.c    |   4 +-
 drivers/net/wireless/ath/ath12k/wmi.c         |  57 ++++++------
 drivers/net/wireless/ath/ath9k/ath9k.h        |   2 +-
 15 files changed, 255 insertions(+), 72 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath12k/thermal.c
 create mode 100644 drivers/net/wireless/ath/ath12k/thermal.h

