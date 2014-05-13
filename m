Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qc0-x244.google.com ([2607:f8b0:400d:c01::244])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wk2a5-0004v7-1z
 for ath10k@lists.infradead.org; Tue, 13 May 2014 02:36:37 +0000
Received: by mail-qc0-f196.google.com with SMTP id l6so3242625qcy.7
 for <ath10k@lists.infradead.org>; Mon, 12 May 2014 19:36:15 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 12 May 2014 22:36:15 -0400
Message-ID: <CAMWKU3eT9=ri7P1X69DNw9QshqDR8TUFm3RVuo8=GWuDcCn5oA@mail.gmail.com>
Subject: openwrt ath10k / MacBook Pro Retina 802.11ac not connecting
From: while oneq <while1eq1@gmail.com>
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

Hello,

Im currently using lib/firmware/ath10k/QCA988X/hw2.0/  on a TP-Link
Archer C7 v2.0 / OpenWRT [BARRIER BREAKER (Bleeding Edge, r40749)]

Package: kmod-ath10k
Version: 3.10.36+2014-03-31-1
Depends: kernel (= 3.10.36-1-6548302841f6df0132fbc6960fa209fb), kmod-ath
Status: install user installed
Architecture: ar71xx

[    0.000000] SoC: Qualcomm Atheros QCA9558 rev 0
[    0.690000] ath79-spi ath79-spi: master is unqueued, this is deprecated
[    0.820000] switch0: Atheros AR8327 rev. 4 switch registered on ag71xx-mdio.0
[    2.620000] ag71xx ag71xx.0: connected to PHY at ag71xx-mdio.0:00
[uid=004dd034, driver=Atheros AR8216/AR8236/AR8316]
[    2.630000] eth0: Atheros AG71xx at 0xb9000000, irq 4, mode:RGMII
[    3.190000] eth1: Atheros AG71xx at 0xba000000, irq 5, mode:SGMII
[   10.160000] ath10k_pci 0000:01:00.0: BAR 0: assigned [mem
0x12000000-0x121fffff 64bit]
[   10.480000] ath10k: pci irq legacy
[   11.700000] ath10k: qca988x hw2.0 (0x4100016c) fw 10.1.467.2-1 api 2 htt 2.1
[   12.230000] ath: EEPROM regdomain: 0x0
[   12.230000] ath: EEPROM indicates default country code should be used
[   12.230000] ath: doing EEPROM country->regdmn map search
[   12.230000] ath: country maps to regdmn code: 0x3a
[   12.230000] ath: Country alpha2 being used: US
[   12.230000] ath: Regpair used: 0x3a
[   12.450000] ath: EEPROM regdomain: 0x0
[   12.450000] ath: EEPROM indicates default country code should be used
[   12.450000] ath: doing EEPROM country->regdmn map search
[   12.450000] ath: country maps to regdmn code: 0x3a
[   12.450000] ath: Country alpha2 being used: US
[   12.450000] ath: Regpair used: 0x3a
[   12.470000] ieee80211 phy1: Atheros AR9550 Rev:0 mem=0xb8100000, irq=47

 and am connecting via

a MacBook Pro Retina:

  Model Name: MacBook Pro

  Model Identifier: MacBookPro11,3

  Processor Name: Intel Core i7

  Processor Speed: 2.6 GHz

  Number of Processors: 1

  Total Number of Cores: 4

  L2 Cache (per Core): 256 KB

  L3 Cache: 6 MB

  Memory: 16 GB

  Boot ROM Version: MBP112.0138.B02

  SMC Version (system): 2.19f3


en0:

  Card Type: AirPort Extreme  (0x14E4, 0x134)

  Firmware Version: Broadcom BCM43xx 1.0 (6.30.223.154.63)

  MAC Address: xx:xx:xx:xx:xx:xx

  Locale: FCC

  Country Code: US

  Supported PHY Modes: 802.11 a/b/g/n/ac

  Supported Channels: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 36, 40, 44,
48, 52, 56, 60, 64, 100, 104, 108, 112, 116, 120, 124, 128, 132, 136,
140, 144, 149, 153, 157, 161, 165

  Wake On Wireless: Supported

  AirDrop: Supported

  Status: Connected

And am unable to get connected to the access point at all, All
wireless security settings are disabled at the moment.

Any assistance on this issue would be greatly appreciated.

Thanks

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
