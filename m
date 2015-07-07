Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZCW5h-0005QW-OR
 for ath10k@lists.infradead.org; Tue, 07 Jul 2015 16:51:30 +0000
From: Peter Oh <poh@qca.qualcomm.com>
Subject: [PATCH 0/3] ath10k: update data path to support QCA99X0
Date: Tue, 7 Jul 2015 09:47:53 -0700
Message-ID: <1436287676-25767-1-git-send-email-poh@qca.qualcomm.com>
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

This patch series update ath10k HTT Tx/Rx path to support
QCA99X0 chip and make it able to run data traffic on both of
Tx and Rx path.

Peter Oh (3):
  ath10k: update tx path to support QCA99X0
  ath10k: redefine rx_ppdu_end_common structure to cover qca99x0
  ath10k: add support for qca99x0 Rx descriptors

 drivers/net/wireless/ath/ath10k/htt.h     |  13 ++-
 drivers/net/wireless/ath/ath10k/htt_rx.c  |  24 ++--
 drivers/net/wireless/ath/ath10k/htt_tx.c  |  29 +++--
 drivers/net/wireless/ath/ath10k/rx_desc.h | 175 ++++++++++++++++++++++++++++--
 4 files changed, 212 insertions(+), 29 deletions(-)

-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
