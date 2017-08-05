Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from cock.li ([2a06:1700:0:b::c0cc])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ddriU-0006Cv-OI
 for ath10k@lists.infradead.org; Sat, 05 Aug 2017 05:33:40 +0000
MIME-Version: 1.0
Date: Sat, 05 Aug 2017 05:33:14 +0000
From: red2scratch@firemail.cc
Subject: ath10k support to monitor mode
Message-ID: <89bb20844fad4d5069f689d5a1f25a79@firemail.cc>
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

Thank you in advance for the work that you do.  Request your assistance 
for a clearer understanding on the capabilities of the ath10k.

* Does the ath10k currently support monitor mode?

* If not, is it s firmware limitation that cannot be enabled until the 
firmware includes it or is it a driver limitation in which monitor mode 
just has not been prioritized to be worked into the driver yet?

* Is it a hardware limitation based on my specific card, the QCA6174?

Reviewing the linux-wireless website, it is noted that the ath10k 
supports monitor mode:

https://wireless.wiki.kernel.org/en/users/drivers/ath10k/monitor

Meaning at least it has been supported in the past.  However my current 
configuration:
~~~~~~~~~~~~
Network:   Card-1: Qualcomm Atheros QCA6174 802.11ac Wireless Network 
Adapter
            driver: ath10k_pci

ath10k_pci 0000:06:00.0: qca6174 hw3.2 target 0x05030000 chip_id 
0x00340aff sub 1a56:1535
ath10k_pci 0000:06:00.0: kconfig debug 0 debugfs 0 tracing 0 dfs 0 
testmode 0
ath10k_pci 0000:06:00.0: firmware ver WLAN.RM.4.4-00022-QCARMSWPZ-2 api 
5 features wowlan,ignore-otp crc32 4d458559
ath10k_pci 0000:06:00.0: firmware: direct-loading firmware 
ath10k/QCA6174/hw3.0/board-2.bin
ath10k_pci 0000:06:00.0: board_file api 2 bmi_id N/A crc32 07ee144e
ath10k_pci 0000:06:00.0: htt-ver 3.32 wmi-op 4 htt-op 3 cal otp max-sta 
32 raw 0 hwcrypto 1
~~~~~~~~~~~~~~

does not seem to support monitor mode as I get no data when attempting 
to place it in monitor mode.

I have seen similar requests/problems with others having the same card 
on other websites wanting to place into monitor mode as well.

Appreciate any assistance to help me understand the problem.  Thank you 
in advance.

V/R

Rett

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
