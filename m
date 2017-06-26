Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dPINw-0001Bz-G0
 for ath10k@lists.infradead.org; Mon, 26 Jun 2017 01:00:14 +0000
Received: from mail-vk0-f42.google.com (mail-vk0-f42.google.com
 [209.85.213.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B7D6722B6C
 for <ath10k@lists.infradead.org>; Mon, 26 Jun 2017 00:59:50 +0000 (UTC)
Received: by mail-vk0-f42.google.com with SMTP id 191so33221421vko.2
 for <ath10k@lists.infradead.org>; Sun, 25 Jun 2017 17:59:50 -0700 (PDT)
MIME-Version: 1.0
From: Andy Lutomirski <luto@kernel.org>
Date: Sun, 25 Jun 2017 17:59:28 -0700
Message-ID: <CALCETrUB2_=aTfvLGEb0qq0uGOr1CiR-Kmq975of2gDAiVooOA@mail.gmail.com>
Subject: ath10k isn't working on my Killer 1535 isn't working
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

I have a Killer Wireless 1535 (only slightly dubiously sourced)
plugged in to an NGFF-to-desktop-PCIe adapter (nameless Chinese brand
resold on Amazon) plugged into an entirely legit Intel workstation
board.

With 4.12-rc5, I get:

[   20.104932] ath10k_pci 0000:02:00.0: enabling device (0000 -> 0002)
[   20.105911] ath10k_pci 0000:02:00.0: pci irq msi oper_irq_mode 2
irq_mode 0 reset_mode 0
[   20.327323] ath10k_pci 0000:02:00.0: qca6174 hw3.2 target
0x05030000 chip_id 0x00340aff sub 1a56:1535
[   20.327324] ath10k_pci 0000:02:00.0: kconfig debug 1 debugfs 1
tracing 1 dfs 0 testmode 1
[   20.327697] ath10k_pci 0000:02:00.0: firmware ver
WLAN.RM.4.4-00022-QCARMSWPZ-2 api 6 features wowlan,ignore-otp crc32
4d458559
[   20.394828] ath10k_pci 0000:02:00.0: board_file api 2 bmi_id N/A
crc32 07ee144e
[   20.973781] ath10k_pci 0000:02:00.0: Unknown eventid: 90118
[   20.974556] ath10k_pci 0000:02:00.0: htt-ver 3.32 wmi-op 4 htt-op 3
cal otp max-sta 32 raw 0 hwcrypto 1
[   21.036355] ath: EEPROM regdomain: 0x69
[   21.036356] ath: EEPROM indicates we should expect a direct regpair map
[   21.036357] ath: Country alpha2 being used: 00
[   21.036357] ath: Regpair used: 0x69
[   21.045463] ath10k_pci 0000:02:00.0 wlp2s0: renamed from wlan0
[   31.838938] ath10k_pci 0000:02:00.0: failed to wake target for
read32 at 0x0003a028: -110
[   32.736163] ath10k_pci 0000:02:00.0: failed to receive control
response completion, polling..
[   32.769738] ath10k_pci 0000:02:00.0: failed to wake target for
write32 of 0x00000001 at 0x00034430: -110
[   32.803518] ath10k_pci 0000:02:00.0: failed to wake target for
read32 at 0x00034444: -110
[   32.836961] ath10k_pci 0000:02:00.0: failed to wake target for
write32 of 0x0000001e at 0x00034430: -110
[   32.870447] ath10k_pci 0000:02:00.0: failed to wake target for
write32 of 0x00000001 at 0x00034830: -110
[   32.904047] ath10k_pci 0000:02:00.0: failed to wake target for
write32 of 0x00000001 at 0x00035430: -110
[   32.937485] ath10k_pci 0000:02:00.0: failed to wake target for
read32 at 0x00035444: -110
[   32.970914] ath10k_pci 0000:02:00.0: failed to wake target for
write32 of 0x0000001e at 0x00035430: -110
[   33.004331] ath10k_pci 0000:02:00.0: failed to wake target for
write32 of 0x0000000e at 0x00034840: -110
[   34.592162] ath10k_pci 0000:02:00.0: Service connect timeout
[   34.592165] ath10k_pci 0000:02:00.0: failed to connect htt (-110)
[   36.865085] ath10k_warn: 82 callbacks suppressed
[   36.865088] ath10k_pci 0000:02:00.0: failed to wake target for
read32 at 0x00034410: -110
[   36.898734] ath10k_pci 0000:02:00.0: failed to wake target for
write32 of 0xffff0100 at 0x00034410: -110
[   36.932328] ath10k_pci 0000:02:00.0: failed to wake target for
read32 at 0x00034410: -110
[   36.965992] ath10k_pci 0000:02:00.0: failed to wake target for
write32 of 0xfffeffff at 0x00034410: -110
[   36.999573] ath10k_pci 0000:02:00.0: failed to wake target for
read32 at 0x0003444c: -110
[   37.032967] ath10k_pci 0000:02:00.0: failed to wake target for
write32 of 0x0000ffff at 0x0003444c: -110
[   37.066458] ath10k_pci 0000:02:00.0: failed to wake target for
read32 at 0x0003444c: -110
[   37.099847] ath10k_pci 0000:02:00.0: failed to wake target for
write32 of 0xffff0010 at 0x0003444c: -110
[   37.133236] ath10k_pci 0000:02:00.0: failed to wake target for
read32 at 0x00034848: -110
[   37.166614] ath10k_pci 0000:02:00.0: failed to wake target for
read32 at 0x00034840: -110
[   41.898469] ath10k_warn: 141 callbacks suppressed
[   41.898471] ath10k_pci 0000:02:00.0: failed to wake target for
read32 at 0x0003a028: -110
[   41.931752] ath10k_pci 0000:02:00.0: failed to wake target for
read32 at 0x0003a028: -110
[   41.965137] ath10k_pci 0000:02:00.0: failed to wake target for
read32 at 0x0003a028: -110
[   41.998492] ath10k_pci 0000:02:00.0: failed to wake target for
read32 at 0x0003a028: -110
[   42.031904] ath10k_pci 0000:02:00.0: failed to wake target for
read32 at 0x0003a028: -110
[   42.065291] ath10k_pci 0000:02:00.0: failed to wake target for
read32 at 0x0003a028: -110
[   42.098680] ath10k_pci 0000:02:00.0: failed to wake target for
read32 at 0x0003a028: -110
[   42.132009] ath10k_pci 0000:02:00.0: failed to wake target for
read32 at 0x0003a028: -110
[   42.165346] ath10k_pci 0000:02:00.0: failed to wake target for
read32 at 0x0003a028: -110
[   42.198677] ath10k_pci 0000:02:00.0: failed to wake target for
read32 at 0x0003a028: -110
[   42.465839] ath10k_pci 0000:02:00.0: failed to read device
register, device is gone
[   46.908017] ath10k_warn: 140 callbacks suppressed
[   46.908019] ath10k_pci 0000:02:00.0: failed to wake target for
read32 at 0x0003a028: -110
[   46.941401] ath10k_pci 0000:02:00.0: failed to wake target for
read32 at 0x0003a028: -110
[   46.974786] ath10k_pci 0000:02:00.0: failed to wake target for
read32 at 0x0003a028: -110
[   47.008182] ath10k_pci 0000:02:00.0: failed to wake target for
read32 at 0x0003a028: -110
[   47.041562] ath10k_pci 0000:02:00.0: failed to wake target for
read32 at 0x0003a028: -110
[   47.074957] ath10k_pci 0000:02:00.0: failed to wake target for
read32 at 0x0003a028: -110
[   47.108346] ath10k_pci 0000:02:00.0: failed to wake target for
read32 at 0x0003a028: -110
[   47.141729] ath10k_pci 0000:02:00.0: failed to wake target for
read32 at 0x0003a028: -110
[   47.175113] ath10k_pci 0000:02:00.0: failed to wake target for
read32 at 0x0003a028: -110
[   47.208507] ath10k_pci 0000:02:00.0: failed to wake target for
read32 at 0x0003a028: -110
[   48.508326] ath10k_pci 0000:02:00.0: failed to read device
register, device is gone
[   50.274668] ath10k_pci 0000:02:00.0: Could not init core: -110
[   51.932467] ath10k_warn: 142 callbacks suppressed
[   51.932470] ath10k_pci 0000:02:00.0: failed to wake target for
read32 at 0x0003a028: -110
[   51.964172] ath10k_pci 0000:02:00.0: failed to wake target for
read32 at 0x0003a028: -110
[   51.995922] ath10k_pci 0000:02:00.0: failed to wake target for
read32 at 0x0003a028: -110
[   52.027517] ath10k_pci 0000:02:00.0: failed to wake target for
read32 at 0x0003a028: -110
[   52.059156] ath10k_pci 0000:02:00.0: failed to wake target for
read32 at 0x0003a028: -110
[   52.090766] ath10k_pci 0000:02:00.0: failed to wake target for
read32 at 0x0003a028: -110
[   52.122471] ath10k_pci 0000:02:00.0: failed to wake target for
read32 at 0x0003a028: -110
[   52.154114] ath10k_pci 0000:02:00.0: failed to wake target for
read32 at 0x0003a028: -110
[   52.185810] ath10k_pci 0000:02:00.0: failed to wake target for
read32 at 0x0003a028: -110
[   52.217488] ath10k_pci 0000:02:00.0: failed to wake target for
read32 at 0x0003a028: -110
[   53.603019] ath10k_pci 0000:02:00.0: failed to read device
register, device is gone
[   53.697343] ath10k_pci 0000:02:00.0: firmware crashed! (uuid
d1421756-f08d-44cd-a107-62ccc736f6d1)
[   53.697345] ath10k_pci 0000:02:00.0: qca6174 hw3.2 target
0x05030000 chip_id 0x00340aff sub 1a56:1535
[   53.697346] ath10k_pci 0000:02:00.0: kconfig debug 1 debugfs 1
tracing 1 dfs 0 testmode 1
[   53.697784] ath10k_pci 0000:02:00.0: firmware ver
WLAN.RM.4.4-00022-QCARMSWPZ-2 api 6 features wowlan,ignore-otp crc32
4d458559
[   53.698011] ath10k_pci 0000:02:00.0: board_file api 2 bmi_id N/A
crc32 07ee144e
[   53.698012] ath10k_pci 0000:02:00.0: htt-ver 3.32 wmi-op 4 htt-op 3
cal otp max-sta 32 raw 0 hwcrypto 1
[   54.182050] ath10k_pci 0000:02:00.0: failed to read firmware dump area: -16
[   54.182051] ath10k_pci 0000:02:00.0: Copy Engine register dump:
[   54.308000] ath10k_pci 0000:02:00.0: [00]: 0x00034400 4294967295
4294967295 4294967295 4294967295
[   54.433988] ath10k_pci 0000:02:00.0: [01]: 0x00034800 4294967295
4294967295 4294967295 4294967295
[   54.559987] ath10k_pci 0000:02:00.0: [02]: 0x00034c00 4294967295
4294967295 4294967295 4294967295
[   54.685818] ath10k_pci 0000:02:00.0: [03]: 0x00035000 4294967295
4294967295 4294967295 4294967295
[   54.811703] ath10k_pci 0000:02:00.0: [04]: 0x00035400 4294967295
4294967295 4294967295 4294967295
[   54.937508] ath10k_pci 0000:02:00.0: [05]: 0x00035800 4294967295
4294967295 4294967295 4294967295
[   55.063466] ath10k_pci 0000:02:00.0: [06]: 0x00035c00 4294967295
4294967295 4294967295 4294967295
[   55.189298] ath10k_pci 0000:02:00.0: [07]: 0x00036000 4294967295
4294967295 4294967295 4294967295
[   55.189334] ath10k_pci 0000:02:00.0: failed to reset chip: -5
[   55.189336] ath10k_pci 0000:02:00.0: Could not init hif: -5

[snipped lots more fail]

If I patch the driver to set pci_ps = false, I get this failure instead:

[   10.329394] ath10k_pci 0000:02:00.0: enabling device (0000 -> 0002)
[   10.329858] ath10k_pci 0000:02:00.0: pci irq msi oper_irq_mode 2
irq_mode 0 reset_mode 0
[   10.551844] ath10k_pci 0000:02:00.0: qca6174 hw3.2 target
0x05030000 chip_id 0x00340aff sub 1a56:1535
[   10.551850] ath10k_pci 0000:02:00.0: kconfig debug 1 debugfs 1
tracing 1 dfs 0 testmode 1
[   10.553492] ath10k_pci 0000:02:00.0: firmware ver
WLAN.RM.4.4-00022-QCARMSWPZ-2 api 6 features wowlan,ignore-otp crc32
4d458559
[   10.620307] ath10k_pci 0000:02:00.0: board_file api 2 bmi_id N/A
crc32 07ee144e
[   11.247766] ath10k_pci 0000:02:00.0: Unknown eventid: 90118
[   11.248425] ath10k_pci 0000:02:00.0: htt-ver 3.32 wmi-op 4 htt-op 3
cal otp max-sta 32 raw 0 hwcrypto 1
[   11.427598] ath10k_pci 0000:02:00.0 wlp2s0: renamed from wlan0
[   13.280143] ath10k_pci 0000:02:00.0: failed to receive control
response completion, polling..
[   14.368314] ath10k_pci 0000:02:00.0: ctl_resp never came in (-110)
[   14.368324] ath10k_pci 0000:02:00.0: failed to connect to HTC: -110
[   17.391941] ath10k_pci 0000:02:00.0: failed to read device
register, device is gone
[   20.403868] ath10k_pci 0000:02:00.0: failed to read device
register, device is gone
[   20.403870] ath10k_pci 0000:02:00.0: failed to wait for target init: -5
[   20.404589] ath10k_pci 0000:02:00.0: Could not init core: -110
[   23.457795] ath10k_pci 0000:02:00.0: failed to read device
register, device is gone
[   23.457797] ath10k_pci 0000:02:00.0: failed to wait for target
after cold reset: -5
[   23.457801] ath10k_pci 0000:02:00.0: firmware crashed during chip reset
[   23.457804] ath10k_pci 0000:02:00.0: firmware crashed! (uuid
6e7a0871-efd3-4177-9ffc-5548b04b0a8c)
[   23.457806] ath10k_pci 0000:02:00.0: qca6174 hw3.2 target
0x05030000 chip_id 0x00340aff sub 1a56:1535
[   23.457807] ath10k_pci 0000:02:00.0: kconfig debug 1 debugfs 1
tracing 1 dfs 0 testmode 1
[   23.458148] ath10k_pci 0000:02:00.0: firmware ver
WLAN.RM.4.4-00022-QCARMSWPZ-2 api 6 features wowlan,ignore-otp crc32
4d458559
[   23.458371] ath10k_pci 0000:02:00.0: board_file api 2 bmi_id N/A
crc32 07ee144e
[   23.458372] ath10k_pci 0000:02:00.0: htt-ver 3.32 wmi-op 4 htt-op 3
cal otp max-sta 32 raw 0 hwcrypto 1
[   23.470412] ath10k_pci 0000:02:00.0: failed to get memcpy hi
address for firmware address 4: -16
[   23.470412] ath10k_pci 0000:02:00.0: failed to read firmware dump area: -16
[   23.470413] ath10k_pci 0000:02:00.0: Copy Engine register dump:
[   23.470424] ath10k_pci 0000:02:00.0: [00]: 0x00034400 4294967295
4294967295 4294967295 4294967295
[   23.470433] ath10k_pci 0000:02:00.0: [01]: 0x00034800 4294967295
4294967295 4294967295 4294967295
[   23.470443] ath10k_pci 0000:02:00.0: [02]: 0x00034c00 4294967295
4294967295 4294967295 4294967295
[   23.470453] ath10k_pci 0000:02:00.0: [03]: 0x00035000 4294967295
4294967295 4294967295 4294967295
[   23.470463] ath10k_pci 0000:02:00.0: [04]: 0x00035400 4294967295
4294967295 4294967295 4294967295
[   23.470472] ath10k_pci 0000:02:00.0: [05]: 0x00035800 4294967295
4294967295 4294967295 4294967295
[   23.470482] ath10k_pci 0000:02:00.0: [06]: 0x00035c00 4294967295
4294967295 4294967295 4294967295
[   23.470492] ath10k_pci 0000:02:00.0: [07]: 0x00036000 4294967295
4294967295 4294967295 4294967295
[   23.470495] ath10k_pci 0000:02:00.0: failed to reset chip: -5
[   23.470496] ath10k_pci 0000:02:00.0: Could not init hif: -5
[   26.514721] ath10k_pci 0000:02:00.0: failed to read device
register, device is gone
[   26.514724] ath10k_pci 0000:02:00.0: failed to wait for target
after cold reset: -5
[   26.514727] ath10k_pci 0000:02:00.0: firmware crashed during chip reset
[   26.514731] ath10k_pci 0000:02:00.0: firmware crashed! (uuid
859351a8-cc25-4636-88a9-4ecb71461ca8)
[   26.514734] ath10k_pci 0000:02:00.0: qca6174 hw3.2 target
0x05030000 chip_id 0x00340aff sub 1a56:1535
[   26.514735] ath10k_pci 0000:02:00.0: kconfig debug 1 debugfs 1
tracing 1 dfs 0 testmode 1
[   26.515077] ath10k_pci 0000:02:00.0: firmware ver
WLAN.RM.4.4-00022-QCARMSWPZ-2 api 6 features wowlan,ignore-otp crc32
4d458559
[   26.515300] ath10k_pci 0000:02:00.0: board_file api 2 bmi_id N/A
crc32 07ee144e
[   26.515301] ath10k_pci 0000:02:00.0: htt-ver 3.32 wmi-op 4 htt-op 3
cal otp max-sta 32 raw 0 hwcrypto 1
[   26.515304] ath10k_pci 0000:02:00.0: failed to get memcpy hi
address for firmware address 4: -28
[   26.515304] ath10k_pci 0000:02:00.0: failed to read firmware dump area: -28
[   26.515305] ath10k_pci 0000:02:00.0: Copy Engine register dump:
[   26.515316] ath10k_pci 0000:02:00.0: [00]: 0x00034400 4294967295
4294967295 4294967295 4294967295
[   26.515325] ath10k_pci 0000:02:00.0: [01]: 0x00034800 4294967295
4294967295 4294967295 4294967295
[   26.515335] ath10k_pci 0000:02:00.0: [02]: 0x00034c00 4294967295
4294967295 4294967295 4294967295
[   26.515345] ath10k_pci 0000:02:00.0: [03]: 0x00035000 4294967295
4294967295 4294967295 4294967295
[   26.515355] ath10k_pci 0000:02:00.0: [04]: 0x00035400 4294967295
4294967295 4294967295 4294967295
[   26.515364] ath10k_pci 0000:02:00.0: [05]: 0x00035800 4294967295
4294967295 4294967295 4294967295
[   26.515374] ath10k_pci 0000:02:00.0: [06]: 0x00035c00 4294967295
4294967295 4294967295 4294967295
[   26.515384] ath10k_pci 0000:02:00.0: [07]: 0x00036000 4294967295
4294967295 4294967295 4294967295
[   26.515386] ath10k_pci 0000:02:00.0: failed to reset chip: -5
[   26.515387] ath10k_pci 0000:02:00.0: Could not init hif: -5

[more snip]

Is this a firmware / driver problem or do I just have dud hardware?

Thanks,
Andy

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
