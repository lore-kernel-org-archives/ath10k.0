Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Date: Tue, 15 Sep 2015 10:13:19 +0100
From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: Re: [PATCH V3 2/2] debugfs: don't assume sizeof(bool) to be 4 bytes
Message-ID: <20150915091319.GH11200@ck-lbox>
References: <9b705747a138c96c26faee5218f7b47403195b28.1442305897.git.viresh.kumar@linaro.org>
 <27d37898b4be6b9b9f31b90135f8206ca079a868.1442305897.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <27d37898b4be6b9b9f31b90135f8206ca079a868.1442305897.git.viresh.kumar@linaro.org>
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
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "open list:NETWORKING DRIVERS
 (WIRELESS)" <linux-wireless@vger.kernel.org>, "moderated list:SOUND - SOC LAYER /
 DYNAMIC AUDIO POWER MANAGEM..." <alsa-devel@alsa-project.org>, Avri Altman <avri.altman@intel.com>, Stanislaw Gruszka <sgruszka@redhat.com>, Jiri Slaby <jirislaby@gmail.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Will Deacon <will.deacon@arm.com>, Jaroslav Kysela <perex@perex.cz>, "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>, Kalle Valo <kvalo@qca.qualcomm.com>, Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Luciano Coelho <luciano.coelho@intel.com>, Wang Long <long.wanglong@huawei.com>, Richard Fitzgerald <rf@opensource.wolfsonmicro.com>, Ingo Molnar <mingo@kernel.org>, open list <linux-kernel@vger.kernel.org>, Johan Hedberg <johan.hedberg@gmail.com>, Davidlohr Bueso <dave@stgolabs.net>, Johannes Berg <johannes.berg@intel.com>, Joonsoo Kim <js1304@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>, "open
 list:WOLFSON MICROELECTRONICS DRIVERS" <patches@opensource.wolfsonmicro.com>, Sebastian Ott <sebott@linux.vnet.ibm.com>, "open list:QUALCOMM ATHEROS ATH10K WIRELESS
 DRIVER" <ath10k@lists.infradead.org>, Intel Linux Wireless <ilw@linux.intel.com>, "open list:ACPI" <linux-acpi@vger.kernel.org>, Dmitry Monakhov <dmonakhov@openvz.org>, Nick Kossifidis <mickflemm@gmail.com>, "open list:B43 WIRELESS DRIVER" <b43-dev@lists.infradead.org>, Doug Thompson <dougthompson@xmission.com>, Gustavo Padovan <gustavo@padovan.org>, Sasha Levin <sasha.levin@oracle.com>, Tomas Winkler <tomas.winkler@intel.com>, sboyd@codeaurora.org, Len Brown <lenb@kernel.org>, linaro-kernel@lists.linaro.org, Hariprasad S <hariprasad@chelsio.com>, arnd@arndb.de, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Vlastimil Babka <vbabka@suse.cz>, Arik Nemtsov <arik@wizery.com>, Marcel Holtmann <marcel@holtmann.org>, "James E.J.
 Bottomley" <JBottomley@odin.com>, Michal Hocko <mhocko@suse.com>, Akinobu Mita <akinobu.mita@gmail.com>, QCA ath9k Development <ath9k-devel@qca.qualcomm.com>, Michael Kerrisk <mtk.manpages@gmail.com>, Tejun Heo <tj@kernel.org>, Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>, Steven Rostedt <rostedt@goodmis.org>, Florian Fainelli <f.fainelli@gmail.com>, Takashi Iwai <tiwai@suse.com>, Mel Gorman <mgorman@suse.de>, "moderated list:ARM64 PORT (AARCH64
 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>, "open list:EDAC-CORE" <linux-edac@vger.kernel.org>, Haggai Eran <haggaie@mellanox.com>, Narsimhulu Musini <nmusini@cisco.com>, Chaya Rachel Ivgi <chaya.rachel.ivgi@intel.com>, "open list:CISCO SCSI
 HBA DRIVER" <linux-scsi@vger.kernel.org>, Brian Silverman <bsilver16384@gmail.com>, "Luis R. Rodriguez" <mcgrof@do-not-panic.com>, gregkh@linuxfoundation.org, "open list:ULTRA-WIDEBAND (UWB)
 SUBSYSTEM:" <linux-usb@vger.kernel.org>, Rafael Wysocki <rjw@rjwysocki.net>, Liam Girdwood <lgirdwood@gmail.com>, Sesidhar Baddela <sebaddel@cisco.com>, Andy Lutomirski <luto@amacapital.net>, "open list:BLUETOOTH
 DRIVERS" <linux-bluetooth@vger.kernel.org>, "open
 list:AMD IOMMU (AMD-VI)" <iommu@lists.linux-foundation.org>, "open list:QUALCOMM ATHEROS ATH9K
 WIRELESS DRIVER" <ath9k-devel@lists.ath9k.org>, Thomas Gleixner <tglx@linutronix.de>, Johannes Weiner <hannes@cmpxchg.org>, Joe Perches <joe@perches.com>, Eliad Peller <eliad@wizery.com>, Andrew Morton <akpm@linux-foundation.org>, Alexander Duyck <alexander.h.duyck@redhat.com>, "open list:CXGB4 ETHERNET DRIVER (CXGB4)" <netdev@vger.kernel.org>, Larry Finger <Larry.Finger@lwfinger.net>

On Tue, Sep 15, 2015 at 02:04:59PM +0530, Viresh Kumar wrote:
> Long back 'bool' type used to be a typecast to 'int', but that changed
> in v2.6.19. And that is a typecast to _Bool now, which (mostly) takes
> just a byte. Anyway, the bool type is implementation defined, and better
> we don't assume its size to be 4 bytes or 1.
> 
> The problem with current code is that it reads/writes 4 bytes for a
> boolean, which will read/update 3 excess bytes following the boolean
> variable (when sizeof(bool) is 1 byte). And that can lead to hard to fix
> bugs. It was a nightmare cracking this one.
> 
> The debugfs code had this bug since the first time it got introduced,
> but was never got caught, strange. Maybe the bool variables (monitored
> by debugfs) were followed by an 'int' or something bigger and the pad
> bytes made sure, we never see this issue.
> 
> But the OPP (Operating performance points) library have three booleans
> allocated to contiguous bytes and this bug got hit quite soon (The
> debugfs support for OPP is yet to be merged). It showed up as corruption
> of the debugfs boolean symbols, where Y were becoming N and vice versa.
> 
> Fix it properly by changing the last argument of debugfs_create_bool(),
> to type 'bool *' instead of 'u32 *', so that it doesn't depend on sizeof
> bool at all.
> 
> That required updates to all user sites as well in a single commit.
> regmap core was also using debugfs_{read|write}_file_bool(), directly
> and variable types were updated for that to be bool as well.
> 
> Acked-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---

For the minor wm_adsp change:

Acked-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>

Thanks,
Charles

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
