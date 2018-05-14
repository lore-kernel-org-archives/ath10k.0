Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fIKmn-0004uw-Mo
 for ath10k@lists.infradead.org; Mon, 14 May 2018 21:13:39 +0000
Received: by mail-wm0-f65.google.com with SMTP id j4-v6so15934179wme.1
 for <ath10k@lists.infradead.org>; Mon, 14 May 2018 14:13:27 -0700 (PDT)
MIME-Version: 1.0
References: <1525110339-25326-1-git-send-email-srirrama@codeaurora.org>
 <1525110339-25326-3-git-send-email-srirrama@codeaurora.org>
 <CAJ-VmonSEuh7Ou=K9Gu-gZ5ikpX9H=nzXe9NssNu1vw8fEk3hg@mail.gmail.com>
 <87h8naqel1.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87h8naqel1.fsf@kamboji.qca.qualcomm.com>
From: Adrian Chadd <adrian@freebsd.org>
Date: Mon, 14 May 2018 14:13:13 -0700
Message-ID: <CAJ-VmomNrjdEZ+UCH5rmth=2yE9utfM3FUTEy2a0zpq0r44Zig@mail.gmail.com>
Subject: Re: [PATCH 2/2] ath10k: DFS Host Confirmation
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
Cc: linux-wireless@vger.kernel.org, srirrama@codeaurora.org, ath10k@lists.infradead.org

On Mon, 14 May 2018 at 11:25, Kalle Valo <kvalo@codeaurora.org> wrote:

> Adrian Chadd <adrian@freebsd.org> writes:

> > May we have a little more information about how this is supposed to
work?
> >
> > It looks like we're supposed to send the information about the matched
> > radar pattern back to the firmware for confirmation? What's the intended
> > behaviour from the firmware? Will the firmware have a hard-coded set of
> > patterns we have to answer in/by?

> That's really an implementation detail inside the firmware and from
> ath10k point of view we don't care what checks the firmware has, we just
> provide all the necessary information. The checks in firmware might even
> change in later releases.

> > I ask (like Peter, we work together) because we've had to tweak this
> > behaviour a little to actually pass FCC / ETSI DFS certification. My
> > general concern is that this'll cause a lot of false detects on boards
that
> > haven't had things tweaked for the given board. As far as I'm aware the
DFS
> > parameters are still hard-coded into the firmware image so if you have
to
> > change those you're SOL without the relevant NDAs - this makes running
the
> > open source DFS stuff a little tricksy on vendor boards.

> This shouldn't cause more false detections, the pattern detection from
> ath.ko is still used as before. The firmware will just disable DFS
> altogether if it thinks ath10k is not compliant.


Heh, well the fun one for production for us is "ok, so what's
non-compliant" ?

Eg - if it's 1 out of 100 that we don't hit the explicit timing
requirements because of the rest of the linux kernel (eg someone holds a
spinlock more than they should) then I'd prefer that we got a notification
that something happened so we can fix it. Otherwise in the field it'll just
be "hey, our stuff stopped working" because whatever the firmware
expectations are aren't being met.

Again, we're OK because we can at least inspect what's going on, but not
everyone doing ath10k development/deployment will be so lucky :(




-adrian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
