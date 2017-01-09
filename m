Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vk0-x232.google.com ([2607:f8b0:400c:c05::232])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cQY7K-0006It-39
 for ath10k@lists.infradead.org; Mon, 09 Jan 2017 11:28:01 +0000
Received: by mail-vk0-x232.google.com with SMTP id 137so340425812vkl.0
 for <ath10k@lists.infradead.org>; Mon, 09 Jan 2017 03:27:37 -0800 (PST)
MIME-Version: 1.0
From: Sergey Stepanov <no.such.process@gmail.com>
Date: Mon, 9 Jan 2017 16:27:36 +0500
Message-ID: <CABuVarLXcrn1Lz3GHV1QBQxdoUg9YwJF7B43B_YqFg6Y7swPJQ@mail.gmail.com>
Subject: QCA9984 firmware crash
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

Hi

I'm porting ath10k drivers to run on a non-Linux environment (embedded
PowerPC with custom RTOS). At the moment only QCA99X0 part works
(somehow).

I have problem with running driver for QCA9984 part: firmware loads,
and during the boot if crashes with log:

 ath10k_debug_print_hwfw_info()    : qca9984/qca9994 hw1.0 target
0x01000000 chip_id 0x00000000 sub 168c:cafe
 ath10k_debug_print_hwfw_info()    : firmware ver 10.4-3.2-00072 api 5
features no-p2p,mfp,peer-flow-ctrl
 ath10k_core_pre_cal_download()    : boot did not find a pre
calibration file, try DT next: -2
 ath10k_core_pre_cal_download()    : boot using calibration mode pre-cal-dt

.. a lot of messages skipped

ath10k_pci_hif_tx_sg()            : pci tx item 0 paddr 0x056d5864 len
20 n_items 1
ath10k_pci_hif_tx_sg()            : pci tx data: len=20
ath10k_pci_hif_tx_sg()            : 02 01 0C 00 00 0B 00 00 08 90 00
00 22 00 00 00
ath10k_pci_hif_tx_sg()            : 01 00 00 00
napi_schedule()                   : napi schedule
ath10k_wmi_op_gen_pdev_set_param(): wmi pdev set param 10 value 1
ath10k_htc_send()                 : htc ep 2 consumed 1 credits (total 0)
ath10k_pci_hif_tx_sg()            : pci tx item 0 paddr 0x056d5764 len
20 n_items 1
ath10k_pci_hif_tx_sg()            : pci tx data: len=20
ath10k_pci_hif_tx_sg()            : 02 01 0C 00 00 0C 00 00 08 90 00
00 0A 00 00 00
ath10k_pci_hif_tx_sg()            : 01 00 00 00
ath10k_wmi_op_gen_pdev_set_param(): wmi pdev set param 1 value 15
napi_task()                       : napi poll
ath10k_pci_fw_crashed_dump()      : firmware crashed! (uuid n/a)
ath10k_pci_dump_registers()       : firmware register dump:
ath10k_pci_dump_registers()       : [00]: 0x0000000A 0x000015B3
0x0A03323A 0x00975B31
ath10k_pci_dump_registers()       : [04]: 0x0A03323A 0x00060930
0x0000000E 0x00000000
ath10k_pci_dump_registers()       : [08]: 0x00428B2C 0x004068D4
0x00000000 0x00469AC8
ath10k_pci_dump_registers()       : [12]: 0x00000009 0x00000000
0x00973D28 0x00973D33
ath10k_pci_dump_registers()       : [16]: 0x0A03323A 0x00973D2A
0x00000000 0x00000000
ath10k_pci_dump_registers()       : [20]: 0x409CA3BA 0x0040677C
0x00400000 0x00000000
ath10k_pci_dump_registers()       : [24]: 0x809C3DDF 0x004067DC
0x0041551C 0xC09CA3BA
ath10k_pci_dump_registers()       : [28]: 0x809B23D4 0x0040680C
0x00428B2C 0x004068D4
ath10k_pci_dump_registers()       : [32]: 0x809B1FF8 0x0040683C
0x00421190 0x004172AC
ath10k_pci_dump_registers()       : [36]: 0x809B2052 0x0040690C
0x0040697C 0x00975A00
ath10k_pci_dump_registers()       : [40]: 0x809B1BF0 0x0040693C
0x00000001 0x0040697C
ath10k_pci_dump_registers()       : [44]: 0x809B12CC 0x0040695C
0x0041D2B4 0x0041D2D8
ath10k_pci_dump_registers()       : [48]: 0x8096EE0E 0x0040697C
0x00421188 0x00000001
ath10k_pci_dump_registers()       : [52]: 0x8096F883 0x00406A2C
0x00426964 0x0041D990
ath10k_pci_dump_registers()       : [56]: 0x80963A26 0x00406A4C
0x00426964 0x00405528
napi_complete()                   : napi complete
__ath10k_set_antenna()            : failed to set tx-chainmask: -11, req 0xf
ath10k_wmi_op_gen_pdev_set_param(): wmi pdev set param 35 value 0
ath10k_start()                    : failed to set arp ac override parameter: -11
ath10k_wait_for_suspend()         : could not suspend target (-11)
ath10k_pci_hif_stop()             : boot hif stop
ath10k_pci_qca99x0_chip_reset()   : boot qca99x0 chip reset
ath10k_pci_cold_reset()           : boot cold reset
ath10k_pci_cold_reset()           : boot cold reset complete
ath10k_pci_wait_for_target_init() : boot waiting target to initialise
ath10k_pci_wait_for_target_init() : boot target indicator 0
ath10k_pci_wait_for_target_init() : boot target indicator 2
ath10k_pci_wait_for_target_init() : boot target initialised
ath10k_pci_qca99x0_chip_reset()   : boot qca99x0 chip reset complete (cold)

I also tried firmware ver 10.4-3.3 without success: same symptoms an
same faults.
I used driver sources and firmware from git repositories? listed on
http://linuxwireless.org/en/users/Drivers/ath10k.

I can provide more information (logs) to help to figure out: where the
problem is?

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
