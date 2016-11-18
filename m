Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c7mJC-0000Hv-6h
 for ath10k@lists.infradead.org; Fri, 18 Nov 2016 16:46:40 +0000
Received: by mail-wm0-x243.google.com with SMTP id a20so7957134wme.2
 for <ath10k@lists.infradead.org>; Fri, 18 Nov 2016 08:46:17 -0800 (PST)
From: Christian Lamparter <chunkeey@googlemail.com>
Subject: IPQ4019 Firmware: board-2.bin vs board.bin
Date: Fri, 18 Nov 2016 17:46:14 +0100
Message-ID: <3020314.NNveBmB38o@debian64>
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Cc: "Valo, Kalle" <kvalo@qca.qualcomm.com>

Hello,

I've acquired a IPQ4019 Router (Asus RT-AC58U). And It has a IPQ4019-SoC.
I'm currently in the process of porting it to LEDE. I can report that the
router is booting and I got the ath10k to work with 4.8.8 +
LEDE's compat-wireless (2016-10-08-1).

Now, I ran across a small discrepancy with the provided firmware for
the IPQ4019. From the ath10k's driver prospective it seems that the
board-2.bin provided on github[0] has the wrong filename:

ath10k_ahb a000000.wifi: Direct firmware load for ath10k/pre-cal-ahb-a000000.wifi.bin failed with error -2
ath10k_ahb a000000.wifi: Falling back to user helper
firmware ath10k!pre-cal-ahb-a000000.wifi.bin: firmware_loading_store: map pages failed
ath10k_ahb a000000.wifi: qca4019 hw1.0 target 0x01000000 chip_id 0x003b00ff sub 0000:0000
ath10k_ahb a000000.wifi: kconfig debug 0 debugfs 1 tracing 0 dfs 1 testmode 1
ath10k_ahb a000000.wifi: firmware ver 10.4-3.2.1-00044 api 5 features no-p2p,mfp,peer-flow-ctrl,btcoex-param crc32 b9833652
ath10k_ahb a000000.wifi: failed to fetch board data for bus=ahb,vendor=0000,device=0000,subsystem-vendor=0000,subsystem-devn
ath10k_ahb a000000.wifi: Direct firmware load for ath10k/QCA4019/hw1.0/board.bin failed with error -2
ath10k_ahb a000000.wifi: Falling back to user helper
firmware ath10k!QCA4019!hw1.0!board.bin: firmware_loading_store: map pages failed
ath10k_ahb a000000.wifi: failed to fetch board data
ath10k_ahb a000000.wifi: failed to fetch board file: -11
ath10k_ahb a000000.wifi: could not probe fw (-11)

Now, If I rename board-2.bin to board.bin it works fine and the device initializes
successfully (and seems to work too):

ath10k_ahb a000000.wifi: Direct firmware load for ath10k/pre-cal-ahb-a000000.wifi.bin failed with error -2
ath10k_ahb a000000.wifi: Falling back to user helper
firmware ath10k!pre-cal-ahb-a000000.wifi.bin: firmware_loading_store: map pages failed
ath10k_ahb a000000.wifi: qca4019 hw1.0 target 0x01000000 chip_id 0x003b00ff sub 0000:0000
ath10k_ahb a000000.wifi: kconfig debug 0 debugfs 1 tracing 0 dfs 1 testmode 1
ath10k_ahb a000000.wifi: firmware ver 10.4-3.2.1-00044 api 5 features no-p2p,mfp,peer-flow-ctrl,btcoex-param crc32 b9833652
ath10k_ahb a000000.wifi: Direct firmware load for ath10k/QCA4019/hw1.0/board-2.bin failed with error -2
ath10k_ahb a000000.wifi: Falling back to user helper
firmware ath10k!QCA4019!hw1.0!board-2.bin: firmware_loading_store: map pages failed
ath10k_ahb a000000.wifi: board_file api 1 bmi_id N/A crc32 9e6ce62c
ath10k_ahb a000000.wifi: htt-ver 2.2 wmi-op 6 htt-op 4 cal file max-sta 512 raw 0 hwcrypto 1
ath: EEPROM regdomain: 0x0
ath: EEPROM indicates default country code should be used
ath: doing EEPROM country->regdmn map search
ath: country maps to regdmn code: 0x3a
ath: Country alpha2 being used: US
ath: Regpair used: 0x3a

What's up with the board-2.bin name? Kalle, can you rename it or
should ath10k look for board-2.bin instead?

Regards,
Christian

[0] <https://github.com/kvalo/ath10k-firmware/tree/master/QCA4019/hw1.0>


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
