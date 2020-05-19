Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jaqz1-0008Qx-VM
 for ath10k@lists.infradead.org; Tue, 19 May 2020 01:23:53 +0000
Received: by mail-ed1-x544.google.com with SMTP id k19so10217346edv.9
 for <ath10k@lists.infradead.org>; Mon, 18 May 2020 18:23:50 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com.
 [209.85.208.49])
 by smtp.gmail.com with ESMTPSA id s17sm1229436edr.84.2020.05.18.18.23.46
 for <ath10k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 May 2020 18:23:47 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id i16so5791677edv.1
 for <ath10k@lists.infradead.org>; Mon, 18 May 2020 18:23:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200515212846.1347-1-mcgrof@kernel.org>
 <20200515212846.1347-13-mcgrof@kernel.org>
 <2b74a35c726e451b2fab2b5d0d301e80d1f4cdc7.camel@sipsolutions.net>
 <7306323c35e6f44d7c569e689b48f380f80da5e5.camel@sipsolutions.net>
In-Reply-To: <7306323c35e6f44d7c569e689b48f380f80da5e5.camel@sipsolutions.net>
From: Brian Norris <briannorris@chromium.org>
Date: Mon, 18 May 2020 18:23:33 -0700
Message-ID: <CA+ASDXOg9oKeMJP1Mf42oCMMM3sVe0jniaWowbXVuaYZ=ZpDjQ@mail.gmail.com>
Subject: Re: [PATCH v2 12/15] ath10k: use new module_firmware_crashed()
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, aquini@redhat.com, peterz@infradead.org, daniel.vetter@ffwll.ch, mchehab+samsung@kernel.org, will@kernel.org, bhe@redhat.com, ath10k@lists.infradead.org, Takashi Iwai <tiwai@suse.de>, mingo@redhat.com, dyoung@redhat.com, pmladek@suse.com, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, gpiccoli@canonical.com, Steven Rostedt <rostedt@goodmis.org>, cai@lca.pw, tglx@linutronix.de, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Kalle Valo <kvalo@codeaurora.org>, "<netdev@vger.kernel.org>" <netdev@vger.kernel.org>, schlad@suse.de, Linux Kernel <linux-kernel@vger.kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, jeyu@kernel.org, Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>

On Sat, May 16, 2020 at 6:51 AM Johannes Berg <johannes@sipsolutions.net> wrote:
> In addition, look what we have in iwl_trans_pcie_removal_wk(). If we
> detect that the device is really wedged enough that the only way we can
> still try to recover is by completely unbinding the driver from it, then
> we give userspace a uevent for that. I don't remember exactly how and
> where that gets used (ChromeOS) though, but it'd be nice to have that
> sort of thing as part of the infrastructure, in a sort of two-level
> notification?

<slight side track>
We use this on certain devices where we know the underlying hardware
has design issues that may lead to device failure -- then when we see
this sort of unrecoverable "firmware-death", we remove the
device[*]+driver, force-reset the PCI device (SBR), and try to
reload/reattach the driver. This all happens by way of a udev rule. We
also log this sort of stuff (and metrics around it) for bug reports
and health statistics, since we really hope to not see this happen
often.

[*] "We" (user space) don't actually do this...it happens via the
'remove_when_gone' module parameter abomination found in iwlwifi. I'd
personally rather see the EVENT=INACESSIBLE stuff on its own, and let
user space deal with when and how to remove and reset the device. But
I digress too much here ;)
</slight side track>

I really came to this thread to say that I also love the idea of a
generic mechanism (a la $subject) to report firmware crashes, but I
also have no interest in seeing a taint flag for it. For Chrome OS, I
would readily (as in, we're already looking at more-hacky /
non-generic ways to do this for drivers we care about) process these
kinds of stats as they happen, logging metrics for bug reports and/or
for automated crash statistics, when we see a firmware crash. A uevent
would suit us very well I think, although it would be nice if drivers
could also supply some small amount of informative text along with it
(e.g., a sort of "reason code", in case we can possibly aggregate
certain failure types). We already do this sort of thing for WARN()
and friends (not via uevent, but via log parsing; at least it has nice
"cut here" markers!).

Perhaps devlink (as proposed down-thread) would also fit the bill. I
don't think sysfs alone would fit our needs, as we'd like to process
these things as they happen, not only when a user submits a bug
report.

> Level 1: firmware crashed, but we're recovering, at least mostly, and
> it's more informational

Chrome OS would love to track these things too, since we'd like to see
these minimized, even if they're usually recoverable ;)

> Level 2: device is wedged, going to try to recover by some more forceful
> means (perhaps some devices can be power-cycled? etc.) but (more) state
> would be lost in these cases?

And we'd definitely want to know about these. We already get this for
the iwlwifi case described above, in a non-generic way.

In general, it's probably not that easy to tell the difference between
1 and 2, since even as you and Luis have noted, with the same driver
(and the same driver location), you find the same crashes may or may
not be recoverable. iwlwifi has extracted certain level 2 cases into
iwl_trans_pcie_removal_wk(), but even iwlwifi doesn't know all the
ways in which level 1 crashes actually lead to severe
(non-recoverable) failure.

Regards,
Brian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
