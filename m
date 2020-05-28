Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeKWE-0006Wk-0Z
 for ath10k@lists.infradead.org; Thu, 28 May 2020 15:32:31 +0000
Date: Thu, 28 May 2020 23:31:46 +0800
From: kbuild test robot <lkp@intel.com>
Subject: [RFC PATCH ath6kl] ath11k: ath11k_dp_srng_calculate_msi_group() can
 be static
Message-ID: <20200528153146.GA25006@3f49cb9714f8>
References: <202005282327.ZEJRVYGS%lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202005282327.ZEJRVYGS%lkp@intel.com>
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


Fixes: f2748890bfc2 ("ath11k: enable DP interrupt setup for QCA6390")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 dp.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index d1be849bd46fa..bb9271ed7f626 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -121,8 +121,8 @@ static int ath11k_dp_srng_find_ring_in_mask(int ring_num, const u8 *grp_mask)
 	return -ENOENT;
 }
 
-int ath11k_dp_srng_calculate_msi_group(struct ath11k_base *ab,
-				       enum hal_ring_type type, int ring_num)
+static int ath11k_dp_srng_calculate_msi_group(struct ath11k_base *ab,
+					      enum hal_ring_type type, int ring_num)
 {
 	const u8 *grp_mask;
 

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
