Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh06.mail.saunalahti.fi ([62.142.5.116])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XdZJa-0005sP-JV
 for ath10k@lists.infradead.org; Mon, 13 Oct 2014 06:41:07 +0000
Subject: [PATCH 0/3] ath10k: cal file support
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Mon, 13 Oct 2014 09:40:40 +0300
Message-ID: <20141013063929.30315.41969.stgit@potku.adurom.net>
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

Hi,

this adds support for loading calibration data from a file as discussed some
time ago. Please review.

Kalle

---

Kalle Valo (3):
      ath10k: add back enum ath10k_bus
      ath10k: refactor ath10k_init_download_firmware()
      ath10k: retrieve calibration data from file


 drivers/net/wireless/ath/ath10k/core.c  |  107 +++++++++++++++++++++++++------
 drivers/net/wireless/ath/ath10k/core.h  |   36 ++++++++++
 drivers/net/wireless/ath/ath10k/debug.c |    5 +
 drivers/net/wireless/ath/ath10k/hw.h    |    4 +
 drivers/net/wireless/ath/ath10k/pci.c   |    1 
 5 files changed, 129 insertions(+), 24 deletions(-)


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
