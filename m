Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D36CC83F2C
	for <ath10k@archiver.kernel.org>; Mon,  4 Sep 2023 14:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Qety1iYFf9l7ZJ53UNQ1eN/bp79xoTJs/Wgp2JAaAQ=; b=D9sesNYYExCEHc
	c3htwe2FeRuIN3w6eUDYUIhCnJYuJGXncFSHjWR1PFCT6vAcq56KvrbgqiVkM9iCbW/UrBZ45PbjJ
	41eUEFlu6ZCIcGGcxyikG/NbjKTNfRtu28j4Um45xm3A5+mNi8+jbtT3ZsQwV5sJxwabLMqbS2dqV
	kl6JAA40dQ8BrqPP8T6792jnsJM3ijv6knL60STHGWDvmdKznwUkOmB4xr3PXUs2tyhmo87g6Myef
	oz0qU3wtPJc8WmrmrzqHy0Wqp+Mi9+6YnO1jv7BqQTmw2g3b7ZFC+PYekzkZihbRtwDAxzf0H/EzX
	9X/gnWFK++Tgs5qp4Scg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdAZJ-004Gtc-12;
	Mon, 04 Sep 2023 14:28:45 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdAZF-004Gsy-38
	for ath10k@lists.infradead.org;
	Mon, 04 Sep 2023 14:28:43 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <bst@pengutronix.de>)
	id 1qdAZ9-0003aB-8E; Mon, 04 Sep 2023 16:28:35 +0200
Message-ID: <c22e2867-5ebb-4337-a9c9-be95621b3e78@pengutronix.de>
Date: Mon, 4 Sep 2023 16:28:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Problems with QCA9377 SDIO on NXP i.MX8MPlus SOM
Content-Language: en-US
To: "Lukas F. Hartmann" <lukas@mntre.com>, Gary Bisson
 <bisson.gary@gmail.com>, Kalle Valo <kvalo@kernel.org>
Cc: ath10k@lists.infradead.org, gary.bisson@boundarydevices.com,
 kernel@pengutronix.de
References: <875y7swixj.fsf@mntre.com> <87mt13eqit.fsf@kernel.org>
 <ZIgoHqP8gk5wdP8A@p1g2> <878rcn4boh.fsf@mntre.com>
From: Bastian Krause <bst@pengutronix.de>
In-Reply-To: <878rcn4boh.fsf@mntre.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: bst@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: ath10k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230904_072842_005013_B850B58D 
X-CRM114-Status: GOOD (  19.41  )
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

Hi Lukas and everybody else,

On 6/13/23 17:35, Lukas F. Hartmann wrote:
> Gary Bisson <bisson.gary@gmail.com> writes:
> 
>>> Trying significantly older ath10k from an older kernel is something to
>>> try in case there are recent regressions in ath10k.
>>>
>>> I don't have an ath10k SDIO device myself so I don't know the state of
>>> SDIO support in ath10k. Does anyone else from the list know?
>>
>> FYI we have a branch in our repo with the firmware that worked on ath10k
>> at some point [2].
> 
> Thanks, I looked at this FW now and it is exactly the same as the
> "untested" in the ath10k-firmware repo
> https://github.com/kvalo/ath10k-firmware/tree/master/QCA9377/hw1.0/untested
> 
> So if that worked with ath10k several years ago (when?) I could try to
> reconstruct an older version and try to bisect for a regression, though
> I imagine it will be complicated to make these old versions work with
> APIs that have changed in the meantime in Linux.

I just wanted to check if I understood this correctly and whether this
is still the latest information: The QCA9377 connected via SDIO won't
work with the ath10k driver right now, correct? Neither with [1] nor
with any other known firmware, right?

Thanks for the previous information, by the way. I'm also stuck with a
QCA9377 (Telit module) connected via SDIO and I'm not too keen on using
the qcacld driver. With Kernel 6.5, I see basically the same output as
pasted here [2] with slightly different register dumps.

Regards,
Bastian

[1] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/ath10k/QCA9377/hw1.0
[2] https://gist.github.com/mntmn/7d18cba485572bf0690267f37647cacb

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
