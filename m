Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga05.intel.com ([192.55.52.43])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fufO3-0000LJ-TT
 for ath10k@lists.infradead.org; Tue, 28 Aug 2018 14:54:54 +0000
Date: Tue, 28 Aug 2018 22:53:27 +0800
From: kbuild test robot <fengguang.wu@intel.com>
Subject: [RFC PATCH] ath10k: ath10k_htc_pktlog_svc_supported() can be static
Message-ID: <20180828145327.GA104938@lkp-ib04.lkp.intel.com>
References: <20180828043642.14890-3-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180828043642.14890-3-govinds@codeaurora.org>
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
To: Govind Singh <govinds@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, kbuild-all@01.org, ath10k@lists.infradead.org


Fixes: c4ce46304e1f ("ath10k: Enable pktlog for WCN3990 target")
Signed-off-by: kbuild test robot <fengguang.wu@intel.com>
---
 htc.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/htc.c b/drivers/net/wireless/ath/ath10k/htc.c
index 1727823..4e70ff2 100644
--- a/drivers/net/wireless/ath/ath10k/htc.c
+++ b/drivers/net/wireless/ath/ath10k/htc.c
@@ -872,7 +872,7 @@ static int ath10k_htc_pktlog_connect(struct ath10k *ar)
 	return 0;
 }
 
-bool ath10k_htc_pktlog_svc_supported(struct ath10k *ar)
+static bool ath10k_htc_pktlog_svc_supported(struct ath10k *ar)
 {
 	u8 ul_pipe_id;
 	u8 dl_pipe_id;

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
