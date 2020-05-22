Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jcEZg-0000YO-MP
 for ath10k@lists.infradead.org; Fri, 22 May 2020 20:47:25 +0000
Message-ID: <2e5199edb433c217c7974ef7408ff8c7253145b6.camel@sipsolutions.net>
Subject: Re: [RFC 1/2] devlink: add simple fw crash helpers
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 22 May 2020 22:46:07 +0200
In-Reply-To: <20200522101738.1495f4cc@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
References: <20200519010530.GS11244@42.do-not-panic.com>
 <20200519211531.3702593-1-kuba@kernel.org>
 <20200522052046.GY11244@42.do-not-panic.com>
 <20200522101738.1495f4cc@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
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
To: Jakub Kicinski <kuba@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>
Cc: linux-wireless@vger.kernel.org, aquini@redhat.com, peterz@infradead.org, daniel.vetter@ffwll.ch, mchehab+samsung@kernel.org, will@kernel.org, greearb@candelatech.com, bhe@redhat.com, briannorris@chromium.org, ath10k@lists.infradead.org, derosier@gmail.com, tiwai@suse.de, mingo@redhat.com, dyoung@redhat.com, pmladek@suse.com, jiri@resnulli.us, keescook@chromium.org, arnd@arndb.de, gpiccoli@canonical.com, rostedt@goodmis.org, cai@lca.pw, tglx@linutronix.de, andriy.shevchenko@linux.intel.com, kvalo@codeaurora.org, netdev@vger.kernel.org, schlad@suse.de, linux-kernel@vger.kernel.org, jeyu@kernel.org, akpm@linux-foundation.org, davem@davemloft.net

On Fri, 2020-05-22 at 10:17 -0700, Jakub Kicinski wrote:

> > > --- a/net/core/Makefile
> > > +++ b/net/core/Makefile
> > > @@ -31,7 +31,7 @@ obj-$(CONFIG_LWTUNNEL_BPF) += lwt_bpf.o
> > >  obj-$(CONFIG_BPF_STREAM_PARSER) += sock_map.o
> > >  obj-$(CONFIG_DST_CACHE) += dst_cache.o
> > >  obj-$(CONFIG_HWBM) += hwbm.o
> > > -obj-$(CONFIG_NET_DEVLINK) += devlink.o
> > > +obj-$(CONFIG_NET_DEVLINK) += devlink.o devlink_simple_fw_reporter.o  
> > 
> > This was looking super sexy up to here. This is networking specific.
> > We want something generic for *anything* that requests firmware.
> 
> You can't be serious. It's network specific because of how the Kconfig
> is named?

Wait, yeah, what?

> Working for a company operating large data centers I would strongly
> prefer if we didn't have ten different ways of reporting firmware
> problems in the fleet.

Agree. I don't actually operate anything, but still ...

Thinking about this - maybe there's a way to still combine devcoredump
and devlink somehow?

Or (optionally) make devlink trigger devcoredump while userspace
migrates?

> > So networking may want to be aware that a firmware crash happened as
> > part of this network device health thing, but firmware crashing is a
> > generic thing.
> > 
> > I have now extended my patch set to include uvents and I am more set on
> > that we need the taint now more than ever.

FWIW, I still completely disagree on that taint. You (Luis) obviously
have been running into a bug in that driver, I doubt the firmware
actually managed to wedge the hardware.

But even if it did, that's still not really a kernel taint. The kernel
itself isn't in any way affected by this.

Yes, the system is in a weird state now. But that's *not* equivalent to
"kernel tainted".

> The irony is you have a problem with a networking device and all the
> devices your initial set touched are networking. Two of the drivers 
> you touched either have or will soon have devlink health reporters
> implemented.

Like I said above, do you think it'd be feasible to make a devcoredump
out of devlink health reports? And can the report be in a way that we
control the file format, or are there limits? I guess I should read the
code to find out, but I figure you probably just know. But feel free to
tell me to read it :)

The reason I'm asking is that it's starting to sound like we really
ought to be implementing devlink, but we've got a bunch of
infrastructure that uses the devcoredump, and it'll take time
(significantly so) to change all that...

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
