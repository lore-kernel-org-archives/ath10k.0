Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pf1-f196.google.com ([209.85.210.196])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jaj4U-0004Xs-79
 for ath10k@lists.infradead.org; Mon, 18 May 2020 16:56:59 +0000
Received: by mail-pf1-f196.google.com with SMTP id y198so3642239pfb.4
 for <ath10k@lists.infradead.org>; Mon, 18 May 2020 09:56:57 -0700 (PDT)
Date: Mon, 18 May 2020 16:56:55 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: [PATCH v2 12/15] ath10k: use new module_firmware_crashed()
Message-ID: <20200518165655.GI11244@42.do-not-panic.com>
References: <20200515212846.1347-1-mcgrof@kernel.org>
 <20200515212846.1347-13-mcgrof@kernel.org>
 <2b74a35c726e451b2fab2b5d0d301e80d1f4cdc7.camel@sipsolutions.net>
 <7306323c35e6f44d7c569e689b48f380f80da5e5.camel@sipsolutions.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7306323c35e6f44d7c569e689b48f380f80da5e5.camel@sipsolutions.net>
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

On Sat, May 16, 2020 at 03:50:55PM +0200, Johannes Berg wrote:
> On Sat, 2020-05-16 at 15:24 +0200, Johannes Berg wrote:
> 
> > Instead of the kernel taint, IMHO you should provide an annotation in
> > sysfs (or somewhere else) for the *struct device* that had its firmware
> > crash. Or maybe, if it's too complex to walk the entire hierarchy
> > checking for that, have a uevent, or add the ability for the kernel to
> > print out elsewhere in debugfs the list of devices that crashed at some
> 
> I mean sysfs, oops.
> 
> 
> In addition, look what we have in iwl_trans_pcie_removal_wk(). If we
> detect that the device is really wedged enough that the only way we can
> still try to recover is by completely unbinding the driver from it, then
> we give userspace a uevent for that.

Nice! Indeed a uevent is in order for these sorts of things, and I'd
argue that it begs the question if we should even uevent for any taint
as well. Today these are silent. If the kernel crashes, today we only
give userspace a log.

> I don't remember exactly how and
> where that gets used (ChromeOS) though, but it'd be nice to have that
> sort of thing as part of the infrastructure, in a sort of two-level
> notification?
> 
> Level 1: firmware crashed, but we're recovering, at least mostly, and
> it's more informational
> 
> Level 2: device is wedged, going to try to recover by some more forceful
> means (perhaps some devices can be power-cycled? etc.) but (more) state
> would be lost in these cases?

I agree that *all* this would be ideal. I don't see this as mutually
exclusive with a taint on the kernel and module for the device.

> Still don't think a kernel taint is appropriate for either of these.

From a support perspective, I do think it is vital quick information.

  Luis

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
