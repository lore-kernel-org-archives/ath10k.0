Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x236.google.com ([2a00:1450:400c:c05::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZIBVn-0004L0-Lq
 for ath10k@lists.infradead.org; Thu, 23 Jul 2015 08:05:52 +0000
Received: by wicgb10 with SMTP id gb10so131082325wic.1
 for <ath10k@lists.infradead.org>; Thu, 23 Jul 2015 01:05:29 -0700 (PDT)
Received: from [192.168.118.24] ([197.231.66.149])
 by smtp.googlemail.com with ESMTPSA id pf4sm6213538wjb.23.2015.07.23.01.05.28
 for <ath10k@lists.infradead.org>
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 23 Jul 2015 01:05:28 -0700 (PDT)
From: Alexandre Maloteaux <a.maloteaux@gmail.com>
Subject: QCA6174 hw2.1 on Clevo P750ZM
Message-ID: <55B0A037.8070102@gmail.com>
Date: Thu, 23 Jul 2015 09:05:11 +0100
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

Hi

I just received a Clevo P750ZM (eurocom P5 pro) with a QCA6174

06:00.0 Network controller: Qualcomm Atheros QCA6174 802.11ac Wireless
Network Adapter (rev 20)

Hi have tested the dissect/assemble procedure  described here :

https://www.mail-archive.com/ath10k@lists.infradead.org/msg02283.html
https://askubuntu.com/questions/546813/killer-n1525-with-ubuntu-14-10

Im on Arch and i have tested with the Eurocom Drivers
(http://downloads.eurocom.com/support/drivers/zip/260/260_KillerWLAN_W864.zip)
and the sumdog blobs  (https://github.com/sumdog/ath10k-firmware.git)
directly on those 3 firmwares
Arch official : 4.1.2-2-ARCH
kvalo master : 4.2.0-rc3
kvalo qca branch : 4.1.0-rc6

I have a different issue for each kernel and i have tested with all
board.bin available but none worked :

ARCH official issue :

[   15.794214] ath10k_pci 0000:06:00.0: enabling device (0000 -> 0002)
[   15.794528] ath10k_pci 0000:06:00.0: pci irq msi-x interrupts 8
irq_mode 0 reset_mode 0
[   15.973369] ath10k_pci 0000:06:00.0: Direct firmware load for
ath10k/cal-pci-0000:06:00.0.bin failed with error -2
[   17.152098] ath10k_pci 0000:06:00.0: firmware crashed! (uuid
845cf3fa-05bd-4eed-873b-763f94de2e76)
[   17.152101] ath10k_pci 0000:06:00.0: qca6174 hw2.1 (0x05010000,
0x003405ff) fw killer-n1525-fw api 4 htt 0.0 wmi 4 cal otp max_sta 32
[   17.152103] ath10k_pci 0000:06:00.0: debug 0 debugfs 1 tracing 0 dfs
0 testmode 0
[   17.154123] ath10k_pci 0000:06:00.0: firmware register dump:
[   17.154124] ath10k_pci 0000:06:00.0: [00]: 0x05010000 0x000015B3
0x0095186B 0x00955B31
[   17.154125] ath10k_pci 0000:06:00.0: [04]: 0x0095186B 0x00060130
0x00000010 0x0040AF04
[   17.154126] ath10k_pci 0000:06:00.0: [08]: 0x00000018 0x00000001
0x00000001 0x00412250
[   17.154127] ath10k_pci 0000:06:00.0: [12]: 0x00000009 0x00000000
0x0096C09C 0x0096C0A7
[   17.154128] ath10k_pci 0000:06:00.0: [16]: 0x0096BDBC 0x0092C07A
0x00000000 0x00000000
[   17.154128] ath10k_pci 0000:06:00.0: [20]: 0x4095186B 0x0040E160
0x0041F82C 0x00000001
[   17.154129] ath10k_pci 0000:06:00.0: [24]: 0x80936238 0x0040E1C0
0x00000000 0xC095186B
[   17.154130] ath10k_pci 0000:06:00.0: [28]: 0x80936361 0x0040E1E0
0x00000000 0x0041C8DC
[   17.154131] ath10k_pci 0000:06:00.0: [32]: 0x80934A67 0x0040E200
0x00436DF0 0x0040E250
[   17.154132] ath10k_pci 0000:06:00.0: [36]: 0x809A5DC2 0x0040E250
0x004275C0 0x00000001
[   17.154133] ath10k_pci 0000:06:00.0: [40]: 0x809A5E1A 0x0040E290
0x00426F50 0x00000004
[   17.154133] ath10k_pci 0000:06:00.0: [44]: 0x809A5EFA 0x0040E2B0
0x00426F50 0x0041C8DC
[   17.154134] ath10k_pci 0000:06:00.0: [48]: 0x800A0909 0x0040E2D0
0x00426F50 0x004275B0
[   17.154135] ath10k_pci 0000:06:00.0: [52]: 0x800A024A 0x0040E2F0
0x0041ABB0 0x00420420
[   17.154136] ath10k_pci 0000:06:00.0: [56]: 0x809287D9 0x0040E310
0x00000000 0x00400000
[   18.144916] ath10k_pci 0000:06:00.0: failed to receive control
response completion, polling..
[   19.146522] ath10k_pci 0000:06:00.0: ctl_resp never came in (-110)
[   19.146525] ath10k_pci 0000:06:00.0: failed to connect to HTC: -110
[   19.217113] ath10k_pci 0000:06:00.0: could not init core (-110)
[   19.217137] ath10k_pci 0000:06:00.0: could not probe fw (-110)
[   19.227008] ath10k_pci 0000:06:00.0: cannot restart a device that
hasn't been started


kvalo master :

[    0.000000] Linux version 4.2.0-rc3-wl-ath-KVALO-ATH-MASTER+
(root@z1kadev) (gcc version 5.1.0 (GCC) ) #2 SMP PREEMPT Tue Jul 21
15:07:02 WAT 2015
[   12.381604] systemd[1]: cups.path: Cannot add dependency job,
ignoring: Unit cups.path failed to load: No such file or directory.
[   12.595610] ath3k: probe of 3-7:1.0 failed with error -22
[   12.595637] usbcore: registered new interface driver ath3k
[   12.627163] ath10k_pci 0000:06:00.0: enabling device (0000 -> 0002)
[   12.627915] ath10k_pci 0000:06:00.0: pci irq msi-x interrupts 8
irq_mode 0 reset_mode 0
[   12.822155] ath10k_pci 0000:06:00.0: Direct firmware load for
ath10k/cal-pci-0000:06:00.0.bin failed with error -2
[   12.822158] ath10k_pci 0000:06:00.0: Falling back to user helper
[   72.915990] ath10k_pci 0000:06:00.0: Direct firmware load for
ath10k/QCA6174/hw2.1/board-pci-168c:003e:1a56:1525.bin failed with error -2
[   72.915993] ath10k_pci 0000:06:00.0: Falling back to user helper
[  133.010331] ath10k_pci 0000:06:00.0: failed to load spec board file,
falling back to generic: -11
[  133.010647] ath10k_pci 0000:06:00.0: Direct firmware load for
ath10k/QCA6174/hw2.1/firmware-5.bin failed with error -2
[  133.010649] ath10k_pci 0000:06:00.0: Falling back to user helper
[  193.105501] ath10k_pci 0000:06:00.0: could not fetch firmware file
'ath10k/QCA6174/hw2.1/firmware-5.bin': -11
[  194.276201] ath10k_pci 0000:06:00.0: received unsolicited fw crash
interrupt
[  194.276209] ath10k_pci 0000:06:00.0: received unsolicited fw crash
interrupt
[  195.275581] ath10k_pci 0000:06:00.0: failed to receive control
response completion, polling..
[  195.275699] ath10k_pci 0000:06:00.0: received unsolicited fw crash
interrupt
[  196.277176] ath10k_pci 0000:06:00.0: Service connect timeout
[  196.277179] ath10k_pci 0000:06:00.0: failed to connect htt (-110)
[  196.347791] ath10k_pci 0000:06:00.0: could not init core (-110)
[  196.347819] ath10k_pci 0000:06:00.0: could not probe fw (-110)

kvalo qca branch :

[  386.639108] ath10k_pci 0000:06:00.0: failed to receive initialized
event from target: b8600448
[  386.639110] ath10k_pci 0000:06:00.0: failed to wait for target after
cold reset: -110
[  386.639110] ath10k_pci 0000:06:00.0: failed to reset chip: -110
[  386.639203] ath10k_pci: probe of 0000:06:00.0 failed with error -110
[  419.547152] ath10k_pci 0000:06:00.0: pci irq msi-x interrupts 8
irq_mode 0 reset_mode 0
[  422.565998] ath10k_pci 0000:06:00.0: failed to receive initialized
event from target: b8600448
[  422.566000] ath10k_pci 0000:06:00.0: failed to wait for target after
cold reset: -110
[  422.566001] ath10k_pci 0000:06:00.0: failed to reset chip: -110
[  422.566096] ath10k_pci: probe of 0000:06:00.0 failed with error -110

im getting only the cal issue  on the kvalo master if i copy
firmware-4.bin to firmware-5.bin. If i copy fw-1.bin from dissect.py to
cal-pci-0000:06:00.0.bin . I m getting the issue with the official arch...

Hope somebody can help

Best Regards

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
