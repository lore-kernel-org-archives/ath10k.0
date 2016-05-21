Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b47kl-00056Y-87
 for ath10k@lists.infradead.org; Sat, 21 May 2016 14:19:43 +0000
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 7E20E20899
 for <ath10k@lists.infradead.org>; Sat, 21 May 2016 10:19:22 -0400 (EDT)
Received: from [127.0.0.1] (p5b37e9a1.dip0.t-ipconnect.de [91.55.233.161])
 by mail.messagingengine.com (Postfix) with ESMTPA id 18ABB68014B
 for <ath10k@lists.infradead.org>; Sat, 21 May 2016 10:19:21 -0400 (EDT)
From: The Dark Avenger <darkavenger@fastmail.fm>
Subject: DFS fails with QCA6174 and QCA9377
Message-ID: <57406E68.6010906@fastmail.fm>
Date: Sat, 21 May 2016 16:19:20 +0200
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

Hello,

I'm currently trying to set-up an AP in the 5 GHz band. I have a QCA6174 
(Killer 1525) and a QCA9377 adapter at hand.

Unfortunately, while both cards work otherwise well, e.g. I can create 
an AP in the 2.4 GHz range, ACS works,  anything requiring DFS fails:
 >hostapd v. 2.5:
-----
wlp4s0: DFS-CAC-START freq=5580 chan=116 sec_chan=1, width=1, seg0=122, 
seg1=0, cac_time=60s
nl80211: Start radar detection (CAC) 5580 MHz (ht_enabled=1, 
vht_enabled=1, bandwidth=80 MHz, cf1=5610 MHz, cf2=0 MHz)
nl80211: Failed to start radar detection: -16 (Device or resource busy)
DFS start_dfs_cac() failed, -1
-----
Needless to say that the same thing happens on other channel, too, and 
that there're no channels requiring no DFS.
iw list
-----
...
* 5240 MHz [48] (20.0 dBm) (no IR)
* 5260 MHz [52] (20.0 dBm) (no IR, radar detection)
                           DFS state: usable (for 607 sec)
                           DFS CAC time: 60000 ms
                       ...
* 5700 MHz [140] (26.0 dBm) (no IR, radar detection)
                           DFS state: usable (for 607 sec)
                           DFS CAC time: 60000 ms
* 5720 MHz [144] (disabled)
...
------
I compiled kernel 4.5.3 with DFS support, as seems to be confirmed by 
dmesg (see dfs 1):
-----
[    6.020482] ath10k_pci 0000:04:00.0: firmware: direct-loading 
firmware ath10k/QCA6174/hw2.1/firmware-5.bin
[    6.020500] ath10k_pci 0000:04:00.0: qca6174 hw2.1 target 0x05010000 
chip_id 0x003405ff sub 1a56:1525
[    6.020505] ath10k_pci 0000:04:00.0: kconfig debug 0 debugfs 0 
tracing 0 dfs 1 testmode 0
[    6.021159] ath10k_pci 0000:04:00.0: firmware ver 
SW_RM.1.1.1-00157-QCARMSWPZ-1 api 5 features ignore-otp,no-4addr-pad 
crc32 10bf8e08
[    6.128659] ath10k_pci 0000:04:00.0: firmware: direct-loading 
firmware ath10k/QCA6174/hw2.1/board-2.bin
[    6.129021] ath10k_pci 0000:04:00.0: board_file api 2 bmi_id N/A 
crc32 ae2e275a
[    7.331373] ath10k_pci 0000:04:00.0: htt-ver 3.1 wmi-op 4 htt-op 3 
cal otp max-sta 32 raw 0 hwcrypto 1
-----
For completeness iw get reg
-----
country DE: DFS-ETSI
         (2400 - 2483 @ 40), (N/A, 20), (N/A)
         (5150 - 5250 @ 80), (N/A, 20), (N/A), NO-OUTDOOR
         (5250 - 5350 @ 80), (N/A, 20), (0 ms), NO-OUTDOOR, DFS
         (5470 - 5725 @ 160), (N/A, 26), (0 ms), DFS
         (57000 - 66000 @ 2160), (N/A, 40), (N/A)
-----
The only thing that worries me is that "iw list" does not report any 
"radar detect widths".|.
|So, I am somewhat clueless where the problem lies.  Is it driver, 
firmware, or something else?

Thanks

Roland

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
