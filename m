Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hMEJe-0004My-4J
 for ath10k@lists.infradead.org; Thu, 02 May 2019 16:12:11 +0000
Date: Fri, 3 May 2019 00:11:27 +0800
From: kbuild test robot <lkp@intel.com>
Subject: [RFC PATCH ath6kl] ath11k: ath11k_wmi_tlv_parse_alloc can be static
Message-ID: <20190502161127.GA84687@lkp-kbuild02>
References: <201905030039.lpVlyOqx%lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <201905030039.lpVlyOqx%lkp@intel.com>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: kbuild-all@01.org, ath10k@lists.infradead.org


Fixes: 258bbf525e65 ("ath11k: add driver")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 wmi.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 741885e..6ff7f27 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -163,7 +163,7 @@ static int ath11k_wmi_tlv_parse(struct ath11k_base *ar, const void **tb,
 				   (void *)tb);
 }
 
-const void **
+static const void **
 ath11k_wmi_tlv_parse_alloc(struct ath11k_base *ab, const void *ptr,
 			   size_t len, gfp_t gfp)
 {

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
