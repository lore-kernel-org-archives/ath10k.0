Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sonic311-31.consmr.mail.ir2.yahoo.com ([77.238.176.163])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eNnX5-0004LF-FN
 for ath10k@lists.infradead.org; Sat, 09 Dec 2017 22:23:45 +0000
Received: from smtp170.mail.ir2.yahoo.com (EHLO uapou.localnet)
 ([46.228.39.37])
 by smtp415.mail.ir2.yahoo.com (JAMES SMTP Server ) with ESMTPA ID -2104427842
 for <ath10k@lists.infradead.org>;
 Sat, 09 Dec 2017 22:23:16 +0000 (UTC)
From: Paul Nuville <paulnuville@yahoo.fr>
Subject: "htt version request timed out" with the last 4.1.1.c1 firmware
Date: Sat, 09 Dec 2017 23:23:02 +0100
Message-ID: <4122842.1D0mIpT2Ae@uapou>
In-Reply-To: <2025478478.2725588.1512857709726@mail.yahoo.com>
References: <2025478478.2725588.1512857709726.ref@mail.yahoo.com>
 <2025478478.2725588.1512857709726@mail.yahoo.com>
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hello all,

I've installed Archlinux on a Samsung Galaxy Book 10.6", and I'm trying to set 
up the wifi. The only firmware that seems to be suitable is the lastest 4.1.1.c1 
one. But I've some errors and neither ip ad networkmanager are able to set up 
the wlan interface. 
Here are some outputs : 

# lspci -k
01:00.0 Network controller: Qualcomm Atheros QCA6174 802.11ac Wireless Network 
Adapter (rev 32)
        Subsystem: Samsung Electronics Co Ltd QCA6174 802.11ac Wireless 
Network Adapter
        Kernel modules: ath10k_pci

# lsmod | grep ath10k
ath10k_pci             53248  0
ath10k_core           356352  1 ath10k_pci
ath                    32768  1 ath10k_core
mac80211              827392  1 ath10k_core
cfg80211              647168  3 mac80211,ath,ath10k_core

# dmesg | grep ath10k
[ 1777.602748] ath10k_pci 0000:01:00.0: pci irq msi oper_irq_mode 2 irq_mode 0 
reset_mode 0
[ 1777.861498] ath10k_pci 0000:01:00.0: Direct firmware load for ath10k/pre-
cal-pci-0000:01:00.0.bin failed with error -2
[ 1777.861509] ath10k_pci 0000:01:00.0: Direct firmware load for ath10k/cal-
pci-0000:01:00.0.bin failed with error -2
[ 1777.861572] ath10k_pci 0000:01:00.0: invalid firmware magic
[ 1777.861587] ath10k_pci 0000:01:00.0: Direct firmware load for ath10k/
QCA6174/hw3.0/firmware-5.bin failed with error -2
[ 1777.861815] ath10k_pci 0000:01:00.0: qca6174 hw3.2 target 0x05030000 
chip_id 0x00340aff sub 144d:c150
[ 1777.861817] ath10k_pci 0000:01:00.0: kconfig debug 0 debugfs 1 tracing 0 dfs 
0 testmode 0
[ 1777.862589] ath10k_pci 0000:01:00.0: firmware ver WLAN.RM.2.0-00180-
QCARMSWPZ-1 api 4 features wowlan,ignore-otp,no-4addr-pad crc32 75dee6c5
[ 1777.926402] ath10k_pci 0000:01:00.0: failed to fetch board data for 
bus=pci,vendor=168c,device=003e,subsystem-vendor=144d,subsystem-device=c150 
from ath10k/QCA6174/hw3.0/board-2.bin
[ 1777.926428] ath10k_pci 0000:01:00.0: board_file api 1 bmi_id N/A crc32 
ed5f849a
[ 1781.596516] ath10k_pci 0000:01:00.0: htt version request timed out
[ 1781.596523] ath10k_pci 0000:01:00.0: failed to setup htt: -110
[ 1781.669496] ath10k_pci 0000:01:00.0: could not init core (-110)
[ 1781.669544] ath10k_pci 0000:01:00.0: could not probe fw (-110)

Any help will be apreciate ! 

Thank you in advance,

Paul 




_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
