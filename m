Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr0-x22c.google.com ([2a00:1450:400c:c0c::22c])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ezAhg-00085W-2C
 for ath10k@lists.infradead.org; Fri, 23 Mar 2018 00:37:10 +0000
Received: by mail-wr0-x22c.google.com with SMTP id z8so10454435wrh.7
 for <ath10k@lists.infradead.org>; Thu, 22 Mar 2018 17:36:56 -0700 (PDT)
Received: from localhost (client-8-75.eduroam.oxuni.org.uk. [192.76.8.75])
 by smtp.gmail.com with ESMTPSA id b17sm1735525wrj.32.2018.03.22.17.36.52
 for <ath10k@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 22 Mar 2018 17:36:52 -0700 (PDT)
Date: Fri, 23 Mar 2018 00:36:51 +0000
From: Nick Hu <me@nickhu.co.uk>
Subject: qca6174 hw 2.1 firmware version SW_RM.1.1.1-00157-QCARMSWPZ-1 crash
 on deauthenticating from wireless network
Message-ID: <20180323003651.jdntqgyeebaprxpz@mu>
MIME-Version: 1.0
Content-Disposition: inline
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

I am experiencing the following crash when deauthenticating (manually,
disconnect in Network Manager):

[   36.711973] wlp1s0: deauthenticating from 00:81:c4:85:0a:7f by local choice (Reason: 3=DEAUTH_LEAVING)
[   36.717973] ath10k_pci 0000:01:00.0: firmware crashed! (uuid n/a)
[   36.717979] ath10k_pci 0000:01:00.0: qca6174 hw2.1 target 0x05010000 chip_id 0x003405ff sub 144d:4125
[   36.717981] ath10k_pci 0000:01:00.0: kconfig debug 0 debugfs 0 tracing 0 dfs 0 testmode 0
[   36.718308] ath10k_pci 0000:01:00.0: firmware ver SW_RM.1.1.1-00157-QCARMSWPZ-1 api 5 features ignore-otp,no-4addr-pad crc32 10bf8e08
[   36.718477] ath10k_pci 0000:01:00.0: board_file api 2 bmi_id N/A crc32 ae2e275a
[   36.718479] ath10k_pci 0000:01:00.0: htt-ver 3.1 wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1
[   36.720498] ath10k_pci 0000:01:00.0: firmware register dump:
[   36.720502] ath10k_pci 0000:01:00.0: [00]: 0x05010000 0x00000000 0x0092E4DC 0x6F19C0E9
[   36.720505] ath10k_pci 0000:01:00.0: [04]: 0x0092E4DC 0x00060130 0x00000018 0x0041A760
[   36.720507] ath10k_pci 0000:01:00.0: [08]: 0x6F19C0D5 0x00400000 0x00000000 0x000A5C88
[   36.720509] ath10k_pci 0000:01:00.0: [12]: 0x00000009 0x00000000 0x0096C09C 0x0096C0A7
[   36.720512] ath10k_pci 0000:01:00.0: [16]: 0x0096BDBC 0x00991FCD 0x00000000 0x009287BD
[   36.720514] ath10k_pci 0000:01:00.0: [20]: 0x4092E4DC 0x0041A710 0x00000000 0x0F000000
[   36.720516] ath10k_pci 0000:01:00.0: [24]: 0x809432A7 0x0041A770 0x0040D400 0xC092E4DC
[   36.720518] ath10k_pci 0000:01:00.0: [28]: 0x80942BC4 0x0041A790 0x6F19C0D5 0x00400000
[   36.720521] ath10k_pci 0000:01:00.0: [32]: 0x80947BA7 0x0041A7B0 0x004050A8 0x0040E074
[   36.720523] ath10k_pci 0000:01:00.0: [36]: 0x809BDECC 0x0041A7D0 0x004050A8 0x0040E074
[   36.720525] ath10k_pci 0000:01:00.0: [40]: 0x8099638C 0x0041A7F0 0x004050A8 0x00000000
[   36.720527] ath10k_pci 0000:01:00.0: [44]: 0x80992076 0x0041A810 0x0044FD68 0x0046FFE8
[   36.720529] ath10k_pci 0000:01:00.0: [48]: 0x80996BD3 0x0041A830 0x0044FD68 0x00000000
[   36.720531] ath10k_pci 0000:01:00.0: [52]: 0x800B4405 0x0041A850 0x00422318 0x00005002
[   36.720533] ath10k_pci 0000:01:00.0: [56]: 0x809A6C34 0x0041A8E0 0x0042932C 0x0042CA20
[   36.720534] ath10k_pci 0000:01:00.0: Copy Engine register dump:
[   36.720543] ath10k_pci 0000:01:00.0: [00]: 0x00034400   1   1   3   3
[   36.720551] ath10k_pci 0000:01:00.0: [01]: 0x00034800  12  12 399 400
[   36.720559] ath10k_pci 0000:01:00.0: [02]: 0x00034c00  24  24  87  88
[   36.720567] ath10k_pci 0000:01:00.0: [03]: 0x00035000  13  13  13  13
[   36.720575] ath10k_pci 0000:01:00.0: [04]: 0x00035400  49  49  90  26
[   36.720583] ath10k_pci 0000:01:00.0: [05]: 0x00035800   0   0   0   0
[   36.720591] ath10k_pci 0000:01:00.0: [06]: 0x00035c00  29  29  29  29
[   36.720599] ath10k_pci 0000:01:00.0: [07]: 0x00036000   1   1   1   1
[   36.725270] ath10k_pci 0000:01:00.0: failed to submit keepalive on vdev 0: -108
[   36.725273] ath10k_pci 0000:01:00.0: failed to disable keepalive on vdev 0: -108
[   36.786431] ieee80211 phy0: Hardware restart was requested
[   38.143264] ath10k_pci 0000:01:00.0: device successfully recovered
[   39.775437] ath10k_pci 0000:01:00.0: no channel configured; ignoring frame(s)!
[   40.697423] ath10k_pci 0000:01:00.0: no channel configured; ignoring frame(s)!
[   41.209485] ath10k_pci 0000:01:00.0: no channel configured; ignoring frame(s)!
[   44.997864] ath10k_pci 0000:01:00.0: no channel configured; ignoring frame(s)!
[   58.617361] ath10k_pci 0000:01:00.0: no channel configured; ignoring frame(s)!
[   66.573886] ath10k_pci 0000:01:00.0: no channel configured; ignoring frame(s)!
[   69.200682] ath10k_pci 0000:01:00.0: no channel configured; ignoring frame(s)!
[   73.683270] ath10k_pci 0000:01:00.0: no channel configured; ignoring frame(s)!
[   77.814585] ath10k_pci 0000:01:00.0: no channel configured; ignoring frame(s)!
[   84.000475] ath10k_pci 0000:01:00.0: no channel configured; ignoring frame(s)!
[   85.755609] ath10k_pci 0000:01:00.0: no channel configured; ignoring frame(s)!
[   90.122704] ath10k_pci 0000:01:00.0: no channel configured; ignoring frame(s)!
[   93.201172] ath10k_pci 0000:01:00.0: no channel configured; ignoring frame(s)!

At this point, the wireless device is unresponsive until I disable and then
reenable Wi-Fi in Network Manager (or alternatively rmmod ath10k_pci; modprobe
ath10k_pci). Full dmesg available at https://bugzilla.kernel.org/attachment.cgi?id=260313
- this bug report mirrors https://bugzilla.kernel.org/show_bug.cgi?id=195987,
but it feels like it was better to reach out to the mailing list too.

The network adapter is

# lspci -nnkv

01:00.0 Network controller [0280]: Qualcomm Atheros QCA6174 802.11ac Wireless Network Adapter [168c:003e] (rev 20)
	Subsystem: Samsung Electronics Co Ltd Device [144d:4125]
	Flags: bus master, fast devsel, latency 0, IRQ 48
	Memory at f7000000 (64-bit, non-prefetchable) [size=2M]
	Capabilities: [40] Power Management version 3
	Capabilities: [50] MSI: Enable+ Count=1/8 Maskable+ 64bit-
	Capabilities: [70] Express Endpoint, MSI 00
	Capabilities: [100] Advanced Error Reporting
	Capabilities: [148] Virtual Channel
	Capabilities: [168] Device Serial Number 00-00-00-00-00-00-00-00
	Capabilities: [178] Latency Tolerance Reporting
	Capabilities: [180] L1 PM Substates
	Kernel driver in use: ath10k_pci
	Kernel modules: ath10k_pci

found in a Samsung Ativ Book 9 model 900X3K.

Sometimes rmmod ath10k_pci causes a system hang, but I am unable to reliably
reproduce; seems to occur orthogonally to this issue. The issue above occurs
without fail on every deauthentication.

The logs are from an old Linux version, but I can still reproduce pretty much
exactly on 4.14.24 (same hardware configuration):

[ 1355.477088] wlp1s0: deauthenticating from f0:b2:e5:c3:0f:c3 by local choice (Reason: 3=DEAUTH_LEAVING)
[ 1355.484076] ath10k_pci 0000:01:00.0: firmware crashed! (guid n/a)
[ 1355.484081] ath10k_pci 0000:01:00.0: qca6174 hw2.1 target 0x05010000 chip_id 0x003405ff sub 144d:4125
[ 1355.484083] ath10k_pci 0000:01:00.0: kconfig debug 0 debugfs 0 tracing 0 dfs 0 testmode 0
[ 1355.484430] ath10k_pci 0000:01:00.0: firmware ver SW_RM.1.1.1-00157-QCARMSWPZ-1 api 5 features ignore-otp,no-4addr-pad crc32 10bf8e08
[ 1355.484605] ath10k_pci 0000:01:00.0: board_file api 2 bmi_id N/A crc32 ae2e275a
[ 1355.484607] ath10k_pci 0000:01:00.0: htt-ver 3.1 wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1
[ 1355.486626] ath10k_pci 0000:01:00.0: firmware register dump:
[ 1355.486630] ath10k_pci 0000:01:00.0: [00]: 0x05010000 0x00000000 0x0092E4DC 0x7EEA2573
[ 1355.486632] ath10k_pci 0000:01:00.0: [04]: 0x0092E4DC 0x00060130 0x00000018 0x0041A760
[ 1355.486635] ath10k_pci 0000:01:00.0: [08]: 0x7EEA255F 0x00400000 0x00000000 0x000A5C88
[ 1355.486637] ath10k_pci 0000:01:00.0: [12]: 0x00000009 0x00000000 0x0096C09C 0x0096C0A7
[ 1355.486639] ath10k_pci 0000:01:00.0: [16]: 0x0096BDBC 0x009287BD 0x00000000 0x009287BD
[ 1355.486641] ath10k_pci 0000:01:00.0: [20]: 0x4092E4DC 0x0041A710 0x00000000 0x0F000000
[ 1355.486643] ath10k_pci 0000:01:00.0: [24]: 0x809432A7 0x0041A770 0x0040D400 0xC092E4DC
[ 1355.486645] ath10k_pci 0000:01:00.0: [28]: 0x80942BC4 0x0041A790 0x7EEA255F 0x00400000
[ 1355.486647] ath10k_pci 0000:01:00.0: [32]: 0x80947BA7 0x0041A7B0 0x00404D88 0x0040E074
[ 1355.486649] ath10k_pci 0000:01:00.0: [36]: 0x809BDECC 0x0041A7D0 0x00404D88 0x0040E074
[ 1355.486651] ath10k_pci 0000:01:00.0: [40]: 0x8099638C 0x0041A7F0 0x00404D88 0x00000000
[ 1355.486653] ath10k_pci 0000:01:00.0: [44]: 0x80992076 0x0041A810 0x0044FD68 0x0046FFE8
[ 1355.486655] ath10k_pci 0000:01:00.0: [48]: 0x80996BD3 0x0041A830 0x0044FD68 0x00000000
[ 1355.486657] ath10k_pci 0000:01:00.0: [52]: 0x800B4405 0x0041A850 0x00422318 0x00005002
[ 1355.486659] ath10k_pci 0000:01:00.0: [56]: 0x809A6C34 0x0041A8E0 0x0042932C 0x0042CA20
[ 1355.486661] ath10k_pci 0000:01:00.0: Copy Engine register dump:
[ 1355.486669] ath10k_pci 0000:01:00.0: [00]: 0x00034400   1   1   3   3
[ 1355.486677] ath10k_pci 0000:01:00.0: [01]: 0x00034800  10  10 141 142
[ 1355.486685] ath10k_pci 0000:01:00.0: [02]: 0x00034c00  60  60  59  60
[ 1355.486693] ath10k_pci 0000:01:00.0: [03]: 0x00035000   8   8   9   8
[ 1355.486701] ath10k_pci 0000:01:00.0: [04]: 0x00035400 7911 7911 181 117
[ 1355.486709] ath10k_pci 0000:01:00.0: [05]: 0x00035800   0   0   0   0
[ 1355.486716] ath10k_pci 0000:01:00.0: [06]: 0x00035c00   7   7   7   7
[ 1355.486724] ath10k_pci 0000:01:00.0: [07]: 0x00036000   1   1   1   1
[ 1355.487152] ath10k_pci 0000:01:00.0: failed to create WMI vdev 0: -108
[ 1355.548581] ieee80211 phy0: Hardware restart was requested
[ 1356.907515] ath10k_pci 0000:01:00.0: device successfully recovered
-- rmmod ath10k_pci; modprobe ath10k_pci
[ 1405.157246] ath10k_pci 0000:01:00.0: pci irq msi oper_irq_mode 2 irq_mode 0 reset_mode 0
[ 1405.373582] ath10k_pci 0000:01:00.0: Direct firmware load for ath10k/pre-cal-pci-0000:01:00.0.bin failed with error -2
[ 1405.373596] ath10k_pci 0000:01:00.0: Direct firmware load for ath10k/cal-pci-0000:01:00.0.bin failed with error -2
[ 1405.373611] ath10k_pci 0000:01:00.0: Direct firmware load for ath10k/QCA6174/hw2.1/firmware-6.bin failed with error -2
[ 1405.375724] ath10k_pci 0000:01:00.0: qca6174 hw2.1 target 0x05010000 chip_id 0x003405ff sub 144d:4125
[ 1405.375726] ath10k_pci 0000:01:00.0: kconfig debug 0 debugfs 0 tracing 0 dfs 0 testmode 0
[ 1405.376100] ath10k_pci 0000:01:00.0: firmware ver SW_RM.1.1.1-00157-QCARMSWPZ-1 api 5 features ignore-otp,no-4addr-pad crc32 10bf8e08
[ 1405.441480] ath10k_pci 0000:01:00.0: board_file api 2 bmi_id N/A crc32 ae2e275a
[ 1406.611407] ath10k_pci 0000:01:00.0: htt-ver 3.1 wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1
[ 1406.671998] ath: EEPROM regdomain: 0x6a
[ 1406.672000] ath: EEPROM indicates we should expect a direct regpair map
[ 1406.672002] ath: Country alpha2 being used: 00
[ 1406.672002] ath: Regpair used: 0x6a
[ 1406.676799] ath10k_pci 0000:01:00.0 wlp1s0: renamed from wlan0

Happy to perform more debugging/testing if needed.

--
Nick Hu

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
