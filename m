Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh01.mail.saunalahti.fi ([62.142.5.107])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VGmDe-0001Kv-08
 for ath10k@lists.infradead.org; Tue, 03 Sep 2013 08:44:15 +0000
Subject: [PATCH 0/3] ath10k: HTT stats
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Tue, 03 Sep 2013 11:43:48 +0300
Message-ID: <20130903084302.26199.3538.stgit@localhost6.localdomain6>
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

Adds trace events and a debugfs interface to enable HTT stats
from firmware.

---

Kalle Valo (3):
      ath10k: add trace event ath10k_htt_stats
      ath10k: implement ath10k_debug_start/stop()
      ath10k: add htt_stats_enable debugfs file


 drivers/net/wireless/ath/ath10k/core.c   |    6 +
 drivers/net/wireless/ath/ath10k/core.h   |    3 +
 drivers/net/wireless/ath/ath10k/debug.c  |  121 ++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/debug.h  |   11 +++
 drivers/net/wireless/ath/ath10k/htt.h    |    1 
 drivers/net/wireless/ath/ath10k/htt_rx.c |    5 +
 drivers/net/wireless/ath/ath10k/htt_tx.c |   42 ++++++++++
 drivers/net/wireless/ath/ath10k/trace.h  |   21 +++++
 8 files changed, 209 insertions(+), 1 deletion(-)


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
