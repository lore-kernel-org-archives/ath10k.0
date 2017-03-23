Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cr5tc-0005iN-Qs
 for ath10k@lists.infradead.org; Thu, 23 Mar 2017 16:47:35 +0000
Received: by mail-wm0-x242.google.com with SMTP id x124so252102wmf.3
 for <ath10k@lists.infradead.org>; Thu, 23 Mar 2017 09:47:12 -0700 (PDT)
From: Christian Lamparter <chunkeey@googlemail.com>
Subject: QCA9984 bmi identification failure
Date: Thu, 23 Mar 2017 17:47:08 +0100
Message-ID: <3243718.FYinmXYgr7@debian64>
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
Cc: Adrian Chadd <adrian@freebsd.org>, "linux-wireless (linux-wireless@vger.kernel.org)" <linux-wireless@vger.kernel.org>, Sebastian Gottschall <s.gottschall@dd-wrt.com>, ath10k-devel <ath10k-devel@qca.qualcomm.com>, "Valo,
 Kalle" <kvalo@qca.qualcomm.com>, hannu.nyman@iki.fi, Michal Kazior <michal.kazior@tieto.com>

Hannu Nyman reported a issue with the QCA9984 in his Netgear R7800 
and LEDE's ath10k: (This is with 936-ath10k_skip_otp_check.patch removed):

[   12.999550] ath10k_pci 0000:01:00.0: enabling device (0140 -> 0142)
[   12.999637] ath10k_pci 0000:01:00.0: enabling bus mastering
[   13.000105] ath10k_pci 0000:01:00.0: pci irq msi oper_irq_mode 2 irq_mode 0 reset_mode 0
[   13.130838] ath10k_pci 0000:01:00.0: Direct firmware load for ath10k/pre-cal-pci-0000:01:00.0.bin failed with error -2
[   13.130888] ath10k_pci 0000:01:00.0: Falling back to user helper
[   13.183995] firmware ath10k!pre-cal-pci-0000:01:00.0.bin: firmware_loading_store: map pages failed
[   13.184338] ath10k_pci 0000:01:00.0: Direct firmware load for ath10k/cal-pci-0000:01:00.0.bin failed with error -2
[   13.191960] ath10k_pci 0000:01:00.0: Falling back to user helper
[   13.673417] ath10k_pci 0000:01:00.0: qca9984/qca9994 hw1.0 target 0x01000000 chip_id 0x00000000 sub 168c:cafe
[   13.673451] ath10k_pci 0000:01:00.0: kconfig debug 0 debugfs 1 tracing 0 dfs 1 testmode 1
[   13.684393] ath10k_pci 0000:01:00.0: firmware ver 10.4-3.4-00074 api 5 features no-p2p,mfp,peer-flow-ctrl,btcoex-param,allows-mesh-bcast crc32 fa32e88e
[   15.728598] ath10k_pci 0000:01:00.0: unable to read from the device
[   15.728621] ath10k_pci 0000:01:00.0: could not execute otp for board id check: -110
[   15.733663] ath10k_pci 0000:01:00.0: failed to get board id from otp: -110
[   15.741474] ath10k_pci 0000:01:00.0: could not probe fw (-110)

I requested to test what happens, if the driver ignored -ETIMEDOUT error from
ath10k_core_get_board_id_from_otp() and the device initialized successfully:

[   16.163318] ath10k_pci 0000:01:00.0: enabling device (0140 -> 0142)
[   16.163401] ath10k_pci 0000:01:00.0: enabling bus mastering
[   16.163850] ath10k_pci 0000:01:00.0: pci irq msi oper_irq_mode 2 irq_mode 0 reset_mode 0
[   16.337294] ath10k_pci 0000:01:00.0: Direct firmware load for ath10k/pre-cal-pci-0000:01:00.0.bin failed with error -2
[   16.337351] ath10k_pci 0000:01:00.0: Falling back to user helper
[   22.837360] firmware ath10k!pre-cal-pci-0000:01:00.0.bin: firmware_loading_store: map pages failed
[   23.212157] ath10k_pci 0000:01:00.0: qca9984/qca9994 hw1.0 target 0x01000000 chip_id 0x00000000 sub 168c:cafe
[   23.212211] ath10k_pci 0000:01:00.0: kconfig debug 0 debugfs 1 tracing 0 dfs 1 testmode 1
[   23.226748] ath10k_pci 0000:01:00.0: firmware ver 10.4-3.4-00074 api 5 features no-p2p,mfp,peer-flow-ctrl,btcoex-param,allows-mesh-bcast crc32 fa32e88e
[   25.259266] ath10k_pci 0000:01:00.0: unable to read from the device
[   25.259288] ath10k_pci 0000:01:00.0: could not execute otp for board id check: -110
[   25.277326] ath10k_pci 0000:01:00.0: failed to fetch board data for bus=pci,vendor=168c,device=0046,subsystem-vendor=168c,subsystem-device=cafem...from ath10k/QCA9984/hw1.0/board-2.bin
[   25.277588] ath10k_pci 0000:01:00.0: board_file api 1 bmi_id N/A crc32 dd636801
[   26.800717] ath10k_pci 0000:01:00.0: htt-ver 2.2 wmi-op 6 htt-op 4 cal file max-sta 512 raw 0 hwcrypto 1

<https://forum.lede-project.org/t/netgear-r7800-exploration-ipq8065-qca9984/285/277>

What seems strange is that only the call bmi_execute with 
BMI_PARAM_GET_EEPROM_BOARD_ID is timing out. So by just 
ignoring the -ETIMEDOUT result from:

        ret = ath10k_bmi_execute(ar, address, BMI_PARAM_GET_EEPROM_BOARD_ID,
                                 &result);

in ath10k_core_get_board_id_from_otp() the device will initialize and work.
This begs the question, what is so special about the BMI_PARAM_GET_EEPROM_BOARD_ID
at that time for the QCA9984? Does the device need some extra msleep time after
the OTP has been uploaded? Or is the BMI_PARAM_GET_EEPROM_BOARD_ID not 
implemented/has a different ID, etc... ?

Thanks,
Christian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
