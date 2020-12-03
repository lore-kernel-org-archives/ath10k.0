Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vs1-xe41.google.com ([2607:f8b0:4864:20::e41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkqcV-0000fd-8U
 for ath10k@lists.infradead.org; Thu, 03 Dec 2020 15:34:12 +0000
Received: by mail-vs1-xe41.google.com with SMTP id u7so1436645vsq.11
 for <ath10k@lists.infradead.org>; Thu, 03 Dec 2020 07:34:08 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com.
 [209.85.217.48])
 by smtp.gmail.com with ESMTPSA id r126sm158474vsr.0.2020.12.03.07.34.05
 for <ath10k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Dec 2020 07:34:05 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id h6so1455736vsr.6
 for <ath10k@lists.infradead.org>; Thu, 03 Dec 2020 07:34:05 -0800 (PST)
MIME-Version: 1.0
References: <20201112200906.991086-1-kuabhs@chromium.org>
 <20201112200856.v2.1.Ia526132a366886e3b5cf72433d0d58bb7bb1be0f@changeid>
 <CAD=FV=XKCLgL6Bt+3KfqKByyP5fpwXOh6TNHXAoXkaQJRzjKjQ@mail.gmail.com>
 <002401d6c242$d78f2140$86ad63c0$@codeaurora.org>
 <CAD=FV=UnecON-M9eZVQePuNpdygN_E9OtLN495Xe1GL_PA94DQ@mail.gmail.com>
 <002d01d6c2dd$4386d880$ca948980$@codeaurora.org>
 <CAD=FV=WQPMnor3oTefDHd6JP6UmpyBo7UsOJ1Sg4Ly1otxr6hw@mail.gmail.com>
 <004301d6c968$12ef1b10$38cd5130$@codeaurora.org>
In-Reply-To: <004301d6c968$12ef1b10$38cd5130$@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 3 Dec 2020 07:33:52 -0800
Message-ID: <CAD=FV=VCbjRUxUsmyk=64FLDGU=W41EXh5tdfQr1Lg83T8jiEA@mail.gmail.com>
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

On Thu, Dec 3, 2020 at 3:33 AM Rakesh Pillai <pillair@codeaurora.org> wrote:
>
> > What I'm trying to say is this.  Imagine that:
> >
> > a) the device tree has the "variant" property.
> >
> > b) the BRD file has two entries, one for "board-id" (1) and one for
> > "board-id + chip-id" (2).  It doesn't have one for "board-id + chip-id
> > + variant" (3).
> >
> > With your suggestion we'll see the "variant" property in the device
> > tree.  That means we'll search for (1) and (3).  (3) isn't there, so
> > we'll pick (1).  ...but we really should have picked (2), right?
>
> Do we expect board-2.bin to not be populated with the bdf with variant field (if its necessary ?)

The whole fact that there is a fallback to begin with implies that
there can be a mismatch between the board-2.bin and the device tree
file.  Once we accept that there can be a mismatch, it seems good to
try all 3 fallbacks in order.


> Seems fine for me, if we have 2 fallback names if that is needed.

OK, sounds good.  So hopefully Abhishek can post a v3 based on what's
in <https://crrev.com/c/2556437> and you can confirm you're good with
it there?

-Doug

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
