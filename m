Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp1.spirent.com ([38.111.148.215] helo=webmail.spirent.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXzta-00046I-HM
 for ath10k@lists.infradead.org; Wed, 09 Apr 2014 21:18:59 +0000
From: "Shu, Nick" <Nick.Shu@spirent.com>
Subject: ath10k driver and firmware upgrade
Date: Wed, 9 Apr 2014 21:18:35 +0000
Message-ID: <153F35912E69C446A72CF7D6417EBADE7CF57F@SPCCOREXCMBX01.AD.SPIRENTCOM.COM>
Content-Language: en-US
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
To: "kvalo@qca.qualcomm.com" <kvalo@qca.qualcomm.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hi, Kalle and all:
I have a question about upgrade the diver and firmware for my wifi ac pcie card.
I read through the docs in your /ath10k website and did the driver and firmware update.
After that, here is what I read back from system:

root@coast198:/home/spirent# ethtool -i wlan0
driver: ath10k_pci
version: 3.11.0-12-generic
firmware-version: 999.999.0.636
bus-info: 0000:03:00.0
supports-statistics: yes
supports-test: no
supports-eeprom-access: no
supports-register-dump: no
supports-priv-flags: no

So, I can see the firmware has been updated (I used firmware-2.bin_999.999.0.636 for STA, right?).
But how can I find out have drivers been changed?

I did following to change the driver:
1. Download the tarball from "backports-3.13.2-1" to my PC.
2. FTP it to my Linux box (test server running on Ubuntu 13.10 server).
3. Unpack it to my working directory.
4. Run "make defconfig-ath10k"
        "make"
        "make install".
5. But auto install failed because of some initramfs issue (no key? from error message), so I manually "rmmod" all drivers ( ath10k_pci.ko, ath10k_core.ko, mac80211.ko, ath.ko, cfg80211.ko, compat.ko) and then "Insmod" all drivers back.
6. Run "update-initramfs -u" and reboot.

Did I do everything correct?
I used "dhcpcd wlan0" to get a valid IP address from a Netgear wifiac ac access point, but from access point manager, the MAC for my card is still "00:03:07:12:34:56".
From your last email, you said this default MAC was caused by wrong driver and firmware, so why it's still there after I changed driver and firmware? Do I miss something?

Thank you!

Nick Shu


E-mail confidentiality.
--------------------------------
This e-mail contains confidential and / or privileged information belonging to Spirent Communications plc, its affiliates and / or subsidiaries. If you are not the intended recipient, you are hereby notified that any disclosure, copying, distribution and / or the taking of any action based upon reliance on the contents of this transmission is strictly forbidden. If you have received this message in error please notify the sender by return e-mail and delete it from your system.

Spirent Communications plc
Northwood Park, Gatwick Road, Crawley, West Sussex, RH10 9XN, United Kingdom.
Tel No. +44 (0) 1293 767676
Fax No. +44 (0) 1293 767677

Registered in England Number 470893
Registered at Northwood Park, Gatwick Road, Crawley, West Sussex, RH10 9XN, United Kingdom.

Or if within the US,

Spirent Communications,
26750 Agoura Road, Calabasas, CA, 91302, USA.
Tel No. 1-818-676- 2300

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
