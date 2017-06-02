Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qk0-x231.google.com ([2607:f8b0:400d:c09::231])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dGqYd-0007Fw-QE
 for ath10k@lists.infradead.org; Fri, 02 Jun 2017 17:40:21 +0000
Received: by mail-qk0-x231.google.com with SMTP id p66so48509330qkf.3
 for <ath10k@lists.infradead.org>; Fri, 02 Jun 2017 10:39:59 -0700 (PDT)
MIME-Version: 1.0
From: David Parks <davidparks21@gmail.com>
Date: Fri, 2 Jun 2017 10:39:57 -0700
Message-ID: <CAEhz3L8uOpABoCbVuAeb62Jq=srjLt4u_f9Ub8QGZupE3xWoJw@mail.gmail.com>
Subject: Transmit performance unexpectedly low
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

Hi, for months I've been trying to understand why the performance of
my Athos wireless card in my laptop is significantly worse than what I
get on my Android phone. I often USB tether my phone when I need to
transfer large files.

I've posted a few questions along the way that got no resolution:
https://unix.stackexchange.com/questions/363293/transmit-bitrate-shown-in-iw-is-unexpectedly-low

I have the latest firmware drivers applied from:
https://github.com/kvalo/ath10k-firmware

The first issue I notice is that the reported transmit bitrate seems
to be locked at a low rate, however, I get faster than 6Mbit in speed
tests.

$ iw dev wlp5s0 station dump
Station 00:f2:8b:f9:81:8f (on wlp5s0)
inactive time: 0 ms
rx bytes: 564466344
rx packets: 494835
tx bytes: 64977046
tx packets: 236533
tx retries: 0
tx failed: 94
signal:   -46 dBm
signal avg: -46 dBm
tx bitrate: 6.0 MBit/s
rx bitrate: 300.0 MBit/s VHT-MCS 7 40MHz short GI VHT-NSS 2
authorized: yes
authenticated: yes
preamble: long
WMM/WME: yes
MFP: no
TDLS peer: no

On my laptop, I get a speed test with 109.98Mbps download / 21.91 Mbps upload

However on my Nexus 6p phone, in the same location, near the access
point, I get 121.74 Mbps download / 178.17 Mbps upload.

This is the wireless card shown from lspci:
05:00.0 Network controller: Qualcomm Atheros QCA6174 802.11ac Wireless
Network Adapter (rev 20)

Can anyone here help me understand this better?

To install the latest firmware I've followed some instructions from
here: https://askubuntu.com/questions/607707/ath10k-installation
I've copied the QCA6174 folder directly from the git repo and renamed
all the firmware* files to their base names.

Not sure if this is useful, but I'll include it:
$ modinfo ath10k_pci
filename:
/lib/modules/4.4.0-78-generic/kernel/drivers/net/wireless/ath/ath10k/ath10k_pci.ko
firmware:       ath10k/QCA9377/hw1.0/board.bin
firmware:       ath10k/QCA9377/hw1.0/firmware-5.bin
firmware:       ath10k/QCA6174/hw3.0/board-2.bin
firmware:       ath10k/QCA6174/hw3.0/board.bin
firmware:       ath10k/QCA6174/hw3.0/firmware-5.bin
firmware:       ath10k/QCA6174/hw3.0/firmware-4.bin
firmware:       ath10k/QCA6174/hw2.1/board-2.bin
firmware:       ath10k/QCA6174/hw2.1/board.bin
firmware:       ath10k/QCA6174/hw2.1/firmware-5.bin
firmware:       ath10k/QCA6174/hw2.1/firmware-4.bin
firmware:       ath10k/QCA988X/hw2.0/board-2.bin
firmware:       ath10k/QCA988X/hw2.0/board.bin
firmware:       ath10k/QCA988X/hw2.0/firmware-5.bin
firmware:       ath10k/QCA988X/hw2.0/firmware-4.bin
firmware:       ath10k/QCA988X/hw2.0/firmware-3.bin
firmware:       ath10k/QCA988X/hw2.0/firmware-2.bin
firmware:       ath10k/QCA988X/hw2.0/firmware.bin
license:        Dual BSD/GPL
description:    Driver support for Atheros QCA988X PCIe devices
author:         Qualcomm Atheros
srcversion:     8CBDAC7980FC042032AE6A6
alias:          pci:v0000168Cd00000042sv*sd*bc*sc*i*
alias:          pci:v0000168Cd00000040sv*sd*bc*sc*i*
alias:          pci:v0000168Cd0000003Esv*sd*bc*sc*i*
alias:          pci:v0000168Cd00000041sv*sd*bc*sc*i*
alias:          pci:v0000168Cd0000003Csv*sd*bc*sc*i*
depends:        ath10k_core
intree:         Y
vermagic:       4.4.0-78-generic SMP mod_unload modversions
parm:           irq_mode:0: auto, 1: legacy, 2: msi (default: 0) (uint)
parm:           reset_mode:0: auto, 1: warm only (default: 0) (uint)

Thanks,
David

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
