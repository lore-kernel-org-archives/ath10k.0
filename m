Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh02.mail.saunalahti.fi ([62.142.5.108])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a1aH8-0002E7-Lx
 for ath10k@lists.infradead.org; Wed, 25 Nov 2015 13:38:23 +0000
Subject: [PATCH 0/6] ath10k: print crc32 checksum
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Wed, 25 Nov 2015 15:37:56 +0200
Message-ID: <20151125133654.25507.10863.stgit@potku.adurom.net>
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

Print crc32 checksum for firmware and board files. Also some improvements how
we print info messages during boot.

---

Kalle Valo (6):
      ath10k: fix otp board id error message
      ath10k: reorganise hardware and firmware info messages
      ath10k: always show bmi chip ids and subdevice ids
      ath10k: split driver info messages during device initialisation
      ath10k: print crc32 checksums for firmware and board files
      ath10k: implement fw_checksums debugfs file


 drivers/net/wireless/ath/ath10k/Kconfig |    1 
 drivers/net/wireless/ath/ath10k/core.c  |    8 ++
 drivers/net/wireless/ath/ath10k/debug.c |  119 ++++++++++++++++++++++++++-----
 drivers/net/wireless/ath/ath10k/debug.h |    4 +
 4 files changed, 111 insertions(+), 21 deletions(-)


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
