Return-Path: <SRS0=iK1b=OH=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85DA0C433EF
	for <ath10k@archiver.kernel.org>; Fri, 17 Sep 2021 17:09:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 401D9611C4
	for <ath10k@archiver.kernel.org>; Fri, 17 Sep 2021 17:09:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 401D9611C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ClTqjZ2JnQ/KfH/LDuuQq76ssgTvnzSTUGRwYjeSMbk=; b=yjG6BI/bgy2OnT
	lyCASKqttaYJoGPfHjaActfPlJkJ4/PPzlk9WjqEWJRG9zfqg2BP12TZ9KRvK2GwRiHSHnSwqEGpP
	sYhurO+KQiIibhaL+UEEA6RqRFhz199z8tG1UTyY+OmRZebBScr809smhcG0iL1COCPeh0bQZJI5g
	mbNjJOofGW+cL8qiZ59tg6fGUKo7BM4KuepZXq9a9AIYHrzX4ShTqrpahP8yP6zTIWb9ZijK62Kar
	xY9kT2sVSeZPknUb0vzkKmKfBS8T0Os6/2YRqZ32eGBy/dAZd+9XxvGVINWVdxwSdIfoikJ1VBxmY
	weiaAcG0JoIGYihLUc+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mRHMu-00EiFx-Qr; Fri, 17 Sep 2021 17:09:44 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mRHMr-00EiFP-TV
 for ath10k@lists.infradead.org; Fri, 17 Sep 2021 17:09:43 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7DFFC60F58;
 Fri, 17 Sep 2021 17:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631898581;
 bh=NpEKxjp9I+L4UooaH1nMDbAKoSdqZVGp40AAgxgeW6o=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=hQy4Tp/ITgbLlUCdiMbiL3iWZYoZuHa3Qhy0QL5OYjl0BywxPbhspzClFDot88mnq
 UTqNuug/HUlfoiQpuRVtFkztt7436k+Kw+PKXfUS1qS7pUuBCcd4ZZ7u1Y31tKkWs+
 8j6dr1Y+DyQ3SdGWNH8qzZAf4DQjtui/DrxAdjMfXBCBuNZPKFE4jkaZdHqPX+bhyl
 /TTyT2jMllXZc1nKJ9dAa49bvYAjVkSHmT475PvD45yHwyrByzH0a6WnL8Hj/CrRnz
 K7FFJHu3QNP+SFzwgqNf+JZsoGyVUkJ5MBATJZ7FlL9MlDBsZwWTjLvPm+h6VeqdYH
 PkqZ7uf4e2EuQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
 id 4ADB95C0A30; Fri, 17 Sep 2021 10:09:41 -0700 (PDT)
Date: Fri, 17 Sep 2021 10:09:41 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Qais Yousef <qais.yousef@arm.com>
Cc: Fabio Estevam <festevam@gmail.com>, Kalle Valo <kvalo@codeaurora.org>,
 ath10k@lists.infradead.org, linux-mmc <linux-mmc@vger.kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Marek Vasut <marex@denx.de>
Subject: Re: NOHZ tick-stop error with ath10k SDIO
Message-ID: <20210917170941.GR4156@paulmck-ThinkPad-P17-Gen-1>
References: <CAOMZO5AAvZic-NFbYYSVfOxY-27QukXMX68f9eDmhbqAkBRKRw@mail.gmail.com>
 <20210818154358.GS4126399@paulmck-ThinkPad-P17-Gen-1>
 <20210917163245.f53fh2nuswqlkwgw@e107158-lin>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210917163245.f53fh2nuswqlkwgw@e107158-lin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210917_100942_043120_E96F19A5 
X-CRM114-Status: GOOD (  26.52  )
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

On Fri, Sep 17, 2021 at 05:32:45PM +0100, Qais Yousef wrote:
> Hi Paul
> 
> On 08/18/21 08:43, Paul E. McKenney wrote:
> > On Wed, Aug 18, 2021 at 12:18:25PM -0300, Fabio Estevam wrote:
> > > Hi,
> > > 
> > > When launching the hostapd application on a i.MX7 based board with an
> > > ath10k device connected via SDIO, the following "NOHZ tick-stop error"
> > > messages are seen:
> > > 
> > > # hostapd /etc/wifi.conf
> > > Configuration file: /etc/wifi.conf
> > > wlan0: interface state UNINITIALIZED->COUNTRY_UPDATE
> > > [   63.021149] NOHZ tick-stop error: Non-RCU local softirq work is
> > > pending, handler #08!!!
> > > Using interface wlan0 with hwaddr 00:1f:7b:31:04:a0 and ssid "thessid"
> > > [   67.332470] IPv6: ADDRCONF(NETDEV_CHANGE): wlan0: link becomes ready
> > > wlan0: interface state COUNTRY_UPDATE->ENABLED
> > > wlan0: AP-ENABLED
> > > [   68.025845] NOHZ tick-stop error: Non-RCU local softirq work is
> > > pending, handler #08!!!
> > > [   69.025973] NOHZ tick-stop error: Non-RCU local softirq work is
> > > pending, handler #08!!!
> > > [   69.607432] cfg80211: failed to load regulatory.db
> > > [   72.026748] NOHZ tick-stop error: Non-RCU local softirq work is
> > > pending, handler #08!!!
> > > [   73.027039] NOHZ tick-stop error: Non-RCU local softirq work is
> > > pending, handler #08!!!
> > > [   74.027159] NOHZ tick-stop error: Non-RCU local softirq work is
> > > pending, handler #08!!!
> > > [   75.027109] NOHZ tick-stop error: Non-RCU local softirq work is
> > > pending, handler #08!!!
> > > [   76.027461] NOHZ tick-stop error: Non-RCU local softirq work is
> > > pending, handler #08!!!
> > > [   77.027391] NOHZ tick-stop error: Non-RCU local softirq work is
> > > pending, handler #08!!!
> > > [   78.027560] NOHZ tick-stop error: Non-RCU local softirq work is
> > > pending, handler #08!!!
> > > 
> > > This happens on all kernel versions from 5.10  to 5.13.
> > > 
> > > Any ideas on how to fix this problem?
> > 
> > I believe that you need this commit (and possibly some prerequsites):
> > 
> > 47c218dcae65 ("tick/sched: Prevent false positive softirq pending warnings on RT")
> > 
> > Adding Qais on CC for his thoughts.
> 
> Sorry for the late response. A combination of holidays and sickness kept me
> away from email for a while.
> 
> I did see an issue on 5.10 recently but I was running android kernel. I thought
> initially the problem is similar to the upstream one we were seeing on mainline
> for a while in the past but it turned out a genuine bug due to a patch that
> tries to 'fix' softirq interference with RT. Reverting that patch fixed the
> issue for me. It turned out later that it was specific to the platform I was
> running on and it's not reproducible by others on other platforms.
> 
> Upstream 5.10-LTS was fine for me.
> 
> HTH.

Good to hear that you found the problem and fixed it!

							Thanx, Paul

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
