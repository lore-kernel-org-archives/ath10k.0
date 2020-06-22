Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jnVX9-0001Jy-S5
 for ath10k@lists.infradead.org; Mon, 22 Jun 2020 23:07:24 +0000
Received: by mail-qt1-x841.google.com with SMTP id v19so11590402qtq.10
 for <ath10k@lists.infradead.org>; Mon, 22 Jun 2020 16:07:22 -0700 (PDT)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com.
 [209.85.222.171])
 by smtp.gmail.com with ESMTPSA id a28sm1093187qko.45.2020.06.22.16.07.18
 for <ath10k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jun 2020 16:07:19 -0700 (PDT)
Received: by mail-qk1-f171.google.com with SMTP id f18so17239718qkh.1
 for <ath10k@lists.infradead.org>; Mon, 22 Jun 2020 16:07:18 -0700 (PDT)
MIME-Version: 1.0
References: <24512086-0248-d273-5255-7d6504b0ad2c@gmail.com>
 <CA+ASDXNmOvygoKMLOS_saJAzv0oJbYq+u1_6ix-FKbb9U=GB+g@mail.gmail.com>
 <24039C4B-E476-4036-B5E6-D062460E1AAB@marriott.org>
In-Reply-To: <24039C4B-E476-4036-B5E6-D062460E1AAB@marriott.org>
From: Brian Norris <briannorris@chromium.org>
Date: Mon, 22 Jun 2020 16:07:07 -0700
Message-ID: <CA+ASDXNNfG3-ra8C2ou457J=Vj5eE83VCXgGsFPQQOixTcu7YA@mail.gmail.com>
Subject: Re: Compex WLE600VX AP mode 5GHz doesn't work since kernel 5.6
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
To: Nick Marriott <nick@marriott.org>
Cc: Michael Berg <michaeljberg@gmail.com>, Kalle Valo <kvalo@codeaurora.org>, ath10k <ath10k@lists.infradead.org>, Wen Gong <wgong@codeaurora.org>

[ rearranged your message to avoid top-posting
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches ]

On Mon, Jun 22, 2020 at 3:57 PM Nick Marriott <nick@marriott.org> wrote:
> > On May 27, 2020, at 12:58 PM, Brian Norris <briannorris@chromium.org> wrote:
> > On Sat, May 23, 2020 at 7:37 PM Michael Berg <michaeljberg@gmail.com> wrote:
> >> More follow up on the following patch that broke 5GHz AP mode on Compex
> >> cards
> >> https://github.com/torvalds/linux/commit/2dc016599cfa9672a147528ca26d70c3654a5423
> >>
> >> I just downloaded and checked the linux-5.7-rc6 kernel source,
> >> and the problematic code is still in drivers/net/wireless/ath/regd.c.
> >>
> >> Are they any updates on when this patch will be corrected/reverted?
> >
> > I submitted a revert here:
> >
> > https://patchwork.kernel.org/patch/11573585/
> >
> > Hopefully Kalle can pick that up. Thanks for reporting.
>
> Do you think this patch revert will make it into 5.7 or 5.8?

Kalle seems to have marked it Deferred in patchwork:
https://patchwork.kernel.org/patch/11573585/

I don't have any plans to update that patch, so I guess it's not going
anywhere. *shrug*

Brian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
