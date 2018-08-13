Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtpbgau2.qq.com ([54.206.34.216])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fp6D6-00071L-CU
 for ath10k@lists.infradead.org; Mon, 13 Aug 2018 06:20:14 +0000
From: "=?utf-8?B?THVvIENob25nanVu?=" <luochongjun@gl-inet.com>
Subject: QCA9887 enable  adaptive-cca
Mime-Version: 1.0
Date: Mon, 13 Aug 2018 14:19:37 +0800
Message-ID: <tencent_2B132A5718204B7D23A56911@qq.com>
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
To: =?utf-8?B?YXRoMTBr?= <ath10k@lists.infradead.org>

I found that QCA9887 does not have firmware supporting adaptive-cca functionality.
The log information of the firmware is as follows:
___
[   33.181470] ath10k_pci 0000:00:00.0: qca9887 hw1.0 target 0x4100016d chip_id 0x004000ff sub 0000:0000
[   33.191040] ath10k_pci 0000:00:00.0: kconfig debug 0 debugfs 1 tracing 0 dfs 1 testmode 1
[   33.203814] ath10k_pci 0000:00:00.0: firmware ver 10.2.4-1.0-00033 api 5 features no-p2p,ignore-otp,skip-clock-init,mfp,allows-mesh-bcast crc32 c232a0c3
[   33.282624] ath10k_pci 0000:00:00.0: Direct firmware load for ath10k/QCA9887/hw1.0/board-2.bin failed with error -2
[   33.293441] ath10k_pci 0000:00:00.0: Falling back to user helper
[   33.467321] firmware ath10k!QCA9887!hw1.0!board-2.bin: firmware_loading_store: map pages failed
[   33.487054] ath10k_pci 0000:00:00.0: board_file api 1 bmi_id N/A crc32 546cca0d
[   34.582873] ath10k_pci 0000:00:00.0: htt-ver 2.1 wmi-op 5 htt-op 2 cal file max-sta 128 raw 0 hwcrypto 1
[   34.718163] ath: EEPROM regdomain: 0x0
[   34.718169] ath: EEPROM indicates default country code should be used
[   34.718172] ath: doing EEPROM country->regdmn map search
[   34.718183] ath: country maps to regdmn code: 0x3a
[   34.718187] ath: Country alpha2 being used: US
[   34.718190] ath: Regpair used: 0x3a
__
Is there any firmware supporting adaptive-cca function?


Thanks,
Luo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
