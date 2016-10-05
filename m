Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x22c.google.com ([2a00:1450:400c:c09::22c])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1brrIU-0002Xy-73
 for ath10k@lists.infradead.org; Wed, 05 Oct 2016 18:52:07 +0000
Received: by mail-wm0-x22c.google.com with SMTP id b201so342166wmb.0
 for <ath10k@lists.infradead.org>; Wed, 05 Oct 2016 11:51:45 -0700 (PDT)
MIME-Version: 1.0
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 5 Oct 2016 20:51:23 +0200
Message-ID: <CAFBinCAuCfTeWw3SMVLbeARkUs_66YT6MJVbsd9QH_CqW9SCtg@mail.gmail.com>
Subject: Re: ath10k: device stops working ("failed to install key for vdev"
 error in kernel log)
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
To: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org

> [54064.293597] ath10k_pci 0000:02:00.0: failed to install key for vdev
> 0 peer [AP MAC addr]: -145
> [54064.301234] wlan0: failed to remove key (1, ff:ff:ff:ff:ff:ff) from
> hardware (-145)
> [54067.305703] ath10k_pci 0000:02:00.0: failed to install key for vdev
> 0 peer [AP MAC addr]: -145
> [54067.313307] wlan0: failed to set key (1, ff:ff:ff:ff:ff:ff) to
> hardware (-145)
it just happened again:
...
[130266.948005] ath10k_pci 0000:02:00.0: failed to install key for
vdev 0 peer [AP MAC address]: -145
[130266.955697] wlan0: failed to remove key (2, ff:ff:ff:ff:ff:ff)
from hardware (-145)
[130269.964069] ath10k_pci 0000:02:00.0: failed to install key for
vdev 0 peer [AP MAC address]: -145
[130269.971775] wlan0: failed to set key (2, ff:ff:ff:ff:ff:ff) to
hardware (-145)
[172198.889700] ath10k_pci 0000:02:00.0: failed to send pdev bss chan
info request
[172201.897770] ath10k_pci 0000:02:00.0: failed to send pdev bss chan
info request

I tried to get more information from the firmware by looking at the
fw_* debugfs files:
# cat /sys/kernel/debug/ieee80211/phy0/ath10k/fw_reset_stats
fw_crash_counter                0
fw_warm_reset_counter           4
fw_cold_reset_counter           0
# cat /sys/kernel/debug/ieee80211/phy0/ath10k/fw_stats
cat: can't open '/sys/kernel/debug/ieee80211/phy0/ath10k/fw_stats':
Resource temporarily unavailable
# cat /sys/kernel/debug/ieee80211/phy0/ath10k/fw_crash_dump
cat: can't open
'/sys/kernel/debug/ieee80211/phy0/ath10k/fw_crash_dump': No data
available
# cat /sys/kernel/debug/ieee80211/phy0/ath10k/fw_dbglog
0x00000000 0
# cat /sys/kernel/debug/ieee80211/phy0/ath10k/fw_checksums
firmware-N.bin          9d340dd9
athwlan                 8d25deed
otp                     f3efeb4f
codeswap                00000000
board-N.bin             bebc7c08
board                   bebc7c08

This is still with firmware 10.2.4.70.54.
Please let me know if you need further information.


Regards,
Martin

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
