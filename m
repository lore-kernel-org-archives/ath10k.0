Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5pA7-000640-Sn
 for ath10k@lists.infradead.org; Thu, 05 Sep 2019 10:38:49 +0000
From: Wen Gong <wgong@codeaurora.org>
Subject: [PATCH v5 0/8] ath10k: improve throughout of tcp/udp TX/RX of sdio
Date: Thu,  5 Sep 2019 18:38:05 +0800
Message-Id: <1567679893-14029-1-git-send-email-wgong@codeaurora.org>
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

The bottleneck of throughout on sdio chip is the bus bandwidth, to the
patches are all to increase the use ratio of sdio bus.

                      udp-rx    udp-tx    tcp-rx    tcp-tx
without patches(Mbps)  320        180       170       151
with patches(Mbps)     450        410       400       320

These patches only affect sdio bus chip, explanation is mentioned in each
patch's commit log.

Alagu Sankar (1):
  ath10k: enable RX bundle receive for sdio
v2: fix incorrect skb tail of rx bundle in ath10k_sdio_mbox_rx_process_packet
v3: change some code style
split fix incorrect skb tail of rx bundle to patch "adjust skb length in ath10k_sdio_mbox_rx_packet"
v4: add err handle in ath10k_sdio_mbox_rx_fetch_bundle
v5: no change

Nicolas Boichat (1):
  ath10k: adjust skb length in ath10k_sdio_mbox_rx_packet
v2: no this patch
v3: new added
v4: change commit log
v5: no change

Wen Gong (6):
  ath10k: change max RX bundle size from 8 to 32 for sdio
v2: change macro HTC_GET_BUNDLE_COUNT
v3: change some code style
v4: add macro ATH10K_HTC_FLAG_BUNDLE_MASK
v5: no change

  ath10k: add workqueue for RX path of sdio
v2: no change
v3: change some code style
v4: no change
v5: no change

  ath10k: disable TX complete indication of htt for sdio
v2: change some code style
v3: change some code style
v4: no change
v5: no change

  ath10k: add htt TX bundle for sdio
v2: no change
v3: change some code style
v4: no change
v5: change ath10k_htc_setup_tx_req to add check bundle_tx
to forbidden init 2 times

  ath10k: enable alt data of TX path for sdio
v2: no change
v3: change some code style
v4: add macro ATH10K_HTC_MSG_READY_EXT_ALT_DATA_MASK
v5: no change

  ath10k: enable napi on RX path for sdio
v2: no change
v3: change some code style
v4: change some code style
v5: move skb_queue_head_init(&ar->htt.rx_indication_head)
from ath10k_htt_connect to ath10k_core_create to forbidden 
init 2 times

 drivers/net/wireless/ath/ath10k/core.c   |  44 +++-
 drivers/net/wireless/ath/ath10k/core.h   |   4 +-
 drivers/net/wireless/ath/ath10k/hif.h    |   9 +
 drivers/net/wireless/ath/ath10k/htc.c    | 378 ++++++++++++++++++++++++++++---
 drivers/net/wireless/ath/ath10k/htc.h    |  49 +++-
 drivers/net/wireless/ath/ath10k/htt.c    |  13 ++
 drivers/net/wireless/ath/ath10k/htt.h    |  20 +-
 drivers/net/wireless/ath/ath10k/htt_rx.c |  80 ++++++-
 drivers/net/wireless/ath/ath10k/htt_tx.c |  38 +++-
 drivers/net/wireless/ath/ath10k/hw.h     |   2 +-
 drivers/net/wireless/ath/ath10k/sdio.c   | 281 ++++++++++++++++++++---
 drivers/net/wireless/ath/ath10k/sdio.h   |  31 ++-
 12 files changed, 852 insertions(+), 97 deletions(-)

-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
