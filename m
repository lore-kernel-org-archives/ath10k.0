Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10EC4606A31C
	for <ath10k@archiver.kernel.org>; Thu, 12 Nov 2026 11:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qiy1OuMS;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XOzBL7PX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cBPUBUUM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=6F9MCcHdTk6Adicb/HWB4hSRVzQbjtWaswP0lnHBasc=; b=qiy1OuMS/V+uCbxCqi4WTwvty8
	iMYBt9vX6AVcbBGg5H16ACD/fse+eDcj7IiMNbC5hgLeEEnTzWa9++TqoKppbp/kcEkjBuE4s+Cwp
	BCfxb9d0om//T9nz770R/+IuKEJxYp/9+izbWy1uCur2gXrz1UUxJFZS1jy35KBXr5xDS7s9SOgaa
	mdXZVNAJkK6MN7SwGCkPr1aD97AU3TgikJRVfxaGzHC99Ig3lOJu2ED2kedvFn06XqbAC9Kz1XERA
	q/lmpWl1EhUPplUVp/i8EpQo0ZKscS5ufPsqjQae0zOyYV8ld4KtlZw+ImQ4sKC8dk5aM7On/IziQ
	uC08saQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSwz-00000009h4E-1XB6;
	Thu, 12 Nov 2026 11:26:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSwr-00000009gxK-3hWK
	for ath10k@lists.infradead.org;
	Thu, 12 Nov 2026 11:26:36 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC7oVUh2818494
	for <ath10k@lists.infradead.org>; Thu, 12 Nov 2026 11:26:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6F9MCcHdTk6Adicb/HWB4h
	SRVzQbjtWaswP0lnHBasc=; b=XOzBL7PXyu1N+xzdIoh4BKM7FnybUJJjJ3rw/G
	rWjTpRKDZCS0gMGBzDEKGTwVvqD4GCJ3kOi8UfztPm1Vrf8LL7gpZqCoHNZiIW24
	QHXPzl+RwMZnc5KiyQT1g9+lKCwnbgZT47BTdfD2htvSfj1l7no2ZqsXhYGBQQPN
	B+WMdLxkey1Oe2CL6FnpFtk5Y/yBzQsds7WWLGE6cg+IzI8s8C8vH2gI24E5JqE8
	IULo1mGQ/Mr6GWi6kmYG0zwarMGiRaqVyrEkNrJgXrnGIGaqlTeTqNPzQpJmuFA4
	d9b5GKjNexUqSCefTdjJ5++jvDN48hG/tus0hzwOarGQOQ8w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw9e18rxa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 12 Nov 2026 11:26:31 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36efb506f29so806285eec.1
        for <ath10k@lists.infradead.org>; Thu, 12 Nov 2026 03:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794482790; x=1795087590; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6F9MCcHdTk6Adicb/HWB4hSRVzQbjtWaswP0lnHBasc=;
        b=cBPUBUUM2GbEot4VWUcf0iK8grOk4CGIUnu79nSRavtyII3iHfoD9mHuLwNjwNFNLl
         6VCeho4AROFndQA0mu95Jwe6pQF2Wj7JGndzFw9ClkBpNJE4GjRUXsDtsb1QcpqUnOrP
         0S5AOyGAzvR9fCe8iDWkcwjf/5bOS0TGpwitnDIMXk10KV2+n8k5PeomnBNrLtlMnr0U
         zoz5DlQYGA5JTgSIWc5dNU19Em8YeeMzbnNWAHJdpF4kg5rYAFZ0oo11rE/WGxxUMLeP
         yvm1VWGx3DxxTDrYJsse7lxpxI7skpexEf6zqq4C4nNX9/Fdt0mgS0oH9rIjP24gHUGk
         V+dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794482790; x=1795087590;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6F9MCcHdTk6Adicb/HWB4hSRVzQbjtWaswP0lnHBasc=;
        b=gAgcjq6OLYjqEwsrK0EMgm31U9Kw6GoYqh9PxSGDg6Bs/LoCfTAmNchPpU6yXc3rWy
         ITPTTr7clX2VYpYXeBRxm065tgVbdMUi+JZa7Rjf5c1wjjd1QaEg3gcHSiqz7h0Mzf4H
         OYmwDyjFvUdY6g5NFEKjDgwPDrphYIWHvf4xcejvA1b3iaTH9/07Hm3P6t7JHml2BJRn
         t2B/disZEkdOa+qLPQAJ89f++yUVhbqvr9xZU8fCzdcDXQ2L9Tey2CyypmADYz1nns08
         kGm2I2oVWCDmzxyQDQrd0t5qLySX8aYzoJ6X2++dVpyNUVMUn/lobA1hj+iufUL+DDJu
         7Vkg==
X-Forwarded-Encrypted: i=1; AL+hErFHAcoq+sEYahqnY2uHk3CKmzePTsHbFAAXtSN+K/KaYyXxF6jsxzOVB6gV1yiPbQRGsdco7mE=@lists.infradead.org
X-Gm-Message-State: APuU4Z+6dvctuWvdvpiiS7UovaldYLTDspuRzy/AIYCcPuWDQdnOMxuA
	/X4L4F5R3XrmC0LK0uOEIMqZaG9ljQC6RUs6XkcAcBWo6KTbK2aVlCEXeapJD3hLhbLPB+HIPrK
	wc3yaLN+7O86U9IOUGbRvH4CEV5BL55hYgAwo7cIQwMe+FZK83mhUkz7FnQPiLeZm
X-Gm-Gg: AYBFou3wV2ZEVlHg3oh3zRCp6L3efbTfAIGusVnzGzEfogxiOAN9N9zsJhuivJNi5ns
	nu0Zyl5ZCgJ2Zhh8dSKwKwckze/hI8unotTyPDZ6tOUGlD9Zb+AF6hX8s/h4+RXNMqJtAoVatRR
	49O3o8CO9g8dCxhfI5M2bnh+zv/SztLnaaxAymEdQph/jmyqm3PtS7WVx85ci+GZE7B5aRdi55v
	prOTokY3x3NRG9ld0VOMwBSRcjcdSMxlADWHzqsbsvuIWiiertrxr60jZZQ6kG2aOoNRvZBI6HQ
	XM0LpeEej2zaG3YMJEDJ6X6NIJfdMg97gNfHTm3YYqILfVWU1wOxpmMLaMYUXpQA9ec+FWkAjXA
	CsljnCCUC43loerp/Y5KP52Z8vUd5C0jU0z0kkl6bsFT4JlSRQR9X7nX3Z02GHgItPZ32qMcEqK
	+yRJjHeqiZVNOOrYrM7YWAy17Q
X-Received: by 2002:a05:7301:35a4:b0:36e:9763:9268 with SMTP id 5a478bee46e88-3768676338bmr5816599eec.26.1794482790263;
        Thu, 12 Nov 2026 03:26:30 -0800 (PST)
X-Received: by 2002:a05:7301:35a4:b0:36e:9763:9268 with SMTP id 5a478bee46e88-3768676338bmr5816563eec.26.1794482789537;
        Thu, 12 Nov 2026 03:26:29 -0800 (PST)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfadsm30402359eec.19.2026.11.12.03.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:26:29 -0800 (PST)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Subject: [PATCH ath-next v3 00/10] wifi: ath10k: fix recovery and WEDGED
 failure handling
Date: Thu, 12 Nov 2026 03:25:59 -0800
Message-Id: <20261112-10k-sdio-crash-v3-0-24f03f300bb2@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEei9WoC/yWMywrCMBBFf6XctQNpCqL+irjIY2JGIZVMKoXSf
 zfq3R0u52xQrsKKy7Ch8ltU5tJhOgwI2ZU7k8TOsMYexz4azZM0ykyhOs00nb1JLtmT9RFdelV
 Osv6CV7iWqfDacPs/uvgHh/btYd8/GKVgNHwAAAA=
X-Change-ID: 20261111-10k-sdio-crash-39b0faf282bd
To: Jeff Johnson <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kang Yang <kang.yang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794482788; l=3778;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=ZHbZYE3B50xecxdqAMcGJfGNqMRR3cy4UogUp9BVJCY=;
 b=jmLNwa6bOgLqY8bI810JF8Wzvo1DAJ3DGUR7lsdhDl9g6FMjZxZnilISk9Zs+P0/RI3/UKm2h
 s0BZ8NRswzEDU8qPky9yqjDunaLDR5v6MhAueFWzRiP5yjBTuaya+tF
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0NSBTYWx0ZWRfXyBbShBy9nDm/
 hQsPOzuEk8wrMDZoVMSbaIfUMDA8sl/PA0/VwCq3xIXpCuqwrBnjbFqzXk0G0b985MBbjNZtU1U
 zcQvseyYeuGCfRvrwiX0A79gtRU55dVIBpHuLkBxYpNJpGPBLK58s5IBtxGtNHGQ2eo40MSq1dh
 JiNrENJJWNjtXhcnFdS2pwg5gHxqFPkG8CtV4NbpivkZQoI5bdN8+VJDnal1+AccZFQRsEVTwqJ
 efw9v4hIfq3Zs1K4i5KREV/eoIYp0V1bFghI3nmdyCizzF8SP/GkwNkfeqL2fxy/zBxVkfdkxYf
 z7O9PFLegbMkP/Q2y+LHSfT39JsNOxHqnQbAhbsNOh7wFT+vd8UjI2EUH5JFZgZTOSy3thbDtC+
 SA8XeRrU5X7/Nvgxlnw/A96YHS5nZ4Nz+fsHJeb0eToiRnsr2ZnajoQM75we+gK9ADBOP2Aa3ow
 EhM/Q7UjUQay0yKYCUg==
X-Proofpoint-GUID: 7hGvtQX1XxaOSFW0-TAOqfQlEwVcayqd
X-Proofpoint-ORIG-GUID: 7hGvtQX1XxaOSFW0-TAOqfQlEwVcayqd
X-Authority-Analysis: v=2.4 cv=F6fC5ahN c=1 sm=1 tr=0 ts=6af5a267 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JfrnYn6hAAAA:8 a=eKRDW-KPXn0GmfykuQcA:9
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0NSBTYWx0ZWRfX/Clp9stKAb14
 XKKQo8+JcSsGtePv8OSfbyTSCVLOYQ91Z41BHP2D6UrHCtVv7eeCKBdk0PjqYIOA9hbpitAVAYT
 aPnI78e6YxF0RdWuTMj7jNF+UM7ow4w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_032634_119833_A3601654 
X-CRM114-Status: GOOD (  13.86  )
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
      wifi: ath10k: wake blocked waiters when entering WEDGED state
      wifi: ath10k: also wake remaining blocked waiters
      wifi: ath10k: bound recovery time before entering WEDGED
      wifi: ath10k: hard-block the radio when entering WEDGED state
      wifi: ath10k: remove now-unused driver_recovery completion
      wifi: ath10k: trigger recovery on PCIe MMIO wake-up failures
      wifi: ath10k: trigger recovery on corrupted HTC bundle lookahead
      wifi: ath10k: reject scan requests while the device is not running
      wifi: ath10k: drop async writes and sleep timer across power cycles

 drivers/net/wireless/ath/ath10k/core.c | 132 +++++++++++++++++++++------------
 drivers/net/wireless/ath/ath10k/core.h |  13 +++-
 drivers/net/wireless/ath/ath10k/mac.c  |  23 +++++-
 drivers/net/wireless/ath/ath10k/pci.c  |  27 +++++++
 drivers/net/wireless/ath/ath10k/sdio.c |  85 +++++++++++++++------
 drivers/net/wireless/ath/ath10k/snoc.c |   8 +-
 6 files changed, 210 insertions(+), 78 deletions(-)
---
base-commit: ff4c7359e310744a7abe53cf66d921fa2969eb19
change-id: 20261111-10k-sdio-crash-39b0faf282bd

Best regards,
--  
Kang Yang <kang.yang@oss.qualcomm.com>


