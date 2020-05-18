Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jam4F-0008NB-7g
 for ath10k@lists.infradead.org; Mon, 18 May 2020 20:08:56 +0000
Message-ID: <bb0b9a2da99c16a28c1dbee93d08abfa2aecdc8b.camel@sipsolutions.net>
Subject: Re: [PATCH v2 12/15] ath10k: use new module_firmware_crashed()
From: Johannes Berg <johannes@sipsolutions.net>
Date: Mon, 18 May 2020 22:07:49 +0200
In-Reply-To: <20200518195950.GP11244@42.do-not-panic.com>
 (sfid-20200518_215954_551733_20DE2085)
References: <20200515212846.1347-13-mcgrof@kernel.org>
 <2b74a35c726e451b2fab2b5d0d301e80d1f4cdc7.camel@sipsolutions.net>
 <20200518165154.GH11244@42.do-not-panic.com>
 <4ad0668d-2de9-11d7-c3a1-ad2aedd0c02d@candelatech.com>
 <20200518170934.GJ11244@42.do-not-panic.com>
 <abf22ef3-93cb-61a4-0af2-43feac6d7930@candelatech.com>
 <20200518171801.GL11244@42.do-not-panic.com>
 <CALLGbR+ht2V3m5f-aUbdwEMOvbsX8ebmzdWgX4jyWTbpHrXZ0Q@mail.gmail.com>
 <20200518190930.GO11244@42.do-not-panic.com>
 <e3d978c8fa6a4075f12e843548d41e2c8ab537d1.camel@sipsolutions.net>
 <20200518195950.GP11244@42.do-not-panic.com>
 (sfid-20200518_215954_551733_20DE2085)
MIME-Version: 1.0
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
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, aquini@redhat.com, peterz@infradead.org, daniel.vetter@ffwll.ch, mchehab+samsung@kernel.org, will@kernel.org, Ben Greear <greearb@candelatech.com>, bhe@redhat.com, ath10k@lists.infradead.org, Steve deRosier <derosier@gmail.com>, Takashi Iwai <tiwai@suse.de>, mingo@redhat.com, dyoung@redhat.com, pmladek@suse.com, keescook@chromium.org, arnd@arndb.de, gpiccoli@canonical.com, rostedt@goodmis.org, cai@lca.pw, tglx@linutronix.de, andriy.shevchenko@linux.intel.com, Kalle Valo <kvalo@codeaurora.org>, Network Development <netdev@vger.kernel.org>, schlad@suse.de, LKML <linux-kernel@vger.kernel.org>, jeyu@kernel.org, akpm@linux-foundation.org, "David S. Miller" <davem@davemloft.net>

On Mon, 2020-05-18 at 19:59 +0000, Luis Chamberlain wrote:

> > Err, no. Those two are most definitely related. Have you looked at (most
> > or some or whatever) staging drivers recently? Those contain all kinds
> > of garbage that might do whatever with your kernel.
> 
> No, I stay away :)

:)

> > That's all fine, I just don't think it's appropriate to pretend that
> > your kernel is now 'tainted' (think about the meaning of that word) when
> > the firmware of some random device crashed.
> 
> If the firmware crash *does* require driver remove / addition again,
> or a reboot, would you think that this is a situation that merits a taint?

Not really. In my experience, that's more likely a hardware issue (card
not properly seated, for example) that a bus reset happens to "fix".

> > It's pretty clear, but even then, first of all I doubt this is the case
> > for many of the places that you've sprinkled the annotation on,
> 
> We can remove it, for this driver I can vouch for its location as it did
> reach a state where I required a reboot. And its not the first time this
> has happened. This got me thinking about the bigger picture of the lack
> of proper way to address these cases in the kernel, and how the user is
> left dumbfounded.

Fair, so the driver is still broken wrt. recovery here. I still don't
think that's a situation where e.g. the system should say "hey you have
a taint here, if your graphics go bad now you should not report that
bug" (which is effectively what the single taint bit does).

> > and secondly it actually hides useful information.
> 
> What is it hiding?

Most importantly, which device crashed. Secondarily I'd say how many
times (*).

The information "firmware crashed" is really only useful in relation to
the device. If your graphics firmware crashed, yeah, well, you probably
won't even see this. If your USB wifi firmware crashed? Not really
interesting, you'll anyway just unplug. In fact it's very hard for a USB
driver (short of arbitrary memory corruption) to significantly mess up
the system.

johannes

(*) though if it crashed only once, was that because it was wedged
enough to be unusable afterwards, or because everything was fine?



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
