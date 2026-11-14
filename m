Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BED9606A323
	for <ath10k@archiver.kernel.org>; Sat, 14 Nov 2026 09:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iHFLdXkY;
	dkim=pass (2048-bit key, unprotected) header.d=email.cz header.i=@email.cz header.a=rsa-sha256 header.s=szn1 header.b=VKv2f4mV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UH8hxzi4C8oZWJminUZ8a/ZbhQf9xoNwmkwO/tH++ak=; b=iHFLdXkYZhSOI/
	Xs1vF/5Cz4g10pHSvFoEfab40oBcCdszKgmEYw8/cqTNFlrNKcsxSDTaNaIknHH4WZUf/M4t0QcXQ
	zsq+7pyxxDdn8QcVt9UrV5ceDFP5pAriX1tqt3ozVYxNTSV5n20YiOrsvu+/0hpoTwrf7SpQbK589
	/AYAbOqC7+SY9kHyF+jIom6bIvQI/XtaMnqxHrvlzryeldOoe9J88eI5qHY38D53Sl5q2kb2pQavJ
	FXEeNv6mWwOc2fIWyyxky/vOllAqtk/GAPjl87FtEtUNaOL8mN/9g/mvy5w825SboAU6L5vWzrATB
	6Go5uER4GOeDwJndqBVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS9lD-0000000Fcu7-3hT1;
	Sat, 14 Nov 2026 09:09:23 +0000
Received: from mxd-1-a3b.seznam.cz ([2a02:598:128:8a00::1000:a3b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS9kE-0000000Fcle-2gtG
	for ath10k@lists.infradead.org;
	Sat, 14 Nov 2026 09:09:21 +0000
Received: from email.seznam.cz
	by smtpc-mxd-5f46658f7f-chpkt
	(smtpc-mxd-5f46658f7f-chpkt [2a02:598:128:8a00::1000:a3b])
	id 44752039ba81929344fbae21;
	Sat, 14 Nov 2026 10:08:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cz; s=szn1;
	t=1794647285; bh=UH8hxzi4C8oZWJminUZ8a/ZbhQf9xoNwmkwO/tH++ak=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding;
	b=VKv2f4mV3hVA/EqFuqkxH7a67DG8Qcyl5NskSx5h2tZQ8rYf6ITjAW0vIbn+rbill
	 wSfFL+v90aqb4E4k5GiMYLEXifag8BEktj71PNk1xVKiHw//PCj+UAorR91GkPT/Te
	 nU7Jg9WkRkBu//omM6uVKzanp8Lh6C7wuSIcvOsmSgBjoNfzS1Loiu/Nv5GymBG7D6
	 webYB9dsMqJsj4z0VS2kAxe0ipJCW0E1CxpZjaLM0uBEldLpIYpmM0lBeG/Xo0I1zJ
	 UqAv1UtbenfR7nWHkLT2ImZr+CUhgtBffEcbfYDhYbNVs5ATu6vikkCi+cgDjYfmZg
	 tX6GIkErLw7CQ==
Received: from localhost.localdomain (184-143.ktuo.cz [82.144.143.184])
	by smtpd-relay-5bf55fdf87-n6z6s (szn-email-smtpd/2.0.97) with ESMTPA
	id a59e3d33-0aa5-43cb-a79f-d4cde359230a;
	Sat, 14 Nov 2026 10:08:02 +0100
From: Tomas Paukrt <tomaspaukrt@email.cz>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	Tomas Paukrt <tomaspaukrt@email.cz>
Subject: [PATCH ath-next 2/6] wifi: ath10k: usb: set soft_unbind
Date: Sat, 14 Nov 2026 10:07:33 +0100
Message-ID: <20261114090737.64348-3-tomaspaukrt@email.cz>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261114090737.64348-1-tomaspaukrt@email.cz>
References: <20261114090737.64348-1-tomaspaukrt@email.cz>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_010823_448590_ED720940 
X-CRM114-Status: UNSURE (   7.27  )
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

The USB core disables the endpoints of an interface before it calls the
disconnect callback, unless the driver sets soft_unbind. ath10k still
sends WMI commands at that time, because mac80211 removes the interfaces
during the unregistration, and these commands fail when the driver is
unloaded:

  usb 1-1.1: failed to delete WMI vdev 0: -22
  usb 1-1.1: could not suspend target (-22)

Set soft_unbind to keep the endpoints enabled until the disconnect
callback returns.

Tested-on: QCA9377 hw1.1 USB 0.0.0.111
Signed-off-by: Tomas Paukrt <tomaspaukrt@email.cz>
---
 drivers/net/wireless/ath/ath10k/usb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath10k/usb.c b/drivers/net/wireless/ath/ath10k/usb.c
index 987d57a01ddf..c1ba30a1437d 100644
--- a/drivers/net/wireless/ath/ath10k/usb.c
+++ b/drivers/net/wireless/ath/ath10k/usb.c
@@ -1116,6 +1116,7 @@ static struct usb_driver ath10k_usb_driver = {
 	.disconnect = ath10k_usb_disconnect,
 	.id_table = ath10k_usb_ids,
 	.supports_autosuspend = true,
+	.soft_unbind = 1,
 	.disable_hub_initiated_lpm = 1,
 };
 
-- 
2.43.0


