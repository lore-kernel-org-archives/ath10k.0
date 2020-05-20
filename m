Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbK9d-0006Bj-NG
 for ath10k@lists.infradead.org; Wed, 20 May 2020 08:32:47 +0000
Received: by mail-pg1-x544.google.com with SMTP id f4so1091042pgi.10
 for <ath10k@lists.infradead.org>; Wed, 20 May 2020 01:32:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200515212846.1347-1-mcgrof@kernel.org>
 <20200515212846.1347-13-mcgrof@kernel.org>
 <2b74a35c726e451b2fab2b5d0d301e80d1f4cdc7.camel@sipsolutions.net>
 <7306323c35e6f44d7c569e689b48f380f80da5e5.camel@sipsolutions.net>
 <CA+ASDXOg9oKeMJP1Mf42oCMMM3sVe0jniaWowbXVuaYZ=ZpDjQ@mail.gmail.com>
 <20200519140212.GT11244@42.do-not-panic.com>
 <CA+ASDXMUHOcvJ_7UWgyANMxSz15Ji7TcLDXVCtSPa+fOr=+FGA@mail.gmail.com>
 <CANUX_P1pnV46gOo0aL6QV0b+49ubB7C5nuUOuOfoT7aOM+ye9w@mail.gmail.com>
In-Reply-To: <CANUX_P1pnV46gOo0aL6QV0b+49ubB7C5nuUOuOfoT7aOM+ye9w@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 20 May 2020 11:32:32 +0300
Message-ID: <CAHp75VfOvABsQyxdy9j-On6pTunM1+uisoWQOmoNa7wLWJ+CSw@mail.gmail.com>
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
To: Emmanuel Grumbach <egrumbach@gmail.com>
Cc: aquini@redhat.com, "Peter Zijlstra (Intel)" <peterz@infradead.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Will Deacon <will@kernel.org>, schlad@suse.de, Baoquan He <bhe@redhat.com>, Brian Norris <briannorris@chromium.org>, ath10k@lists.infradead.org, Takashi Iwai <tiwai@suse.de>, Ingo Molnar <mingo@redhat.com>, Dave Young <dyoung@redhat.com>, Petr Mladek <pmladek@suse.com>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, gpiccoli@canonical.com, Steven Rostedt <rostedt@goodmis.org>, cai@lca.pw, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Kalle Valo <kvalo@codeaurora.org>, "<netdev@vger.kernel.org>" <netdev@vger.kernel.org>, linux-wireless <linux-wireless@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Jessica Yu <jeyu@kernel.org>, Johannes Berg <johannes@sipsolutions.net>, "David S. Miller" <davem@davemloft.net>

On Wed, May 20, 2020 at 8:40 AM Emmanuel Grumbach <egrumbach@gmail.com> wrote:

> Since I have been involved quite a bit in the firmware debugging
> features in iwlwifi, I think I can give a few insights here.
>
> But before this, we need to understand that there are several sources of issues:
> 1) the firmware may crash but the bus is still alive, you can still
> use the bus to get the crash data
> 2) the bus is dead, when that happens, the firmware might even be in a
> good condition, but since the bus is dead, you stop getting any
> information about the firmware, and then, at some point, you get to
> the conclusion that the firmware is dead. You can't get the crash data
> that resides on the other side of the bus (you may have gathered data
> in the DRAM directly, but that's a different thing), and you don't
> have much recovery to do besides re-starting the PCI enumeration.
>
> At Intel, we have seen both unfortunately. The bus issues are the ones
> that are trickier obviously. Trickier to detect (because you just get
> garbage from any request you issue on the bus), and trickier to
> handle. One can argue that the kernel should *not* handle those and
> let this in userspace hands. I guess it all depends on what component
> you ship to your customer and what you customer asks from you  :).

Or the two best approaches:
1) get rid of firmware completely;
2) make it OSS (like SOF).

I think any of these is a right thing to do in long-term perspective.

How many firmwares average computer has? 50? 100? Any of them is a
burden and PITA.

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
