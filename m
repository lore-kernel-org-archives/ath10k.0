Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jd95R-0007qy-Ir
 for ath10k@lists.infradead.org; Mon, 25 May 2020 09:07:59 +0000
Date: Mon, 25 May 2020 12:07:49 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [RFC 1/2] devlink: add simple fw crash helpers
Message-ID: <20200525090749.GJ1634618@smile.fi.intel.com>
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, aquini@redhat.com, peterz@infradead.org, Daniel Vetter <daniel.vetter@ffwll.ch>, mchehab+samsung@kernel.org, will@kernel.org, Ben Greear <greearb@candelatech.com>, bhe@redhat.com, briannorris@chromium.org, ath10k@lists.infradead.org, Takashi Iwai <tiwai@suse.de>, mingo@redhat.com, Jakub Kicinski <kuba@kernel.org>, dyoung@redhat.com, pmladek@suse.com, jiri@resnulli.us, Kees Cook <keescook@chromium.org>, arnd@arndb.de, gpiccoli@canonical.com, rostedt@goodmis.org, cai@lca.pw, tglx@linutronix.de, Johannes Berg <johannes@sipsolutions.net>, Kalle Valo <kvalo@codeaurora.org>, Network Development <netdev@vger.kernel.org>, schlad@suse.de, LKML <linux-kernel@vger.kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, jeyu@kernel.org, akpm@linux-foundation.org, "David S. Miller" <davem@davemloft.net>

On Fri, May 22, 2020 at 04:23:55PM -0700, Steve deRosier wrote:
> On Fri, May 22, 2020 at 2:51 PM Luis Chamberlain <mcgrof@kernel.org> wrote:

> I had to go RTFM re: kernel taints because it has been a very long
> time since I looked at them. It had always seemed to me that most were
> caused by "kernel-unfriendly" user actions.  The most famous of course
> is loading proprietary modules, out-of-tree modules, forced module
> loads, etc...  Honestly, I had forgotten the large variety of uses of
> the taint flags. For anyone who hasn't looked at taints recently, I
> recommend: https://www.kernel.org/doc/html/latest/admin-guide/tainted-kernels.html
> 
> In light of this I don't object to setting a taint on this anymore.
> I'm a little uneasy, but I've softened on it now, and now I feel it
> depends on implementation.
> 
> Specifically, I don't think we should set a taint flag when a driver
> easily handles a routine firmware crash and is confident that things
> have come up just fine again. In other words, triggering the taint in
> every driver module where it spits out a log comment that it had a
> firmware crash and had to recover seems too much. Sure, firmware
> shouldn't crash, sure it should be open source so we can fix it,
> whatever...

While it may sound idealistic the firmware for the end-user, and even for mere
kernel developer like me, is a complete blackbox which has more access than
root user in the kernel. We have tons of firmwares and each of them potentially
dangerous beast. As a user I really care about my data and privacy (hacker can
oops a firmware in order to set a specific vector attack). So, tainting kernel
is _a least_ we can do there, the strict rules would be to reboot immediately.

> those sort of wishful comments simply ignore reality and
> our ability to affect effective change.

We can encourage users not to buy cheap crap for the starter.

> A lot of WiFi firmware crashes
> and for well-known cases the drivers handle them well. And in some
> cases, not so well and that should be a place the driver should detect
> and thus raise a red flag.  If a WiFi firmware crash can bring down
> the kernel, there's either a major driver bug or some very funky
> hardware crap going on. That sort of thing we should be able to
> detect, mark with a taint (or something), and fix if within our sphere
> of influence. I guess what it comes down to me is how aggressive we
> are about setting the flag.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
