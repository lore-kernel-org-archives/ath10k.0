Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D38CC54E68
	for <ath10k@archiver.kernel.org>; Thu, 21 Mar 2024 04:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qYeTBsbO2UDuW6yojfsH1DhFkfotr8cDI9o9w7aWLEI=; b=4WBcnXZ7gozxx4RJBOP8pmYRCQ
	zP72XIzDPMZpjYvSZJ7LbUi9SAyDPpiz+lCytfYWcI1UKKrPsCwFBOSmnN573VnlEGhRUD73pyomC
	zMaRyBnUcfRBSSrtQWdfJ/fDV8U8tFwyMYRz+/YJya2TOZfOJMWNN5FUYnAe8qEi1Dhsx6ieNsw/g
	guRxDW9Q8dirDwu75PtzbYvadsOQi2wUVafPLqMHiji5vj+/b6Y0G9DA5x9MER2jQz7RrTXCqeU/B
	rf2vL+XOHHgpENUsHeXUhxWXy0vNzOb4q6iFzqHAvy9TFlyHYI6GB1bxaE+UAsc7Ujs944nri1/a8
	jSr8f9xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn9gY-00000001m0n-2eBf;
	Thu, 21 Mar 2024 04:05:46 +0000
Received: from mail-108-mta238.mxroute.com ([136.175.108.238])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn9gV-00000001m0G-0d5F
	for ath10k@lists.infradead.org;
	Thu, 21 Mar 2024 04:05:44 +0000
Received: from filter006.mxroute.com ([136.175.111.2] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta238.mxroute.com (ZoneMTA) with ESMTPSA id 18e5f2f8f3b0003bea.002
 for <ath10k@lists.infradead.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 21 Mar 2024 04:05:36 +0000
X-Zone-Loop: 0656034b687ab60c32d5c06ef611e181eb5f4f7783ba
X-Originating-IP: [136.175.111.2]
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ericswpark.com; s=x; h=Content-Transfer-Encoding:Content-Type:Message-ID:
	References:In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qYeTBsbO2UDuW6yojfsH1DhFkfotr8cDI9o9w7aWLEI=; b=lNGjeqO5iAZePed440yhXe662x
	7GmgAbjFeGc8bByksIr4uyyMupH9oTdQOGgAIBQAn9pDyFGgDUkPYhQft3FlbCXpvs6oUC4VHOZKd
	+C03/M7cfr49126Ox8pZCR1DRTVd7bwtm96hCWNuNXDPTH3BW6HAGR8GmAPezIVnCYSGsRcRB4LJ1
	YEDl4HXUK29v/UyAOVj90REZspspq9ausXs5YbKfsexAV9DK/yQWcAoG7ZnOgx3g+0IEQIGCtQ4hs
	vSByUT1ufuzVbGP+IlLryadaRKDKMdFKCsNPUUUGNllz3d1ChtbSM8eGN50fACvyfHK3nZ55yk2bw
	r/UFDL4A==;
MIME-Version: 1.0
Date: Thu, 21 Mar 2024 05:05:34 +0100
From: Eric Park <me@ericswpark.com>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath10k@lists.infradead.org
Subject: Re: QCA6174 showing terrible performance when connecting via WPA3-SAE
In-Reply-To: <87r0ghf4rw.fsf@kernel.org>
References: <2b4e20fa-3c76-4800-b872-f5d20b0cfe95@ericswpark.com>
 <87r0ghf4rw.fsf@kernel.org>
Message-ID: <a1231edb5e12283f6f5fbbf9e0ba7af8@ericswpark.com>
X-Sender: me@ericswpark.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Authenticated-Id: me@ericswpark.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_210543_319581_A9512D87 
X-CRM114-Status: GOOD (  16.64  )
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

Resending as I forgot to CC the mailing list, sorry! I've added some 
more
info since the last email.

On 2024-03-11 11:21, Kalle Valo wrote:
> But with modern CPUs I would have still expected software encryption to
> be faster than 20 Mbps so the chances are it can be something else as
> well.

I just checked and the laptop has an i5-5200U, but I'm not sure if it's 
the
bottleneck. I ran a speedtest while monitoring the load and the CPU 
usage
never went past 20-50% or so.

> That's a user space decision and depends on what connection manager you
> use.

That's the weird part, for some reason I can't get it to force-connect 
via
WPA2-PSK. I've tried KDE's network configuration and `nmtui`, but when I
connect to the network it seems like it tries to negotiate with WPA2-PSK 
first
and then "upgrades" to WPA3-SAE. Or at least that's how it appears in 
the
network details dropdown if I click on the chevron next to the Wi-Fi 
SSID.

I've also used a different USB Wi-Fi card, and that one correctly limits 
to
WPA2 if I set it in the connection manager. (And I've verified it 
connects
through WPA3 as well if I set it so.) So something in the ath10k driver 
won't
actually let me limit it to WPA2.

I'd like to figure out if there's a way of debugging this further, or 
simply
working around the limitation for now by disabling WPA3 at the driver 
level.
Please let me know if there's anything I can try on my end.

- Eric

