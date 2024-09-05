Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60016CD4F59
	for <ath10k@archiver.kernel.org>; Thu,  5 Sep 2024 07:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SZaUZJvsdIWhS1K/dgwL2jdjDotmUTvANn02yFr4oHI=; b=NoakGoeTM3ihjQDvM7IBi1iTeU
	VhYHXab/WfsIpXRRMjvEVCPAyQLVwIum3IJ0DuRo6+QNznrBKwlZeeGG0cMHdc2bXTkShhjZPGXFz
	CZSaILJyNV8XNAS2dILLvP24opfcqmX6sYKL0qQOy3gwJwSEGipZH6St3+aoNQwXNf9k+OJEQxvVd
	GlKBevZP9pq8vw4ySNeaH3+NqUGAyxSN5niwaJaDamFLI0hGQEgm1uPuRoARBotcdr1GVTvsqU5Ln
	+hwdw06ZLpsI9U3M2v00bs9fXcyutkuAxRRfMHeDzBvFXK1/8gjQu65B2a4tXXSDgdIfDcGAHZJkR
	Dx0XzboQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm6TH-00000007HIw-1I7V;
	Thu, 05 Sep 2024 06:59:59 +0000
Received: from mxc-2-42b.seznam.cz ([2a02:598:64:8a00::1000:42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm6TE-00000007HI4-112j
	for ath10k@lists.infradead.org;
	Thu, 05 Sep 2024 06:59:58 +0000
Received: from email.seznam.cz
	by smtpc-mxc-5574d8dd45-2x2p7
	(smtpc-mxc-5574d8dd45-2x2p7 [2a02:598:64:8a00::1000:42b])
	id 53b58e10ad413cba533b0008;
	Thu, 05 Sep 2024 08:59:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cz;
	s=szn20221014; t=1725519592;
	bh=SZaUZJvsdIWhS1K/dgwL2jdjDotmUTvANn02yFr4oHI=;
	h=Received:From:To:Cc:Subject:Date:Message-Id:Mime-Version:X-Mailer:
	 Content-Type:Content-Transfer-Encoding;
	b=unmq8MsV6hn0sQ33IGEBMrpbUm5bR3FiJsFEVyqs4gb5VF1iB15po0rVkCGL8DiJu
	 wLQ+4reCpW4xlEWwVvGDxGBro9rGL0VRoqvao9+to5gcHAaV+/M8nmoYADFWVAQMIV
	 cebv4E6CVrVVR1f6rAHU1kyNN3zEQkbqX/KIMlJdO4H/yXptkOAJMT9c+8ngQzLppe
	 PtxsgcnWrazTYFa61spfVsklKQ3DdeCcIL+TmHNOyjZKvdEww5Anz4SSF32ZHgbdnE
	 SrPLVVo3vAnnzdKKOxhhrKPopiXcpTvVS+tg+LVw8+Lg5NhKJ5464Gwzl4KkaLz5K1
	 nsASGcpQQtjmw==
Received: from 215-143.ktuo.cz (215-143.ktuo.cz [82.144.143.215])
	by email.seznam.cz (szn-UNKNOWN-unknown) with HTTP;
	Thu, 05 Sep 2024 08:59:45 +0200 (CEST)
From: "Tomas Paukrt" <tomaspaukrt@email.cz>
To: <ath10k@lists.infradead.org>
Cc: <linux-wireless@vger.kernel.org>
Subject: [PATCH v2] wifi: ath10k: add USB device ID for Atheros QCA9377-7 
Date: Thu, 05 Sep 2024 08:59:45 +0200 (CEST)
Message-Id: <5Jj.Zbdh.4ausKfY}jbL.1csLRX@seznam.cz>
Mime-Version: 1.0 (szn-mime-2.1.61)
X-Mailer: szn-UNKNOWN-unknown
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_235956_452635_BE752C62 
X-CRM114-Status: UNSURE (   6.59  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Add USB device ID for modules based of Atheros QCA9377-7 chipset like
8devices BLUE bean or SparkLAN WUBQ-159ACN.

Tested-on: QCA9377 hw1.1 USB 0.0.0.111

Signed-off-by: Tomas Paukrt <tomaspaukrt@email.cz>
---
 drivers/net/wireless/ath/ath10k/usb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath10k/usb.c b/drivers/net/wireless/=
ath/ath10k/usb.c
index 3b51b7f..60441ff 100644
--- a/drivers/net/wireless/ath/ath10k/usb.c
+++ b/drivers/net/wireless/ath/ath10k/usb.c
@@ -1106,6 +1106,7 @@ static int ath10k_usb_pm_resume(struct usb_interface=
 *interface)
 
 /* table of devices that work with this driver */
 static struct usb_device_id ath10k_usb_ids[] =3D {
+	{USB_DEVICE(0x0cf3, 0x9378)}, /* Atheros QCA9377-7 */
 	{USB_DEVICE(0x13b1, 0x0042)}, /* Linksys WUSB6100M */
 	{ /* Terminating entry */ },
 };
-- 
2.7.4
 

