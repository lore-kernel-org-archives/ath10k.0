Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from kirsty.vergenet.net ([202.4.237.240])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1ddn9Q-0007tU-RX
 for ath10k@lists.infradead.org; Sat, 05 Aug 2017 00:41:11 +0000
Date: Sat, 5 Aug 2017 09:40:38 +0900
From: Carsten Haitzler (The Rasterman) <raster@rasterman.com>
Subject: ath10k QCA6174 not working -> missing data in board2.bin?
Message-Id: <20170805094038.a46e864a48cae1ad50b10bab@rasterman.com>
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
To: ath10k@lists.infradead.org

I've scored myself a new laptop. With that come new problems.

I updated to 4.12.0 to make sure i'm on the latest.

lspci says:

01:00.0 Network controller: Qualcomm Atheros QCA6174 802.11ac Wireless Network Adapter (rev 32)

So relevant bits from dmesg:

[  124.268483] ath10k_pci 0000:01:00.0: pci irq msi oper_irq_mode 2 irq_mode 0 reset_mode 0
[  124.524661] ath10k_pci 0000:01:00.0: qca6174 hw3.2 target 0x05030000 chip_id 0x00340aff sub 144d:c14f
[  124.524668] ath10k_pci 0000:01:00.0: kconfig debug 0 debugfs 1 tracing 0 dfs 0 testmode 0
[  124.526309] ath10k_pci 0000:01:00.0: firmware ver WLAN.RM.4.4.1-00008-QCARMSWP-1 api 6 features wowlan,ignore-otp crc32 bdced4e9
[  124.590884] ath10k_pci 0000:01:00.0: failed to fetch board data for bus=pci,vendor=168c,device=003e,subsystem-vendor=144d,subsystem-device=c14f,variant=K from ath10k/QCA6174/hw3.0/board-2.bin
[  124.590901] ath10k_pci 0000:01:00.0: board_file api 1 bmi_id N/A crc32 ed5f849a
[  125.164076] ath10k_pci 0000:01:00.0: Unknown eventid: 118809
[  125.167113] ath10k_pci 0000:01:00.0: Unknown eventid: 90118

I've tried firmware-6 from:

  https://github.com/kvalo/ath10k-firmware/tree/master/QCA6174/hw3.0

Specifically firmware-6.bin_WLAN.RM.4.4.1-00008-QCARMSWP-1. firmware-4.bin also is a no go.

How can I help make this work? I have all the windows .bin's but none of them
match the same header that the Linux fw bin files have (but a chunk of the
binary seems familiar having a quick binary dump of it). There is some
mysterious way of generating the Linux firmware files I can't google for.

I also have some help from the OEM - the engineers who made the laptop (not
the chip wifi maker though). I have already verified which GPIO lines control
RFkill on this device (and they are clear and unkilled by default - both lines
up at 1 and it's confirmed that this means RF is unblocked from the engineers.
It took me a while to figure out their GPIO mapping table/naming onto kernel
GPIO numbering). So the Wifi (an BT actually) should be powered on. It's a
combo chip.

So how can I help. What data do I need to scrounge to provide. How are firmware
files built to work for Linux (based off the windows ones) for ath10k? Any pointers on what to look into and what to poke? This smells of something firmware based and at this point I have no documentation or information about it. Perhaps there are people here who know something?

-- 
------------- Codito, ergo sum - "I code, therefore I am" --------------
The Rasterman (Carsten Haitzler)    raster@rasterman.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
