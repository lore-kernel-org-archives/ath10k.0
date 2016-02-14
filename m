Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x233.google.com ([2a00:1450:400c:c09::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aUytH-0006jj-Te
 for ath10k@lists.infradead.org; Sun, 14 Feb 2016 15:47:17 +0000
Received: by mail-wm0-x233.google.com with SMTP id g62so79005708wme.0
 for <ath10k@lists.infradead.org>; Sun, 14 Feb 2016 07:46:53 -0800 (PST)
Date: Sun, 14 Feb 2016 16:46:51 +0100
From: Tobias Predel <tobias.predel@gmail.com>
Subject: Re: ath10k and QCA3977 - random transfer rate losses
Message-ID: <20160214154651.GA16161@localhost.fritz.box>
References: <20160212203036.GA22070@localhost>
 <56BF1C48.9000206@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <56BF1C48.9000206@gmail.com>
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
To: vagner_ <vagnerrener@gmail.com>
Cc: ath10k@lists.infradead.org

Hi Vagner,

thanks for your quick reply! I tried out your proposal and together with power 
management switched off (iwconfig wlp2s0 power off) the chipset works like a charm! 

A big thank you to you and the professor from India! You made my day :)

I just keep wondering now whether the disabled power management
will increase the battery drain but maybe the firmware does handle
those things by itself...

So have a nice day and cheers,
Tobias

On Sat, Feb 13, 2016 at 02:06:32PM +0200, vagner_ wrote:
> Hi Tobias,
> 
> I also bought a laptop some weeks ago with an atheros chipset that required
> qca9377 - exactly like yours
> 
> Network controller: Qualcomm Atheros Device 0042 (rev 30) -
> 
> and it took me 2 or 3 weeks trying all kinds of solutions, including
> compiling a new kernel, kvalo drives and others. None of them worked.
> Finally, I found a drive that a professor from India, I think, wrote then I
> installed a new kernel 4.0 and the drive and since then it has been working
> marvelously.
> I even wrote to him to say thanks and got a good reply.
> I run Siduction distro with their very updated kernel.
> 
> Try this:
> 
> Remove your drive and install this one. It is very easy. Just run the
> script. Then tell us if that worked for you.
> Cheers and good luck...
> 
> https://github.com/ajaybhatia/Qualcomm-Atheros-QCA9377-Wifi-Linux
> 
> Vagner
> 
> +++++++++++++++++++++++++++++++++++++++
> 
> On 02/12/2016 10:30 PM, Tobias Predel wrote:
> >Hello,
> >
> >I bought a new laptop from ASUS, Product Name E205SA and installed Arch Linux. Unfortunately, the included WLAN chipset from Qualcomm  (QCA 9377) doesn't seem to work well with Linux. Beside of being recognized, the driver/device functions normally for the first minutes after boot, but then the transfer rate is suddenly lowering from around 700 kbs to 200 kbs and less, making Internet unusable. After a while, it's recovering a bit but it seems to be random (like it's trying to sleep/power save mode?). This behavior occures for my home network as well as at my university's network. As wifi access wasn't a issue with the Windows 10 OEM installation, I guess that this might a driver/firmware/configuration problem.
> >
> >dmesg indicates
> >[   13.401917] ath: EEPROM regdomain: 0x6a
> >[   13.403870] ath: EEPROM indicates we should expect a direct regpair map
> >[   13.405919] ath: Country alpha2 being used: 00
> >[   13.407837] ath: Regpair used: 0x6a
> >and
> >[   11.267403] ath10k_pci 0000:02:00.0: pci irq msi interrupts 1 irq_mode 0 reset_mode 0
> >[   11.500220] ath10k_pci 0000:02:00.0: Direct firmware load for ath10k/cal-pci-0000:02:00.0.bin failed with error -2
> >[   11.583900] ath10k_pci 0000:02:00.0: Direct firmware load for ath10k/QCA9377/hw1.0/board-2.bin failed with error -2
> >[   13.394121] ath10k_pci 0000:02:00.0: qca9377 hw1.0 (0x05020000, 0x003820ff sub 1a3b:2231) fw WLAN.TF.1.0-00267-1 fwapi 5 bdapi 1 htt-ver 3.1 wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1 features ignore-otp
> >[   13.398452] ath10k_pci 0000:02:00.0: debug 1 debugfs 1 tracing 0 dfs 0 testmode 0
> >[   13.422666] ath10k_pci 0000:02:00.0 wlp2s0: renamed from wlan0
> >
> >The firmware files were downloaded from the git repository <https://github.com/kvalo/ath10k-firmware>. In addition to that iwconfig gives me a high number of invalid miscs. I use kernel 4.4.1 (Arch Linux). ethtools -i wlp2s0 prints out
> >
> >driver: ath10k_pci
> >version: 4.4.1-2-ARCH
> >firmware-version: WLAN.TF.1.0-00267-1
> >expansion-rom-version:
> >bus-info: 0000:02:00.0
> >supports-statistics: yes
> >supports-test: no
> >supports-eeprom-access: no
> >supports-register-dump: no
> >supports-priv-flags: no
> >
> >and lspci provides
> >
> >02:00.0 Network controller: Qualcomm Atheros Device 0042 (rev 30)
> >	Subsystem: AzureWave Device 2231
> >	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
> >	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> >	Latency: 0, Cache Line Size: 64 bytes
> >	Interrupt: pin A routed to IRQ 315
> >	Region 0: Memory at 81000000 (64-bit, non-prefetchable) [size=2M]
> >	Capabilities: [40] Power Management version 3
> >		Flags: PMEClk- DSI- D1- D2- AuxCurrent=375mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
> >		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
> >	Capabilities: [50] MSI: Enable+ Count=1/8 Maskable+ 64bit-
> >		Address: fee0f00c  Data: 4163
> >		Masking: fffffffe  Pending: 00000000
> >	Capabilities: [70] Express (v2) Endpoint, MSI 00
> >		DevCap:	MaxPayload 256 bytes, PhantFunc 0, Latency L0s unlimited, L1 <64us
> >			ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
> >		DevCtl:	Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
> >			RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop-
> >			MaxPayload 128 bytes, MaxReadReq 512 bytes
> >		DevSta:	CorrErr+ UncorrErr- FatalErr- UnsuppReq+ AuxPwr+ TransPend-
> >		LnkCap:	Port #0, Speed 2.5GT/s, Width x1, ASPM L0s L1, Exit Latency L0s <4us, L1 <64us
> >			ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
> >		LnkCtl:	ASPM L0s L1 Enabled; RCB 64 bytes Disabled- CommClk+
> >			ExtSynch- ClockPM+ AutWidDis- BWInt- AutBWInt-
> >		LnkSta:	Speed 2.5GT/s, Width x1, TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
> >		DevCap2: Completion Timeout: Not Supported, TimeoutDis+, LTR+, OBFF Via message
> >		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR+, OBFF Disabled
> >		LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- SpeedDis-
> >			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
> >			 Compliance De-emphasis: -6dB
> >		LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete-, EqualizationPhase1-
> >			 EqualizationPhase2-, EqualizationPhase3-, LinkEqualizationRequest-
> >	Capabilities: [100 v2] Advanced Error Reporting
> >		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
> >		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
> >		UESvrt:	DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
> >		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
> >		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr+
> >		AERCap:	First Error Pointer: 00, GenCap- CGenEn- ChkCap- ChkEn-
> >	Capabilities: [148 v1] Virtual Channel
> >		Caps:	LPEVC=0 RefClk=100ns PATEntryBits=1
> >		Arb:	Fixed- WRR32- WRR64- WRR128-
> >		Ctrl:	ArbSelect=Fixed
> >		Status:	InProgress-
> >		VC0:	Caps:	PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
> >			Arb:	Fixed- WRR32- WRR64- WRR128- TWRR128- WRR256-
> >			Ctrl:	Enable+ ID=0 ArbSelect=Fixed TC/VC=ff
> >			Status:	NegoPending- InProgress-
> >	Capabilities: [168 v1] Device Serial Number 00-00-00-00-00-00-00-00
> >	Capabilities: [178 v1] Latency Tolerance Reporting
> >		Max snoop latency: 15360ns
> >		Max no snoop latency: 15360ns
> >	Capabilities: [180 v1] L1 PM Substates
> >		L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+ L1_PM_Substates+
> >			  PortCommonModeRestoreTime=50us PortTPowerOnTime=10us
> >	Kernel driver in use: ath10k_pci
> >	Kernel modules: ath10k_pci
> >
> >Could anyone give me a hint how I might fix this? Any help is greatly appreciated.
> >
> >Regards,
> >Tobias
> >
> >_______________________________________________
> >ath10k mailing list
> >ath10k@lists.infradead.org
> >http://lists.infradead.org/mailman/listinfo/ath10k
> 

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
