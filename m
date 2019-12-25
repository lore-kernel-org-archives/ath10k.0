Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail25.static.mailgun.info ([104.130.122.25])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ik5LN-0004NR-Tp
 for ath10k@lists.infradead.org; Wed, 25 Dec 2019 12:00:52 +0000
From: Wen Gong <wgong@codeaurora.org>
Subject: [PATCH v2 0/2] start recovery process when payload length overflow
 for sdio
Date: Wed, 25 Dec 2019 20:00:00 +0800
Message-Id: <20191225120002.11163-1-wgong@codeaurora.org>
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

when it happened payload length exceeds max htc length, start recovery process

v2: add "add refcount for ath10k_core_restart" and remove ar_sdio->can_recovery

Wen Gong (2):
  ath10k: add refcount for ath10k_core_restart
  ath10k: start recovery process when payload length exceeds max htc
    length for sdio

 drivers/net/wireless/ath/ath10k/core.c | 8 ++++++++
 drivers/net/wireless/ath/ath10k/core.h | 2 ++
 drivers/net/wireless/ath/ath10k/mac.c  | 1 +
 drivers/net/wireless/ath/ath10k/sdio.c | 6 ++++++
 4 files changed, 17 insertions(+)

-- 
2.23.0

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
