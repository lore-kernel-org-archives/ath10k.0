Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pa0-f50.google.com ([209.85.220.50])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZbqyI-0007CB-UK
 for ath10k@lists.infradead.org; Tue, 15 Sep 2015 14:12:35 +0000
Received: by pacex6 with SMTP id ex6so178426995pac.0
 for <ath10k@lists.infradead.org>; Tue, 15 Sep 2015 07:12:14 -0700 (PDT)
Date: Tue, 15 Sep 2015 19:42:08 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH V3 2/2] debugfs: don't assume sizeof(bool) to be 4 bytes
Message-ID: <20150915141208.GK6350@linux>
References: <9b705747a138c96c26faee5218f7b47403195b28.1442305897.git.viresh.kumar@linaro.org>
 <27d37898b4be6b9b9f31b90135f8206ca079a868.1442305897.git.viresh.kumar@linaro.org>
 <20150915100454.70dcc04d@gandalf.local.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20150915100454.70dcc04d@gandalf.local.home>
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
To: Steven Rostedt <rostedt@goodmis.org>
Cc: "open list:NETWORKING DRIVERS (WIRELESS)" <linux-wireless@vger.kernel.org>, "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." <alsa-devel@alsa-project.org>, Avri Altman <avri.altman@intel.com>, Stanislaw Gruszka <sgruszka@redhat.com>, Jiri Slaby <jirislaby@gmail.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Will Deacon <will.deacon@arm.com>, Jaroslav Kysela <perex@perex.cz>, "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>, Kalle Valo <kvalo@qca.qualcomm.com>, Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Luciano Coelho <luciano.coelho@intel.com>, Wang Long <long.wanglong@huawei.com>, Richard Fitzgerald <rf@opensource.wolfsonmicro.com>, Ingo Molnar <mingo@kernel.org>, open list <linux-kernel@vger.kernel.org>, Johan Hedberg <johan.hedberg@gmail.com>, Davidlohr Bueso <dave@stgolabs.net>, Johannes Berg <johannes.berg@intel.com>, Joonsoo Kim <js1304@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>, "open list:WOLFSON MICROELECTRONICS DRIVERS" <patches@opensource.wolfsonmicro.com>, Sebastian Ott <sebott@linux.vnet.ibm.com>, "open list:QUALCOMM ATHEROS ATH10K WIRELESS DRIVER" <ath10k@lists.infradead.org>, Intel Linux Wireless <ilw@linux.intel.com>, "open list:ACPI" <linux-acpi@vger.kernel.org>, Dmitry Monakhov <dmonakhov@openvz.org>, Nick Kossifidis <mickflemm@gmail.com>, "open list:B43 WIRELESS DRIVER" <b43-dev@lists.infradead.org>, Doug Thompson <dougthompson@xmission.com>, Gustavo Padovan <gustavo@padovan.org>, Sasha Levin <sasha.levin@oracle.com>, Tomas Winkler <tomas.winkler@intel.com>, sboyd@codeaurora.org, Len Brown <lenb@kernel.org>, linaro-kernel@lists.linaro.org, Hariprasad S <hariprasad@chelsio.com>, arnd@arndb.de, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Vlastimil Babka <vbabka@suse.cz>, Arik Nemtsov <arik@wizery.com>, Marcel Holtmann <marcel@holtmann.org>, "James E.J. Bottomley" <JBottomley@odin.com>, Michal Hocko <mhocko@suse.com>, Akinobu Mita <akinobu.mita@gmail.com>, QCA ath9k Development <ath9k-devel@qca.qualcomm.com>, Michael Kerrisk <mtk.manpages@gmail.com>, Tejun Heo <tj@kernel.org>, Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>, Takashi Iwai <tiwai@suse.com>, Florian Fainelli <f.fainelli@gmail.com>, Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, Mel Gorman <mgorman@suse.de>, "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>, "open list:EDAC-CORE" <linux-edac@vger.kernel.org>, Haggai Eran <haggaie@mellanox.com>, Narsimhulu Musini <nmusini@cisco.com>, Chaya Rachel Ivgi <chaya.rachel.ivgi@intel.com>, "open list:CISCO SCSI HBA DRIVER" <linux-scsi@vger.kernel.org>, Brian Silverman <bsilver16384@gmail.com>, "Luis R. Rodriguez" <mcgrof@do-not-panic.com>, gregkh@linuxfoundation.org, "open list:ULTRA-WIDEBAND (UWB) SUBSYSTEM:" <linux-usb@vger.kernel.org>, Rafael Wysocki <rjw@rjwysocki.net>, Liam Girdwood <lgirdwood@gmail.com>, Sesidhar Baddela <sebaddel@cisco.com>, Andy Lutomirski <luto@amacapital.net>, "open list:BLUETOOTH DRIVERS" <linux-bluetooth@vger.kernel.org>, "open list:AMD IOMMU (AMD-VI)" <iommu@lists.linux-foundation.org>, "open list:QUALCOMM ATHEROS ATH9K WIRELESS DRIVER" <ath9k-devel@lists.ath9k.org>, Thomas Gleixner <tglx@linutronix.de>, Johannes Weiner <hannes@cmpxchg.org>, Joe Perches <joe@perches.com>, Eliad Peller <eliad@wizery.com>, Andrew Morton <akpm@linux-foundation.org>, Alexander Duyck <alexander.h.duyck@redhat.com>, Linus Torvalds <torvalds@linux-foundation.org>, "open list:CXGB4 ETHERNET DRIVER (CXGB4)" <netdev@vger.kernel.org>, Larry Finger <Larry.Finger@lwfinger.net>

On 15-09-15, 10:04, Steven Rostedt wrote:
> On Tue, 15 Sep 2015 14:04:59 +0530
> Viresh Kumar <viresh.kumar@linaro.org> wrote:
> 
> > diff --git a/drivers/acpi/ec.c b/drivers/acpi/ec.c
> > index 2614a839c60d..f11e17ad7834 100644
> > --- a/drivers/acpi/ec.c
> > +++ b/drivers/acpi/ec.c
> > @@ -1237,7 +1237,7 @@ ec_parse_device(acpi_handle handle, u32 Level, void *context, void **retval)
> >  	/* Use the global lock for all EC transactions? */
> >  	tmp = 0;
> >  	acpi_evaluate_integer(handle, "_GLK", NULL, &tmp);
> > -	ec->global_lock = tmp;
> > +	ec->global_lock = !!tmp;
> 
> BTW, the above is equivalent if global_lock is of type bool.

Ah, yes. Thanks for letting me know (I just testedit as well).

But will it look sane enough to set a boolean to anything apart from
true/false or 1/0? Yes, it will always be set to 0/1 only, but still..

-- 
viresh

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
