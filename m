Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mout.gmx.net ([212.227.15.18])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZqCRM-0007CN-Oc
 for ath10k@lists.infradead.org; Sun, 25 Oct 2015 03:57:53 +0000
Received: from [192.168.178.29] ([178.4.164.14]) by mail.gmx.com (mrgmx003)
 with ESMTPSA (Nemesis) id 0MI4yc-1ZnSbv3jYs-003qz1 for
 <ath10k@lists.infradead.org>; Sun, 25 Oct 2015 04:57:30 +0100
From: Michael Krupp <michaelkrupp@gmx.net>
Subject: Support for QCA6174 [168c:003e]
Message-ID: <562C5328.4060002@gmx.net>
Date: Sun, 25 Oct 2015 04:57:28 +0100
MIME-Version: 1.0
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

Hello,

I just bought a Aspire VN7-792G, but so far I was not able to get 
wireless working.
The chip reports as QCA6174 [168c:003e] and it looks like the board.bin 
cannot be loaded:

     Oct 25 04:27:05 debian kernel: [ 4833.902454] ath10k_pci 
0000:07:00.0: limiting irq mode to: 1
     Oct 25 04:27:05 debian kernel: [ 4833.902461] ath10k_pci 
0000:07:00.0: pci irq legacy interrupts 0 irq_mode 1 reset_mode 0
     Oct 25 04:27:05 debian kernel: [ 4834.162236] ath10k_pci 
0000:07:00.0: Direct firmware load for ath10k/cal-pci-0000:07:00.0.bin 
failed with error -2
     Oct 25 04:27:05 debian kernel: [ 4834.162250] ath10k_pci 
0000:07:00.0: Direct firmware load for 
ath10k/QCA6174/hw3.0/board-pci-168c:003e:11ad:0807.bin failed with error -2
     Oct 25 04:27:05 debian kernel: [ 4834.162253] ath10k_pci 
0000:07:00.0: failed to load spec board file, falling back to generic: -2
     Oct 25 04:27:05 debian kernel: [ 4834.162283] ath10k_pci 
0000:07:00.0: Direct firmware load for 
ath10k/QCA6174/hw3.0/firmware-5.bin failed with error -2
     Oct 25 04:27:05 debian kernel: [ 4834.162286] ath10k_pci 
0000:07:00.0: could not fetch firmware file 
'ath10k/QCA6174/hw3.0/firmware-5.bin': -2
     Oct 25 04:27:07 debian kernel: [ 4836.280409] ath10k_pci 
0000:07:00.0: qca6174 hw3.2 (0x05030000, 0x00340aff, 168c:003e:11ad:0807 
fallback) fw WLAN.RM.2.0-00180-QCARMSWPZ-1 api 4 htt 3.26 wmi 4 cal otp 
max_sta 32
     Oct 25 04:27:07 debian kernel: [ 4836.280413] ath10k_pci 
0000:07:00.0: debug 0 debugfs 0 tracing 0 dfs 0 testmode 0
     Oct 25 04:27:08 debian kernel: [ 4837.278508] ath10k_pci 
0000:07:00.0: suspend timed out - target pause event never came
     Oct 25 04:27:08 debian systemd[1]: Starting Load/Save RF Kill 
Switch Status...
     Oct 25 04:27:08 debian kernel: [ 4837.367302] ath: EEPROM 
regdomain: 0x6c
     Oct 25 04:27:08 debian kernel: [ 4837.367304] ath: EEPROM indicates 
we should expect a direct regpair map
     Oct 25 04:27:08 debian kernel: [ 4837.367306] ath: Country alpha2 
being used: 00
     Oct 25 04:27:08 debian kernel: [ 4837.367307] ath: Regpair used: 0x6c
     Oct 25 04:27:08 debian kernel: [ 4837.369008] ath10k_pci 
0000:07:00.0 wlp7s0: renamed from wlan0
     Oct 25 04:27:08 debian systemd[1]: Started Load/Save RF Kill Switch 
Status.


I also tried renaming / symlinking the firmware-4.bin to firmware-5.bin, 
but that does not seem to have any effect,
other than getting rid of the error message on lines 6 and 7.


Also followed the 'qca6164 support' discussion, but still could not get 
it working:
  * http://lists.infradead.org/pipermail/ath10k/2015-August/005752.html


I tried several kernel versions, starting from 4.2.0 (debian) up to 
latest 4.2.4 (kernel.org).
All of them seem to include the patch mentioned in the thread i linked 
erlier:
* http://lists.infradead.org/pipermail/ath10k/2015-August/005775.html


When trying to 'up' the device via 'ifconfig wlp7s0 up':

     Oct 25 04:31:36 debian kernel: [ 5104.570092] ath10k_pci 
0000:07:00.0: failed to enable adaptive qcs: -11
     Oct 25 04:31:39 debian kernel: [ 5107.569748] ath10k_pci 
0000:07:00.0: could not suspend target (-11)



I tired the following firmware images:
  * https://github.com/kvalo/ath10k-firmware
  * https://github.com/sumdog/ath10k-firmware
  * 
https://github.com/kvalo/ath10k-firmware/tree/b247aca880e2b228dddc647eb853e36a0627b189/ath10k/QCA6174/hw3.0
  * 
https://github.com/atondwal/ath10k-firmware/commit/88fca85ef59d708b9874e5b7885416b58aef9ee7

--

     # uname -a
     Linux debian 4.2.4 #2 SMP Sat Oct 24 23:56:33 CEST 2015 x86_64 
GNU/Linux

     # lspci
     00:00.0 Host bridge: Intel Corporation Sky Lake Host Bridge/DRAM 
Registers (rev 07)
     00:01.0 PCI bridge: Intel Corporation Sky Lake PCIe Controller 
(x16) (rev 07)
     00:02.0 VGA compatible controller: Intel Corporation Device 191b 
(rev 06)
     00:14.0 USB controller: Intel Corporation Sunrise Point-H USB 3.0 
xHCI Controller (rev 31)
     00:14.2 Signal processing controller: Intel Corporation Sunrise 
Point-H Thermal subsystem (rev 31)
     00:15.0 Signal processing controller: Intel Corporation Sunrise 
Point-H LPSS I2C Controller #0 (rev 31)
     00:15.1 Signal processing controller: Intel Corporation Sunrise 
Point-H LPSS I2C Controller #1 (rev 31)
     00:16.0 Communication controller: Intel Corporation Sunrise Point-H 
CSME HECI #1 (rev 31)
     00:17.0 SATA controller: Intel Corporation Sunrise Point-H SATA 
Controller [AHCI mode] (rev 31)
     00:1c.0 PCI bridge: Intel Corporation Sunrise Point-H PCI Express 
Root Port #3 (rev f1)
     00:1c.3 PCI bridge: Intel Corporation Sunrise Point-H PCI Express 
Root Port #4 (rev f1)
     00:1f.0 ISA bridge: Intel Corporation Sunrise Point-H LPC 
Controller (rev 31)
     00:1f.2 Memory controller: Intel Corporation Sunrise Point-H PMC 
(rev 31)
     00:1f.3 Multimedia audio controller: Intel Corporation Sunrise 
Point-H HD Audio (rev 31)
     00:1f.4 SMBus: Intel Corporation Sunrise Point-H SMBus (rev 31)
     01:00.0 3D controller: NVIDIA Corporation GM107M [GeForce GTX 950M] 
(rev a2)
     07:00.0 Network controller: Qualcomm Atheros QCA6174 802.11ac 
Wireless Network Adapter (rev 32)
     08:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd. 
RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller (rev 15)

     # lshw -c network
       *-network UNCLAIMED
            description: Network controller
            product: QCA6174 802.11ac Wireless Network Adapter
            vendor: Qualcomm Atheros
            physical id: 0
            bus info: pci@0000:07:00.0
            version: 32
            width: 64 bits
            clock: 33MHz
            capabilities: pm msi pciexpress cap_list
            configuration: latency=0
            resources: memory:54000000-541fffff


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
