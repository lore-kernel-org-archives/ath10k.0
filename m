Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-am1on0608.outbound.protection.outlook.com
 ([2a01:111:f400:fe00::608]
 helo=emea01-am1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YJTOS-0006Fx-FJ
 for ath10k@lists.infradead.org; Thu, 05 Feb 2015 20:51:21 +0000
From: Conrad Kostecki <ck@conrad-kostecki.de>
Subject: AW: More than one ath10k NIC will not load (bisected)
Date: Thu, 5 Feb 2015 20:50:36 +0000
Message-ID: <DB3PR04MB0763A7B0A966F864E1CF0977E23B0@DB3PR04MB0763.eurprd04.prod.outlook.com>
References: <54BECE4D.9020308@candelatech.com> <54BF0B42.7050101@dd-wrt.com>
 <54BF13AE.5010909@candelatech.com> <54BFF788.2000500@candelatech.com>
 <54C00239.7000008@candelatech.com> <54C166B8.7060405@candelatech.com>
 <CA+BoTQmF+z5+HW+=xis7LPSmq6sSxn2ZuiJHGM83dAAftkN_sA@mail.gmail.com>
 <54C26EB3.7050805@candelatech.com>
 <CALhHN=oD_R=RvhpAV1wC5kyP02KSU1E5fjyqidbXXx+bMZ9pZQ@mail.gmail.com>
In-Reply-To: <CALhHN=oD_R=RvhpAV1wC5kyP02KSU1E5fjyqidbXXx+bMZ9pZQ@mail.gmail.com>
Content-Language: de-DE
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

> Do you have a PC with 2 NICs in it that you could try yourself?

I have two ath10k cards build in my soekris.
Those are working fine without any problems.
Both cards are loading fine.

[    2.731750] ath10k_pci 0000:07:00.0: PCI->APIC IRQ transform: INT A -> IRQ 17
[    3.037142] ath10k_pci 0000:07:00.0: irq 42 for MSI/MSI-X
[    3.037192] ath10k_pci 0000:07:00.0: pci irq msi interrupts 1 irq_mode 0 reset_mode 0
[    3.037564] ath10k_pci 0000:0c:00.0: PCI->APIC IRQ transform: INT A -> IRQ 18
[    3.340106] ath10k_pci 0000:0c:00.0: irq 43 for MSI/MSI-X
[    3.340145] ath10k_pci 0000:0c:00.0: pci irq msi interrupts 1 irq_mode 0 reset_mode 0
[    4.461521] ath10k_pci 0000:07:00.0: qca988x hw2.0 (0x4100016c, 0x043202ff) fw 10.2-00082-4-2 api 3 htt 2.1
[    4.469965] ath10k_pci 0000:07:00.0: debug 0 debugfs 0 tracing 0 dfs 1 testmode 0
[    5.070084] ath: EEPROM regdomain: 0x0
[    5.070086] ath: EEPROM indicates default country code should be used
[    5.070087] ath: doing EEPROM country->regdmn map search
[    5.070090] ath: country maps to regdmn code: 0x37
[    5.070092] ath: Country alpha2 being used: DE
[    5.070093] ath: Regpair used: 0x37
[    5.085625] ath10k_pci 0000:0c:00.0: qca988x hw2.0 (0x4100016c, 0x043202ff) fw 10.2-00082-4-2 api 3 htt 2.1
[    5.085631] ath10k_pci 0000:0c:00.0: debug 0 debugfs 0 tracing 0 dfs 1 testmode 0
[    5.680073] ath: EEPROM regdomain: 0x0
[    5.680078] ath: EEPROM indicates default country code should be used
[    5.680080] ath: doing EEPROM country->regdmn map search
[    5.680083] ath: country maps to regdmn code: 0x37
[    5.680085] ath: Country alpha2 being used: DE
[    5.680087] ath: Regpair used: 0x37

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
