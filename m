Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ste-pvt-msa1.bahnhof.se ([213.80.101.70])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aLEiQ-0004CR-AB
 for ath10k@lists.infradead.org; Mon, 18 Jan 2016 18:39:47 +0000
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id EF3B83F881
 for <ath10k@lists.infradead.org>; Mon, 18 Jan 2016 19:39:22 +0100 (CET)
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FM4DQ_aONdIw for <ath10k@lists.infradead.org>;
 Mon, 18 Jan 2016 19:39:17 +0100 (CET)
Received: from [192.168.1.100] (h-61-220.a163.priv.bahnhof.se [79.136.61.220])
 (Authenticated sender: mb175661)
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id AE1683F87F
 for <ath10k@lists.infradead.org>; Mon, 18 Jan 2016 19:39:17 +0100 (CET)
From: =?UTF-8?Q?Per_=c3=96stlund?= <perost86@gmail.com>
Subject: QCA6174 on Asus Z170I Pro Gaming
Message-ID: <569D3155.4000103@gmail.com>
Date: Mon, 18 Jan 2016 19:39:17 +0100
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org

Hi,

I'm trying to get the wifi on my Asus Z170I Pro Gaming to work, but 
haven't had any luck so far.

lspci says:
Network controller [0280]: Qualcomm Atheros QCA6174 802.11ac Wireless 
Network Adapter [168c:003e] (rev 32)
Subsystem: ASUSTeK Computer Inc. Device [1043:86cd]

I'm using the 4.4 kernel, on Arch Linux 64-bit (linux-4.4-3 package from 
testing repo). Out of the box ath10k doesn't work at all, complaining 
that it can't find firmware-5.bin. Copying firmware-4.bin to 
firmware-5.bin gets me further, with dmesg saying this:

[ 4237.917517] ath10k_pci 0000:05:00.0: pci irq msi interrupts 1 
irq_mode 0 reset_mode 0
[ 4238.139726] ath10k_pci 0000:05:00.0: Direct firmware load for 
ath10k/cal-pci-0000:05:00.0.bin failed with error -2
[ 4238.139742] ath10k_pci 0000:05:00.0: Direct firmware load for 
ath10k/QCA6174/hw3.0/firmware-5.bin failed with error -2
[ 4238.139745] ath10k_pci 0000:05:00.0: could not fetch firmware file 
'ath10k/QCA6174/hw3.0/firmware-5.bin': -2
[ 4238.202052] ath10k_pci 0000:05:00.0: Direct firmware load for 
ath10k/QCA6174/hw3.0/board-2.bin failed with error -2
[ 4240.318396] ath10k_pci 0000:05:00.0: qca6174 hw3.2 (0x05030000, 
0x00340aff sub 1043:86cd) fw WLAN.RM.2.0-00180-QCARMSWPZ-1 fwapi 4 bdapi 
1 htt-ver 3.26 wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1 
features wowlan,ignore-otp,no-4addr-pad
[ 4240.318399] ath10k_pci 0000:05:00.0: debug 0 debugfs 1 tracing 0 dfs 
0 testmode 0
[ 4243.317764] ath10k_pci 0000:05:00.0: could not suspend target (-11)
[ 4243.378790] ath: EEPROM regdomain: 0x6c
[ 4243.378794] ath: EEPROM indicates we should expect a direct regpair map
[ 4243.378796] ath: Country alpha2 being used: 00
[ 4243.378797] ath: Regpair used: 0x6c
[ 4243.380678] ath10k_pci 0000:05:00.0 wlp5s0: renamed from wlan0
[ 4365.040838] ath10k_pci 0000:05:00.0: pci irq msi interrupts 1 
irq_mode 0 reset_mode 0
[ 4365.264862] ath10k_pci 0000:05:00.0: Direct firmware load for 
ath10k/cal-pci-0000:05:00.0.bin failed with error -2
[ 4365.327022] ath10k_pci 0000:05:00.0: Direct firmware load for 
ath10k/QCA6174/hw3.0/board-2.bin failed with error -2

The interface can't be brought up though:
# ip link set wlp5s0 up
RTNETLINK answers: Resource temporarily unavailable

I've tried various other firmwares (kvalo's, and other ones in the pull 
requests for his repo), but they either give me a "found invalid board 
magic" error or doesn't work any better than the one I got with the 
linux-firmware package. I tried extracting the firmware myself from the 
Windows drivers from Asus, which had both qca61x4_1_1_2.bin and 
qca61x4_2_2.bin, using the instructions from [1]. The first failed with 
"failed to receive control response completion, polling..", the second 
worked as well as the one in linux-firmware.

The Asus driver also comes with a lot of eeprom-files, and I didn't know 
which one to use. So I wrote a script that copied each one to 
/lib/firmware/ath10k/QCA6174/hw3.0/board-2.bin and reloaded the driver, 
but all of them failed with the invalid board magic error.

Now I'm out of ideas, so does anyone have any suggestion on what to try 
next?

[1] 
https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1383184/comments/115

Regards,
Per


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
