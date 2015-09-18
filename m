Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZcqZJ-00020n-IO
 for ath10k@lists.infradead.org; Fri, 18 Sep 2015 07:58:53 +0000
Subject: [PATCH 0/2] ath10k: implement debugfs interface for Transmit Power
 Control stats
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Fri, 18 Sep 2015 10:58:22 +0300
Message-ID: <20150918075706.6983.11216.stgit@potku.adurom.net>
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

This implements a simple interface for debugging TPC stats. I did a small hack
to sparse to check endian usage with signed 32 bit values.

---

Kalle Valo (1):
      ath10k: add a_sle32_to_cpu()

Maharaja Kennadyrajan (1):
      ath10k: implement debugfs interface for Transmit Power Control stats


 drivers/net/wireless/ath/ath10k/core.h    |   29 +++
 drivers/net/wireless/ath/ath10k/debug.c   |  233 +++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/debug.h   |    8 +
 drivers/net/wireless/ath/ath10k/wmi-ops.h |   19 ++
 drivers/net/wireless/ath/ath10k/wmi.c     |  269 +++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi.h     |   36 ++++
 6 files changed, 592 insertions(+), 2 deletions(-)


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
