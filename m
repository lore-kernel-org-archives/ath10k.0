Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iD3Jw-0001iH-Ol
 for ath10k@lists.infradead.org; Wed, 25 Sep 2019 09:10:50 +0000
From: Wen Gong <wgong@codeaurora.org>
Subject: [PATCH v6 0/3] ath10k: improve throughout of RX of sdio
Date: Wed, 25 Sep 2019 17:10:36 +0800
Message-Id: <1569402639-31720-1-git-send-email-wgong@codeaurora.org>
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

v6: change code style, change commit log to add test value of RX, use sk_buff_head to replace the rx queue
this is 3 patches of the 7 patches from ath10k: improve throughout of tcp/udp TX/RX of sdio

v5: no change

v4: add err handle in ath10k_sdio_mbox_rx_fetch_bundle, change commit log

v3: change some code style
split fix incorrect skb tail of rx bundle to patch "adjust skb length in ath10k_sdio_mbox_rx_packet"

v2: fix incorrect skb tail of rx bundle in ath10k_sdio_mbox_rx_process_packet, change macro HTC_GET_BUNDLE_COUNT

The bottleneck of throughout on sdio chip is the bus bandwidth, to the
patches are all to increase the use ratio of sdio bus.

These patches only affect sdio bus chip, explanation is mentioned in each
patch's commit log.

Alagu Sankar (1):
  ath10k: enable RX bundle receive for sdio

Wen Gong (2):
  ath10k: change max RX bundle size from 8 to 32 for sdio
  ath10k: add workqueue for RX path of sdio

 drivers/net/wireless/ath/ath10k/htc.h  |  12 ++-
 drivers/net/wireless/ath/ath10k/sdio.c | 147 +++++++++++++++++++++++----------
 drivers/net/wireless/ath/ath10k/sdio.h |  26 +++++-
 3 files changed, 134 insertions(+), 51 deletions(-)

-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
