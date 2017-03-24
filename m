Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nm.newmedia-net.de ([217.113.179.122]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1crMAD-0003Fl-FC
 for ath10k@lists.infradead.org; Fri, 24 Mar 2017 10:09:48 +0000
References: <3243718.FYinmXYgr7@debian64>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <4960795b-028f-27b1-8bdf-6c9fb2242f5f@dd-wrt.com>
Date: Fri, 24 Mar 2017 11:09:03 +0100
MIME-Version: 1.0
In-Reply-To: <3243718.FYinmXYgr7@debian64>
Subject: Re: QCA9984 bmi identification failure
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Christian Lamparter <chunkeey@googlemail.com>, ath10k@lists.infradead.org
Cc: Adrian Chadd <adrian@freebsd.org>, "linux-wireless (linux-wireless@vger.kernel.org)" <linux-wireless@vger.kernel.org>, ath10k-devel <ath10k-devel@qca.qualcomm.com>, "Valo, Kalle" <kvalo@qca.qualcomm.com>, hannu.nyman@iki.fi, Michal Kazior <michal.kazior@tieto.com>

i have a r7800 running. consider to use the board.bin file which is =

stored in flash memory of the r7800.
there are 2 stored for both cards. you need to patch ath10k to use =

different board.bin files for each card.
this is a log from a working r7800 running dd-wrt. the failed to fetch =

board data error is normal. it will use api1 board files then which i =

provide on fs based on the board data stored in flash memory

[    6.661388] ath10k_pci 0000:01:00.0: enabling device (0140 -> 0142)
[    6.662017] ath10k_pci 0000:01:00.0: pci irq msi oper_irq_mode 2 =

irq_mode 0 reset_mode 0
[    6.806366] ath10k_pci 0000:01:00.0: Direct firmware load for =

ath10k/pre-cal-pci-0000:01:00.0.bin failed with error -2
[    6.806418] ath10k_pci 0000:01:00.0: Falling back to user helper
[    7.049557] ath10k_pci 0000:01:00.0: qca9984/qca9994 hw1.0 target =

0x01000000 chip_id 0x00000000 sub 168c:cafe
[    7.049592] ath10k_pci 0000:01:00.0: kconfig debug 1 debugfs 1 =

tracing 0 dfs 0 testmode 0
[    7.060569] ath10k_pci 0000:01:00.0: firmware ver 10.4-3.4-00074 api =

5 features no-p2p,mfp,peer-flow-ctrl,btcoex-param,allows-mesh-bcast =

crc32 fa32e88e
[    7.071165] ath10k_pci 0000:01:00.0: failed to fetch board data for =

bus=3Dpci,vendor=3D168c,device=3D0046,subsystem-vendor=3D168c,subsystem-dev=
ice=3Dcafe =

from ath10k/QCA9984/hw1.0/board-2.bin
[    7.080216] ath10k_pci 0000:01:00.0: board_file api 1 bmi_id N/A =

crc32 dc2f9863
[    8.061877] ipq806x-gmac-dwmac 37200000.ethernet eth0: Link is Up - =

1Gbps/Full - flow control off
[    8.151876] ipq806x-gmac-dwmac 37400000.ethernet eth1: Link is Up - =

1Gbps/Full - flow control off
[    8.429005] ath10k_pci 0000:01:00.0: htt-ver 2.2 wmi-op 6 htt-op 4 =

cal file max-sta 512 raw 0 hwcrypto 1
[    8.500297] ath: EEPROM regdomain: 0x0
[    8.500319] ath: EEPROM indicates default country code should be used
[    8.500336] ath: doing EEPROM country->regdmn map search
[    8.500360] ath: country maps to regdmn code: 0x3a
[    8.500380] ath: Country alpha2 being used: US
[    8.500395] ath: Regpair used: 0x3a
[    8.515285] ath10k_pci 0001:01:00.0: enabling device (0140 -> 0142)
[    8.515971] ath10k_pci 0001:01:00.0: pci irq msi oper_irq_mode 2 =

irq_mode 0 reset_mode 0
[    8.643800] ath10k_pci 0001:01:00.0: Direct firmware load for =

ath10k/pre-cal-pci-0001:01:00.0.bin failed with error -2
[    8.643837] ath10k_pci 0001:01:00.0: Falling back to user helper
[    8.655447] ath10k_pci 0001:01:00.0: qca9984/qca9994 hw1.0 target =

0x01000000 chip_id 0x00000000 sub 168c:cafe
[    8.659561] ath10k_pci 0001:01:00.0: kconfig debug 1 debugfs 1 =

tracing 0 dfs 0 testmode 0
[    8.673498] ath10k_pci 0001:01:00.0: firmware ver 10.4-3.4-00074 api =

5 features no-p2p,mfp,peer-flow-ctrl,btcoex-param,allows-mesh-bcast =

crc32 fa32e88e
[    8.677862] ath10k_pci 0001:01:00.0: failed to fetch board data for =

bus=3Dpci,vendor=3D168c,device=3D0046,subsystem-vendor=3D168c,subsystem-dev=
ice=3Dcafe =

from ath10k/QCA9984/hw1.0/board-2.bin
[    8.691311] ath10k_pci 0001:01:00.0: board_file api 1 bmi_id N/A =

crc32 3483f7cb
[   10.039146] ath10k_pci 0001:01:00.0: htt-ver 2.2 wmi-op 6 htt-op 4 =

cal file max-sta 512 raw 0 hwcrypto 1


Am 23.03.2017 um 17:47 schrieb Christian Lamparter:
> Hannu Nyman reported a issue with the QCA9984 in his Netgear R7800
> and LEDE's ath10k: (This is with 936-ath10k_skip_otp_check.patch removed):
>
> [   12.999550] ath10k_pci 0000:01:00.0: enabling device (0140 -> 0142)
> [   12.999637] ath10k_pci 0000:01:00.0: enabling bus mastering
> [   13.000105] ath10k_pci 0000:01:00.0: pci irq msi oper_irq_mode 2 irq_m=
ode 0 reset_mode 0
> [   13.130838] ath10k_pci 0000:01:00.0: Direct firmware load for ath10k/p=
re-cal-pci-0000:01:00.0.bin failed with error -2
> [   13.130888] ath10k_pci 0000:01:00.0: Falling back to user helper
> [   13.183995] firmware ath10k!pre-cal-pci-0000:01:00.0.bin: firmware_loa=
ding_store: map pages failed
> [   13.184338] ath10k_pci 0000:01:00.0: Direct firmware load for ath10k/c=
al-pci-0000:01:00.0.bin failed with error -2
> [   13.191960] ath10k_pci 0000:01:00.0: Falling back to user helper
> [   13.673417] ath10k_pci 0000:01:00.0: qca9984/qca9994 hw1.0 target 0x01=
000000 chip_id 0x00000000 sub 168c:cafe
> [   13.673451] ath10k_pci 0000:01:00.0: kconfig debug 0 debugfs 1 tracing=
 0 dfs 1 testmode 1
> [   13.684393] ath10k_pci 0000:01:00.0: firmware ver 10.4-3.4-00074 api 5=
 features no-p2p,mfp,peer-flow-ctrl,btcoex-param,allows-mesh-bcast crc32 fa=
32e88e
> [   15.728598] ath10k_pci 0000:01:00.0: unable to read from the device
> [   15.728621] ath10k_pci 0000:01:00.0: could not execute otp for board i=
d check: -110
> [   15.733663] ath10k_pci 0000:01:00.0: failed to get board id from otp: =
-110
> [   15.741474] ath10k_pci 0000:01:00.0: could not probe fw (-110)
>
> I requested to test what happens, if the driver ignored -ETIMEDOUT error =
from
> ath10k_core_get_board_id_from_otp() and the device initialized successful=
ly:
>
> [   16.163318] ath10k_pci 0000:01:00.0: enabling device (0140 -> 0142)
> [   16.163401] ath10k_pci 0000:01:00.0: enabling bus mastering
> [   16.163850] ath10k_pci 0000:01:00.0: pci irq msi oper_irq_mode 2 irq_m=
ode 0 reset_mode 0
> [   16.337294] ath10k_pci 0000:01:00.0: Direct firmware load for ath10k/p=
re-cal-pci-0000:01:00.0.bin failed with error -2
> [   16.337351] ath10k_pci 0000:01:00.0: Falling back to user helper
> [   22.837360] firmware ath10k!pre-cal-pci-0000:01:00.0.bin: firmware_loa=
ding_store: map pages failed
> [   23.212157] ath10k_pci 0000:01:00.0: qca9984/qca9994 hw1.0 target 0x01=
000000 chip_id 0x00000000 sub 168c:cafe
> [   23.212211] ath10k_pci 0000:01:00.0: kconfig debug 0 debugfs 1 tracing=
 0 dfs 1 testmode 1
> [   23.226748] ath10k_pci 0000:01:00.0: firmware ver 10.4-3.4-00074 api 5=
 features no-p2p,mfp,peer-flow-ctrl,btcoex-param,allows-mesh-bcast crc32 fa=
32e88e
> [   25.259266] ath10k_pci 0000:01:00.0: unable to read from the device
> [   25.259288] ath10k_pci 0000:01:00.0: could not execute otp for board i=
d check: -110
> [   25.277326] ath10k_pci 0000:01:00.0: failed to fetch board data for bu=
s=3Dpci,vendor=3D168c,device=3D0046,subsystem-vendor=3D168c,subsystem-devic=
e=3Dcafem...from ath10k/QCA9984/hw1.0/board-2.bin
> [   25.277588] ath10k_pci 0000:01:00.0: board_file api 1 bmi_id N/A crc32=
 dd636801
> [   26.800717] ath10k_pci 0000:01:00.0: htt-ver 2.2 wmi-op 6 htt-op 4 cal=
 file max-sta 512 raw 0 hwcrypto 1
>
> <https://forum.lede-project.org/t/netgear-r7800-exploration-ipq8065-qca99=
84/285/277>
>
> What seems strange is that only the call bmi_execute with
> BMI_PARAM_GET_EEPROM_BOARD_ID is timing out. So by just
> ignoring the -ETIMEDOUT result from:
>
>          ret =3D ath10k_bmi_execute(ar, address, BMI_PARAM_GET_EEPROM_BOA=
RD_ID,
>                                   &result);
>
> in ath10k_core_get_board_id_from_otp() the device will initialize and wor=
k.
> This begs the question, what is so special about the BMI_PARAM_GET_EEPROM=
_BOARD_ID
> at that time for the QCA9984? Does the device need some extra msleep time=
 after
> the OTP has been uploaded? Or is the BMI_PARAM_GET_EEPROM_BOARD_ID not
> implemented/has a different ID, etc... ?
>
> Thanks,
> Christian
>


-- =

Mit freundlichen Gr=FCssen / Regards

Sebastian Gottschall / CTO

NewMedia-NET GmbH - DD-WRT
Firmensitz:  Berliner Ring 101, 64625 Bensheim
Registergericht: Amtsgericht Darmstadt, HRB 25473
Gesch=E4ftsf=FChrer: Peter Steinh=E4user, Christian Scheele
http://www.dd-wrt.com
email: s.gottschall@dd-wrt.com
Tel.: +496251-582650 / Fax: +496251-5826565


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
