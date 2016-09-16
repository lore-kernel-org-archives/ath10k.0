Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mout.gmx.net ([212.227.17.20])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bkrfP-0007n0-Av
 for ath10k@lists.infradead.org; Fri, 16 Sep 2016 11:50:52 +0000
Received: from [192.168.2.106] ([93.204.160.61]) by mail.gmx.com (mrgmx101)
 with ESMTPSA (Nemesis) id 0Metpl-1bMIXK3u6T-00OTOB for
 <ath10k@lists.infradead.org>; Fri, 16 Sep 2016 13:50:27 +0200
From: Daniel Holz <daniel.holz91@gmx.de>
Subject: Re: QCA6174 Performance
Message-ID: <b2cce290-ab6b-fdcb-56b0-92cff4da78df@gmx.de>
Date: Fri, 16 Sep 2016 13:50:27 +0200
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

The md5sum matches.


I installed Kernel 4.8 from Ubuntu's mainline ppa to get the recent 
version of ath10k which increased the performance, but it's still pretty 
low.

Here is the output of dmesg with kernel 4.8:

dmesg | grep -i ath10k
[    9.264413] ath10k_pci 0000:02:00.0: pci irq msi oper_irq_mode 2 
irq_mode 0 reset_mode 0
[    9.544276] ath10k_pci 0000:02:00.0: Direct firmware load for 
ath10k/pre-cal-pci-0000:02:00.0.bin failed with error -2
[    9.544292] ath10k_pci 0000:02:00.0: Direct firmware load for 
ath10k/cal-pci-0000:02:00.0.bin failed with error -2
[    9.546101] ath10k_pci 0000:02:00.0: qca6174 hw2.1 target 0x05010000 
chip_id 0x003405ff sub 17aa:3044
[    9.546105] ath10k_pci 0000:02:00.0: kconfig debug 0 debugfs 0 
tracing 0 dfs 0 testmode 0
[    9.547303] ath10k_pci 0000:02:00.0: firmware ver 
SW_RM.1.1.1-00157-QCARMSWPZ-1 api 5 features ignore-otp,no-4addr-pad 
crc32 10bf8e08
[    9.613313] ath10k_pci 0000:02:00.0: board_file api 2 bmi_id N/A 
crc32 ae2e275a
[   10.813664] ath10k_pci 0000:02:00.0: htt-ver 3.1 wmi-op 4 htt-op 3 
cal otp max-sta 32 raw 0 hwcrypto 1
[   10.902302] ath10k_pci 0000:02:00.0 wlp2s0: renamed from wlan0
[   26.617451] ath10k_pci 0000:02:00.0: no channel configured; ignoring 
frame(s)!


Daniel Holz

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
