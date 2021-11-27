Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99200C433FE
	for <ath10k@archiver.kernel.org>; Sat, 27 Nov 2021 12:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oUFsMWXyE6T79DoJVk8Abwql3y1cVcO43R8vtjrZZYk=; b=b4uoukSue+aIzja3ClcxXf5+0W
	XQvbh4BLnAXPyJWxWTx5UyBeOUt/NDjZ7ZwMJV2coIv/k6yMKNNsd25nN8FyLc7tJjEdevsw7Rkyw
	LEBHYrqsyIZrjf0YI1VGLqXj0Ors35qwxpY+MSAqWddkp9wG4X/Osv+0lX7o7yCuEXmSuf2l/HUjA
	qWLXccg8vqyPUrPviooVFP8lbNvXWRi31Fldg94DyJSXnojuYJXIHOsRQdXDOTTlU4RKH6ihDKXPP
	xBGpqlgqQTELZ+5ztxrp1HwkjhrLhteRp9XHs5GsgmeCVqfE9giyH5U7zjMDWuTGdEHcBLR+oNCs0
	ZIqz7Bxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqwi3-00DbAM-PQ; Sat, 27 Nov 2021 12:21:39 +0000
Received: from nectar.eq.uc.pt ([193.137.214.3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqwi0-00Db95-Ss
 for ath10k@lists.infradead.org; Sat, 27 Nov 2021 12:21:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=eq.uc.pt;
 s=20171223; h=Message-ID:Subject:Cc:To:From:Date:Sender;
 bh=ow6cYMhi8IBwitguQHkwOzZCruraGwi7f7TKLVTb14s=; b=r2oVeZqMJt4a/dQEuKBqpUYtUQ
 aykI5fmPdwoAFP6eBYPLhl9/JmTh95OnR1vJY40R0XgQenbPNbSwggrhx/seGHgr1dCKcvoKnno+l
 cIgejemVFLM7j6nedgGG9OURJPsg+I58K2dj/91YC1+3Z9LCBEubo3da7cZdCl1z+yKvDe7zJlzkw
 VJA5UKvjYDhtmCbzUx1MOA4pV6ccXdFtsQ99ujCtLF2Po4WTtaTLFlFaBz1Sp5G9Ldru3mEbnBnvk
 0Q8oJblAnBYVGxWawd0yuiLp4EJcZ6lbbIv3me0Bz8niYUq1VmHrhUuBrxkSlHwMvSdv097ocOd4y
 76g29edQ==;
Received: from neo.eq.uc.pt ([193.137.214.155] helo=neo)
 by nectar.eq.uc.pt with esmtp (Exim 4.95)
 (envelope-from <nuno@eq.uc.pt>) id 1mqwhr-005SM6-9E;
 Sat, 27 Nov 2021 12:21:30 +0000
Received: from nuno by neo with local (Exim 4.95)
 (envelope-from <nuno@eq.uc.pt>) id 1mqwhr-004uOW-6b;
 Sat, 27 Nov 2021 12:21:27 +0000
Date: Sat, 27 Nov 2021 12:21:27 +0000
From: Nuno Oliveira <nuno@eq.uc.pt>
To: Sebastian Bachmann <hello@reox.at>
Cc: ath10k@lists.infradead.org
Subject: Re: Compex WLE200NX: regdomain sanitized regression
Message-ID: <YaIix40KaVlxT+XG@eq.uc.pt>
References: <1c160dfb-6ccc-b4d6-76f6-4364e0adb6dd@reox.at>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="tSDT8z2FPdWib1tf"
Content-Disposition: inline
In-Reply-To: <1c160dfb-6ccc-b4d6-76f6-4364e0adb6dd@reox.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211127_042137_122762_844C79FF 
X-CRM114-Status: GOOD (  18.40  )
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


--tSDT8z2FPdWib1tf
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline

Hi Sebastian,

* Sebastian Bachmann <hello@reox.at> [2021-11-27 08:17]:
>Hello,
>
>I recently upgraded my Debian based AP from buster to bullseye, just 
>to find out that hostapd does not work any more, because all 5GHz 
>channels are marked as No-IR. This regression was already discussed on 
>this ML here: 
>https://www.mail-archive.com/ath10k@lists.infradead.org/msg12018.html
>and there is also an entry in Debian's bug tracker for the same issue: 
>https://bugs.debian.org/959821
>
>I have a slightly different card (branded Compex WLE200NX):
>04:00.0 Network controller: Qualcomm Atheros AR928X Wireless Network 
>Adapter (PCI-Express) (rev 01)
>        Subsystem: Qualcomm Atheros AR928X Wireless Network Adapter 
>(PCI-Express)
>        Kernel driver in use: ath9k
>        Kernel modules: ath9k
>
>But as you can see, also the EEPROM gets sanitized:
>[   15.461755] ath9k 0000:04:00.0: enabling device (0000 -> 0002)
>[   15.911600] ath: EEPROM regdomain sanitized
>[   15.911612] ath: EEPROM regdomain: 0x64
>[   15.911615] ath: EEPROM indicates we should expect a direct regpair map
>[   15.911625] ath: Country alpha2 being used: 00
>[   15.911628] ath: Regpair used: 0x64
>
>I read in the other thread, that this is a regression, but the actual 
>commit causing it was never reverted.
>I tried to search for newer messages explaining the issue, however as 
>far as I can tell, the thread ends in June 2020 with no solution 
>available.
>
>Therefore, I kindly want to ask if there is any workaround available 
>to re-enable 5GHz channels in AP mode for my card? (expect sticking to 
>a pre-5.6 kernel or manually patching and recompiling ath)

After June 2020 there were other users also affected by this change (see 
e.g., 
https://lists.infradead.org/pipermail/ath10k/2021-August/012802.html).
Users were complaining that this change was too restrictive since it 
meant that the intersection of restrictions for regdomains 0x00, 0x64,
US, and their local domain, together with a cumulative mode of applying 
these constraints meant that, in practice, they would not be able to use 
their world domain cards anymore as APs in the 5GHz band, for certain 
regdomains where they were located.

And several people pinpointed the exact source changes responsible for 
this. In my case, I ended up applying the attached patch, that just 
loads the parameters for the regdomain that I'm interested in 
(CTRY_PORTUGAL). I'm not in the US; and I care for their regulatory 
restrictions as much as they are interested in mine.

So I think that you might be able to use the attached changes, with the 
specific CTRY_xxx parameter suitable for your case. And then recompile 
the respective Debian kernel package, which takes a lot of CPU if you 
just recompile the whole package. Let me know if you need instructions.

A more robust option would be to go the OpenWRT way, and use their 
patches to make this country selection a parameter for the kernel 
module. This way, you would just reload the kernel module to change to a 
new regdomain, subject to the restrictions of your hardware / firmware. 
I have not looked into that. Please let me know if you isolate these 
patches.

In any case it seems difficult to escape a kernel recompile, due to this 
small, entirely legitimate, yet remarkable decision by the driver 
maintainers.

Regards,

Nuno.

--tSDT8z2FPdWib1tf
Content-Type: text/x-diff; charset=utf-8
Content-Disposition: attachment; filename="ath-regd.c.patch"

--- linux-5.10.46/drivers/net/wireless/ath/regd.c.orig	2021-08-24 12:53:00.720758279 +0100
+++ linux-5.10.46/drivers/net/wireless/ath/regd.c	2021-08-24 12:54:10.524567276 +0100
@@ -675,8 +675,8 @@
 {
 	if (reg->current_rd != COUNTRY_ERD_FLAG && reg->current_rd != 0)
 		return;
-	printk(KERN_DEBUG "ath: EEPROM regdomain sanitized\n");
-	reg->current_rd = 0x64;
+	/* printk(KERN_DEBUG "ath: EEPROM regdomain sanitized\n");
+	reg->current_rd = 0x64; */
 }
 
 static int __ath_regd_init(struct ath_regulatory *reg)
@@ -703,7 +703,7 @@
 	    regdmn == CTRY_DEFAULT) {
 		printk(KERN_DEBUG "ath: EEPROM indicates default "
 		       "country code should be used\n");
-		reg->country_code = CTRY_UNITED_STATES;
+		reg->country_code = CTRY_PORTUGAL;
 	}
 
 	if (reg->country_code == CTRY_DEFAULT) {

--tSDT8z2FPdWib1tf
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--tSDT8z2FPdWib1tf--

