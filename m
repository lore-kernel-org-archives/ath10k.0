Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B480D606A32D
	for <ath10k@archiver.kernel.org>; Sat, 14 Nov 2026 09:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zlexFJE1;
	dkim=pass (2048-bit key, unprotected) header.d=email.cz header.i=@email.cz header.a=rsa-sha256 header.s=szn1 header.b=S+k7IcPu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Fc1AMHFjZdJOsY6HvXjnpsl4FGY8JOTpErhRwf0EaXY=; b=zlexFJE1gV31qOoeyWLjRbZ+Bu
	QH0LieSjyxVaXD8TGXppyouUSUWSuKMrUhy6OTcoYT49SWpoSj1sXGKcN71dbv8gYuBJmTQu3YWjC
	9LDWBykxA1cXDm3SaUN/OTzdMK8LBbYHMwmqGKKF9bb7KdqanPU58huWBzgtoHDh8KW9iBOHEKAeY
	7A8STNQ730f3PajVpuJEoM4uGvanQ2zhZzS5grvbwXHH/Qv5lbF/wTgJjw6Jvb1gAdKInbxM7tcMn
	a4h9BLHd0TrgMmcr36ogELAXZbpl+fgUYAAJLhRVX9Pp9ja4DMTSPe34qftVCV2S0FLMSCcRfoAHK
	6Xu9yjgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS9lB-0000000FcsS-2Omu;
	Sat, 14 Nov 2026 09:09:21 +0000
Received: from mxd-2-a36.seznam.cz ([2a02:598:64:8a00::1000:a36])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS9kE-0000000Fclc-3RLU
	for ath10k@lists.infradead.org;
	Sat, 14 Nov 2026 09:09:19 +0000
Received: from email.seznam.cz
	by smtpc-mxd-5f46658f7f-dlhcx
	(smtpc-mxd-5f46658f7f-dlhcx [2a02:598:64:8a00::1000:a36])
	id 739ceef58d685c5f731260ed;
	Sat, 14 Nov 2026 10:08:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cz; s=szn1;
	t=1794647290; bh=Fc1AMHFjZdJOsY6HvXjnpsl4FGY8JOTpErhRwf0EaXY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding;
	b=S+k7IcPuNUB9+a39pQvvkqsBSy85gB1SvnUcLSHqOJz2FUUjvhRqY7ipSvAYpigID
	 9bzGkrGnaqEfhqsooWXoLW3BTOGv4dRwX87PLFS2DSapXp+kxkoOMiO/wmSfLBGrcy
	 ixSjVnL02xnvyZ226MrRReOxtFafn/DQQZDlYMJ+K4sH4WSrkLYQTEYC4BvAyiXikR
	 NeHnbJlbtl9ql1b7JMKjjZang90bLUUuV8qzkS2MflHdd9Sby6Mox4keA/08R+uOLR
	 u1Y+8x74tybR8s4+OHQoS7kSzeVWSPbXE+h1FCWxqPR0V2P/0t7zubB+aEZZOu7qIr
	 yETwjSTgnOCag==
Received: from localhost.localdomain (184-143.ktuo.cz [82.144.143.184])
	by smtpd-relay-5bf55fdf87-n6z6s (szn-email-smtpd/2.0.97) with ESMTPA
	id a5e4434c-3865-4159-b907-7de5041a54e6;
	Sat, 14 Nov 2026 10:08:02 +0100
From: Tomas Paukrt <tomaspaukrt@email.cz>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	Tomas Paukrt <tomaspaukrt@email.cz>
Subject: [PATCH ath-next 0/6] wifi: ath10k: make USB support work for QCA9377
Date: Sat, 14 Nov 2026 10:07:31 +0100
Message-ID: <20261114090737.64348-1-tomaspaukrt@email.cz>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_010823_457997_C5FAC033 
X-CRM114-Status: GOOD (  11.30  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The ath10k USB support has been marked as experimental and incomplete
since it was added. This series makes it work for modules based on the
Atheros QCA9377-7 chipset like 8devices Blue Bean or SparkLAN
WUBQ-159ACN.

The main obstacle is that the firmware of a QCA9377 USB target can be
started only once. It does not accept BMI commands while running, and
the only way back to the boot loader is a cold reset, which makes the
target leave the bus and enumerate again as a new device. Patch 3 keeps
the firmware started during the registration running until the device
is unregistered and resets the target instead of restarting the
firmware in place.

Patches 1 and 2 fix a timeout during the installation of group keys and
WMI command failures during the driver unload. They do not depend on
the rest of the series.

Patches 4 and 5 add the hw_params and the USB device ID for QCA9377-7
and patch 6 removes the experimental status.

Tested on QCA9377 hw1.1 USB with the firmware version 0.0.0.111.

Tomas Paukrt (6):
  wifi: ath10k: usb: fix group key installation
  wifi: ath10k: usb: set soft_unbind
  wifi: ath10k: usb: start the firmware only once
  wifi: ath10k: usb: add hw_params for Atheros QCA9377-7
  wifi: ath10k: usb: add device ID for Atheros QCA9377-7
  wifi: ath10k: usb: remove the experimental status

 drivers/net/wireless/ath/ath10k/Kconfig    |  5 +-
 drivers/net/wireless/ath/ath10k/core.c     | 77 +++++++++++++++++++++-
 drivers/net/wireless/ath/ath10k/core.h     |  5 ++
 drivers/net/wireless/ath/ath10k/hw.h       |  1 +
 drivers/net/wireless/ath/ath10k/mac.c      | 12 +++-
 drivers/net/wireless/ath/ath10k/testmode.c |  6 ++
 drivers/net/wireless/ath/ath10k/usb.c      | 60 ++++++++++++++++-
 drivers/net/wireless/ath/ath10k/usb.h      |  1 +
 drivers/net/wireless/ath/ath10k/wmi.c      |  4 ++
 9 files changed, 161 insertions(+), 10 deletions(-)


base-commit: 5dbf2415ca9821a611d09308e3b29d2c37e7cd77
-- 
2.43.0


