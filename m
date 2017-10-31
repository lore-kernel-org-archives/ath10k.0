Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mout.gmx.net ([212.227.15.15])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e9a2p-0003NX-DV
 for ath10k@lists.infradead.org; Tue, 31 Oct 2017 17:09:47 +0000
Received: from laptopv.localnet ([78.50.199.232]) by mail.gmx.com (mrgmx001
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0MZkv0-1drU9Y0iEw-00LU4g for
 <ath10k@lists.infradead.org>; Tue, 31 Oct 2017 18:09:18 +0100
From: phaef5Ie@nurfuerspam.de
Subject: firmware crash; Atheros QCA6174 doesn't work
Date: Tue, 31 Oct 2017 18:09:17 +0100
Message-ID: <50327789.T1NR8j5T4B@laptopv>
MIME-Version: 1.0
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

I am trying to get wlan working but it doesn't work. So far I have tried:

1. tried to boot up Ubuntu based LiveCD neon-kde; wlp1s0 recognized but device doesn't work
   => dmesg message: failed to fetch board data board-2.bin

2. using latest firmware driver [git.kernel.org]; rmmod ath10k_pci ath10k_core ath; modprobe ath10k_pci
   => wlp1s0 gone; dmesg: firmware not found

3. I found an instruction for user made firmware:
   a. I took the windows driver "qca61x4_2_2.bin" 
   b. downloaded dissect.py at https://gist.github.com/kazikcz/8e5845ad84ca251aa295
   c. downloaded assemble.py https://gist.github.com/kazikcz/c970cbf3a863ebbc4495
   d. python dissect.py <qca61x4_2_2.bin => extracted fw[1-4].bin
   e. python assemble.py qca61x4_2_2_samsung_api_5 0 fw-2.bin fw-1.bin 0 >firmware-5.bin
   f. cp firmware-5.bin into /lib/firmware/ath10k/QCA6174/hw3.0/
   g. using windows eeprom-file => cp eeprom_ar6320_3p0_SS_620.bin /lib/....../hw3.0/board.bin
   h. rmmod ath10k_pci ath10k_core ath; modprobe ath10k_pci
   
   => result: dmesg: firmware-5.bin loaded but "board-2.bin failed"

4. using a rolling release / installation iso archlinux-2017.10.01-x86_64.iso; doesn't work

5. ???? user made "board-2.bin"; but how?
6. ???? another kernel version?
7. ?????


Any Idea?

Thanks


### lspci ####

01:00.0 Network controller [0280]: Qualcomm Atheros QCA6174 802.11ac Wireless Network Adapter [168c:003e] (rev 32)
	Subsystem: Samsung Electronics Co Ltd QCA6174 802.11ac Wireless Network Adapter [144d:c150]

### 1. dmesg firmware from Ubuntu ###

[   29.681877] ath10k_pci 0000:01:00.0: enabling device (0000 -> 0002)
[   29.683879] ath10k_pci 0000:01:00.0: pci irq msi oper_irq_mode 2 irq_mode 0 reset_mode 0
[   30.099561] ath10k_pci 0000:01:00.0: Direct firmware load for ath10k/pre-cal-pci-0000:01:00.0.bin failed with error -2
[   30.099591] ath10k_pci 0000:01:00.0: Direct firmware load for ath10k/cal-pci-0000:01:00.0.bin failed with error -2
[   30.099634] ath10k_pci 0000:01:00.0: Direct firmware load for ath10k/QCA6174/hw3.0/firmware-5.bin failed with error -2
[   30.099636] ath10k_pci 0000:01:00.0: could not fetch firmware file 'ath10k/QCA6174/hw3.0/firmware-5.bin': -2
[   30.474511] ath10k_pci 0000:01:00.0: qca6174 hw3.2 target 0x05030000 chip_id 0x00340aff sub 144d:c150
[   30.474513] ath10k_pci 0000:01:00.0: kconfig debug 0 debugfs 1 tracing 1 dfs 0 testmode 0
[   30.475081] ath10k_pci 0000:01:00.0: firmware ver WLAN.RM.2.0-00180-QCARMSWPZ-1 api 4 features wowlan,ignore-otp,no-4addr-pad crc32 75dee6c5
[   30.882452] ath10k_pci 0000:01:00.0: failed to fetch board data for bus=pci,vendor=168c,device=003e,subsystem-vendor=144d,subsystem-device=c150 from ath10k/QCA6174/hw3.0/board-2.bin
[   31.029907] ath10k_pci 0000:01:00.0: board_file api 1 bmi_id N/A crc32 ed5f849a
[   36.338958] ath10k_pci 0000:01:00.0: failed to ping firmware: -110
[   36.338962] ath10k_pci 0000:01:00.0: failed to reset rx filter: -110
[   36.419966] ath10k_pci 0000:01:00.0: could not init core (-110)
[   36.420010] ath10k_pci 0000:01:00.0: could not probe fw (-110)

[  496.169451] ath10k_pci 0000:01:00.0: qca6174 hw3.2 target 0x05030000 chip_id 0x00340aff sub 144d:c150
[  496.169454] ath10k_pci 0000:01:00.0: kconfig debug 0 debugfs 1 tracing 1 dfs 0 testmode 0
[  496.170458] ath10k_pci 0000:01:00.0: firmware ver WLAN.RM.2.0-00180-QCARMSWPZ-1 api 4 features wowlan,ignore-otp,no-4addr-pad crc32 75dee6c5
[  496.232870] ath10k_pci 0000:01:00.0: failed to fetch board data for bus=pci,vendor=168c,device=003e,subsystem-vendor=144d,subsystem-device=c150 from ath10k/QCA6174/hw3.0/board-2.bin
[  496.232893] ath10k_pci 0000:01:00.0: board_file api 1 bmi_id N/A crc32 ed5f849a
[  498.349948] ath10k_pci 0000:01:00.0: htt-ver 3.26 wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1
[  501.490918] ath10k_pci 0000:01:00.0: could not suspend target (-11)
[  501.572808] ath: EEPROM regdomain: 0x0
[  501.572811] ath: EEPROM indicates default country code should be used
[  501.572812] ath: doing EEPROM country->regdmn map search
[  501.572815] ath: country maps to regdmn code: 0x3a
[  501.572816] ath: Country alpha2 being used: US
[  501.572817] ath: Regpair used: 0x3a
[  501.596228] ath10k_pci 0000:01:00.0 wlp1s0: renamed from wlan0

### 2. dmesg with latest git drivers ath10k ###

[ 1001.544396] ath10k_pci 0000:01:00.0: pci irq msi oper_irq_mode 2 irq_mode 0 reset_mode 0
[ 1001.820591] ath10k_pci 0000:01:00.0: Direct firmware load for ath10k/pre-cal-pci-0000:01:00.0.bin failed with error -2
[ 1001.820619] ath10k_pci 0000:01:00.0: Direct firmware load for ath10k/cal-pci-0000:01:00.0.bin failed with error -2
[ 1001.820649] ath10k_pci 0000:01:00.0: Direct firmware load for ath10k/QCA6174/hw3.0/firmware-5.bin failed with error -2
[ 1001.820652] ath10k_pci 0000:01:00.0: could not fetch firmware file 'ath10k/QCA6174/hw3.0/firmware-5.bin': -2
[ 1001.820682] ath10k_pci 0000:01:00.0: Direct firmware load for ath10k/QCA6174/hw3.0/firmware-4.bin failed with error -2
[ 1001.820683] ath10k_pci 0000:01:00.0: could not fetch firmware file 'ath10k/QCA6174/hw3.0/firmware-4.bin': -2
[ 1001.820717] ath10k_pci 0000:01:00.0: Direct firmware load for ath10k/QCA6174/hw3.0/firmware-3.bin failed with error -2
[ 1001.820719] ath10k_pci 0000:01:00.0: could not fetch firmware file 'ath10k/QCA6174/hw3.0/firmware-3.bin': -2
[ 1001.820761] ath10k_pci 0000:01:00.0: Direct firmware load for ath10k/QCA6174/hw3.0/firmware-2.bin failed with error -2
[ 1001.820763] ath10k_pci 0000:01:00.0: could not fetch firmware file 'ath10k/QCA6174/hw3.0/firmware-2.bin': -2
[ 1001.820765] ath10k_pci 0000:01:00.0: could not fetch firmware files (-2)
[ 1001.820767] ath10k_pci 0000:01:00.0: could not probe fw (-2)

### 3. dmesg user made firmware ####


[ 1772.091031] ath10k_pci 0000:01:00.0: pci irq msi oper_irq_mode 2 irq_mode 0 reset_mode 0
[ 1772.369412] ath10k_pci 0000:01:00.0: qca6174 hw3.2 target 0x05030000 chip_id 0x00340aff sub 144d:c150
[ 1772.369417] ath10k_pci 0000:01:00.0: kconfig debug 0 debugfs 1 tracing 1 dfs 0 testmode 0
[ 1772.370701] ath10k_pci 0000:01:00.0: firmware ver qca61x4_2_2_samsung_api_5 api 5 features  crc32 93d04d09
[ 1772.452929] ath10k_pci 0000:01:00.0: failed to fetch board data for bus=pci,bmi-chip-id=0,bmi-board-id=0 from ath10k/QCA6174/hw3.0/board-2.bin
[ 1772.452942] ath10k_pci 0000:01:00.0: board_file api 1 bmi_id 0:0 crc32 ed5f849a
[ 1774.637315] ath10k_pci 0000:01:00.0: failed to parse service ready: -71
[ 1775.636379] ath10k_pci 0000:01:00.0: Unknown eventid: 118801
[ 1779.699043] ath10k_pci 0000:01:00.0: wmi service ready event not received
[ 1779.781704] ath10k_pci 0000:01:00.0: could not init core (-110)
[ 1779.781850] ath10k_pci 0000:01:00.0: could not probe fw (-110)


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
