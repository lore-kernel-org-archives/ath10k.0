Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mout.gmx.net ([212.227.17.20])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eqFfo-0000MY-Ot
 for ath10k@lists.infradead.org; Mon, 26 Feb 2018 10:07:19 +0000
Received: from localhost ([80.129.56.250]) by mail.gmx.com (mrgmx103
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0LwJko-1efbU01QuE-01847P for
 <ath10k@lists.infradead.org>; Mon, 26 Feb 2018 11:06:06 +0100
Date: Mon, 26 Feb 2018 11:06:05 +0100
From: Stefan =?iso-8859-1?Q?Kr=FCger?= <stadtkind2@gmx.de>
Subject: no board data for WLE650V5-18
Message-ID: <20180226100605.GA1071@web.de>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org

Hi,

I have some trouble getting my new Compex WLE650V5-18 to work.

OS: Ubuntu 17.10
Kernel: linux-generic  4.13.0.36.38 amd64
Firmware: linux-firmware 1.169.3

/lib/firmware/ath10k/QCA9888/hw2.0$ sha256sum *
65f73a7d762dadea2f7f500151965b96988b07e867155df6a41ad7599d3473b0  board-2.bin
8f96062e838f22a8c77f473ed66b5109581a013e2b65e837e30e89ebe6cbb71e  firmware-5.bin

$ dmesg | grep ath10k
[   11.741029] ath10k_pci 0000:04:00.0: pci irq msi oper_irq_mode 2 irq_mode 
0 reset_mode 0
[   11.879752] ath10k_pci 0000:04:00.0: qca9888 hw2.0 target 0x01000000 
chip_id 0x00000000 sub 0000:0000
[   11.879763] ath10k_pci 0000:04:00.0: kconfig debug 0 debugfs 1 tracing 1 
dfs 0 testmode 0
[   11.881241] ath10k_pci 0000:04:00.0: firmware ver 10.4-3.5.1-00014 api 5 
features no-p2p,mfp,peer-flow-ctrl,allows-mesh-bcast crc32 387b6980
[   13.872516] ath10k_pci 0000:04:00.0: failed to fetch board data for 
bus=pci,bmi-chip-id=0,bmi-board-id=30 from ath10k/QCA9888/hw2.0/board-2.bin
[   13.872665] ath10k_pci 0000:04:00.0: failed to fetch board-2.bin or 
board.bin from ath10k/QCA9888/hw2.0
[   13.872693] ath10k_pci 0000:04:00.0: failed to fetch board file: -2
[   13.872776] ath10k_pci 0000:04:00.0: could not probe fw (-2)

$ lspci -s 04:00.0 -vv
04:00.0 Network controller: Qualcomm Atheros Device 0056
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 32
        Region 0: Memory at f7600000 (64-bit, non-prefetchable) [size=2M]
        Capabilities: <access denied>
        Kernel driver in use: ath10k_pci
        Kernel modules: ath10k_pci

Any help is greatly appreciated.

Thanks!

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
