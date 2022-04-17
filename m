Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AA9EC433F5
	for <ath10k@archiver.kernel.org>; Mon, 18 Apr 2022 04:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:To:Subject:From:Message-ID:
	Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YS+gYKDgKPwvJNzRBAqvq9baRyREZg6DwF4IdxXFqlI=; b=zR60SPc9duspMW
	/hp7ulIjBdhuVXp7WjemxL7k4l5Y93DyTdAdjF63E1YjyZkfVFImt4qfqZhmP1SvIWBlHIWAwya9l
	EleGqDvYFAE/LaIJdMIM4ep857Q8IGdec7yDGPrN9xykkVUyBkpTysQa1rtpahfwubfF0bHtCRx4B
	4WIRUWmzdgejLbs07tWuHZ0jMBaHx0l3doaZ0nbkRNYspGzHhXLtymQ39WgLvWTqdQkVR9ksEElfg
	ZukSUpR/FroYgZev2bRNUCwRL4Bs70b/DnoEdrcfSs09SUXcASX6PmgbrnmuIQR4UNcTMA7rIt0jU
	GbYeD58fBkTseTtDpGlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngIzn-00FXGb-Nr; Mon, 18 Apr 2022 04:28:15 +0000
Received: from uswin-outbound1.webhostbox.net ([162.210.70.6])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngIzk-00FXFc-TB
 for ath10k@lists.infradead.org; Mon, 18 Apr 2022 04:28:14 +0000
Received: from uswin-outbound1.webhostbox.net (localhost [127.0.0.1])
 by uswin-outbound1.webhostbox.net (Postfix) with ESMTP id 741E510D017
 for <ath10k@lists.infradead.org>; Mon, 18 Apr 2022 04:29:08 +0000 (GMT)
Received: from BH-PLESK-WEB1.webhostbox.net (bh-plesk-web1.webhostbox.net
 [199.79.62.24])
 by uswin-outbound1.webhostbox.net (Postfix) with ESMTP id 1B2E410D000
 for <ath10k@lists.infradead.org>; Mon, 18 Apr 2022 04:29:08 +0000 (GMT)
Received: from [127.0.0.1] ([89.106.139.84]) by BH-PLESK-WEB1.webhostbox.net
 with MailEnable ESMTPSA (version=TLS1
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P521);
 Sun, 17 Apr 2022 02:50:03 +0000
Date: Sun, 17 Apr 2022 04:48:40 +0200
Message-ID: <70235214639475.L2D2U451A6@gmpuae.com>
From: Alessia Johns <info@gmpuae.com>
X-PleskMail: Mail From Plesk Windows Servers
Subject: All your data has been hacked and copied to my servers. Instructions
 inside
To: ath10k@lists.infradead.org
X-ME-Bayesian: 0.000000
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.2 cv=A4YcB+eG c=1 sm=1 tr=0
 a=TmI1eiegCk+nJNRmig3YWg==:117 a=6RVKOBS2B4XZRvIh/rw1Kw==:17
 a=IkcTkHD0fZMA:10 a=z0gMJWrwH1QA:10 a=fDupv5VX7poA:10
 a=A2aHmvTiQNGeVLCx13UA:9 a=QEXdDO2ut3YA:10 a=MNo305wK2VUA:10
 a=aPtJQXkq6CsA:10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220417_212813_141871_8E1C9F5D 
X-CRM114-Status: UNSURE (   5.83  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Hey There.

The following is the very last warning. 

I broke into your computer using the Wireless router you were connected to.

A few months prior, I entered the devices that you previously used to get on the net.

All of the info from the devices has been quickly copied to my machines. 

I gain access to all of your messengers, social networks, email messages, history of chats, and contact-list.

My trojan regularly updates its signature (driver-based), for that reason it stays invisible to anti-virus computer software.
I reckon that now you fully grasp, why I remained unseen right until this current day

Whilst gathering information with regards to you, I noticed that you're a huge follower of mature sites and much more. 
You truly love to go to mature websites & view filthy video clips whilst having an orgasm.

I have surely made a cam shooting videos of you jerking off. 
The cropping and editing of the videos you were seeing right at that moment & your masturbation.
Your own face is clearly seeable. I don't think this sort of material will be great for your reputation. 

I can easily forward this footage to everyone who knows you.

I also have no problem with rendering all your private info open public in cyberspace.
I think you know what I'm talking about.

It'll be a real disaster for you.

I'll wreck your life permanently.

I really think you really do not need that to take place.

Now let's resolve it this way: you transfer me 1300 $ (usd) using btc equivalent at the time of financial transaction), & i'll right away remove all your info from my web servers.
Afterward, we'll ignore one another.

My btc transaction address for transfering: bc1qgssh65nannrdawnvgvqpmukd7990gtvn3y7zrg

If you do not know how to send cash and exactly what btc is. Then key in the google search engine "Buy Bitcoin".

I present you with two days to transfer money.
The timer launched monitoring instantly after you opened this e-mail. 
I'll receive a notification the minute this letter is open.

Don't aim to seek out help, as the payment address cannot be tracked, email the note is coming from and can't be traced also & created automatically, therefore there is no reason for texting to me.
Do not make an attempt to get in touch with the authorities and some other protection solutions, and if you do, your personal data will undoubtedly be revealed.

Replacing online-passwords in social media sites, e-mail, & devices won't help you, since all the info is already saved to my computers.

Best of luck and avoid doing something foolish. Carefully consider your possible future.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
