Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k194A-000174-Tu
 for ath10k@lists.infradead.org; Thu, 30 Jul 2020 13:57:54 +0000
Message-ID: <943c5eaf12bc9e92e817fb9818ebd65038f5fb54.camel@sipsolutions.net>
Subject: Re: [RFC 1/2] devlink: add simple fw crash helpers
From: Johannes Berg <johannes@sipsolutions.net>
Date: Thu, 30 Jul 2020 15:56:25 +0200
In-Reply-To: <20200525135746.45e764de@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
References: <20200519010530.GS11244@42.do-not-panic.com>
 <20200519211531.3702593-1-kuba@kernel.org>
 <20200522052046.GY11244@42.do-not-panic.com>
 <20200522101738.1495f4cc@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <2e5199edb433c217c7974ef7408ff8c7253145b6.camel@sipsolutions.net>
 <20200525135746.45e764de@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
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
Cc: linux-wireless@vger.kernel.org, aquini@redhat.com, peterz@infradead.org, daniel.vetter@ffwll.ch, mchehab+samsung@kernel.org, will@kernel.org, greearb@candelatech.com, bhe@redhat.com, briannorris@chromium.org, ath10k@lists.infradead.org, derosier@gmail.com, tiwai@suse.de, mingo@redhat.com, dyoung@redhat.com, pmladek@suse.com, jiri@resnulli.us, keescook@chromium.org, arnd@arndb.de, gpiccoli@canonical.com, rostedt@goodmis.org, cai@lca.pw, tglx@linutronix.de, andriy.shevchenko@linux.intel.com, kvalo@codeaurora.org, netdev@vger.kernel.org, schlad@suse.de, linux-kernel@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, jeyu@kernel.org, akpm@linux-foundation.org, davem@davemloft.net

Hi,

Sorry ... long delay.

> > The reason I'm asking is that it's starting to sound like we really
> > ought to be implementing devlink, but we've got a bunch of
> > infrastructure that uses the devcoredump, and it'll take time
> > (significantly so) to change all that...
> 
> In devlink world pure FW core dumps are exposed by devlink regions.
> An API allowing reading device memory, registers, etc., but also 
> creating dumps of memory regions when things go wrong. It should be
> a fairly straightforward migration.

Right. We also have regions (various memory pieces, registers, ...).

One issue might be that for devlink we wouldn't want to expose these as
a single blob, I guess, but for devcoredump we already have a custom
format to glue all the things together. Since it seems unlikely that
anyone else would want to use the *iwlwifi* format to glue things
together, we'd have to do something there.

But perhaps that could be a matter of providing a "glue things into a
devcoredump" function that would have a reasonable default but could be
overridden by the driver for those migration cases.

> Devlink health is more targeted, the dump is supposed to contain only
> relevant information, selected and formatted by the driver. When device
> misbehaves driver reads the relevant registers and FW state and creates
> a formatted state dump. I believe each element of the dump must fit
> into a netlink message (but there may be multiple elements, see
> devlink_fmsg_prepare_skb()).

That wouldn't help for our big memory dumps, but OK.

> We should be able to convert dl-regions dumps and dl-health dumps into
> devcoredumps, but since health reporters are supposed to be more
> targeted there's usually multiple of them per device.

Right.

> Conversely devcoredumps can be trivially exposed as dl-region dumps,
> but I believe dl-health would require driver changes to format the
> information appropriately.

Agree.

Anyway, thanks. I'll put it on my list of things to look at ... not too
hopeful that will be soon, given how long it even took me to get back to
this email :)

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
