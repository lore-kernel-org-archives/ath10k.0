Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pg1-f195.google.com ([209.85.215.195])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jcFa3-0006N4-2f
 for ath10k@lists.infradead.org; Fri, 22 May 2020 21:51:52 +0000
Received: by mail-pg1-f195.google.com with SMTP id p21so5605059pgm.13
 for <ath10k@lists.infradead.org>; Fri, 22 May 2020 14:51:48 -0700 (PDT)
Date: Fri, 22 May 2020 21:51:45 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: [RFC 1/2] devlink: add simple fw crash helpers
Message-ID: <20200522215145.GC11244@42.do-not-panic.com>
References: <20200519010530.GS11244@42.do-not-panic.com>
 <20200519211531.3702593-1-kuba@kernel.org>
 <20200522052046.GY11244@42.do-not-panic.com>
 <20200522101738.1495f4cc@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <2e5199edb433c217c7974ef7408ff8c7253145b6.camel@sipsolutions.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2e5199edb433c217c7974ef7408ff8c7253145b6.camel@sipsolutions.net>
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
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, aquini@redhat.com, peterz@infradead.org, daniel.vetter@ffwll.ch, mchehab+samsung@kernel.org, will@kernel.org, greearb@candelatech.com, bhe@redhat.com, briannorris@chromium.org, ath10k@lists.infradead.org, derosier@gmail.com, tiwai@suse.de, mingo@redhat.com, Jakub Kicinski <kuba@kernel.org>, dyoung@redhat.com, pmladek@suse.com, jiri@resnulli.us, keescook@chromium.org, arnd@arndb.de, gpiccoli@canonical.com, rostedt@goodmis.org, cai@lca.pw, tglx@linutronix.de, andriy.shevchenko@linux.intel.com, kvalo@codeaurora.org, netdev@vger.kernel.org, schlad@suse.de, linux-kernel@vger.kernel.org, jeyu@kernel.org, akpm@linux-foundation.org, davem@davemloft.net

On Fri, May 22, 2020 at 10:46:07PM +0200, Johannes Berg wrote:
> FWIW, I still completely disagree on that taint. You (Luis) obviously
> have been running into a bug in that driver, I doubt the firmware
> actually managed to wedge the hardware.

This hasn't happened just once, its happed many times sporadically now,
once a week or two weeks I'd say. And the system isn't being moved
around.

> But even if it did, that's still not really a kernel taint. The kernel
> itself isn't in any way affected by this.

Of course it is, a full reboot is required.

> Yes, the system is in a weird state now. But that's *not* equivalent to
> "kernel tainted".

Requiring a full reboot is a dire situation to be in, and loosing
connectivity to the point this is not recoverable likewise.

You guys are making out a taint to be the end of the world. We have a
taint even for a kernel warning, and as others have mentioned mac80211
already produces these.

What exactly is the opposition to a taint to clarify that a device
firmware has crashed and your system requires a full reboot?

  Luis

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
