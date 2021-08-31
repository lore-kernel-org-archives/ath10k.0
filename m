Return-Path: <SRS0=prmI=NW=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EE12C4320A
	for <ath10k@archiver.kernel.org>; Tue, 31 Aug 2021 18:24:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6860B6103D
	for <ath10k@archiver.kernel.org>; Tue, 31 Aug 2021 18:24:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6860B6103D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0uBDSZ494h8as0r5R6raX6yMYGNijxU1OFOD0pRMdFY=; b=pcngYoAncxhlUT
	NQETzn00jtALk2KQ3U/IsX0IXkxmZ73IeAIg6/nN3dFA3kFzq3hkPMQHPAsU19fMBRTAyQCfZPNLo
	Agee1ypZK21ardvWO/fwWnVpNjMxKmt6GKdSz399eMPUoyLAHDdRNNTEh3n3nATMl1D+N1EgJ4Ckk
	v2sc1I3DIxKIFKfuDDb+BJiOxqiia8G6oSrnxQLd/jWE6RWomIg+80AmQu4rDux/BBT+FlSUfltE2
	FF+5zYuCv9nr4NWEKrmpucomwZhVx/fmdcFDg1Uhu7MmZFT6OFtWEieaUbY9LoFi/ldIDvELO0eD7
	JxZtNPeoaLxJHtfeJumg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mL8OX-002uRN-0T; Tue, 31 Aug 2021 18:22:01 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mL8OU-002uQy-Dz
 for ath10k@lists.infradead.org; Tue, 31 Aug 2021 18:21:59 +0000
Received: by mail-lj1-x229.google.com with SMTP id h1so244505ljl.9
 for <ath10k@lists.infradead.org>; Tue, 31 Aug 2021 11:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KsNRskN10uGdBS+FAhPOIQh/5DxFwy8MHfzSDSxX5Uw=;
 b=HIZJbD1ZWTB3ivppNQo6KKvLKNJBkZB+gB6ECFKBKCdp2BQMTOL8XIFSnwtuvbiwmG
 O8glyNjDNLhlM2Q4kXKPB8mPT+qVL8C7+vEo81+qGz1cY7E9A0QC3zhE0Hiv9dZjiNf0
 mQdFN0OQF2VZwuoAvvKDHbsSPx5Zuhaedt7cFTjAWncmVpvESSv2DD7QzMrkBf2L5d/F
 0na7mJ1dpycu27ttIkjZRsECQ14Lb8CKr6sPjYha9+LYhDARhI7fGzYjl7iBq8C1AEPz
 sCnFxhUni7bHJn2yj0TF/ksTTfLvx1d5OUmoJD47NNKnzq9rFpXYe1j9zm6K/fQEyuAJ
 lLVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KsNRskN10uGdBS+FAhPOIQh/5DxFwy8MHfzSDSxX5Uw=;
 b=QOJsC83wNb3O+gF2V+7+O/E/o0JD/9PK0VpF/lCgv4xuF3dn4PDnrd6QtBcTO5A7/f
 1sZvJzsGi3bYHLCM3PicJ3leBL4VBGTNg69JlbdfLU+Dd3FIwXH1HwKitzxfKndN0lCe
 dV0s8uE2RQ/rIWfi9p2i3zAofglchGJCLH2FgLeCu3Xm6p6zVggnViKiHsYV7MPQbF/B
 TmTuEw6iiZXM4neg+OdLA3TrO2S76AZJVOvBjfY6/dchOSobHS74tDntanlZR3CR7cQz
 1XNtfZIO0nXXv+Wc6HsJc8Y3rLBAPV/LPTOW2ZllVu64sOWXMzHyZ2Vk1ucSrNSE5jDt
 ToQA==
X-Gm-Message-State: AOAM533Uxd6mXyutWEoZcZ7KK0JGTSpqs4BA6nE7j5/jB6JgMMqWZYex
 85vhupvi9wxpEfgprKATwYjym/milolznn+svzQ=
X-Google-Smtp-Source: ABdhPJxL1IAF36zhJIY0JnAWPwhELmGCoNSgButeIYRUVeDMKk0MaHJtpBax9vrnDkmDUw4+cJmIsh9Udy1ud2Fk7zk=
X-Received: by 2002:a2e:8e8f:: with SMTP id z15mr25480012ljk.121.1630434115728; 
 Tue, 31 Aug 2021 11:21:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210824144339.2796122-1-festevam@denx.de>
In-Reply-To: <20210824144339.2796122-1-festevam@denx.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 31 Aug 2021 15:21:44 -0300
Message-ID: <CAOMZO5De71QvbvAsddCzAmGRULTie3hPqBJgo6ytVV6pEkisXw@mail.gmail.com>
Subject: Re: [PATCH] ath10k: sdio: Add missing BH locking around napi_schdule()
To: Fabio Estevam <festevam@denx.de>, Kalle Valo <kvalo@codeaurora.org>
Cc: Jakub Kicinski <kuba@kernel.org>, ath10k@lists.infradead.org, 
 linux-wireless <linux-wireless@vger.kernel.org>,
 "Paul E . McKenney" <paulmck@kernel.org>, 
 Marek Vasut <marex@denx.de>, wgong@codeaurora.org, alagusankar@silex-india.com,
 erik.stromdahl@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210831_112158_527412_4A522A82 
X-CRM114-Status: GOOD (  13.54  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Hi Kalle,

On Tue, Aug 24, 2021 at 11:46 AM Fabio Estevam <festevam@denx.de> wrote:
>
> On a i.MX-based board with a QCA9377 Wifi chip, the following errors
> are seen after launching the 'hostapd' application:
>
> hostapd /etc/wifi.conf
> Configuration file: /etc/wifi.conf
> wlan0: interface state UNINITIALIZED->COUNTRY_UPDATE
> NOHZ tick-stop error: Non-RCU local softirq work is pending, handler #08!!!
> Using interface wlan0 with hwaddr 00:1f:7b:31:04:a0 and ssid "thessid"
> IPv6: ADDRCONF(NETDEV_CHANGE): wlan0: link becomes ready
> wlan0: interface state COUNTRY_UPDATE->ENABLED
> wlan0: AP-ENABLED
> NOHZ tick-stop error: Non-RCU local softirq work is pending, handler #08!!!
> NOHZ tick-stop error: Non-RCU local softirq work is pending, handler #08!!!
> NOHZ tick-stop error: Non-RCU local softirq work is pending, handler #08!!!
> NOHZ tick-stop error: Non-RCU local softirq work is pending, handler #08!!!
> ...
>
> Fix this problem by adding the BH locking around napi-schedule(),
> in the same way it was done in commit e63052a5dd3c ("mlx5e: add
> add missing BH locking around napi_schdule()").
>
> Its commit log provides the following explanation:
>
> "It's not correct to call napi_schedule() in pure process
> context. Because we use __raise_softirq_irqoff() we require
> callers to be in a context which will eventually lead to
> softirq handling (hardirq, bh disabled, etc.).
>
> With code as is users will see:
>
> NOHZ tick-stop error: Non-RCU local softirq work is pending, handler #08!!!
> "
>
> Fixes: cfee8793a74d ("ath10k: enable napi on RX path for sdio")
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Gentle ping on this one.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
