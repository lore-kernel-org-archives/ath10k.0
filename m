Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F185C4167B
	for <ath10k@archiver.kernel.org>; Thu,  7 Dec 2023 14:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8s9htAHiKgThgN6TKYaR8ilXK3DAarKwO4m0C7Cgc14=; b=rhySJP96UVpkGiHWYz94sDAOKb
	nsIyDeVm8zBXz7qoF3SoRgttIsulSkfNDnGK/O9ZiZfGZ7kbgTa1SrNpQIB+RVeDFIlg6HIctmic+
	OcbM7m9+xohLSeQt5KvRpKzEOiF+UxPIhbWJJbP/Ys8It+hfipwYhsMMdIaMht+IyaCKXuBKqDCfg
	URg/iPCkn2pjHE0E2NuMUHSy350KqfiLEqcWwq6J4m+Mv1x9yoDcg7Y8I8Bt8Tn1OA4TdD4BLVdUr
	8g/RDOeGCIMs8MxpO3pbKhphzIgrY5hvecr4bpS0afBJi0wZG0YgmiTjsDNEpRAxAqEFeli/+tsTE
	8drolFCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBFNR-00D1ak-0s;
	Thu, 07 Dec 2023 14:29:21 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBFNN-00D1Z0-1F
	for ath10k@lists.infradead.org;
	Thu, 07 Dec 2023 14:29:19 +0000
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-db537948ea0so1057138276.2
        for <ath10k@lists.infradead.org>; Thu, 07 Dec 2023 06:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701959354; x=1702564154; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8s9htAHiKgThgN6TKYaR8ilXK3DAarKwO4m0C7Cgc14=;
        b=yW89Bt6uZj9oIPpcRjEvuClm8/zL3K6cfRXuO9F9bMyRh7i81kMfV8+X3So9Nboq0+
         moykZbErCoRpvhMz/vyxmAQNqm6dwHG4glGNrpvn5JmXt217uenHbybLqWbJooKdKITs
         D+XSadMiDI/J/K2Lq+04lTrDnc2jTgga4Ui4iLalZRhbAQe7cUNGCxWVUnZ4YaiySFEU
         gP3MCKtg0nOy4iaDgClGVUrXKERaF7hkxrvqHlXm7A3M7tqgbPz+wzpb27kqkRnPzA1a
         f421exIPHW9hyaGrZIs9J5kI8pb3KkdxV3CQnFaIFlzfzohoOgI/T7/kHDzGKPEhlt0M
         C9jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701959354; x=1702564154;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8s9htAHiKgThgN6TKYaR8ilXK3DAarKwO4m0C7Cgc14=;
        b=naaKlriyImTwDEuzeIbvPIcS+HZAgFiY7r8tKeb8DO4IWVbPGKRJwnOFPNmpasM29E
         gsYzUEDMZx7CJiOZkXkSGP4NZi7jtk/bRK97BqG+9zw9B71LZ4DCnN2kCZ+MEqR6RpZL
         NkaAw6GK+jAj0gkThGNbHAX5LqPE8yB00gIEbKDZX+ylwbT1nKhwbFo60/ocwrRqBYnP
         e+7GT86W2MtzY5LVRNsuklBZW6rj8DOl4G3+ato09q645f0EPSMP1MOh4QtSlMnkhhQn
         EoIisfoRowj6iEUHWME1Itf57aIgerjT3tgxVmxDqWAtwxM/uwBEiGIBDxjEQHDrCjj9
         ec7w==
X-Gm-Message-State: AOJu0Yy2m6qx9ObyjbP22IqQ0T3BimpZ4sEveqY0MJiEeCJO++V+6PZK
	MBH1/8Fejsm1dsyXJn3GTqnIJmWGSVeTaqbsmBa9Jg==
X-Google-Smtp-Source: AGHT+IHSVO+oL9Bc7/LHh+dKksw0voCJnFwoiex90soZj9IOHCm7vBuye1CnGqjzRyRkaEIYYigpsKozNkNUs71tbpo=
X-Received: by 2002:a25:9112:0:b0:db7:dacf:5a08 with SMTP id
 v18-20020a259112000000b00db7dacf5a08mr2507704ybl.124.1701959354652; Thu, 07
 Dec 2023 06:29:14 -0800 (PST)
MIME-Version: 1.0
References: <20230630151842.1.If764ede23c4e09a43a842771c2ddf99608f25f8e@changeid>
In-Reply-To: <20230630151842.1.If764ede23c4e09a43a842771c2ddf99608f25f8e@changeid>
From: Yongqin Liu <yongqin.liu@linaro.org>
Date: Thu, 7 Dec 2023 22:29:03 +0800
Message-ID: <CAMSo37XcwAn9znSQ8202LUTdBKLDz94QJ9i43aXya5LHs-4GiQ@mail.gmail.com>
Subject: Re: [PATCH] ath10k: Don't touch the CE interrupt registers after
 power up
To: Douglas Anderson <dianders@chromium.org>
Cc: ath10k@lists.infradead.org, Abhishek Kumar <kuabhs@chromium.org>, 
	Youghandhar Chintala <quic_youghand@quicinc.com>, Kalle Valo <kvalo@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
	John Stultz <jstultz@google.com>, Viktor Martensson <vmartensson@google.com>, 
	Amit Pundir <amit.pundir@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_062917_422466_B83AEB66 
X-CRM114-Status: GOOD (  30.50  )
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

Hi, Douglas

On Sat, 1 Jul 2023 at 06:19, Douglas Anderson <dianders@chromium.org> wrote:
>
> As talked about in commit d66d24ac300c ("ath10k: Keep track of which
> interrupts fired, don't poll them"), if we access the copy engine
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

Recently during our Android build test on the Dragonboard 845c board,
with the Android Common Kernel android11-5.4-lts and android12-5.4-lts branches,

we found there are some ufshcd related changes printed,
and the serial console gets stuck, no response for input,
and the Android boot is stuck at the animation window.

The problem is reported here
    https://issuetracker.google.com/issues/314366682
You could check there for more log details.

And with some bisection, I found it's related to this commit,
when I revert this commit, the problem is gone.

So replied here, not sure if you have any idea about it,
or any suggestions on what we should do next to resolve the problem?

Thanks,
Yongqin Liu

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


-- 
Best Regards,
Yongqin Liu
---------------------------------------------------------------
#mailing list
linaro-android@lists.linaro.org
http://lists.linaro.org/mailman/listinfo/linaro-android

