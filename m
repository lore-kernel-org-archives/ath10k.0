Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x234.google.com ([2a00:1450:400c:c09::234])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1df17q-0005NH-ON
 for ath10k@lists.infradead.org; Tue, 08 Aug 2017 09:48:38 +0000
Received: by mail-wm0-x234.google.com with SMTP id t201so2654122wmt.0
 for <ath10k@lists.infradead.org>; Tue, 08 Aug 2017 02:48:13 -0700 (PDT)
Received: from laptop (HSI-KBW-085-216-067-125.hsi.kabelbw.de. [85.216.67.125])
 by smtp.gmail.com with ESMTPSA id w73sm656211wmw.20.2017.08.08.02.48.11
 for <ath10k@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 08 Aug 2017 02:48:11 -0700 (PDT)
Date: Tue, 8 Aug 2017 11:48:25 +0200
From: Tobias Predel <tobias.predel@gmail.com>
Subject: QCA9377 stops working operating on 802.11g when WMM disabled
Message-ID: <20170808094825.GA2995@laptop>
MIME-Version: 1.0
Content-Disposition: inline
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

playing with my QCA9377 card and my 802.11 b+g (g++) router (Fritz!Box 7170 doing still a great job)
in order to check interoperability I get this:

When I disable WMM (IEEE 802.11e) on the web interface of my router that is operating
on 2,4 GHz channel with IEEE 802.11g, ath10k can't manage to establish a reliable
connection any more (no VHT and HT, so no WMM/QoS). Instead, after seemingly 
having established a connection (authenticated/associated), it disconnects 
directly after that giving reason=1 UNSPECIFIED (following deauthentification). 

The product website of QCA9377 says that the chipset supports the complete range of 
commonly used WLAN standards (802.11a/b/g/n/ac). Other devices continue
working properly (without WMM) even on my Linux Android phone so I think they 
implement support for IEEE 802.11 (g) standard in the right way while
QCA9377 screws up already at key negotiation state on my laptop here
running Linux 4.12.4 (the router log says wrong passphrase but it's the 
same as on the other devices I can guarantee). 

And even with WMM enabled, the connection is ruther lousy with periods 
of very high transfer rate following periods of drought. Is it 
possible that 
(1) WMM and/or 802.11g isn't implemented in the firmware or somewhere else in a standard-compilant way 
or 
(2) is it that the firmware requires WMM to be activated in order to
operate on 802.11g (1) given?

Or more generally speaking, is g/b and so on supported by those devices
as they focus on 802.11 ac support? I am currently using 

driver: ath10k_pci
version: 4.12.4-1-ARCH
firmware-version: WLAN.TF.1.0-00267-1
expansion-rom-version: 
bus-info: 0000:02:00.0
supports-statistics: yes
supports-test: no
supports-eeprom-access: no
supports-register-dump: no
supports-priv-flags: no

as ethtool says and

[    4.673694] ath10k_pci 0000:02:00.0: pci irq msi oper_irq_mode 2 irq_mode 0 reset_mode 0
[    4.957885] ath10k_pci 0000:02:00.0: qca9377 hw1.0 target 0x05020000 chip_id 0x003820ff sub 1a3b:2231
[    4.957890] ath10k_pci 0000:02:00.0: kconfig debug 0 debugfs 1 tracing 0 dfs 0 testmode 0
[    4.958574] ath10k_pci 0000:02:00.0: firmware ver WLAN.TF.1.0-00267-1 api 5 features ignore-otp crc32 79cea2c7
[    5.030545] ath10k_pci 0000:02:00.0: board_file api 2 bmi_id N/A crc32 8aedfa4a
[    6.838415] ath10k_pci 0000:02:00.0: htt-ver 3.1 wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1
[    6.860542] ath10k_pci 0000:02:00.0 wlp2s0: renamed from wlan0
[   15.923945] ath10k_pci 0000:02:00.0 wlp2s0: disabling HT as WMM/QoS is not supported by the AP
[   15.923960] ath10k_pci 0000:02:00.0 wlp2s0: disabling VHT as WMM/QoS is not supported by the AP

as dmesg says. I think that I'm using the latest binary blobs of Qualcomm regarding firmware and EEPROM board. 
I mean QCNFA435 -> QCA9377? Would it be possible to provide all firmware and board BLOBs (different versions etc.) regarding
ath10k instead of squeezing each file out of the Qualcomm staff?

Regards,
Tobias

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
