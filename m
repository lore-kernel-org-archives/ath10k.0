Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pj1-f65.google.com ([209.85.216.65])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jcHKn-0000PI-Kf
 for ath10k@lists.infradead.org; Fri, 22 May 2020 23:44:15 +0000
Received: by mail-pj1-f65.google.com with SMTP id k7so5662782pjs.5
 for <ath10k@lists.infradead.org>; Fri, 22 May 2020 16:44:12 -0700 (PDT)
Date: Fri, 22 May 2020 23:44:09 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: [RFC 1/2] devlink: add simple fw crash helpers
Message-ID: <20200522234409.GH11244@42.do-not-panic.com>
References: <20200519010530.GS11244@42.do-not-panic.com>
 <20200519211531.3702593-1-kuba@kernel.org>
 <20200522052046.GY11244@42.do-not-panic.com>
 <20200522101738.1495f4cc@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <2e5199edb433c217c7974ef7408ff8c7253145b6.camel@sipsolutions.net>
 <20200522215145.GC11244@42.do-not-panic.com>
 <CALLGbR+QPcECtJbYmzztV_Qysc5qtwujT_qc785zvhZMCH50fg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALLGbR+QPcECtJbYmzztV_Qysc5qtwujT_qc785zvhZMCH50fg@mail.gmail.com>
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
To: Steve deRosier <derosier@gmail.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, aquini@redhat.com, peterz@infradead.org, Daniel Vetter <daniel.vetter@ffwll.ch>, mchehab+samsung@kernel.org, will@kernel.org, Ben Greear <greearb@candelatech.com>, bhe@redhat.com, briannorris@chromium.org, ath10k@lists.infradead.org, Takashi Iwai <tiwai@suse.de>, mingo@redhat.com, Jakub Kicinski <kuba@kernel.org>, dyoung@redhat.com, pmladek@suse.com, jiri@resnulli.us, Kees Cook <keescook@chromium.org>, arnd@arndb.de, gpiccoli@canonical.com, rostedt@goodmis.org, cai@lca.pw, tglx@linutronix.de, andriy.shevchenko@linux.intel.com, Johannes Berg <johannes@sipsolutions.net>, Kalle Valo <kvalo@codeaurora.org>, Network Development <netdev@vger.kernel.org>, schlad@suse.de, LKML <linux-kernel@vger.kernel.org>, jeyu@kernel.org, akpm@linux-foundation.org, "David S. Miller" <davem@davemloft.net>

On Fri, May 22, 2020 at 04:23:55PM -0700, Steve deRosier wrote:
> Specifically, I don't think we should set a taint flag when a driver
> easily handles a routine firmware crash and is confident that things
> have come up just fine again. In other words, triggering the taint in
> every driver module where it spits out a log comment that it had a
> firmware crash and had to recover seems too much. Sure, firmware
> shouldn't crash, sure it should be open source so we can fix it,
> whatever... those sort of wishful comments simply ignore reality and
> our ability to affect effective change. A lot of WiFi firmware crashes
> and for well-known cases the drivers handle them well. And in some
> cases, not so well and that should be a place the driver should detect
> and thus raise a red flag.  If a WiFi firmware crash can bring down
> the kernel, there's either a major driver bug or some very funky
> hardware crap going on. That sort of thing we should be able to
> detect, mark with a taint (or something), and fix if within our sphere
> of influence. I guess what it comes down to me is how aggressive we
> are about setting the flag.

Exactly the crux of the issue.

I hope that by now we should all be in agreement that at least a
firmware crash requiring a reboot is something we should record and
inform the user of. A taint seems like a reasonable standard practice
for these sorts of things.

> I would like there to be a single solution, or a minimized set
> depending on what makes sense for the requirements. I haven't had time
> to look into the alternatives mentioned here so I don't have an
> informed opinion about the solution. I do think Luis is trying to
> solve a real problem though. Can we look at this from the point of
> view of what are the requirements?  What is it we're trying to solve?
> 
> I _think_ that the goal of Luis's original proposal is to report up to
> the user, at some future point when the user is interested (because
> something super drastic just occured, but long after the fw crash),
> that there was a firmware crash without the user having to grep
> through all logs on the machine. And then if the user sees that flag
> and suspects it, then they can bother to find it in the logs or do
> more drastic debugging steps like finding the fw crash in the log and
> pulling firmware crash dumps, etc.

Yes, that's exactly it. Not all users are clueful to inspect logs. I now
have a generic uevent mechanism drafted which sends a uevent for *any*
taint. So that is, it does not even depend on this series. But it
accomplishes the goal of informing the user of taints.

> I think the various alternate solutions are great but perhaps solving
> a superset of features (like adding in user-space notifications etc)?
> Perhaps different people on these related threads are trying to solve
> different problems?

The uevent mechanism I implemented (but not yet posted for review) at
least sends out a smoke signal. I think that if each subsystem wants
to expand on this with dumping facilities that is great too!

  Luis

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
