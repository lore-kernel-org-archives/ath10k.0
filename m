Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZxE3-0001fZ-U5
 for ath10k@lists.infradead.org; Sat, 16 May 2020 13:51:41 +0000
Message-ID: <7306323c35e6f44d7c569e689b48f380f80da5e5.camel@sipsolutions.net>
Subject: Re: [PATCH v2 12/15] ath10k: use new module_firmware_crashed()
From: Johannes Berg <johannes@sipsolutions.net>
Date: Sat, 16 May 2020 15:50:55 +0200
In-Reply-To: <2b74a35c726e451b2fab2b5d0d301e80d1f4cdc7.camel@sipsolutions.net>
 (sfid-20200516_152518_154267_1B9A55D6)
References: <20200515212846.1347-1-mcgrof@kernel.org>
 <20200515212846.1347-13-mcgrof@kernel.org>
 (sfid-20200515_233205_994687_1F26BDAB)
 <2b74a35c726e451b2fab2b5d0d301e80d1f4cdc7.camel@sipsolutions.net>
 (sfid-20200516_152518_154267_1B9A55D6)
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
To: Luis Chamberlain <mcgrof@kernel.org>, jeyu@kernel.org
Cc: linux-wireless@vger.kernel.org, aquini@redhat.com, peterz@infradead.org, daniel.vetter@ffwll.ch, mchehab+samsung@kernel.org, will@kernel.org, bhe@redhat.com, ath10k@lists.infradead.org, tiwai@suse.de, mingo@redhat.com, dyoung@redhat.com, pmladek@suse.com, keescook@chromium.org, arnd@arndb.de, gpiccoli@canonical.com, rostedt@goodmis.org, cai@lca.pw, tglx@linutronix.de, andriy.shevchenko@linux.intel.com, kvalo@codeaurora.org, netdev@vger.kernel.org, schlad@suse.de, linux-kernel@vger.kernel.org, akpm@linux-foundation.org, davem@davemloft.net

On Sat, 2020-05-16 at 15:24 +0200, Johannes Berg wrote:

> Instead of the kernel taint, IMHO you should provide an annotation in
> sysfs (or somewhere else) for the *struct device* that had its firmware
> crash. Or maybe, if it's too complex to walk the entire hierarchy
> checking for that, have a uevent, or add the ability for the kernel to
> print out elsewhere in debugfs the list of devices that crashed at some

I mean sysfs, oops.


In addition, look what we have in iwl_trans_pcie_removal_wk(). If we
detect that the device is really wedged enough that the only way we can
still try to recover is by completely unbinding the driver from it, then
we give userspace a uevent for that. I don't remember exactly how and
where that gets used (ChromeOS) though, but it'd be nice to have that
sort of thing as part of the infrastructure, in a sort of two-level
notification?

Level 1: firmware crashed, but we're recovering, at least mostly, and
it's more informational

Level 2: device is wedged, going to try to recover by some more forceful
means (perhaps some devices can be power-cycled? etc.) but (more) state
would be lost in these cases?

Still don't think a kernel taint is appropriate for either of these.

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
