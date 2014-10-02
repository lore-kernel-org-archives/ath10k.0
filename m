Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x234.google.com ([2a00:1450:4010:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XZcyn-0006eX-0i
 for ath10k@lists.infradead.org; Thu, 02 Oct 2014 09:47:21 +0000
Received: by mail-la0-f52.google.com with SMTP id hz20so1990420lab.39
 for <ath10k@lists.infradead.org>; Thu, 02 Oct 2014 02:46:58 -0700 (PDT)
MIME-Version: 1.0
From: Ramprasad Vempati <ramprasad.vempati@gmail.com>
Date: Thu, 2 Oct 2014 15:16:38 +0530
Message-ID: <CAB6w8enBQM5+xApKgA=p=NZicit6nzasefwjv_0XfO3ZwaS67g@mail.gmail.com>
Subject: Unable to upgrade firmware for QCA988x module, ath10k!
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

Hi,

I've got compex wlan module: WLE600VX , which is 2x2 802.11ac QCA9882
module. I'm using kernel: 3.11, which has by default ath10k. As I
plugged in my card, I saw interface came up. But the problem is it
doesn't connect in 11ac mode.

http://www.compexshop.com/product_info.php?currency=USD&products_id=460

I've placed the firmware that's downloaded from  :
https://github.com/kvalo/ath10k-firmware. I've pasted the firmware
file as "firmware-2.bin" in /lib/firmware/ath10k/QCA988X/hw2.0. Now
there are two files firmware.bin (default one) and "firmware-2.bin"
downloaded from github. Now even after reboot of laptop the firmware
version doesn't change. It still shows 1.0.0.636.

Can someone let me know what am I missing?

root@banwifilap100u:/lib/firmware/ath10k/QCA988X/hw2.0# ethtool -i wlan1
driver: ath10k_pci
version: 3.11.0-26-generic
firmware-version: 1.0.0.636
bus-info: 0000:03:00.0
supports-statistics: yes
supports-test: no
supports-eeprom-access: no
supports-register-dump: no
supports-priv-flags: no

root@banwifilap100u:/lib/firmware/ath10k/QCA988X/hw2.0# ls -lrt
total 508
-rwxr-xr-x 1 root root   5402 Jan 31  2014 otp.bin
-rwxr-xr-x 1 root root   2116 Jan 31  2014 board.bin
-rwxrwxrwx 1 root root 254564 Oct  2 19:32 firmware-2.bin
-rwxr-xr-x 1 root root 249093 Oct  2 20:11 firmware.bin

Kern.log:

Oct  2 20:11:30 banwifilap100u kernel: [  480.051105] ACPI:
\_SB_.PCI0: Bus check notify on _handle_hotplug_event_root
Oct  2 20:11:30 banwifilap100u kernel: [  480.051353] ACPI: Device
does not support D3cold
Oct  2 20:11:33 banwifilap100u kernel: [  483.105651] ACPI:
\_SB_.PCI0: Bus check notify on _handle_hotplug_event_root
Oct  2 20:11:33 banwifilap100u kernel: [  483.106071] pci
0000:03:00.0: [168c:003c] type 00 class 0x028000
Oct  2 20:11:33 banwifilap100u kernel: [  483.106135] pci
0000:03:00.0: reg 0x10: [mem 0x00000000-0x001fffff 64bit]
Oct  2 20:11:33 banwifilap100u kernel: [  483.106247] pci
0000:03:00.0: reg 0x30: [mem 0x00000000-0x0000ffff pref]
Oct  2 20:11:33 banwifilap100u kernel: [  483.106370] pci
0000:03:00.0: supports D1 D2
Oct  2 20:11:33 banwifilap100u kernel: [  483.106376] pci
0000:03:00.0: PME# supported from D0 D1 D2 D3hot D3cold
Oct  2 20:11:33 banwifilap100u kernel: [  483.106457] pci
0000:03:00.0: System wakeup disabled by ACPI
Oct  2 20:11:33 banwifilap100u kernel: [  483.113235] pci
0000:03:00.0: BAR 0: assigned [mem 0xf6800000-0xf69fffff 64bit]
Oct  2 20:11:33 banwifilap100u kernel: [  483.113312] pci
0000:03:00.0: BAR 6: assigned [mem 0xf0a00000-0xf0a0ffff pref]
Oct  2 20:11:33 banwifilap100u kernel: [  483.113641] ath10k_pci
0000:03:00.0: BAR 0: assigned [mem 0xf6800000-0xf69fffff 64bit]
Oct  2 20:11:33 banwifilap100u kernel: [  483.113781] ath10k_pci
0000:03:00.0: enabling device (0100 -> 0102)
Oct  2 20:11:33 banwifilap100u kernel: [  483.114524] ath10k: MSI-X
didn't succeed (1), trying MSI
Oct  2 20:11:33 banwifilap100u kernel: [  483.114593] ath10k_pci
0000:03:00.0: irq 44 for MSI/MSI-X
Oct  2 20:11:33 banwifilap100u kernel: [  483.114671] ath10k: MSI
interrupt handling
Oct  2 20:11:33 banwifilap100u kernel: [  483.148663] ath10k: Hardware
name qca988x hw2.0 version 0x4100016c
Oct  2 20:11:35 banwifilap100u kernel: [  484.300970] ath10k: UART
prints disabled
Oct  2 20:11:35 banwifilap100u kernel: [  484.305472] ath10k: HTC
Service HTT Data does not allocate target credits
Oct  2 20:11:35 banwifilap100u kernel: [  484.311733] ath10k: firmware
1.0.0.636 booted
Oct  2 20:11:35 banwifilap100u kernel: [  484.322328] ath: EEPROM regdomain: 0x0
Oct  2 20:11:35 banwifilap100u kernel: [  484.322333] ath: EEPROM
indicates default country code should be used
Oct  2 20:11:35 banwifilap100u kernel: [  484.322334] ath: doing
EEPROM country->regdmn map search
Oct  2 20:11:35 banwifilap100u kernel: [  484.322335] ath: country
maps to regdmn code: 0x3a
Oct  2 20:11:35 banwifilap100u kernel: [  484.322336] ath: Country
alpha2 being used: US
Oct  2 20:11:35 banwifilap100u kernel: [  484.322337] ath: Regpair used: 0x3a
Oct  2 20:11:35 banwifilap100u kernel: [  484.365900] IPv6:
ADDRCONF(NETDEV_UP): wlan2: link is not ready
Oct  2 20:11:35 banwifilap100u kernel: [  484.366543] IPv6:
ADDRCONF(NETDEV_UP): wlan2: link is not ready

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
