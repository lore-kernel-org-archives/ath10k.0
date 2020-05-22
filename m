Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pj1-f67.google.com ([209.85.216.67])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jc0A2-00053w-CR
 for ath10k@lists.infradead.org; Fri, 22 May 2020 05:23:59 +0000
Received: by mail-pj1-f67.google.com with SMTP id z15so1894926pjb.0
 for <ath10k@lists.infradead.org>; Thu, 21 May 2020 22:23:58 -0700 (PDT)
Date: Fri, 22 May 2020 05:23:55 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: [PATCH v2 12/15] ath10k: use new module_firmware_crashed()
Message-ID: <20200522052355.GZ11244@42.do-not-panic.com>
References: <20200515212846.1347-1-mcgrof@kernel.org>
 <20200515212846.1347-13-mcgrof@kernel.org>
 <2b74a35c726e451b2fab2b5d0d301e80d1f4cdc7.camel@sipsolutions.net>
 <7306323c35e6f44d7c569e689b48f380f80da5e5.camel@sipsolutions.net>
 <CA+ASDXOg9oKeMJP1Mf42oCMMM3sVe0jniaWowbXVuaYZ=ZpDjQ@mail.gmail.com>
 <20200519140212.GT11244@42.do-not-panic.com>
 <CA+ASDXMUHOcvJ_7UWgyANMxSz15Ji7TcLDXVCtSPa+fOr=+FGA@mail.gmail.com>
 <CANUX_P1pnV46gOo0aL6QV0b+49ubB7C5nuUOuOfoT7aOM+ye9w@mail.gmail.com>
 <CA+ASDXPAVJwyThAXRQT0_ao4s1nDYOEQifxMc+JsEMa=cTEGJA@mail.gmail.com>
 <CANUX_P2thzh9oB4KkrAoyT6H-E6MDFUNQ_p0e9QZtScgMuKm7Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANUX_P2thzh9oB4KkrAoyT6H-E6MDFUNQ_p0e9QZtScgMuKm7Q@mail.gmail.com>
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
To: Emmanuel Grumbach <egrumbach@gmail.com>
Cc: aquini@redhat.com, peterz@infradead.org, Daniel Vetter <daniel.vetter@ffwll.ch>, mchehab+samsung@kernel.org, will@kernel.org, schlad@suse.de, bhe@redhat.com, Brian Norris <briannorris@chromium.org>, ath10k@lists.infradead.org, Takashi Iwai <tiwai@suse.de>, mingo@redhat.com, dyoung@redhat.com, pmladek@suse.com, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, gpiccoli@canonical.com, Steven Rostedt <rostedt@goodmis.org>, cai@lca.pw, tglx@linutronix.de, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Kalle Valo <kvalo@codeaurora.org>, "<netdev@vger.kernel.org>" <netdev@vger.kernel.org>, linux-wireless <linux-wireless@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, jeyu@kernel.org, Johannes Berg <johannes@sipsolutions.net>, "David S. Miller" <davem@davemloft.net>

On Fri, May 22, 2020 at 08:12:59AM +0300, Emmanuel Grumbach wrote:
> >
> > On Tue, May 19, 2020 at 10:37 PM Emmanuel Grumbach <egrumbach@gmail.com> wrote:
> > > So I believe we already have this uevent, it is the devcoredump. All
> > > we need is to add the unique id.
> >
> > I think there are a few reasons that devcoredump doesn't satisfy what
> > either Luis or I want.
> >
> > 1) it can be disabled entirely [1], for good reasons (e.g., think of
> > non-${CHIP_VENDOR} folks, who can't (and don't want to) do anything
> > with the opaque dumps provided by closed-source firmware)
> 
> Ok, if all you're interested into is the information that this event
> happen (as opposed to report a bug and providing the data), then I
> agree. 

I've now hit again a firmware crash with ath10k with the latest firwmare
and kernel and the *only* thing that helped recovery was a full reboot,
so that is a crystal clear case that this needs to taint the kernel, and
yes we do want to inform users too, so I've just added uevent support
for a few panic / taint events in the kernel now and rolled into my
series. I'll run some final tests and then post this as a follow up.

devlink didn't cut it, its networking specific.

  Luis

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
