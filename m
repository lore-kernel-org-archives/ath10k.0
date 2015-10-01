Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh03.mail.saunalahti.fi ([62.142.5.109])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZhbS3-000604-T5
 for ath10k@lists.infradead.org; Thu, 01 Oct 2015 10:51:05 +0000
Subject: [PATCH 0/6] ath10k: few checkpatch fixes
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Thu, 01 Oct 2015 13:50:38 +0300
Message-ID: <20151001105001.8770.96252.stgit@potku.adurom.net>
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

I found few checkpatch warnings and fixed those. All trivial.

---

Kalle Valo (6):
      ath10k: fix checkpatch warning about logical continuations
      ath10k: indentation fixes
      ath10k: brace style fixes
      ath10k: remove void function return statements
      ath10k: fix whitespace usage
      ath10k: split an unnecessary long line


 drivers/net/wireless/ath/ath10k/core.c   |   15 +++++++--------
 drivers/net/wireless/ath/ath10k/htt_tx.c |    8 ++++----
 drivers/net/wireless/ath/ath10k/mac.c    |   16 +++++++++-------
 drivers/net/wireless/ath/ath10k/pci.c    |    3 ++-
 drivers/net/wireless/ath/ath10k/wmi.c    |    4 +---
 5 files changed, 23 insertions(+), 23 deletions(-)


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
