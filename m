Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FB6606A6E2
	for <ath10k@archiver.kernel.org>; Fri, 20 Nov 2026 20:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zquuQmL1;
	dkim=pass (2048-bit key) header.d=yoxcu.de header.i=@yoxcu.de header.a=rsa-sha256 header.s=dkim header.b=fiIOmlyt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ygmN3r0WEeLX6DGtC69ZpzRGLxQA3t62Ryb7M9rweoY=; b=zquuQmL1B3WV3I
	DaYDUpV9SSDNUnJcVJOoUu/0dov+Fhq8LzG5HwCbWHCb3FFKD/JFUfqp6aY8PTJTUXFlRSwr7R7l5
	yk/FD5PVmGwTV4m6j+k72TdF7Of8Dq5zB9dhp3SizXA4+BztYTdRuqUC5fLMMg0Z84mI7JXpkINRT
	ZBjzaiMsl6aKc4m938Hx8dwPvMG84kJWaSEWihWJXj6zKmp0PdS2bBmUuTSLTcVOv0dlQD6HQ9LM5
	m9fLnw/usU8XfQ5WR2keOqo6IITB4bpqATgTPL06slql/G60EYDQUdTm9GOC7s++f9rHHAnSjdT7z
	qzl2P0FOoTqVuDQxeAIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUVCV-0000000GEbX-2YMT;
	Fri, 20 Nov 2026 20:27:15 +0000
Received: from morty.yoxcu.de ([194.36.144.171])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUVCS-0000000GEaE-2RHS
	for ath10k@lists.infradead.org;
	Fri, 20 Nov 2026 20:27:14 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DC5071D87186;
	Fri, 20 Nov 2026 21:27:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoxcu.de; s=dkim;
	t=1795206428; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=ygmN3r0WEeLX6DGtC69ZpzRGLxQA3t62Ryb7M9rweoY=;
	b=fiIOmlytp4O/9z7iUBl1WaxyrWzOwxHoVeDJvu2eJdRMuhgTGXO09Jfn5w6Apq9d7Drm6s
	pRYNV5A7vhESFzmF8rvCXszPDbjK92H7hxBQuWwso5qW8hPf5tid3NoqO1C2rvdpWHHtGc
	QiyJYVot+fUXwQJ2vFMsrvBhR1N/FK7Nm8FP3mg9obbMgZIwUU15TsneYhtDrglW2KrG/J
	GlPbSINeufRUvi8HZsK2rW8JTV+MZd8UfskdGMqxUYqR8WgGHp8uJWWwfdPEpCRPcDBb1v
	J1Nfs5Wq66IMe8486bDTaQ+DRPVcAmYjNW1WAOsr141Be013PI3Ok3hahWyLmg==
From: Michael Auer <mick@yoxcu.de>
To: Jeff Johnson <jjohnson@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Michael Auer <mick@yoxcu.de>
Subject: [PATCH 2/2] wifi: ath10k: report WoW wakeups to the PM core
Date: Fri, 20 Nov 2026 21:26:52 +0100
Message-ID: <20261120202652.344435-3-mick@yoxcu.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261120202652.344435-1-mick@yoxcu.de>
References: <20261120202652.344435-1-mick@yoxcu.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_122712_901288_B4964E13 
X-CRM114-Status: GOOD (  11.07  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ath10k does not report a WoW wakeup to the PM core, so the wakeup
source of the device never counts it, and user space cannot tell a
network wakeup from other resumes. Plasma's powerdevil, for example,
checks the wakeup_count of each wakeup source after resume. It keeps
the display off after a network wakeup and turns it on otherwise.

Call pm_wakeup_event() when the firmware reports a wake reason other
than WOW_REASON_UNSPECIFIED, which it uses when the host resumed for
another reason. iwlwifi does the same since commit 06ae2ad413d2
("iwlwifi: mvm: report wakeup for wowlan").

On a OnePlus 6 the wakeup source of the WLAN device now counts WoW
wakeups, and powerdevil keeps the display off for them.

Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.2.0.c8-00050-QCAHLSWMTPLZ-1

Signed-off-by: Michael Auer <mick@yoxcu.de>
---
 drivers/net/wireless/ath/ath10k/wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index eca6bb189577..c171cd96ac6f 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -4675,6 +4675,10 @@ void ath10k_wmi_event_wow_wakeup_host(struct ath10k *ar, struct sk_buff *skb)
 
 	ath10k_dbg(ar, ATH10K_DBG_WMI, "wow wakeup host reason %d %s\n",
 		   ev.wake_reason, wow_reason(ev.wake_reason));
+
+	/* UNSPECIFIED: the host resumed for another reason */
+	if (ev.wake_reason != WOW_REASON_UNSPECIFIED)
+		pm_wakeup_event(ar->dev, 0);
 }
 
 void ath10k_wmi_event_dcs_interference(struct ath10k *ar, struct sk_buff *skb)
-- 
2.43.0


