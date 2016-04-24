Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x22c.google.com ([2a00:1450:400c:c09::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1auHb5-0002oW-Nu
 for ath10k@lists.infradead.org; Sun, 24 Apr 2016 10:49:08 +0000
Received: by mail-wm0-x22c.google.com with SMTP id e201so58175868wme.0
 for <ath10k@lists.infradead.org>; Sun, 24 Apr 2016 03:48:42 -0700 (PDT)
From: Christian Lamparter <chunkeey@googlemail.com>
Subject: Re: [OpenWrt-Devel] How to initialize multiple phy radios
Date: Sun, 24 Apr 2016 12:48:39 +0200
Message-ID: <2596438.Cv6xmiar05@debian64>
In-Reply-To: <CA+i30h-Y_rB0kZfgWifk14Zw1CCkGZH5x5zf8+OH-GTwswXh3w@mail.gmail.com>
References: <CA+i30h-5GCJ0h9REAJE8TCdxNQDe8Sa=Fs=gbxpHEW3fOY-hMw@mail.gmail.com>
 <CA+i30h--nmpjeNK4S02a9o9qrQ-b3QR77WcRorxC5-Dame5hBw@mail.gmail.com>
 <CA+i30h-Y_rB0kZfgWifk14Zw1CCkGZH5x5zf8+OH-GTwswXh3w@mail.gmail.com>
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
To: David Hutchison <dhutchison@bluemesh.net>
Cc: OpenWrt Development List <openwrt-devel@lists.openwrt.org>, ath10k@lists.infradead.org

On Sunday, April 24, 2016 01:16:11 AM David Hutchison wrote:
> I spoke too soon:
> https://pci-ids.ucw.cz/read/PC/168c/0050
> 
> It is the QCA9887, so it's definitely on the PCIe bus and is being seen.
Does ath10k support the QCA9887? I see no entry for this pci-id (168c:0050)
in ath10k's pci table [0] and there's no definition of it in the hardware
header either [1]. The chip-id is also not present. I CC'ed ath10k, since
this seems to be a new chip that might be easy to add.
 
> On Sun, Apr 24, 2016 at 1:13 AM, David Hutchison
> <dhutchison@bluemesh.net> wrote:
> > Here is the PCI noise is in the kernel log from ath79_register_pci():
> >
> > [    0.510000] PCI host bridge to bus 0000:00
> > [    0.510000] pci_bus 0000:00: root bus resource [mem 0x10000000-0x11ffffff]
> > [    0.520000] pci_bus 0000:00: root bus resource [io  0x0000]
> > [    0.520000] pci_bus 0000:00: No busn resource found for root bus,
> > will use [bus 00-ff]
> > [    0.530000] pci 0000:00:00.0: [168c:0050] type 00 class 0x028000
> > [    0.530000] pci 0000:00:00.0: reg 10: [mem 0x10000000-0x101fffff 64bit]
> > [    0.530000] pci 0000:00:00.0: reg 30: [mem 0x00000000-0x0000ffff pref]
> > [    0.530000] pci 0000:00:00.0: supports D1
> > [    0.530000] pci 0000:00:00.0: PME# supported from D0 D1 D3hot
> > [    0.530000] pci_bus 0000:00: busn_res: [bus 00-ff] end is updated to 00
> > [    0.530000] pci 0000:00:00.0: BAR 0: assigned [mem
> > 0x10000000-0x101fffff 64bit]
> > [    0.530000] pci 0000:00:00.0: BAR 6: assigned [mem
> > 0x10200000-0x1020ffff pref]
> > [    0.540000] pci 0000:00:00.0: using irq 40 for pin 1
> >
> > I compiled lspci in and it reports:
> > 00:00.0 Class 0280: 168c:0050
> >
> > As far as I know that's just a vendor/product ID, I tried looking it
> > up to verify that it was indeed the atheros qca988x but couldn't find
> > anything for certain.
> >
> > I verified ath10k is loaded:
> > ath10k_pci             27629  0
> > ath10k_core           247226  1 ath10k_pci
> > ath                    18726  4 ath10k_core,ath9k,ath9k_common,ath9k_hw
> > mac80211              389729  2 ath10k_core,ath9k
> > cfg80211              217396  5 ath10k_core,ath9k,ath9k_common,ath,mac80211
> > compat                 19304  7
> > ath10k_pci,ath10k_core,ath9k,ath9k_common,ath9k_hw,mac80211,cfg80211
> >

Regards,
Christian

[0] <https://git.kernel.org/cgit/linux/kernel/git/wireless/wireless-testing.git/tree/drivers/net/wireless/ath/ath10k/pci.c#n60>

[1] <https://git.kernel.org/cgit/linux/kernel/git/wireless/wireless-testing.git/tree/drivers/net/wireless/ath/ath10k/hw.h#n25>


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
