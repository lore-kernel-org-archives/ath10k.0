Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bPPAZ-0006O4-11
 for ath10k@lists.infradead.org; Tue, 19 Jul 2016 07:10:24 +0000
Date: Tue, 19 Jul 2016 09:09:33 +0200
From: Stanislaw Gruszka <sgruszka@redhat.com>
Subject: ath10k fail to load firmware
Message-ID: <20160719070932.GA2751@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="ibTvN161/egqYuK8"
Content-Disposition: inline
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: Michal Kazior <michal.kazior@tieto.com>, ath10k@lists.infradead.org, perry_yuan@dell.com


--ibTvN161/egqYuK8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Perry from Dell has ath10k device, which do not work with current
linux-firmware. It's on RHEL kernel, however wirelss stack and drivers
are from 4.7-rc1 (I did not update to 4.7 final yet, since I do not see
ath10k fix, which could possibly help here). Partial dmesg is in
the attachment.

Thanks
Stanislaw

--ibTvN161/egqYuK8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="dmesg_ath10k_firmware_error.txt"

[ 3657.824833] ath10k_pci 0000:01:00.0: irq 127 for MSI/MSI-X
[ 3657.824850] ath10k_pci 0000:01:00.0: pci irq msi oper_irq_mode 2 irq_mode 0 reset_mode 0
[ 3658.026412] ath10k_pci 0000:01:00.0: Direct firmware load failed with error -2
[ 3658.026415] ath10k_pci 0000:01:00.0: Falling back to user helper
[ 3718.215979] ath10k_pci 0000:01:00.0: Direct firmware load failed with error -2
[ 3718.215983] ath10k_pci 0000:01:00.0: Falling back to user helper
[ 3778.377278] ath10k_pci 0000:01:00.0: Direct firmware load failed with error -2
[ 3778.377281] ath10k_pci 0000:01:00.0: Falling back to user helper
[ 3838.538737] ath10k_pci 0000:01:00.0: could not fetch firmware file 'ath10k/QCA6174/hw3.0/firmware-5.bin': -2
[ 3838.539093] ath10k_pci 0000:01:00.0: qca6174 hw3.2 target 0x05030000 chip_id 0x00340aff sub 1028:0310
[ 3838.539096] ath10k_pci 0000:01:00.0: kconfig debug 0 debugfs 1 tracing 0 dfs 0 testmode 0
[ 3838.539676] ath10k_pci 0000:01:00.0: firmware ver WLAN.RM.2.0-00180-QCARMSWPZ-1 api 4 features wowlan,ignore-otp,no-4addr-pad crc32 75dee6c5
[ 3838.601884] ath10k_pci 0000:01:00.0: failed to fetch board data for bus=pci,vendor=168c,device=003e,subsystem-vendor=1028,subsystem-device=0310 from ath10k/QCA6174/hw3.0/board-2.bin
[ 3838.601920] ath10k_pci 0000:01:00.0: board_file api 1 bmi_id N/A crc32 ed5f849a
[ 3840.719768] ath10k_pci 0000:01:00.0: htt-ver 3.26 wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1
[ 3840.774653] ath: EEPROM regdomain: 0x6c
[ 3840.774657] ath: EEPROM indicates we should expect a direct regpair map
[ 3840.774659] ath: Country alpha2 being used: 00
[ 3840.774660] ath: Regpair used: 0x6c
[ 3840.806880] IPv6: ADDRCONF(NETDEV_UP): wlp1s0: link is not ready
[ 3846.032903] ath10k_pci 0000:01:00.0: failed to set tx-chainmask: -11, req 0x3
[ 3849.032954] ath10k_pci 0000:01:00.0: failed to set arp ac override parameter: -11
[ 3855.033103] ath10k_pci 0000:01:00.0: could not suspend target (-11)
[ 3860.316236] ath10k_pci 0000:01:00.0: failed to enable dynamic BW: -11
[ 3866.316381] ath10k_pci 0000:01:00.0: could not suspend target (-11)
[ 3871.595515] ath10k_pci 0000:01:00.0: failed to set tx-chainmask: -11, req 0x3
[ 3874.595587] ath10k_pci 0000:01:00.0: failed to set arp ac override parameter: -11
[ 3880.595733] ath10k_pci 0000:01:00.0: could not suspend target (-11)
[ 3885.878861] ath10k_pci 0000:01:00.0: failed to set tx-chainmask: -11, req 0x3
[ 3888.878966] ath10k_pci 0000:01:00.0: failed to set arp ac override parameter: -11
[ 3894.879083] ath10k_pci 0000:01:00.0: could not suspend target (-11)
[ 3900.159214] ath10k_pci 0000:01:00.0: failed to set tx-chainmask: -11, req 0x3
[ 3903.159290] ath10k_pci 0000:01:00.0: failed to set arp ac override parameter: -11
[ 3909.159436] ath10k_pci 0000:01:00.0: could not suspend target (-11)
[ 3914.441566] ath10k_pci 0000:01:00.0: failed to set tx-chainmask: -11, req 0x3
[ 3917.441639] ath10k_pci 0000:01:00.0: failed to set arp ac override parameter: -11
[ 3923.441811] ath10k_pci 0000:01:00.0: could not suspend target (-11)
[ 3928.721921] ath10k_pci 0000:01:00.0: failed to set rx-chainmask: -11, req 0x3
[ 3931.721989] ath10k_pci 0000:01:00.0: failed to set arp ac override parameter: -11
[ 3937.722141] ath10k_pci 0000:01:00.0: could not suspend target (-11)
[ 3943.006271] ath10k_pci 0000:01:00.0: failed to enable dynamic BW: -11
[ 3949.006419] ath10k_pci 0000:01:00.0: could not suspend target (-11)
[ 3954.289546] ath10k_pci 0000:01:00.0: failed to set rx-chainmask: -11, req 0x3
[ 3957.289619] ath10k_pci 0000:01:00.0: failed to set arp ac override parameter: -11
[ 3963.291067] ath10k_pci 0000:01:00.0: could not suspend target (-11)
[ 3968.595899] ath10k_pci 0000:01:00.0: failed to set tx-chainmask: -11, req 0x3
[ 3971.595972] ath10k_pci 0000:01:00.0: failed to set arp ac override parameter: -11
[ 3977.596123] ath10k_pci 0000:01:00.0: could not suspend target (-11)
[ 3982.888250] ath10k_pci 0000:01:00.0: failed to set tx-chainmask: -11, req 0x3
[ 3985.888324] ath10k_pci 0000:01:00.0: failed to set arp ac override parameter: -11
[ 3991.888474] ath10k_pci 0000:01:00.0: could not suspend target (-11)
[ 3997.170623] ath10k_pci 0000:01:00.0: failed to set rx-chainmask: -11, req 0x3
[ 4000.170679] ath10k_pci 0000:01:00.0: failed to set arp ac override parameter: -11
[ 4005.673217] usb 1-3: USB disconnect, device number 9
[ 4006.170824] ath10k_pci 0000:01:00.0: could not suspend target (-11)
[ 4011.453957] ath10k_pci 0000:01:00.0: failed to enable dynamic BW: -11
[ 4017.454133] ath10k_pci 0000:01:00.0: could not suspend target (-11)
[ 4022.733233] ath10k_pci 0000:01:00.0: failed to enable adaptive qcs: -11
[ 4028.733380] ath10k_pci 0000:01:00.0: could not suspend target (-11)
[ 4034.014508] ath10k_pci 0000:01:00.0: failed to set rx-chainmask: -11, req 0x3
[ 4037.014584] ath10k_pci 0000:01:00.0: failed to set arp ac override parameter: -11
[ 4043.014732] ath10k_pci 0000:01:00.0: could not suspend target (-11)
[ 4048.297860] ath10k_pci 0000:01:00.0: failed to set rx-chainmask: -11, req 0x3
[ 4051.297952] ath10k_pci 0000:01:00.0: failed to set arp ac override parameter: -11
[ 4057.298086] ath10k_pci 0000:01:00.0: could not suspend target (-11)
[ 4062.582212] ath10k_pci 0000:01:00.0: failed to enable dynamic BW: -11
[ 4068.582368] ath10k_pci 0000:01:00.0: could not suspend target (-11)
[ 4073.866492] ath10k_pci 0000:01:00.0: failed to set tx-chainmask: -11, req 0x3
[ 4076.866569] ath10k_pci 0000:01:00.0: failed to set arp ac override parameter: -11
[ 4082.866730] ath10k_pci 0000:01:00.0: could not suspend target (-11)
[ 4088.145842] ath10k_pci 0000:01:00.0: failed to set tx-chainmask: -11, req 0x3
[ 4091.145914] ath10k_pci 0000:01:00.0: failed to set arp ac override parameter: -11
[ 4097.146076] ath10k_pci 0000:01:00.0: could not suspend target (-11)
[ 4102.427194] ath10k_pci 0000:01:00.0: failed to enable dynamic BW: -11
[ 4108.427367] ath10k_pci 0000:01:00.0: could not suspend target (-11)
[ 4113.708515] ath10k_pci 0000:01:00.0: failed to set rx-chainmask: -11, req 0x3
[ 4116.708558] ath10k_pci 0000:01:00.0: failed to set arp ac override parameter: -11
[ 4122.708698] ath10k_pci 0000:01:00.0: could not suspend target (-11)
[ 4127.986823] ath10k_pci 0000:01:00.0: failed to set tx-chainmask: -11, req 0x3
[ 4130.986897] ath10k_pci 0000:01:00.0: failed to set arp ac override parameter: -11
[ 4136.987045] ath10k_pci 0000:01:00.0: could not suspend target (-11)
[ 4142.269176] ath10k_pci 0000:01:00.0: failed to set tx-chainmask: -11, req 0x3
[ 4145.269248] ath10k_pci 0000:01:00.0: failed to set arp ac override parameter: -11
[ 4151.269508] ath10k_pci 0000:01:00.0: could not suspend target (-11)
[ 4156.549528] ath10k_pci 0000:01:00.0: failed to set tx-chainmask: -11, req 0x3
[ 4159.549604] ath10k_pci 0000:01:00.0: failed to set arp ac override parameter: -11
[ 4165.549748] ath10k_pci 0000:01:00.0: could not suspend target (-11)
[ 4170.829877] ath10k_pci 0000:01:00.0: failed to set rx-chainmask: -11, req 0x3
[ 4173.829952] ath10k_pci 0000:01:00.0: failed to set arp ac override parameter: -11
[ 4179.830102] ath10k_pci 0000:01:00.0: could not suspend target (-11)
[ 4185.110229] ath10k_pci 0000:01:00.0: failed to set tx-chainmask: -11, req 0x3
[ 4188.110302] ath10k_pci 0000:01:00.0: failed to set arp ac override parameter: -11
[ 4194.110449] ath10k_pci 0000:01:00.0: could not suspend target (-11)
[ 4199.390615] ath10k_pci 0000:01:00.0: failed to set tx-chainmask: -11, req 0x3
[ 4202.390653] ath10k_pci 0000:01:00.0: failed to set arp ac override parameter: -11
[ 4208.390800] ath10k_pci 0000:01:00.0: could not suspend target (-11)
[ 4213.671964] ath10k_pci 0000:01:00.0: failed to enable dynamic BW: -11
[ 4219.672080] ath10k_pci 0000:01:00.0: could not suspend target (-11)
[ 4224.951209] ath10k_pci 0000:01:00.0: failed to set rx-chainmask: -11, req 0x3
[ 4227.951283] ath10k_pci 0000:01:00.0: failed to set arp ac override parameter: -11
[ 4233.951430] ath10k_pci 0000:01:00.0: could not suspend target (-11)
[ 4239.231565] ath10k_pci 0000:01:00.0: failed to set rx-chainmask: -11, req 0x3
[ 4242.231863] ath10k_pci 0000:01:00.0: failed to set arp ac override parameter: -11
[ 4248.231786] ath10k_pci 0000:01:00.0: could not suspend target (-11)
[ 4253.512913] ath10k_pci 0000:01:00.0: failed to set tx-chainmask: -11, req 0x3
[ 4256.512987] ath10k_pci 0000:01:00.0: failed to set arp ac override parameter: -11
[ 4262.513152] ath10k_pci 0000:01:00.0: could not suspend target (-11)
[ 4267.794282] ath10k_pci 0000:01:00.0: failed to set tx-chainmask: -11, req 0x3
[ 4270.794346] ath10k_pci 0000:01:00.0: failed to set arp ac override parameter: -11
[ 4276.794486] ath10k_pci 0000:01:00.0: could not suspend target (-11)
[ 4282.077630] ath10k_pci 0000:01:00.0: failed to set rx-chainmask: -11, req 0x3
[ 4285.077694] ath10k_pci 0000:01:00.0: failed to set arp ac override parameter: -11
[ 4291.077838] ath10k_pci 0000:01:00.0: could not suspend target (-11)
[ 4296.356967] ath10k_pci 0000:01:00.0: failed to set tx-chainmask: -11, req 0x3
[ 4299.357040] ath10k_pci 0000:01:00.0: failed to set arp ac override parameter: -11
[ 4305.357187] ath10k_pci 0000:01:00.0: could not suspend target (-11)
[ 4310.637320] ath10k_pci 0000:01:00.0: failed to enable dynamic BW: -11
[ 4316.637467] ath10k_pci 0000:01:00.0: could not suspend target (-11)
[ 4321.917596] ath10k_pci 0000:01:00.0: failed to enable dynamic BW: -11
[ 4327.917742] ath10k_pci 0000:01:00.0: could not suspend target (-11)
[ 4333.198873] ath10k_pci 0000:01:00.0: failed to set tx-chainmask: -11, req 0x3
[ 4335.383925] usb 1-3: new high-speed USB device number 10 using xhci_hcd
[ 4335.549396] usb 1-3: New USB device found, idVendor=0930, idProduct=6545
[ 4335.549400] usb 1-3: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[ 4335.549403] usb 1-3: Product: TransMemory
[ 4335.549405] usb 1-3: Manufacturer: TOSHIBA
[ 4335.549407] usb 1-3: SerialNumber: C03FD5FBC7ECE020B0006F57
[ 4335.550532] usb-storage 1-3:1.0: USB Mass Storage device detected
[ 4335.552690] scsi host5: usb-storage 1-3:1.0
[ 4336.198950] ath10k_pci 0000:01:00.0: failed to set arp ac override parameter: -11
[ 4336.555509] scsi 5:0:0:0: Direct-Access     TOSHIBA  TransMemory      PMAP PQ: 0 ANSI: 6
[ 4336.555860] sd 5:0:0:0: Attached scsi generic sg1 type 0
[ 4336.556179] sd 5:0:0:0: [sdd] 30253056 512-byte logical blocks: (15.4 GB/14.4 GiB)
[ 4336.556391] sd 5:0:0:0: [sdd] Write Protect is off
[ 4336.556395] sd 5:0:0:0: [sdd] Mode Sense: 45 00 00 00
[ 4336.556591] sd 5:0:0:0: [sdd] Write cache: disabled, read cache: enabled, doesn't support DPO or FUA
[ 4336.610953]  sdd: sdd1
[ 4336.612040] sd 5:0:0:0: [sdd] Attached SCSI removable disk
[ 4338.782315] FAT-fs (sdd1): Volume was not properly unmounted. Some data may be corrupt. Please run fsck.
[ 4342.199098] ath10k_pci 0000:01:00.0: could not suspend target (-11)
[ 4344.921485] FAT-fs (sdc1): FAT read failed (blocknr 988)
[ 4347.491288] ath10k_pci 0000:01:00.0: failed to set rx-chainmask: -11, req 0x3
[ 4350.491331] ath10k_pci 0000:01:00.0: failed to set arp ac override parameter: -11
[ 4353.447107] FAT-fs (sdd1): Volume was not properly unmounted. Some data may be corrupt. Please run fsck.
[ 4356.035732] FAT-fs (sdc1): Directory bread(block 8192) failed
[ 4356.035737] FAT-fs (sdc1): Directory bread(block 8193) failed
[ 4356.035739] FAT-fs (sdc1): Directory bread(block 8194) failed
[ 4356.035741] FAT-fs (sdc1): Directory bread(block 8195) failed
[ 4356.035742] FAT-fs (sdc1): Directory bread(block 8196) failed
[ 4356.035744] FAT-fs (sdc1): Directory bread(block 8197) failed
[ 4356.035745] FAT-fs (sdc1): Directory bread(block 8198) failed
[ 4356.035746] FAT-fs (sdc1): Directory bread(block 8199) failed
[ 4356.035748] FAT-fs (sdc1): Directory bread(block 8200) failed
[ 4356.035749] FAT-fs (sdc1): Directory bread(block 8201) failed
[ 4356.491450] ath10k_pci 0000:01:00.0: could not suspend target (-11)
[ 4360.795098] usb 1-3: USB disconnect, device number 10
[ 4361.772579] ath10k_pci 0000:01:00.0: failed to set tx-chainmask: -11, req 0x3
[ 4361.978580] usb 1-3: new high-speed USB device number 11 using xhci_hcd
[ 4362.143504] usb 1-3: New USB device found, idVendor=0930, idProduct=6545
[ 4362.143509] usb 1-3: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[ 4362.143511] usb 1-3: Product: TransMemory
[ 4362.143513] usb 1-3: Manufacturer: TOSHIBA
[ 4362.143515] usb 1-3: SerialNumber: C03FD5FBC7ECE020B0006F57
[ 4362.144382] usb-storage 1-3:1.0: USB Mass Storage device detected
[ 4362.144498] scsi host6: usb-storage 1-3:1.0
[ 4363.146215] scsi 6:0:0:0: Direct-Access     TOSHIBA  TransMemory      PMAP PQ: 0 ANSI: 6
[ 4363.146501] sd 6:0:0:0: Attached scsi generic sg1 type 0
[ 4363.147387] sd 6:0:0:0: [sdd] 30253056 512-byte logical blocks: (15.4 GB/14.4 GiB)
[ 4363.147606] sd 6:0:0:0: [sdd] Write Protect is off
[ 4363.147610] sd 6:0:0:0: [sdd] Mode Sense: 45 00 00 00
[ 4363.147824] sd 6:0:0:0: [sdd] Write cache: disabled, read cache: enabled, doesn't support DPO or FUA
[ 4363.203504]  sdd: sdd1
[ 4363.204555] sd 6:0:0:0: [sdd] Attached SCSI removable disk
[ 4363.386793] FAT-fs (sdd1): Volume was not properly unmounted. Some data may be corrupt. Please run fsck.
[ 4364.772651] ath10k_pci 0000:01:00.0: failed to set arp ac override parameter: -11
[ 4365.018219] FAT-fs (sdc1): FAT read failed (blocknr 988)
[ 4370.772800] ath10k_pci 0000:01:00.0: could not suspend target (-11)
[ 4375.491274] fat__get_entry: 374 callbacks suppressed
[ 4375.491278] FAT-fs (sdc1): Directory bread(block 8192) failed
[ 4375.491283] FAT-fs (sdc1): Directory bread(block 8193) failed
[ 4375.491285] FAT-fs (sdc1): Directory bread(block 8194) failed
[ 4375.491287] FAT-fs (sdc1): Directory bread(block 8195) failed
[ 4375.491289] FAT-fs (sdc1): Directory bread(block 8196) failed
[ 4375.491291] FAT-fs (sdc1): Directory bread(block 8197) failed
[ 4375.491293] FAT-fs (sdc1): Directory bread(block 8198) failed
[ 4375.491295] FAT-fs (sdc1): Directory bread(block 8199) failed
[ 4375.491297] FAT-fs (sdc1): Directory bread(block 8200) failed
[ 4375.491299] FAT-fs (sdc1): Directory bread(block 8201) failed
[ 4376.076929] ath10k_pci 0000:01:00.0: failed to set tx-chainmask: -11, req 0x3
[ 4379.077003] ath10k_pci 0000:01:00.0: failed to set arp ac override parameter: -11
[ 4380.825017] fat__get_entry: 758 callbacks suppressed
[ 4380.825022] FAT-fs (sdc1): Directory bread(block 8192) failed
[ 4380.825025] FAT-fs (sdc1): Directory bread(block 8193) failed
[ 4380.825028] FAT-fs (sdc1): Directory bread(block 8194) failed
[ 4380.825030] FAT-fs (sdc1): Directory bread(block 8195) failed
[ 4380.825042] FAT-fs (sdc1): Directory bread(block 8196) failed
[ 4380.825045] FAT-fs (sdc1): Directory bread(block 8197) failed
[ 4380.825048] FAT-fs (sdc1): Directory bread(block 8198) failed
[ 4380.825051] FAT-fs (sdc1): Directory bread(block 8199) failed
[ 4380.825053] FAT-fs (sdc1): Directory bread(block 8200) failed
[ 4380.825055] FAT-fs (sdc1): Directory bread(block 8201) failed
[ 4381.253552] FAT-fs (sdd1): Volume was not properly unmounted. Some data may be corrupt. Please run fsck.
[ 4385.077150] ath10k_pci 0000:01:00.0: could not suspend target (-11)
[ 4387.400123] fat__get_entry: 630 callbacks suppressed
[ 4387.400127] FAT-fs (sdc1): Directory bread(block 8192) failed
[ 4387.400131] FAT-fs (sdc1): Directory bread(block 8193) failed
[ 4387.400133] FAT-fs (sdc1): Directory bread(block 8194) failed
[ 4387.400135] FAT-fs (sdc1): Directory bread(block 8195) failed
[ 4387.400138] FAT-fs (sdc1): Directory bread(block 8196) failed
[ 4387.400140] FAT-fs (sdc1): Directory bread(block 8197) failed
[ 4387.400142] FAT-fs (sdc1): Directory bread(block 8198) failed
[ 4387.400144] FAT-fs (sdc1): Directory bread(block 8199) failed
[ 4387.400147] FAT-fs (sdc1): Directory bread(block 8200) failed
[ 4387.400149] FAT-fs (sdc1): Directory bread(block 8201) failed
[ 4390.359284] ath10k_pci 0000:01:00.0: failed to set rx-chainmask: -11, req 0x3
[ 4393.359353] ath10k_pci 0000:01:00.0: failed to set arp ac override parameter: -11
[ 4399.359502] ath10k_pci 0000:01:00.0: could not suspend target (-11)
[ 4404.642633] ath10k_pci 0000:01:00.0: failed to set rx-chainmask: -11, req 0x3
[ 4407.642724] ath10k_pci 0000:01:00.0: failed to set arp ac override parameter: -11
[ 4413.642887] ath10k_pci 0000:01:00.0: could not suspend target (-11)
[ 4414.220306] usb 1-3: USB disconnect, device number 11
[ 4418.959019] ath10k_pci 0000:01:00.0: failed to set rx-chainmask: -11, req 0x3
[ 4421.959090] ath10k_pci 0000:01:00.0: failed to set arp ac override parameter: -11
[ 4427.959209] ath10k_pci 0000:01:00.0: could not suspend target (-11)
[ 4433.257338] ath10k_pci 0000:01:00.0: failed to set rx-chainmask: -11, req 0x3
[ 4436.257470] ath10k_pci 0000:01:00.0: failed to set arp ac override parameter: -11
[ 4438.436778] usb 1-3: new high-speed USB device number 12 using xhci_hcd
[ 4438.601141] usb 1-3: New USB device found, idVendor=0930, idProduct=6545
[ 4438.601145] usb 1-3: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[ 4438.601146] usb 1-3: Product: TransMemory
[ 4438.601148] usb 1-3: Manufacturer: TOSHIBA
[ 4438.601149] usb 1-3: SerialNumber: C03FD5FBC7ECE020B0006F57
[ 4438.601617] usb-storage 1-3:1.0: USB Mass Storage device detected
[ 4438.602075] scsi host7: usb-storage 1-3:1.0
[ 4439.604125] scsi 7:0:0:0: Direct-Access     TOSHIBA  TransMemory      PMAP PQ: 0 ANSI: 6
[ 4439.604931] sd 7:0:0:0: Attached scsi generic sg1 type 0
[ 4439.605131] sd 7:0:0:0: [sde] 30253056 512-byte logical blocks: (15.4 GB/14.4 GiB)
[ 4439.605325] sd 7:0:0:0: [sde] Write Protect is off
[ 4439.605329] sd 7:0:0:0: [sde] Mode Sense: 45 00 00 00
[ 4439.605574] sd 7:0:0:0: [sde] Write cache: disabled, read cache: enabled, doesn't support DPO or FUA
[ 4439.666342]  sde: sde1
[ 4439.667442] sd 7:0:0:0: [sde] Attached SCSI removable disk
[ 4439.860368] FAT-fs (sde1): Volume was not properly unmounted. Some data may be corrupt. Please run fsck.
[ 4441.095233] FAT-fs (sdd1): Directory bread(block 28256) failed
[ 4441.095237] FAT-fs (sdd1): Directory bread(block 28257) failed
[ 4441.095238] FAT-fs (sdd1): Directory bread(block 28258) failed
[ 4441.095240] FAT-fs (sdd1): Directory bread(block 28259) failed
[ 4441.095241] FAT-fs (sdd1): Directory bread(block 28260) failed
[ 4441.095242] FAT-fs (sdd1): Directory bread(block 28261) failed
[ 4441.095244] FAT-fs (sdd1): Directory bread(block 28262) failed
[ 4441.095245] FAT-fs (sdd1): Directory bread(block 28263) failed
[ 4441.095246] FAT-fs (sdd1): Directory bread(block 28264) failed
[ 4441.095247] FAT-fs (sdd1): Directory bread(block 28265) failed
[ 4442.257558] ath10k_pci 0000:01:00.0: could not suspend target (-11)
[ 4447.592688] ath10k_pci 0000:01:00.0: failed to set tx-chainmask: -11, req 0x3

--ibTvN161/egqYuK8
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--ibTvN161/egqYuK8--
