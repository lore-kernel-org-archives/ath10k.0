Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A886D606A329
	for <ath10k@archiver.kernel.org>; Sat, 14 Nov 2026 09:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=V2C+zRxt;
	dkim=pass (2048-bit key, unprotected) header.d=email.cz header.i=@email.cz header.a=rsa-sha256 header.s=szn1 header.b=AIZ6h1Mo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fZDaZLg+KcaSooSb0sjq9n8CHgLN/4LKPX7p9AG8Er8=; b=V2C+zRxt2E2BRN
	rxG2OaTa2XKkfA6yGr8oS0l3AfbBTZy9NI3MiyYyuIbFipl7a/kLR824yfqk3kc3r/hqQZPZnivnK
	hAkwsDvidYlAbT68qnCbBEUHOALehItNtWtlh4su1/irgAAAO8QGUA76hMfILOJcAd/fsPSG+fTvm
	Ob/SESLDrNXa32Rya+6nxCplghnzcMDrwoQTi04i+XSF94MlgXGSpJUO6ypoc7kOFZQNs4bYPrcKk
	mlH5yyfVIJkxq0lsxkwjOY5e8/3UHWKFBRfWHzvZc/1NtnYF+FfGfzZUclmKS/ARxnJGqZwC9HFDQ
	DHxm9JuKEILaUEjdQkOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS9la-0000000FdAQ-34n8;
	Sat, 14 Nov 2026 09:09:46 +0000
Received: from mxd-2-a36.seznam.cz ([2a02:598:64:8a00::1000:a36])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS9kY-0000000Fcn1-3Bvh
	for ath10k@lists.infradead.org;
	Sat, 14 Nov 2026 09:09:44 +0000
Received: from email.seznam.cz
	by smtpc-mxd-5f46658f7f-dlhcx
	(smtpc-mxd-5f46658f7f-dlhcx [2a02:598:64:8a00::1000:a36])
	id 2759e788d9ad552227d76990;
	Sat, 14 Nov 2026 10:08:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cz; s=szn1;
	t=1794647318; bh=fZDaZLg+KcaSooSb0sjq9n8CHgLN/4LKPX7p9AG8Er8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding;
	b=AIZ6h1MocZDD7lFiEuPWD4MVKxeG7sdub5xSVvA+8Jeg2BKDVx9je6gapSf6Vkuw0
	 lgT2i1mPlZO8RbnO/aeQRxIAAR5KaDRi8JcWTWDW/be8Zw8e+OyI/1ODg2rjy5eI9J
	 ItIU6Aq6qjQhx1ObWs2s+kbhJCivKAkesQ02nbWzObKRt844LTDOskBPCGDmki52WR
	 e6wQ54bSkAzMBHsQ/L34PP6RAa/7ykdoJZeLtxfpfyIOguvLd4czVV8Q0w2/MtlUXM
	 LIBiWJtUkbs9AU00CgHj2EERMgWnxEX3iCeCA+InIW0MysiFnZJ/LxWvKdvCW3NuZZ
	 dMtcWsrz7amXA==
Received: from localhost.localdomain (184-143.ktuo.cz [82.144.143.184])
	by smtpd-relay-5bf55fdf87-n6z6s (szn-email-smtpd/2.0.97) with ESMTPA
	id f11e4f1c-c55b-4855-9539-63d0ffc76826;
	Sat, 14 Nov 2026 10:08:03 +0100
From: Tomas Paukrt <tomaspaukrt@email.cz>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	Tomas Paukrt <tomaspaukrt@email.cz>
Subject: [PATCH ath-next 5/6] wifi: ath10k: usb: add device ID for Atheros QCA9377-7
Date: Sat, 14 Nov 2026 10:07:36 +0100
Message-ID: <20261114090737.64348-6-tomaspaukrt@email.cz>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261114090737.64348-1-tomaspaukrt@email.cz>
References: <20261114090737.64348-1-tomaspaukrt@email.cz>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_010842_970178_9649F2C1 
X-CRM114-Status: UNSURE (   7.78  )
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

Add USB device ID for modules based on Atheros QCA9377-7 chipset like
8devices BLUE bean or SparkLAN WUBQ-159ACN.

Tested-on: QCA9377 hw1.1 USB 0.0.0.111
Signed-off-by: Tomas Paukrt <tomaspaukrt@email.cz>
---
 drivers/net/wireless/ath/ath10k/usb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath10k/usb.c b/drivers/net/wireless/ath/ath10k/usb.c
index 71de38111c5e..9804ea0ffacb 100644
--- a/drivers/net/wireless/ath/ath10k/usb.c
+++ b/drivers/net/wireless/ath/ath10k/usb.c
@@ -1156,6 +1156,7 @@ static int ath10k_usb_pm_resume(struct usb_interface *interface)
 
 /* table of devices that work with this driver */
 static struct usb_device_id ath10k_usb_ids[] = {
+	{USB_DEVICE(0x0cf3, 0x9378)}, /* Atheros QCA9377-7 */
 	{USB_DEVICE(0x13b1, 0x0042)}, /* Linksys WUSB6100M */
 	{ /* Terminating entry */ },
 };
-- 
2.43.0


