Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpqdR-0003ji-NJ
 for ath10k@lists.infradead.org; Mon, 29 Jun 2020 10:03:34 +0000
Date: Mon, 29 Jun 2020 18:02:53 +0800
From: kernel test robot <lkp@intel.com>
Subject: [RFC PATCH] ath10k: ath10k_mac_set_tid_config() can be static
Message-ID: <20200629100253.GA83675@930a38d91fed>
References: <1593363718-5148-4-git-send-email-tamizhr@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1593363718-5148-4-git-send-email-tamizhr@codeaurora.org>
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
To: Tamizh Chelvam <tamizhr@codeaurora.org>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, kbuild-all@lists.01.org


Signed-off-by: kernel test robot <lkp@intel.com>
---
 mac.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index b1a89c5869a01..8025c9115e3d6 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -6861,9 +6861,9 @@ ath10k_mac_tid_bitrate_config(struct ath10k *ar,
 	return 0;
 }
 
-int ath10k_mac_set_tid_config(struct ath10k *ar, struct ieee80211_sta *sta,
-			      struct ieee80211_vif *vif, u32 changed,
-			      struct wmi_per_peer_per_tid_cfg_arg *arg)
+static int ath10k_mac_set_tid_config(struct ath10k *ar, struct ieee80211_sta *sta,
+				     struct ieee80211_vif *vif, u32 changed,
+				     struct wmi_per_peer_per_tid_cfg_arg *arg)
 {
 	struct ath10k_vif *arvif = (void *)vif->drv_priv;
 	struct ath10k_sta *arsta;

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
