Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x22a.google.com ([2a00:1450:4010:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YoD21-0007ek-F0
 for ath10k@lists.infradead.org; Fri, 01 May 2015 15:39:14 +0000
Received: by layy10 with SMTP id y10so66455169lay.0
 for <ath10k@lists.infradead.org>; Fri, 01 May 2015 08:38:51 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 1 May 2015 17:38:51 +0200
Message-ID: <CAMCCUbj4jEuU9i9s_z-9m=WTW1tSxbKa9Qp9ttWM184w3zWgbA@mail.gmail.com>
Subject: Which Firmware to use for STA (999.x crashes...)
From: richard mayers <richard.mayers92@gmail.com>
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

Hi everyone!

I need to do some 802.11ac measurements. For that I am using the
Compex wle900vx.

I had a set up in which everything was working quite well, however I
had a maximum throughput of 380Mbits/s ( with all the debug options
enabled )

In this first set up I had been using ubuntu 14.04 LTS, kernel version
3.16, for the driver I used the latest stable backport (3.19) and
finally as a firmware the commercial firmware from Candela Tech
(latest version) in both the AP and STA.

However, I read in the wiki that the latest firmware version for AP is
the 10.2.4.48, and the Stations should use 999.999.0.63. For this
second set up I changed almost everything:

- Upgraded kernel to 4.0.1
- Backported drivers from the git Modinfo output -> (backported from
Linux (v3.2-rc1-243765-ga2ff7c6) using backports
backports-20150424-2-g982)

AP : 10.2.4.48 firmware
STA : Following the wiki : 999.999.0.63

During boot the firmware is loaded without any problem:

ath10k_pci 0000:0c:00.0: qca988x hw2.0 (0x4100016c, 0x043202ff) fw
999.999.0.636 api 2 htt 2.1 wmi 1 cal otp max_sta 16

However when I associate with the AP, the firmware crashes.

[11831.954992] ath10k_pci 0000:0c:00.0: firmware crashed! (uuid n/a)
[11831.955031] ath10k_pci 0000:0c:00.0: qca988x hw2.0 (0x4100016c,
0x043202ff) fw 999.999.0.636 api 2 htt 2.1 wmi 1 cal otp max_sta 16
[11831.955039] ath10k_pci 0000:0c:00.0: debug 0 debugfs 0 tracing 0
dfs 0 testmode 0
[11831.957059] ath10k_pci 0000:0c:00.0: firmware register dump:
[11831.957068] ath10k_pci 0000:0c:00.0: [00]: 0x4100016C 0x00000000
0x009C4521 0x00000000
[11831.957076] ath10k_pci 0000:0c:00.0: [04]: 0x009C4521 0x00060530
0x00000019 0x00955A00
[11831.957084] ath10k_pci 0000:0c:00.0: [08]: 0x00306862 0x00000000
0x0040CC94 0x00000020
[11831.957091] ath10k_pci 0000:0c:00.0: [12]: 0x00000000 0x00000000
0x00958360 0x0095836B
[11831.957098] ath10k_pci 0000:0c:00.0: [16]: 0x80991091 0x0040AD94
0x0043155C 0x00000000
[11831.957106] ath10k_pci 0000:0c:00.0: [20]: 0x0000FFFF 0x00000000
0x0043155C 0x00000000
[11831.957114] ath10k_pci 0000:0c:00.0: [24]: 0x809A0978 0x0040AD94
0x00439484 0xC1A18834
[11831.957121] ath10k_pci 0000:0c:00.0: [28]: 0x809AD1A2 0x0040ADE4
0x00439484 0x0043FB1C
[11831.957129] ath10k_pci 0000:0c:00.0: [32]: 0x809B35A3 0x0000001A
0x00440A50 0x0000000E
[11831.957136] ath10k_pci 0000:0c:00.0: [36]: 0x00000000 0x00000000
0x00000000 0x00000000
[11831.957143] ath10k_pci 0000:0c:00.0: [40]: 0x00000000 0x00000000
0x00000000 0x00000094
[11831.957151] ath10k_pci 0000:0c:00.0: [44]: 0x00439DC8 0x00000000
0x00000000 0x00400000
[11831.957158] ath10k_pci 0000:0c:00.0: [48]: 0x809AE0B4 0x0040AE04
0x00400000 0x0043FB1C
[11831.957166] ath10k_pci 0000:0c:00.0: [52]: 0x00000001 0x00000000
0x00423410 0x00400000
[11831.957173] ath10k_pci 0000:0c:00.0: [56]: 0x809AE17E 0x0040AE44
0x0040FE6C 0x0040D310
[11832.046908] ath10k_pci 0000:0c:00.0: failed to synchronize monitor
vdev 1 stop: -108
[11832.046915] ath10k_pci 0000:0c:00.0: failed to stop monitor vdev: -108

 I have seen that in the past a lot of people had problems with this
firmware but since years have passed maybe the way of solving have
evolved.

Apart from that I also got the 00:03:07:12:34:56 MAC address issue.

Any ideas guys? Should I use the candelatech firmware for the stations ?
Richard

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
