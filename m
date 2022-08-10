Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AEE1C25B07
	for <ath10k@archiver.kernel.org>; Wed, 10 Aug 2022 01:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:MIME-Version:Subject:Message-ID
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ezqoa2PZZU+P1Ai2berJwnXl9NpSFJ6oaRdhcJRQrzc=; b=E4SVYeFkGErovy
	+o4B3//s0nLUHH+oIAuE9g54Y5j5x6bH0pcuCH9bA3CbF3/QRoi90DxO5OLEO6UoeCS6xtCJseJ9D
	yQ6JRnxuxxpA4kSCX3+tfJgki5T6JNpzuYHMS/VLCe2Y/bfqj+YLbE2yp8vmo69XhQeIh/TmwNk7N
	VLdTYDUyYPWANLkpOG8riRSoKn0TvwkHaxUlJcTjUN6Qitw4RCaT4AYX4aSwJBA1IjBI7GIarN419
	Fj/6g6e50elo+zsKKMrsOGCn0OAAlX+ZFs7QX4R6KAVPC5dh4r3OaDjVxBwYaMD9RrUeP06xP9CPu
	bRNM1WuYN22ZOUKQytAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLaxu-008G3x-Tw; Wed, 10 Aug 2022 01:56:58 +0000
Received: from send003.gov-dooray.com ([211.56.2.23])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLaxq-008FxT-AN
	for ath10k@lists.infradead.org; Wed, 10 Aug 2022 01:56:57 +0000
DKIM-Signature: a=rsa-sha256;
 b=oiohABCHCx5r7AX6v4/61+xk/sJWjzN0E7bOxYq4sqePDb0PbpTGAPLmR4rphmS2oMP7N/C6C9
  3zXk4oXo3kqH9/ls+G8QLTTc6cMrCjwFsDodv172hcIbQSlQLpTJUJiiEDZWkExPRyac1JIir0Yw
  0vSgF4G4DeywqW3ai6y8PT+TXUtVdLMcoafKRhXB+XavBhS70JSmnnu/lWA0/tm59YHTMKy4ZoXf
  LSdYH6M5jegHALNboA4JDC44FEDLtpHyu4k3pNs2o9O9HnOkj/tUXvRzKalbJSGqG+TJ8Dy/AhO/
  p+p/TNnvxb0LeHTMN1L2AeW2F26cQkWNJeEup6/Q==;
 c=relaxed/relaxed; s=selector; d=dooray.com; v=1;
 bh=jj4MIUQpvaoxcDDWdqS5BGtRyG/6Ocez4OIrRPyKZb0=;
 h=From:To:Subject:Message-ID;
Dooray-Meta-Signature: s5M2FeXkDsHHlY9v4S1/p0/UBjc64Cc55Wa07pPvBggnMK11ntpnB
  OQ7ggebV2mIpNdmjwyNDuTnnrvk3LuwAp67hZuqvy66co7oGDaA0i0WgJHQzW4jWuX1mgcPtBed1
  L7CLDSISCwSw27Yz/PYpwL5CG6s9lKieDdkBT8LyNw599okB8xorZgZS6qV064BEPHhRTKFYNnXI
  049qnSPgYkM9/4J36d+ui+2OJPGasKg+kjelb3zJouvP7C4v1j5TodcKm/ZKbOBDbjNdMNu2gQmG
  wFlnakQImFubxdzHGVzneykm0OL3Tmkq/EvMV361o0v1cOh9SPDnizIzjTYmtokpSKKR80KupXMF
  ODf9II=
Received: from [172.226.94.46] (HELO 172.226.94.46) ([172.226.94.46]) by
 send003.gov-dooray.com with SMTP id 7d8a365262f31056; Wed, 10 Aug 2022
 10:56:38 +0900
From: Wonsup Yoon <pusnow@kaist.ac.kr>
Message-ID: <pcoa2db959zn.pcoa2db781x3.g6@dooray.com>
Subject: Questions about QCA6174 firmwares
MIME-Version: 1.0
X-Dsn-Request: true
X-Dooray-Agent: mail-api
X-Dooray-Mail-Id: 3336882333103539923
Importance: Normal
X-Priority: Normal
X-MSMail-Priority: Normal
X-Dooray-Attached: c3+LUOpPU/IB7Wl+oemm0lw5HiI/bJHHYClX72L8E3o=
To: ath10k@lists.infradead.org
Date: Wed, 10 Aug 2022 10:56:38 +0900 (KST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220809_185654_747015_327CB1A5 
X-CRM114-Status: UNSURE (   6.50  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Hi,

If you don't mind, I'd like ask a few questions regarding QCA6174 firmwares.

1. I've notice that QCA6174 hw3.0 4.4.1 firmwares have 4 versions (none, c1, c2, c3). Are there any differences? Which one is newest or correct?

2. My QCA6174 seems to have a compatibility issue with a recent firmware. I've tested theses firmware versions, but only the oldest one works.

RM.4.4.1.c2-00057-QCARMSWP-1 (debian oldstable's stock firmware, 20190114-2, work's fine):

ath10k_pci 0000:01:00.0: pci irq msi oper_irq_mode 2 irq_mode 0 reset_mode 0
ath10k_pci 0000:01:00.0: firmware: failed to load ath10k/pre-cal-pci-0000:01:00.0.bin (-2)
ath10k_pci 0000:01:00.0: firmware: failed to load ath10k/cal-pci-0000:01:00.0.bin (-2)
usbcore: registered new interface driver ath3k
ath10k_pci 0000:01:00.0: firmware: direct-loading firmware ath10k/QCA6174/hw3.0/firmware-6.bin
ath10k_pci 0000:01:00.0: qca6174 hw3.0 target 0x05020000 chip_id 0x003409ff sub 168c:3361
ath10k_pci 0000:01:00.0: kconfig debug 0 debugfs 0 tracing 0 dfs 0 testmode 0
ath10k_pci 0000:01:00.0: firmware ver RM.4.4.1.c2-00057-QCARMSWP-1 api 6 features wowlan,ignore-otp,no-4addr-pad,raw-mode crc32 e061250a
ath10k_pci 0000:01:00.0: firmware: direct-loading firmware ath10k/QCA6174/hw3.0/board-2.bin
ath10k_pci 0000:01:00.0: board_file api 2 bmi_id N/A crc32 20d869c3
ath10k_pci 0000:01:00.0: htt-ver 3.56 wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1


WLAN.RM.4.4.1-00157-QCARMSWPZ-1 (debian stable's stock firmware, 20210315-3):

ath10k_pci 0000:01:00.0: pci irq msi oper_irq_mode 2 irq_mode 0 reset_mode 0
ath10k_pci 0000:01:00.0: firmware: failed to load ath10k/pre-cal-pci-0000:01:00.0.bin (-2)
ath10k_pci 0000:01:00.0: firmware: failed to load ath10k/cal-pci-0000:01:00.0.bin (-2)
ath10k_pci 0000:01:00.0: firmware: direct-loading firmware ath10k/QCA6174/hw3.0/firmware-6.bin
ath10k_pci 0000:01:00.0: qca6174 hw3.0 target 0x05020000 chip_id 0x003409ff sub 168c:3361
ath10k_pci 0000:01:00.0: kconfig debug 0 debugfs 0 tracing 0 dfs 0 testmode 0
ath10k_pci 0000:01:00.0: firmware ver WLAN.RM.4.4.1-00157-QCARMSWPZ-1 api 6 features wowlan,ignore-otp,mfp crc32 90eebefb
ath10k_pci 0000:01:00.0: firmware: direct-loading firmware ath10k/QCA6174/hw3.0/board-2.bin
ath10k_pci 0000:01:00.0: board_file api 2 bmi_id N/A crc32 318825bf
ath10k_pci 0000:01:00.0: wmi unified ready event not received
ath10k_pci 0000:01:00.0: device has crashed during init
ath10k_pci 0000:01:00.0: device has crashed during init
ath10k_pci 0000:01:00.0: failed to wait for target init: -70
ath10k_pci 0000:01:00.0: could not init core (-110)
ath10k_pci 0000:01:00.0: could not probe fw (-110)



WLAN.RM.4.4.1-00288- (most recent version?):

ath10k_pci 0000:01:00.0: pci irq msi oper_irq_mode 2 irq_mode 0 reset_mode 0
ath10k_pci 0000:01:00.0: firmware: failed to load ath10k/pre-cal-pci-0000:01:00.0.bin (-2)
ath10k_pci 0000:01:00.0: firmware: failed to load ath10k/cal-pci-0000:01:00.0.bin (-2)
ath10k_pci 0000:01:00.0: firmware: direct-loading firmware ath10k/QCA6174/hw3.0/firmware-6.bin
ath10k_pci 0000:01:00.0: qca6174 hw3.0 target 0x05020000 chip_id 0x003409ff sub 168c:3361
ath10k_pci 0000:01:00.0: kconfig debug 0 debugfs 0 tracing 0 dfs 0 testmode 0
ath10k_pci 0000:01:00.0: firmware ver WLAN.RM.4.4.1-00288- api 6 features wowlan,ignore-otp,mfp crc32 bf907c7c
ath10k_pci 0000:01:00.0: board_file api 2 bmi_id N/A crc32 318825bf
ath10k_pci 0000:01:00.0: wmi unified ready event not received
ath10k_pci 0000:01:00.0: device has crashed during init
ath10k_pci 0000:01:00.0: device has crashed during init
ath10k_pci 0000:01:00.0: failed to wait for target init: -70
ath10k_pci 0000:01:00.0: could not init core (-110)
ath10k_pci 0000:01:00.0: could not probe fw (-110)



Kernel: Linux XXXX 5.10.0-16-amd64 #1 SMP Debian 5.10.127-2 (2022-07-23) x86_64 GNU/Linux

My lspci info:

01:00.0 Network controller [0280]: Qualcomm Atheros QCA6174 802.11ac Wireless Network Adapter [168c:003e] (rev 30)
	Subsystem: Qualcomm Atheros QCA6174 802.11ac Wireless Network Adapter [168c:3361]
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 64 bytes
	Interrupt: pin A routed to IRQ 150
	IOMMU group: 12
	Region 0: Memory at 7fc00000 (64-bit, non-prefetchable) [size=2M]
	Capabilities: [40] Power Management version 3
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=375mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [50] MSI: Enable+ Count=1/8 Maskable+ 64bit-
		Address: fee005f8  Data: 0000
		Masking: 000000fe  Pending: 00000000
	Capabilities: [70] Express (v2) Endpoint, MSI 00
		DevCap:	MaxPayload 256 bytes, PhantFunc 0, Latency L0s unlimited, L1 <64us
			ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset- SlotPowerLimit 10.000W
		DevCtl:	CorrErr- NonFatalErr- FatalErr- UnsupReq-
			RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop-
			MaxPayload 256 bytes, MaxReadReq 512 bytes
		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-
		LnkCap:	Port #0, Speed 2.5GT/s, Width x1, ASPM L0s L1, Exit Latency L0s <4us, L1 <64us
			ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
		LnkCtl:	ASPM Disabled; RCB 64 bytes, Disabled- CommClk+
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
		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr-
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
		L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-
			   T_CommonMode=0us LTR1.2_Threshold=81920ns
		L1SubCtl2: T_PwrOn=10us
	Kernel driver in use: ath10k_pci
	Kernel modules: ath10k_pci


Best Regards,
Wonsup Yoon
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
