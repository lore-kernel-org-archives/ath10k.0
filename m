Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmL2Q-0000ld-NJ
 for ath10k@lists.infradead.org; Mon, 07 Dec 2020 18:15:08 +0000
Received: by mail-il1-x143.google.com with SMTP id q1so13064973ilt.6
 for <ath10k@lists.infradead.org>; Mon, 07 Dec 2020 10:15:03 -0800 (PST)
MIME-Version: 1.0
References: <20201112200906.991086-1-kuabhs@chromium.org>
 <20201112200856.v2.1.Ia526132a366886e3b5cf72433d0d58bb7bb1be0f@changeid>
 <CAD=FV=XKCLgL6Bt+3KfqKByyP5fpwXOh6TNHXAoXkaQJRzjKjQ@mail.gmail.com>
 <002401d6c242$d78f2140$86ad63c0$@codeaurora.org>
 <CAD=FV=UnecON-M9eZVQePuNpdygN_E9OtLN495Xe1GL_PA94DQ@mail.gmail.com>
 <002d01d6c2dd$4386d880$ca948980$@codeaurora.org>
 <CAD=FV=WQPMnor3oTefDHd6JP6UmpyBo7UsOJ1Sg4Ly1otxr6hw@mail.gmail.com>
 <004301d6c968$12ef1b10$38cd5130$@codeaurora.org>
 <CAD=FV=VCbjRUxUsmyk=64FLDGU=W41EXh5tdfQr1Lg83T8jiEA@mail.gmail.com>
In-Reply-To: <CAD=FV=VCbjRUxUsmyk=64FLDGU=W41EXh5tdfQr1Lg83T8jiEA@mail.gmail.com>
From: Abhishek Kumar <kuabhs@chromium.org>
Date: Mon, 7 Dec 2020 10:14:51 -0800
Message-ID: <CACTWRwsdVLGWfd28QHE5UnjETDcG4tPq+sXkK_Eu_yc_ThNwAQ@mail.gmail.com>
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
To: Doug Anderson <dianders@chromium.org>
Cc: netdev <netdev@vger.kernel.org>, Brian Norris <briannorris@chromium.org>, linux-wireless <linux-wireless@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>, Rakesh Pillai <pillair@codeaurora.org>, Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>

Hi,

> > (no changes since v1)
>
> I think you need to work on the method you're using to generate your
> patches.  There are most definitely changes since v1.  You described
> them in your cover letter (which you don't really need for a singleton
> patch) instead of here.
I agree, this was not intentional, I will fix this in the upcoming patches.

On Thu, Dec 3, 2020 at 7:34 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Thu, Dec 3, 2020 at 3:33 AM Rakesh Pillai <pillair@codeaurora.org> wrote:
> >
> > > What I'm trying to say is this.  Imagine that:
> > >
> > > a) the device tree has the "variant" property.
> > >
> > > b) the BRD file has two entries, one for "board-id" (1) and one for
> > > "board-id + chip-id" (2).  It doesn't have one for "board-id + chip-id
> > > + variant" (3).
> > >
> > > With your suggestion we'll see the "variant" property in the device
> > > tree.  That means we'll search for (1) and (3).  (3) isn't there, so
> > > we'll pick (1).  ...but we really should have picked (2), right?
> >
> > Do we expect board-2.bin to not be populated with the bdf with variant field (if its necessary ?)
>
> The whole fact that there is a fallback to begin with implies that
> there can be a mismatch between the board-2.bin and the device tree
> file.  Once we accept that there can be a mismatch, it seems good to
> try all 3 fallbacks in order.
>
> > Seems fine for me, if we have 2 fallback names if that is needed.
> OK, sounds good.  So hopefully Abhishek can post a v3 based on what's
> in <https://crrev.com/c/2556437> and you can confirm you're good with
> it there?
I agree, with this patch there can be mismatch between what's provided
in the Board file and what required board name we are generating, so
three calls are needed. So in a sense, we want to keep the V1 patch
with fix to reuse the same BDF.

I am making V3 changes and will address and push that out.

Thanks
Abhishek

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
