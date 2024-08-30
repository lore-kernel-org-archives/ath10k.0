Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB39CA0EFC
	for <ath10k@archiver.kernel.org>; Fri, 30 Aug 2024 11:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KUov3Z81Hs56a02WNzMi3BbAn9lhj4cQzXERbDFkdc4=; b=HIThHbuYfZSrGtC0frLkPoDaj2
	UTvL96M2foRDEr5MmqzYV+8kbDsu5zgBJwb+SaFZbIg+JYVabsE2T5JeS/9eXOSiobrx7wfv6D0mv
	m35OcHNBMOGIz23gc9zqgi6bpue7zLhO7n/rp+fKBSYdZUP6sWJp7o+igj9a0enOiNLJcqytCoS/T
	RiRUjTT6AtRFk6wJJ0WlRfwtIVxCaxu1QD6nfArm5gL4HWItvsFKMR+A1VYN4dg9JMsjUpKSzmAl5
	mHziWz8aBvISjUn9EblqVx599y7Ki4bVih48j+R4VT8d17Oi6qJwi9pENqQp+cNUYjTJy3R6d6ya/
	Z7p14Apg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjznw-000000063Ql-1OTi;
	Fri, 30 Aug 2024 11:28:36 +0000
Received: from mxe-2-ad2.seznam.cz ([2a02:598:64:8a00::1000:ad2])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjznr-000000063Iq-3hXW
	for ath10k@lists.infradead.org;
	Fri, 30 Aug 2024 11:28:34 +0000
Received: from email.seznam.cz
	by smtpc-mxe-7df5484c66-k4bzx
	(smtpc-mxe-7df5484c66-k4bzx [2a02:598:64:8a00::1000:ad2])
	id 05a5539dfb51e137052bdd85;
	Fri, 30 Aug 2024 13:28:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cz;
	s=szn20221014; t=1725017298;
	bh=KUov3Z81Hs56a02WNzMi3BbAn9lhj4cQzXERbDFkdc4=;
	h=Received:From:To:Cc:Subject:Date:Message-Id:Mime-Version:X-Mailer:
	 Content-Type:Content-Transfer-Encoding;
	b=mVtE4AtgV9G/Bcam8tvnY2xAOOqbLp0Y06zE0Vfg1Gtn+GNxr1jLcsR6nThl98PgC
	 nM4aI14bUWtXmai+AMsbvvCh473t2PASB0Xr6EsxPfSvL7y/FCocXcEqU/f7UOaNf0
	 9qbplS9Jxbw4ZG7XQbXwQ58qa+V6/4F4tHW8Xzd7y+XRpz+MFvdyqtGj1ieBUsmHzZ
	 SZBAmDDDCLAe506i954oCkzEKQRQwSb+6WGa9+uEKKhDOL1CQJieanDM9GPrTrddF0
	 t4J2kInEk3ocLBL2MJKnbOEGe8aXVUW+q4mlLB6TiBL2RIVNDJiFBGxSenBdFjyMU1
	 McjUV2tH83UIw==
Received: from 215-143.ktuo.cz (215-143.ktuo.cz [82.144.143.215])
	by email.seznam.cz (szn-UNKNOWN-unknown) with HTTP;
	Fri, 30 Aug 2024 13:28:15 +0200 (CEST)
From: "Tomas Paukrt" <tomaspaukrt@email.cz>
To: <ath10k@lists.infradead.org>
Cc: <linux-wireless@vger.kernel.org>
Subject: [PATCH] wifi: ath10k: add USB device ID for Atheros QCA9377-7 
Date: Fri, 30 Aug 2024 13:28:15 +0200 (CEST)
Message-Id: <22t.ZbsX.5bWREDtSGGB.1cqQpF@seznam.cz>
Mime-Version: 1.0 (szn-mime-2.1.61)
X-Mailer: szn-UNKNOWN-unknown
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_042832_677892_70A87099 
X-CRM114-Status: UNSURE (   6.51  )
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

Add USB device ID for modules based on Atheros QCA9377-7 chipset like
8devices BLUE bean or SparkLAN WUBQ-159ACN.

Tested-on: QCA9377 hw1.1 USB
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
 

