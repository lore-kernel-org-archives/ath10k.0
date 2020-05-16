Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZwoJ-0000m2-Ka
 for ath10k@lists.infradead.org; Sat, 16 May 2020 13:25:04 +0000
Message-ID: <2b74a35c726e451b2fab2b5d0d301e80d1f4cdc7.camel@sipsolutions.net>
Subject: Re: [PATCH v2 12/15] ath10k: use new module_firmware_crashed()
From: Johannes Berg <johannes@sipsolutions.net>
Date: Sat, 16 May 2020 15:24:01 +0200
In-Reply-To: <20200515212846.1347-13-mcgrof@kernel.org>
 (sfid-20200515_233205_994687_1F26BDAB)
References: <20200515212846.1347-1-mcgrof@kernel.org>
 <20200515212846.1347-13-mcgrof@kernel.org>
 (sfid-20200515_233205_994687_1F26BDAB)
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

On Fri, 2020-05-15 at 21:28 +0000, Luis Chamberlain wrote:> module_firmware_crashed

You didn't CC me or the wireless list on the rest of the patches, so I'm
replying to a random one, but ...

What is the point here?

This should in no way affect the integrity of the system/kernel, for
most devices anyway.

So what if ath10k's firmware crashes? If there's a driver bug it will
not handle it right (and probably crash, WARN_ON, or something else),
but if the driver is working right then that will not affect the kernel
at all.

So maybe I can understand that maybe you want an easy way to discover -
per device - that the firmware crashed, but that still doesn't warrant a
complete kernel taint.

Instead of the kernel taint, IMHO you should provide an annotation in
sysfs (or somewhere else) for the *struct device* that had its firmware
crash. Or maybe, if it's too complex to walk the entire hierarchy
checking for that, have a uevent, or add the ability for the kernel to
print out elsewhere in debugfs the list of devices that crashed at some
point... All of that is fine, but a kernel taint?

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
