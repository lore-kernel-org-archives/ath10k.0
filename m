Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from packetmixer.de ([2001:4d88:2000:24::c0de]
 helo=mail.mail.packetmixer.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X9Cly-0000DJ-0u
 for ath10k@lists.infradead.org; Mon, 21 Jul 2014 12:32:55 +0000
From: Simon Wunderlich <sw@simonwunderlich.de>
Subject: [PATCHv2 0/2] ath10k spectral scan support
Date: Mon, 21 Jul 2014 14:32:21 +0200
Message-Id: <1405945943-8303-1-git-send-email-sw@simonwunderlich.de>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org
Cc: mathias.kretschmer@fokus.fraunhofer.de, kgiori@qca.qualcomm.com, linux-wireless@vger.kernel.org, sven@narfation.org, Simon Wunderlich <sw@simonwunderlich.de>

This is the second "PATCH" patchset iteration for the ath10k spectral
scan feature. It includes a few cosmetic changes and now handles
firmware crashes (Thanks Michal and Chun-Yeow!).

The fft_eval tool has also been updated based on the new patchset, and
now supports both ath9k and ath10k sample formats in the same branch,
which has been merged into master [1]. Please make sure to use the
latest version of both fft_eval and this patchset for testing.

The count issue is still open: Even when a count is specified, the
hardware seems to send endless samples. It seems to work most of the
time in VHT80 mode though, but in HT20 and HT40 the count value seems
to be ignored. To reproduce this, start hostapd with the desired
channel width and do:

echo 8 > /sys/kernel/debug/ieee80211/phy0/ath10k/spectral_count
echo manual > /sys/kernel/debug/ieee80211/phy0/ath10k/spectral_scan_ctl
echo trigger > /sys/kernel/debug/ieee80211/phy0/ath10k/spectral_scan_ctl
cat /sys/kernel/debug/ieee80211/phy0/ath10k/spectral_scan0 >> /tmp/fft.dump

Repeating the last line and checking the filesize will easily show
whether ath10k still sends samples or not. We would expect 8 samples in
this configuration.

See the patch for more information on the changes.

Cheers,
	Simon

[1] https://github.com/simonwunderlich/FFT_eval

Simon Wunderlich (1):
  ath10k: add spectral scan feature

Sven Eckelmann (1):
  ath: Move spectral debugfs structs to shared header

 drivers/net/wireless/ath/ath10k/Kconfig    |   1 +
 drivers/net/wireless/ath/ath10k/Makefile   |   3 +-
 drivers/net/wireless/ath/ath10k/core.c     |   4 +
 drivers/net/wireless/ath/ath10k/core.h     |   8 +
 drivers/net/wireless/ath/ath10k/debug.c    |   3 +
 drivers/net/wireless/ath/ath10k/mac.c      |   9 +
 drivers/net/wireless/ath/ath10k/spectral.c | 563 +++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/spectral.h |  64 ++++
 drivers/net/wireless/ath/ath10k/wmi.c      | 104 +++++-
 drivers/net/wireless/ath/ath10k/wmi.h      |  94 +++++
 drivers/net/wireless/ath/ath9k/spectral.h  |  71 +---
 drivers/net/wireless/ath/spectral_common.h | 112 ++++++
 12 files changed, 965 insertions(+), 71 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath10k/spectral.c
 create mode 100644 drivers/net/wireless/ath/ath10k/spectral.h
 create mode 100644 drivers/net/wireless/ath/spectral_common.h

-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
