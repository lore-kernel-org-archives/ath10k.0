Return-Path: <SRS0=bIdE=NJ=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAFEDC4338F
	for <ath10k@archiver.kernel.org>; Wed, 18 Aug 2021 00:24:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7591B6102A
	for <ath10k@archiver.kernel.org>; Wed, 18 Aug 2021 00:24:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7591B6102A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=spDNYI7GFRDMYncJD9yYme0sCuYt5sgkuj2K9WsayZg=; b=ecAbq1cq/c6OX1
	51c3nijsIOGpYscbnyt8abpbdTf+d43zlVHiDfpXTYPMDwNZPH0MdBpfqX/2rLsMQ2IBYrfgzN9l6
	Iygldx2icOfAl/s7RLWf4nhSUdeTPl1+/bvq9KkNQwcziZk4E/7o72saawouRA+Mu6AcEVyZGaxVI
	PRouS21IjgXHHRcqHsEjf+XFl/sdRsQ1Jkkv7QyLs19ReJV/wIHrn1Ur94UsnirfYJXhCrsi1oOiY
	cS1I1GVC/6Qj6bU0FC9tlDoYAm9KRzlVHUlPCTnuA7sfGDC4JbrjRwyB2hxJ46TINOGJOMJOL9o5E
	h0hMESj9N8Td0fkqxQCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mG9My-003nr1-9M; Wed, 18 Aug 2021 00:23:48 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mG9Mu-003nqM-IP
 for ath10k@lists.infradead.org; Wed, 18 Aug 2021 00:23:45 +0000
Received: by mail-lj1-x234.google.com with SMTP id c12so1812444ljr.5
 for <ath10k@lists.infradead.org>; Tue, 17 Aug 2021 17:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=Wj7ZYl1WoMaaA1oaw8rVm+2w7aPP8H9UvMYaCDtbsQE=;
 b=Gk1864OUM428zVHNihF4AqEnIOUcy+1NSIzauz5TxGEg12H6IWI0K73NKzlsWLnLWN
 U1+Igg+O4O3VGZbJGnkR00GU9vI8VE3iasEMHktKubRejZEnfOVsaeFfa0d6uOXDj81T
 5ITIkIaefZS7EUxUOsJMiahXPXPSPSDFRYDebVwYLXBT8Iigi5VrqNKA/jA85w9VvgM+
 VynZe4v1pdz94k4ACcGHnatWcEw5mL4wvyRZ1dRa+XJQ66e97wE6pcr71DSzky8rGJsf
 gBKy5jH2ODdVlhhBAF+LStFKlCgDWDmLLhsRCmRjqzcoGR3o2lo97DjS6703JOOswAyQ
 6ZYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=Wj7ZYl1WoMaaA1oaw8rVm+2w7aPP8H9UvMYaCDtbsQE=;
 b=fVOKFQuJ2JGLBAc+s1lEleMX9siUX9g53m1V5JSvBm+2sWHxU6Sc8h6zEkdxEoX8MS
 6H8auFIuRVOmQuVv7nejx+UqxPbUn3JCdZ9Nb4HUro4+Sotvq/qjg+Dhk+KofSYyyTt0
 inUP3UC0zvBglbJBiPW0XMyDBYCJOj5PWPCTCc5D3iTYlog+qO9BCbQwLWsjLpgYeqs6
 +l+paETTzBYRZvFvz2e6zTeVjJVWmT1l9Sx6jLYI7Jy0Avu+FH6//6nR7v9wpk8M6xD/
 S/3aq7H8zEespCSAshrDqWhFSgv1Wmxe9+UiuKrcRdlPkqgeWBze/cXsFIt4UG9/jDXL
 8F8g==
X-Gm-Message-State: AOAM532cgU9WSpy89QuzqpSU0I9aoz1exNudZ0GdRAtXQer7nVPawfjZ
 b3Z33Ree5ib44wEORqgnyF1HhXn7yOtrdEXlHvE=
X-Google-Smtp-Source: ABdhPJz9/MVuNT4Q8zJcJCaVC+5ltwIfLIIqxpjCUl7tU3h72qBjSHQb6WPWxjTGTWlNrwG61VYCmq//YlVOOKQ1aNA=
X-Received: by 2002:a2e:8816:: with SMTP id x22mr5399473ljh.264.1629246217149; 
 Tue, 17 Aug 2021 17:23:37 -0700 (PDT)
MIME-Version: 1.0
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 17 Aug 2021 21:23:26 -0300
Message-ID: <CAOMZO5DEAMMKHwDkXxqWxg6uj_GQjBUQ5jV+4AzxAr2DCrgTVg@mail.gmail.com>
Subject: imx7: dev->coherent_dma_mask NULL warning
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org, Ulf Hansson <ulf.hansson@linaro.org>, 
 Bough Chen <haibo.chen@nxp.com>, linux-mmc <linux-mmc@vger.kernel.org>, 
 Christoph Hellwig <hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_172344_668453_DA29073F 
X-CRM114-Status: UNSURE (   5.90  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Hi,

Launching the hostapd application on an imx7d based board with an
ath10k Wifi chip leads to the following warning:

 ------------[ cut here ]------------
 WARNING: CPU: 0 PID: 489 at kernel/dma/mapping.c:427 dma_alloc_attrs+0xd0/0x114
 Modules linked in: ath10k_sdio ath10k_core ath
 CPU: 0 PID: 489 Comm: hostapd Not tainted 5.10.48-stable-standard #1
 Hardware name: Freescale i.MX7 Dual (Device Tree)
 [<c0111378>] (unwind_backtrace) from [<c010bc04>] (show_stack+0x10/0x14)
 [<c010bc04>] (show_stack) from [<c0e26094>] (dump_stack+0xdc/0x104)
 [<c0e26094>] (dump_stack) from [<c0125574>] (__warn+0xd8/0x114)
 [<c0125574>] (__warn) from [<c0e20ecc>] (warn_slowpath_fmt+0x60/0xbc)
 [<c0e20ecc>] (warn_slowpath_fmt) from [<c01b9eac>] (dma_alloc_attrs+0xd0/0x114)
 [<c01b9eac>] (dma_alloc_attrs) from [<bf01373c>]
(ath10k_add_interface+0x2f0/0x1094 [ath10k_core])
 [<bf01373c>] (ath10k_add_interface [ath10k_core]) from [<c0d94470>]
(drv_add_interface+0x88/0x2fc)
 [<c0d94470>] (drv_add_interface) from [<c0db6c58>]
(ieee80211_do_open+0x4c8/0xc70)
 [<c0db6c58>] (ieee80211_do_open) from [<c0b12b7c>] (__dev_open+0xf0/0x170)
 [<c0b12b7c>] (__dev_open) from [<c0b12f40>] (__dev_change_flags+0x164/0x1d0)
 [<c0b12f40>] (__dev_change_flags) from [<c0b12fc4>]
(dev_change_flags+0x18/0x48)
 [<c0b12fc4>] (dev_change_flags) from [<c0bcf968>] (devinet_ioctl+0x6d4/0x868)
 [<c0bcf968>] (devinet_ioctl) from [<c0bd2684>] (inet_ioctl+0x210/0x3b0)
 [<c0bd2684>] (inet_ioctl) from [<c0ae44d4>] (sock_ioctl+0x56c/0x718)
 [<c0ae44d4>] (sock_ioctl) from [<c02ccfb8>] (sys_ioctl+0xf0/0xbf0)
 [<c02ccfb8>] (sys_ioctl) from [<c0100080>] (ret_fast_syscall+0x0/0x28)
 Exception stack(0xc3293fa8 to 0xc3293ff0)
 3fa0:                   bea0190c 00000000 00000008 00008914 bea0190c 00001003
 3fc0: bea0190c 00000000 00000008 00000036 00eeef10 00eeedb8 00000000 000186a0
 3fe0: 0051dbcc bea018fc 004ba26d b6c49fb8
 irq event stamp: 145521
 hardirqs last  enabled at (145531): [<c01949f4>] console_unlock+0x434/0x654
 hardirqs last disabled at (145540): [<c01949ec>] console_unlock+0x42c/0x654
 softirqs last  enabled at (145472): [<c0101604>] __do_softirq+0x324/0x5c4
 softirqs last disabled at (145415): [<c012e1bc>] irq_exit+0x17c/0x1dc
 ---[ end trace 37715f05492d4493 ]---

which comes from:

void *dma_alloc_attrs(struct device *dev, size_t size, dma_addr_t *dma_handle,
....
WARN_ON_ONCE(!dev->coherent_dma_mask);

Where should the coherent_dma_mask be set to avoid this problem?

Thanks,

Fabio Estevam

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
