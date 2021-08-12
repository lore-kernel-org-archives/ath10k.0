Return-Path: <SRS0=UyaD=ND=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5600C4338F
	for <ath10k@archiver.kernel.org>; Thu, 12 Aug 2021 20:21:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8500E60C3F
	for <ath10k@archiver.kernel.org>; Thu, 12 Aug 2021 20:21:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8500E60C3F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=enodh8evpMi/Lk7kXiNwTzQLrMQzZPVngiJZcmJcvUE=; b=WnDPITSuP+V6DX
	BZ4D2F438hDxxKnMjZPfmiZXiiT7dLfBQobq0/q+yXoUjTlSy+qYtqoo2/iVgoUkT8lrdK9dm5akB
	fH/HyH7TA1X4YbVSnCJGxklfDZ9SFPQ6heHNB3IMuvmWTMrUc6qtb5FgkB8Evh+FoIzVgY3tQ3dWI
	FVvQwPreio9rkNuOwHLC8RMT3dCvYCOAvorcbgubtWfZNUMDrRjfnkIV6miEYcsb/8qQv2QEQXwvH
	8ztOKDE59wJD03GmM24Z1Fn5cZI/P0qKx69BgUXSwPFutcbnvBPm4eZytsE+D6cfgkcJtcyI8+4Z3
	NZ/5WWrt3Eo8p+HexXcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEHCZ-00BA0N-Sc; Thu, 12 Aug 2021 20:21:19 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEHCU-00B9zV-4b
 for ath10k@lists.infradead.org; Thu, 12 Aug 2021 20:21:18 +0000
Received: by mail-ed1-x52e.google.com with SMTP id t1so11666993edd.6
 for <ath10k@lists.infradead.org>; Thu, 12 Aug 2021 13:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zxDq/g55N5DEIwhH9XICScXN1w2LO9Qk4UYDqTLhh/A=;
 b=n/tkJnXPPwW7dKTrYhLSNmMKuAs4GHsquvwta/yYLlNe/EIt8h1eQjB5DaXk6awxnl
 785O1/zvphm103vRd03laIhXfnArC/6smO/fQDrGMt9vDHcVHb2URq+pq/n82PsCjA2P
 Ci6BfKU5C14HfTLeu4ZKtRKj3jnI7pseWOMYOz4B/68cUmhMFEQkM9CG6cmNEnoytk2z
 JHeUfc2MxRfi8EQkKyVQdafyFwYuHmdMhicxAujGnrMe5FWeVFrOIFrB8fsUYIcQKbs8
 5p7J+p/yJuxs2zjIumnGQ/rpW6I2MNEeayjatJbS0t/Pnx47j0RoD3NXGv1AygivUHk7
 k2Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zxDq/g55N5DEIwhH9XICScXN1w2LO9Qk4UYDqTLhh/A=;
 b=IvA+kHbyJyfgr4bTNTLo1ijePa1mHh8Ry0UbrkLVYDUUP9EZvfr/nfI3yCOrvRrTrN
 l+ithkyfYclKXYfBBDZeU+vcB/qMPGIXRlN8RZ7bprFQfCtV1iR1C9G/F0m/tX9uvRpT
 oglIfE0nBIomKF6sptsOtrUrLIdFdffrE1cfJM+aC3gEX7KOSTZxN+rESIfSVtvp8F+g
 nnQAjSalvUsGMjaoLs7Lj79V5XPylfI1hB2Gv/R108VhAsWM5R2TiOFM7ySN61sIpYK4
 BwBVBWwHvQCOYOt3zvmtonEqiWfGaWK2gLblQX0YXOpja6Mn+fARoYjd6yImGeU8th3k
 XaBw==
X-Gm-Message-State: AOAM5301Z+F8CqsUeUrBwKM2PUOg9DRKByzuCT/6A+pOs7CuUyoLwXoh
 fqb7bC8sYImE5+kyl8NOf6uSRSi4sY2tmqfrWd4=
X-Google-Smtp-Source: ABdhPJzIA90SX1dcZVwlK0blAjYG/13v3H2FbFsdiHFKDL7L2S7GOZLTHRfW/M/AEnefrqHLRp2ZiCuiP5TV3vaISLs=
X-Received: by 2002:aa7:c4d4:: with SMTP id p20mr7713351edr.382.1628799671438; 
 Thu, 12 Aug 2021 13:21:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210722193459.7474-1-ojab@ojab.ru>
 <CAKzrAgRvOLX6rcKKz=8ghD+QLyMu-1KEPm5HkkLEAzuE1MQpDA@mail.gmail.com>
 <CACC2YF1j45r0chib-HC463FVO_a1Um1f+7PvuRBYVLC7WbgGnQ@mail.gmail.com>
In-Reply-To: <CACC2YF1j45r0chib-HC463FVO_a1Um1f+7PvuRBYVLC7WbgGnQ@mail.gmail.com>
From: Axel Rasmussen <axel.rasmussen1@gmail.com>
Date: Thu, 12 Aug 2021 13:21:00 -0700
Message-ID: <CACC2YF1WCSZqLrCig-O-_wJ9s4x47iTc2Xa0-LnyqLm8EWfUHg@mail.gmail.com>
Subject: Re: [PATCH V2] ath10k: don't fail if IRAM write fails
To: "ojab //" <ojab@ojab.ru>
Cc: Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, ath10k@lists.infradead.org, 
 Linux Wireless <linux-wireless@vger.kernel.org>, netdev@vger.kernel.org, 
 LKML <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_132114_230780_783E2D2D 
X-CRM114-Status: GOOD (  33.02  )
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

Sorry again for the slow response time.

I got around to testing this today on my hardware. I tested with a
vanilla 5.13.8 kernel, and then the same kernel with this patch
applied. Long story short, the patch does indeed seem to at least work
around the issue I was seeing in [1]. With this patch applied, I still
get the same "failed to copy target iram contents" error, but the
interface comes up and seems to be functional regardless.

So, for what it's worth (granted I am no wireless expert!), you can take:

Tested-by: Axel Rasmussen <axelrasmussen@google.com>

(This issue has nothing to do with my full time job, but I'm meant to
use my @google.com address for any open source contributions, which I
believe applies to commit messages too.)

[1]: https://lists.infradead.org/pipermail/ath10k/2021-May/012626.html



Here are the two dmesg outputs, for comparison:

# uname -a
Linux router 5.13.8 #1 SMP Wed Aug 11 20:18:51 PDT 2021 x86_64 AMD
GX-412TC SOC AuthenticAMD GNU/Linux
# dmesg | grep ath
[   12.491747] ath10k_pci 0000:04:00.0: pci irq msi oper_irq_mode 2
irq_mode 0 reset_mode 0
[   12.613341] ath10k_pci 0000:04:00.0: qca9984/qca9994 hw1.0 target
0x01000000 chip_id 0x00000000 sub 168c:cafe
[   12.613367] ath10k_pci 0000:04:00.0: kconfig debug 1 debugfs 1
tracing 1 dfs 1 testmode 0
[   12.615071] ath10k_pci 0000:04:00.0: firmware ver
10.4-3.9.0.2-00131 api 5 features
no-p2p,mfp,peer-flow-ctrl,btcoex-param,allows-mesh-bcast,no-ps,peer-fixed-rate,iram-recovery
crc32 23bd9e43
[   13.846538] ath10k_pci 0000:04:00.0: board_file api 2 bmi_id 0:31
crc32 85498734
[   16.428502] ath10k_pci 0000:04:00.0: failed to copy target iram contents: -12
[   16.518692] ath10k_pci 0000:04:00.0: could not init core (-12)
[   16.518950] ath10k_pci 0000:04:00.0: could not probe fw (-12)



# uname -a
Linux router 5.13.8+ #2 SMP Wed Aug 11 20:28:56 PDT 2021 x86_64 AMD
GX-412TC SOC AuthenticAMD GNU/Linux
# dmesg | grep ath
[   12.201239] ath10k_pci 0000:04:00.0: pci irq msi oper_irq_mode 2
irq_mode 0 reset_mode 0
[   12.323354] ath10k_pci 0000:04:00.0: qca9984/qca9994 hw1.0 target
0x01000000 chip_id 0x00000000 sub 168c:cafe
[   12.323407] ath10k_pci 0000:04:00.0: kconfig debug 1 debugfs 1
tracing 1 dfs 1 testmode 0
[   12.325162] ath10k_pci 0000:04:00.0: firmware ver
10.4-3.9.0.2-00131 api 5 features
no-p2p,mfp,peer-flow-ctrl,btcoex-param,allows-mesh-bcast,no-ps,peer-fixed-rate,iram-reco
very crc32 23bd9e43
[   13.556748] ath10k_pci 0000:04:00.0: board_file api 2 bmi_id 0:31
crc32 85498734
[   16.155848] ath10k_pci 0000:04:00.0: No hardware memory
[   16.155873] ath10k_pci 0000:04:00.0: failed to copy target iram contents: -12
[   16.267376] ath10k_pci 0000:04:00.0: htt-ver 2.2 wmi-op 6 htt-op 4
cal otp max-sta 512 raw 0 hwcrypto 1
[   16.382257] ath: EEPROM regdomain sanitized
[   16.382289] ath: EEPROM regdomain: 0x64
[   16.382306] ath: EEPROM indicates we should expect a direct regpair map
[   16.382312] ath: Country alpha2 being used: 00
[   16.382316] ath: Regpair used: 0x64
[   16.393599] ath10k_pci 0000:04:00.0 wlp4s0: renamed from wlan0
[   41.264025] ath10k_pci 0000:04:00.0: No hardware memory
[   41.264045] ath10k_pci 0000:04:00.0: failed to copy target iram contents: -12
[   41.480677] ath10k_pci 0000:04:00.0: Unknown eventid: 36933

On Sun, Aug 1, 2021 at 7:23 PM Axel Rasmussen <axel.rasmussen1@gmail.com> wrote:
>
> On Thu, Jul 22, 2021 at 12:42 PM ojab // <ojab@ojab.ru> wrote:
> >
> > See also: https://lists.infradead.org/pipermail/ath10k/2021-May/012626.html
> >
> > On Thu, 22 Jul 2021 at 22:36, ojab <ojab@ojab.ru> wrote:
> > >
> > > After reboot with kernel & firmware updates I found `failed to copy
> > > target iram contents:` in dmesg and missing wlan interfaces for both
> > > of my QCA9984 compex cards. Rolling back kernel/firmware didn't fixed
> > > it, so while I have no idea what's actually happening, I don't see why
> > > we should fail in this case, looks like some optional firmware ability
> > > that could be skipped.
> > >
> > > Also with additional logging there is
> > > ```
> > > [    6.839858] ath10k_pci 0000:04:00.0: No hardware memory
> > > [    6.841205] ath10k_pci 0000:04:00.0: failed to copy target iram contents: -12
> > > [    6.873578] ath10k_pci 0000:07:00.0: No hardware memory
> > > [    6.875052] ath10k_pci 0000:07:00.0: failed to copy target iram contents: -12
> > > ```
> > > so exact branch could be seen.
> > >
> > > Signed-off-by: Slava Kardakov <ojab@ojab.ru>
> > > ---
> > >  Of course I forgot to sing off, since I don't use it by default because I
> > >  hate my real name and kernel requires it
>
> Thanks for working on this! And sorry for the slow response. I've been
> unexpectedly very busy lately, but I plan to test out this patch next
> week.
>
> > >
> > >  drivers/net/wireless/ath/ath10k/core.c | 9 ++++++---
> > >  1 file changed, 6 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
> > > index 2f9be182fbfb..d9fd5294e142 100644
> > > --- a/drivers/net/wireless/ath/ath10k/core.c
> > > +++ b/drivers/net/wireless/ath/ath10k/core.c
> > > @@ -2691,8 +2691,10 @@ static int ath10k_core_copy_target_iram(struct ath10k *ar)
> > >         u32 len, remaining_len;
> > >
> > >         hw_mem = ath10k_coredump_get_mem_layout(ar);
> > > -       if (!hw_mem)
> > > +       if (!hw_mem) {
> > > +               ath10k_warn(ar, "No hardware memory");
> > >                 return -ENOMEM;
> > > +       }
> > >
> > >         for (i = 0; i < hw_mem->region_table.size; i++) {
> > >                 tmp = &hw_mem->region_table.regions[i];
> > > @@ -2702,8 +2704,10 @@ static int ath10k_core_copy_target_iram(struct ath10k *ar)
> > >                 }
> > >         }
> > >
> > > -       if (!mem_region)
> > > +       if (!mem_region) {
> > > +               ath10k_warn(ar, "No memory region");
> > >                 return -ENOMEM;
> > > +       }
> > >
> > >         for (i = 0; i < ar->wmi.num_mem_chunks; i++) {
> > >                 if (ar->wmi.mem_chunks[i].req_id ==
> > > @@ -2917,7 +2921,6 @@ int ath10k_core_start(struct ath10k *ar, enum ath10k_firmware_mode mode,
> > >                 if (status) {
> > >                         ath10k_warn(ar, "failed to copy target iram contents: %d",
> > >                                     status);
> > > -                       goto err_hif_stop;
> > >                 }
> > >         }
> > >
> > > --
> > > 2.32.0

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
