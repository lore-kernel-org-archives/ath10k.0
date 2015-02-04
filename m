Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x229.google.com ([2a00:1450:400c:c05::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YJ4S4-0006vS-KR
 for ath10k@lists.infradead.org; Wed, 04 Feb 2015 18:13:25 +0000
Received: by mail-wi0-f169.google.com with SMTP id h11so30942715wiw.0
 for <ath10k@lists.infradead.org>; Wed, 04 Feb 2015 10:13:01 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87iofhubf9.fsf@kamboji.qca.qualcomm.com>
References: <87fvawcp7d.fsf@kamboji.qca.qualcomm.com>
 <CAAmLN2Y8L_BZbZBCvUEw_i9OJoWvzaUT6H5UsyBymaozLubcOA@mail.gmail.com>
 <87iofhubf9.fsf@kamboji.qca.qualcomm.com>
Date: Wed, 4 Feb 2015 19:13:01 +0100
Message-ID: <CAAmLN2Z9vkU5o_kFoxCDgYy1BnPDSAk1WXmKjv9JthHz9zpnnQ@mail.gmail.com>
Subject: Re: First QCA6174 firmware release
From: Joris Guisson <joris.guisson@gmail.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: ath10k@lists.infradead.org

This is what lspci -vvv says:

04:00.0 Network controller: Qualcomm Atheros Device 003e (rev 20)
        Subsystem: Bigfoot Networks, Inc. Device 1525
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 31
        Region 0: Memory at f7200000 (64-bit, non-prefetchable) [size=2M]
        Capabilities: [40] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=375mA
PME(D0+,D1-,D2-,D3hot+,D3cold+)
                Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [50] MSI: Enable+ Count=8/8 Maskable+ 64bit-
                Address: fee00518  Data: 0000
                Masking: 00000000  Pending: 00000000
        Capabilities: [70] Express (v2) Endpoint, MSI 00
                DevCap: MaxPayload 256 bytes, PhantFunc 0, Latency L0s
unlimited, L1 <64us
                        ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal-
Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 128 bytes, MaxReadReq 512 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq-
AuxPwr+ TransPend-
                LnkCap: Port #0, Speed 2.5GT/s, Width x1, ASPM L0s L1,
Exit Latency L0s <4us, L1 <64us
                        ClockPM+ Surprise- LLActRep- BwNot-
                LnkCtl: ASPM Disabled; RCB 64 bytes Disabled- CommClk-
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 2.5GT/s, Width x1, TrErr- Train-
SlotClk+ DLActive- BWMgmt- ABWMgmt-
                DevCap2: Completion Timeout: Not Supported,
TimeoutDis+, LTR+, OBFF Via message
                DevCtl2: Completion Timeout: 50us to 50ms,
TimeoutDis-, LTR+, OBFF Disabled
                LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- SpeedDis-
                         Transmit Margin: Normal Operating Range,
EnterModifiedCompliance- ComplianceSOS-
                         Compliance De-emphasis: -6dB
                LnkSta2: Current De-emphasis Level: -6dB,
EqualizationComplete-, EqualizationPhase1-
                         EqualizationPhase2-, EqualizationPhase3-,
LinkEqualizationRequest-
        Capabilities: [100 v2] Advanced Error Reporting
                UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt-
UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt-
UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt-
UnxCmplt- RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
                CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
                CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr+
                AERCap: First Error Pointer: 00, GenCap- CGenEn- ChkCap- ChkEn-
        Capabilities: [148 v1] Virtual Channel
                Caps:   LPEVC=0 RefClk=100ns PATEntryBits=1
                Arb:    Fixed- WRR32- WRR64- WRR128-
                Ctrl:   ArbSelect=Fixed
                Status: InProgress-
                VC0:    Caps:   PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
                        Arb:    Fixed- WRR32- WRR64- WRR128- TWRR128- WRR256-
                        Ctrl:   Enable+ ID=0 ArbSelect=Fixed TC/VC=01
                        Status: NegoPending- InProgress-
        Capabilities: [168 v1] Device Serial Number 00-00-00-00-00-00-00-00
        Capabilities: [178 v1] Latency Tolerance Reporting
                Max snoop latency: 71680ns
                Max no snoop latency: 71680ns
        Capabilities: [180 v1] L1 PM Substates
                L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+
ASPM_L1.1+ L1_PM_Substates+
                          PortCommonModeRestoreTime=50us PortTPowerOnTime=10us
        Kernel driver in use: ath10k_pci


What other information do you need to know ?

Where are you actually getting these firmwares from ? Are these
firmwares just taken from windows drivers ?

 I did a quick find -name '*.bin' on my windows C partition, and I found these:

./Program Files/Qualcomm Atheros/Network
Manager/11AC/eeprom_ar6320_2p1_NFA344i.bin
./Program Files/Qualcomm Atheros/Network
Manager/11AC/eeprom_ar6320_2p1_NFA345i.bin
./Program Files/Qualcomm Atheros/Network
Manager/11AC/eeprom_ar6320_2p1_NFA354xp.bin
./Program Files/Qualcomm Atheros/Network
Manager/11AC/eeprom_ar6320_2p1_NFA355i.bin
./Program Files/Qualcomm Atheros/Network Manager/11AC/qca61x420.bin


Joris,

On Wed, Feb 4, 2015 at 1:08 PM, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> Joris Guisson <joris.guisson@gmail.com> writes:
>
>> Where is the QCA6174 v2.1 firmware ?
>
> I only have hw3.0 and no hw2.1. Can you give me more details what kind
> of device you are using?
>
> --
> Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
