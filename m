Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jamPi-0006Qm-Tk
 for ath10k@lists.infradead.org; Mon, 18 May 2020 20:31:08 +0000
Message-ID: <8d7a3bed242ac9d3ec55a4c97e008081230f1f6d.camel@sipsolutions.net>
Subject: Re: [PATCH v2 12/15] ath10k: use new module_firmware_crashed()
From: Johannes Berg <johannes@sipsolutions.net>
Date: Mon, 18 May 2020 22:29:53 +0200
In-Reply-To: <20200518132828.553159d9@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
References: <20200515212846.1347-1-mcgrof@kernel.org>
 <20200515212846.1347-13-mcgrof@kernel.org>
 <2b74a35c726e451b2fab2b5d0d301e80d1f4cdc7.camel@sipsolutions.net>
 <20200518165154.GH11244@42.do-not-panic.com>
 <4ad0668d-2de9-11d7-c3a1-ad2aedd0c02d@candelatech.com>
 <20200518170934.GJ11244@42.do-not-panic.com>
 <abf22ef3-93cb-61a4-0af2-43feac6d7930@candelatech.com>
 <20200518171801.GL11244@42.do-not-panic.com>
 <CALLGbR+ht2V3m5f-aUbdwEMOvbsX8ebmzdWgX4jyWTbpHrXZ0Q@mail.gmail.com>
 <20200518190930.GO11244@42.do-not-panic.com>
 <e3d978c8fa6a4075f12e843548d41e2c8ab537d1.camel@sipsolutions.net>
 <20200518132828.553159d9@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
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
To: Jakub Kicinski <kuba@kernel.org>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, aquini@redhat.com, peterz@infradead.org, daniel.vetter@ffwll.ch, mchehab+samsung@kernel.org, will@kernel.org, Ben Greear <greearb@candelatech.com>, bhe@redhat.com, ath10k@lists.infradead.org, Steve deRosier <derosier@gmail.com>, Takashi Iwai <tiwai@suse.de>, mingo@redhat.com, dyoung@redhat.com, pmladek@suse.com, keescook@chromium.org, arnd@arndb.de, gpiccoli@canonical.com, rostedt@goodmis.org, cai@lca.pw, tglx@linutronix.de, andriy.shevchenko@linux.intel.com, Kalle Valo <kvalo@codeaurora.org>, Network Development <netdev@vger.kernel.org>, schlad@suse.de, LKML <linux-kernel@vger.kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, jeyu@kernel.org, akpm@linux-foundation.org, "David S.
 Miller" <davem@davemloft.net>

On Mon, 2020-05-18 at 13:28 -0700, Jakub Kicinski wrote:
> On Mon, 18 May 2020 21:25:09 +0200 Johannes Berg wrote:
> > It's pretty clear, but even then, first of all I doubt this is the case
> > for many of the places that you've sprinkled the annotation on, and
> > secondly it actually hides useful information.
> > 
> > Regardless of the support issue, I think this hiding of information is
> > also problematic.
> > 
> > I really think we'd all be better off if you just made a sysfs file (I
> > mistyped debugfs in some other email, sorry, apparently you didn't see
> > the correction in time) that listed which device(s) crashed and how many
> > times. That would actually be useful. Because honestly, if a random
> > device crashed for some random reason, that's pretty much a non-event.
> > If it keeps happening, then we might even want to know about it.
> 
> Johannes - have you seen devlink health? I think we should just use
> that interface, since it supports all the things you're requesting,
> rather than duplicate it in sysfs.

I haven't, and I'm glad to hear that's there, sounds good!

I suspect that Luis wants something more generic though, that isn't just
applicable to netdevices, unless devlink grew some kind of non-netdev
stuff while I wasn't looking? :)

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
