Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mx1.mailbox.org ([80.241.60.212])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gPYEH-0004lX-9T
 for ath10k@lists.infradead.org; Wed, 21 Nov 2018 19:32:07 +0000
Received: from smtp1.mailbox.org (unknown [IPv6:2001:67c:2050:105:465:1:1:0])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256
 bits)) (No client certificate requested)
 by mx1.mailbox.org (Postfix) with ESMTPS id D19C74056A
 for <ath10k@lists.infradead.org>; Wed, 21 Nov 2018 20:31:51 +0100 (CET)
Received: from smtp1.mailbox.org ([80.241.60.240])
 by spamfilter03.heinlein-hosting.de (spamfilter03.heinlein-hosting.de
 [80.241.56.117]) (amavisd-new, port 10030)
 with ESMTP id cXHdOcGsO0ou for <ath10k@lists.infradead.org>;
 Wed, 21 Nov 2018 20:31:50 +0100 (CET)
Date: Wed, 21 Nov 2018 20:31:49 +0100 (CET)
From: wayne wayne <choeffer@mailbox.org>
Message-ID: <788420224.18178.1542828710169@office.mailbox.org>
In-Reply-To: <1705610699.18151.1542828479273@office.mailbox.org>
References: <1084648823.1982.1542713648825@office.mailbox.org>
 <1705610699.18151.1542828479273@office.mailbox.org>
Subject: Re: Surface Go - Atheros Qualcomm Killer N1525 Wireless-AC
 [168c:003e] not correctly recognized
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

Edit:

Maybe it is possible to get the matching "eeprom_ar6320_3p0_TX8_clpc.bin" directly from Qualcomm so that it can be updated if it also gets updated by Qualcomm.

> launchpad_sge4@mailbox.org hat am 21. November 2018 um 20:27 geschrieben:
> 
> 
> Additional informations can be found here:
> 
> https://bugzilla.redhat.com/show_bug.cgi?id=1651779
> 
> In comment 1 I posted a possible soultion and .bin file and where I found it and why it should fit and in comment 2 some successfull tests with latest firmare from https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/plain/ath10k/QCA6174/hw3.0/ and https://github.com/kvalo/ath10k-firmware/tree/master/QCA6174/hw3.0
> 
> > launchpad_sge4@mailbox.org hat am 20. November 2018 um 12:34 geschrieben:
> > 
> > 
> > Hello,
> > 
> > Output of dmesg on Surface Go fresh installed Ubuntu 18.10.
> > 
> > "[ 4.242132] ath10k_pci 0000:01:00.0: qca6174 hw3.2 target 0x05030000 chip_id 0x00340aff sub 168c:3370
> > [ 4.242138] ath10k_pci 0000:01:00.0: kconfig debug 0 debugfs 1 tracing 1 dfs 0 testmode 0
> > [ 4.243006] ath10k_pci 0000:01:00.0: firmware ver WLAN.RM.4.4.1-00079-QCARMSWPZ-1 api 6 features wowlan,ignore-otp crc32 fd869beb
> > [ 4.308059] ath10k_pci 0000:01:00.0: failed to fetch board data for bus=pci,vendor=168c,device=003e,subsystem-vendor=168c,subsystem-device=3370 from ath10k/QCA6174/hw3.0/board-2.bin
> > [ 4.309354] ath10k_pci 0000:01:00.0: board_file api 1 bmi_id N/A crc32 ed5f849a"
> > 
> > There is a board.bin available directly from the vendor http://www.killernetworking.com/support/K1535_Debian/board.bin But I have no clue what the content of that file is, if somehting is missing etc.
> > 
> > The only thing which is missing is getting this added to https://wireless.wiki.kernel.org/en/users/drivers/ath10k/boardfiles so the official board-2.bin. My problem is that I dont know how to read the board files and modify them because I do not know the encoding they use.
> > 
> > Also there have been some updates in the upstream linux-firmware repo. https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=a87eb5f7bac0f70ade57da57d9126d14eee12336 and https://github.com/kvalo/ath10k-firmware/tree/master/QCA6174/hw3.0 but they also do not help to get the wifi card working/recognized.
> > 
> > Also there is a guide how to port it to Linux https://developer.qualcomm.com/download/qca9377/wlan-bluetooth-linux-porting-guide.pdf
> > 
> > After copying the above http://www.killernetworking.com/support/K1535_Debian/board.bin to the following folder "/lib/firmware/ath10k/QCA6174/hw3.0", the wifi works flawless. Just the "board.bin" and "board-2.bin" in "/lib/firmware/ath10k/QCA6174/hw3.0" have to be deleted before.
> > 
> > 
> > This is the output of dmesg after replacing the board.bin with the one from killernetworking.com:
> > 
> > dmesg | grep ath
> > [ 4.513563] ath10k_pci 0000:01:00.0: pci irq msi oper_irq_mode 2 irq_mode 0 reset_mode 0
> > [ 4.806988] ath10k_pci 0000:01:00.0: qca6174 hw3.2 target 0x05030000 chip_id 0x00340aff sub 168c:3370
> > [ 4.806994] ath10k_pci 0000:01:00.0: kconfig debug 0 debugfs 1 tracing 1 dfs 0 testmode 0
> > [ 4.807918] ath10k_pci 0000:01:00.0: firmware ver WLAN.RM.4.4.1-00079-QCARMSWPZ-1 api 6 features wowlan,ignore-otp crc32 fd869beb
> > [ 4.876632] ath10k_pci 0000:01:00.0: board_file api 1 bmi_id N/A crc32 70c38a29
> > [ 5.593731] ath10k_pci 0000:01:00.0: Unknown eventid: 118809
> > [ 5.596743] ath10k_pci 0000:01:00.0: Unknown eventid: 90118
> > [ 5.600688] ath10k_pci 0000:01:00.0: htt-ver 3.47 wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1
> > [ 5.691843] ath: EEPROM regdomain: 0x0
> > [ 5.691845] ath: EEPROM indicates default country code should be used
> > [ 5.691846] ath: doing EEPROM country->regdmn map search
> > [ 5.691849] ath: country maps to regdmn code: 0x3a
> > [ 5.691850] ath: Country alpha2 being used: US
> > [ 5.691851] ath: Regpair used: 0x3a
> > [ 6.576740] ath10k_pci 0000:01:00.0 wlp1s0: renamed from wlan0
> > [ 7.403038] ath10k_pci 0000:01:00.0: Unknown eventid: 118809
> > [ 7.406042] ath10k_pci 0000:01:00.0: Unknown eventid: 90118
> > [ 184.060093] ath10k_pci 0000:01:00.0: Unknown eventid: 118809
> > [ 184.063109] ath10k_pci 0000:01:00.0: Unknown eventid: 90118
> > 
> > There is also a .zip files available https://www.killernetworking.com/killersupport/item/killer-drivers-inf which includes some .bin files for the QCA6174 (e.g. "qca61x4_1_1_2.bin" )
> > 
> > I am also not sure if it is exactly that Killer Card. How could I find out, which model it is exactly?
> > 
> > Also added this in the Ubuntu Bug Tracker, but I think it would be good to directly get it solved upstream.
> > 
> > If you need any help, terminal printouts, or testing something, please let me know.
> > 
> > best regards
> > 
> > Christian H.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
