Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x231.google.com ([2a00:1450:400c:c09::231])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c5nnW-0003bA-JG
 for ath10k@lists.infradead.org; Sun, 13 Nov 2016 05:57:47 +0000
Received: by mail-wm0-x231.google.com with SMTP id f82so45491273wmf.1
 for <ath10k@lists.infradead.org>; Sat, 12 Nov 2016 21:57:25 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?B?SGVucsO9IMOew7NyIEJhbGR1cnNzb24=?= <henry.baldursson@gmail.com>
Date: Sun, 13 Nov 2016 05:57:22 +0000
Message-ID: <CABkmk0WJhXOW2voJwNSHa7G0oz7T70grS2PGt_eNUcJKgxe0wg@mail.gmail.com>
Subject: Connection problems with Qualcomm Atheros QCA6174
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

Hello

I have a Lenovo Ideapad Yoga 910 running Athergos, kernel version 4.8.7.

My problem is that intermittently my wifi will just grind to a halt
and even stop working.

The driver reports the firmware as being WLAN.RM.2.0-00180-QCARMSWPZ-1

Here's the initialization in dmesg:

[    1.900033] ath10k_pci 0000:01:00.0: pci irq msi oper_irq_mode 2
irq_mode 0 reset_mode 0
[    2.173039] ath10k_pci 0000:01:00.0: Direct firmware load for
ath10k/pre-cal-pci-0000:01:00.0.bin failed with error -2
[    2.173054] ath10k_pci 0000:01:00.0: Direct firmware load for
ath10k/cal-pci-0000:01:00.0.bin failed with error -2
[    2.174217] ath10k_pci 0000:01:00.0: Direct firmware load for
ath10k/QCA6174/hw3.0/firmware-5.bin failed with error -2
[    2.174218] ath10k_pci 0000:01:00.0: could not fetch firmware file
'ath10k/QCA6174/hw3.0/firmware-5.bin': -2
[    2.175485] ath10k_pci 0000:01:00.0: qca6174 hw3.2 target
0x05030000 chip_id 0x00340aff sub 17aa:0827
[    2.175487] ath10k_pci 0000:01:00.0: kconfig debug 0 debugfs 1
tracing 0 dfs 0 testmode 0
[    2.175876] ath10k_pci 0000:01:00.0: firmware ver
WLAN.RM.2.0-00180-QCARMSWPZ-1 api 4 features
wowlan,ignore-otp,no-4addr-pad crc32 75dee6c5
[    2.240312] ath10k_pci 0000:01:00.0: board_file api 2 bmi_id N/A
crc32 6fc88fe7
[    4.405741] ath10k_pci 0000:01:00.0: htt-ver 3.26 wmi-op 4 htt-op 3
cal otp max-sta 32 raw 0 hwcrypto 1
[    4.485362] ath10k_pci 0000:01:00.0 wlp1s0: renamed from wlan0


Here's what dmesg shows during the errors:

[ 1238.710899] pcieport 0000:00:1c.0: AER: Corrected error received: id=00e0
[ 1238.710920] pcieport 0000:00:1c.0: PCIe Bus Error:
severity=Corrected, type=Data Link Layer, id=00e0(Transmitter ID)
[ 1238.710935] pcieport 0000:00:1c.0:   device [8086:9d14] error
status/mask=00001000/00000000
[ 1238.710945] pcieport 0000:00:1c.0:    [12] Replay Timer Timeout
[ 1243.855456] pcieport 0000:00:1c.0: AER: Corrected error received: id=00e0
[ 1243.855472] pcieport 0000:00:1c.0: PCIe Bus Error:
severity=Corrected, type=Data Link Layer, id=00e0(Transmitter ID)
[ 1243.855484] pcieport 0000:00:1c.0:   device [8086:9d14] error
status/mask=00001000/00000000
[ 1243.855491] pcieport 0000:00:1c.0:    [12] Replay Timer Timeout
[ 1296.095437] pcieport 0000:00:1c.0: AER: Corrected error received: id=00e0
[ 1296.095452] pcieport 0000:00:1c.0: PCIe Bus Error:
severity=Corrected, type=Data Link Layer, id=00e0(Transmitter ID)
[ 1296.095464] pcieport 0000:00:1c.0:   device [8086:9d14] error
status/mask=00001000/00000000
[ 1296.095472] pcieport 0000:00:1c.0:    [12] Replay Timer Timeout
[ 1305.877547] pcieport 0000:00:1c.0: AER: Corrected error received: id=00e0
[ 1305.877562] pcieport 0000:00:1c.0: PCIe Bus Error:
severity=Corrected, type=Data Link Layer, id=00e0(Transmitter ID)
[ 1305.877574] pcieport 0000:00:1c.0:   device [8086:9d14] error
status/mask=00001000/00000000
[ 1305.877581] pcieport 0000:00:1c.0:    [12] Replay Timer Timeout
[ 1556.596092] pcieport 0000:00:1c.0: AER: Corrected error received: id=00e0
[ 1556.596107] pcieport 0000:00:1c.0: PCIe Bus Error:
severity=Corrected, type=Data Link Layer, id=00e0(Transmitter ID)
[ 1556.596115] pcieport 0000:00:1c.0:   device [8086:9d14] error
status/mask=00001000/00000000
[ 1556.596122] pcieport 0000:00:1c.0:    [12] Replay Timer Timeout
[ 1612.764108] pcieport 0000:00:1c.0: AER: Corrected error received: id=00e0
[ 1612.764124] pcieport 0000:00:1c.0: PCIe Bus Error:
severity=Corrected, type=Data Link Layer, id=00e0(Transmitter ID)
[ 1612.764135] pcieport 0000:00:1c.0:   device [8086:9d14] error
status/mask=00001000/00000000
[ 1612.764143] pcieport 0000:00:1c.0:    [12] Replay Timer Timeout


It doesn't appear to show that error every time I have this issue, for
one reason or another, so I can't confirm this replay timer thing is
the extent of my problems.

But I dual boot to Windows 10, and have never noticed any networking
issue there, despite extended use. But it happens rather consistently
under Linux. I check my wifi with my Android device as soon as this
happens but never do I see it having trouble with the network at the
same time.

If anyone could point me in the right direction I'd sure appreciate it.

Regards,
Henry

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
