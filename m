Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B6DC3DA6E
	for <ath10k@archiver.kernel.org>; Wed,  3 Jan 2024 16:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MV54hHlBrsG5HCcLwNQkbjmunnaquuRgTwpjGakV+68=; b=RH6O1WGsOLOP6sLJjRIWMUDS3K
	g2PVR2zThkMAlS7hDmVz8CFCnsSK2lq7fXgAgFo2x60lljEu7QCFC9yfig8ECPeX0peVMug/Y9O0m
	9HPAZJ2yHsrE5hmE4+tnLrJJa0H6QxJwmMa+mfLdT2+TZInps4/ng2mfte35XbdxXLhcRAfHHa6Z2
	Vfsfo3W4SEaxv/RJgJR6DIQxFCAHWvr8KtNaLMMrIxNE4iONyM0ph9sueG9HeLJXudX0BWoUhwfF9
	1Csy2g2E11S1WjV/7u5hKy/n//6p6I/KSUkvghpA5P9mDTkRjnyLRkkZHsscAwP/SJP8ZmG3Z6lhf
	ejIoGeUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL4AE-00BOpI-0Q;
	Wed, 03 Jan 2024 16:32:18 +0000
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL4AB-00BOoZ-1o
	for ath10k@lists.infradead.org;
	Wed, 03 Jan 2024 16:32:17 +0000
Received: by mail-ua1-x92c.google.com with SMTP id a1e0cc1a2514c-7cc705bbb2eso2486996241.1
        for <ath10k@lists.infradead.org>; Wed, 03 Jan 2024 08:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704299532; x=1704904332; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MV54hHlBrsG5HCcLwNQkbjmunnaquuRgTwpjGakV+68=;
        b=FPNstEQJbGxOtOfCB5wurzlqk/ihDPFQoaSSwX8UVZY05L/ZukSIRGEHy7Jcc9THx7
         P8CB0vA3y62vh3o6cCqyU55o7h/GElfjXhLMeKKRW1jwmkMiIfJzRlG2v/8J9TlJQKeU
         j4y79wyKeSZewbt7PgCmfrM3RVl3A/sjotplIu+yOvqH5iXHYaghCbfwA6Ek1W4GV8i8
         TBv/Twg0FBhvursM30tBzakO9ecscEqh+czPQJ0o8nPrc18Ae7f0q/P3LF5ECyv1p4P4
         xUf5KY8004UfaxZ1HbgMI/8WVP5xcmItUPIGjqLLByGHhEliUATPBhfoHW/Q/4YIxfmk
         goIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704299532; x=1704904332;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MV54hHlBrsG5HCcLwNQkbjmunnaquuRgTwpjGakV+68=;
        b=fYQRX3r0VhXUhwsL+0OSq7VFdvo/uTD5i+q4w8BsSxahhM3+PxnBOudd3jec5nMw6R
         KTc8x9jJH2OwTraZoX3TNXRcS6FItxIn6Y3XqD9UiQHnwsYDBSfrY4cYgm19jDSaE8eF
         WcZkDwLAcOhlfopIEWbC48l9zr7RhCApKzx3MvAJ63eqthyNXOD7AOOFgtLX+Ts5sATg
         i16iAyaIdcj7PHjGrd7+dDXAfGdxeGNt/PIhajgThswD37LqVTMMpAKTR9E7hoeK9nr6
         28n5WlJ1OKtKrpj+c4yE+zjgaQdogZ8ycXpxtf247PWTp5jmOslm1il4CGbaTICSmiSM
         ou0w==
X-Gm-Message-State: AOJu0YxQu7iLpej/jFRTvLgR6KH7cF6G0ceAIOQNTKHba4bHjXE4O1sY
	c4TfbCHEMthhdEPc91cTCjBB5JdUEgMO+FWY7wkoSrD5ev18nA==
X-Google-Smtp-Source: AGHT+IEmN4ihULX6lel2L0ttNUy2SanszwT+ntOj0zaoV75aDf+dIWhdqifANtd8WlrpqBUjTPRMlXSywNsMU7Ss1JY=
X-Received: by 2002:a1f:1388:0:b0:4b6:b867:c83f with SMTP id
 130-20020a1f1388000000b004b6b867c83fmr5726801vkt.22.1704299531712; Wed, 03
 Jan 2024 08:32:11 -0800 (PST)
MIME-Version: 1.0
References: <20230630151842.1.If764ede23c4e09a43a842771c2ddf99608f25f8e@changeid>
In-Reply-To: <20230630151842.1.If764ede23c4e09a43a842771c2ddf99608f25f8e@changeid>
From: Amit Pundir <amit.pundir@linaro.org>
Date: Wed, 3 Jan 2024 22:01:35 +0530
Message-ID: <CAMi1Hd2V8PV6j-5GYB7KnCUecBmES+xOkEwRUePORZP+GDKnBw@mail.gmail.com>
Subject: Re: [PATCH] ath10k: Don't touch the CE interrupt registers after
 power up
To: Douglas Anderson <dianders@chromium.org>
Cc: ath10k@lists.infradead.org, Abhishek Kumar <kuabhs@chromium.org>, 
	Youghandhar Chintala <quic_youghand@quicinc.com>, Kalle Valo <kvalo@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_083215_624111_C27F68E4 
X-CRM114-Status: GOOD (  27.75  )
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

On Sat, 1 Jul 2023 at 03:49, Douglas Anderson <dianders@chromium.org> wrote:
>
> As talked about in commit d66d24ac300c ("ath10k: Keep track of which
> interrupts fired, don't poll them"),

Hi Douglas, does this fix has a dependency on the above upstream
commit d66d24ac300c, that you refer to?

Asking because this patch landed on stable v5.4.y branch recently and
now I see RCU stalls and lockups around "ath10k_snoc 18800000.wifi:
failed to receive control response completion, polling.." message
during ath10k_snoc initialization/bringup on DB845c. Here is the
relevant log https://www.irccloud.com/pastebin/raw/NjKm3mLc, with
DB845c rebooting into USB crash dump mode eventually.

I wonder if commit d66d24ac300c need to be backported to v5.4.y as
well? I tried cherry-picking it but ran into non-trivial conflicts, so
didn't spend much time on it.

Regards,
Amit Pundir

> if we access the copy engine
> register at a bad time then ath10k can go boom. However, it's not
> necessarily easy to know when it's safe to access them.
>
> The ChromeOS test labs saw a crash that looked like this at
> shutdown/reboot time (on a chromeos-5.15 kernel, but likely the
> problem could also reproduce upstream):
>
> Internal error: synchronous external abort: 96000010 [#1] PREEMPT SMP
> ...
> CPU: 4 PID: 6168 Comm: reboot Not tainted 5.15.111-lockdep-19350-g1d624fe6758f #1 010b9b233ab055c27c6dc88efb0be2f4e9e86f51
> Hardware name: Google Kingoftown (DT)
> ...
> pc : ath10k_snoc_read32+0x50/0x74 [ath10k_snoc]
> lr : ath10k_snoc_read32+0x24/0x74 [ath10k_snoc]
> ...
> Call trace:
> ath10k_snoc_read32+0x50/0x74 [ath10k_snoc ...]
> ath10k_ce_disable_interrupt+0x190/0x65c [ath10k_core ...]
> ath10k_ce_disable_interrupts+0x8c/0x120 [ath10k_core ...]
> ath10k_snoc_hif_stop+0x78/0x660 [ath10k_snoc ...]
> ath10k_core_stop+0x13c/0x1ec [ath10k_core ...]
> ath10k_halt+0x398/0x5b0 [ath10k_core ...]
> ath10k_stop+0xfc/0x1a8 [ath10k_core ...]
> drv_stop+0x148/0x6b4 [mac80211 ...]
> ieee80211_stop_device+0x70/0x80 [mac80211 ...]
> ieee80211_do_stop+0x10d8/0x15b0 [mac80211 ...]
> ieee80211_stop+0x144/0x1a0 [mac80211 ...]
> __dev_close_many+0x1e8/0x2c0
> dev_close_many+0x198/0x33c
> dev_close+0x140/0x210
> cfg80211_shutdown_all_interfaces+0xc8/0x1e0 [cfg80211 ...]
> ieee80211_remove_interfaces+0x118/0x5c4 [mac80211 ...]
> ieee80211_unregister_hw+0x64/0x1f4 [mac80211 ...]
> ath10k_mac_unregister+0x4c/0xf0 [ath10k_core ...]
> ath10k_core_unregister+0x80/0xb0 [ath10k_core ...]
> ath10k_snoc_free_resources+0xb8/0x1ec [ath10k_snoc ...]
> ath10k_snoc_shutdown+0x98/0xd0 [ath10k_snoc ...]
> platform_shutdown+0x7c/0xa0
> device_shutdown+0x3e0/0x58c
> kernel_restart_prepare+0x68/0xa0
> kernel_restart+0x28/0x7c
>
> Though there's no known way to reproduce the problem, it makes sense
> that it would be the same issue where we're trying to access copy
> engine registers when it's not allowed.
>
> Let's fix this by changing how we "disable" the interrupts. Instead of
> tweaking the copy engine registers we'll just use disable_irq() and
> enable_irq(). Then we'll configure the interrupts once at power up
> time.
>
> Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.2.2.c10-00754-QCAHLSWMTPL-1
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  drivers/net/wireless/ath/ath10k/snoc.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
> index 26214c00cd0d..2c39bad7ebfb 100644
> --- a/drivers/net/wireless/ath/ath10k/snoc.c
> +++ b/drivers/net/wireless/ath/ath10k/snoc.c
> @@ -828,12 +828,20 @@ static void ath10k_snoc_hif_get_default_pipe(struct ath10k *ar,
>
>  static inline void ath10k_snoc_irq_disable(struct ath10k *ar)
>  {
> -       ath10k_ce_disable_interrupts(ar);
> +       struct ath10k_snoc *ar_snoc = ath10k_snoc_priv(ar);
> +       int id;
> +
> +       for (id = 0; id < CE_COUNT_MAX; id++)
> +               disable_irq(ar_snoc->ce_irqs[id].irq_line);
>  }
>
>  static inline void ath10k_snoc_irq_enable(struct ath10k *ar)
>  {
> -       ath10k_ce_enable_interrupts(ar);
> +       struct ath10k_snoc *ar_snoc = ath10k_snoc_priv(ar);
> +       int id;
> +
> +       for (id = 0; id < CE_COUNT_MAX; id++)
> +               enable_irq(ar_snoc->ce_irqs[id].irq_line);
>  }
>
>  static void ath10k_snoc_rx_pipe_cleanup(struct ath10k_snoc_pipe *snoc_pipe)
> @@ -1090,6 +1098,8 @@ static int ath10k_snoc_hif_power_up(struct ath10k *ar,
>                 goto err_free_rri;
>         }
>
> +       ath10k_ce_enable_interrupts(ar);
> +
>         return 0;
>
>  err_free_rri:
> @@ -1253,8 +1263,8 @@ static int ath10k_snoc_request_irq(struct ath10k *ar)
>
>         for (id = 0; id < CE_COUNT_MAX; id++) {
>                 ret = request_irq(ar_snoc->ce_irqs[id].irq_line,
> -                                 ath10k_snoc_per_engine_handler, 0,
> -                                 ce_name[id], ar);
> +                                 ath10k_snoc_per_engine_handler,
> +                                 IRQF_NO_AUTOEN, ce_name[id], ar);
>                 if (ret) {
>                         ath10k_err(ar,
>                                    "failed to register IRQ handler for CE %d: %d\n",
> --
> 2.41.0.255.g8b1d071c50-goog
>

