Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pl1-f194.google.com ([209.85.214.194])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jaize-0000UH-LS
 for ath10k@lists.infradead.org; Mon, 18 May 2020 16:51:59 +0000
Received: by mail-pl1-f194.google.com with SMTP id k19so4451024pll.9
 for <ath10k@lists.infradead.org>; Mon, 18 May 2020 09:51:57 -0700 (PDT)
Date: Mon, 18 May 2020 16:51:54 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: [PATCH v2 12/15] ath10k: use new module_firmware_crashed()
Message-ID: <20200518165154.GH11244@42.do-not-panic.com>
References: <20200515212846.1347-1-mcgrof@kernel.org>
 <20200515212846.1347-13-mcgrof@kernel.org>
 <2b74a35c726e451b2fab2b5d0d301e80d1f4cdc7.camel@sipsolutions.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2b74a35c726e451b2fab2b5d0d301e80d1f4cdc7.camel@sipsolutions.net>
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
Cc: linux-wireless@vger.kernel.org, aquini@redhat.com, peterz@infradead.org, daniel.vetter@ffwll.ch, mchehab+samsung@kernel.org, will@kernel.org, bhe@redhat.com, ath10k@lists.infradead.org, tiwai@suse.de, mingo@redhat.com, dyoung@redhat.com, pmladek@suse.com, keescook@chromium.org, arnd@arndb.de, gpiccoli@canonical.com, rostedt@goodmis.org, cai@lca.pw, tglx@linutronix.de, andriy.shevchenko@linux.intel.com, kvalo@codeaurora.org, netdev@vger.kernel.org, schlad@suse.de, linux-kernel@vger.kernel.org, jeyu@kernel.org, akpm@linux-foundation.org, davem@davemloft.net

On Sat, May 16, 2020 at 03:24:01PM +0200, Johannes Berg wrote:
> On Fri, 2020-05-15 at 21:28 +0000, Luis Chamberlain wrote:> module_firmware_crashed
> 
> You didn't CC me or the wireless list on the rest of the patches, so I'm
> replying to a random one, but ...
> 
> What is the point here?
> 
> This should in no way affect the integrity of the system/kernel, for
> most devices anyway.

Keyword you used here is "most device". And in the worst case, *who*
knows what other odd things may happen afterwards.

> So what if ath10k's firmware crashes? If there's a driver bug it will
> not handle it right (and probably crash, WARN_ON, or something else),
> but if the driver is working right then that will not affect the kernel
> at all.

Sometimes the device can go into a state which requires driver removal
and addition to get things back up.

> So maybe I can understand that maybe you want an easy way to discover -
> per device - that the firmware crashed, but that still doesn't warrant a
> complete kernel taint.

That is one reason, another is that a taint helps support cases *fast*
easily detect if the issue was a firmware crash, instead of scraping
logs for driver specific ways to say the firmware has crashed.

> Instead of the kernel taint, IMHO you should provide an annotation in
> sysfs (or somewhere else) for the *struct device* that had its firmware
> crash.

It would seem the way some folks are thinking about getting more details
would be through devlink.

> Or maybe, if it's too complex to walk the entire hierarchy
> checking for that, have a uevent,  or add the ability for the kernel to
> print out elsewhere in debugfs the list of devices that crashed at some
> point... All of that is fine, but a kernel taint?

debugfs is optional, a taint is simple, and device agnostic. From a
support perspective it is very easy to see if a possible issue may
be device firmware specific.

  Luis

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
