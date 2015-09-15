Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Message-ID: <1442313464.1914.21.camel@sipsolutions.net>
Subject: Re: [PATCH V3 2/2] debugfs: don't assume sizeof(bool) to be 4 bytes
From: Johannes Berg <johannes@sipsolutions.net>
Date: Tue, 15 Sep 2015 12:37:44 +0200
In-Reply-To: <27d37898b4be6b9b9f31b90135f8206ca079a868.1442305897.git.viresh.kumar@linaro.org>
References: <9b705747a138c96c26faee5218f7b47403195b28.1442305897.git.viresh.kumar@linaro.org>
 <27d37898b4be6b9b9f31b90135f8206ca079a868.1442305897.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
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
To: Viresh Kumar <viresh.kumar@linaro.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Cc: "open list:NETWORKING DRIVERS
 (WIRELESS)" <linux-wireless@vger.kernel.org>, "moderated list:SOUND - SOC LAYER /
 DYNAMIC AUDIO POWER MANAGEM..." <alsa-devel@alsa-project.org>, "Altman,
 Avri" <avri.altman@intel.com>, Stanislaw Gruszka <sgruszka@redhat.com>, Jiri Slaby <jirislaby@gmail.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Will Deacon <will.deacon@arm.com>, Jaroslav Kysela <perex@perex.cz>, "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>, Kalle Valo <kvalo@qca.qualcomm.com>, "Grumbach,
 Emmanuel" <emmanuel.grumbach@intel.com>, "Coelho,
 Luciano" <luciano.coelho@intel.com>, Wang Long <long.wanglong@huawei.com>, Richard Fitzgerald <rf@opensource.wolfsonmicro.com>, Ingo Molnar <mingo@kernel.org>, open list <linux-kernel@vger.kernel.org>, Johan Hedberg <johan.hedberg@gmail.com>, Davidlohr Bueso <dave@stgolabs.net>, Joonsoo Kim <js1304@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>, "open
 list:WOLFSON MICROELECTRONICS DRIVERS" <patches@opensource.wolfsonmicro.com>, Sebastian Ott <sebott@linux.vnet.ibm.com>, "open list:QUALCOMM ATHEROS ATH10K WIRELESS
 DRIVER" <ath10k@lists.infradead.org>, Intel Linux Wireless <ilw@linux.intel.com>, "open list:ACPI" <linux-acpi@vger.kernel.org>, Dmitry Monakhov <dmonakhov@openvz.org>, Nick Kossifidis <mickflemm@gmail.com>, "open list:B43 WIRELESS DRIVER" <b43-dev@lists.infradead.org>, Doug Thompson <dougthompson@xmission.com>, Gustavo Padovan <gustavo@padovan.org>, Sasha Levin <sasha.levin@oracle.com>, "Winkler, Tomas" <tomas.winkler@intel.com>, "sboyd@codeaurora.org" <sboyd@codeaurora.org>, Len Brown <lenb@kernel.org>, "linaro-kernel@lists.linaro.org" <linaro-kernel@lists.linaro.org>, Hariprasad S <hariprasad@chelsio.com>, "arnd@arndb.de" <arnd@arndb.de>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Vlastimil Babka <vbabka@suse.cz>, Arik Nemtsov <arik@wizery.com>, Marcel Holtmann <marcel@holtmann.org>, "James E.J. Bottomley" <JBottomley@odin.com>, Michal Hocko <mhocko@suse.com>, Akinobu Mita <akinobu.mita@gmail.com>, QCA ath9k Development <ath9k-devel@qca.qualcomm.com>, Michael Kerrisk <mtk.manpages@gmail.com>, Tejun Heo <tj@kernel.org>, Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>, Steven Rostedt <rostedt@goodmis.org>, Takashi Iwai <tiwai@suse.com>, Florian Fainelli <f.fainelli@gmail.com>, Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, Mel Gorman <mgorman@suse.de>, "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>, "open list:EDAC-CORE" <linux-edac@vger.kernel.org>, Haggai Eran <haggaie@mellanox.com>, Narsimhulu Musini <nmusini@cisco.com>, "Ivgi, Chaya Rachel" <chaya.rachel.ivgi@intel.com>, "open list:CISCO SCSI
 HBA DRIVER" <linux-scsi@vger.kernel.org>, Brian Silverman <bsilver16384@gmail.com>, "Luis R. Rodriguez" <mcgrof@do-not-panic.com>, "open list:CXGB4 ETHERNET DRIVER (CXGB4)" <netdev@vger.kernel.org>, "open list:ULTRA-WIDEBAND (UWB)
 SUBSYSTEM:" <linux-usb@vger.kernel.org>, Rafael Wysocki <rjw@rjwysocki.net>, Liam Girdwood <lgirdwood@gmail.com>, Sesidhar Baddela <sebaddel@cisco.com>, Andy Lutomirski <luto@amacapital.net>, "open list:BLUETOOTH DRIVERS" <linux-bluetooth@vger.kernel.org>, "open list:AMD IOMMU (AMD-VI)" <iommu@lists.linux-foundation.org>, "open list:QUALCOMM ATHEROS ATH9K
 WIRELESS DRIVER" <ath9k-devel@lists.ath9k.org>, Thomas Gleixner <tglx@linutronix.de>, Johannes Weiner <hannes@cmpxchg.org>, Joe Perches <joe@perches.com>, Eliad Peller <eliad@wizery.com>, Andrew Morton <akpm@linux-foundation.org>, Alexander Duyck <alexander.h.duyck@redhat.com>, Larry Finger <Larry.Finger@lwfinger.net>

Hi,

This email has far too many people Cc'ed on it - I don't think vger is
even accepting it for that reason. You should probably restrict it to
just a few lists when you resubmit.

> The problem with current code is that it reads/writes 4 bytes for a
> boolean, which will read/update 3 excess bytes following the boolean
> variable (when sizeof(bool) is 1 byte). And that can lead to hard to 
> fix bugs. It was a nightmare cracking this one.

Unless you're ignoring (or worse, casting away) type warnings, there's
no problem/bug at all, you just have to define all the variables used
with debugfs_create_bool() as actual u32 variables.

It sounds like you are/were doing something like the following:

bool a, b, c;
...
debugfs_create_bool("a", 0600, dir, (u32 *)&a);

which is quite clearly invalid.

Had you properly defined them as u32, as everyone (except for the ACPI
case) does, there wouldn't have been any problem:

u32 a, b, c;
...
debugfs_create_bool("a", 0600, dir, &a);


As far as I can tell, there's no bug in the API. It might be a bit
strange to have a set of functions called debugfs_create_<type> and
then one of them doesn't actually use the type from the name, but
that's only a problem if you blindly add casts or ignore the compiler
warnings you'd get without casts.

In other words, I think your commit log is extremely misleading. The
API perhaps has some inconsistent naming, but all this talk about the
sizeof(bool) etc. is simply completely irrelevant since "bool" is not
the type used here at all. There's nothing to fix in any of the code
you're changing (again, apart from ACPI.)

That said, I don't actually object to this change itself, being able to
actually use bool variables with debugfs_create_bool would be nice.
However, that shouldn't be documented as a bugfix or anything like
that, merely as a cleanup to make the API naming more consistent and to
be able to use the (smaller and often more convenient) bool type.

Clearly, it would also lead to less confusion, as we see in ACPI and
hear from your OPP code. Note that ACPI is even more confused though
since it uses "unsigned long", so it's entirely possible that somebody
actually thought about that case and decided not to worry about 64-bit
big-endian platforms.

Of course this also means that only the ACPI patch is a candidate for s
table.

johannes

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
