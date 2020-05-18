Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pf1-f194.google.com ([209.85.210.194])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1janD3-00036z-C1
 for ath10k@lists.infradead.org; Mon, 18 May 2020 21:22:06 +0000
Received: by mail-pf1-f194.google.com with SMTP id v63so5536649pfb.10
 for <ath10k@lists.infradead.org>; Mon, 18 May 2020 14:22:05 -0700 (PDT)
Date: Mon, 18 May 2020 21:22:02 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: [PATCH v2 12/15] ath10k: use new module_firmware_crashed()
Message-ID: <20200518212202.GR11244@42.do-not-panic.com>
References: <abf22ef3-93cb-61a4-0af2-43feac6d7930@candelatech.com>
 <20200518171801.GL11244@42.do-not-panic.com>
 <CALLGbR+ht2V3m5f-aUbdwEMOvbsX8ebmzdWgX4jyWTbpHrXZ0Q@mail.gmail.com>
 <20200518190930.GO11244@42.do-not-panic.com>
 <e3d978c8fa6a4075f12e843548d41e2c8ab537d1.camel@sipsolutions.net>
 <20200518132828.553159d9@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <8d7a3bed242ac9d3ec55a4c97e008081230f1f6d.camel@sipsolutions.net>
 <20200518133521.6052042e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <d81601b17065d7dc3b78bf8d68faf0fbfdb8c936.camel@sipsolutions.net>
 <20200518134643.685fcb0e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200518134643.685fcb0e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
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
To: Jakub Kicinski <kuba@kernel.org>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, aquini@redhat.com, peterz@infradead.org, daniel.vetter@ffwll.ch, mchehab+samsung@kernel.org, will@kernel.org, Ben Greear <greearb@candelatech.com>, bhe@redhat.com, ath10k@lists.infradead.org, Steve deRosier <derosier@gmail.com>, Takashi Iwai <tiwai@suse.de>, mingo@redhat.com, dyoung@redhat.com, pmladek@suse.com, keescook@chromium.org, arnd@arndb.de, gpiccoli@canonical.com, rostedt@goodmis.org, cai@lca.pw, tglx@linutronix.de, andriy.shevchenko@linux.intel.com, Johannes Berg <johannes@sipsolutions.net>, Kalle Valo <kvalo@codeaurora.org>, Network Development <netdev@vger.kernel.org>, schlad@suse.de, LKML <linux-kernel@vger.kernel.org>, jeyu@kernel.org, akpm@linux-foundation.org, "David S. Miller" <davem@davemloft.net>

On Mon, May 18, 2020 at 01:46:43PM -0700, Jakub Kicinski wrote:
> On Mon, 18 May 2020 22:41:48 +0200 Johannes Berg wrote:
> > On Mon, 2020-05-18 at 13:35 -0700, Jakub Kicinski wrote:
> > > It's intended to be a generic netlink channel for configuring devices.
> > > 
> > > All the firmware-related interfaces have no dependencies on netdevs,
> > > in fact that's one of the reasons we moved to devlink - we don't want
> > > to hold rtnl lock just for talking to device firmware.  
> > 
> > Sounds good :)
> > 
> > So I guess Luis just has to add some way in devlink to hook up devlink
> > health in a simple way to drivers, perhaps? I mean, many drivers won't
> > really want to use devlink for anything else, so I guess it should be as
> > simple as the API that Luis proposed ("firmware crashed for this struct
> > device"), if nothing more interesting is done with devlink?
> > 
> > Dunno. But anyway sounds like it should somehow integrate there rather
> > than the way this patchset proposed?
> 
> Right, that'd be great. Simple API to register a devlink instance with
> whatever number of reporters the device would need. I'm happy to help.

Indeed my issue with devlink is that it did not seem generic enough for
all devices which use firmware and for which firmware can crash. Support
should not have to be "add devlink support" + "now use this new hook",
but rather a very lighweight devlink_crash(device) call we can sprinkly
with only the device as a functional requirement.

  Luis

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
