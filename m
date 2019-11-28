Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-56.smtp-out.us-west-2.amazonses.com ([54.240.27.56])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iaH4V-0007Rn-AM
 for ath10k@lists.infradead.org; Thu, 28 Nov 2019 10:30:52 +0000
From: Wen Gong <wgong@codeaurora.org>
Subject: [PATCH v8 0/4] ath10k: improve throughout of TX of sdio
Date: Thu, 28 Nov 2019 10:30:48 +0000
Message-ID: <0101016eb19035ea-74bf2162-2007-43fb-a070-ff9e30de6cf9-000000@us-west-2.amazonses.com>
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

v8: split out patch "change ATH10K_SDIO_BUS_REQUEST_MAX_NUM from 64 to 1024"
from "disable TX complete indication of htt for sdio". merge patch
"ath10k: clean bundle tx queue of htt tx stop for sdio" into
"add htt TX bundle for sdio"

v7: change a few code style to meet ath10k-check script

v6: remove module parameters disable_tx_comp and alt_data
this is 3 patches of the 7 patches from ath10k: improve throughout of tcp/udp TX/RX of sdio

v5: change ath10k_htc_setup_tx_req to add check bundle_tx
to forbidden init 2 times

v4: add macro ATH10K_HTC_MSG_READY_EXT_ALT_DATA_MASK

v3: change some code style

v2: change some code style

The bottleneck of throughout on sdio chip is the bus bandwidth, to the
patches are all to increase the use ratio of sdio bus.

These patches only affect sdio bus chip, explanation is mentioned in each
patch's commit log.

Wen Gong (4):
  ath10k: disable TX complete indication of htt for sdio
  ath10k: change ATH10K_SDIO_BUS_REQUEST_MAX_NUM from 64 to 1024
  ath10k: add htt TX bundle for sdio
  ath10k: enable alt data of TX path for sdio

 drivers/net/wireless/ath/ath10k/core.c   |  27 +-
 drivers/net/wireless/ath/ath10k/core.h   |   4 +-
 drivers/net/wireless/ath/ath10k/hif.h    |   9 +
 drivers/net/wireless/ath/ath10k/htc.c    | 394 +++++++++++++++++++++--
 drivers/net/wireless/ath/ath10k/htc.h    |  40 ++-
 drivers/net/wireless/ath/ath10k/htt.c    |  13 +
 drivers/net/wireless/ath/ath10k/htt.h    |  17 +-
 drivers/net/wireless/ath/ath10k/htt_rx.c |  35 +-
 drivers/net/wireless/ath/ath10k/htt_tx.c |  39 ++-
 drivers/net/wireless/ath/ath10k/hw.h     |   2 +-
 drivers/net/wireless/ath/ath10k/sdio.c   |  23 ++
 drivers/net/wireless/ath/ath10k/sdio.h   |   3 +-
 12 files changed, 553 insertions(+), 53 deletions(-)

-- 
2.23.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
