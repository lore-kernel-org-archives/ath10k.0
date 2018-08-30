Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fvCii-0006X1-SD
 for ath10k@lists.infradead.org; Thu, 30 Aug 2018 02:30:06 +0000
From: Carl Huang <cjhuang@codeaurora.org>
Subject: [PATCH 0/3] ath10k: download firmware via diag ce for qca6174 and
 qca9377
Date: Thu, 30 Aug 2018 10:29:39 +0800
Message-Id: <1535596182-18038-1-git-send-email-cjhuang@codeaurora.org>
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

Downloading firmware via diag ce can greatly reduce the downloading
time to ~40ms from ~500ms for a 700k bytes firmware.

Carl Huang (3):
  ath10k: optimize pci diag mem read & write operations
  ath10k: support to access target space below 1M for qca6174 and
    qca9377
  ath10k: download firmware via diag Copy Engine for QCA6174 and
    QCA9377.

 drivers/net/wireless/ath/ath10k/bmi.c  |  23 ++++
 drivers/net/wireless/ath/ath10k/bmi.h  |  31 ++++++
 drivers/net/wireless/ath/ath10k/core.c |  36 +++++--
 drivers/net/wireless/ath/ath10k/hw.c   | 185 +++++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/hw.h   |  19 ++++
 drivers/net/wireless/ath/ath10k/pci.c  |  59 +++++++----
 drivers/net/wireless/ath/ath10k/pci.h  |   3 +-
 7 files changed, 329 insertions(+), 27 deletions(-)

-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
