Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68438606A320
	for <ath10k@archiver.kernel.org>; Sat, 21 Nov 2026 14:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iwIwlgdR;
	dkim=pass (2048-bit key) header.d=yoxcu.de header.i=@yoxcu.de header.a=rsa-sha256 header.s=dkim header.b=spEedUmo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=K/Wo0R+OjnTrHGNQDSRAHLdJd0werIg4nBYa+IDEEyk=; b=iwIwlgdRbTUADn
	pP0MPl0HYqN8MYwcgMYYmIe8ix+j6aS6hzyX1KBx4BONqWLLDuxmpa0lJc4syU6KBF0zDOKjCu/zo
	w4QXpEgwwDYRv69aEqnb/h4/rRcx5LrbqI1R1zktWrfMqkR7Wq0231Hb9eoJmP3AAVZHC/xyzU74M
	Lbu29EPLnY1SgZdAyriEx3n3Zb66/We/guJ3R4sI/T/TULT5e0JuD+RC6dBI8QRYleKYL+mc51hVm
	IR0+xNKxwOr7ZAfy/5st+B7BwesoRsCRp02usP8wTWpEmB6hDVnfehuPf7EgWlgpjH2SzROfIgPh2
	NQ2RzlxzPiTFWvslmcoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUlfE-0000000HJfj-1lIq;
	Sat, 21 Nov 2026 14:02:00 +0000
Received: from morty.yoxcu.de ([194.36.144.171])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUlfC-0000000HJe7-2hL3
	for ath10k@lists.infradead.org;
	Sat, 21 Nov 2026 14:01:59 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0E5BE1D87228;
	Sat, 21 Nov 2026 15:01:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoxcu.de; s=dkim;
	t=1795269707; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=K/Wo0R+OjnTrHGNQDSRAHLdJd0werIg4nBYa+IDEEyk=;
	b=spEedUmoUZAYXL8Vos3lxelbHdCGMz2UZIAvcCacGD0UtAdTaqmPZG7vX7QSboPtXXIPg4
	+d3cbN0gB2T5OwFL9l9U6nKmKtzK4I/pieAFdpp+UYGin4MtEwHeOUWa/Jeu2/l56qiWWY
	omQY0eF7y+sVQFJK/k4ZIZZQe9qWucacnMtuPAY9oz9Ql/OUIF5+y3Aa5RoC3p0dv6JHjd
	LjAAGoSpvUY9LYgjewY/q3ZxY9z+tGR1AGwixlbFEp00HNqe1BVhDJ+Q0it3ZDP/TZZrBu
	mzpAmx+E6mkpEVVT4GhBCuorkXSehnEs/mm00T1Hz3lvTcXBqqGglb1KHYG2xQ==
From: Michael Auer <mick@yoxcu.de>
To: Jeff Johnson <jjohnson@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Michael Auer <mick@yoxcu.de>
Subject: [PATCH v2 2/2] wifi: ath10k: report WoW wakeups to the PM core
Date: Sat, 21 Nov 2026 15:01:35 +0100
Message-ID: <20261121140135.709615-3-mick@yoxcu.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261121140135.709615-1-mick@yoxcu.de>
References: <20261121140135.709615-1-mick@yoxcu.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_060158_848619_A6461B04 
X-CRM114-Status: GOOD (  13.84  )
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

Report it before completing wow.wakeup_completed. Once the resume path
continues, the system resume can finish and stop counting wakeup
events before the report.

On a OnePlus 6 the wakeup source of the WLAN device now counts WoW
wakeups, and powerdevil keeps the display off for them.

Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.2.0.c8-00050-QCAHLSWMTPLZ-1

Signed-off-by: Michael Auer <mick@yoxcu.de>
---
v2: report the wakeup before complete(), also on the parse error path

 drivers/net/wireless/ath/ath10k/wmi.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index eca6bb189577..e12fdd5aabc8 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -4665,16 +4665,23 @@ void ath10k_wmi_event_wow_wakeup_host(struct ath10k *ar, struct sk_buff *skb)
 	struct wmi_wow_ev_arg ev = {};
 	int ret;
 
-	complete(&ar->wow.wakeup_completed);
-
 	ret = ath10k_wmi_pull_wow_event(ar, skb, &ev);
 	if (ret) {
 		ath10k_warn(ar, "failed to parse wow wakeup event: %d\n", ret);
-		return;
+		goto out;
 	}
 
 	ath10k_dbg(ar, ATH10K_DBG_WMI, "wow wakeup host reason %d %s\n",
 		   ev.wake_reason, wow_reason(ev.wake_reason));
+
+	/* UNSPECIFIED: the host resumed for another reason. Report before
+	 * the completion, so the system resume cannot finish first.
+	 */
+	if (ev.wake_reason != WOW_REASON_UNSPECIFIED)
+		pm_wakeup_event(ar->dev, 0);
+
+out:
+	complete(&ar->wow.wakeup_completed);
 }
 
 void ath10k_wmi_event_dcs_interference(struct ath10k *ar, struct sk_buff *skb)
-- 
2.43.0


