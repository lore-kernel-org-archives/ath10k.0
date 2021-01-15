Return-Path: <SRS0=JAVW=GS=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 278EEC433DB
	for <ath10k@archiver.kernel.org>; Fri, 15 Jan 2021 09:19:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9578221F7
	for <ath10k@archiver.kernel.org>; Fri, 15 Jan 2021 09:19:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9578221F7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=openmail.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=e9rRgHKmAOm9xskTfjSyOxVpASZhswoviIOC5xjJvpQ=; b=cw5yuqFyW5HiFZIeRcbCchyjv8
	efbaYc6LGm6GDBuoxurQwDIruB9TUA3+eqqmxyV+x6D9WSjypXpnIwI8AeYUkUPz9Yh22L2fgMUSn
	VcfR2uTIMPrvB0qYmmXSIC8zCFlSS6TN6ZI7cqNlu6KOUgGZUb5Y2knvj2Q1twERfr+4aoIxsYmyc
	fAZuM8Fj6QXXLAghdI2UgJUFGvNo+FQcyw7RZgxOvPLrqNVhf12lxUt9NaEaUgXRk6Ma63w91mSuZ
	kFMyOIqx0WI9RQVydxbtrwF9yVRa1WL2PqsmSfgw+j+a6SpdTs4umklc15NhuiF0B3c1ZW9U3Ngxo
	HF/WMBGA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0LFd-0001XU-Ia; Fri, 15 Jan 2021 09:18:37 +0000
Received: from nl101-2.vfemail.net ([149.210.219.31]
 helo=freequeue.vfemail.net)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0LFb-0001Wu-0R
 for ath10k@lists.infradead.org; Fri, 15 Jan 2021 09:18:36 +0000
Received: (qmail 44033 invoked from network); 15 Jan 2021 09:18:27 -0000
Received: from nl101-2.vfemail.net (bmE=@149.210.219.31)
 by freequeue.vfemail.net with (DHE-RSA-AES256-SHA encrypted) SMTP;
 15 Jan 2021 09:18:27 -0000
Received: (qmail 43758 invoked from network); 15 Jan 2021 09:18:10 -0000
Received: by simscan 1.4.0 ppid: 43754, pid: 43756, t: 0.0840s scanners:none
Received: from unknown (HELO nl101.vfemail.net)
 (bWFuZGF5QG9wZW5tYWlsLmNj@192.168.1.192)
 by nl101.vfemail.net with ESMTPA; 15 Jan 2021 09:18:10 -0000
Date: Fri, 15 Jan 2021 11:18:15 +0200
From: manday@openmail.cc
To: ath10k@lists.infradead.org
Subject: Link down on QCA6174 (r32) kills bluetooth on same chip
Message-ID: <YAFd1xEh+2bTfpwn@air>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_041835_259407_CD461A53 
X-CRM114-Status: UNSURE (   6.10  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Please CC when replying.

`ip link set down` on the "Lite-On Communications Inc QCA6174 802.11ac Wireless Network Adapter" does reliably cut bluetooth and return it equally reliably upon `set up`. The bluetooth is on the same chip, as I understand it and has ID 04ca:3016 (Lite-On).

There is no indiciation of the occurence in userspace or even below (as far as `dmesg` says). Bluez, for instance, still thinks the bluetooth is available and operational (just everything it tries to do inexplicably fails).

Kernel is:
 5.4.80-gentoo-r1
Firmwares are:
 ath10k_pci 0000:03:00.0: firmware ver WLAN.RM.4.4.1-00157-QCARMSWPZ-1 api 6 features wowlan,ignore-otp,mfp crc32 90eebefb
 Bluetooth: hci0: QCA: patch rome 0x302 build 0x3e8, firmware rome 0x302 build 0x111

I can not exactly say whether this is a regression at the moment (if you have kernel or FW versions which I should try, please say).



Thank you!

-------------------------------------------------
This free account was provided by VFEmail.net - report spam to abuse@vfemail.net
 
ONLY AT VFEmail! - Use our Metadata Mitigator to keep your email out of the NSA's hands!
$24.95 ONETIME Lifetime accounts with Privacy Features!  
15GB disk! No bandwidth quotas!
Commercial and Bulk Mail Options!  

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
