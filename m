Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zlcfr-0006wO-QB
 for ath10k@lists.infradead.org; Mon, 12 Oct 2015 12:57:56 +0000
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: [PATCH v2 0/7] ath10k: add copy engine fast path support
Date: Mon, 12 Oct 2015 18:26:59 +0530
Message-ID: <1444654626-3290-1-git-send-email-rmanohar@qti.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, Rajkumar Manoharan <rmanohar@qti.qualcomm.com>

Below patchset adds fast path support for uplink traffic by bypassing
HTC layer processing. This is enabled by making use of unused copy
engine 5 to receive HTT messages directly from HIF layer. From initial
validation in VHT80/5G mode TCP UL is improved to 900Mbps from ~840Mbps
in conducted test.

-Rajkumar

v2:
 * fix invalid dma memory access (ATH10K_SKB_RXCB is used instead of
   ATH10K_SKB_CB in htt_tx_cb)
 * register either send_cb or recv_cb callback not both for
   appropriate CE.
 * Process CE 4 send completion first before processing rx
 
Rajkumar Manoharan (7):
  ath10k: export htc tx rx handlers
  ath10k: register per copy engine send completion callbacks
  ath10k: register per copy engine receive callbacks
  ath10k: export htt tx rx handlers
  ath10k: Configure copy engine 5 for HTT messages
  ath10k: remove unused dl_is_polled
  ath10k: remove htc polling for tx completion

 drivers/net/wireless/ath/ath10k/ce.c     |   8 +--
 drivers/net/wireless/ath/ath10k/ce.h     |   7 +-
 drivers/net/wireless/ath/ath10k/hif.h    |  26 +------
 drivers/net/wireless/ath/ath10k/htc.c    |  51 ++-----------
 drivers/net/wireless/ath/ath10k/htc.h    |   4 +-
 drivers/net/wireless/ath/ath10k/htt.h    |   1 +
 drivers/net/wireless/ath/ath10k/htt_rx.c |   1 +
 drivers/net/wireless/ath/ath10k/htt_tx.c |   6 ++
 drivers/net/wireless/ath/ath10k/pci.c    | 119 +++++++++++++++++++------------
 drivers/net/wireless/ath/ath10k/pci.h    |   2 -
 10 files changed, 98 insertions(+), 127 deletions(-)

-- 
2.6.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
