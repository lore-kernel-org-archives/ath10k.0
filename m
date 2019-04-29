Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hL1xw-0004mF-CU
 for ath10k@lists.infradead.org; Mon, 29 Apr 2019 08:48:50 +0000
Received: by mail-oi1-f194.google.com with SMTP id v23so7508671oif.8
 for <ath10k@lists.infradead.org>; Mon, 29 Apr 2019 01:48:47 -0700 (PDT)
MIME-Version: 1.0
References: <2884043.Jv1Mn93hE8@aspire.rjw.lan>
 <20190403195718.GA74723@google.com>
 <87o94tutdz.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87o94tutdz.fsf@kamboji.qca.qualcomm.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 29 Apr 2019 10:48:35 +0200
Message-ID: <CAJZ5v0ifD=DATprUeeO2_LGs04aEEhPB6AcGVPxWUdQaOma+ww@mail.gmail.com>
Subject: Re: [PATCH] ath10k: Drop WARN_ON()s that always trigger during system
 resume
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Claire Chang <tientzu@google.com>, Sriram R <srirrama@codeaurora.org>, Linux PM <linux-pm@vger.kernel.org>, Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>, "open list:NETWORKING DRIVERS (WIRELESS)" <linux-wireless@vger.kernel.org>, Brian Norris <briannorris@chromium.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, ath10k@lists.infradead.org, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Todd Brandt <todd.e.brandt@intel.com>

On Fri, Apr 26, 2019 at 9:18 AM Kalle Valo <kvalo@codeaurora.org> wrote:
>
> Brian Norris <briannorris@chromium.org> writes:
>
> > + Sriram, Pradeep, Claire
> >
> > On Sun, Mar 03, 2019 at 06:24:33PM +0100, Rafael J. Wysocki wrote:
> >
> > Ooh, exactly 1 month ago!
> >
> >> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> >>
> >> ath10k_mac_vif_chan() always returns an error for the given vif
> >> during system-wide resume which reliably triggers two WARN_ON()s
> >> in ath10k_bss_info_changed() and they are not particularly
> >> useful in that code path, so drop them.
> >>
> >
> > Particularly, when WOWLAN isn't enabled, we get called during resume via
> > ieee80211_reconfig(), where we're not associated and don't have any
> > channel contexts. AFAICT, we shouldn't need to communicate anything in
> > particular to the firmware here, and so failing the 'if' is definitely
> > not worth WARN-ing about.
> >
> > I'd love to see this get applied with:
> >
> > Fixes: cd93b83ad927 ("ath10k: support for multicast rate control")
> > Fixes: f279294e9ee2 ("ath10k: add support for configuring management packet rate")
> >
> > and sent to stable. This has been bugging people since 4.19. Spurious
> > WARN_ON()s can trigger reports to various crash trackers, and on some
> > systems appear as user-visible warnings ("System problem detected").
> >
> >> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> >
> > Reviewed-by: Brian Norris <briannorris@chromium.org>
> > Tested-by: Brian Norris <briannorris@chromium.org>
>
> I added these now to the commit log, thanks Brian.
>
> Rafael, could you please provide the hardware and firmware versions you
> tested this on? We have so many different firmware branches to support
> that I prefer to have that documented in the commit log. Providing
> ath10k startup messages in dmesg are enough,

There you go:

[    4.695349] ath10k_pci 0000:3a:00.0: enabling device (0000 -> 0002)
[    4.698165] ath10k_pci 0000:3a:00.0: pci irq msi oper_irq_mode 2
irq_mode 0 reset_mode 0
[    4.912240] ath10k_pci 0000:3a:00.0: qca6174 hw3.2 target
0x05030000 chip_id 0x00340aff sub 1a56:1535
[    4.912255] ath10k_pci 0000:3a:00.0: kconfig debug 0 debugfs 0
tracing 0 dfs 0 testmode 0
[    4.912716] ath10k_pci 0000:3a:00.0: firmware ver
WLAN.RM.2.0-00180-QCARMSWPZ-1 api 4 features
wowlan,ignore-otp,no-4addr-pad crc32 75dee6c5
[    4.982563] ath10k_pci 0000:3a:00.0: board_file api 2 bmi_id N/A
crc32 19644295

> I can then add it to the commit log.

Still, I'm quite sure that the WARN_ON()s trigger during system resume
regardless of the hw/fw combination.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
