Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e9mqK-000410-4s
 for ath10k@lists.infradead.org; Wed, 01 Nov 2017 06:49:42 +0000
From: Ryan Hsu <ryanhsu@qti.qualcomm.com>
Subject: RE: firmware crash; Atheros QCA6174 doesn't work
Date: Wed, 1 Nov 2017 06:49:15 +0000
Message-ID: <0eeb4088a7fb48faa3334b4a40f1d020@NALASEXR01G.na.qualcomm.com>
References: <50327789.T1NR8j5T4B@laptopv>
In-Reply-To: <50327789.T1NR8j5T4B@laptopv>
Content-Language: en-US
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
To: "phaef5Ie@nurfuerspam.de" <phaef5Ie@nurfuerspam.de>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

> -----Original Message-----
> From: ath10k [mailto:ath10k-bounces@lists.infradead.org] On Behalf Of
> phaef5Ie@nurfuerspam.de
> Sent: Tuesday, October 31, 2017 10:09 AM
> To: ath10k@lists.infradead.org
> Subject: firmware crash; Atheros QCA6174 doesn't work
> 
> Hello,
> 
> I am trying to get wlan working but it doesn't work. So far I have tried:
> 
> 1. tried to boot up Ubuntu based LiveCD neon-kde; wlp1s0 recognized but
> device doesn't work
>    => dmesg message: failed to fetch board data board-2.bin
> 
> 2. using latest firmware driver [git.kernel.org]; rmmod ath10k_pci
> ath10k_core ath; modprobe ath10k_pci
>    => wlp1s0 gone; dmesg: firmware not found
> 
> 3. I found an instruction for user made firmware:
>    a. I took the windows driver "qca61x4_2_2.bin"
>    b. downloaded dissect.py at
> https://gist.github.com/kazikcz/8e5845ad84ca251aa295
>    c. downloaded assemble.py
> https://gist.github.com/kazikcz/c970cbf3a863ebbc4495
>    d. python dissect.py <qca61x4_2_2.bin => extracted fw[1-4].bin
>    e. python assemble.py qca61x4_2_2_samsung_api_5 0 fw-2.bin fw-1.bin 0
> >firmware-5.bin
>    f. cp firmware-5.bin into /lib/firmware/ath10k/QCA6174/hw3.0/
>    g. using windows eeprom-file => cp eeprom_ar6320_3p0_SS_620.bin
> /lib/....../hw3.0/board.bin
>    h. rmmod ath10k_pci ath10k_core ath; modprobe ath10k_pci
> 
>    => result: dmesg: firmware-5.bin loaded but "board-2.bin failed"
> 
> 4. using a rolling release / installation iso archlinux-2017.10.01-x86_64.iso;
> doesn't work
> 
> 5. ???? user made "board-2.bin"; but how?
> 6. ???? another kernel version?
> 7. ?????
> 

Thanks you've done all the way, with a few of the suggestion I would recommend as well.
The eeprom_ar6320_3p0_SS_620.bin is the right board file, and we've added to the board-2.bin.
https://github.com/kvalo/ath10k-firmware/commit/2db82b6981a52abc817abf5c070f9244717201a1

You might want to get this one and give it a try again.

> 
> ### lspci ####
> 
> 01:00.0 Network controller [0280]: Qualcomm Atheros QCA6174 802.11ac
> Wireless Network Adapter [168c:003e] (rev 32)
> 	Subsystem: Samsung Electronics Co Ltd QCA6174 802.11ac Wireless
> Network Adapter [144d:c150]

As mentioned, and you've tested, the eeprom_ar6320_3p0_SS_620.bin is the right file to use.
Latest board-2.bin should also have it as well.

> 
> ### 1. dmesg firmware from Ubuntu ###
> 
> [   29.681877] ath10k_pci 0000:01:00.0: enabling device (0000 -> 0002)
> [   29.683879] ath10k_pci 0000:01:00.0: pci irq msi oper_irq_mode 2 irq_mode
> 0 reset_mode 0
> [   30.099561] ath10k_pci 0000:01:00.0: Direct firmware load for ath10k/pre-
> cal-pci-0000:01:00.0.bin failed with error -2
> [   30.099591] ath10k_pci 0000:01:00.0: Direct firmware load for ath10k/cal-
> pci-0000:01:00.0.bin failed with error -2
> [   30.099634] ath10k_pci 0000:01:00.0: Direct firmware load for
> ath10k/QCA6174/hw3.0/firmware-5.bin failed with error -2
> [   30.099636] ath10k_pci 0000:01:00.0: could not fetch firmware file
> 'ath10k/QCA6174/hw3.0/firmware-5.bin': -2
> [   30.474511] ath10k_pci 0000:01:00.0: qca6174 hw3.2 target 0x05030000
> chip_id 0x00340aff sub 144d:c150
> [   30.474513] ath10k_pci 0000:01:00.0: kconfig debug 0 debugfs 1 tracing 1 dfs
> 0 testmode 0
> [   30.475081] ath10k_pci 0000:01:00.0: firmware ver WLAN.RM.2.0-00180-
> QCARMSWPZ-1 api 4 features wowlan,ignore-otp,no-4addr-pad crc32
> 75dee6c5
> [   30.882452] ath10k_pci 0000:01:00.0: failed to fetch board data for
> bus=pci,vendor=168c,device=003e,subsystem-vendor=144d,subsystem-
> device=c150 from ath10k/QCA6174/hw3.0/board-2.bin

Ok, so this means the board-2.bin file you're using is not having the 144d:c150.

> [   31.029907] ath10k_pci 0000:01:00.0: board_file api 1 bmi_id N/A crc32
> ed5f849a

And the debug board.bin file is not the right one for your module, so that it failed and unfortunately firmware failed to boot.

> [   36.338958] ath10k_pci 0000:01:00.0: failed to ping firmware: -110
> [   36.338962] ath10k_pci 0000:01:00.0: failed to reset rx filter: -110
> [   36.419966] ath10k_pci 0000:01:00.0: could not init core (-110)
> [   36.420010] ath10k_pci 0000:01:00.0: could not probe fw (-110)
> 


> ### 2. dmesg with latest git drivers ath10k ###
> 
> [ 1001.544396] ath10k_pci 0000:01:00.0: pci irq msi oper_irq_mode 2
> irq_mode 0 reset_mode 0 [ 1001.820591] ath10k_pci 0000:01:00.0: Direct
> firmware load for ath10k/pre-cal-pci-0000:01:00.0.bin failed with error -2
> [ 1001.820619] ath10k_pci 0000:01:00.0: Direct firmware load for ath10k/cal-
> pci-0000:01:00.0.bin failed with error -2 [ 1001.820649] ath10k_pci
> 0000:01:00.0: Direct firmware load for ath10k/QCA6174/hw3.0/firmware-
> 5.bin failed with error -2 [ 1001.820652] ath10k_pci 0000:01:00.0: could not
> fetch firmware file 'ath10k/QCA6174/hw3.0/firmware-5.bin': -2 [ 1001.820682]
> ath10k_pci 0000:01:00.0: Direct firmware load for
> ath10k/QCA6174/hw3.0/firmware-4.bin failed with error -2 [ 1001.820683]
> ath10k_pci 0000:01:00.0: could not fetch firmware file

Likely the firmware file not found, so that the QCA6174 can't find it and fail to boot.
 
> ### 3. dmesg user made firmware ####
> 
> 
> [ 1772.091031] ath10k_pci 0000:01:00.0: pci irq msi oper_irq_mode 2
> irq_mode 0 reset_mode 0 [ 1772.369412] ath10k_pci 0000:01:00.0: qca6174
> hw3.2 target 0x05030000 chip_id 0x00340aff sub 144d:c150 [ 1772.369417]
> ath10k_pci 0000:01:00.0: kconfig debug 0 debugfs 1 tracing 1 dfs 0 testmode 0
> [ 1772.370701] ath10k_pci 0000:01:00.0: firmware ver
> qca61x4_2_2_samsung_api_5 api 5 features  crc32 93d04d09 [ 1772.452929]
> ath10k_pci 0000:01:00.0: failed to fetch board data for bus=pci,bmi-chip-
> id=0,bmi-board-id=0 from ath10k/QCA6174/hw3.0/board-2.bin [ 1772.452942]

Are you using the same driver you rebuild on #2? This all 0 seems to be like the same issue that has been fixed.
Can you help to check the ath10k git you're using have this fix as well?
https://patchwork.kernel.org/patch/9486941/


> ath10k_pci 0000:01:00.0: board_file api 1 bmi_id 0:0 crc32 ed5f849a

And again the default board.bin is failing again.

With the #1 or #2 scenario, can you give it a try with the latest firmware (4.4.1) and the board-2.bin file from here
https://github.com/kvalo/ath10k-firmware/tree/master/QCA6174/hw3.0


Ryan

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
