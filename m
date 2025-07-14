Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4A72C83F1A
	for <ath10k@archiver.kernel.org>; Mon, 14 Jul 2025 15:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uYe5JEQ/NJBdGO052CLNtnqKAn42FRtb4sm7urxF55s=; b=oq9+b5rpHEQKcSlO/sMAZCZwbG
	dmKMVsUFaExWU3rKe6vd1TQdvS8T0fC5JeErpTRE4e9khjOAYDYQK6Yg6Uj03JrCigniwf6dhxu5C
	0yBNaCrgIHEPyjx6K862F6HLNoLtWd6Viot0uE2WKSaD+yOgzC+eguP88IjPPJ64qptH3LjLqd+rA
	/BCyy3LpmYTxEilsXmuymsMb4AtWoN8qC4hOSC0mFYYJh3sJw1mQXjYgAgAFc4VWu5hJdXQeunxK0
	i6xt8ECMxE6+lfTS+/muVmCOw80Z2BVN7ViDImJOZPu0qjtBBDIIgHx4p43Yj0HwzJvEWjHcNzk96
	JJFrzdbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubKnD-00000002ZVa-3oJ0;
	Mon, 14 Jul 2025 15:08:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubK08-00000002RbK-2521
	for ath10k@lists.infradead.org;
	Mon, 14 Jul 2025 14:17:54 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56ECNvng005599
	for <ath10k@lists.infradead.org>; Mon, 14 Jul 2025 14:17:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uYe5JEQ/NJBdGO052CLNtn
	qKAn42FRtb4sm7urxF55s=; b=bLYNq9MzOyM9dXurG4DhYAHNGDH1bJRR6TXm72
	BEFhSQQsLvNca2nzXu0l1OY06y/nS6AJz5wZyHRltNXGqRLM0bHNt+1yPT0HiFAb
	Yb1B0i3mf7R8Vt+BiizpO/7WaLhcCko1TSdqYMFP0fThmqNJQtlqBSAwM6wOmESr
	/LCniaT7GdG0RVhu9hRPx44sU5xFL/GHl59/Sc3ify+F42HDKiWM/ddwAALPEdfq
	2QhTH7R3c5hY7pwME5+qAZsBZsUEialXU3a1jMVeHJwC8fCNHVC0PKpKzX3Gv1Jp
	8winSY1KHLLlog7NtRRsLXPn+7Y2c/Xq9TALALu+5Iop2zSw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47vvb0sfcp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 14 Jul 2025 14:17:50 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-74928291bc3so3727619b3a.0
        for <ath10k@lists.infradead.org>; Mon, 14 Jul 2025 07:17:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752502670; x=1753107470;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uYe5JEQ/NJBdGO052CLNtnqKAn42FRtb4sm7urxF55s=;
        b=XnPmZveZTIlzpNniYbYE3dOS+7c/gXVmZeR3olfio2e7oY98Rlxy+Fny2YgMweAlhN
         kk0QVfEEtKvqWrA1vqzCwW2MWOgwZx2AXKuv5TCkx35OXzzqBxM5pingUZLIwMi8s7fR
         BsKrginccg5R3X6fBWuaLC+ZOO1Rh5rFCvKF4rx93aAuoHS2vbK/0HgD3RflayueyTKv
         7gP2L//NZ+SSu8+m2LmRPSibV09gZuS0DmXi954NLvXMXkAU8PMwG5/UomFdQHaxjONj
         MkjFGp/Y2ZdweuuiAd+88TPxlwn3S++ESUyObm+OvDArU2a09PFyVe2J8MWmf255lR8Q
         rcjQ==
X-Gm-Message-State: AOJu0Yx+CAzt+1YH0w0zRMbTEcpPO97tRk2Xj2jZfNJarHGhvs+FEEn4
	zlxDK2GllBaaUz5w3nDe5hGH9UfokGC8MjEUXKxfS+Qr3nXhMuGvv1jsrOQOz9zdEKh1+VsL5q6
	qypqU36woSQ228nyBdPMo4uQ6cBGqnO2KNgChYP2EUkaMJlS/vYZRyJnovUjwXnFL
X-Gm-Gg: ASbGnctpjnlOBJiC7xe8Cbg/FCzRj//zlXn1BMY05CwsNumHFxnWFIZgh+Z3MFYRZmL
	oSSRq6RHtJGAljn04LmfVCxVX09Gr2/pRXhyytNeRI1cLTIAEK+KdWyIk/YpQwojiCaxrBdxh+E
	W9X6dBiWJuuRvtzZpJ75ZJEfc+IVLx+bx5fB1s7l3+GDPziOe98QrsYWk3thMbLQZ4NVcEs+6wt
	sP0V7M5xMHtpVe78dskAueID5Y0r8+N86UB7vjOyk7jq6RoITohgQhb4L0UMvbtrLqN/hCtncNw
	5W4wxUEg9Gw3J4IO6XUgHGc2fjmRd6YwHg4hfmdLodTCNHpc1Wmad0uNLaWNhD/2EC0Qlzq1BRR
	M
X-Received: by 2002:a05:6a00:2d15:b0:749:112:c172 with SMTP id d2e1a72fcca58-74f1ebccf03mr14544861b3a.16.1752502669675;
        Mon, 14 Jul 2025 07:17:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgfKx6sUk0FX4r+rgTdQmHFsfNOtS1CTSqL+Sp9TUZPq6HVE3canvzPacPiUNgm7i7hhR8cQ==
X-Received: by 2002:a05:6a00:2d15:b0:749:112:c172 with SMTP id d2e1a72fcca58-74f1ebccf03mr14544818b3a.16.1752502668996;
        Mon, 14 Jul 2025 07:17:48 -0700 (PDT)
Received: from [10.81.24.74] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ebfd2d26asm8796236b3a.76.2025.07.14.07.17.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 07:17:48 -0700 (PDT)
Message-ID: <eb5bee18-e267-4fe8-9200-5a371a15539b@oss.qualcomm.com>
Date: Mon, 14 Jul 2025 07:17:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-current-20250714
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: QGf-KhJv9icFoSYiMzjcGgNgSwJLB0Kx
X-Authority-Analysis: v=2.4 cv=B8e50PtM c=1 sm=1 tr=0 ts=6875118e cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=Yt6yo0lQyOCnsUEz3GcA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: QGf-KhJv9icFoSYiMzjcGgNgSwJLB0Kx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDA4NCBTYWx0ZWRfXw9zutGncFqm0
 lVZtnKrKeHqqxsh7XGp72u+B2L0SJ+HE4F0GgODo8NPX/8hfjTh7jB1HY/+Kk0lw+zvxt8lvjB6
 I5m/K3aid6NdfzlrPbH3fhFCku+Idi9wV4k/FFEuQVJuP3VpyVGtDU5exBddnZmlQScwHeltfC1
 bRjDzZGdZyGufLiE4N5qNaJyUWxvfG+ch3opIODmcESGu2SDOqiDTV/qpiE0hYnRpL6927kdJdx
 zQnD53pYNDLcJTpTzZOiYMQvgQVbqarIQxtEQRIXCNL8X5ftr9py3/JnTUTi4BO1lMWU2LW00Lo
 nhH83V5bRo4oRJAcWGk3t2sR/4UTK+9x3CXcCmiH1YmgvX2RjvLSHV666k+dkBr0K2rRmovKgRI
 Q0OFbsPmnhrxJXqdZk2k5Prv6qUDbEydkhigw2IuEpo2eX6hqA+2SXHewf5RR6WHzVULicnY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 impostorscore=0 mlxscore=0 suspectscore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_071752_553529_5BE4A7F3 
X-CRM114-Status: UNSURE (   7.95  )
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

The following changes since commit c07981af55d3ba3ec3be880cfe4a0cc10f1f7138:

  wifi: mac80211: add the virtual monitor after reconfig complete (2025-07-10 13:27:14 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20250714

for you to fetch changes up to afcefc58fdfd687e3a9a9bef0be5846b96f710b7:

  wifi: ath12k: Fix packets received in WBM error ring with REO LUT enabled (2025-07-11 07:35:02 -0700)

----------------------------------------------------------------
ath.git update for v6.16-rc7

Fix an ath12k performance regression introduce in v6.16-rc1

----------------------------------------------------------------
Nithyanantham Paramasivam (1):
      wifi: ath12k: Fix packets received in WBM error ring with REO LUT enabled

 drivers/net/wireless/ath/ath12k/dp_rx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

