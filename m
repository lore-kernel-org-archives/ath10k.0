Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eMDJP-0002ue-6y
 for ath10k@lists.infradead.org; Tue, 05 Dec 2017 13:31:15 +0000
From: <akolli@qti.qualcomm.com>
Subject: [PATCHv2 0/3] ath10k: tx stats for 10.2.4 
Date: Tue, 5 Dec 2017 19:01:22 +0530
Message-ID: <1512480685-28471-1-git-send-email-akolli@qti.qualcomm.com>
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
Cc: Anilkumar Kolli <akolli@qti.qualcomm.com>, akolli@codeaurora.org, linux-wireless@vger.kernel.org

From: Anilkumar Kolli <akolli@qti.qualcomm.com>

Add tx stats supoort for QCA988X.
Parse peer stats from pktlog packets and update the tx rate
information per STA.
This way user space can query about transmit rate with iw.

V2:
  - Added  patch ath10k: remove MAC80211_DEBUGFS dependency on ath10k_sta_statistics
  - No other changes
 
Anilkumar Kolli (3):
  ath10k: remove MAC80211_DEBUGFS dependency on ath10k_sta_statistics
  ath10k: move pktlog_filter out of ath10k_debug
  ath10k: add per peer tx stats support for 10.2.4

 drivers/net/wireless/ath/ath10k/core.h        |    4 +-
 drivers/net/wireless/ath/ath10k/debug.c       |   16 +++----
 drivers/net/wireless/ath/ath10k/debug.h       |   21 +++++++--
 drivers/net/wireless/ath/ath10k/debugfs_sta.c |   27 -----------
 drivers/net/wireless/ath/ath10k/htt.h         |   17 +++++++
 drivers/net/wireless/ath/ath10k/htt_rx.c      |   60 +++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/mac.c         |   40 ++++++++++++++++-
 7 files changed, 143 insertions(+), 42 deletions(-)

-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
