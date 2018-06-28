Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fYTnx-0003SH-QM
 for ath10k@lists.infradead.org; Thu, 28 Jun 2018 10:05:56 +0000
Received: by mail-qt0-x241.google.com with SMTP id s47-v6so4171185qth.7
 for <ath10k@lists.infradead.org>; Thu, 28 Jun 2018 03:05:23 -0700 (PDT)
From: Sven Eckelmann <sven.eckelmann@openmesh.com>
Subject: ath10k: tpc_stats(_final) odd twicepowers and 160Mhz not supported
Date: Thu, 28 Jun 2018 12:05:18 +0200
Message-ID: <2557834.d2DaqBHz1S@bentobox>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1903262461180116890=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Cc: ath10k@lists.infradead.org, Maharaja Kennadyrajan <c_mkenna@qti.qualcomm.com>

--===============1903262461180116890==
Content-Type: multipart/signed; boundary="nextPart2451564.vKJUQue75s"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart2451564.vKJUQue75s
Content-Type: multipart/mixed; boundary="nextPart2173744.7UEKSk6ib0"
Content-Transfer-Encoding: 7Bit

This is a multi-part message in MIME format.

--nextPart2173744.7UEKSk6ib0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi,

I have some small question regarding the debugging functionality introduced by 
commit bc64d05220f3 ("ath10k: debugfs support to get final TPC stats for 10.4 
variants") [1] and commit 295426669cd6 ("ath10k: implement debugfs interface 
for Transmit Power Control stats") [2]. Goal of this is to find out whether 
the VHT160 MHz CTLs are correctly applied.


160MHz support
==============

I have an QCA9888 which supports 160MHz (mode 15). But the VHT160 entries are 
not shown in the results by tpc_stats(_final). I have also no idea whether 
this is actually reported by the firmware. What is the state here?


Validity of Output
==================

And are you sure that it is reported correctly for the rest of the rates? I 
have for example now configured channel 36 VHT80 (US) with firmware 
10.4-3.6-00140 on an QCA4019 device (A42 when you require details). I would 
have expected values similar to "per chain txpower" (*2) in the attached 
a42.txt. Both tpc_stats and tpc_stats_final give me the same output. But 
instead of seeing a flat 14.5 (*2) for VHT80, the per chain twicepower jumps
around a lot.

It even looks like the tables only contains copies of the same VHT values (but 
different between CDD and STBC)  and not specific ones for VHT20/VHT40/VHT80.

See the CTLs and targetpowers as reference. The BDFs can be extracted from the 
QCA4019 board-2.bin [3] (bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=OM-A42)
using Kalle's ath10k-bdencoder [4]. 


Misc
====

* What is "HTCUP"?
* When tpc_value1 is for chain1, how to you get to this when the CTL contains 
  data with following bitmaps:

  - TX 0xe NSS 0xf
  - TX 0x1 NSS 0x1
  - TX 0xe NSS 0x2

  Is only the first entry used for the first chain when two streams will be 
  transmitted?


Kind regards,
	Sven


[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=bc64d05220f3e34cf432a166b83c8fff14cd7a3d
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=295426669cd68efc84657e6ee426499cfb54346e
[3] https://github.com/kvalo/ath10k-firmware/blob/master/QCA4019/hw1.0/board-2.bin
[4] https://github.com/qca/qca-swiss-army-knife/blob/master/tools/scripts/ath10k/ath10k-bdencoder
--nextPart2173744.7UEKSk6ib0
Content-Disposition: attachment; filename="a42.txt"
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"; name="a42.txt"

Calculated powers for:
======================

* Device: a42
* Radio: 5GHz
* Channel: 36 (5GHz)
* HT-Mode: VHT80
* County: US
* User TX-power limit: 35
* Attribute: beamforming=False

Powers per rate:
================

* OFDM/LEGACY_TARGET_RATE_6_9:
  - per chain txpower: 18.0dBm
  - limited by: eeprom_ctl_fcc
* OFDM/LEGACY_TARGET_RATE_12:
  - per chain txpower: 18.0dBm
  - limited by: eeprom_ctl_fcc
* OFDM/LEGACY_TARGET_RATE_18:
  - per chain txpower: 18.0dBm
  - limited by: eeprom_ctl_fcc
* OFDM/LEGACY_TARGET_RATE_24:
  - per chain txpower: 18.0dBm
  - limited by: eeprom_powertable, eeprom_ctl_fcc
* OFDM/LEGACY_TARGET_RATE_36:
  - per chain txpower: 17.0dBm
  - limited by: eeprom_powertable
* OFDM/LEGACY_TARGET_RATE_48:
  - per chain txpower: 16.0dBm
  - limited by: eeprom_powertable
* OFDM/LEGACY_TARGET_RATE_54:
  - per chain txpower: 15.0dBm
  - limited by: eeprom_powertable
* VHT20/HT_TARGET_RATE_0-SU-NSS1:
  - per chain txpower: 18.0dBm
  - limited by: eeprom_ctl_fcc
* VHT20/HT_TARGET_RATE_0-SU-NSS2:
  - per chain txpower: 18.0dBm
  - limited by: eeprom_ctl_fcc
* VHT20/HT_TARGET_RATE_1-SU-NSS1:
  - per chain txpower: 18.0dBm
  - limited by: eeprom_ctl_fcc
* VHT20/HT_TARGET_RATE_1-SU-NSS2:
  - per chain txpower: 18.0dBm
  - limited by: eeprom_ctl_fcc
* VHT20/HT_TARGET_RATE_2-SU-NSS1:
  - per chain txpower: 18.0dBm
  - limited by: eeprom_ctl_fcc
* VHT20/HT_TARGET_RATE_2-SU-NSS2:
  - per chain txpower: 18.0dBm
  - limited by: eeprom_ctl_fcc
* VHT20/HT_TARGET_RATE_3-SU-NSS1:
  - per chain txpower: 18.0dBm
  - limited by: eeprom_powertable, eeprom_ctl_fcc
* VHT20/HT_TARGET_RATE_3-SU-NSS2:
  - per chain txpower: 18.0dBm
  - limited by: eeprom_powertable, eeprom_ctl_fcc
* VHT20/HT_TARGET_RATE_4-SU-NSS1:
  - per chain txpower: 17.0dBm
  - limited by: eeprom_powertable
* VHT20/HT_TARGET_RATE_4-SU-NSS2:
  - per chain txpower: 17.0dBm
  - limited by: eeprom_powertable
* VHT20/HT_TARGET_RATE_5-SU-NSS1:
  - per chain txpower: 16.0dBm
  - limited by: eeprom_powertable
* VHT20/HT_TARGET_RATE_5-SU-NSS2:
  - per chain txpower: 16.0dBm
  - limited by: eeprom_powertable
* VHT20/HT_TARGET_RATE_6-SU-NSS1:
  - per chain txpower: 15.0dBm
  - limited by: eeprom_powertable
* VHT20/HT_TARGET_RATE_6-SU-NSS2:
  - per chain txpower: 15.0dBm
  - limited by: eeprom_powertable
* VHT20/HT_TARGET_RATE_7-SU-NSS1:
  - per chain txpower: 15.0dBm
  - limited by: eeprom_powertable
* VHT20/HT_TARGET_RATE_7-SU-NSS2:
  - per chain txpower: 15.0dBm
  - limited by: eeprom_powertable
* VHT20/HT_TARGET_RATE_8-SU-NSS1:
  - per chain txpower: 15.0dBm
  - limited by: eeprom_powertable
* VHT20/HT_TARGET_RATE_8-SU-NSS2:
  - per chain txpower: 15.0dBm
  - limited by: eeprom_powertable
* VHT20/HT_TARGET_RATE_9-SU-NSS1:
  - per chain txpower: 15.0dBm
  - limited by: eeprom_powertable
* VHT20/HT_TARGET_RATE_9-SU-NSS2:
  - per chain txpower: 15.0dBm
  - limited by: eeprom_powertable
* VHT20/HT_TARGET_RATE_0-MU-NSS1:
  - per chain txpower: 18.0dBm
  - limited by: eeprom_ctl_fcc
* VHT20/HT_TARGET_RATE_0-MU-NSS2:
  - per chain txpower: 18.0dBm
  - limited by: eeprom_ctl_fcc
* VHT20/HT_TARGET_RATE_1-MU-NSS1:
  - per chain txpower: 18.0dBm
  - limited by: eeprom_ctl_fcc
* VHT20/HT_TARGET_RATE_1-MU-NSS2:
  - per chain txpower: 18.0dBm
  - limited by: eeprom_ctl_fcc
* VHT20/HT_TARGET_RATE_2-MU-NSS1:
  - per chain txpower: 18.0dBm
  - limited by: eeprom_ctl_fcc
* VHT20/HT_TARGET_RATE_2-MU-NSS2:
  - per chain txpower: 18.0dBm
  - limited by: eeprom_ctl_fcc
* VHT20/HT_TARGET_RATE_3-MU-NSS1:
  - per chain txpower: 18.0dBm
  - limited by: eeprom_powertable, eeprom_ctl_fcc
* VHT20/HT_TARGET_RATE_3-MU-NSS2:
  - per chain txpower: 18.0dBm
  - limited by: eeprom_powertable, eeprom_ctl_fcc
* VHT20/HT_TARGET_RATE_4-MU-NSS1:
  - per chain txpower: 17.0dBm
  - limited by: eeprom_powertable
* VHT20/HT_TARGET_RATE_4-MU-NSS2:
  - per chain txpower: 17.0dBm
  - limited by: eeprom_powertable
* VHT20/HT_TARGET_RATE_5-MU-NSS1:
  - per chain txpower: 16.0dBm
  - limited by: eeprom_powertable
* VHT20/HT_TARGET_RATE_5-MU-NSS2:
  - per chain txpower: 16.0dBm
  - limited by: eeprom_powertable
* VHT20/HT_TARGET_RATE_6-MU-NSS1:
  - per chain txpower: 15.0dBm
  - limited by: eeprom_powertable
* VHT20/HT_TARGET_RATE_6-MU-NSS2:
  - per chain txpower: 15.0dBm
  - limited by: eeprom_powertable
* VHT20/HT_TARGET_RATE_7-MU-NSS1:
  - per chain txpower: 15.0dBm
  - limited by: eeprom_powertable
* VHT20/HT_TARGET_RATE_7-MU-NSS2:
  - per chain txpower: 15.0dBm
  - limited by: eeprom_powertable
* VHT20/HT_TARGET_RATE_8-MU-NSS1:
  - per chain txpower: 15.0dBm
  - limited by: eeprom_powertable
* VHT20/HT_TARGET_RATE_8-MU-NSS2:
  - per chain txpower: 15.0dBm
  - limited by: eeprom_powertable
* VHT20/HT_TARGET_RATE_9-MU-NSS1:
  - per chain txpower: 15.0dBm
  - limited by: eeprom_powertable
* VHT20/HT_TARGET_RATE_9-MU-NSS2:
  - per chain txpower: 15.0dBm
  - limited by: eeprom_powertable
* VHT40/HT_TARGET_RATE_0-SU-NSS1:
  - per chain txpower: 16.5dBm
  - limited by: eeprom_ctl_fcc
* VHT40/HT_TARGET_RATE_0-SU-NSS2:
  - per chain txpower: 16.5dBm
  - limited by: eeprom_ctl_fcc
* VHT40/HT_TARGET_RATE_1-SU-NSS1:
  - per chain txpower: 16.5dBm
  - limited by: eeprom_ctl_fcc
* VHT40/HT_TARGET_RATE_1-SU-NSS2:
  - per chain txpower: 16.5dBm
  - limited by: eeprom_ctl_fcc
* VHT40/HT_TARGET_RATE_2-SU-NSS1:
  - per chain txpower: 16.5dBm
  - limited by: eeprom_ctl_fcc
* VHT40/HT_TARGET_RATE_2-SU-NSS2:
  - per chain txpower: 16.5dBm
  - limited by: eeprom_ctl_fcc
* VHT40/HT_TARGET_RATE_3-SU-NSS1:
  - per chain txpower: 16.5dBm
  - limited by: eeprom_ctl_fcc
* VHT40/HT_TARGET_RATE_3-SU-NSS2:
  - per chain txpower: 16.5dBm
  - limited by: eeprom_ctl_fcc
* VHT40/HT_TARGET_RATE_4-SU-NSS1:
  - per chain txpower: 16.5dBm
  - limited by: eeprom_ctl_fcc
* VHT40/HT_TARGET_RATE_4-SU-NSS2:
  - per chain txpower: 16.5dBm
  - limited by: eeprom_ctl_fcc
* VHT40/HT_TARGET_RATE_5-SU-NSS1:
  - per chain txpower: 16.0dBm
  - limited by: eeprom_powertable
* VHT40/HT_TARGET_RATE_5-SU-NSS2:
  - per chain txpower: 16.0dBm
  - limited by: eeprom_powertable
* VHT40/HT_TARGET_RATE_6-SU-NSS1:
  - per chain txpower: 15.0dBm
  - limited by: eeprom_powertable
* VHT40/HT_TARGET_RATE_6-SU-NSS2:
  - per chain txpower: 15.0dBm
  - limited by: eeprom_powertable
* VHT40/HT_TARGET_RATE_7-SU-NSS1:
  - per chain txpower: 15.0dBm
  - limited by: eeprom_powertable
* VHT40/HT_TARGET_RATE_7-SU-NSS2:
  - per chain txpower: 15.0dBm
  - limited by: eeprom_powertable
* VHT40/HT_TARGET_RATE_8-SU-NSS1:
  - per chain txpower: 15.0dBm
  - limited by: eeprom_powertable
* VHT40/HT_TARGET_RATE_8-SU-NSS2:
  - per chain txpower: 15.0dBm
  - limited by: eeprom_powertable
* VHT40/HT_TARGET_RATE_9-SU-NSS1:
  - per chain txpower: 15.0dBm
  - limited by: eeprom_powertable
* VHT40/HT_TARGET_RATE_9-SU-NSS2:
  - per chain txpower: 15.0dBm
  - limited by: eeprom_powertable
* VHT40/HT_TARGET_RATE_0-MU-NSS1:
  - per chain txpower: 16.5dBm
  - limited by: eeprom_ctl_fcc
* VHT40/HT_TARGET_RATE_0-MU-NSS2:
  - per chain txpower: 16.5dBm
  - limited by: eeprom_ctl_fcc
* VHT40/HT_TARGET_RATE_1-MU-NSS1:
  - per chain txpower: 16.5dBm
  - limited by: eeprom_ctl_fcc
* VHT40/HT_TARGET_RATE_1-MU-NSS2:
  - per chain txpower: 16.5dBm
  - limited by: eeprom_ctl_fcc
* VHT40/HT_TARGET_RATE_2-MU-NSS1:
  - per chain txpower: 16.5dBm
  - limited by: eeprom_ctl_fcc
* VHT40/HT_TARGET_RATE_2-MU-NSS2:
  - per chain txpower: 16.5dBm
  - limited by: eeprom_ctl_fcc
* VHT40/HT_TARGET_RATE_3-MU-NSS1:
  - per chain txpower: 16.5dBm
  - limited by: eeprom_ctl_fcc
* VHT40/HT_TARGET_RATE_3-MU-NSS2:
  - per chain txpower: 16.5dBm
  - limited by: eeprom_ctl_fcc
* VHT40/HT_TARGET_RATE_4-MU-NSS1:
  - per chain txpower: 16.5dBm
  - limited by: eeprom_ctl_fcc
* VHT40/HT_TARGET_RATE_4-MU-NSS2:
  - per chain txpower: 16.5dBm
  - limited by: eeprom_ctl_fcc
* VHT40/HT_TARGET_RATE_5-MU-NSS1:
  - per chain txpower: 16.0dBm
  - limited by: eeprom_powertable
* VHT40/HT_TARGET_RATE_5-MU-NSS2:
  - per chain txpower: 16.0dBm
  - limited by: eeprom_powertable
* VHT40/HT_TARGET_RATE_6-MU-NSS1:
  - per chain txpower: 15.0dBm
  - limited by: eeprom_powertable
* VHT40/HT_TARGET_RATE_6-MU-NSS2:
  - per chain txpower: 15.0dBm
  - limited by: eeprom_powertable
* VHT40/HT_TARGET_RATE_7-MU-NSS1:
  - per chain txpower: 15.0dBm
  - limited by: eeprom_powertable
* VHT40/HT_TARGET_RATE_7-MU-NSS2:
  - per chain txpower: 15.0dBm
  - limited by: eeprom_powertable
* VHT40/HT_TARGET_RATE_8-MU-NSS1:
  - per chain txpower: 15.0dBm
  - limited by: eeprom_powertable
* VHT40/HT_TARGET_RATE_8-MU-NSS2:
  - per chain txpower: 15.0dBm
  - limited by: eeprom_powertable
* VHT40/HT_TARGET_RATE_9-MU-NSS1:
  - per chain txpower: 15.0dBm
  - limited by: eeprom_powertable
* VHT40/HT_TARGET_RATE_9-MU-NSS2:
  - per chain txpower: 15.0dBm
  - limited by: eeprom_powertable
* VHT80/HT_TARGET_RATE_0-SU-NSS1:
  - per chain txpower: 14.5dBm
  - limited by: eeprom_ctl_fcc
* VHT80/HT_TARGET_RATE_0-SU-NSS2:
  - per chain txpower: 14.5dBm
  - limited by: eeprom_ctl_fcc
* VHT80/HT_TARGET_RATE_1-SU-NSS1:
  - per chain txpower: 14.5dBm
  - limited by: eeprom_ctl_fcc
* VHT80/HT_TARGET_RATE_1-SU-NSS2:
  - per chain txpower: 14.5dBm
  - limited by: eeprom_ctl_fcc
* VHT80/HT_TARGET_RATE_2-SU-NSS1:
  - per chain txpower: 14.5dBm
  - limited by: eeprom_ctl_fcc
* VHT80/HT_TARGET_RATE_2-SU-NSS2:
  - per chain txpower: 14.5dBm
  - limited by: eeprom_ctl_fcc
* VHT80/HT_TARGET_RATE_3-SU-NSS1:
  - per chain txpower: 14.5dBm
  - limited by: eeprom_ctl_fcc
* VHT80/HT_TARGET_RATE_3-SU-NSS2:
  - per chain txpower: 14.5dBm
  - limited by: eeprom_ctl_fcc
* VHT80/HT_TARGET_RATE_4-SU-NSS1:
  - per chain txpower: 14.5dBm
  - limited by: eeprom_ctl_fcc
* VHT80/HT_TARGET_RATE_4-SU-NSS2:
  - per chain txpower: 14.5dBm
  - limited by: eeprom_ctl_fcc
* VHT80/HT_TARGET_RATE_5-SU-NSS1:
  - per chain txpower: 14.5dBm
  - limited by: eeprom_ctl_fcc
* VHT80/HT_TARGET_RATE_5-SU-NSS2:
  - per chain txpower: 14.5dBm
  - limited by: eeprom_ctl_fcc
* VHT80/HT_TARGET_RATE_6-SU-NSS1:
  - per chain txpower: 14.5dBm
  - limited by: eeprom_ctl_fcc
* VHT80/HT_TARGET_RATE_6-SU-NSS2:
  - per chain txpower: 14.5dBm
  - limited by: eeprom_ctl_fcc
* VHT80/HT_TARGET_RATE_7-SU-NSS1:
  - per chain txpower: 14.5dBm
  - limited by: eeprom_ctl_fcc
* VHT80/HT_TARGET_RATE_7-SU-NSS2:
  - per chain txpower: 14.5dBm
  - limited by: eeprom_ctl_fcc
* VHT80/HT_TARGET_RATE_8-SU-NSS1:
  - per chain txpower: 14.5dBm
  - limited by: eeprom_ctl_fcc
* VHT80/HT_TARGET_RATE_8-SU-NSS2:
  - per chain txpower: 14.5dBm
  - limited by: eeprom_ctl_fcc
* VHT80/HT_TARGET_RATE_9-SU-NSS1:
  - per chain txpower: 14.5dBm
  - limited by: eeprom_ctl_fcc
* VHT80/HT_TARGET_RATE_9-SU-NSS2:
  - per chain txpower: 14.5dBm
  - limited by: eeprom_ctl_fcc
* VHT80/HT_TARGET_RATE_0-MU-NSS1:
  - per chain txpower: 14.5dBm
  - limited by: eeprom_ctl_fcc
* VHT80/HT_TARGET_RATE_0-MU-NSS2:
  - per chain txpower: 14.5dBm
  - limited by: eeprom_ctl_fcc
* VHT80/HT_TARGET_RATE_1-MU-NSS1:
  - per chain txpower: 14.5dBm
  - limited by: eeprom_ctl_fcc
* VHT80/HT_TARGET_RATE_1-MU-NSS2:
  - per chain txpower: 14.5dBm
  - limited by: eeprom_ctl_fcc
* VHT80/HT_TARGET_RATE_2-MU-NSS1:
  - per chain txpower: 14.5dBm
  - limited by: eeprom_ctl_fcc
* VHT80/HT_TARGET_RATE_2-MU-NSS2:
  - per chain txpower: 14.5dBm
  - limited by: eeprom_ctl_fcc
* VHT80/HT_TARGET_RATE_3-MU-NSS1:
  - per chain txpower: 14.5dBm
  - limited by: eeprom_ctl_fcc
* VHT80/HT_TARGET_RATE_3-MU-NSS2:
  - per chain txpower: 14.5dBm
  - limited by: eeprom_ctl_fcc
* VHT80/HT_TARGET_RATE_4-MU-NSS1:
  - per chain txpower: 14.5dBm
  - limited by: eeprom_ctl_fcc
* VHT80/HT_TARGET_RATE_4-MU-NSS2:
  - per chain txpower: 14.5dBm
  - limited by: eeprom_ctl_fcc
* VHT80/HT_TARGET_RATE_5-MU-NSS1:
  - per chain txpower: 14.5dBm
  - limited by: eeprom_ctl_fcc
* VHT80/HT_TARGET_RATE_5-MU-NSS2:
  - per chain txpower: 14.5dBm
  - limited by: eeprom_ctl_fcc
* VHT80/HT_TARGET_RATE_6-MU-NSS1:
  - per chain txpower: 14.5dBm
  - limited by: eeprom_ctl_fcc
* VHT80/HT_TARGET_RATE_6-MU-NSS2:
  - per chain txpower: 14.5dBm
  - limited by: eeprom_ctl_fcc
* VHT80/HT_TARGET_RATE_7-MU-NSS1:
  - per chain txpower: 14.5dBm
  - limited by: eeprom_ctl_fcc
* VHT80/HT_TARGET_RATE_7-MU-NSS2:
  - per chain txpower: 14.5dBm
  - limited by: eeprom_ctl_fcc
* VHT80/HT_TARGET_RATE_8-MU-NSS1:
  - per chain txpower: 14.5dBm
  - limited by: eeprom_ctl_fcc
* VHT80/HT_TARGET_RATE_8-MU-NSS2:
  - per chain txpower: 14.5dBm
  - limited by: eeprom_ctl_fcc
* VHT80/HT_TARGET_RATE_9-MU-NSS1:
  - per chain txpower: 14.5dBm
  - limited by: eeprom_ctl_fcc
* VHT80/HT_TARGET_RATE_9-MU-NSS2:
  - per chain txpower: 14.5dBm
  - limited by: eeprom_ctl_fcc

Maximum power rate:
===================

* per chain txpower: 18.0dBm
* limited by: eeprom_powertable, eeprom_ctl_fcc

--nextPart2173744.7UEKSk6ib0
Content-Disposition: attachment; filename="eeprom_0x5000_qc90xx.ctl.txt.zip"
Content-Transfer-Encoding: base64
Content-Type: application/zip; name="eeprom_0x5000_qc90xx.ctl.txt.zip"

UEsDBBQAAAAIAA5b3Ez7ECgsOg0AAJXaAAAcAAAAZWVwcm9tXzB4NTAwMF9xYzkweHguY3RsLnR4
dLWdTZMbRRZF9/0r9AdMqEoqfSzYQMwwE8SsYO8w0AZHGGOwY8bDwr8dQoZoKdV5TmZeNVs4t8TL
996tyqp8/fFj9Z/V8tW/fl/V//3Hu7t/fvnl3ed//nN39+qHD6vVevX6/scX3///+fsPz+6fv3n3
7tn0/Lv7Fz8/W69e/nb/62qZDuvV9z+9ePXm7S//u/9tNR0+W//wxc+rF2/fvn51/271/tXr16s3
9x/en/7zRs15faE5T7fQnJ9Ac/sEmrsLzc36pNkKHwJ4s07gOYCX5MpLdOVtAidLtSRLtUsCtksC
tksCtksCtksCtk8Ctk8Ctt8uFz1ifYMesd+Vmkuuebi95mH9BJpzTzw/iU5notONTEw1B0zMNftN
zDX7Tcw1odAdhkJXmEzMYSh0hcnEHI6uDD3Z4WSpyMQUJhNzOAkYmZjDScDIxBQmE3M4CdiAiblm
v4m5Zr+JqeaAibnmgInNNWecxk1MNQdMzDX7Tcw1+03MNaHQHYZCV5hMzGEodIXJxByOrgw92eFk
qcjEFCYTczgJGJmYw0nAyMQUJhNzOAnYgIm5Zr+JuWa/ianmgIm55oCJrVf//en9vL7tbiJLlhY2
tzyEiuR8e8mRrUSRxN0WYXGzhVneRxQWt1qY5V1EYZPr4paYsMEa8Q4is7yBKGwQK94+FDaIFW8e
Mst7h8IGsRraORTJK7vKJa/cKpa8NqtccmjXsNCcb7BpyJIDXqWS/V6lkiM7hiKJmyrC4p4Ks7xd
KCzuqDDLm4XCJtfFnS9hgzXijUJmeZ9Q2CBWvEsobBAr3iNklrcIhQ1iNbRBKJL9XqWS/V5lkgNe
pZIDXrV90LzVCy6THPAqlez3KpXs9yqVhNpWFmrbWPIqZaG2jSWvUja5LvRfZYM1Iq8ylrxK2SBW
5FXKBrEirzKWvErZIFYDXqWS/V6lkv1eZZIDXqWSA161VJ7Vau+xFv+ZJll41XR0Y1HJ+faS226T
VkmobWWhto0lr1IWattY8iplk+tC/1U2WCPyKmPJq5QNYkVepWwQK/IqY8mrlA1iVXjVtM9bQuFV
N5E83Fyy8KqbSM49kp80d5VntcCrTHLAq1Sy36tUst+rVBJqW1mobWPJq5SF2jaWvErZ5LrQf5UN
1oi8yljyKmWDWJFXKRvEirzKWPIqZYNYDXiVSvZ7lUr2e5VJDniVSg541ekd2Ba+rThetuxd41cL
IDlvLnfXmj7wF8m9vDEFdjONs0vCLgF7HGd3m4AN4rwPYrVfLncMWj90Icljj+TZJvy55n1cLCY5
UCwqCYtoLBWLsVQsykKxKAvFYiwVi7JBnKlYlO0vFpUcKJb5QfPxt0v9xWKSA8WikrCIxlKxGEvF
oiwUi7JQLMZSsSgbxJmKRdn+YlHJgWLZVNxqqhTLxjPbJIti+fNuMZeERTSWisVYKhZloViUhWIx
lopF2SDOVCzKXhZLy/6NSh57JM/eL51rlvtr/cVikgPFopKwiMZSsRhLxaIsFIuyUCzGUrEoG8SZ
ikXZ/mJRyYFiOT0HHc40XxY3OJf/i9O28WmcJO3pFNjFnk6B3dkTJrHBb97vy30XCuHZHfcB7jv7
l0Ul7TkIWFoWY2lZlA1+88iyzOVSl3c4xbK03i6SpN1xA0vLYiwti7LBby6XhTP77C7iAF7avywq
afd2wNKyGEvLomzwm0eW5dQYp91JdD6JboqWY3ucBC+PG/dZ8f9FP97tbMeIYLz0fPXDy4q252+C
a5e++8/XX5/PWNt0zlgrkqFvmFonDO+DHIaXZw7D2zOHk4DR+2CHk4DRG2GHoysnS0UvhR1Olope
CzucBIxeDDucBIxeDStM74YdTgJWvB3uhHcJfAjg4t1uJzw/Cv/9hNg3lKx4Yu2bPtYJ49fVffPE
OmH8Fj0YHKYwn64IBocpzOcrgsFhDidLxUcsgsFhCvMhi2BwmMNJwPicRTA4TGE+aREMDnMYur7D
0PUdhq6vMHV9h6nrL51TvC4urTB1fYfxO+W+AVydMH7VHUzaUpjPKQSTthTmkwrBpC2Hk6XiwwrB
pC2F+bhCMGnL4SRgfGIhmLSlMJ9ZCCZtOQxd32Ho+g5D11eYur7D1PUPlaMJLbf6xlLPVxZWWVmo
CmWhKJQNYkXtXtkgVtTslU2uG6wRdXplgzWiPq9sECvq8soGsaIebyy1eGWDWFGDVxb6u7LQ3o2l
7q4sNfdj5Vv+luZuLDV3ZWGBlYViUBaKQdkgVtTclQ1iRc1d2eS6wRpRc1c2WCNq7soGsaLmrmwQ
K2ruxlJzVzaIFTV3ZaG5KwvN3Vhq7spCc5/mB7h3k15ZaO7O1hfY2XoxOFsvBmeDWEFzdzaIFTR3
Z5PrBmsEzd3ZYI2guTsbxAqau7NBrKC5KwvN3dkgVtDcna03d2frzV1ZaO7OUnPfVG77G/bilaXm
riwssLJQDMpCMSgbxIqau7JBrKi5K5tcN1gjau7KBmtEzV3ZIFbU3JUNYkXN3Vhq7soGsaLmriw0
d2WhuRtLzV1Zau7bEubRPRcXNpaau7KwwMpCMSgLxaBsECtq7soGsaLmrmxy3WCNqLkrG6wRNXdl
g1hRc1c2iBU1d2OpuSsbxIqau7LQ3JWF5m4sNXdlac/9ND+nfdbNxX6QsTMc+VAWTigaSydBjaWT
oMrCGQdlgzjTSVBlgzjTSVBll/o+o7JHSOh9CfM8mosLG0sJrSwE2lhKaGMpoZWFhFY2iDMltLJB
nCmhlYWEVpYS+vAAt8yMuX4d2z4cpo+FQBtLCW0sJbSykNDKBnGmhFY2iDMltLKQ0MpSQh8r7b0y
quL6FVT7AJc+FgJtLCW0sZTQykJCKxvEmRJa2SDOlNDKQkIrCwk9XY3V49krFzfvxkJCO1sPtLKQ
0MpCQjtbT2hngzhDQjsbxBkS2tl6QjtLHfp0A94+H+X65n1wEIqxNEPAWJohoGzwm4sZAo88rLRP
PLm+qRwcbWIsBdpYCrSywW/GQB/KVSq9326UBoeVGEuBNpYCrWzwmzHQxxLmqSTXJjw4fsRYCrSx
FGhlg9+MgT690hmdM6IwDvvYntHdc0YUxksvVz+8LEa4tMLVOSP/+Pabf58PGtl1DhqZNiclmWTe
N39kavijfq45P4Hm9gk08U8ABENMFOY/ahEMMVGY/6xFMMTEYfxjDcEQE4eTpeK/bREMMXE4CRj/
eYtgiInC/AcugiEmDsOn0Q7Dt9EOw8fRCtPX0Q7Te7h95xCTFkdRzQFHcc1+R3HNfkdxTag6h6Hq
FCZHcRiqTmFyFIejK0ODdDhZKnIUhclRHE4CRo7icBIwchSFyVEcTgJGjuIwOIrD4CgKk6M4zEfl
+waktDiKag44imv2O4pr9juKa+LZ5WD4isJ8Gj8YvqIwn8cPhq84jKfMg+ErDidLxYfyg+ErDicB
43P5wfAVhflkfjB8xWE8mx8MX3EYT+cHw1ccpg/Br/7WXvyIopKln/ifrXDJ+faS3W7ikvBRrrLw
Ua6x9JG5svBRrrH0kbmyyXXhw2llgzWij8yNpY/MlQ1iRR+ZKxvEij4yN5Y+Mlc2iBV9ZK4sfGSu
LHxkbix9ZK4sGce+8oV6YBwmOWAcKtlvHCrZbxwqCYWmLBSasWQcykKhGUvGoWxyXWiGygZrRMZh
LBmHskGsyDiUDWJFxmEsGYeyQazIOJQF41AWjMNYMg5lwTjm9QN8o5ciKtlvHC7ZbRwu2W0cLlkv
NGfrhaYsGIez9UJTFozD2eS69WbobLBGYBzKgnE4G8QKjMPZIFZgHMqCcTgbxAqMw9m6cThbNw5l
wTicJeOYKo8rtXcf/lexVbI0Dv97ay45315yW/6P55JQaMpCoRlLxqEsFJqxZBzKJteFZqhssEZk
HMaScSgbxIqMQ9kgVmQcxpJxKBvEioxDWTAOZcE4jCXjUJaMYy5hHnbTYhwmOWAcKtlvHCrZbxwq
CYWmLBSasWQcykKhGUvGoWxyXWiGygZrRMZhLBmHskGsyDiUDWJFxmEsGYeyQazIOJQF41AWjMNY
Mg5ldb5x+yCdlrcHJlmcDZ62/tpEJeEoq7F0ZNhYOjKsLBwZVhaODBtLR4aVDeJMR4aVhSPDytIZ
+E0J89idlvQ3yYH0V0lYFmMp/Y2l9FcW0l9ZSH9jKf2VDeJM6a8spL+ylP7bB7hlSE9L+pvkQPqr
JCyLsZT+xlL6Kwvpryykv7GU/soGcab0VxbSX1lK/6ViHZUJKA3PoypZpv/kFaWSsCzGUvobS+mv
LKS/spD+xlL6KxvEmdJfWUh/ZSn9rwYW8gCglvQ3yYH0V0lYFmMp/Y2l9FcW0l9ZSH9jKf2VDeJM
6a8spL+ylP6nB4f2cUHNj75jU4SUhVEgysIoEGeD30yjQD7dubZPEWp+9hobLqQsxd9Yir+ywW/G
+G/LxSvvK6bu9q+Sduc6NnNIWYq/ssFvxvgvJcwzh5rvPsdGESlL8TeW4q9s8JtxFNHJPEZHESmM
84D2Z3T3KCKF8dKHqx9e1qgNmx0aRfQHUEsBAhQDFAAAAAgADlvcTPsQKCw6DQAAldoAABwAAAAA
AAAAAAAAAKSBAAAAAGVlcHJvbV8weDUwMDBfcWM5MHh4LmN0bC50eHRQSwUGAAAAAAEAAQBKAAAA
dA0AAAAA


--nextPart2173744.7UEKSk6ib0
Content-Disposition: attachment; filename="eeprom_0x5000_qc90xx.power.txt.zip"
Content-Transfer-Encoding: base64
Content-Type: application/zip; name="eeprom_0x5000_qc90xx.power.txt.zip"

UEsDBBQAAAAIAA5b3EzesBjfMAIAAM0oAAAeAAAAZWVwcm9tXzB4NTAwMF9xYzkweHgucG93ZXIu
dHh0rZcxbsJAAAR7XuEPEOHDgF2ihECRS6TgRErlf6Tg7cFy4SDB3d5qKNwgjwaBb5nL5eGr2hxP
v9Xj9y+LRfXx+hKrm9fb4bh//hn6/efx0A+f+/4wbIeuqrunVfpyD3aPVgcS1oKw0FR1O96Tuqiw
9baqd+M9qYsKa64fczvek7qosM31Y27Ge1KXxeL71IfVf9Spv8Gsluev5fv5XAvfwPQ1qETlB6IR
a9yxxh0D7hhwx/XsmH1ApqdEJQaM2MyO2eduevhUYsCIm9kx+zhPz7RKDBhxOztmT4npqFCJASPu
cMcd7tjiji3u2OGOHe64WkZ8ZyK+M7RjjTsG3DHgjuvZEduZiO9MxHcm4jsT8Z2J+M5EfGcivjO0
4w53bHHHFnfscMeu2HFENnjQSMSiAzJJtIJGInKOVtBIRM7RChqJWDQ0SaIVNBKxaGiSRCtoJGLR
0CSJVtBIxKIDMkm0gkYico5W0EhEztEKGonIOVpBIxHJnaEdraDJrALtaAVNZhWMoJGI5M4YQSMR
yZ0xgkYikjtj/MmViOTO0I5W0GRWgXa0giazCrSjFzQtHjQSseiATBKtoJGInKMVNBKRc7SCRiIW
DU2SaAWNRCwamiTRChqJWDQ0SaIVNBKx6IBMEq2gkYicoxU0EpFztIJGInKOVtBIRHJnaEcraDKr
QDtaQZNZBSNoJCK5M0bQSERyZ4ygkYjkzhh/ciUiuTO0oxU0mVWgHa2gyawC7WgEzR9QSwECFAMU
AAAACAAOW9xM3rAY3zACAADNKAAAHgAAAAAAAAAAAAAApIEAAAAAZWVwcm9tXzB4NTAwMF9xYzkw
eHgucG93ZXIudHh0UEsFBgAAAAABAAEATAAAAGwCAAAAAA==


--nextPart2173744.7UEKSk6ib0
Content-Disposition: attachment; filename="tpc_stats_final.txt"
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"; name="tpc_stats_final.txt"

*************************************
TPC config for channel 5180 mode 10
*************************************
CTL		=  0x10 Reg. Domain		= 58
Antenna Gain	=  0 Reg. Max Antenna Gain	=   0
Power Limit	= 46 Reg. Max Power		= 24
Num tx chains	=  2 Num supported rates	= 109
********************************
******************* CDD POWER TABLE ****************
********************************
No.  Preamble Rate_code tpc_value1 tpc_value2 tpc_value3
       0 CCK 0x40        0        0 
       1 CCK 0x41        0        0 
       2 CCK 0x42        0        0 
       3 CCK 0x43        0        0 
       4 OFDM 0x 0       32       32 
       5 OFDM 0x 1       36       34 
       6 OFDM 0x 2       38       34 
       7 OFDM 0x 3       38       34 
       8 OFDM 0x 4       30       30 
       9 OFDM 0x 5       34       34 
      10 OFDM 0x 6       38       34 
      11 OFDM 0x 7       38       34 
      12 HT20 0x80       38       34 
      13 HT20 0x81       38       34 
      14 HT20 0x82       38       34 
      15 HT20 0x83       36       34 
      16 HT20 0x84       34       34 
      17 HT20 0x85       32       32 
      18 HT20 0x86       30       30 
      19 HT20 0x87       30       30 
      20 HT20 0x90       38       38 
      21 HT20 0x91       38       38 
      22 HT20 0x92       38       38 
      23 HT20 0x93       36       36 
      24 HT20 0x94       34       34 
      25 HT20 0x95       32       32 
      26 HT20 0x96       30       30 
      27 HT20 0x97       30       30 
      28 HT40 0x80       38       34 
      29 HT40 0x81       38       34 
      30 HT40 0x82       38       34 
      31 HT40 0x83       36       34 
      32 HT40 0x84       34       34 
      33 HT40 0x85       32       32 
      34 HT40 0x86       30       30 
      35 HT40 0x87       30       30 
      36 HT40 0x90       38       38 
      37 HT40 0x91       38       38 
      38 HT40 0x92       38       38 
      39 HT40 0x93       36       36 
      40 HT40 0x94       34       34 
      41 HT40 0x95       32       32 
      42 HT40 0x96       30       30 
      43 HT40 0x97       30       30 
      44 VHT20 0xc0       38       34 
      45 VHT20 0xc1       38       34 
      46 VHT20 0xc2       38       34 
      47 VHT20 0xc3       36       34 
      48 VHT20 0xc4       34       34 
      49 VHT20 0xc5       32       32 
      50 VHT20 0xc6       30       30 
      51 VHT20 0xc7       30       30 
      52 VHT20 0xc8       30       30 
      53 VHT20 0xc9       30       30 
      54 VHT20 0xd0       38       38 
      55 VHT20 0xd1       38       38 
      56 VHT20 0xd2       38       38 
      57 VHT20 0xd3       36       36 
      58 VHT20 0xd4       34       34 
      59 VHT20 0xd5       32       32 
      60 VHT20 0xd6       30       30 
      61 VHT20 0xd7       30       30 
      62 VHT20 0xd8       30       30 
      63 VHT20 0xd9       30       30 
      64 VHT40 0xc0       38       34 
      65 VHT40 0xc1       38       34 
      66 VHT40 0xc2       38       34 
      67 VHT40 0xc3       36       34 
      68 VHT40 0xc4       34       34 
      69 VHT40 0xc5       32       32 
      70 VHT40 0xc6       30       30 
      71 VHT40 0xc7       30       30 
      72 VHT40 0xc8       30       30 
      73 VHT40 0xc9       30       30 
      74 VHT40 0xd0       38       38 
      75 VHT40 0xd1       38       38 
      76 VHT40 0xd2       38       38 
      77 VHT40 0xd3       36       36 
      78 VHT40 0xd4       34       34 
      79 VHT40 0xd5       32       32 
      80 VHT40 0xd6       30       30 
      81 VHT40 0xd7       30       30 
      82 VHT40 0xd8       30       30 
      83 VHT40 0xd9       30       30 
      84 VHT80 0xc0       38       34 
      85 VHT80 0xc1       38       34 
      86 VHT80 0xc2       38       34 
      87 VHT80 0xc3       36       34 
      88 VHT80 0xc4       34       34 
      89 VHT80 0xc5       32       32 
      90 VHT80 0xc6       30       30 
      91 VHT80 0xc7       30       30 
      92 VHT80 0xc8       30       30 
      93 VHT80 0xc9       30       30 
      94 VHT80 0xd0       38       38 
      95 VHT80 0xd1       38       38 
      96 VHT80 0xd2       38       38 
      97 VHT80 0xd3       36       36 
      98 VHT80 0xd4       34       34 
      99 VHT80 0xd5       32       32 
     100 VHT80 0xd6       30       30 
     101 VHT80 0xd7       30       30 
     102 VHT80 0xd8       30       30 
     103 VHT80 0xd9       30       30 
     104 HTCUP 0x40        0        0 
     105 HTCUP 0x 0       38       34 
     106 HTCUP 0x40        0        0 
     107 HTCUP 0x 0       38       34 
     108 HTCUP 0x 0       38       34 
***********************************
********************************
******************* STBC POWER TABLE ****************
********************************
No.  Preamble Rate_code tpc_value1 tpc_value2 tpc_value3
       0 CCK 0x40        0        0 
       1 CCK 0x41        0        0 
       2 CCK 0x42        0        0 
       3 CCK 0x43        0        0 
       4 OFDM 0x 0       32       32 
       5 OFDM 0x 1       36       36 
       6 OFDM 0x 2       38       38 
       7 OFDM 0x 3       38       38 
       8 OFDM 0x 4       30       30 
       9 OFDM 0x 5       34       34 
      10 OFDM 0x 6       38       38 
      11 OFDM 0x 7       38       38 
      12 HT20 0x80       38       38 
      13 HT20 0x81       38       38 
      14 HT20 0x82       38       38 
      15 HT20 0x83       36       36 
      16 HT20 0x84       34       34 
      17 HT20 0x85       32       32 
      18 HT20 0x86       30       30 
      19 HT20 0x87       30       30 
      20 HT20 0x90       38       38 
      21 HT20 0x91       38       38 
      22 HT20 0x92       38       38 
      23 HT20 0x93       36       36 
      24 HT20 0x94       34       34 
      25 HT20 0x95       32       32 
      26 HT20 0x96       30       30 
      27 HT20 0x97       30       30 
      28 HT40 0x80       38       38 
      29 HT40 0x81       38       38 
      30 HT40 0x82       38       38 
      31 HT40 0x83       36       36 
      32 HT40 0x84       34       34 
      33 HT40 0x85       32       32 
      34 HT40 0x86       30       30 
      35 HT40 0x87       30       30 
      36 HT40 0x90       38       38 
      37 HT40 0x91       38       38 
      38 HT40 0x92       38       38 
      39 HT40 0x93       36       36 
      40 HT40 0x94       34       34 
      41 HT40 0x95       32       32 
      42 HT40 0x96       30       30 
      43 HT40 0x97       30       30 
      44 VHT20 0xc0       38       38 
      45 VHT20 0xc1       38       38 
      46 VHT20 0xc2       38       38 
      47 VHT20 0xc3       36       36 
      48 VHT20 0xc4       34       34 
      49 VHT20 0xc5       32       32 
      50 VHT20 0xc6       30       30 
      51 VHT20 0xc7       30       30 
      52 VHT20 0xc8       30       30 
      53 VHT20 0xc9       30       30 
      54 VHT20 0xd0       38       38 
      55 VHT20 0xd1       38       38 
      56 VHT20 0xd2       38       38 
      57 VHT20 0xd3       36       36 
      58 VHT20 0xd4       34       34 
      59 VHT20 0xd5       32       32 
      60 VHT20 0xd6       30       30 
      61 VHT20 0xd7       30       30 
      62 VHT20 0xd8       30       30 
      63 VHT20 0xd9       30       30 
      64 VHT40 0xc0       38       38 
      65 VHT40 0xc1       38       38 
      66 VHT40 0xc2       38       38 
      67 VHT40 0xc3       36       36 
      68 VHT40 0xc4       34       34 
      69 VHT40 0xc5       32       32 
      70 VHT40 0xc6       30       30 
      71 VHT40 0xc7       30       30 
      72 VHT40 0xc8       30       30 
      73 VHT40 0xc9       30       30 
      74 VHT40 0xd0       38       38 
      75 VHT40 0xd1       38       38 
      76 VHT40 0xd2       38       38 
      77 VHT40 0xd3       36       36 
      78 VHT40 0xd4       34       34 
      79 VHT40 0xd5       32       32 
      80 VHT40 0xd6       30       30 
      81 VHT40 0xd7       30       30 
      82 VHT40 0xd8       30       30 
      83 VHT40 0xd9       30       30 
      84 VHT80 0xc0       38       38 
      85 VHT80 0xc1       38       38 
      86 VHT80 0xc2       38       38 
      87 VHT80 0xc3       36       36 
      88 VHT80 0xc4       34       34 
      89 VHT80 0xc5       32       32 
      90 VHT80 0xc6       30       30 
      91 VHT80 0xc7       30       30 
      92 VHT80 0xc8       30       30 
      93 VHT80 0xc9       30       30 
      94 VHT80 0xd0       38       38 
      95 VHT80 0xd1       38       38 
      96 VHT80 0xd2       38       38 
      97 VHT80 0xd3       36       36 
      98 VHT80 0xd4       34       34 
      99 VHT80 0xd5       32       32 
     100 VHT80 0xd6       30       30 
     101 VHT80 0xd7       30       30 
     102 VHT80 0xd8       30       30 
     103 VHT80 0xd9       30       30 
     104 HTCUP 0x40        0        0 
     105 HTCUP 0x 0       38       38 
     106 HTCUP 0x40        0        0 
     107 HTCUP 0x 0       38       38 
     108 HTCUP 0x 0       38       38 
***********************************

--nextPart2173744.7UEKSk6ib0
Content-Disposition: attachment; filename="tpc_stats.txt"
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"; name="tpc_stats.txt"

*************************************
TPC config for channel 5180 mode 10
*************************************
CTL		=  0x10 Reg. Domain		= 58
Antenna Gain	=  0 Reg. Max Antenna Gain	=   0
Power Limit	= 46 Reg. Max Power		= 24
Num tx chains	=  2 Num supported rates	= 109
********************************
******************* CDD POWER TABLE ****************
********************************
No.  Preamble Rate_code tpc_value1 tpc_value2 tpc_value3
       0 CCK 0x40        0        0 
       1 CCK 0x41        0        0 
       2 CCK 0x42        0        0 
       3 CCK 0x43        0        0 
       4 OFDM 0x 0       32       32 
       5 OFDM 0x 1       36       34 
       6 OFDM 0x 2       38       34 
       7 OFDM 0x 3       38       34 
       8 OFDM 0x 4       30       30 
       9 OFDM 0x 5       34       34 
      10 OFDM 0x 6       38       34 
      11 OFDM 0x 7       38       34 
      12 HT20 0x80       38       34 
      13 HT20 0x81       38       34 
      14 HT20 0x82       38       34 
      15 HT20 0x83       36       34 
      16 HT20 0x84       34       34 
      17 HT20 0x85       32       32 
      18 HT20 0x86       30       30 
      19 HT20 0x87       30       30 
      20 HT20 0x90       38       38 
      21 HT20 0x91       38       38 
      22 HT20 0x92       38       38 
      23 HT20 0x93       36       36 
      24 HT20 0x94       34       34 
      25 HT20 0x95       32       32 
      26 HT20 0x96       30       30 
      27 HT20 0x97       30       30 
      28 HT40 0x80       38       34 
      29 HT40 0x81       38       34 
      30 HT40 0x82       38       34 
      31 HT40 0x83       36       34 
      32 HT40 0x84       34       34 
      33 HT40 0x85       32       32 
      34 HT40 0x86       30       30 
      35 HT40 0x87       30       30 
      36 HT40 0x90       38       38 
      37 HT40 0x91       38       38 
      38 HT40 0x92       38       38 
      39 HT40 0x93       36       36 
      40 HT40 0x94       34       34 
      41 HT40 0x95       32       32 
      42 HT40 0x96       30       30 
      43 HT40 0x97       30       30 
      44 VHT20 0xc0       38       34 
      45 VHT20 0xc1       38       34 
      46 VHT20 0xc2       38       34 
      47 VHT20 0xc3       36       34 
      48 VHT20 0xc4       34       34 
      49 VHT20 0xc5       32       32 
      50 VHT20 0xc6       30       30 
      51 VHT20 0xc7       30       30 
      52 VHT20 0xc8       30       30 
      53 VHT20 0xc9       30       30 
      54 VHT20 0xd0       38       38 
      55 VHT20 0xd1       38       38 
      56 VHT20 0xd2       38       38 
      57 VHT20 0xd3       36       36 
      58 VHT20 0xd4       34       34 
      59 VHT20 0xd5       32       32 
      60 VHT20 0xd6       30       30 
      61 VHT20 0xd7       30       30 
      62 VHT20 0xd8       30       30 
      63 VHT20 0xd9       30       30 
      64 VHT40 0xc0       38       34 
      65 VHT40 0xc1       38       34 
      66 VHT40 0xc2       38       34 
      67 VHT40 0xc3       36       34 
      68 VHT40 0xc4       34       34 
      69 VHT40 0xc5       32       32 
      70 VHT40 0xc6       30       30 
      71 VHT40 0xc7       30       30 
      72 VHT40 0xc8       30       30 
      73 VHT40 0xc9       30       30 
      74 VHT40 0xd0       38       38 
      75 VHT40 0xd1       38       38 
      76 VHT40 0xd2       38       38 
      77 VHT40 0xd3       36       36 
      78 VHT40 0xd4       34       34 
      79 VHT40 0xd5       32       32 
      80 VHT40 0xd6       30       30 
      81 VHT40 0xd7       30       30 
      82 VHT40 0xd8       30       30 
      83 VHT40 0xd9       30       30 
      84 VHT80 0xc0       38       34 
      85 VHT80 0xc1       38       34 
      86 VHT80 0xc2       38       34 
      87 VHT80 0xc3       36       34 
      88 VHT80 0xc4       34       34 
      89 VHT80 0xc5       32       32 
      90 VHT80 0xc6       30       30 
      91 VHT80 0xc7       30       30 
      92 VHT80 0xc8       30       30 
      93 VHT80 0xc9       30       30 
      94 VHT80 0xd0       38       38 
      95 VHT80 0xd1       38       38 
      96 VHT80 0xd2       38       38 
      97 VHT80 0xd3       36       36 
      98 VHT80 0xd4       34       34 
      99 VHT80 0xd5       32       32 
     100 VHT80 0xd6       30       30 
     101 VHT80 0xd7       30       30 
     102 VHT80 0xd8       30       30 
     103 VHT80 0xd9       30       30 
     104 HTCUP 0x40        0        0 
     105 HTCUP 0x 0       38       34 
     106 HTCUP 0x40        0        0 
     107 HTCUP 0x 0       38       34 
     108 HTCUP 0x 0       38       34 
***********************************
********************************
******************* STBC POWER TABLE ****************
********************************
No.  Preamble Rate_code tpc_value1 tpc_value2 tpc_value3
       0 CCK 0x40        0        0 
       1 CCK 0x41        0        0 
       2 CCK 0x42        0        0 
       3 CCK 0x43        0        0 
       4 OFDM 0x 0       32       32 
       5 OFDM 0x 1       36       36 
       6 OFDM 0x 2       38       38 
       7 OFDM 0x 3       38       38 
       8 OFDM 0x 4       30       30 
       9 OFDM 0x 5       34       34 
      10 OFDM 0x 6       38       38 
      11 OFDM 0x 7       38       38 
      12 HT20 0x80       38       38 
      13 HT20 0x81       38       38 
      14 HT20 0x82       38       38 
      15 HT20 0x83       36       36 
      16 HT20 0x84       34       34 
      17 HT20 0x85       32       32 
      18 HT20 0x86       30       30 
      19 HT20 0x87       30       30 
      20 HT20 0x90       38       38 
      21 HT20 0x91       38       38 
      22 HT20 0x92       38       38 
      23 HT20 0x93       36       36 
      24 HT20 0x94       34       34 
      25 HT20 0x95       32       32 
      26 HT20 0x96       30       30 
      27 HT20 0x97       30       30 
      28 HT40 0x80       38       38 
      29 HT40 0x81       38       38 
      30 HT40 0x82       38       38 
      31 HT40 0x83       36       36 
      32 HT40 0x84       34       34 
      33 HT40 0x85       32       32 
      34 HT40 0x86       30       30 
      35 HT40 0x87       30       30 
      36 HT40 0x90       38       38 
      37 HT40 0x91       38       38 
      38 HT40 0x92       38       38 
      39 HT40 0x93       36       36 
      40 HT40 0x94       34       34 
      41 HT40 0x95       32       32 
      42 HT40 0x96       30       30 
      43 HT40 0x97       30       30 
      44 VHT20 0xc0       38       38 
      45 VHT20 0xc1       38       38 
      46 VHT20 0xc2       38       38 
      47 VHT20 0xc3       36       36 
      48 VHT20 0xc4       34       34 
      49 VHT20 0xc5       32       32 
      50 VHT20 0xc6       30       30 
      51 VHT20 0xc7       30       30 
      52 VHT20 0xc8       30       30 
      53 VHT20 0xc9       30       30 
      54 VHT20 0xd0       38       38 
      55 VHT20 0xd1       38       38 
      56 VHT20 0xd2       38       38 
      57 VHT20 0xd3       36       36 
      58 VHT20 0xd4       34       34 
      59 VHT20 0xd5       32       32 
      60 VHT20 0xd6       30       30 
      61 VHT20 0xd7       30       30 
      62 VHT20 0xd8       30       30 
      63 VHT20 0xd9       30       30 
      64 VHT40 0xc0       38       38 
      65 VHT40 0xc1       38       38 
      66 VHT40 0xc2       38       38 
      67 VHT40 0xc3       36       36 
      68 VHT40 0xc4       34       34 
      69 VHT40 0xc5       32       32 
      70 VHT40 0xc6       30       30 
      71 VHT40 0xc7       30       30 
      72 VHT40 0xc8       30       30 
      73 VHT40 0xc9       30       30 
      74 VHT40 0xd0       38       38 
      75 VHT40 0xd1       38       38 
      76 VHT40 0xd2       38       38 
      77 VHT40 0xd3       36       36 
      78 VHT40 0xd4       34       34 
      79 VHT40 0xd5       32       32 
      80 VHT40 0xd6       30       30 
      81 VHT40 0xd7       30       30 
      82 VHT40 0xd8       30       30 
      83 VHT40 0xd9       30       30 
      84 VHT80 0xc0       38       38 
      85 VHT80 0xc1       38       38 
      86 VHT80 0xc2       38       38 
      87 VHT80 0xc3       36       36 
      88 VHT80 0xc4       34       34 
      89 VHT80 0xc5       32       32 
      90 VHT80 0xc6       30       30 
      91 VHT80 0xc7       30       30 
      92 VHT80 0xc8       30       30 
      93 VHT80 0xc9       30       30 
      94 VHT80 0xd0       38       38 
      95 VHT80 0xd1       38       38 
      96 VHT80 0xd2       38       38 
      97 VHT80 0xd3       36       36 
      98 VHT80 0xd4       34       34 
      99 VHT80 0xd5       32       32 
     100 VHT80 0xd6       30       30 
     101 VHT80 0xd7       30       30 
     102 VHT80 0xd8       30       30 
     103 VHT80 0xd9       30       30 
     104 HTCUP 0x40        0        0 
     105 HTCUP 0x 0       38       38 
     106 HTCUP 0x40        0        0 
     107 HTCUP 0x 0       38       38 
     108 HTCUP 0x 0       38       38 
***********************************

--nextPart2173744.7UEKSk6ib0--

--nextPart2451564.vKJUQue75s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAls0st4ACgkQXYcKB8Em
e0Z/dBAAowFYQyAl91utMLSIDQ2sNYSI29uK/csaH/CKFqxeEKP1s6hv8wuxIv0M
fpUnUONqFvIDOdXSUIUlSH9EP8OLicCuUZLp0fp7rvrBaOGnRzdoONsYouk/Rhpb
FDinWB6cBhVgf96yhKnPSnCaDzcNnK3g6v0s257WKUg4skgZvSu9mw8N7TjzRANk
ldPEt4acF4aJqXp1yD8m8iLE1+s8xnlD69plrR5mE9hSRrwGj9IhedJE9q8v6LNO
VnVtXKTIDlFOkTPySRkokMWYn1iMch2jU74hIGEO13Xmml+NNBzVjbOcHIUILZEi
+gL41wf9ECkBqHulgH5HY8XajdXhmufmTl0SeeJUJ5bo67D+tc3l85TN2WfVw3vn
GJUIcVJsfuh6hflaSyew8rMT86G7ka9W+dJq+hNGJvzNNW/oDTAbGC0Aq3c1Q9Te
E5m34ih3zBvFuz5On/DBFF1xton7kE8yb0IZcrr+fottIrhZkdvwx3scaa036JGl
rLHwGL5MHVdhKwROptPq4rpZlv9DfbvuIqzisXsN1+qF41nLn9mc+IRcdZjdc5dg
yw1uiK3BmeYlSDNXx3b4pXaiVGsKtvK2853GTqWY3Ud7RcbeBg48Dq641hkyAMFN
YFtTWVUcMcPal3/8+JsswU15qV8vhTGALKNziv/3Ko5zSIQBtaw=
=q2cl
-----END PGP SIGNATURE-----

--nextPart2451564.vKJUQue75s--



--===============1903262461180116890==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============1903262461180116890==--
