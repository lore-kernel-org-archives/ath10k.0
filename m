Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oa0-x243.google.com ([2607:f8b0:4003:c02::243])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UyzlE-0003IY-Ki
 for ath10k@lists.infradead.org; Tue, 16 Jul 2013 07:33:25 +0000
Received: by mail-oa0-f67.google.com with SMTP id l10so89751oag.10
 for <ath10k@lists.infradead.org>; Tue, 16 Jul 2013 00:33:03 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 16 Jul 2013 16:33:03 +0900
Message-ID: <CAMQ0DfRO8q-S+45n2HGt3ya8nfzR5O-Nq82day26cZ1khRRdWQ@mail.gmail.com>
Subject: I just try to use QCA9880 mini pcie card with ath10k drivers in git
 source tree.
From: Hwan Jin Ko <ymir.kr@gmail.com>
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

Hello!

I just try to use QCA9880 mini pcie card with ath10k drivers in git source tree.
When I type iwlist command with scanning option, kernel shows firmware
crashed message and not worked.

Firmware is from https://github.com/kvalo/ath10k-firmware

<snip>
~ # iwlist wlan2 scanning
[ 100.100067] ath10k: firmware crashed!
[ 100.103960] ath10k: hardware name qca988x hw2.0 version 0x4100016c
[ 100.110674] ath10k: firmware version: 1.0.0.636
[ 100.116692] ath10k: target register Dump Location: 0x00401930
[ 100.123928] ath10k: target Register Dump
[ 100.128285] ath10k: [00]: 0x4100016C 0x00000000 0x009B58F2 0x00000000
[ 100.135309] ath10k: [04]: 0x00000000 0x00000000 0x00000000 0x00000000
[ 100.142288] ath10k: [08]: 0x00000000 0x00000000 0x00000000 0x00000000
[ 100.149256] ath10k: [12]: 0x00000000 0x00000000 0x00000000 0x00000000
[ 100.156048] ath10k: [16]: 0x00000000 0x00000000 0x00000000 0x009B58F2
[ 100.163018] ath10k: [20]: 0x00000000 0x00401930 0x00000000 0x00000000
[ 100.170048] ath10k: [24]: 0x00000000 0x00000000 0x00000000 0x00000000
[ 100.176969] ath10k: [28]: 0x00000000 0x00000000 0x00000000 0x00000000
[ 100.183957] ath10k: [32]: 0x00000000 0x00000000 0x00000000 0x00000000
[ 100.190950] ath10k: [36]: 0x00000000 0x00000000 0x00000000 0x00000000
[ 100.197859] ath10k: [40]: 0x00000000 0x00000000 0x00000000 0x00000000
[ 100.204834] ath10k: [44]: 0x00000000 0x00000000 0x00000000 0x00000000
[ 100.211759] ath10k: [48]: 0x00000000 0x00000000 0x00000000 0x00000000
[ 100.218798] ath10k: [52]: 0x00000000 0x00000000 0x00000000 0x00000000
[ 100.225757] ath10k: [56]: 0x00000000 0x00000000 0x00000000 0x00000000
[ 106.103478] ath10k: wmi flush failed (-110)
[ 109.109329] ath10k: timed out while waiting for scan to stop
[ 109.115506] ath10k: could not stop scan. its still in progress
wlan2 Failed to read scan data : Resource temporarily unavailable
~ # iwlist wlan2 scanning
wlan2 Interface doesn't support scanning : Device or resource busy
</snip>

Boot-up message is here. (have two ar9300 and one qca9880 card)
Is there any advice for me? AR9300 works fine.

<snip>
~ # dmesg | grep -i ath
[ 0.000000] Linux version 3.10.0-wl-ath+ (ymir@yggdrasil) (gcc version
4.6.4 (crosstool-NG 1.18.0 - buildroot 2013.05) ) #1 SMP Tue Jul 16
14:29:07 KST 2013
[ 2.986837] ath: EEPROM regdomain: 0x60
[ 2.990835] ath: EEPROM indicates we should expect a direct regpair map
[ 2.997611] ath: Country alpha2 being used: 00
[ 3.002203] ath: Regpair used: 0x60
[ 3.016338] ieee80211 phy0: Atheros AR9300 Rev:3 mem=0xf8080000, irq=18
[ 3.039091] ath: EEPROM regdomain: 0x60
[ 3.043071] ath: EEPROM indicates we should expect a direct regpair map
[ 3.049837] ath: Country alpha2 being used: 00
[ 3.054432] ath: Regpair used: 0x60
[ 3.069103] ieee80211 phy1: Atheros AR9300 Rev:3 mem=0xf8100000, irq=19
[ 3.076197] ath10k_pci 0000:02:00.0: BAR 0: assigned [mem
0x80000000-0x801fffff 64bit]
[ 3.138208] ath10k: MSI-X didn't succeed (1), trying MSI
[ 3.138287] ath10k_pci 0000:02:00.0: irq 44 for MSI/MSI-X
[ 3.138389] ath10k: MSI interrupt handling
[ 3.165643] ath10k: Hardware name qca988x hw2.0 version 0x4100016c
[ 4.336112] ath10k: UART prints disabled
[ 4.343784] ath10k: current_rd = 0x0 (0), override_rd = 0x60 (96)
[ 4.350045] ath10k: firmware 1.0.0.636 booted
[ 4.364755] ath: EEPROM regdomain: 0x60
[ 4.368735] ath: EEPROM indicates we should expect a direct regpair map
[ 4.375499] ath: Country alpha2 being used: 00
[ 4.380081] ath: Regpair used: 0x60
</snip>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
