Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A705606A32A
	for <ath10k@archiver.kernel.org>; Sat, 21 Nov 2026 14:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NpIphhyZ;
	dkim=pass (2048-bit key) header.d=yoxcu.de header.i=@yoxcu.de header.a=rsa-sha256 header.s=dkim header.b=ZFaAlwLS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=hEkF63gs4U7QMi2VnllvXbPgoLAsxJ4Dgn1yye3Nmhg=; b=NpIphhyZ+JfoB6wWi0W/FmKG6H
	v9w66PyCWVv+SQiZVItIWFhsQ39t2DCnqri3uf6Fdpn/EkOPXX/0N3PzXAINcKnHlUbAzF7dfucw3
	eN3kgt9ACSkSWPar+IHFwG8haOJlMIDsvU7YQJbxfF4Zxp5IsyxAy5fF94gaPtu1+2IXFZNALS3fH
	Jk5p7dV5lFPP0haXl8HLRs5mjSVv+tNLD9iFBMf7n/nnZ6iyZ1XPFy/GwSED6Oa9aKj9lRYAAvOgk
	AFMUOSdm+igLDBIKC0vfS4pB3vdeHIUkVtgcdBRonxK+3obj4/rVc1KAS531J+FZYRkx5Q9M8MdNk
	gNKEsalQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUlfF-0000000HJg4-2cd0;
	Sat, 21 Nov 2026 14:02:01 +0000
Received: from morty.yoxcu.de ([194.36.144.171])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUlfC-0000000HJdv-2jRV
	for ath10k@lists.infradead.org;
	Sat, 21 Nov 2026 14:02:00 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 930651D827A6;
	Sat, 21 Nov 2026 15:01:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoxcu.de; s=dkim;
	t=1795269704; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=hEkF63gs4U7QMi2VnllvXbPgoLAsxJ4Dgn1yye3Nmhg=;
	b=ZFaAlwLSl7RdIxrSsi7ZvmgZJ+Ibx4yg1CsARE3Zs5ABWTS58DvBIaN4YlheUHX0ts4qDt
	kx80B8Ha4F773xB/LaVXd3wt7psjb+lDb4Bo0IN5beZs6y4E9paNhQmJTIHRlsfIUBQ84z
	Yo35M66YomF8TKuvdpqTRP5ajhTLggBgujss3C0pUZjS/NipvCMGM7S2vJoTeHeb1WuPf4
	Gn+XUOZAtOPO0Scl+3inu1bjM4O8t7yMWILHq3GZZkmLb89n2wuNlfU1KCbj1kwxg4CSLz
	VBP7WQ2EduDVNnTu39MwC0Btj1+zzSSx4S6oW6Fu0OqRYR78OuZvRQrMhKh+mw==
From: Michael Auer <mick@yoxcu.de>
To: Jeff Johnson <jjohnson@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Michael Auer <mick@yoxcu.de>
Subject: [PATCH v2 0/2] wifi: ath10k: Fix WoW wakeups on WCN3990
Date: Sat, 21 Nov 2026 15:01:33 +0100
Message-ID: <20261121140135.709615-1-mick@yoxcu.de>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_060158_848524_3A872F6C 
X-CRM114-Status: UNSURE (   8.91  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

With WoWLAN enabled, WCN3990 firmware wakes the host on action frames
right after every WoW entry, so the system hardly stays suspended. And
when the firmware does wake the host for a real reason, user space
cannot see that it was a network wakeup.

Patch 1 sets the action frame wakeup filter that Qualcomm's own host
drivers set. Patch 2 reports WoW wakeups to the PM core.

Both are in daily use on a OnePlus 6 (sdm845) since late September,
with an sdm845-mainline 7.1-rc1 based kernel. On ath-next they were
only build tested (W=1). I could not test QCA6174 or QCA9377.
qcacld-2.0, the vendor driver for QCA6174, sends the same command, so
I expect their firmware to know it.

Tool use: the analysis, the code and the commit messages were
written with an LLM coding assistant (Claude Code). I reviewed all
of it and tested it on my phone as described above.

Changes in v2:
- Patch 2: report the wakeup before completing wow.wakeup_completed,
  so the system resume cannot finish before the report (found by the
  sashiko review of v1). Tested again on the OnePlus 6.
- Patch 1: unchanged.

v1: https://lore.kernel.org/linux-wireless/20261120202652.344435-1-mick@yoxcu.de/

Michael Auer (2):
  wifi: ath10k: configure the WoW action frame wakeup filter
  wifi: ath10k: report WoW wakeups to the PM core

 drivers/net/wireless/ath/ath10k/wmi-ops.h | 19 +++++++++
 drivers/net/wireless/ath/ath10k/wmi-tlv.c | 47 +++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi-tlv.h | 32 +++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi.c     | 17 +++++---
 drivers/net/wireless/ath/ath10k/wmi.h     | 23 +++++++++++
 drivers/net/wireless/ath/ath10k/wow.c     | 10 +++++
 6 files changed, 143 insertions(+), 5 deletions(-)


base-commit: 1983b40acfcb3c3464b291c85977290a785bcfdc
-- 
2.43.0


