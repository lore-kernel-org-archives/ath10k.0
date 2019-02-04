Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqn8X-0005to-2J
 for ath10k@lists.infradead.org; Mon, 04 Feb 2019 22:54:48 +0000
Received: by mail-ed1-x541.google.com with SMTP id p6so1433419eds.0
 for <ath10k@lists.infradead.org>; Mon, 04 Feb 2019 14:54:42 -0800 (PST)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com.
 [209.85.208.54])
 by smtp.gmail.com with ESMTPSA id j4sm1811920ejx.75.2019.02.04.14.54.39
 for <ath10k@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 04 Feb 2019 14:54:39 -0800 (PST)
Received: by mail-ed1-f54.google.com with SMTP id t6so126587edw.12
 for <ath10k@lists.infradead.org>; Mon, 04 Feb 2019 14:54:39 -0800 (PST)
MIME-Version: 1.0
References: <20181107185643.240346-1-briannorris@chromium.org>
 <20190204164254.86E0860734@smtp.codeaurora.org>
In-Reply-To: <20190204164254.86E0860734@smtp.codeaurora.org>
From: Brian Norris <briannorris@chromium.org>
Date: Mon, 4 Feb 2019 14:54:27 -0800
Message-ID: <CA+ASDXO4bMY9tWjeKND1+7yBC47XimNEohQEpyA-TZxgS7Xiiw@mail.gmail.com>
Subject: Re: [PATCH REGRESSION] Revert "ath10k: add quiet mode support for
 QCA6174/QCA9377"
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Govind Singh <govinds@codeaurora.org>, linux-wireless@vger.kernel.org, Linux Kernel <linux-kernel@vger.kernel.org>, ath10k@lists.infradead.org, Yu Wang <yyuwang@codeaurora.org>, Rakesh Pillai <pillair@codeaurora.org>, stable <stable@vger.kernel.org>

On Mon, Feb 4, 2019 at 8:43 AM Kalle Valo <kvalo@codeaurora.org> wrote:
> Brian Norris <briannorris@chromium.org> wrote:
>
> > This reverts commit cfb353c0dc058bc1619cc226d3cbbda1f360bdd3.
> >
> > WCN3990 firmware does not yet implement this feature, and so it crashes
> > like this:
> >
> >   fatal error received: err_qdi.c:456:EX:wlan_process:1:WLAN RT:207a:PC=b001b4f0
> >
> > This feature can be re-implemented with a proper service bitmap or other
> > feature-discovery mechanism in the future. But it should not break
> > working boards.
> >
> > Fixes: cfb353c0dc05 ("ath10k: add quiet mode support for QCA6174/QCA9377")
> > Cc: Yu Wang <yyuwang@codeaurora.org>
> > Cc: Rakesh Pillai <pillair@codeaurora.org>
> > Cc: Govind Singh <govinds@codeaurora.org>
> > Cc: <stable@vger.kernel.org>
> > Signed-off-by: Brian Norris <briannorris@chromium.org>
>
> This regression should be fixed by (which is in v4.20):
>
> 53884577fbce ath10k: skip sending quiet mode cmd for WCN3990
>
> So this revert should not be needed anymore and I'll drop this.

Yes, that seems to work for me. I'll probably replace the revert with
the above in my downstream. Thanks!

Can't really be fixed now, but it would have been nice to have a Fixes
tag on that one.

Brian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
