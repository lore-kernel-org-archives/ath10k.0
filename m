Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XWXU2-0003j9-PC
 for ath10k@lists.infradead.org; Tue, 23 Sep 2014 21:18:51 +0000
From: greearb@candelatech.com
Subject: [PATCH v2 08/10] ath10k: support CT firmware flag.
Date: Tue, 23 Sep 2014 14:17:23 -0700
Message-Id: <1411507045-18973-8-git-send-email-greearb@candelatech.com>
In-Reply-To: <1411507045-18973-1-git-send-email-greearb@candelatech.com>
References: <1411507045-18973-1-git-send-email-greearb@candelatech.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: linux-wireless@vger.kernel.org
Cc: Ben Greear <greearb@candelatech.com>, ath10k@lists.infradead.org

From: Ben Greear <greearb@candelatech.com>

Add placeholder so CT firmware can more easily co-exist with upstream
kernel.

Signed-off-by: Ben Greear <greearb@candelatech.com>
---

v2:  Patch is same as last time, different subsequent patch added
  in case that justifies this better.  I have more, such as
  tx-status (ie, tx rate) reporting, but those are on top of
  the 32-stations patch logic, so have to get that sorted out
  before I can post those.

  If nothing else, can we add a 'do-no-use = 5' feature flag so at least
  I can keep some backward/forward compatability with existing
  CT firwmare and kernels patchs to utilize it?

 drivers/net/wireless/ath/ath10k/core.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 601d573..0d1813c 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -361,6 +361,9 @@ enum ath10k_fw_features {
 	 */
 	ATH10K_FW_FEATURE_WMI_10_2 = 4,
 
+	/* Firmware from Candela Technologies, enables more VIFs, etc */
+	ATH10K_FW_FEATURE_WMI_10X_CT = 5,
+
 	/* keep last */
 	ATH10K_FW_FEATURE_COUNT,
 };
-- 
1.7.11.7


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
