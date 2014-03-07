Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ve0-x22a.google.com ([2607:f8b0:400c:c01::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WLsB1-0002fY-8p
 for ath10k@lists.infradead.org; Fri, 07 Mar 2014 10:38:52 +0000
Received: by mail-ve0-f170.google.com with SMTP id pa12so4108675veb.1
 for <ath10k@lists.infradead.org>; Fri, 07 Mar 2014 02:38:29 -0800 (PST)
MIME-Version: 1.0
From: Avery Pennarun <apenwarr@gmail.com>
Date: Fri, 7 Mar 2014 05:38:07 -0500
Message-ID: <CAHqTa-2NASvnpURqH=LbPMOi8GKHB23Xc3pxwULqnsXMrKHpow@mail.gmail.com>
Subject: Firmware crash when sending large numbers of forwarded packets
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
To: ath10k <ath10k@lists.infradead.org>

Hi,

I'm having a problem where if I transmit too fast out the ath10k
interface in AP mode, I get a near-immediate firmware crash.

Notes:
- I can generate this by running 'iperf -s' on a wifi station and
'iperf -c' on a separate machine on the wired LAN connected to the
ath10k AP.  (This transmits data in the downstream direction, ie. to
the wifi interface)
- If I use 'iperf -u' (UDP) it tries to restart the firmware, but the
transmit queue stays dead.  If I use iperf in the default TCP mode, it
restarts the firmware and generally recovers okay.
- If I run 'iperf -c' directly on the AP device instead of a separate
machine on the LAN, the crash never occurs.
- If I swap the direction of transmit (to the AP instead of from the
AP) the crash never occurs.
- CPU usage on the AP is always less than 1 CPU core (ARM CPU), so
it's probably not falling behind on processing.
- Using 40 or 80 MHz channel width for the test; also happens with 20
MHz but less frequently.
- Problem mostly doesn't occur until I exceed about 160 Mbit/sec.

Versions:
- kernel is based on current kvalo/for-linville branch (should I try
something else?) but seems to be the same in linux-next-20140114 so I
don't think this behaviour has changed lately.
- firmware version 10.1.467.2-1, but also tested with 10.1.467.1-1
with no difference.

I assume other people are not experiencing this or they would have
mentioned it by now.  What can I do to help debug this?

Logs:

[  360.717699] ath10k: firmware crashed!
[  360.721434] ath10k: hardware name qca988x hw2.0 version 0x4100016c
[  360.727669] ath10k: firmware version: 10.1.467.2-1
[  360.733695] ath10k: target register Dump Location: 0x0040AC14
[  360.740655] ath10k: target Register Dump
[  360.744652] ath10k: [00]: 0x4100016C 0x000015B3 0x009AA69E 0x00955B31
[  360.751163] ath10k: [04]: 0x009AA69E 0x00060530 0x00000002 0x00000000
[  360.757636] ath10k: [08]: 0x004139B8 0x00955A00 0x0040EE54 0x00000000
[  360.764185] ath10k: [12]: 0x00000009 0x00000000 0x0095808C 0x009580A2
[  360.770663] ath10k: [16]: 0x00958080 0x0094085D 0x00000000 0x00000000
[  360.777174] ath10k: [20]: 0x409AA69E 0x0040AD24 0x00000001 0x0000013A
[  360.783672] ath10k: [24]: 0x809A8892 0x0040AD84 0x0040E9F8 0xC09AA69E
[  360.790145] ath10k: [28]: 0x809A8920 0x0040ADD4 0x0040AE44 0x00400000
[  360.796640] ath10k: [32]: 0x809A8138 0x0040AE04 0x00000001 0x0040AE44
[  360.803133] ath10k: [36]: 0x809A7885 0x0040AE24 0x00411124 0x00411148
[  360.809603] ath10k: [40]: 0x809B3AAC 0x0040AE44 0x00000001 0x00000000
[  360.816099] ath10k: [44]: 0x809B39B8 0x0040AEA4 0x0041DAAC 0x00411784
[  360.822587] ath10k: [48]: 0x80942EB3 0x0040AEC4 0x0041DAAC 0x00000001
[  360.829057] ath10k: [52]: 0x80940F18 0x0040AF14 0x00000011 0x00403AD4
[  360.835550] ath10k: [56]: 0x80940EEA 0x0040AF44 0x00400000 0x00000000
[  361.840870] ath10k: suspend timed out - target pause event never came
[  362.119075] ath10k_pci 0000:00:00.0: dma_pool_destroy ath10k htt tx
pool, ffd8c000 busy
[  362.127193] ath10k_pci 0000:00:00.0: dma_pool_destroy ath10k htt tx
pool, ffd8d000 busy
[  362.135290] ath10k_pci 0000:00:00.0: dma_pool_destroy ath10k htt tx
pool, ffd8e000 busy
[  362.143372] ath10k_pci 0000:00:00.0: dma_pool_destroy ath10k htt tx
pool, ffd8f000 busy
[  362.151447] ath10k_pci 0000:00:00.0: dma_pool_destroy ath10k htt tx
pool, ffda9000 busy
[  362.159483] ath10k_pci 0000:00:00.0: dma_pool_destroy ath10k htt tx
pool, ffdaa000 busy
[  362.167543] ath10k_pci 0000:00:00.0: dma_pool_destroy ath10k htt tx
pool, ffdab000 busy
[  362.175602] ath10k_pci 0000:00:00.0: dma_pool_destroy ath10k htt tx
pool, ffdac000 busy
[  362.183668] ath10k_pci 0000:00:00.0: dma_pool_destroy ath10k htt tx
pool, ffdad000 busy
[  362.191725] ath10k_pci 0000:00:00.0: dma_pool_destroy ath10k htt tx
pool, ffdae000 busy
[  362.199773] ath10k_pci 0000:00:00.0: dma_pool_destroy ath10k htt tx
pool, ffdaf000 busy
[  362.207834] ath10k_pci 0000:00:00.0: dma_pool_destroy ath10k htt tx
pool, ffdb9000 busy
[  362.215896] ath10k_pci 0000:00:00.0: dma_pool_destroy ath10k htt tx
pool, ffdba000 busy
[  362.223959] ath10k_pci 0000:00:00.0: dma_pool_destroy ath10k htt tx
pool, ffdbb000 busy
[  362.490921]  phy1: Hardware restart was requested
[  363.804817] ath10k: device successfully recovered

Thanks,

Avery

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
