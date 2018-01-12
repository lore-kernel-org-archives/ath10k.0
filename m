Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail78-59.sinamail.sina.com.cn ([219.142.78.59])
 by bombadil.infradead.org with smtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eZsbH-0000FE-IF
 for ath10k@lists.infradead.org; Fri, 12 Jan 2018 06:14:02 +0000
From: "gary" <guohuizou2000@sina.com>
Subject: ath10k firmware creashed in mesh with security mode
Date: Fri, 12 Jan 2018 14:13:41 +0800
Message-ID: <002201d38b6c$7ed5b560$7c812020$@sina.com>
MIME-Version: 1.0
Content-Language: zh-cn
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


Hi all,

I want to demo mesh feature on QCA9984.
When I setup an open mesh link between two access points, the mesh link
works well.
But when I setup an secure mesh link, the mesh link can be setup, but it
fail to ping each other because of firmware crash.
Any comment is appreciated.

Here are the wpa_supplicant config and the console log.

ctrl_interface=/var/run/wpa_supplicant_0
user_mpm=1
network={
ssid="Gary_mesh"
key_mgmt=SAE
mode=5
frequency=5180
psk="password"
ieee80211w=1
}

PING 192.168.2.11 (192.168.2.11): 56 data bytes
ath10k_pci 0001:02:00.0: firmware crashed! (guid
feda2a61-1dd4-49d7-813c-d5b163d14fb4)
ath10k_pci 0001:02:00.0: qca9984/qca9994 hw1.0 target 0x01000000 chip_id
0x00000000 sub 168c:cafe
ath10k_pci 0001:02:00.0: kconfig debug 0 debugfs 1 tracing 1 dfs 1 testmode
1
ath10k_pci 0001:02:00.0: firmware ver 10.4-3.4-00082 api 5 features
no-p2p,mfp,peer-flow-ctrl,btcoex-param,allows-mesh-bcast crc32 f301de65
ath10k_pci 0001:02:00.0: board_file api 2 bmi_id 0:3 crc32 4de21199
ath10k_pci 0001:02:00.0: htt-ver 2.2 wmi-op 6 htt-op 4 cal otp max-sta 512
raw 0 hwcrypto 1
ath10k_pci 0001:02:00.0: firmware register dump:
ath10k_pci 0001:02:00.0: [00]: 0x0000000A 0x000015B3 0x009A7E11 0x00975B31
ath10k_pci 0001:02:00.0: [04]: 0x009A7E11 0x00060F30 0x00000005 0x00000013
ath10k_pci 0001:02:00.0: [08]: 0x0045E7D4 0x0045F078 0x00460374 0x00406734
ath10k_pci 0001:02:00.0: [12]: 0x00000009 0x00000000 0x009A764C 0x009A7673
ath10k_pci 0001:02:00.0: [16]: 0x009A7E11 0x009A77CA 0x009606CA 0x00000000
ath10k_pci 0001:02:00.0: [20]: 0x409A7E11 0x0040662C 0x004067F0 0x00012474
ath10k_pci 0001:02:00.0: [24]: 0x809A9487 0x0040668C 0x004066E8 0xC09A7E11
ath10k_pci 0001:02:00.0: [28]: 0x809AA2E2 0x0040671C 0x004067F0 0x00012474
ath10k_pci 0001:02:00.0: [32]: 0x80987EB1 0x004067EC 0x0045E7D4 0x004551E4
ath10k_pci 0001:02:00.0: [36]: 0x8099657F 0x0040685C 0x0042F558 0x0045A078
ath10k_pci 0001:02:00.0: [40]: 0x80991660 0x0040687C 0x0042F558 0x0045A078
ath10k_pci 0001:02:00.0: [44]: 0x80963AD3 0x00406A7C 0x0042F558 0x00991658
ath10k_pci 0001:02:00.0: [48]: 0x80960E80 0x00406A9C 0x0000001F 0x00400000
ath10k_pci 0001:02:00.0: [52]: 0x80960E51 0x00406ACC 0x00400000 0x00000000
ath10k_pci 0001:02:00.0: [56]: 0x80960E9D 0x00406AEC 0x00000000 0x00400600
ath10k_pci 0001:02:00.0: Copy Engine register dump:
ath10k_pci 0001:02:00.0: [00]: 0x0004a000   4   4   3   3
ath10k_pci 0001:02:00.0: [01]: 0x0004a400  10  10 109 110
ath10k_pci 0001:02:00.0: [02]: 0x0004a800  40  40  39  40
ath10k_pci 0001:02:00.0: [03]: 0x0004ac00  20  20  22  20
ath10k_pci 0001:02:00.0: [04]: 0x0004b000  34  34  63  23
ath10k_pci 0001:02:00.0: [05]: 0x0004b400  30  30 413 414
ath10k_pci 0001:02:00.0: [06]: 0x0004b800  16  16  16  16
ath10k_pci 0001:02:00.0: [07]: 0x0004bc00   1   1   1   1
ath10k_pci 0001:02:00.0: [08]: 0x0004c000   0   0 127   0
ath10k_pci 0001:02:00.0: [09]: 0x0004c400   0   0   0   0
ath10k_pci 0001:02:00.0: [10]: 0x0004c800   0   0   0   0
ath10k_pci 0001:02:00.0: [11]: 0x0004cc00   0   0   0   0
ath10k_pci 0001:02:00.0: firmware crashed! (guid
6460bed0-61f1-4e95-a469-dd7fce5cb21f)
ath10k_pci 0001:02:00.0: qca9984/qca9994 hw1.0 target 0x01000000 chip_id
0x00000000 sub 168c:cafe
ath10k_pci 0001:02:00.0: kconfig debug 0 debugfs 1 tracing 1 dfs 1 testmode
1
ath10k_pci 0001:02:00.0: firmware ver 10.4-3.4-00082 api 5 features
no-p2p,mfp,peer-flow-ctrl,btcoex-param,allows-mesh-bcast crc32 f301de65
ath10k_pci 0001:02:00.0: board_file api 2 bmi_id 0:3 crc32 4de21199
ath10k_pci 0001:02:00.0: htt-ver 2.2 wmi-op 6 htt-op 4 cal otp max-sta 512
raw 0 hwcrypto 1
ath10k_pci 0001:02:00.0: failed to get memcpy hi address for firmware
address 4: -16
ath10k_pci 0001:02:00.0: failed to read firmware dump area: -16
ath10k_pci 0001:02:00.0: Copy Engine register dump:
ath10k_pci 0001:02:00.0: [00]: 0x0004a000   0   0   0   0
ath10k_pci 0001:02:00.0: [01]: 0x0004a400   0   0   0   0
ath10k_pci 0001:02:00.0: [02]: 0x0004a800   0   0   0   0
ath10k_pci 0001:02:00.0: [03]: 0x0004ac00   0   0   0   0
ath10k_pci 0001:02:00.0: [04]: 0x0004b000   0   0   0   0
ath10k_pci 0001:02:00.0: [05]: 0x0004b400   0   0   0   0
ath10k_pci 0001:02:00.0: [06]: 0x0004b800   0   0   0   0
ath10k_pci 0001:02:00.0: [07]: 0x0004bc00   1   0   1   0
ath10k_pci 0001:02:00.0: [08]: 0x0004c000   0   0   0   0
ath10k_pci 0001:02:00.0: [09]: 0x0004c400   0   0   0   0
ath10k_pci 0001:02:00.0: [10]: 0x0004c800   0   0   0   0
ath10k_pci 0001:02:00.0: [11]: 0x0004cc00   0   0   0   0



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
