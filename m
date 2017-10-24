Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-io0-x22a.google.com ([2607:f8b0:4001:c06::22a])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e76oh-0004ng-3U
 for ath10k@lists.infradead.org; Tue, 24 Oct 2017 21:32:56 +0000
Received: by mail-io0-x22a.google.com with SMTP id f20so25435775ioj.9
 for <ath10k@lists.infradead.org>; Tue, 24 Oct 2017 14:32:34 -0700 (PDT)
MIME-Version: 1.0
From: Tolga Cakir <cevelnet@gmail.com>
Date: Tue, 24 Oct 2017 23:32:33 +0200
Message-ID: <CABcamCAj7_duDw9_Nx74nj3xj_LTsxqybjakOtWf4UgnZbYANQ@mail.gmail.com>
Subject: Re: LED support for QCA9980
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
To: ath10k@lists.infradead.org
Cc: nwfilardo@gmail.com

> Thanks to some hero's sleuthing around a GPL source dump
> (https://forum.openwrt.org/viewtopic.php?pid=336237#p336237) and a
> later suggestion to try flipping bits from userspace (using
> https://github.com/billfarrow/pcimem), I can report that, at least for
> the two QCA9980s in my possession (within the TP-Link C2600 gateway I
> have) that the speculation is correct: kicking on bit 17 (the value of
> ATH_BEELINER_LED) in 0x85018 of resource0 makes bit 17 in 0x85000 an
> active-low controller for the LEDs attached to the chip.

Hi! I've got the Zyxel NBG6817, which uses QCA9984 SoCs - very similar
to yours. I've investigated Zyxel's OEM firmware and also came across
QCA9984 GPIO pin 17 beeing used for the WiFi 2.4G and 5G LEDs.
Interestingly enough, Netgear R7800 also uses GPIO pin 17, according
to their firmware sources. Unfortunately, I was not able to find out
any address or verify your supplied address or find any other way to
manipulate the WiFi SoC's GPIOs.

I'm a hobby programmer and have worked on reverse-engineering USB
devices and Linux kernel drivers in the past and am now interested in
getting this to work. I'm familiar with the Linux LED API, but I'm
completely new to networking / PCI / ath10k.

What I need is a hint, how to cleanly access QCA9984 GPIOs (or atleast
GPIO pin 17) within ath10k / kernel. Exposing that access to userspace
via Linux LED API is not an issue - I can do that.

Any ideas? I'm thankful for any help or hint I can get!

Cheers,
Tolga

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
