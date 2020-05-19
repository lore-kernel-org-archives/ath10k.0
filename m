Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pl1-f195.google.com ([209.85.214.195])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jaqhL-0007z2-IT
 for ath10k@lists.infradead.org; Tue, 19 May 2020 01:05:37 +0000
Received: by mail-pl1-f195.google.com with SMTP id u22so4925049plq.12
 for <ath10k@lists.infradead.org>; Mon, 18 May 2020 18:05:33 -0700 (PDT)
Date: Tue, 19 May 2020 01:05:30 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: [PATCH v2 12/15] ath10k: use new module_firmware_crashed()
Message-ID: <20200519010530.GS11244@42.do-not-panic.com>
References: <CALLGbR+ht2V3m5f-aUbdwEMOvbsX8ebmzdWgX4jyWTbpHrXZ0Q@mail.gmail.com>
 <20200518190930.GO11244@42.do-not-panic.com>
 <e3d978c8fa6a4075f12e843548d41e2c8ab537d1.camel@sipsolutions.net>
 <20200518132828.553159d9@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <8d7a3bed242ac9d3ec55a4c97e008081230f1f6d.camel@sipsolutions.net>
 <20200518133521.6052042e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <d81601b17065d7dc3b78bf8d68faf0fbfdb8c936.camel@sipsolutions.net>
 <20200518134643.685fcb0e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <20200518212202.GR11244@42.do-not-panic.com>
 <20200518151645.4693cf30@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200518151645.4693cf30@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
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

On Mon, May 18, 2020 at 03:16:45PM -0700, Jakub Kicinski wrote:
> On Mon, 18 May 2020 21:22:02 +0000 Luis Chamberlain wrote:
> > Indeed my issue with devlink is that it did not seem generic enough for
> > all devices which use firmware and for which firmware can crash. Support
> > should not have to be "add devlink support" + "now use this new hook",
> > but rather a very lighweight devlink_crash(device) call we can sprinkly
> > with only the device as a functional requirement.
> 
> We can provide a lightweight devlink_crash(device) which only generates
> the notification, without the need to register the health reporter or a
> devlink instance upfront. But then we loose the ability to control the
> recovery, count errors, etc. So I'd think that's not the direction we
> want to go in.

Care to show me what the diff stat for a non devlink driver would look
like? Just keep in mind this taint is 1 line addition. Granted, if we
can use SmPL grammar to automate addition of an initial framework to a
driver that'd be great, but since the device addition is subsystem
specific (device_add() and friends), I don't suspect this will be easily
automated.

   Luis

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
