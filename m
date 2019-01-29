Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goXsY-0007th-8a
 for ath10k@lists.infradead.org; Tue, 29 Jan 2019 18:12:59 +0000
Received: by mail-ed1-x543.google.com with SMTP id x30so16806604edx.2
 for <ath10k@lists.infradead.org>; Tue, 29 Jan 2019 10:12:57 -0800 (PST)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com.
 [209.85.208.53])
 by smtp.gmail.com with ESMTPSA id a27sm15376450eda.65.2019.01.29.10.12.53
 for <ath10k@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 29 Jan 2019 10:12:53 -0800 (PST)
Received: by mail-ed1-f53.google.com with SMTP id f9so16729754eds.10
 for <ath10k@lists.infradead.org>; Tue, 29 Jan 2019 10:12:53 -0800 (PST)
MIME-Version: 1.0
References: <1536200965-121172-1-git-send-email-yuehaibing@huawei.com>
 <4b16caf3-9a25-99d0-5b35-f27d6e5a5c65@huawei.com>
In-Reply-To: <4b16caf3-9a25-99d0-5b35-f27d6e5a5c65@huawei.com>
From: Brian Norris <briannorris@chromium.org>
Date: Tue, 29 Jan 2019 10:12:42 -0800
Message-ID: <CA+ASDXMQto_dqPOuUEX9vqqbWmor8qvpwxBVTg6tSnHkfsCzpw@mail.gmail.com>
Subject: Re: [PATCH] ath10k: snoc: remove set but not used variable 'ar_snoc'
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
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: YueHaibing <yuehaibing@huawei.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

On Mon, Jan 28, 2019 at 9:53 PM YueHaibing <yuehaibing@huawei.com> wrote:
>
> ping...

For some reason, your patch shows up as Deferred in patchwork:

https://patchwork.kernel.org/patch/10589789/

So the maintainers have accidentally (?) ignored it. I'm not what the
official suggestion is for that, but you might just resend.

In any case...

> On 2018/9/6 10:29, YueHaibing wrote:
> > From: Yue Haibing <yuehaibing@huawei.com>
> >
> > Fixes gcc '-Wunused-but-set-variable' warning:
> >
> > drivers/net/wireless/ath/ath10k/snoc.c: In function 'ath10k_snoc_tx_pipe_cleanup':
> > drivers/net/wireless/ath/ath10k/snoc.c:681:22: warning:
> >  variable 'ar_snoc' set but not used [-Wunused-but-set-variable]
> >
> > Signed-off-by: Yue Haibing <yuehaibing@huawei.com>

...patch looks fine to me:

Reviewed-by: Brian Norris <briannorris@chromium.org>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
