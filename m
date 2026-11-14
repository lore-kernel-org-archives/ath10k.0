Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D3C606A32E
	for <ath10k@archiver.kernel.org>; Sat, 14 Nov 2026 09:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BJAMfQUA;
	dkim=pass (2048-bit key, unprotected) header.d=email.cz header.i=@email.cz header.a=rsa-sha256 header.s=szn1 header.b=xE26i8pv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=anje5GejJtLtZ1LMkkzc7qlhnpiQcRzBHHKiUI0vF2Q=; b=BJAMfQUABLSZUh
	euHdz1dTsnfMY7hTRkrgIh+82kRx/oZ9RUMsNCU0sE5W40l9JTvnTi6oEP4KSdL7h3HW46+iQVlv8
	3xe1euyBmVMauwlFUt5nGio6Fo92CR/8hUmBFKN5l96GxHXbmVgOz+qAsuC95KhE8/ek8np2OTnue
	fQ8VVllZemmwTsveeCXz4VjMfHe9wrBoYQsyREOxesBFcsD6lrpbrGo7E2FMZKy6tkA4QAk6h9pTh
	5GGhkOPO4xQmdzdJY6trtD2OhYSBKLI2NzYeDpOo4KOvREYh2zE1TP0DK3mzvattqP7LT1VcDhQMn
	mY49vpCyRLVOySCgTtUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS9lD-0000000Fctq-31xj;
	Sat, 14 Nov 2026 09:09:23 +0000
Received: from mxd-1-a3b.seznam.cz ([2a02:598:128:8a00::1000:a3b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS9kS-0000000Fcmm-1yAu
	for ath10k@lists.infradead.org;
	Sat, 14 Nov 2026 09:09:21 +0000
Received: from email.seznam.cz
	by smtpc-mxd-5f46658f7f-chpkt
	(smtpc-mxd-5f46658f7f-chpkt [2a02:598:128:8a00::1000:a3b])
	id 10f87fa5ee0ccd0f1076f1bd;
	Sat, 14 Nov 2026 10:08:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cz; s=szn1;
	t=1794647311; bh=anje5GejJtLtZ1LMkkzc7qlhnpiQcRzBHHKiUI0vF2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding;
	b=xE26i8pv82TFGDN8R1lbXP0YnH15bbpbAfOu+PhXWz85wWTG2KThXlF0Yc7CeHv9b
	 Pw04wY0a3Kd8tbz0BuekyTy4IvVPueYTqOcxbHpsq56xGYua9k0RoUchDm9TgtjC5g
	 c9/A2tmmBKG8wSMzXckDyvcJjYufzY1wE3+njqGb4qHA8sNTxMS0nDB1rfS7JiC++L
	 j6m+7RxfMpDhdxw6VWZXYRboMWbCbZnt5sX1GjOZUybpZztiQmKsZzQGdA2jSC5Zi8
	 a5mRKaGuuO6JuS66dGdOgS0DS44l9pcC+io7mipUPJ1tYG+M8wTCMO035wkSrqKIPO
	 kNoJWSpCr3w0g==
Received: from localhost.localdomain (184-143.ktuo.cz [82.144.143.184])
	by smtpd-relay-5bf55fdf87-n6z6s (szn-email-smtpd/2.0.97) with ESMTPA
	id d343ba92-2c4a-413e-8de5-ff77269ccd45;
	Sat, 14 Nov 2026 10:08:02 +0100
From: Tomas Paukrt <tomaspaukrt@email.cz>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	Tomas Paukrt <tomaspaukrt@email.cz>
Subject: [PATCH ath-next 1/6] wifi: ath10k: usb: fix group key installation
Date: Sat, 14 Nov 2026 10:07:32 +0100
Message-ID: <20261114090737.64348-2-tomaspaukrt@email.cz>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261114090737.64348-1-tomaspaukrt@email.cz>
References: <20261114090737.64348-1-tomaspaukrt@email.cz>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_010836_659490_432E7BD7 
X-CRM114-Status: UNSURE (   8.15  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ath10k_install_key() waits for install_key_done, which is completed by
the HTT security indication. The firmware of QCA9377 USB devices sends
this indication for pairwise keys only, so the installation of a group
key times out after 3 seconds and a station cannot connect to a
protected network:

  usb 1-1.1: failed to install key for vdev 0 peer c4:93:00:3b:6c:f9: -110
  wlan0: failed to set key (2, ff:ff:ff:ff:ff:ff) to hardware (-110)

The firmware does send WMI_VDEV_INSTALL_KEY_COMPLETE_EVENTID for every
key, so complete the key installation on this event for USB devices.
The other buses are not changed.

Tested-on: QCA9377 hw1.1 USB 0.0.0.111
Signed-off-by: Tomas Paukrt <tomaspaukrt@email.cz>
---
 drivers/net/wireless/ath/ath10k/wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index e57588c19c80..7d43a23017aa 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -5339,6 +5339,10 @@ void ath10k_wmi_event_vdev_install_key_complete(struct ath10k *ar,
 						struct sk_buff *skb)
 {
 	ath10k_dbg(ar, ATH10K_DBG_WMI, "WMI_VDEV_INSTALL_KEY_COMPLETE_EVENTID\n");
+
+	/* the USB firmware sends no HTT security indication for group keys */
+	if (ar->hif.bus == ATH10K_BUS_USB)
+		complete(&ar->install_key_done);
 }
 
 void ath10k_wmi_event_inst_rssi_stats(struct ath10k *ar, struct sk_buff *skb)
-- 
2.43.0


