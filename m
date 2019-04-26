Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJuXt-0007XT-AQ
 for ath10k@lists.infradead.org; Fri, 26 Apr 2019 06:41:18 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 0/5] ath10k: implement PN replay protection for SDIO
Date: Fri, 26 Apr 2019 09:41:06 +0300
Message-Id: <1556260871-2919-1-git-send-email-kvalo@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org

HTT High Latency devices (SDIO and USB) need PN replay protection in
host driver, implemented in this patchset. Also support for QCA6174
hw3.2 SDIO devices is enabled as now all the necessary pieces have now
been implemented.

For replay protection of TKIP, CCMP and GCMP
ath10k_htt_rx_pn_check_replay_hl() will check PN to see if the frame
is received before. This is implemented in patch "ath10k: add PN
replay protection for high latency devices"

The replay protection on fragmented MSDU with CCMP and GCMP is done by
ath10k_htt_rx_proc_rx_frag_ind_hl(), implemented in patch "ath10k: add
fragment packet handler for high latency". The fragments will be
reassembled by mac80211 in ieee80211_rx_h_defragment(). Also mac80211
will verify the Michael MIC in ieee80211_rx_h_michael_mic_verify().

Tested with QCA6174 SDIO with firmware WLAN.RMH.4.4.1-00007-QCARMSWP-1.

Wen Gong (5):
  ath10k: add struct for high latency PN replay protection
  ath10k: add handler for HTT_T2H_MSG_TYPE_SEC_IND event
  ath10k: add PN replay protection for high latency devices
  ath10k: add fragmentation handler for high latency devices
  ath10k: enable QCA6174 hw3.2 SDIO hardware

 drivers/net/wireless/ath/ath10k/core.c   |  27 +++
 drivers/net/wireless/ath/ath10k/core.h   |   8 +
 drivers/net/wireless/ath/ath10k/htt.h    |  56 ++++-
 drivers/net/wireless/ath/ath10k/htt_rx.c | 373 ++++++++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath10k/hw.h     |   1 +
 drivers/net/wireless/ath/ath10k/sdio.c   |   2 +-
 6 files changed, 460 insertions(+), 7 deletions(-)

-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
