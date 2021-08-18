Return-Path: <SRS0=bIdE=NJ=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E1FAC4338F
	for <ath10k@archiver.kernel.org>; Wed, 18 Aug 2021 15:44:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8A0060EFF
	for <ath10k@archiver.kernel.org>; Wed, 18 Aug 2021 15:44:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E8A0060EFF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ro0Qg9+itDMleRhdRnZyVw9gaYkloavJUM1fcwSmXwk=; b=qlOIAOgzuhK2/5
	1JCbBbCLscHSyWJ3No5/Gn9br22sI3ibUfVqElkB1QiRgbj+o0tdD/VQ7F84x8eWTTgQaDS7juo79
	1gVf1UyH8JmRsK+vW7FhY+It5BqNHYp/ZJgnP0LJ7B+w1xOmhVLTuWKr1+ICLmCES9khNA3pHby5Y
	pW9xvAtxix0CHRv55P0VK9o3aEj8ogEEO7BzMwdkipGw2yx8hgqwCnlxC8IGLae40FicIjlyQ8eno
	0AVuO39poU1n/XfWf7Wr258ZQZTa7sFYBLIfk+bTQcXNVJq4viHHI6XU5d2oOda4Uhcn6Jy0quYqZ
	iYEaW23zJts5s5ydZg9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGNjW-0065a4-De; Wed, 18 Aug 2021 15:44:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGNjT-0065Yk-DD
 for ath10k@lists.infradead.org; Wed, 18 Aug 2021 15:44:00 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7E9DF60EFF;
 Wed, 18 Aug 2021 15:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629301438;
 bh=MwqiLS/+P5aIrGr3Qc5NcX2A3jn4UKNerJSZzZiOj/k=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=OAm2wOz9uDTfrQbewMMgZRbK28sOaLQyxRWyBHHX5DHuMhip+OhonIV19UofrK6O4
 br/W1qnbF4ARqUnHvijo3jMRX+fRaSrsDG0pMe6oKNQWgeHV5Es8lwTb9ZXnKtjtTX
 Kp54gJVHQWIIxqfGr0uZNH/G4sEnNSHkxOpoxysG+ZIGCIHd/1PgyT88jZRtvL02R5
 YSEbeIUxQETb713d3YZ0Y0RlUiSeg61YG6SCcnuZaFZFVNpBFlGAKiZ3e6/gW7MwFp
 yEyVpTIfAWjkFKolgac0HxFJIbattr2bWK7rxLNOmEeAWxYZBj8rC/xtt6vrV/0J+s
 R9EbRaiWD52Xg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
 id 4E5B25C04B1; Wed, 18 Aug 2021 08:43:58 -0700 (PDT)
Date: Wed, 18 Aug 2021 08:43:58 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: Kalle Valo <kvalo@codeaurora.org>, ath10k@lists.infradead.org,
 linux-mmc <linux-mmc@vger.kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Marek Vasut <marex@denx.de>,
 qais.yousef@arm.com
Subject: Re: NOHZ tick-stop error with ath10k SDIO
Message-ID: <20210818154358.GS4126399@paulmck-ThinkPad-P17-Gen-1>
References: <CAOMZO5AAvZic-NFbYYSVfOxY-27QukXMX68f9eDmhbqAkBRKRw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOMZO5AAvZic-NFbYYSVfOxY-27QukXMX68f9eDmhbqAkBRKRw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_084359_536454_59B2A9CF 
X-CRM114-Status: GOOD (  12.53  )
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
Reply-To: paulmck@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On Wed, Aug 18, 2021 at 12:18:25PM -0300, Fabio Estevam wrote:
> Hi,
> 
> When launching the hostapd application on a i.MX7 based board with an
> ath10k device connected via SDIO, the following "NOHZ tick-stop error"
> messages are seen:
> 
> # hostapd /etc/wifi.conf
> Configuration file: /etc/wifi.conf
> wlan0: interface state UNINITIALIZED->COUNTRY_UPDATE
> [   63.021149] NOHZ tick-stop error: Non-RCU local softirq work is
> pending, handler #08!!!
> Using interface wlan0 with hwaddr 00:1f:7b:31:04:a0 and ssid "thessid"
> [   67.332470] IPv6: ADDRCONF(NETDEV_CHANGE): wlan0: link becomes ready
> wlan0: interface state COUNTRY_UPDATE->ENABLED
> wlan0: AP-ENABLED
> [   68.025845] NOHZ tick-stop error: Non-RCU local softirq work is
> pending, handler #08!!!
> [   69.025973] NOHZ tick-stop error: Non-RCU local softirq work is
> pending, handler #08!!!
> [   69.607432] cfg80211: failed to load regulatory.db
> [   72.026748] NOHZ tick-stop error: Non-RCU local softirq work is
> pending, handler #08!!!
> [   73.027039] NOHZ tick-stop error: Non-RCU local softirq work is
> pending, handler #08!!!
> [   74.027159] NOHZ tick-stop error: Non-RCU local softirq work is
> pending, handler #08!!!
> [   75.027109] NOHZ tick-stop error: Non-RCU local softirq work is
> pending, handler #08!!!
> [   76.027461] NOHZ tick-stop error: Non-RCU local softirq work is
> pending, handler #08!!!
> [   77.027391] NOHZ tick-stop error: Non-RCU local softirq work is
> pending, handler #08!!!
> [   78.027560] NOHZ tick-stop error: Non-RCU local softirq work is
> pending, handler #08!!!
> 
> This happens on all kernel versions from 5.10  to 5.13.
> 
> Any ideas on how to fix this problem?

I believe that you need this commit (and possibly some prerequsites):

47c218dcae65 ("tick/sched: Prevent false positive softirq pending warnings on RT")

Adding Qais on CC for his thoughts.

							Thanx, Paul

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
