Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgBlY-0006xI-Oy
 for ath10k@lists.infradead.org; Tue, 02 Jun 2020 18:36:02 +0000
Received: by mail-lf1-x144.google.com with SMTP id z206so6791373lfc.6
 for <ath10k@lists.infradead.org>; Tue, 02 Jun 2020 11:36:00 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com.
 [209.85.167.42])
 by smtp.gmail.com with ESMTPSA id y9sm691293ljc.62.2020.06.02.11.35.56
 for <ath10k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2020 11:35:56 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id w15so6764346lfe.11
 for <ath10k@lists.infradead.org>; Tue, 02 Jun 2020 11:35:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200527165718.129307-1-briannorris@chromium.org>
 <CAGRGNgX5n=0OEi7hMrmgVZGD=orGpgvkyLrhmXVKSFYdBJ+eUw@mail.gmail.com>
 <CAJ-Vmomx0UFEa1w2HsGMQsZb+K8hyK=Zz9cKSo7tHv5GiMc1yw@mail.gmail.com>
In-Reply-To: <CAJ-Vmomx0UFEa1w2HsGMQsZb+K8hyK=Zz9cKSo7tHv5GiMc1yw@mail.gmail.com>
From: Brian Norris <briannorris@chromium.org>
Date: Tue, 2 Jun 2020 11:35:43 -0700
Message-ID: <CA+ASDXNicJmAKvkjD5mGFVQ+bmz8nHT_A1oqtjoS=spRSFP70A@mail.gmail.com>
Subject: Re: [PATCH] Revert "ath: add support for special 0x0 regulatory
 domain"
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
To: Adrian Chadd <adrian@freebsd.org>
Cc: Julian Calaby <julian.calaby@gmail.com>, linux-wireless <linux-wireless@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>, Wen Gong <wgong@codeaurora.org>

On Thu, May 28, 2020 at 8:42 AM Adrian Chadd <adrian@freebsd.org> wrote:
> On Thu, 28 May 2020 at 05:02, Julian Calaby <julian.calaby@gmail.com> wrote:
> > On Thu, May 28, 2020 at 5:18 AM Brian Norris <briannorris@chromium.org> wrote:
> > >
> > > This reverts commit 2dc016599cfa9672a147528ca26d70c3654a5423.
> > >
> > > Users are reporting regressions in regulatory domain detection and
> > > channel availability.
> > >
> > > The problem this was trying to resolve was fixed in firmware anyway:
> >
> > Should we tell the user their firmware needs to be upgraded if it
> > reports this regulatory domain instead of completely dropping support
> > for it?

I'm not really sure how to do that properly in general, and I don't
plan to do so. I'm simply reverting a change that caused people
problems, and noting at the same time that the original problem was
resolved differently.

I don't really have a stake in this patch, because everything I care
about works correctly either way. (And AFAICT, any hardware that is
affected by this patch is somewhat broken.) I'm only posting the
revert as a community service, because Wen couldn't be bothered to do
it himself.

> Also that commit mentioned a 6174 firmware, but what about all the other older chips with a regulatory domain of 0x0 ?

My understanding was that no QCA modules *should* be shipped with a
value of 0 in this field. The instance I'm aware of was more or less a
manufacturing error I think, and we got Qualcomm to patch it over in
software. I don't think people expected anybody else to have shipped
modules with a 0 value, but apparently they did. I don't know what to
do with those, other than just leave well enough alone (i.e., $subject
revert).

> As a side note, I'd /really appreciate/ if ath10k changes were tested on a variety of ath10k hardware and firmware revisions, rather than just either the Rome or embedded radios, rather than also including peregrine, cascade, besra, etc.

Wouldn't we all love it if everybody else tested appropriately. But
Qualcomm folks can't be coordinated (trust me, I've tried), and apart
from things like KernelCI (which so far has no WiFi tests, IIUC),
there's no community testing efforts that don't involve
"${RANDOM_PERSON} boots ${PERSONAL_BOX} and see if it blows up."

This also might not be the best place to admit it, but I'll be up
front: I have no idea what peregrine, cascade, or besra are.

Brian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
