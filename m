Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjohV-0002Gw-FP
 for ath10k@lists.infradead.org; Mon, 30 Nov 2020 19:19:06 +0000
Received: by mail-vs1-xe34.google.com with SMTP id q5so4464211vsg.0
 for <ath10k@lists.infradead.org>; Mon, 30 Nov 2020 11:19:01 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com.
 [209.85.222.43])
 by smtp.gmail.com with ESMTPSA id h16sm8144975uaw.7.2020.11.30.11.18.58
 for <ath10k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Nov 2020 11:18:58 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id x13so4112075uar.4
 for <ath10k@lists.infradead.org>; Mon, 30 Nov 2020 11:18:58 -0800 (PST)
MIME-Version: 1.0
References: <20201112200906.991086-1-kuabhs@chromium.org>
 <20201112200856.v2.1.Ia526132a366886e3b5cf72433d0d58bb7bb1be0f@changeid>
 <CAD=FV=XKCLgL6Bt+3KfqKByyP5fpwXOh6TNHXAoXkaQJRzjKjQ@mail.gmail.com>
 <002401d6c242$d78f2140$86ad63c0$@codeaurora.org>
 <CAD=FV=UnecON-M9eZVQePuNpdygN_E9OtLN495Xe1GL_PA94DQ@mail.gmail.com>
 <002d01d6c2dd$4386d880$ca948980$@codeaurora.org>
In-Reply-To: <002d01d6c2dd$4386d880$ca948980$@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 30 Nov 2020 11:18:46 -0800
Message-ID: <CAD=FV=WQPMnor3oTefDHd6JP6UmpyBo7UsOJ1Sg4Ly1otxr6hw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] ath10k: add option for chip-id based BDF selection
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
To: Rakesh Pillai <pillair@codeaurora.org>
Cc: Abhishek Kumar <kuabhs@chromium.org>, netdev <netdev@vger.kernel.org>, Brian Norris <briannorris@chromium.org>, linux-wireless <linux-wireless@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>, Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>

Hi,

On Tue, Nov 24, 2020 at 7:44 PM Rakesh Pillai <pillair@codeaurora.org> wrote:
>
> > > I missed on reviewing this change. Also I agree with Doug that this is not
> > the change I was looking for.
> > >
> > > The argument "with_variant" can be renamed to "with_extra_params".
> > There is no need for any new argument to this function.
> > > Case 1: with_extra_params=0,  ar->id.bdf_ext[0] = 0             ->   The default
> > name will be used (bus=snoc,qmi_board_id=0xab)
> > > Case 2: with_extra_params=1,  ar->id.bdf_ext[0] = 0             ->
> > bus=snoc,qmi_board_id=0xab,qmi_chip_id=0xcd
> > > Case 3: with_extra_params=1,  ar->id.bdf_ext[0] = "xyz"      ->
> > bus=snoc,qmi_board_id=0xab,qmi_chip_id=0xcd,variant=xyz
> > >
> > > ar->id.bdf_ext[0] depends on the DT entry for variant field.
> >
> > I'm confused about your suggestion.  Maybe you can help clarify.  Are
> > you suggesting:
> >
> > a) Only two calls to ath10k_core_create_board_name()
> >
> > I'm pretty sure this will fail in some cases.  Specifically consider
> > the case where the device tree has a "variant" defined but the BRD
> > file only has one entry for (board-id) and one for (board-id +
> > chip-id) but no entry for (board-id + chip-id + variant).  If you are
> > only making two calls then I don't think you'll pick the right one.
> >
> > Said another way...
> >
> > If the device tree has a variant:
> > 1. We should prefer a BRD entry that has board-id + chip-id + variant
> > 2. If #1 isn't there, we should prefer a BRD entry that has board-id + chip-id
> > 3. If #1 and #2 aren't there we fall back to a BRD entry that has board-id.
> >
> > ...without 3 calls to ath10k_core_create_board_name() we can't handle
> > all 3 cases.
>
> This can be handled by two calls to ath10k_core_create_board_name
> 1) ath10k_core_create_board_name(ar, boardname, sizeof(boardname), true)   :  As per my suggestions, this can result in two possible board names
>     a) If DT have the "variant" node, it outputs the #1 from your suggestion  (1. We should prefer a BRD entry that has board-id + chip-id + variant)
>     b) If DT does not have the "variant" node, it outputs the #2 from your suggestion (2. If #1 isn't there, we should prefer a BRD entry that has board-id + chip-id)
>
> 2) ath10k_core_create_board_name(ar, boardname, sizeof(boardname), false)    :  This is the second call to this function and outputs the #3 from your suggestion (3. If #1 and #2 aren't there we fall back to a BRD entry that has board-id)

What I'm trying to say is this.  Imagine that:

a) the device tree has the "variant" property.

b) the BRD file has two entries, one for "board-id" (1) and one for
"board-id + chip-id" (2).  It doesn't have one for "board-id + chip-id
+ variant" (3).

With your suggestion we'll see the "variant" property in the device
tree.  That means we'll search for (1) and (3).  (3) isn't there, so
we'll pick (1).  ...but we really should have picked (2), right?

-Doug

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
