Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga06.intel.com ([134.134.136.31])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeL5F-0001s9-49
 for ath10k@lists.infradead.org; Thu, 28 May 2020 16:08:42 +0000
Date: Fri, 29 May 2020 00:08:29 +0800
From: kbuild test robot <lkp@intel.com>
Subject: [RFC PATCH ath6kl] ath11k: ath11k_mac_id_to_pdev_id_ipq8074() can be
 static
Message-ID: <20200528160829.GA50950@3f49cb9714f8>
References: <202005290059.xMptJizM%lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202005290059.xMptJizM%lkp@intel.com>
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
To: Carl Huang <cjhuang@codeaurora.org>
Cc: kbuild-all@lists.01.org, ath10k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>


Fixes: f4e7ef9fc04c ("ath11k: setup QCA6390 rings for both rxdmas")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 hw.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/hw.c b/drivers/net/wireless/ath/ath11k/hw.c
index 65cae23d39481..1f59867b67b02 100644
--- a/drivers/net/wireless/ath/ath11k/hw.c
+++ b/drivers/net/wireless/ath/ath11k/hw.c
@@ -205,22 +205,22 @@ static void ath11k_init_wmi_config_ipq8074(struct ath11k_base *ab,
 	config->twt_ap_sta_count = 1000;
 }
 
-int ath11k_mac_id_to_pdev_id_ipq8074(int mac_id)
+static int ath11k_mac_id_to_pdev_id_ipq8074(int mac_id)
 {
 	return mac_id;
 }
 
-int ath11k_mac_id_to_srng_id_ipq8074(int mac_id)
+static int ath11k_mac_id_to_srng_id_ipq8074(int mac_id)
 {
 	return 0;
 }
 
-int ath11k_mac_id_to_pdev_id_qca6x90(int mac_id)
+static int ath11k_mac_id_to_pdev_id_qca6x90(int mac_id)
 {
 	return 0;
 }
 
-int ath11k_mac_id_to_srng_id_qca6x90(int mac_id)
+static int ath11k_mac_id_to_srng_id_qca6x90(int mac_id)
 {
 	return mac_id;
 }

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
