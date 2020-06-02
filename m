Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgE84-00088I-Dm
 for ath10k@lists.infradead.org; Tue, 02 Jun 2020 21:07:26 +0000
Received: by mail-ej1-x644.google.com with SMTP id a25so7004527ejg.5
 for <ath10k@lists.infradead.org>; Tue, 02 Jun 2020 14:07:21 -0700 (PDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com.
 [209.85.221.46])
 by smtp.gmail.com with ESMTPSA id w13sm637eju.124.2020.06.02.14.07.19
 for <ath10k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2020 14:07:19 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id l10so77206wrr.10
 for <ath10k@lists.infradead.org>; Tue, 02 Jun 2020 14:07:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200526145815.6415-1-mcgrof@kernel.org>
 <20200526145815.6415-6-mcgrof@kernel.org>
In-Reply-To: <20200526145815.6415-6-mcgrof@kernel.org>
From: Brian Norris <briannorris@chromium.org>
Date: Tue, 2 Jun 2020 14:01:12 -0700
Message-ID: <CA+ASDXMR-Aa9322QjUTxiD2zwXDUig1eyG7GAAJJDvuUg1AXdA@mail.gmail.com>
Subject: Re: [PATCH v3 5/8] ath10k: use new taint_firmware_crashed()
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
Cc: aquini@redhat.com, linux-doc@vger.kernel.org, peterz@infradead.org, Daniel Vetter <daniel.vetter@ffwll.ch>, linux@dominikbrodowski.net, Doug Anderson <dianders@chromium.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, glider@google.com, GR-everest-linux-l2@marvell.com, mchehab+samsung@kernel.org, will@kernel.org, tglx@linutronix.de, Rob Herring <robh@kernel.org>, Arnd Bergmann <arnd@arndb.de>, bhe@redhat.com, corbet@lwn.net, mchehab+huawei@kernel.org, ath10k <ath10k@lists.infradead.org>, derosier@gmail.com, Takashi Iwai <tiwai@suse.de>, mingo@redhat.com, Kalle Valo <kvalo@codeaurora.org>, Sami Tolvanen <samitolvanen@google.com>, kuba@kernel.org, yzaikin@google.com, dyoung@redhat.com, mhiramat@kernel.org, pmladek@suse.com, elver@google.com, gpiccoli@canonical.com, aelior@marvell.com, Kees Cook <keescook@chromium.org>, paulmck@kernel.org, sfr@canb.auug.org.au, sburla@marvell.com, Steven Rostedt <rostedt@goodmis.org>, fmanlunas@marvell.com, cai@lca.pw, michael.chan@broadcom.com, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Dmitry Vyukov <dvyukov@google.com>, "<netdev@vger.kernel.org>" <netdev@vger.kernel.org>, rdunlap@infradead.org, linux-wireless <linux-wireless@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, vkoul@kernel.org, schlad@suse.de, jeyu@kernel.org, Johannes Berg <johannes@sipsolutions.net>, dchickles@marvell.com, "David S. Miller" <davem@davemloft.net>, bauerman@linux.ibm.com

On Tue, May 26, 2020 at 7:58 AM Luis Chamberlain <mcgrof@kernel.org> wrote:
>
> This makes use of the new taint_firmware_crashed() to help
> annotate when firmware for device drivers crash. When firmware
> crashes devices can sometimes become unresponsive, and recovery
> sometimes requires a driver unload / reload and in the worst cases
> a reboot.

Just for the record, the underlying problem you seem to be complaining
about does not appear to be a firmware crash at all. It does happen to
result in a firmware crash report much later on (because when the PCIe
endpoint is this hosed, sooner or later the driver thinks the firmware
is dead), but it's not likely the root cause. More below.

> Using a taint flag allows us to annotate when this happens clearly.
>
> I have run into this situation with this driver with the latest
> firmware as of today, May 21, 2020 using v5.6.0, leaving me at
> a state at which my only option is to reboot. Driver removal and
> addition does not fix the situation. This is reported on kernel.org
> bugzilla korg#207851 [0].

I took a look, and replied there:
https://bugzilla.kernel.org/show_bug.cgi?id=207851#c2

Per the above, it seems more likely you have a PCI or power management
problem, not an ath10k or ath10k-firmware problem.

> But this isn't the first firmware crash reported,
> others have been filed before and none of these bugs have yet been
> addressed [1] [2] [3].  Including my own I see these firmware crash
> reports:

Yes, firmware does crash. Sometimes repeatedly. It also happens to be
closed source, so it's nearly impossible for the average Linux dev to
debug. But FWIW, those 3 all appear to be recoverable -- and then they
crash again a few minutes later. So just as claimed on prior
iterations of this patchset, ath10k is doing fine at recovery [*] --
it's "only" the firmware that's a problem. (And, if a WiFi firmware
doesn't like something in the RF environment...it's totally
understandable that the crash will happen more than once. Of course
that sucks, but it's not unexpected.) Crucially, rebooting won't
really do anything to help these people, AIUI.

Maybe what you really want is to taint the kernel every time a
non-free firmware is loaded ;)

I'd also note that those 3 reports are 3 years old. There have been
many ath10k-firmware updates since then, so it's not necessarily fair
to dig those back up. Also, bugzilla.kernel.org is totally ignored by
many linux-wireless@ folks. But I digress...

All in all, I have no interest in this proposal, for many of the
reasons already mentioned on previous iterations. It's way too coarse
and won't be useful in understanding what's going on in a system, IMO,
at least for ath10k. But it's also easy enough to ignore, so if it
makes somebody happy to claim a taint, then so be it.

Regards,
Brian

[*] Although, at least one of those doesn't appear to be as "clean" of
a recovery attempt as typical. Maybe there are some lurking driver
bugs in there too.


>   * korg#207851 [0]
>   * korg#197013 [1]
>   * korg#201237 [2]
>   * korg#195987 [3]
>
> [0] https://bugzilla.kernel.org/show_bug.cgi?id=207851
> [1] https://bugzilla.kernel.org/show_bug.cgi?id=197013
> [2] https://bugzilla.kernel.org/show_bug.cgi?id=201237
> [3] https://bugzilla.kernel.org/show_bug.cgi?id=195987

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
