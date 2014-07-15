Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from packetmixer.de ([2001:4d88:2000:24::c0de]
 helo=mail.mail.packetmixer.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X75lY-0000i2-1i
 for ath10k@lists.infradead.org; Tue, 15 Jul 2014 16:39:45 +0000
From: Simon Wunderlich <sw@simonwunderlich.de>
Subject: [RFC 0/2] ath10k spectral scan support
Date: Tue, 15 Jul 2014 18:32:44 +0200
Message-Id: <1405441966-32681-1-git-send-email-sw@simonwunderlich.de>
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

This is the first patchset iteration for review to implement the ath10k
spectral scan feature. The patchset is still experimental, but we were
able to detect our analogue 5.8 GHz TV repeater in the sample data. :)

As for ath9k, a proof of concept data plotter has been implemented, and
is currently available for ath10k in its own branch of FFT_eval [1].

There are a few open questions, and any help or pointers would be
appreciated:

 * so far, we could only enable endless mode (samples are sent
   endlessly). To prevent relayfs buffers overflowing because they are
   not read from userspace, it would be great to set a "count" to limit
   the number of samples sent after a trigger. That was possible in
   ath9k as well. However, if we set the "scan_count" parameter in the
   WMI command to something else than 0 (default), we don't get any
   samples at all. Is there any other configuration which needs to be
   done to get a limited number of samples?
 * So far, we always get 64 bins of fft data in the samples, even if we
   are in HT40 or VHT80 mode. That doesn't seem right, as there should
   be more bins for wider channels (e.g. 128 or 256 bins). Is there any
   parameter to change in the configuration to get the output from
   multiple channels / higher bandwidth?

Kudos to Kalle and Michal for their help to get this started. :)

Cheers,
     Simon

[1] https://github.com/simonwunderlich/FFT_eval/tree/ath10k_wip

Sven Eckelmann (2):
  ath: Move spectral debugfs structs to shared header
  ath10k: add spectral scan feature

 drivers/net/wireless/ath/ath10k/Kconfig    |   1 +
 drivers/net/wireless/ath/ath10k/Makefile   |   3 +-
 drivers/net/wireless/ath/ath10k/core.h     |   6 +
 drivers/net/wireless/ath/ath10k/debug.c    |   3 +
 drivers/net/wireless/ath/ath10k/spectral.c | 368 +++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/spectral.h |  66 ++++++
 drivers/net/wireless/ath/ath10k/wmi.c      |  98 +++++++-
 drivers/net/wireless/ath/ath10k/wmi.h      |  80 +++++++
 drivers/net/wireless/ath/ath9k/spectral.h  |  71 +-----
 drivers/net/wireless/ath/spectral_common.h | 108 +++++++++
 10 files changed, 733 insertions(+), 71 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath10k/spectral.c
 create mode 100644 drivers/net/wireless/ath/ath10k/spectral.h
 create mode 100644 drivers/net/wireless/ath/spectral_common.h

-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
