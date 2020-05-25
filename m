Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdKAP-0003VQ-HT
 for ath10k@lists.infradead.org; Mon, 25 May 2020 20:57:50 +0000
Date: Mon, 25 May 2020 13:57:46 -0700
From: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [RFC 1/2] devlink: add simple fw crash helpers
Message-ID: <20200525135746.45e764de@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
In-Reply-To: <2e5199edb433c217c7974ef7408ff8c7253145b6.camel@sipsolutions.net>
References: <20200519010530.GS11244@42.do-not-panic.com>
 <20200519211531.3702593-1-kuba@kernel.org>
 <20200522052046.GY11244@42.do-not-panic.com>
 <20200522101738.1495f4cc@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <2e5199edb433c217c7974ef7408ff8c7253145b6.camel@sipsolutions.net>
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
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, aquini@redhat.com, peterz@infradead.org, daniel.vetter@ffwll.ch, mchehab+samsung@kernel.org, will@kernel.org, greearb@candelatech.com, bhe@redhat.com, briannorris@chromium.org, ath10k@lists.infradead.org, derosier@gmail.com, tiwai@suse.de, mingo@redhat.com, dyoung@redhat.com, pmladek@suse.com, jiri@resnulli.us, keescook@chromium.org, arnd@arndb.de, gpiccoli@canonical.com, rostedt@goodmis.org, cai@lca.pw, tglx@linutronix.de, andriy.shevchenko@linux.intel.com, kvalo@codeaurora.org, netdev@vger.kernel.org, schlad@suse.de, linux-kernel@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, jeyu@kernel.org, akpm@linux-foundation.org, davem@davemloft.net

On Fri, 22 May 2020 22:46:07 +0200 Johannes Berg wrote:
> > The irony is you have a problem with a networking device and all the
> > devices your initial set touched are networking. Two of the drivers 
> > you touched either have or will soon have devlink health reporters
> > implemented.  
> 
> Like I said above, do you think it'd be feasible to make a devcoredump
> out of devlink health reports? And can the report be in a way that we
> control the file format, or are there limits? I guess I should read the
> code to find out, but I figure you probably just know. But feel free to
> tell me to read it :)
> 
> The reason I'm asking is that it's starting to sound like we really
> ought to be implementing devlink, but we've got a bunch of
> infrastructure that uses the devcoredump, and it'll take time
> (significantly so) to change all that...

In devlink world pure FW core dumps are exposed by devlink regions.
An API allowing reading device memory, registers, etc., but also 
creating dumps of memory regions when things go wrong. It should be
a fairly straightforward migration.

Devlink health is more targeted, the dump is supposed to contain only
relevant information, selected and formatted by the driver. When device
misbehaves driver reads the relevant registers and FW state and creates
a formatted state dump. I believe each element of the dump must fit
into a netlink message (but there may be multiple elements, see
devlink_fmsg_prepare_skb()).

We should be able to convert dl-regions dumps and dl-health dumps into
devcoredumps, but since health reporters are supposed to be more
targeted there's usually multiple of them per device.

Conversely devcoredumps can be trivially exposed as dl-region dumps,
but I believe dl-health would require driver changes to format the
information appropriately.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
