Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pa0-f41.google.com ([209.85.220.41])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZbVyo-0005jv-QZ
 for ath10k@lists.infradead.org; Mon, 14 Sep 2015 15:47:43 +0000
Received: by pacfv12 with SMTP id fv12so150350494pac.2
 for <ath10k@lists.infradead.org>; Mon, 14 Sep 2015 08:47:22 -0700 (PDT)
Date: Mon, 14 Sep 2015 21:17:08 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH V2] debugfs: don't assume sizeof(bool) to be 4 bytes
Message-ID: <20150914154708.GF32551@linux>
References: <81516fb9c662cc338b5af5b63fbbcde5374e0893.1442202447.git.viresh.kumar@linaro.org>
 <1708603.aKpYchk1pa@wuerfel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1708603.aKpYchk1pa@wuerfel>
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
To: Arnd Bergmann <arnd@arndb.de>
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." <alsa-devel@alsa-project.org>, Avri Altman <avri.altman@intel.com>, Stanislaw Gruszka <sgruszka@redhat.com>, Jiri Slaby <jirislaby@gmail.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Jaroslav Kysela <perex@perex.cz>, "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>, Kalle Valo <kvalo@qca.qualcomm.com>, Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Luciano Coelho <luciano.coelho@intel.com>, Richard Fitzgerald <rf@opensource.wolfsonmicro.com>, Ingo Molnar <mingo@kernel.org>, Hariprasad S <hariprasad@chelsio.com>, Thomas Gleixner <tglx@linutronix.de>, Davidlohr Bueso <dave@stgolabs.net>, Eliad Peller <eliad@wizery.com>, Joonsoo Kim <js1304@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>, "open list:WOLFSON MICROELECTRONICS DRIVERS" <patches@opensource.wolfsonmicro.com>, Sebastian Ott <sebott@linux.vnet.ibm.com>, "open list:QUALCOMM ATHEROS ATH10K WIRELESS DRIVER" <ath10k@lists.infradead.org>, Intel Linux Wireless <ilw@linux.intel.com>, "open list:ACPI" <linux-acpi@vger.kernel.org>, Dmitry Monakhov <dmonakhov@openvz.org>, Nick Kossifidis <mickflemm@gmail.com>, Doug Thompson <dougthompson@xmission.com>, Gustavo Padovan <gustavo@padovan.org>, Sasha Levin <sasha.levin@oracle.com>, Tomas Winkler <tomas.winkler@intel.com>, sboyd@codeaurora.org, "open list:B43 WIRELESS DRIVER" <b43-dev@lists.infradead.org>, linaro-kernel@lists.linaro.org, Johan Hedberg <johan.hedberg@gmail.com>, Johannes Berg <johannes.berg@intel.com>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Arik Nemtsov <arik@wizery.com>, Marcel Holtmann <marcel@holtmann.org>, David Rientjes <rientjes@google.com>, Michal Hocko <mhocko@suse.com>, Akinobu Mita <akinobu.mita@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Joe Perches <joe@perches.com>, Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>, Oleg Nesterov <oleg@redhat.com>, Florian Fainelli <f.fainelli@gmail.com>, Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, Mel Gorman <mgorman@suse.de>, Vlastimil Babka <vbabka@suse.cz>, "open list:EDAC-CORE" <linux-edac@vger.kernel.org>, "moderated list:ARM64 PORT AARCH64 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Haggai Eran <haggaie@mellanox.com>, "James E.J. Bottomley" <JBottomley@odin.com>, Alexander Duyck <alexander.h.duyck@redhat.com>, Chaya Rachel Ivgi <chaya.rachel.ivgi@intel.com>, "open list:CISCO SCSI HBA DRIVER" <linux-scsi@vger.kernel.org>, Brian Silverman <bsilver16384@gmail.com>, "Luis R. Rodriguez" <mcgrof@do-not-panic.com>, gregkh@linuxfoundation.org, "open list:ULTRA-WIDEBAND UWB SUBSYSTEM:" <linux-usb@vger.kernel.org>, "open list:NETWORKING DRIVERS WIRELESS" <linux-wireless@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>, Sesidhar Baddela <sebaddel@cisco.com>, open list <linux-kernel@vger.kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, "open list:BLUETOOTH DRIVERS" <linux-bluetooth@vger.kernel.org>, "open list:AMD IOMMU AMD-VI" <iommu@lists.linux-foundation.org>, "open list:QUALCOMM ATHEROS ATH9K WIRELESS DRIVER" <ath9k-devel@lists.ath9k.org>, Rafael Wysocki <rjw@rjwysocki.net>, Narsimhulu Musini <nmusini@cisco.com>, Wang Long <long.wanglong@huawei.com>, Tejun Heo <tj@kernel.org>, Michael Kerrisk <mtk.manpages@gmail.com>, QCA ath9k Development <ath9k-devel@qca.qualcomm.com>, Len Brown <lenb@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, "open list:CXGB4 ETHERNET DRIVER CXGB4" <netdev@vger.kernel.org>, Larry Finger <Larry.Finger@lwfinger.net>

On 14-09-15, 17:39, Arnd Bergmann wrote:
> On Monday 14 September 2015 09:21:54 Viresh Kumar wrote:
> > diff --git a/drivers/acpi/ec_sys.c b/drivers/acpi/ec_sys.c
> > index b4c216bab22b..bea8e425a8de 100644
> > --- a/drivers/acpi/ec_sys.c
> > +++ b/drivers/acpi/ec_sys.c
> > @@ -128,7 +128,7 @@ static int acpi_ec_add_debugfs(struct acpi_ec *ec, unsigned int ec_device_count)
> >  	if (!debugfs_create_x32("gpe", 0444, dev_dir, (u32 *)&first_ec->gpe))
> >  		goto error;
> >  	if (!debugfs_create_bool("use_global_lock", 0444, dev_dir,
> > -				 (u32 *)&first_ec->global_lock))
> > +				 &first_ec->global_lock))
> >  		goto error;
> >  
> >  	if (write_support)
> 
> This one might need a separate patch that can be backported to stable, as
> the original code is already broken on big-endian 64-bit machines:
> global_lock is 'unsigned long'.

Hmmm, so you suggest a single patch that will do s/unsigned long/u32
and that will be followed with this patch (almost) as is. Right?

Also, regarding the stable thing, we will surely not be able to
backport it straight away. But we should get it backported for sure.

@Greg: What all kernel versions you want this to be backported for?

-- 
viresh

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
