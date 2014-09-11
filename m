Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh02.mail.saunalahti.fi ([62.142.5.108])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XSB27-0003iE-2k
 for ath10k@lists.infradead.org; Thu, 11 Sep 2014 20:31:59 +0000
Received: from potku.adurom.net (a91-155-131-35.elisa-laajakaista.fi
 [91.155.131.35])
 by emh02.mail.saunalahti.fi (Postfix) with ESMTP id 593208189F
 for <ath10k@lists.infradead.org>; Thu, 11 Sep 2014 23:31:36 +0300 (EEST)
Subject: [RFC PATCH 0/3] ath10k: export calibration data to user space
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Thu, 11 Sep 2014 23:31:32 +0300
Message-ID: <20140911202926.12514.79908.stgit@potku.adurom.net>
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

Hi,

here's a small patchset exporting firmware calibration data to user space. This
makes it easier to debug various calibration data related problems. The first
patch is more or less a hack, not sure how to do that properly.

Please comment.

---

Kalle Valo (3):
      ath10k: ignore diagnose pipes in ath10k_pci_ce_recv_data()/_send_done()
      ath10k: add diag_read() to hif ops
      ath10k: add cal_data debugfs file


 drivers/net/wireless/ath/ath10k/debug.c |   81 +++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/hif.h   |   10 ++++
 drivers/net/wireless/ath/ath10k/hw.h    |    2 +
 drivers/net/wireless/ath/ath10k/pci.c   |   14 +++++
 4 files changed, 107 insertions(+)


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
