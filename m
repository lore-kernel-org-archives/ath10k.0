Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bnYoU-0000U4-Nf
 for ath10k@lists.infradead.org; Fri, 23 Sep 2016 22:19:23 +0000
From: "Pedersen, Thomas" <twp@qca.qualcomm.com>
Subject: Re: ath10k mesh + ap + encryption?
Date: Fri, 23 Sep 2016 22:18:49 +0000
Message-ID: <1474669037.16013.9.camel@qca.qualcomm.com>
References: <2661831.slnB0LOeVt@prime> <3247815.ey5ZWkP5uX@prime>
 <1473789271.27738.4.camel@qca.qualcomm.com> <5898628.mmcCycDigQ@prime>
In-Reply-To: <5898628.mmcCycDigQ@prime>
Content-Language: en-US
Content-ID: <DB7BA7BD96334D44AF97A3205FDCCC3C@qualcomm.com>
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
To: Simon Wunderlich <sw@simonwunderlich.de>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, "Valo,
 Kalle" <kvalo@qca.qualcomm.com>, "openwrt-devel@lists.openwrt.org" <openwrt-devel@lists.openwrt.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Mon, 2016-09-19 at 08:43 +0200, Simon Wunderlich wrote:
> On Tuesday, September 13, 2016 5:54:38 PM CEST Pedersen, Thomas wrote:
> > On Tue, 2016-09-13 at 14:30 +0200, Simon Wunderlich wrote:
> > 
> > > [...]
> > >
> > > Thanks for the clarification. We will then stick to the 70's branch
> > > then.
> > > 
> > > Does anyone have pointers for the other questions? :) I would believe
> > > hat many 
> > > people would be interested in running AP + Mesh encrypted at the same
> > > time (at 
> > > least in the open source community ...).
> > 
> > 
> > We're testing encrypted AP + Mesh quite successfully right now with
> > this firmware: https://github.com/kvalo/ath10k-firmware/commit/307cb46b
> > 06661ebd3186723b5002de769c7add83, of course that is for a QCA4019 chip.
> > Which chip are you using? I can poke the firmware guys for possibility
> > of getting a 10.4.3.2 firmware build for it.
> 
> Hi Thomas,
> 
> thanks for the hint! We are using an older QCA9882. I assume your firmware will 
> not work for this one? If you can poke the firmware guys, that would be great. 
> :)

Hi Simon,

According to firmware guys the latest code can actually compile down to
any chipset, so it should simply be a matter of getting builds released.
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
