Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vs1-xe44.google.com ([2607:f8b0:4864:20::e44])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbzze-0007k2-FQ
 for ath10k@lists.infradead.org; Fri, 22 May 2020 05:13:16 +0000
Received: by mail-vs1-xe44.google.com with SMTP id 62so5412546vsi.2
 for <ath10k@lists.infradead.org>; Thu, 21 May 2020 22:13:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200515212846.1347-1-mcgrof@kernel.org>
 <20200515212846.1347-13-mcgrof@kernel.org>
 <2b74a35c726e451b2fab2b5d0d301e80d1f4cdc7.camel@sipsolutions.net>
 <7306323c35e6f44d7c569e689b48f380f80da5e5.camel@sipsolutions.net>
 <CA+ASDXOg9oKeMJP1Mf42oCMMM3sVe0jniaWowbXVuaYZ=ZpDjQ@mail.gmail.com>
 <20200519140212.GT11244@42.do-not-panic.com>
 <CA+ASDXMUHOcvJ_7UWgyANMxSz15Ji7TcLDXVCtSPa+fOr=+FGA@mail.gmail.com>
 <CANUX_P1pnV46gOo0aL6QV0b+49ubB7C5nuUOuOfoT7aOM+ye9w@mail.gmail.com>
 <CA+ASDXPAVJwyThAXRQT0_ao4s1nDYOEQifxMc+JsEMa=cTEGJA@mail.gmail.com>
In-Reply-To: <CA+ASDXPAVJwyThAXRQT0_ao4s1nDYOEQifxMc+JsEMa=cTEGJA@mail.gmail.com>
From: Emmanuel Grumbach <egrumbach@gmail.com>
Date: Fri, 22 May 2020 08:12:59 +0300
Message-ID: <CANUX_P2thzh9oB4KkrAoyT6H-E6MDFUNQ_p0e9QZtScgMuKm7Q@mail.gmail.com>
Subject: Re: [PATCH v2 12/15] ath10k: use new module_firmware_crashed()
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
To: Brian Norris <briannorris@chromium.org>
Cc: aquini@redhat.com, peterz@infradead.org, Daniel Vetter <daniel.vetter@ffwll.ch>, mchehab+samsung@kernel.org, will@kernel.org, schlad@suse.de, bhe@redhat.com, ath10k@lists.infradead.org, Takashi Iwai <tiwai@suse.de>, mingo@redhat.com, dyoung@redhat.com, pmladek@suse.com, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, gpiccoli@canonical.com, Steven Rostedt <rostedt@goodmis.org>, cai@lca.pw, tglx@linutronix.de, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Kalle Valo <kvalo@codeaurora.org>, "<netdev@vger.kernel.org>" <netdev@vger.kernel.org>, linux-wireless <linux-wireless@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, jeyu@kernel.org, Johannes Berg <johannes@sipsolutions.net>, "David S. Miller" <davem@davemloft.net>

>
> On Tue, May 19, 2020 at 10:37 PM Emmanuel Grumbach <egrumbach@gmail.com> wrote:
> > So I believe we already have this uevent, it is the devcoredump. All
> > we need is to add the unique id.
>
> I think there are a few reasons that devcoredump doesn't satisfy what
> either Luis or I want.
>
> 1) it can be disabled entirely [1], for good reasons (e.g., think of
> non-${CHIP_VENDOR} folks, who can't (and don't want to) do anything
> with the opaque dumps provided by closed-source firmware)

Ok, if all you're interested into is the information that this event
happen (as opposed to report a bug and providing the data), then I
agree. True, not everybody want or can enable devcoredump. I am just a
bit concerned that we may end up with two interface that notify the
same event basically. The ideal maybe would be to be able to
optionally reduce the content of the devoredump to nothing more that
is already in the dmesg output. But then, it is not what it is meant
to be: namely, a core dump..

> 2) not all drivers necessarily have a useful dump to provide when
> there's a crash; look at the rest of Luis's series to see the kinds of
> drivers-with-firmware that are crashing, some of which aren't dumping
> anything

Fair enouh.

> 3) for those that do support devcoredump, it may be used for purposes
> that are not "crashes" -- e.g., some provide debugfs or other knobs to
> initiate dumps, for diagnostic or debugging purposes

Not sure I really think we need to care about those cases, but you
already have 2 good arguments :)

>
> Brian
>
> [1] devcd_disabled
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/base/devcoredump.c?h=v5.6#n22

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
