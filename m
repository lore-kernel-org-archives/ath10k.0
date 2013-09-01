Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh06.mail.saunalahti.fi ([62.142.5.116])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VG1fS-0007dE-9c
 for ath10k@lists.infradead.org; Sun, 01 Sep 2013 07:01:51 +0000
Subject: [PATCH v2 0/7] ath10k: pci cleanup
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Sun, 01 Sep 2013 10:01:24 +0300
Message-ID: <20130901070020.14695.16694.stgit@localhost6.localdomain6>
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

Small PCI related code cleanup. Depends on Michal's CE
clean patchset.

v2:

o remove unnecessary cast in patch 3 (from Gabor)

---

Kalle Valo (7):
      ath10k: pci: make host_ce_config_wlan[] more readable
      ath10k: make target_ce_config_wlan more readable
      ath10k: remove void pointer from struct ath10k_pci_compl
      ath10k: convert ath10k_pci_reg_read/write32() to take struct ath10k
      ath10k: clean up ath10k_ce_completed_send_next_nolock()
      ath10k: convert ath10k_pci_wake() to return
      ath10k: simplify ath10k_ce_init() wake up handling


 drivers/net/wireless/ath/ath10k/ce.c  |   98 ++++++++++------
 drivers/net/wireless/ath/ath10k/pci.c |  208 ++++++++++++++++++++++++---------
 drivers/net/wireless/ath/ath10k/pci.h |   22 ++-
 3 files changed, 227 insertions(+), 101 deletions(-)


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
