Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh01.mail.saunalahti.fi ([62.142.5.107])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VIgPB-0003Wr-Lz
 for ath10k@lists.infradead.org; Sun, 08 Sep 2013 14:56:02 +0000
Subject: [PATCH 2/8] ath10k: rename ATH10K_DBG_CORE to BOOT
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Sun, 08 Sep 2013 17:55:38 +0300
Message-ID: <20130908145538.3136.40193.stgit@localhost6.localdomain6>
In-Reply-To: <20130908145435.3136.49168.stgit@localhost6.localdomain6>
References: <20130908145435.3136.49168.stgit@localhost6.localdomain6>
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

core.c mostly deals with driver and firmware starting related
actions. And we can use the boot level also in other components,
like PCI and HTT.

Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c  |    6 +++---
 drivers/net/wireless/ath/ath10k/debug.h |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 8a68839..0ed60fd 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -53,7 +53,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 
 static void ath10k_send_suspend_complete(struct ath10k *ar)
 {
-	ath10k_dbg(ATH10K_DBG_CORE, "%s\n", __func__);
+	ath10k_dbg(ATH10K_DBG_BOOT, "%s\n", __func__);
 
 	ar->is_target_paused = true;
 	wake_up(&ar->event_queue);
@@ -101,7 +101,7 @@ static int ath10k_init_connect_htc(struct ath10k *ar)
 		goto timeout;
 	}
 
-	ath10k_dbg(ATH10K_DBG_CORE, "core wmi ready\n");
+	ath10k_dbg(ATH10K_DBG_BOOT, "core wmi ready\n");
 	return 0;
 
 timeout:
@@ -203,7 +203,7 @@ static int ath10k_push_board_ext_data(struct ath10k *ar,
 		return ret;
 	}
 
-	ath10k_dbg(ATH10K_DBG_CORE,
+	ath10k_dbg(ATH10K_DBG_BOOT,
 		   "ath10k: Board extended Data download addr: 0x%x\n",
 		   board_ext_data_addr);
 
diff --git a/drivers/net/wireless/ath/ath10k/debug.h b/drivers/net/wireless/ath/ath10k/debug.h
index dfa3070..4bef061 100644
--- a/drivers/net/wireless/ath/ath10k/debug.h
+++ b/drivers/net/wireless/ath/ath10k/debug.h
@@ -27,7 +27,7 @@ enum ath10k_debug_mask {
 	ATH10K_DBG_HTC		= 0x00000004,
 	ATH10K_DBG_HTT		= 0x00000008,
 	ATH10K_DBG_MAC		= 0x00000010,
-	ATH10K_DBG_CORE		= 0x00000020,
+	ATH10K_DBG_BOOT		= 0x00000020,
 	ATH10K_DBG_PCI_DUMP	= 0x00000040,
 	ATH10K_DBG_HTT_DUMP	= 0x00000080,
 	ATH10K_DBG_MGMT		= 0x00000100,


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
