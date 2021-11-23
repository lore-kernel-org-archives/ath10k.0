Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FABAC433EF
	for <ath10k@archiver.kernel.org>; Tue, 23 Nov 2021 12:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ogci4PP59FvfWu8rMGNRZiTx/yWuMFHxR3xcIs3sxiE=; b=XwcfjMVJ2w1aVoWkmhLQdM1Cy7
	KXOj/JakTy6QQybnA3Lg7Ga+rdFxgeIBCCOHSg+C4RauDAlmcauyJsJr0tCPUrv7Ue+/OZpU+ZSWx
	6ywNTj+2aw9tvtfaJehsjCV4GAZx2CGfw1JAH1BOH/BWtu5oa+IhaQMIA1IIcxhP4bs//upp3gJh6
	stu4XR+T+pSIVcmJgON+pDcZcw2jGv1nRXuZNO5Z5mcl9G8p89zK+NB5SOVl7mUhzu34D+icLp/8j
	rSAj26c4wBxKS8KCrtxU+uQaVRp9QwkafDYh0pbdnOWy4KoWJuda5Ht7k/AQxXxvye/CO+PDboPKq
	1gxrPJng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpUcR-00219F-Ad; Tue, 23 Nov 2021 12:09:51 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpUcL-00216g-AU
 for ath10k@lists.infradead.org; Tue, 23 Nov 2021 12:09:49 +0000
Received: (Authenticated sender: tbm@cyrius.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id C512C60009;
 Tue, 23 Nov 2021 12:09:37 +0000 (UTC)
Received: by jirafa.cyrius.com (Postfix, from userid 1000)
 id 852641A5BEC; Tue, 23 Nov 2021 20:09:26 +0800 (PST)
Date: Tue, 23 Nov 2021 20:09:26 +0800
From: Martin Michlmayr <tbm@cyrius.com>
To: Kalle Valo <kvalo@codeaurora.org>, ath10k@lists.infradead.org
Subject: Intermittent issues with Atheros QCA6174 on XPS 13 9380
Message-ID: <YZzZ9jxaNd5DP9Rg@jirafa.cyrius.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="b3qWKjvfWOa9hG/K"
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211123_040945_749772_AB027E4F 
X-CRM114-Status: GOOD (  20.41  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org


--b3qWKjvfWOa9hG/K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I'm experiencing intermittent wifi issues with an Atheros QCA6174 on
an XPS 13 9380 notebook.  I started pinging my AP and noticed that
ping times go from <10ms to >10,000ms when this happens.

64 bytes from 192.168.0.1: icmp_seq=1154 ttl=64 time=3.18 ms
64 bytes from 192.168.0.1: icmp_seq=1160 ttl=64 time=8572 ms
64 bytes from 192.168.0.1: icmp_seq=1161 ttl=64 time=7549 ms
64 bytes from 192.168.0.1: icmp_seq=1162 ttl=64 time=17518 ms
64 bytes from 192.168.0.1: icmp_seq=1163 ttl=64 time=16497 ms
64 bytes from 192.168.0.1: icmp_seq=1169 ttl=64 time=10412 ms

There's also huge package loss.

Various observations:

* There's no warning in dmesg when this happens.

* I'm only 1-2 meters from the AP and connection quality is good.
  Other devices connected to the same AP don't have problems.

* rmmod & modprobe solves the issue, but only temporarily.

* I tried to set a lower speed with "iwconfig wlp2s0 rate 11M" but
  that made no difference.

* This is with 2.412 GHz.  My AP doesn't have 5 GHz

* The problem doesn't happen all the time.  I haven't found a
  clear pattern yet.  However, watching videos on YouTube usually
  (but not always) triggers it.  (It also shows without YouTube,
  but YouTube is a good way to trigger it.)

* When it happens, it happens every few minutes (without an obvious
  pattern).  Sometimes it goes back to normal quickly (less than a
  minute) but sometimes it takes a long time and then I do 'rmmod'.

* I've tried with different kernels: 5.15, 5.14, 5.10 (all from
  Debian) - all show this issue

* I downloaded the latest firmware from https://github.com/kvalo/ath10k-firmware/tree/master/QCA6174/hw3.0/4.4.1
  (WLAN.RM.4.4.1-00288)
  This made no difference

* The mainboard of my laptop was swapped about two weeks ago.  I don't
  think I had this problem in the past (there were Internet issues from
  time to time, and I assumed it's the broadband; but maybe it was a
  wifi issue.  It doesn't wasn't as bad as now though because I would
  have noticed.  Now wifi is pretty much unusuable, at least for
  YouTube).   The Atheros chip is the same brand, so not sure if the
  mainboard switch matters. (But it's weird because I didn't have the
  issues before.)    I'm not sure about software changes in recent
  times but I can't think of anything too obvious.

* I booted into Windows 10 and watched YouTube for two hours and
  didn't notice the same problem there.

Is this a known issue?  How can I provide more debugging info?

Below is some more info about my system.  I've also attached some
ping logs.

iwconfig
          Mode:Managed  Frequency:2.412 GHz  Access Point: ...
          Bit Rate=144.4 Mb/s   Tx-Power=20 dBm
          Retry short limit:7   RTS thr:off   Fragment thr:off
          Power Management:on
          Link Quality=61/70  Signal level=-49 dBm

dmesg when loading driver:
ath10k_pci 0000:02:00.0: pci irq msi oper_irq_mode 2 irq_mode 0 reset_mode 0
ath10k_pci 0000:02:00.0: firmware: failed to load ath10k/pre-cal-pci-0000:02:00.0.bin (-2)
ath10k_pci 0000:02:00.0: firmware: failed to load ath10k/cal-pci-0000:02:00.0.bin (-2)
ath10k_pci 0000:02:00.0: firmware: direct-loading firmware ath10k/QCA6174/hw3.0/firmware-6.bin
ath10k_pci 0000:02:00.0: qca6174 hw3.2 target 0x05030000 chip_id 0x00340aff sub 1a56:143a
ath10k_pci 0000:02:00.0: kconfig debug 0 debugfs 0 tracing 0 dfs 0 testmode 0
ath10k_pci 0000:02:00.0: firmware ver WLAN.RM.4.4.1-00288- api 6 features wowlan,ignore-otp,mfp crc32 bf907c7c
ath10k_pci 0000:02:00.0: firmware: direct-loading firmware ath10k/QCA6174/hw3.0/board-2.bin
ath10k_pci 0000:02:00.0: board_file api 2 bmi_id N/A crc32 e57aadc7
ath10k_pci 0000:02:00.0: htt-ver 3.87 wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1
ath: EEPROM regdomain: 0x6c
ath: EEPROM indicates we should expect a direct regpair map
ath: Country alpha2 being used: 00
ath: Regpair used: 0x6c
ath10k_pci 0000:02:00.0 wlp2s0: renamed from wlan0

lspci:
02:00.0 Network controller: Qualcomm Atheros QCA6174 802.11ac Wireless Network Adapter (rev 32)
	Subsystem: Rivet Networks Killer 1435 Wireless-AC
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 64 bytes
	Interrupt: pin A routed to IRQ 160
	IOMMU group: 14
	Region 0: Memory at dc000000 (64-bit, non-prefetchable) [size=2M]
	Capabilities: [40] Power Management version 3
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=375mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [50] MSI: Enable+ Count=1/8 Maskable+ 64bit-
		Address: fee00718  Data: 0000
		Masking: 000000fe  Pending: 00000000
	Capabilities: [70] Express (v2) Endpoint, MSI 00
		DevCap:	MaxPayload 256 bytes, PhantFunc 0, Latency L0s unlimited, L1 <64us
			ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset- SlotPowerLimit 10.000W
		DevCtl:	CorrErr- NonFatalErr- FatalErr- UnsupReq-
			RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop-
			MaxPayload 256 bytes, MaxReadReq 512 bytes
		DevSta:	CorrErr+ NonFatalErr- FatalErr- UnsupReq+ AuxPwr+ TransPend-
		LnkCap:	Port #0, Speed 2.5GT/s, Width x1, ASPM L0s L1, Exit Latency L0s <4us, L1 <64us
			ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
		LnkCtl:	ASPM L1 Enabled; RCB 64 bytes, Disabled- CommClk+
			ExtSynch- ClockPM+ AutWidDis- BWInt- AutBWInt-
		LnkSta:	Speed 2.5GT/s (ok), Width x1 (ok)
			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
		DevCap2: Completion Timeout: Not Supported, TimeoutDis+ NROPrPrP- LTR+
			 10BitTagComp- 10BitTagReq- OBFF Via message, ExtFmt- EETLPPrefix-
			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
			 FRS- TPHComp- ExtTPHComp-
			 AtomicOpsCap: 32bit- 64bit- 128bitCAS-
		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR+ OBFF Disabled,
			 AtomicOpsCtl: ReqEn-
		LnkCap2: Supported Link Speeds: 2.5GT/s, Crosslink- Retimer- 2Retimers- DRS-
		LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- SpeedDis-
			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
			 Compliance De-emphasis: -6dB
		LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete- EqualizationPhase1-
			 EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
			 Retimer- 2Retimers- CrosslinkRes: unsupported
	Capabilities: [100 v2] Advanced Error Reporting
		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
		UESvrt:	DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
		CESta:	RxErr+ BadTLP+ BadDLLP+ Rollover- Timeout+ AdvNonFatalErr+
		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+
		AERCap:	First Error Pointer: 00, ECRCGenCap- ECRCGenEn- ECRCChkCap- ECRCChkEn-
			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
		HeaderLog: 00000000 00000000 00000000 00000000
	Capabilities: [148 v1] Virtual Channel
		Caps:	LPEVC=0 RefClk=100ns PATEntryBits=1
		Arb:	Fixed- WRR32- WRR64- WRR128-
		Ctrl:	ArbSelect=Fixed
		Status:	InProgress-
		VC0:	Caps:	PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
			Arb:	Fixed- WRR32- WRR64- WRR128- TWRR128- WRR256-
			Ctrl:	Enable+ ID=0 ArbSelect=Fixed TC/VC=ff
			Status:	NegoPending- InProgress-
	Capabilities: [168 v1] Device Serial Number 00-00-00-00-00-00-00-00
	Capabilities: [178 v1] Latency Tolerance Reporting
		Max snoop latency: 3145728ns
		Max no snoop latency: 3145728ns
	Capabilities: [180 v1] L1 PM Substates
		L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+ L1_PM_Substates+
			  PortCommonModeRestoreTime=50us PortTPowerOnTime=10us
		L1SubCtl1: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
			   T_CommonMode=0us LTR1.2_Threshold=98304ns
		L1SubCtl2: T_PwrOn=44us
	Kernel driver in use: ath10k_pci
	Kernel modules: ath10k_pci

-- 
Martin Michlmayr
https://www.cyrius.com/

--b3qWKjvfWOa9hG/K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=ping1

64 bytes from 192.168.0.1: icmp_seq=1110 ttl=64 time=3.67 ms
64 bytes from 192.168.0.1: icmp_seq=1111 ttl=64 time=4.44 ms
64 bytes from 192.168.0.1: icmp_seq=1112 ttl=64 time=3.15 ms
64 bytes from 192.168.0.1: icmp_seq=1113 ttl=64 time=7.35 ms
64 bytes from 192.168.0.1: icmp_seq=1115 ttl=64 time=4.04 ms
64 bytes from 192.168.0.1: icmp_seq=1116 ttl=64 time=5.71 ms
64 bytes from 192.168.0.1: icmp_seq=1117 ttl=64 time=6.77 ms
64 bytes from 192.168.0.1: icmp_seq=1118 ttl=64 time=12.9 ms
64 bytes from 192.168.0.1: icmp_seq=1119 ttl=64 time=3.41 ms
64 bytes from 192.168.0.1: icmp_seq=1120 ttl=64 time=4.20 ms
64 bytes from 192.168.0.1: icmp_seq=1121 ttl=64 time=4.60 ms
64 bytes from 192.168.0.1: icmp_seq=1122 ttl=64 time=6.13 ms
64 bytes from 192.168.0.1: icmp_seq=1123 ttl=64 time=4.09 ms
64 bytes from 192.168.0.1: icmp_seq=1126 ttl=64 time=5.58 ms
64 bytes from 192.168.0.1: icmp_seq=1127 ttl=64 time=5.70 ms
64 bytes from 192.168.0.1: icmp_seq=1128 ttl=64 time=3.78 ms
64 bytes from 192.168.0.1: icmp_seq=1129 ttl=64 time=3.15 ms
64 bytes from 192.168.0.1: icmp_seq=1130 ttl=64 time=9.61 ms
64 bytes from 192.168.0.1: icmp_seq=1131 ttl=64 time=5.76 ms
64 bytes from 192.168.0.1: icmp_seq=1132 ttl=64 time=14.7 ms
64 bytes from 192.168.0.1: icmp_seq=1134 ttl=64 time=5.52 ms
64 bytes from 192.168.0.1: icmp_seq=1135 ttl=64 time=8.03 ms
64 bytes from 192.168.0.1: icmp_seq=1136 ttl=64 time=8.67 ms
64 bytes from 192.168.0.1: icmp_seq=1137 ttl=64 time=28.4 ms
64 bytes from 192.168.0.1: icmp_seq=1138 ttl=64 time=4.00 ms
64 bytes from 192.168.0.1: icmp_seq=1139 ttl=64 time=3.58 ms
64 bytes from 192.168.0.1: icmp_seq=1141 ttl=64 time=33.5 ms
64 bytes from 192.168.0.1: icmp_seq=1143 ttl=64 time=31.5 ms
64 bytes from 192.168.0.1: icmp_seq=1144 ttl=64 time=18.2 ms
64 bytes from 192.168.0.1: icmp_seq=1145 ttl=64 time=6.01 ms
64 bytes from 192.168.0.1: icmp_seq=1146 ttl=64 time=28.9 ms
64 bytes from 192.168.0.1: icmp_seq=1147 ttl=64 time=20.1 ms
64 bytes from 192.168.0.1: icmp_seq=1148 ttl=64 time=8.42 ms
64 bytes from 192.168.0.1: icmp_seq=1149 ttl=64 time=43.2 ms
64 bytes from 192.168.0.1: icmp_seq=1151 ttl=64 time=4.44 ms
64 bytes from 192.168.0.1: icmp_seq=1152 ttl=64 time=3.13 ms
64 bytes from 192.168.0.1: icmp_seq=1153 ttl=64 time=3.44 ms
64 bytes from 192.168.0.1: icmp_seq=1154 ttl=64 time=3.18 ms
64 bytes from 192.168.0.1: icmp_seq=1160 ttl=64 time=8572 ms
64 bytes from 192.168.0.1: icmp_seq=1161 ttl=64 time=7549 ms
64 bytes from 192.168.0.1: icmp_seq=1162 ttl=64 time=17518 ms
64 bytes from 192.168.0.1: icmp_seq=1163 ttl=64 time=16497 ms
64 bytes from 192.168.0.1: icmp_seq=1169 ttl=64 time=10412 ms
64 bytes from 192.168.0.1: icmp_seq=1170 ttl=64 time=15390 ms
64 bytes from 192.168.0.1: icmp_seq=1171 ttl=64 time=14367 ms
64 bytes from 192.168.0.1: icmp_seq=1172 ttl=64 time=13342 ms
64 bytes from 192.168.0.1: icmp_seq=1173 ttl=64 time=12315 ms
64 bytes from 192.168.0.1: icmp_seq=1195 ttl=64 time=3.32 ms
64 bytes from 192.168.0.1: icmp_seq=1186 ttl=64 time=10091 ms
64 bytes from 192.168.0.1: icmp_seq=1187 ttl=64 time=9090 ms
64 bytes from 192.168.0.1: icmp_seq=1188 ttl=64 time=8073 ms
64 bytes from 192.168.0.1: icmp_seq=1194 ttl=64 time=1937 ms
64 bytes from 192.168.0.1: icmp_seq=1196 ttl=64 time=79.6 ms
64 bytes from 192.168.0.1: icmp_seq=1198 ttl=64 time=6.86 ms
64 bytes from 192.168.0.1: icmp_seq=1199 ttl=64 time=7.95 ms
64 bytes from 192.168.0.1: icmp_seq=1200 ttl=64 time=5.76 ms
64 bytes from 192.168.0.1: icmp_seq=1201 ttl=64 time=3.12 ms
64 bytes from 192.168.0.1: icmp_seq=1202 ttl=64 time=5.40 ms
64 bytes from 192.168.0.1: icmp_seq=1203 ttl=64 time=14.5 ms
64 bytes from 192.168.0.1: icmp_seq=1204 ttl=64 time=15.7 ms
64 bytes from 192.168.0.1: icmp_seq=1205 ttl=64 time=65.9 ms
64 bytes from 192.168.0.1: icmp_seq=1206 ttl=64 time=6.44 ms
64 bytes from 192.168.0.1: icmp_seq=1207 ttl=64 time=35.0 ms
64 bytes from 192.168.0.1: icmp_seq=1208 ttl=64 time=5.37 ms
64 bytes from 192.168.0.1: icmp_seq=1197 ttl=64 time=11860 ms
64 bytes from 192.168.0.1: icmp_seq=1210 ttl=64 time=3.07 ms
64 bytes from 192.168.0.1: icmp_seq=1211 ttl=64 time=3.11 ms
64 bytes from 192.168.0.1: icmp_seq=1212 ttl=64 time=3.97 ms


--b3qWKjvfWOa9hG/K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=ping2


64 bytes from 192.168.0.1: icmp_seq=5 ttl=64 time=12933 ms
64 bytes from 192.168.0.1: icmp_seq=6 ttl=64 time=11909 ms
64 bytes from 192.168.0.1: icmp_seq=7 ttl=64 time=10881 ms
64 bytes from 192.168.0.1: icmp_seq=8 ttl=64 time=9861 ms
64 bytes from 192.168.0.1: icmp_seq=19 ttl=64 time=4.18 ms
64 bytes from 192.168.0.1: icmp_seq=20 ttl=64 time=3.34 ms
64 bytes from 192.168.0.1: icmp_seq=21 ttl=64 time=3.76 ms
64 bytes from 192.168.0.1: icmp_seq=22 ttl=64 time=10.2 ms
64 bytes from 192.168.0.1: icmp_seq=23 ttl=64 time=6.98 ms
64 bytes from 192.168.0.1: icmp_seq=9 ttl=64 time=14760 ms
64 bytes from 192.168.0.1: icmp_seq=10 ttl=64 time=13733 ms
64 bytes from 192.168.0.1: icmp_seq=11 ttl=64 time=12709 ms
64 bytes from 192.168.0.1: icmp_seq=18 ttl=64 time=5578 ms
64 bytes from 192.168.0.1: icmp_seq=24 ttl=64 time=6.65 ms
64 bytes from 192.168.0.1: icmp_seq=25 ttl=64 time=3.63 ms
64 bytes from 192.168.0.1: icmp_seq=27 ttl=64 time=21.9 ms
64 bytes from 192.168.0.1: icmp_seq=28 ttl=64 time=45.0 ms
64 bytes from 192.168.0.1: icmp_seq=26 ttl=64 time=2230 ms
64 bytes from 192.168.0.1: icmp_seq=30 ttl=64 time=3.28 ms
64 bytes from 192.168.0.1: icmp_seq=31 ttl=64 time=5.68 ms
64 bytes from 192.168.0.1: icmp_seq=29 ttl=64 time=2259 ms
64 bytes from 192.168.0.1: icmp_seq=33 ttl=64 time=9.31 ms
64 bytes from 192.168.0.1: icmp_seq=34 ttl=64 time=3.29 ms
64 bytes from 192.168.0.1: icmp_seq=35 ttl=64 time=3.40 ms
39 packets transmitted, 24 received, 38.4615% packet loss, time 38522ms
rtt min/avg/max/mdev = 3.284/4040.988/14760.168/5560.229 ms, pipe 15


--b3qWKjvfWOa9hG/K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=ping3

64 bytes from 192.168.0.1: icmp_seq=291 ttl=64 time=3.37 ms
64 bytes from 192.168.0.1: icmp_seq=292 ttl=64 time=3.32 ms
64 bytes from 192.168.0.1: icmp_seq=293 ttl=64 time=10.6 ms
64 bytes from 192.168.0.1: icmp_seq=294 ttl=64 time=21321 ms
64 bytes from 192.168.0.1: icmp_seq=295 ttl=64 time=20305 ms
64 bytes from 192.168.0.1: icmp_seq=296 ttl=64 time=19277 ms
64 bytes from 192.168.0.1: icmp_seq=297 ttl=64 time=18258 ms
64 bytes from 192.168.0.1: icmp_seq=298 ttl=64 time=17230 ms
64 bytes from 192.168.0.1: icmp_seq=299 ttl=64 time=16210 ms
64 bytes from 192.168.0.1: icmp_seq=300 ttl=64 time=15182 ms
64 bytes from 192.168.0.1: icmp_seq=301 ttl=64 time=14158 ms
64 bytes from 192.168.0.1: icmp_seq=302 ttl=64 time=13138 ms
64 bytes from 192.168.0.1: icmp_seq=303 ttl=64 time=12112 ms
64 bytes from 192.168.0.1: icmp_seq=304 ttl=64 time=34052 ms
64 bytes from 192.168.0.1: icmp_seq=316 ttl=64 time=21809 ms
64 bytes from 192.168.0.1: icmp_seq=317 ttl=64 time=20785 ms
64 bytes from 192.168.0.1: icmp_seq=318 ttl=64 time=19761 ms
64 bytes from 192.168.0.1: icmp_seq=319 ttl=64 time=18740 ms
64 bytes from 192.168.0.1: icmp_seq=320 ttl=64 time=17717 ms
64 bytes from 192.168.0.1: icmp_seq=321 ttl=64 time=16693 ms
64 bytes from 192.168.0.1: icmp_seq=322 ttl=64 time=15666 ms
64 bytes from 192.168.0.1: icmp_seq=323 ttl=64 time=14642 ms
64 bytes from 192.168.0.1: icmp_seq=324 ttl=64 time=13622 ms
64 bytes from 192.168.0.1: icmp_seq=325 ttl=64 time=12598 ms
64 bytes from 192.168.0.1: icmp_seq=326 ttl=64 time=11571 ms
64 bytes from 192.168.0.1: icmp_seq=327 ttl=64 time=10552 ms
64 bytes from 192.168.0.1: icmp_seq=328 ttl=64 time=31562 ms
64 bytes from 192.168.0.1: icmp_seq=338 ttl=64 time=21385 ms
64 bytes from 192.168.0.1: icmp_seq=339 ttl=64 time=20374 ms
64 bytes from 192.168.0.1: icmp_seq=340 ttl=64 time=19351 ms
64 bytes from 192.168.0.1: icmp_seq=341 ttl=64 time=18323 ms
64 bytes from 192.168.0.1: icmp_seq=342 ttl=64 time=17308 ms
64 bytes from 192.168.0.1: icmp_seq=343 ttl=64 time=16284 ms
64 bytes from 192.168.0.1: icmp_seq=344 ttl=64 time=15256 ms
64 bytes from 192.168.0.1: icmp_seq=345 ttl=64 time=14236 ms
64 bytes from 192.168.0.1: icmp_seq=346 ttl=64 time=13208 ms
64 bytes from 192.168.0.1: icmp_seq=347 ttl=64 time=12184 ms
64 bytes from 192.168.0.1: icmp_seq=348 ttl=64 time=11179 ms
64 bytes from 192.168.0.1: icmp_seq=349 ttl=64 time=39053 ms
64 bytes from 192.168.0.1: icmp_seq=350 ttl=64 time=38033 ms
64 bytes from 192.168.0.1: icmp_seq=351 ttl=64 time=37009 ms
64 bytes from 192.168.0.1: icmp_seq=352 ttl=64 time=35985 ms
64 bytes from 192.168.0.1: icmp_seq=353 ttl=64 time=34957 ms
64 bytes from 192.168.0.1: icmp_seq=359 ttl=64 time=28842 ms
64 bytes from 192.168.0.1: icmp_seq=360 ttl=64 time=27826 ms
64 bytes from 192.168.0.1: icmp_seq=361 ttl=64 time=26802 ms
64 bytes from 192.168.0.1: icmp_seq=362 ttl=64 time=25778 ms
64 bytes from 192.168.0.1: icmp_seq=363 ttl=64 time=24750 ms
64 bytes from 192.168.0.1: icmp_seq=364 ttl=64 time=23731 ms
64 bytes from 192.168.0.1: icmp_seq=365 ttl=64 time=22707 ms
64 bytes from 192.168.0.1: icmp_seq=366 ttl=64 time=38668 ms
64 bytes from 192.168.0.1: icmp_seq=367 ttl=64 time=37647 ms
64 bytes from 192.168.0.1: icmp_seq=368 ttl=64 time=36627 ms
64 bytes from 192.168.0.1: icmp_seq=369 ttl=64 time=35603 ms
64 bytes from 192.168.0.1: icmp_seq=370 ttl=64 time=34575 ms
64 bytes from 192.168.0.1: icmp_seq=371 ttl=64 time=33555 ms
64 bytes from 192.168.0.1: icmp_seq=372 ttl=64 time=32531 ms
64 bytes from 192.168.0.1: icmp_seq=373 ttl=64 time=31507 ms
64 bytes from 192.168.0.1: icmp_seq=374 ttl=64 time=30483 ms
64 bytes from 192.168.0.1: icmp_seq=375 ttl=64 time=29459 ms
64 bytes from 192.168.0.1: icmp_seq=376 ttl=64 time=28435 ms
64 bytes from 192.168.0.1: icmp_seq=388 ttl=64 time=16170 ms
64 bytes from 192.168.0.1: icmp_seq=389 ttl=64 time=15166 ms
64 bytes from 192.168.0.1: icmp_seq=390 ttl=64 time=37234 ms
64 bytes from 192.168.0.1: icmp_seq=395 ttl=64 time=32126 ms
64 bytes from 192.168.0.1: icmp_seq=396 ttl=64 time=31102 ms
64 bytes from 192.168.0.1: icmp_seq=397 ttl=64 time=30078 ms
64 bytes from 192.168.0.1: icmp_seq=398 ttl=64 time=29054 ms
64 bytes from 192.168.0.1: icmp_seq=404 ttl=64 time=22935 ms
64 bytes from 192.168.0.1: icmp_seq=405 ttl=64 time=21918 ms
64 bytes from 192.168.0.1: icmp_seq=406 ttl=64 time=20898 ms
64 bytes from 192.168.0.1: icmp_seq=407 ttl=64 time=19870 ms
64 bytes from 192.168.0.1: icmp_seq=408 ttl=64 time=18850 ms
64 bytes from 192.168.0.1: icmp_seq=409 ttl=64 time=17826 ms
64 bytes from 192.168.0.1: icmp_seq=410 ttl=64 time=16802 ms
64 bytes from 192.168.0.1: icmp_seq=411 ttl=64 time=15778 ms
64 bytes from 192.168.0.1: icmp_seq=412 ttl=64 time=14750 ms
64 bytes from 192.168.0.1: icmp_seq=413 ttl=64 time=13730 ms
64 bytes from 192.168.0.1: icmp_seq=414 ttl=64 time=12711 ms
64 bytes from 192.168.0.1: icmp_seq=415 ttl=64 time=11690 ms
64 bytes from 192.168.0.1: icmp_seq=416 ttl=64 time=34601 ms
64 bytes from 192.168.0.1: icmp_seq=417 ttl=64 time=33578 ms
64 bytes from 192.168.0.1: icmp_seq=427 ttl=64 time=23403 ms
64 bytes from 192.168.0.1: icmp_seq=428 ttl=64 time=22402 ms
64 bytes from 192.168.0.1: icmp_seq=429 ttl=64 time=21396 ms
64 bytes from 192.168.0.1: icmp_seq=430 ttl=64 time=20372 ms
64 bytes from 192.168.0.1: icmp_seq=431 ttl=64 time=19348 ms
64 bytes from 192.168.0.1: icmp_seq=432 ttl=64 time=18325 ms
64 bytes from 192.168.0.1: icmp_seq=433 ttl=64 time=17301 ms
64 bytes from 192.168.0.1: icmp_seq=434 ttl=64 time=16278 ms
64 bytes from 192.168.0.1: icmp_seq=435 ttl=64 time=15254 ms
64 bytes from 192.168.0.1: icmp_seq=436 ttl=64 time=14230 ms
64 bytes from 192.168.0.1: icmp_seq=437 ttl=64 time=13206 ms
64 bytes from 192.168.0.1: icmp_seq=438 ttl=64 time=12182 ms
64 bytes from 192.168.0.1: icmp_seq=439 ttl=64 time=11158 ms
64 bytes from 192.168.0.1: icmp_seq=440 ttl=64 time=10143 ms
64 bytes from 192.168.0.1: icmp_seq=441 ttl=64 time=26034 ms
64 bytes from 192.168.0.1: icmp_seq=442 ttl=64 time=25010 ms
64 bytes from 192.168.0.1: icmp_seq=443 ttl=64 time=23982 ms
64 bytes from 192.168.0.1: icmp_seq=444 ttl=64 time=22962 ms
64 bytes from 192.168.0.1: icmp_seq=450 ttl=64 time=16842 ms
64 bytes from 192.168.0.1: icmp_seq=451 ttl=64 time=15827 ms
64 bytes from 192.168.0.1: icmp_seq=452 ttl=64 time=14807 ms
[I did rmmod at that point]


--b3qWKjvfWOa9hG/K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=ping4

64 bytes from 192.168.0.1: icmp_seq=139 ttl=64 time=6.83 ms
64 bytes from 192.168.0.1: icmp_seq=140 ttl=64 time=3.22 ms
64 bytes from 192.168.0.1: icmp_seq=141 ttl=64 time=17.4 ms
64 bytes from 192.168.0.1: icmp_seq=142 ttl=64 time=6.07 ms
64 bytes from 192.168.0.1: icmp_seq=143 ttl=64 time=9.03 ms
64 bytes from 192.168.0.1: icmp_seq=144 ttl=64 time=6.43 ms
64 bytes from 192.168.0.1: icmp_seq=145 ttl=64 time=12.2 ms
64 bytes from 192.168.0.1: icmp_seq=146 ttl=64 time=6.96 ms
64 bytes from 192.168.0.1: icmp_seq=153 ttl=64 time=5.05 ms
64 bytes from 192.168.0.1: icmp_seq=154 ttl=64 time=20491 ms
64 bytes from 192.168.0.1: icmp_seq=155 ttl=64 time=19473 ms
64 bytes from 192.168.0.1: icmp_seq=156 ttl=64 time=18453 ms
64 bytes from 192.168.0.1: icmp_seq=157 ttl=64 time=17429 ms
64 bytes from 192.168.0.1: icmp_seq=158 ttl=64 time=16405 ms
64 bytes from 192.168.0.1: icmp_seq=159 ttl=64 time=15381 ms
64 bytes from 192.168.0.1: icmp_seq=160 ttl=64 time=14358 ms
64 bytes from 192.168.0.1: icmp_seq=161 ttl=64 time=24335 ms
64 bytes from 192.168.0.1: icmp_seq=162 ttl=64 time=23310 ms
64 bytes from 192.168.0.1: icmp_seq=163 ttl=64 time=22286 ms
64 bytes from 192.168.0.1: icmp_seq=164 ttl=64 time=21262 ms
64 bytes from 192.168.0.1: icmp_seq=165 ttl=64 time=20243 ms
64 bytes from 192.168.0.1: icmp_seq=166 ttl=64 time=19219 ms
64 bytes from 192.168.0.1: icmp_seq=167 ttl=64 time=18195 ms
64 bytes from 192.168.0.1: icmp_seq=168 ttl=64 time=17171 ms
64 bytes from 192.168.0.1: icmp_seq=178 ttl=64 time=14035 ms
64 bytes from 192.168.0.1: icmp_seq=179 ttl=64 time=13007 ms
64 bytes from 192.168.0.1: icmp_seq=185 ttl=64 time=6894 ms
64 bytes from 192.168.0.1: icmp_seq=186 ttl=64 time=21801 ms
64 bytes from 192.168.0.1: icmp_seq=192 ttl=64 time=15678 ms
64 bytes from 192.168.0.1: icmp_seq=193 ttl=64 time=14666 ms
64 bytes from 192.168.0.1: icmp_seq=194 ttl=64 time=13642 ms
64 bytes from 192.168.0.1: icmp_seq=195 ttl=64 time=30669 ms
64 bytes from 192.168.0.1: icmp_seq=196 ttl=64 time=29646 ms
64 bytes from 192.168.0.1: icmp_seq=199 ttl=64 time=26586 ms
64 bytes from 192.168.0.1: icmp_seq=200 ttl=64 time=25566 ms
64 bytes from 192.168.0.1: icmp_seq=201 ttl=64 time=24543 ms
64 bytes from 192.168.0.1: icmp_seq=208 ttl=64 time=17398 ms
64 bytes from 192.168.0.1: icmp_seq=209 ttl=64 time=16380 ms
64 bytes from 192.168.0.1: icmp_seq=210 ttl=64 time=15360 ms
64 bytes from 192.168.0.1: icmp_seq=211 ttl=64 time=14332 ms
64 bytes from 192.168.0.1: icmp_seq=212 ttl=64 time=13312 ms
64 bytes from 192.168.0.1: icmp_seq=213 ttl=64 time=12284 ms
64 bytes from 192.168.0.1: icmp_seq=214 ttl=64 time=11264 ms
64 bytes from 192.168.0.1: icmp_seq=226 ttl=64 time=9.27 ms
64 bytes from 192.168.0.1: icmp_seq=215 ttl=64 time=11239 ms
64 bytes from 192.168.0.1: icmp_seq=227 ttl=64 time=5.15 ms
64 bytes from 192.168.0.1: icmp_seq=216 ttl=64 time=11226 ms
64 bytes from 192.168.0.1: icmp_seq=217 ttl=64 time=10212 ms
64 bytes from 192.168.0.1: icmp_seq=218 ttl=64 time=9205 ms
64 bytes from 192.168.0.1: icmp_seq=219 ttl=64 time=8187 ms
64 bytes from 192.168.0.1: icmp_seq=225 ttl=64 time=2062 ms
64 bytes from 192.168.0.1: icmp_seq=228 ttl=64 time=10.1 ms
64 bytes from 192.168.0.1: icmp_seq=229 ttl=64 time=4.97 ms
64 bytes from 192.168.0.1: icmp_seq=230 ttl=64 time=4.09 ms
64 bytes from 192.168.0.1: icmp_seq=232 ttl=64 time=3.46 ms
64 bytes from 192.168.0.1: icmp_seq=234 ttl=64 time=10.6 ms
64 bytes from 192.168.0.1: icmp_seq=235 ttl=64 time=4.10 ms
64 bytes from 192.168.0.1: icmp_seq=236 ttl=64 time=10.4 ms
64 bytes from 192.168.0.1: icmp_seq=237 ttl=64 time=9.99 ms
64 bytes from 192.168.0.1: icmp_seq=238 ttl=64 time=4.23 ms
...

241 packets transmitted, 199 received, 17.4274% packet loss, time 242003ms
rtt min/avg/max/mdev = 2.555/3407.800/30669.027/7309.275 ms, pipe 30


--b3qWKjvfWOa9hG/K
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--b3qWKjvfWOa9hG/K--

