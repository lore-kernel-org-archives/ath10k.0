Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ACEAFF8868
	for <ath10k@archiver.kernel.org>; Mon, 27 Apr 2026 14:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aA8A2beOZ7PaJPh6gnoKuMWPVYV/5052moWZbH5LvRY=; b=n9438dv5kWgYCz69jjzYwRsQzK
	I1FoseNaCAmwVhBy+yYCgoWd6sv5rN4xlnW52Wwo01d30eiX36Gm7/DI/SmSz9slM3E9Pv1ufWi51
	eTAo6WyV7TnONfBKv9/caBIHNEdWYgIX/6cksTnJJvO6xeCk1pX/JY/Vt7LD467acKPu89D86AoDL
	5W6X7LgC2FaPssHzwO2Kio9UCpOj/vIZQvq1jIgbyO736O2RIGa+pVxim5gNCKE4cTlmf6tWLxcHt
	XSrpNmaDSlgEjqqeC9iftzDNnLrg7VMeqNNI6Y+qvXVB+ys707z5RmQP8I+cm2una38+hGeYtlagk
	rgikTOig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHMgh-0000000H3u5-0sbB;
	Mon, 27 Apr 2026 14:11:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHMge-0000000H3t7-1xdW
	for ath10k@lists.infradead.org;
	Mon, 27 Apr 2026 14:11:49 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RD5qXn665646
	for <ath10k@lists.infradead.org>; Mon, 27 Apr 2026 14:11:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aA8A2beOZ7PaJPh6gnoKuM
	WPVYV/5052moWZbH5LvRY=; b=pkwAw36Ho2+iE5B1Mzt8kXgT4DwZSZRo79Z+iX
	fXA9DJwzshq72ja/tCdp9dGo0QjhlPT+Oz0qRU5MsFAzIej1pb7D4rsolCheoKKH
	5v2napDN4XugCYzfh+BJc8OcPYWJCtwKYK+7iQzzsQ7C5tU2MgwvM3Df6T3ts4F4
	8NknCQnVJyLtbcEHEx+1/JZ9CVU7rsE/nI2jTUlw6ZMOqPvTrdg0jGM+lP2OHVlc
	EzNWIiBuc4Cm7uZ6/k/vG8XC3pxeUwrUW0o41junreK+EB98SJkF+hQ1d5QgMaf8
	DYnquS8MD9ta6NKbfGaIvYcahGsX3jmeVqNErWZ+R/SEIfsg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt30n1qt2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 27 Apr 2026 14:11:47 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-12dbf4f678eso5902055c88.0
        for <ath10k@lists.infradead.org>; Mon, 27 Apr 2026 07:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777299107; x=1777903907; darn=lists.infradead.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aA8A2beOZ7PaJPh6gnoKuMWPVYV/5052moWZbH5LvRY=;
        b=e8Rfm5I+0Yn/rEan14wsDKBp1SBtgWwHOAv5i7+577ZMz30y24KZqToIsDqqOU30nB
         95o4F0PSyZMIegKjFjLRYmyo0vWDovQ+2yhC1X+pgpxSeayE4XHw4zZJGkzz9USfj9ma
         4XuPvkyM8T8UnO1y4Nzkpq83o92mNkkOBxvHV1wDrxTx2T2jGue7WhHmgW+G3l9w6Yjr
         tFZtwPNE0fgJ9cipYgZsVViN7Gbr8yT9c6eowP0tONm4Ol3EPJEyduRLxkQBJvFC+5W+
         SJBb+LOKZEWW7rLpGJzoVZIYES6Lx01xPNpSvfLn/JiMV3nISnwAlhwCX0v4idjWnKJ/
         OVDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777299107; x=1777903907;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aA8A2beOZ7PaJPh6gnoKuMWPVYV/5052moWZbH5LvRY=;
        b=hAvjTYYaLzVRju7n61+xBVTM/ejgvp1sq0wT1Kx3fzu6JJ9I2fNAW6hT0wqdXM4mcU
         4A289CzphtEu/JAcQ706QmADBgF2zxA6G3WtnKW9wQoOmsSsr8dGrnpNykyPA7kKdvvt
         JxiKwL2u9CLdHP6QNO5gRD8FLxkO717ONSzW2NynMjYQjxByFcJ+NJOMyJjzRqXeM245
         F05xCgEfQd6OZmQIJUnOhFGm11EYJg6dmt4jbrVkQa7maarKfHkBOVbvD0hwHwWKli60
         gK0dyQiAykU0e6L8CYXF2fgviXlTfSrpGAvQ3NoS7u3gyOIW9qQzIfNE9+oqZe/s6azN
         fRrw==
X-Gm-Message-State: AOJu0YyndGRe/nDu2U0VaYfIkh5EDZbvnG5AmvfxyStdjMBX8OjNMCdE
	Q35z0vGrAjUR4raqptenA5PNV3tckabeoTp6KRZBXTQImIobwD3JkTqy0T83fFARq6oYglkub24
	+dMR3jiyvEQPTNFOvdcwRnzDzaVBFgpJ6Y2YzWJZ47N/dD4WQ+U6VNglSEjCirCxr
X-Gm-Gg: AeBDievDeYRgUtGDRZGN+tCaT4OV/Lq5lDD2FWqQZUTUBWqL3xIkDum4F2Tx+P7dlWD
	0+FefzabdVlJBWoMCoYKTvl45jcAXN5Q+AlzAYv4kL6WGV84vtfWSAYxXav+5FUhDfzrNd2LyxX
	B3pXTuwShWwM/HDRLMpTXb35kKROKBB7pljzHHjHTLN6r2PIl0V84dcW6vBq+TyIesdzFNSKzNR
	uDWG1Typuwy/sV7P2sXYpVm8MN8/3fIKzLDR0vw0Khxh/V9gC4Wk53W0llylItBd6OajLmBvja8
	I9OkyJzdIC2xixzSDmvZngSFOYmrTfXtPV+mx39P/6sb6hZEoJ2n9GWcghef09QjbTQsUkVAufl
	MKU1UjUP/AX/nGDxLLYz1wbOl7HcOO3xmYp++/Fgy4oEI6LShM0o+VEJ4TgFp6GHSiYVy
X-Received: by 2002:a05:7022:f016:b0:11a:641f:ba11 with SMTP id a92af1059eb24-12c73fad616mr23542073c88.29.1777299106973;
        Mon, 27 Apr 2026 07:11:46 -0700 (PDT)
X-Received: by 2002:a05:7022:f016:b0:11a:641f:ba11 with SMTP id a92af1059eb24-12c73fad616mr23542050c88.29.1777299106265;
        Mon, 27 Apr 2026 07:11:46 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c74a18a2bsm67154071c88.10.2026.04.27.07.11.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 07:11:45 -0700 (PDT)
Message-ID: <b1071639-e724-45f4-a1f0-51706acb7ccf@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 07:11:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-next-20260427
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE1MCBTYWx0ZWRfXynBhFIRePxLS
 1X8fgl1icgd9IdZaQT+b5uuNFm4vIKvCo0evL9o9EJi31gYjOBpNN088EuuUfCANNCPUL1q3eQK
 oJapRqt9IwyAnAL4J7DIlXY/Xi83e5ZU8noirHdZb+6Z/JvHzs3eIVrzPBOqByBWFCEFcpwVdEr
 eSNYXLTlmwSiZEha/srBjgOMaCGuf73Ei4XyeQjNOy4VtO9FfNzN7b+xKGkDw60rkpTeGpbTi/z
 9of2KbyZc12mre0UWfWIqihissb4FL8AUrN/Gj5hKW2ZlvJk868lpeGVOqt1bnK/9zSQvheE9wQ
 t+fcAvv/KSoi5hhUXXFItawwhVxkA1t/LorfrJGBcQVZZlHseKAuewnWy04iNOV9umGTuzYIeeD
 0M35SVm+AcgN2FQe6HBXi18sQlhqO5Xwl+tqYcnzre22fXXGedb2Ht9NYc6FdEf9opMX0NGaq6f
 hxNUd5jECx1xBkYwAzQ==
X-Proofpoint-GUID: 63HGuJtkWsrTaAlUZNSzMKqyQ-OpWOgP
X-Authority-Analysis: v=2.4 cv=efANubEH c=1 sm=1 tr=0 ts=69ef6ea3 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=m6NHjSuB-jaKV5Aw_IsA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: 63HGuJtkWsrTaAlUZNSzMKqyQ-OpWOgP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270150
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_071148_516198_B8776EFB 
X-CRM114-Status: UNSURE (   9.67  )
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

The following changes since commit 929298742bb5dfacd53ea99cf989cc81210f90a3:

  Merge tag 'ath-next-20260408' of git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath (2026-04-08 23:26:19 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-next-20260427

for you to fetch changes up to 34a5329beee86a22a446e27eb37f06caa63479ca:

  wifi: ath9k: Obtain system GPIOS from descriptors (2026-04-22 06:57:12 -0700)

----------------------------------------------------------------
ath.git patches for v7.2 (PR #1)

For ath9k:
- improve the GPIO interface.

For ath12k:
- replace dynamic memory allocation in WMI rx path
- avoid buffer overread when configuring IRQs
- code housekeeping

----------------------------------------------------------------
Aaradhana Sahu (1):
      wifi: ath12k: Fix invalid IRQ requests during AHB probe

Jeff Johnson (3):
      wifi: ath12k: Fix HTC prototype ath12k_base parameters
      wifi: ath12k: Fix ath12k_dp_htt_tlv_iter()'s iter() signature
      wifi: ath12k: Remove macro HAL_RX_EHT_SIG_OFDMA_EB2_MCS

Linus Walleij (1):
      wifi: ath9k: Obtain system GPIOS from descriptors

Nicolas Escande (1):
      wifi: ath12k: avoid dynamic alloc when parsing wmi tb

 drivers/gpio/gpio-ath79.c                      |  57 ++++++-
 drivers/net/wireless/ath/ath12k/ahb.c          |  25 +--
 drivers/net/wireless/ath/ath12k/core.c         |   6 +
 drivers/net/wireless/ath/ath12k/dp_htt.c       |   2 +-
 drivers/net/wireless/ath/ath12k/dp_htt.h       |   2 +-
 drivers/net/wireless/ath/ath12k/htc.h          |   8 +-
 drivers/net/wireless/ath/ath12k/wifi7/hal_rx.h |   1 -
 drivers/net/wireless/ath/ath12k/wmi.c          | 217 +++++++++----------------
 drivers/net/wireless/ath/ath12k/wmi.h          |   3 +
 drivers/net/wireless/ath/ath9k/hw.c            |  33 ++--
 drivers/net/wireless/ath/ath9k/hw.h            |   3 +-
 11 files changed, 188 insertions(+), 169 deletions(-)

