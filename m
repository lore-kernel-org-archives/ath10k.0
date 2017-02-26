Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr0-x22d.google.com ([2a00:1450:400c:c0c::22d])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ci0wg-00075Z-QD
 for ath10k@lists.infradead.org; Sun, 26 Feb 2017 15:41:14 +0000
Received: by mail-wr0-x22d.google.com with SMTP id g10so37808352wrg.2
 for <ath10k@lists.infradead.org>; Sun, 26 Feb 2017 07:40:49 -0800 (PST)
Received: from lichtkranz.fritz.box (HSI-KBW-085-216-067-125.hsi.kabelbw.de.
 [85.216.67.125])
 by smtp.gmail.com with ESMTPSA id x193sm5768799wme.23.2017.02.26.07.40.46
 for <ath10k@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 26 Feb 2017 07:40:47 -0800 (PST)
Date: Sun, 26 Feb 2017 16:40:42 +0100
From: Tobias Predel <tobias.predel@gmail.com>
Subject: Recent driver changes destabilized QCA9377 connection quality
Message-ID: <20170226154042.GA5920@lichtkranz.fritz.box>
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

as I still encounter some stability issues with my beloved QCA9377 chipset on Linux, I decided to recompile the ath10k kernel module according to [1] in order to enable debugging and tracing (see [2]) instead of bisecting the commits because I don't have the ressource to do that in sufficient time.

Boundary conditions (additional information is provided below):

- Kernel version: 4.9.11
- Firmware files from https://github.com/kvalo/ath10k-firmware (the untested one just cause a firmware crash so I guess that one is for another type) 

My kernel ring puffer is flooded with two interesting types of messages and that is why I wanted to ask if these indicate "normal" behaviour or not.

(1) PCI related messages to and fro all over the time

[  872.134559] ath10k_pci 0000:02:00.0: pci ps sleep refcount 1 awake 1
[  872.134572] ath10k_pci 0000:02:00.0: pci ps wake refcount 0 awake 1
[  872.134585] ath10k_pci 0000:02:00.0: pci ps sleep refcount 1 awake 1
[  872.134598] ath10k_pci 0000:02:00.0: pci ps wake refcount 0 awake 1
[  872.134614] ath10k_pci 0000:02:00.0: pci ps sleep refcount 1 awake 1
[  872.134629] ath10k_pci 0000:02:00.0: pci ps wake refcount 0 awake 1
[  872.134645] ath10k_pci 0000:02:00.0: pci ps sleep refcount 1 awake 1
[  872.134657] ath10k_pci 0000:02:00.0: pci ps wake refcount 0 awake 1
[  872.134670] ath10k_pci 0000:02:00.0: pci ps sleep refcount 1 awake 1
[  872.195874] ath10k_pci 0000:02:00.0: pci ps timer refcount 0 awake 1
[  872.195891] ath10k_pci 0000:02:00.0: pci ps sleep reg refcount 0 awake 1
[  872.337625] ath10k_pci 0000:02:00.0: pci ps wake refcount 0 awake 0
[  872.337644] ath10k_pci 0000:02:00.0: pci ps wake reg refcount 0 awake 0
[  872.337707] ath10k_pci 0000:02:00.0: pci ps sleep refcount 1 awake 1
[  872.337727] ath10k_pci 0000:02:00.0: pci ps wake refcount 0 awake 1
[  872.337739] ath10k_pci 0000:02:00.0: pci ps sleep refcount 1 awake 1
[  872.337749] ath10k_pci 0000:02:00.0: pci ps wake refcount 0 awake 1
[  872.337758] ath10k_pci 0000:02:00.0: pci ps sleep refcount 1 awake 1
[  872.337768] ath10k_pci 0000:02:00.0: pci ps wake refcount 0 awake 1
[  872.337781] ath10k_pci 0000:02:00.0: pci ps sleep refcount 1 awake 1
[  872.337791] ath10k_pci 0000:02:00.0: pci ps wake refcount 0 awake 1
...

(2) Many FCS (frame check sequence) errors paired with "len 0"?

[  872.338194] ath10k_pci 0000:02:00.0: rx skb ffff88003765ec00 len 0 peer 00:XX:XX:XX:XX:88  mcast sn 1470 legacy rate_idx 0 vht_nss 0 freq 2447 band 0 flag 0x1200020 fcs-err 1 mic-err 0 amsdu-more 0
[  872.952364] ath10k_pci 0000:02:00.0: rx skb ffff880011356400 len 0 peer 00:XX:XX:XX:XX:88  mcast sn 1476 legacy rate_idx 0 vht_nss 0 freq 2447 band 0 flag 0x1200020 fcs-err 1 mic-err 0 amsdu-more 0
[  873.259564] ath10k_pci 0000:02:00.0: rx skb ffff88001ce2fd00 len 0 peer 00:XX:XX:XX:XX:88  mcast sn 1479 legacy rate_idx 0 vht_nss 0 freq 2447 band 0 flag 0x1200020 fcs-err 1 mic-err 0 amsdu-more 0
[  874.181195] ath10k_pci 0000:02:00.0: rx skb ffff88004b26be00 len 0 peer 00:XX:XX:XX:XX:88  mcast sn 1488 legacy rate_idx 0 vht_nss 0 freq 2447 band 0 flag 0x1200020 fcs-err 1 mic-err 0 amsdu-more 0
[  874.488037] ath10k_pci 0000:02:00.0: rx skb ffff88004b26bb00 len 0 peer 00:XX:XX:XX:XX:88  mcast sn 1491 legacy rate_idx 0 vht_nss 0 freq 2447 band 0 flag 0x1200020 fcs-err 1 mic-err 0 amsdu-more 0
[  874.795505] ath10k_pci 0000:02:00.0: rx skb ffff880037856e00 len 0 peer 00:XX:XX:XX:XX:88  mcast sn 1496 legacy rate_idx 0 vht_nss 0 freq 2447 band 0 flag 0x1200020 fcs-err 1 mic-err 0 amsdu-more 0
...

(3) Some probably (?) ordinary messages in minority like
[  873.566518] ath10k_pci 0000:02:00.0: pci rx ce pipe 5 len 60
[  873.566529] ath10k_pci 0000:02:00.0: htt rx, msg_type: 0x1
...

I would really appreciate if someone could just confirm whether the debug messages hint to firmware/driver issues or not. Thanks for your help!

Some additional information:

- iwconfig wlp2s0 power off/off doesn't change a lot, the same messages from above keep appearing

- PCI related (lspci -vv):
02:00.0 Network controller: Qualcomm Atheros QCA9377 802.11ac Wireless Network Adapter (rev 30)
	Subsystem: AzureWave Device 2231
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 64 bytes
	Interrupt: pin A routed to IRQ 312
	Region 0: Memory at 81000000 (64-bit, non-prefetchable) [size=2M]
	Capabilities: [40] Power Management version 3
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=375mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [50] MSI: Enable+ Count=1/8 Maskable+ 64bit-
		Address: fee0f00c  Data: 4143
		Masking: 000000fe  Pending: 00000000
	Capabilities: [70] Express (v2) Endpoint, MSI 00
		DevCap:	MaxPayload 256 bytes, PhantFunc 0, Latency L0s unlimited, L1 <64us
			ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset- SlotPowerLimit 10.000W
		DevCtl:	Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
			RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop-
			MaxPayload 128 bytes, MaxReadReq 512 bytes
		DevSta:	CorrErr+ UncorrErr- FatalErr- UnsuppReq+ AuxPwr+ TransPend-
		LnkCap:	Port #0, Speed 2.5GT/s, Width x1, ASPM L0s L1, Exit Latency L0s <4us, L1 <64us
			ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
		LnkCtl:	ASPM L0s L1 Enabled; RCB 64 bytes Disabled- CommClk+
			ExtSynch- ClockPM+ AutWidDis- BWInt- AutBWInt-
		LnkSta:	Speed 2.5GT/s, Width x1, TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
		DevCap2: Completion Timeout: Not Supported, TimeoutDis+, LTR+, OBFF Via message
		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR+, OBFF Disabled
		LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- SpeedDis-
			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
			 Compliance De-emphasis: -6dB
		LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete-, EqualizationPhase1-
			 EqualizationPhase2-, EqualizationPhase3-, LinkEqualizationRequest-
	Capabilities: [100 v2] Advanced Error Reporting
		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
		UESvrt:	DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr+
		AERCap:	First Error Pointer: 00, GenCap- CGenEn- ChkCap- ChkEn-
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
		Max snoop latency: 15360ns
		Max no snoop latency: 15360ns
	Capabilities: [180 v1] L1 PM Substates
		L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+ L1_PM_Substates+
			  PortCommonModeRestoreTime=50us PortTPowerOnTime=10us
		L1SubCtl1: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
			   T_CommonMode=0us LTR1.2_Threshold=163840ns
		L1SubCtl2: T_PwrOn=10us
	Kernel driver in use: ath10k_pci
	Kernel modules: ath10k_pci

- Some ethtool statistics (ethtool -S <device>):
NIC statistics:
     rx_packets: 92152
     rx_bytes: 55156501
     rx_duplicates: 74
     rx_fragments: 65368
     rx_dropped: 421
     tx_packets: 19775
     tx_bytes: 2283053
     tx_filtered: 0
     tx_retry_failed: 31
     tx_retries: 0
     sta_state: 4
     txrate: 1000000
     rxrate: 54000000
     signal: 185
     channel: 2447
     noise: 18446744073709551615
     ch_time: 18446744073709551615
     ch_time_busy: 18446744073709551615
     ch_time_ext_busy: 18446744073709551615
     ch_time_rx: 18446744073709551615
     ch_time_tx: 18446744073709551615
     tx_pkts_nic: 36194
     tx_bytes_nic: 0
     rx_pkts_nic: 52893
     rx_bytes_nic: 0
     d_noise_floor: 18446744073709551503
     d_cycle_count: 3234369886
     d_phy_error: 8
     d_rts_bad: 0
     d_rts_good: 0
     d_tx_power: 38
     d_rx_crc_err: 0
     d_no_beacon: 0
     d_tx_mpdus_queued: 20978
     d_tx_msdu_queued: 20978
     d_tx_msdu_dropped: 0
     d_local_enqued: 1205
     d_local_freed: 1205
     d_tx_ppdu_hw_queued: 36194
     d_tx_ppdu_reaped: 36194
     d_tx_fifo_underrun: 0
     d_tx_ppdu_abort: 0
     d_tx_mpdu_requed: 15216
     d_tx_excessive_retries: 15247
     d_tx_hw_rate: 0
     d_tx_dropped_sw_retries: 0
     d_tx_illegal_rate: 0
     d_tx_continuous_xretries: 0
     d_tx_timeout: 0
     d_tx_mpdu_txop_limit: 0
     d_pdev_resets: 3
     d_rx_mid_ppdu_route_change: 0
     d_rx_status: 83552
     d_rx_extra_frags_ring0: 0
     d_rx_extra_frags_ring1: 43
     d_rx_extra_frags_ring2: 6
     d_rx_extra_frags_ring3: 0
     d_rx_msdu_htt: 52894
     d_rx_mpdu_htt: 52893
     d_rx_msdu_stack: 26796
     d_rx_mpdu_stack: 26796
     d_rx_phy_err: 0
     d_rx_phy_err_drops: 2
     d_rx_mpdu_errors: 18097
     d_fw_crash_count: 0
     d_fw_warm_reset_count: 3
     d_fw_cold_reset_count: 3

- firmware (ethtool -i <device>)
driver: ath10k_pci
version: 4.9.11-1-ARCH
firmware-version: WLAN.TF.1.0-00267-1
expansion-rom-version: 
bus-info: 0000:02:00.0
supports-statistics: yes
supports-test: no
supports-eeprom-access: no
supports-register-dump: no
supports-priv-flags: no

- modinfo ath10k_core
filename:       /lib/modules/4.9.11-1-ARCH/kernel/drivers/net/wireless/ath/ath10k/ath10k_core.ko.gz
license:        Dual BSD/GPL
description:    Core module for Qualcomm Atheros 802.11ac wireless LAN cards.
author:         Qualcomm Atheros
depends:        mac80211,cfg80211,ath
vermagic:       4.9.11-ARCH SMP preempt mod_unload modversions 
parm:           debug_mask:Debugging mask (uint)
parm:           uart_print:Uart target debugging (bool)
parm:           skip_otp:Skip otp failure for calibration in testmode (bool)
parm:           cryptmode:Crypto mode: 0-hardware, 1-software (uint)
parm:           rawmode:Use raw 802.11 frame datapath (bool)

- modinfo ath10k_pci
filename:       /lib/modules/4.9.11-1-ARCH/kernel/drivers/net/wireless/ath/ath10k/ath10k_pci.ko.gz
firmware:       ath10k/QCA9377/hw1.0/board.bin
firmware:       ath10k/QCA9377/hw1.0/firmware-5.bin
firmware:       ath10k/QCA6174/hw3.0/board-2.bin
firmware:       ath10k/QCA6174/hw3.0/board.bin
firmware:       ath10k/QCA6174/hw3.0/firmware-5.bin
firmware:       ath10k/QCA6174/hw3.0/firmware-4.bin
firmware:       ath10k/QCA6174/hw2.1/board-2.bin
firmware:       ath10k/QCA6174/hw2.1/board.bin
firmware:       ath10k/QCA6174/hw2.1/firmware-5.bin
firmware:       ath10k/QCA6174/hw2.1/firmware-4.bin
firmware:       ath10k/QCA9887/hw1.0/board-2.bin
firmware:       ath10k/QCA9887/hw1.0/board.bin
firmware:       ath10k/QCA9887/hw1.0/firmware-5.bin
firmware:       ath10k/QCA988X/hw2.0/board-2.bin
firmware:       ath10k/QCA988X/hw2.0/board.bin
firmware:       ath10k/QCA988X/hw2.0/firmware-5.bin
firmware:       ath10k/QCA988X/hw2.0/firmware-4.bin
firmware:       ath10k/QCA988X/hw2.0/firmware-3.bin
firmware:       ath10k/QCA988X/hw2.0/firmware-2.bin
license:        Dual BSD/GPL
description:    Driver support for Qualcomm Atheros 802.11ac WLAN PCIe/AHB devices
author:         Qualcomm Atheros
alias:          pci:v0000168Cd00000050sv*sd*bc*sc*i*
alias:          pci:v0000168Cd00000042sv*sd*bc*sc*i*
alias:          pci:v0000168Cd00000046sv*sd*bc*sc*i*
alias:          pci:v0000168Cd00000056sv*sd*bc*sc*i*
alias:          pci:v0000168Cd00000040sv*sd*bc*sc*i*
alias:          pci:v0000168Cd0000003Esv*sd*bc*sc*i*
alias:          pci:v0000168Cd00000041sv*sd*bc*sc*i*
alias:          pci:v0000168Cd0000003Csv*sd*bc*sc*i*
depends:        ath10k_core
vermagic:       4.9.11-ARCH SMP preempt mod_unload modversions 
parm:           irq_mode:0: auto, 1: legacy, 2: msi (default: 0) (uint)
parm:           reset_mode:0: auto, 1: warm only (default: 0) (uint)

Sincerely yours,

Tobias

[1] https://wiki.archlinux.org/index.php/Compile_kernel_module
[2] https://wireless.wiki.kernel.org/en/users/drivers/ath10k/debug (I introduced 0xffffff3f as value for debug_mask via the sysfs interface)

-- 
Tobias Predel
currently studying Transportation Engineering B.Sc.
at Stuttgart University


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
