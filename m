Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh03.mail.saunalahti.fi ([62.142.5.109])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZjS68-0006z3-Dt
 for ath10k@lists.infradead.org; Tue, 06 Oct 2015 13:16:05 +0000
Subject: [PATCH 0/2] ath10k: implement board API 2 support
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Tue, 06 Oct 2015 16:15:39 +0300
Message-ID: <20151006131455.14278.28222.stgit@potku.adurom.net>
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

Implement board 2 API to make it easier to have multiple board files and
automatically choose correct one.

---

Manikanta Pubbisetty (2):
      ath10k: add board 2 API support
      ath10k: select board data based on BMI chip id and board id


 drivers/net/wireless/ath/ath10k/bmi.h   |   10 +
 drivers/net/wireless/ath/ath10k/core.c  |  328 +++++++++++++++++++++++++++----
 drivers/net/wireless/ath/ath10k/core.h  |   13 +
 drivers/net/wireless/ath/ath10k/debug.c |   16 +-
 drivers/net/wireless/ath/ath10k/hw.h    |   13 +
 drivers/net/wireless/ath/ath10k/pci.c   |   13 +
 6 files changed, 338 insertions(+), 55 deletions(-)


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
