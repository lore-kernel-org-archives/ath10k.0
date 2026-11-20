Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AB560A3815
	for <ath10k@archiver.kernel.org>; Fri, 20 Nov 2026 08:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tdfORq2u;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FkBWzo7W;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SDOwLfrR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Si9vSiYHm+3mxSuW2rbUZ7MDn829iRZrJ39OuehL1dY=; b=tdfORq2uqqTwy81I1WL0V1wxcu
	8AyKUDCLq0ZDZGrkvIlh+Z0fG6wRxCHwsvCkHYySlc4jY06iqrkhhpSe0+yF0/gXfNNLu/blbzDVw
	UXlxAvTvZ+80yMVl/wLiqZbTA71T4U0NDyjKGFDVQ4ifcnWbEHtqndSCRvtgnqzxhHP+pYcV/tYUT
	f6xFdfDi4/VH4aX2uM7eMTfzCEVmxWgow4+6fUT+7Q+TdlfPjHzYWqIGRJUVWWY73yIdV0ngtI7Kx
	WSea5IwUrBrk0CcDH+m+uYz0ENqUVF794m+uRiRw3DHAQQJQzqfq2teY7e/8504AjjS/w2kT+Hf2G
	JtXxzhYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUKCx-0000000EMXf-245B;
	Fri, 20 Nov 2026 08:42:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUKCs-0000000EMVn-36DZ
	for ath10k@lists.infradead.org;
	Fri, 20 Nov 2026 08:42:58 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7f0G0606014
	for <ath10k@lists.infradead.org>; Fri, 20 Nov 2026 08:42:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Si9vSiYHm+3mxSuW2rbUZ7
	MDn829iRZrJ39OuehL1dY=; b=FkBWzo7WOI8iorPSIzVQTiDz4EBkqOFDDLdy4D
	uGI4yI3+53Bz0IDQiZA4rmCHxGSNaqPB8361rQGmB/Mgh0/0xunsdW4Q0PsOd5XX
	wSO1gr9ictrTq2PtVu2ZaqQL52b1PiLyT7AbT9TtBy8IIc/kLHVcyLcrcQEHGzuQ
	+ReJCnbGepqD6lKX9Q9kfBx9qvKqBLpxZ+TRbxvx9EIOB0nHrTqcgLYXCbmTSXJl
	jpKG7n+vaEz0MVzbqxw8RjSEz1wPjrrUP1P0Ia4dc6lQY7V1kAIeAgwsDQHdeONt
	ViBpe1M4lGZO+6GvhDRy4KLf16cboEgP2cHNBScFzRNHnAdw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2ggqrn4c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 20 Nov 2026 08:42:54 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-375bac6bd21so679127eec.0
        for <ath10k@lists.infradead.org>; Fri, 20 Nov 2026 00:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795164173; x=1795768973; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Si9vSiYHm+3mxSuW2rbUZ7MDn829iRZrJ39OuehL1dY=;
        b=SDOwLfrR/IFXkFKCgqynWHq1+3m+9g5eUEycyRrYnm2Wp6OyaE9N6YCGkI58N8yegx
         GfPalWi0gRgOgaW7Bm8iLZvv85Hr1XJ+0380wnI+XwomrnphcmKTvMDHwgOTNrUri9/n
         JWUALZBiW6Rhf/T1L9npdAK3oW8jEaZPzH6eA//na7n/gI49BHScs2hlhrpwtsChAQv+
         lNfxnmFDWjm1FatJXAFpkJ1T+2tcz1XhDPSc+qwI0SMpUGhrk96KdJFG2utjIdWbppEc
         d7LF7kPApiAHQ8VaFZvQD33EVbl+c6rxQ2wePI7k5X4yUiq2imSio1pLcpuPHJkvcf/S
         9mMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164173; x=1795768973;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Si9vSiYHm+3mxSuW2rbUZ7MDn829iRZrJ39OuehL1dY=;
        b=RrtnXqoxVQosZNiLcU006drnHplC8d/+8RulH5q/W5LffT6+FNn+j0UMEtvBEPzZyl
         IOsmdrfZ9ZWESR+Ptc7T6okimBsFvly5iUh6Uf0vL+9YptZTcZUcmo4HM2w02aoNGLBv
         dP2hhc5nhqcN3HgwJVOyrxcvEvFln7RmaqFt0SXkgNctGMPxC9IgwO2pUZb/+wV1ylhM
         NYPT3faj0JXecCy9NaaC6LdldEnSaIfgkK1I8+4Qj8YImtaUfp1VOmJE1OBJc0ktShRc
         0yCCirgb0Q0rHxDAMhkYe6DFd9vfr1sA5ocpX9lqY63xW9fnN/I6uTbThFaz9OeCqNzO
         zYGQ==
X-Forwarded-Encrypted: i=1; AL+hErEzCaRIvS4dYrn7nViX1ikFVZjPChEfeHcnBDGbwLJfAd8Ik1OwvPr1JdlY1ILMexB5iGidJJg=@lists.infradead.org
X-Gm-Message-State: APuU4Z8q1owi4+yupr8ofxkm3ojWOUDJsoQeafc6dy5C0x+8YodOpAjx
	tU+PycP3n2yZ3bIWpJQvL6Mo7r0UOryLujxo2bSqGLl1zQd2+KIizozBBXnKdWzmIZ2jxQMzM4f
	FTnYRP/CvAnsE33enetmluo4YLozNiyNWYbJfTYIJOr3h4eXcU8vfroV1CTm7UGSR
X-Gm-Gg: AYBFou2L1RPtrjy4HkMcMp5cXO/N0+k8A7kX+KuVJCGZ77zbExqr7B9JmhWEpM+VI4N
	2rxkDXidsFb/CaNPkWSV6dqspxlHfqsg13d5lm/i3VoT/MU3UsURQY8PH7O2XwpczpT/Xc4QDMo
	mXqj0inLr1lWyZxxXI1r4uzwmsf52HyhwUAWKGDLp0RXUQRo9NmLA1ECShQonkbpg2jFATLUs77
	IhruuE8/9w9yrLKz+jZwvBBYx3cIPvAI5zO/kURD9D0tIqUHrQJIqaXF57TufM6jqQIeeXq3XLP
	w6zNe8n3wym1EKHHJtYm/hZJMrQK/S3+g5RMvfYwKXoEhNCAw55y/0xVO6TPBCY8awhhZqj5TgD
	SbIj/ly3jTfWaQR8s3IHw960aYL6hqwo7hFbeSrR6n8yJUgxukcjyx//0Oxy1jN5Nfj9wCHTKht
	jCYg1qUYtaLs9CsCcSILSNN0M=
X-Received: by 2002:a05:693c:408b:b0:377:82e:2d79 with SMTP id 5a478bee46e88-384b39896edmr3603493eec.9.1795164173215;
        Fri, 20 Nov 2026 00:42:53 -0800 (PST)
X-Received: by 2002:a05:693c:408b:b0:377:82e:2d79 with SMTP id 5a478bee46e88-384b39896edmr3603463eec.9.1795164172687;
        Fri, 20 Nov 2026 00:42:52 -0800 (PST)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm7326352eec.5.2026.11.20.00.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:42:52 -0800 (PST)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Subject: [PATCH ath-next v4 00/10] wifi: ath10k: fix recovery and WEDGED
 failure handling
Date: Fri, 20 Nov 2026 00:41:25 -0800
Message-Id: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALYHAGsC/yWMwQ6CMBAFf4Xs2U0sAgn+ivEA7Sush2K2pYEQ/
 t2qx8lk5qAIFUS6VwcpskRZQoHmUpGdhzCBxRWm+lp3xpieFXbJ0J1zww6tb503N/SeSvFWeNl
 +twcNaeaALdHzb+I6vmDTd0bn+QEBvk/feQAAAA==
X-Change-ID: 20261119-recovery-v4-de5f5df13e9f
To: Jeff Johnson <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kang Yang <kang.yang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795164171; l=4358;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=EbsyLTJcbPpWwcxoIURRe2OZYEAFI2SV7FBAuQJJT80=;
 b=avs0+hlD1YKlzy4l4tXP7p9jUGKWqgYp4LvMLHweqNRynlFeXk5SMsoY+J5QsQcKo1ronMcLu
 j+vX5FNivOlD2hm2ggpaSEgqrP4mP3ta+sSo33Lr52KLihZwS6d7Wir
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfX5ydHZZe1w5TF
 1eHNWrdGTl6GmQ51wN1uuZSY/2bchpsD5SgwqHiSvIZ9XiCfF2A9hlKm3xHE9RowHBfA/LiG1Re
 D2fTKOxXdUVLc2sOiQFCk0rICg6/Y+cvj92t07QY9N+rI7dzKQxzcctVwCWw+S9MloQmBKsAops
 4z77+MlqwX/GSNVWad+1xojP7JLFz3Ap6ft4dhi0oXz9Wc1ei8RnsdF2A7eAUtqwg6jIr0DM2hM
 HvudWMcKOIuB1ps0645VhTD8ug6H85/wt0nkxjA7/nu5aPb3x165BD24jUAGdtZ22FzVKGcrdKI
 n4pgIrb90a1YjrkUC/jLodxFGTZ5F3IZhnF2pmqcd9vrocpJd0o2SZFcFQsk8mnVHmLkd+hSQxz
 DvBjcfqJmA01VeN+RXfP40Mgne800qHEhLk2YYVtg7ThTcGSVxw1ugI9m2E0aIeZGauVZdsQetC
 p+kF6Ymnum0odq3ms6A==
X-Proofpoint-GUID: DzGbP2NSra_NK5ySPnCWQapNtyw9C5x3
X-Proofpoint-ORIG-GUID: DzGbP2NSra_NK5ySPnCWQapNtyw9C5x3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfX9YazFnbrNBRy
 gbGLNrteHGCqdOrYdJ62xK4+tkBTWa01e3ZkfoPjJ5sZI+Espkfu0Hf6B4Y9hFH3KkKLbPmSDM5
 FD1shGyAVkhlUSgJ7b4/S9zvYOeslwA=
X-Authority-Analysis: v=2.4 cv=CNy/zhrD c=1 sm=1 tr=0 ts=6b00080e cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JfrnYn6hAAAA:8 a=Kd7kRZl4A1812afGFBIA:9
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_004255_627846_D6FBB7C4 
X-CRM114-Status: GOOD (  16.57  )
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

Recovery failures can consume significant time before the
driver eventually gives up and enters ATH10K_STATE_WEDGED.

This series fixes several issues in the recovery and WEDGED
failure-handling paths, including recovery detection,
recovery time bounding, waiter release, and PCIe error
handling.

Several patches fix specific bugs and therefore carry Fixes
tags. The remaining patches address closely related issues in
the same recovery path because the fixes alone do not fully
resolve the reported failures.

Taken together, the series ensures that recovery either
succeeds or transitions to ATH10K_STATE_WEDGED within a
bounded amount of time, avoids unnecessary waits after
recovery has failed, and reduces the likelihood of watchdog
timeouts on affected platforms.

Google has reported this class of failures for an extended
period, with more than 4000 observed crashes over the last
month.

---
v4:
- patch 1: replace the blocking wait and the failure count with a
  non-blocking one-shot delayed work monitor, as suggested in review.
  (OFF state), and arm the monitor before queueing restart_work.
- patch 2 (new): shorten the recovery timeout from 20 to 10 seconds.
- patch 3, 6: adapt to the one-shot monitor, no functional change.
- patch 8: reword the commit message to match the order of the
  calls.
- patch 9: fix the function name in the commit message.
- patch 10: describe the change in skb ownership in
  ath10k_sdio_hif_stop() in the commit message.

v3:
- rebase onto the latest ath-next.
- patch 1: fold the old patch 5 ("check the recovery deadline on its own
  timeline") into this patch, so the recovery monitor is a self-rearming
  delayed work from the start; move recovery_start_jiffies to patch 4.
- patch 4: reword the commit message; recovery_start_jiffies is now
  introduced here, where it is first used.
- patch 8 (new): on SDIO, mask the target interrupts and start recovery
  when an invalid HTC bundle count is read from the lookahead, to stop
  the SDIO IRQ storm.
- patch 9 (new): reject scan requests while the device is not running.
- patch 10 (new): sdio: drop pending async writes and stop the sleep timer
  and work across power cycles, so stale requests cannot touch the bus
  after power up.

v2:
- patch 3: also wake wow.wakeup_completed, peer_stats_info_complete and
  wmi.radar_confirm on WEDGED; reinit peer_delete_done before each
  peer delete command.
- patch 5: remove the early-return time_after() branch from the monitor;
  in ath10k_reconfig_complete(), cancel the monitor with
  cancel_delayed_work_sync() before clearing fail_cont_count and
  pending_recovery.
- add SDIO Test-on tag.

To: Jeff Johnson <jjohnson@kernel.org>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>

---
Kang Yang (10):
      wifi: ath10k: fix SDIO aux workqueue starvation in recovery detection
      wifi: ath10k: shorten the recovery timeout to 10 seconds
      wifi: ath10k: wake blocked waiters when entering WEDGED state
      wifi: ath10k: also wake remaining blocked waiters
      wifi: ath10k: hard-block the radio when entering WEDGED state
      wifi: ath10k: remove now-unused driver_recovery completion
      wifi: ath10k: trigger recovery on PCIe MMIO wake-up failures
      wifi: ath10k: trigger recovery on corrupted HTC bundle lookahead
      wifi: ath10k: reject scan requests while the device is not running
      wifi: ath10k: drop async writes and sleep timer across power cycles

 drivers/net/wireless/ath/ath10k/core.c | 130 ++++++++++++++++++++-------------
 drivers/net/wireless/ath/ath10k/core.h |  13 ++--
 drivers/net/wireless/ath/ath10k/mac.c  |  25 ++++++-
 drivers/net/wireless/ath/ath10k/pci.c  |  27 +++++++
 drivers/net/wireless/ath/ath10k/sdio.c |  85 +++++++++++++++------
 drivers/net/wireless/ath/ath10k/snoc.c |   8 +-
 6 files changed, 204 insertions(+), 84 deletions(-)
---
base-commit: 1983b40acfcb3c3464b291c85977290a785bcfdc
change-id: 20261119-recovery-v4-de5f5df13e9f

Best regards,
--  
Kang Yang <kang.yang@oss.qualcomm.com>


