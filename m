Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pj1-f67.google.com ([209.85.216.67])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jan9J-0000Ie-KE
 for ath10k@lists.infradead.org; Mon, 18 May 2020 21:18:15 +0000
Received: by mail-pj1-f67.google.com with SMTP id q24so423598pjd.1
 for <ath10k@lists.infradead.org>; Mon, 18 May 2020 14:18:12 -0700 (PDT)
Date: Mon, 18 May 2020 21:18:09 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: [PATCH v2 12/15] ath10k: use new module_firmware_crashed()
Message-ID: <20200518211809.GQ11244@42.do-not-panic.com>
References: <20200518165154.GH11244@42.do-not-panic.com>
 <4ad0668d-2de9-11d7-c3a1-ad2aedd0c02d@candelatech.com>
 <20200518170934.GJ11244@42.do-not-panic.com>
 <abf22ef3-93cb-61a4-0af2-43feac6d7930@candelatech.com>
 <20200518171801.GL11244@42.do-not-panic.com>
 <CALLGbR+ht2V3m5f-aUbdwEMOvbsX8ebmzdWgX4jyWTbpHrXZ0Q@mail.gmail.com>
 <20200518190930.GO11244@42.do-not-panic.com>
 <e3d978c8fa6a4075f12e843548d41e2c8ab537d1.camel@sipsolutions.net>
 <20200518195950.GP11244@42.do-not-panic.com>
 <bb0b9a2da99c16a28c1dbee93d08abfa2aecdc8b.camel@sipsolutions.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bb0b9a2da99c16a28c1dbee93d08abfa2aecdc8b.camel@sipsolutions.net>
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, aquini@redhat.com, peterz@infradead.org, daniel.vetter@ffwll.ch, mchehab+samsung@kernel.org, will@kernel.org, Ben Greear <greearb@candelatech.com>, bhe@redhat.com, ath10k@lists.infradead.org, Steve deRosier <derosier@gmail.com>, Takashi Iwai <tiwai@suse.de>, mingo@redhat.com, dyoung@redhat.com, pmladek@suse.com, keescook@chromium.org, arnd@arndb.de, gpiccoli@canonical.com, rostedt@goodmis.org, cai@lca.pw, tglx@linutronix.de, andriy.shevchenko@linux.intel.com, Kalle Valo <kvalo@codeaurora.org>, Network Development <netdev@vger.kernel.org>, schlad@suse.de, LKML <linux-kernel@vger.kernel.org>, jeyu@kernel.org, akpm@linux-foundation.org, "David S. Miller" <davem@davemloft.net>

On Mon, May 18, 2020 at 10:07:49PM +0200, Johannes Berg wrote:
> On Mon, 2020-05-18 at 19:59 +0000, Luis Chamberlain wrote:
> 
> > > Err, no. Those two are most definitely related. Have you looked at (most
> > > or some or whatever) staging drivers recently? Those contain all kinds
> > > of garbage that might do whatever with your kernel.
> > 
> > No, I stay away :)
> 
> :)
> 
> > > That's all fine, I just don't think it's appropriate to pretend that
> > > your kernel is now 'tainted' (think about the meaning of that word) when
> > > the firmware of some random device crashed.
> > 
> > If the firmware crash *does* require driver remove / addition again,
> > or a reboot, would you think that this is a situation that merits a taint?
> 
> Not really. In my experience, that's more likely a hardware issue (card
> not properly seated, for example) that a bus reset happens to "fix".
> 
> > > It's pretty clear, but even then, first of all I doubt this is the case
> > > for many of the places that you've sprinkled the annotation on,
> > 
> > We can remove it, for this driver I can vouch for its location as it did
> > reach a state where I required a reboot. And its not the first time this
> > has happened. This got me thinking about the bigger picture of the lack
> > of proper way to address these cases in the kernel, and how the user is
> > left dumbfounded.
> 
> Fair, so the driver is still broken wrt. recovery here. I still don't
> think that's a situation where e.g. the system should say "hey you have
> a taint here, if your graphics go bad now you should not report that
> bug" (which is effectively what the single taint bit does).

But again, let's think about the generic type of issue, and the
unexpected type of state that can be reached. The circumstance here
*does* lead to a case which is not recoverable. Now, consider how
many cases in the kernel where similar situations can happen and leave
the device or driver in a non-functional state.

> > > and secondly it actually hides useful information.
> > 
> > What is it hiding?
> 
> Most importantly, which device crashed. Secondarily I'd say how many
> times (*).

The device is implied by the module, the taint is applied to both.
If you had multiple devices, however, yes, it would not be possible
to distinguish from the taint which exact device it happened on.

So the only thing *generic* which would be left out is count.

> The information "firmware crashed" is really only useful in relation to
> the device.

If you have to reboot to get a functional network again then the device
is quite useless for many people, regardless of which device that
happened on.

But from a support perspective a sysfs interface which provides a tiny
bit more generic information indeed provides more value than a taint.

  Luis

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
