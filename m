Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jcBIk-0004yy-Un
 for ath10k@lists.infradead.org; Fri, 22 May 2020 17:17:44 +0000
Date: Fri, 22 May 2020 10:17:38 -0700
From: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [RFC 1/2] devlink: add simple fw crash helpers
Message-ID: <20200522101738.1495f4cc@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20200522052046.GY11244@42.do-not-panic.com>
References: <20200519010530.GS11244@42.do-not-panic.com>
 <20200519211531.3702593-1-kuba@kernel.org>
 <20200522052046.GY11244@42.do-not-panic.com>
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
Cc: linux-wireless@vger.kernel.org, aquini@redhat.com, peterz@infradead.org, daniel.vetter@ffwll.ch, mchehab+samsung@kernel.org, will@kernel.org, greearb@candelatech.com, bhe@redhat.com, briannorris@chromium.org, ath10k@lists.infradead.org, derosier@gmail.com, tiwai@suse.de, mingo@redhat.com, dyoung@redhat.com, pmladek@suse.com, jiri@resnulli.us, keescook@chromium.org, arnd@arndb.de, gpiccoli@canonical.com, rostedt@goodmis.org, cai@lca.pw, tglx@linutronix.de, andriy.shevchenko@linux.intel.com, johannes@sipsolutions.net, kvalo@codeaurora.org, netdev@vger.kernel.org, schlad@suse.de, linux-kernel@vger.kernel.org, jeyu@kernel.org, akpm@linux-foundation.org, davem@davemloft.net

On Fri, 22 May 2020 05:20:46 +0000 Luis Chamberlain wrote:
> > diff --git a/net/core/Makefile b/net/core/Makefile
> > index 3e2c378e5f31..6f1513781c17 100644
> > --- a/net/core/Makefile
> > +++ b/net/core/Makefile
> > @@ -31,7 +31,7 @@ obj-$(CONFIG_LWTUNNEL_BPF) += lwt_bpf.o
> >  obj-$(CONFIG_BPF_STREAM_PARSER) += sock_map.o
> >  obj-$(CONFIG_DST_CACHE) += dst_cache.o
> >  obj-$(CONFIG_HWBM) += hwbm.o
> > -obj-$(CONFIG_NET_DEVLINK) += devlink.o
> > +obj-$(CONFIG_NET_DEVLINK) += devlink.o devlink_simple_fw_reporter.o  
> 
> This was looking super sexy up to here. This is networking specific.
> We want something generic for *anything* that requests firmware.

You can't be serious. It's network specific because of how the Kconfig
is named?

Working for a company operating large data centers I would strongly
prefer if we didn't have ten different ways of reporting firmware
problems in the fleet.

> I'm afraid this won't work for something generic. I don't think its
> throw-away work though, the idea to provide a generic interface to
> dump firmware through netlink might be nice for networking, or other
> things.
> 
> But I have a feeling we'll want something still more generic than this.

Please be specific. Saying generic a lot is not helpful. The code (as
you can see in this patch) is in no way network specific. Or are you
saying there are machines out there running without netlink sockets?

> So networking may want to be aware that a firmware crash happened as
> part of this network device health thing, but firmware crashing is a
> generic thing.
> 
> I have now extended my patch set to include uvents and I am more set on
> that we need the taint now more than ever.

Please expect my nack if you're trying to add this to networking
drivers.

The irony is you have a problem with a networking device and all the
devices your initial set touched are networking. Two of the drivers 
you touched either have or will soon have devlink health reporters
implemented.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
