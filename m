Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1gNH-0007JF-Le
 for ath10k@lists.infradead.org; Sat, 01 Aug 2020 01:31:48 +0000
Received: by mail-qk1-x744.google.com with SMTP id l23so30648450qkk.0
 for <ath10k@lists.infradead.org>; Fri, 31 Jul 2020 18:31:45 -0700 (PDT)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com.
 [209.85.219.50])
 by smtp.gmail.com with ESMTPSA id i30sm1373457qte.30.2020.07.31.18.31.40
 for <ath10k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Jul 2020 18:31:41 -0700 (PDT)
Received: by mail-qv1-f50.google.com with SMTP id j10so8322006qvo.13
 for <ath10k@lists.infradead.org>; Fri, 31 Jul 2020 18:31:40 -0700 (PDT)
MIME-Version: 1.0
References: <1576684108-30177-1-git-send-email-kvalo@codeaurora.org>
 <1576684108-30177-2-git-send-email-kvalo@codeaurora.org>
 <1576748692.7758.17.camel@realtek.com>
 <20191219154828.GA12287@w1.fi>
 <CA+ASDXMTYLGbEkBPHSqtyitMEvY5o_MjU0s+NoWdnN_ORy1gDw@mail.gmail.com>
 <20191219185522.GA16010@w1.fi>
 <CA+ASDXNOxkrZTxL0Jo4ONR2YtL83BVc_w-rBXc6ggBLdwUpDZw@mail.gmail.com>
 <871rpqly6a.fsf@kamboji.qca.qualcomm.com>
 <e8908eafd8e6050eef8782c6a7019e318d14f65f.camel@sipsolutions.net>
 <CA+ASDXMf7iXuE9hQ-XitPPfvXP0EK5FchJLCu2+5Ag=ZC=0H0w@mail.gmail.com>
 <87lfjjx0o7.fsf@codeaurora.org>
 <CA+ASDXOAzPuOn_rMsRj4t56kC-TgoG0p5WhSTPJjB8xTTq5kfg@mail.gmail.com>
 <87y2n9clhj.fsf@codeaurora.org>
 <c3ef60c2263a6840d21f6a797ad3ffb685a728b8.camel@sipsolutions.net>
In-Reply-To: <c3ef60c2263a6840d21f6a797ad3ffb685a728b8.camel@sipsolutions.net>
From: Brian Norris <briannorris@chromium.org>
Date: Fri, 31 Jul 2020 18:31:27 -0700
Message-ID: <CA+ASDXOwARX86GzMsSL4N94-jQ-TqAhe07f0AZOQcdKpPyJEgw@mail.gmail.com>
Subject: Re: [PATCH 1/2] nl80211: vendor-cmd: qca: add dynamic SAR power limits
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
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Pkshih <pkshih@realtek.com>, Jouni Malinen <j@w1.fi>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Wen Gong <wgong@codeaurora.org>, Kalle Valo <kvalo@codeaurora.org>

On Thu, Jul 30, 2020 at 6:24 AM Johannes Berg <johannes@sipsolutions.net> wrote:

> > Good, I was just checking that we all are on the same page.
>
> But are we? ;-)

I think you were deferring to, "how would user space use it?" And,
"would a common API really help anyone?" (And then you implied
"anyone" = "Chrome OS.")

I expressed a moderate benefit from a common API, but I'd settle for a
non-common (but upstream) one instead. I also doubt many
non-hardware-customized Linux distributions will make use of this any
time soon.

I don't think that implied you were truly on a different page. But
your response below may say otherwise:

> I don't really see anything in the new proposal [1] that really explains
> why the common API that we've sort of vaguely outlined in this thread
> couldn't work? It just speaks of technical difficulties ("need a
> reporting API too"), but should we let that stop us?
>
> [1] https://patchwork.kernel.org/patch/11686317/

Indeed, I don't see any reason beyond technical difficulties.

I'd love to have a few extra hours in my day to spend on writing such
an API, if that would really unblock months of deadlock.
Unfortunately, those hours tend to get eaten by all sorts of other
things these days, so an honest assessment would probably say I won't
get around to it soon. SAR regulatory concerns aren't really sexy
enough to convince me to spend my weekends on it... (...oh wait, it's
Friday evening already. Hmm.)

Regards,
Brian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
