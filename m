Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s72.web-hosting.com ([198.187.29.22])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XsjVk-00059Y-Qi
 for ath10k@lists.infradead.org; Mon, 24 Nov 2014 02:36:21 +0000
From: Sujith Manoharan <sujith@msujith.org>
Subject: [PATCH 0/3] ath10k patches
Date: Mon, 24 Nov 2014 08:07:34 +0530
Message-Id: <1416796657-24657-1-git-send-email-sujith@msujith.org>
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

From: Sujith Manoharan <c_manoha@qca.qualcomm.com>

Fixes for WEP.

Sujith Manoharan (3):
  ath10k: Fix shared WEP
  ath10k: Fix locking for WEP keys
  ath10k: Fix bug reported by lockdep

 drivers/net/wireless/ath/ath10k/mac.c | 31 +++++++++++++++++++++++++++++--
 drivers/net/wireless/ath/ath10k/mac.h |  2 ++
 drivers/net/wireless/ath/ath10k/wmi.c | 33 +++++++++++++++++++++++++++++++++
 3 files changed, 64 insertions(+), 2 deletions(-)

-- 
2.1.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
