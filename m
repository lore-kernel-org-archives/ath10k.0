Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09195CCF9E5
	for <ath10k@archiver.kernel.org>; Mon, 27 Oct 2025 15:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OCOrSgOblqXWig6OfCFVn89kjpCjlnAQHN6FWMG46rg=; b=nimrp7DaauVIOMAEFUfZjRoNaA
	JjP1ida2UUjymtX4xBtWpC1cbzrlHXTpzc6JHkkWhSBJXAuWkJiiQsFgSKrbl9/eK1iQ13hIjT7rA
	lBfIXn82DkcuHbLUn2p2Dyod0fUzjjNJ2e0HBaheNk6sY2wK3TDH2AyI+nW1QzlMYlXhZCDPVXeok
	yEeofCZvAoSbUPBf/3PkUut7B+GXnsTPxoMfXnAZMGN407TSXy58pLuZwvcWYCDo7+F6tYIsIzKfS
	z/o+Kkc/EV+nvMzwv1Y0mLBa9uX9NQjE+C55h7qsNLeoN8pt9D5L1euqlDnppWXNwRfXLbKPQCVGU
	dg6af0Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDOjM-0000000EBYe-10xk;
	Mon, 27 Oct 2025 15:01:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDOjI-0000000EBYA-45iA
	for ath10k@lists.infradead.org;
	Mon, 27 Oct 2025 15:01:54 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59RDfmOR2881887
	for <ath10k@lists.infradead.org>; Mon, 27 Oct 2025 15:01:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OCOrSgOblqXWig6OfCFVn8
	9kjpCjlnAQHN6FWMG46rg=; b=d0o/shcUHoGwdYkJx/43muxD6H4lTTPZG4Uqtx
	kGG8WOo9rQPg+LVFxMSfGq5H37eg4VDrVLQKqi+rh1yS1lHI7oN+UtwVK/GQMPjc
	mlXickZfXq1bFJoyRtCNo9NBKs0uGRGHmxSL/5IVBTMC7ViA/fw8mL9mLAi+lTWH
	CL+TlRXnssNx3C7bwhhvwyL94Zi4Z1d0/SAjypiNIHto9h3Jq3K2QkFKCXbGvFut
	ESeCDh/qTvsLXUkvQiMGRlG7w+bvfeRrmbAuVckBKv21vmk7uhgpqmeEl08rgcx4
	fYwhGR4oCNJmuPiKo/Xi0zv8laZlQMWfJL8R1K0eKpehbIxg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a29uh8a0q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 27 Oct 2025 15:01:51 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-78108268ea3so4684921b3a.1
        for <ath10k@lists.infradead.org>; Mon, 27 Oct 2025 08:01:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761577310; x=1762182110;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OCOrSgOblqXWig6OfCFVn89kjpCjlnAQHN6FWMG46rg=;
        b=l47jszfUgdU+8q6OnTQri7PI4syFJPeif6M4q4fM7uwIJyXzsa0Yxzx9N+9KSBaGYT
         oC0jb3mdQ10NhXrf6VJQSd+FYcvk8Khvj8BK3uZ1rGwg5+zWGmlBiFlHoW65lTN3Sq33
         CgD6UM+WEQKsudru8JBOAonVpQSvbBLJ3m4I1K09OOYC5UViErET8fwetaWSo1U9Cfvm
         NwI1QnIKykwWsAWyNhrLHdQGqZGQpqT10/oiq31z5jjqO+ISt20d4TE3sGJFhvs6WC1n
         XexxdEWA3W8y8g5ZCBxWjJ9ktaFBKAVP5E+ygElKnUJRcSOoyZ7hEOeaq8tWPpmudZFE
         xyzA==
X-Gm-Message-State: AOJu0Yyhjv3ubczTJtwuE81su41lNcey46RvNUb+YFN1jtxFgGyGCwi0
	dp+pFF3AH6Oqdjw4ExzgjtCmTF8GZJpclr9qmD214ck6ZxDhC1i9u26fszaiwxPODVjWiXPZ1Lw
	HvMMD9BHI4HJ3S/4c53LFPy5EiWQ1EP3gFNecQx9tuEZybQhzPOq64M97rPGlV6Pii10/euIG
X-Gm-Gg: ASbGncvR9mpbRhEUReHU3Guy2L2JoRJpZCo1b9z3VQE2dPgu+iMk7qj1ptxyM5n2uvV
	yqMazws25MTQQKzs3v5jCY64IPz4dJqRc4t+k4Lu0MXayA+qjPGOW+7J3glkYwSWMR1z/mEw21E
	6zr+9bOPQWFLOK0Sywf3Pw01hLNQOfIS9hpbCsYOQGXZVP1ZOaKptfB6JT4D1kPrYpcHizCrgBZ
	n7jsd3iI7fjA75N0IXJdBSxKucnicEgIfVmqWROmh/7VLBFNn2Z2Lozy+tRWNIG6gZm7PhDZsl4
	V8P9gouaFqKIaRRMzCAhXH8RcghlWYYEG5U2QFPXKvHkcH/p5/enMBe1dnBJV/RSnLM/fzC7EE+
	UHK1EBJtzq3iTu1CU0XJNnTzadval1e4UDSE=
X-Received: by 2002:a05:6a21:6d94:b0:343:6c90:77aa with SMTP id adf61e73a8af0-344b5167005mr468364637.29.1761577308132;
        Mon, 27 Oct 2025 08:01:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrvvBRv7oKTSELHMmBANH7x5KQyEPgrSTWh4Tjr+xrvgbNF7sSM/4PBKdW1pG8CYbqDyIRmA==
X-Received: by 2002:a05:6a21:6d94:b0:343:6c90:77aa with SMTP id adf61e73a8af0-344b5167005mr468285637.29.1761577307219;
        Mon, 27 Oct 2025 08:01:47 -0700 (PDT)
Received: from [10.81.24.74] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a4140530d3sm8590390b3a.40.2025.10.27.08.01.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 08:01:46 -0700 (PDT)
Message-ID: <e7e3ab9f-f477-4e84-8a5c-609fa1834624@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 08:01:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-current-20251027
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 3UcAhkf7j4RjumaxH__igtVk089Qsiq7
X-Proofpoint-GUID: 3UcAhkf7j4RjumaxH__igtVk089Qsiq7
X-Authority-Analysis: v=2.4 cv=QuFTHFyd c=1 sm=1 tr=0 ts=68ff895f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=-r_gnQ9DsvtphcIF9MQA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDE0MCBTYWx0ZWRfXwYYcyONdyH8K
 teuN6G6ZJ+cO9vBdlEvRaBP0GaP/ovos1K22AOiw4vVja0adbEUgP2WYV1R+VqdJ0DzWdG9gE3m
 pdpJ6r9zNgtRhRNarjQvHQx9CJsY+vpRn2sDVtukY0yiEJv8wIlcOxrnR1Ya1lDknJ53SAYedmz
 1RO5v0A3V/ATqTdc47TyX1kbhnZvI78KItZ/aUkAy23vNsFXH2avax9smM/5URNhhrVkKrWZXq9
 6f/WCECPJaWLZY8grI6Gztn5YIIqUuliPVkAl593uojjOdmxfCC9FQl+UCBAyCzbMLAm52lq+jV
 A41c7oWyHPLTdgCb8J8YI7vL3yTAMFBCyIpM2GJVVYuCFuRsiexe48t8M9evf8ALS2w806asmIk
 HLDd99BG81Z0D/MuXyp6ofV7d3srHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_06,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_080153_194733_9DAA2948 
X-CRM114-Status: UNSURE (   6.08  )
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

The following changes since commit a83155cc4ec5dd8c99edb541dc12d3bd8e97eae9:

  Merge tag 'wireless-2025-10-23' of https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless (2025-10-23 17:15:48 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20251027

for you to fetch changes up to 2469bb6a6af944755a7d7daf66be90f3b8decbf9:

  Revert "wifi: ath10k: avoid unnecessary wait for service ready message" (2025-10-27 07:35:24 -0700)

----------------------------------------------------------------
ath.git update for v6.18-rc4

Revert an ath10k change which improved QCA6174 but completely broke
QCA988x and QCA9984.

----------------------------------------------------------------
Baochen Qiang (1):
      Revert "wifi: ath10k: avoid unnecessary wait for service ready message"

 drivers/net/wireless/ath/ath10k/wmi.c | 39 ++++++++++++++++++-----------------
 1 file changed, 20 insertions(+), 19 deletions(-)

