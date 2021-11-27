Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4F0FC433F5
	for <ath10k@archiver.kernel.org>; Sat, 27 Nov 2021 08:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:From:To:MIME-Version:Date:Message-ID:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UaOGtCKAJLW6YWJMj9qD7kKuGbt2/aqsIdb89z0CEvE=; b=qriJZ79T6Wh948
	DEv/7xSCpKws6po8DggHVwCktazwooGgLxkoYGnhEFL+M7bzugjnrfEf6ciI7zFHJ/P5Xc7mM0Y3A
	NDr3U/8jdtYHYtkKkgxQZOw9ttDuSMtaYSEygyGcyzI7l4SJvc68CKUDzlV4AK8NkohbSc7XwYZHF
	OVhz2vNhHjZyIomDcPNMFR/JgKlJ8orR+gw2Du8XPSW6Ug8FX3c+BZLWcBRdlE/G4gEK5MEsZTr2w
	sbzA6B45gszWWHbHZZG279uSYchRxQKa4iSAeMpS6XlNx1B4PFgv9LujypI6pK01JoSEafoGRV0EZ
	dGWjA9i/3v1GD7ljN9Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqstO-00DCG9-T0; Sat, 27 Nov 2021 08:17:06 +0000
Received: from midgard.reox.at ([176.9.78.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqstL-00DCFn-89
 for ath10k@lists.infradead.org; Sat, 27 Nov 2021 08:17:04 +0000
Received: from 127.0.0.1 (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by midgard.reox.at (Postfix) with ESMTPSA id 713611200E8
 for <ath10k@lists.infradead.org>; Sat, 27 Nov 2021 09:17:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=reox.at; s=mail;
 t=1638001020; bh=kW/lb1TqvuCjign1NQSKMP9UokGJoxEctgkNXaGL294=;
 h=Date:To:From:Subject:From;
 b=iJdMc/4zxV4Lrqbgl8Y5p5EYrQfEwu3jZYTm0DvajlBlQV8EMfxux8vRhYV5jZT2f
 4Bs4c0vl7BpFSAjujcBt8xvyWCcvsgGqfiuL8SD4qRLDSxhOEOoDFX5gtTuVKoTsa6
 h5jp7QrRlYyDUDpEe96lV1/CJHIdcO2Ok19hX0n8lW2FDjf/mNEoWys7d3oWFLD9uM
 /lm92ZO7ja5qQCjMS75Px5DYyWdSm5lJbkepcpavD9PD9ronoye+VXGcfk975zpFuW
 6GEbRQJEWEdLoY7ndgqf9BhFloHwUtQJvORPK6NkgISvoUdtxxh9O3RRyHZljTMiCH
 afsbMPT3Kn8NA==
Message-ID: <1c160dfb-6ccc-b4d6-76f6-4364e0adb6dd@reox.at>
Date: Sat, 27 Nov 2021 09:17:00 +0100
MIME-Version: 1.0
To: ath10k@lists.infradead.org
Content-Language: en-GB
From: Sebastian Bachmann <hello@reox.at>
Subject: Compex WLE200NX: regdomain sanitized regression
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211127_001703_498719_784A5F22 
X-CRM114-Status: UNSURE (   8.98  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Hello,

I recently upgraded my Debian based AP from buster to bullseye, just to 
find out that hostapd does not work any more, because all 5GHz channels 
are marked as No-IR. This regression was already discussed on this ML 
here: https://www.mail-archive.com/ath10k@lists.infradead.org/msg12018.html
and there is also an entry in Debian's bug tracker for the same issue: 
https://bugs.debian.org/959821

I have a slightly different card (branded Compex WLE200NX):
04:00.0 Network controller: Qualcomm Atheros AR928X Wireless Network 
Adapter (PCI-Express) (rev 01)
         Subsystem: Qualcomm Atheros AR928X Wireless Network Adapter 
(PCI-Express)
         Kernel driver in use: ath9k
         Kernel modules: ath9k

But as you can see, also the EEPROM gets sanitized:
[   15.461755] ath9k 0000:04:00.0: enabling device (0000 -> 0002)
[   15.911600] ath: EEPROM regdomain sanitized
[   15.911612] ath: EEPROM regdomain: 0x64
[   15.911615] ath: EEPROM indicates we should expect a direct regpair map
[   15.911625] ath: Country alpha2 being used: 00
[   15.911628] ath: Regpair used: 0x64

I read in the other thread, that this is a regression, but the actual 
commit causing it was never reverted.
I tried to search for newer messages explaining the issue, however as 
far as I can tell, the thread ends in June 2020 with no solution available.

Therefore, I kindly want to ask if there is any workaround available to 
re-enable 5GHz channels in AP mode for my card? (expect sticking to a 
pre-5.6 kernel or manually patching and recompiling ath)

Best,
Sebastian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
