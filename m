Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52B3606A6D2
	for <ath10k@archiver.kernel.org>; Fri, 20 Nov 2026 20:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Bt+XCVCW;
	dkim=pass (2048-bit key) header.d=yoxcu.de header.i=@yoxcu.de header.a=rsa-sha256 header.s=dkim header.b=EJFjrrGa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=3rZ83/i6FjK2ITPkSFGbVXrrnU5HZyyFU+bMfZ2QB8I=; b=Bt+XCVCWTWNxoStPdYoKgEKhlb
	wAbDUlHTkoTYJpAvX2J+USbWDPEhjgUfRraXcwO+3A8CxP8oDPgFolp/c5tQ8498JVHBF5lfweG1b
	Rkn4oogiObfOQWK10inhW4ljCnsfMn2We28K74J1qMGNJ/dusIP0PPL97FABjGLy3gQS2C5eTicPp
	zglLYJNEYyTMrv3eorlPlnOkszaCIzBVYv+4rtgu8dpziuXZqE/bAThtHAoKB196k6zosq3A+rP5c
	QwEBra1AnWxMI2uNSt4sKQ5SmGYTAcqeXBvHwCBZAqdWPyxBZ6wk9jkozu0e8m8fgnEnQfUUMEWS9
	s1aFjEww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUVCV-0000000GEbG-1zow;
	Fri, 20 Nov 2026 20:27:15 +0000
Received: from morty.yoxcu.de ([2a03:4000:4d:ce0:247a:4aff:fec8:b5a6])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUVCS-0000000GEZx-0Tfa
	for ath10k@lists.infradead.org;
	Fri, 20 Nov 2026 20:27:13 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 99D0F1D8717E;
	Fri, 20 Nov 2026 21:27:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoxcu.de; s=dkim;
	t=1795206422; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=3rZ83/i6FjK2ITPkSFGbVXrrnU5HZyyFU+bMfZ2QB8I=;
	b=EJFjrrGaAuvUmGu5wIKYr0pMmvLdPk5YDxksFdTQ6XkKp/MgfXWWH6CJA7eH5sjKxCckz5
	gD2Qw8KYhZSkXsJ8lOpKeEyVSuXm5At0atW8ldCvv9F6Ry1ux+i3ANsNI8/NNrJGeJAVFK
	W9z7jIuwGLnQd3xwx2u72KQAJyVHmplwJ/TFyAIb6y2replAwA+yXvl4RvQj0+aGzuCF8n
	nSe79ZqIgTm/RMUDGVbZc50m36p88HyV+NN6jfZNOGhh6mO22VRtZxVYg0L65rUwdkeMeM
	IPe90c0+lPXx/UQtwL0XMjqEanSNi/XaacYSaoEjSSeP6GIBxjDV94IUW/cRTQ==
From: Michael Auer <mick@yoxcu.de>
To: Jeff Johnson <jjohnson@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Michael Auer <mick@yoxcu.de>
Subject: [PATCH 0/2] wifi: ath10k: Fix WoW wakeups on WCN3990
Date: Fri, 20 Nov 2026 21:26:50 +0100
Message-ID: <20261120202652.344435-1-mick@yoxcu.de>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_122712_384461_D1A7D130 
X-CRM114-Status: UNSURE (   8.31  )
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

Michael Auer (2):
  wifi: ath10k: configure the WoW action frame wakeup filter
  wifi: ath10k: report WoW wakeups to the PM core

 drivers/net/wireless/ath/ath10k/wmi-ops.h | 19 +++++++++
 drivers/net/wireless/ath/ath10k/wmi-tlv.c | 47 +++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi-tlv.h | 32 +++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi.c     |  8 +++-
 drivers/net/wireless/ath/ath10k/wmi.h     | 23 +++++++++++
 drivers/net/wireless/ath/ath10k/wow.c     | 10 +++++
 6 files changed, 137 insertions(+), 2 deletions(-)


base-commit: 1983b40acfcb3c3464b291c85977290a785bcfdc
-- 
2.43.0


