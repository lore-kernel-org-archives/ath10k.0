Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh04.mail.saunalahti.fi ([62.142.5.110])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XAk5a-00042z-RD
 for ath10k@lists.infradead.org; Fri, 25 Jul 2014 18:19:31 +0000
Subject: [PATCH v4 0/2] ath10k spectral scan support
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Fri, 25 Jul 2014 21:19:05 +0300
Message-ID: <20140725181753.10809.84231.stgit@potku.adurom.net>
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
Cc: linux-wireless@vger.kernel.org

This is patchset iteration the ath10k spectral scan feature.

To view the samples, please have a look at the fft_eval tool [1] which
now supports both ath9k and ath10k formats.

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

[1] https://github.com/simonwunderlich/FFT_eval

v4:

* CPTCFG_ fixes
* rework spectral.c initialisation (ath10k_spectral_start() etc)
* only run a simple test

---

Simon Wunderlich (1):
      ath10k: add spectral scan feature

Sven Eckelmann (1):
      ath: Move spectral debugfs structs to shared header


 drivers/net/wireless/ath/ath10k/Kconfig    |    1 
 drivers/net/wireless/ath/ath10k/Makefile   |    1 
 drivers/net/wireless/ath/ath10k/core.c     |   10 
 drivers/net/wireless/ath/ath10k/core.h     |   11 +
 drivers/net/wireless/ath/ath10k/mac.c      |    8 
 drivers/net/wireless/ath/ath10k/spectral.c |  561 ++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/spectral.h |   90 ++++
 drivers/net/wireless/ath/ath10k/wmi.c      |  105 +++++
 drivers/net/wireless/ath/ath10k/wmi.h      |   97 +++++
 drivers/net/wireless/ath/ath9k/spectral.h  |   71 ----
 drivers/net/wireless/ath/spectral_common.h |  113 ++++++
 11 files changed, 998 insertions(+), 70 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath10k/spectral.c
 create mode 100644 drivers/net/wireless/ath/ath10k/spectral.h
 create mode 100644 drivers/net/wireless/ath/spectral_common.h


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
