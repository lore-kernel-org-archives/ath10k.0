Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dcqym-0003O0-Sn
 for ath10k@lists.infradead.org; Wed, 02 Aug 2017 10:34:25 +0000
From: Rakesh Pillai <pillair@codeaurora.org>
Subject: [PATCH v2] ath10k: fix memory leak in rx ring buffer allocation
Date: Wed,  2 Aug 2017 16:03:37 +0530
Message-Id: <1501670017-12862-1-git-send-email-pillair@codeaurora.org>
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
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Rakesh Pillai <pillair@qti.qualcomm.com>

From: Rakesh Pillai <pillair@qti.qualcomm.com>

ath10k: fix memory leak in rx ring buffer allocation

The rx ring buffers are added to a hash table if
firmware support full rx reorder. If the full rx
reorder support flag is not set before allocating
the rx ring buffers, none of the buffers are added
to the hash table.

There is a race condition between rx ring refill and
rx buffer replenish from napi poll. The interrupts are
enabled in hif start, before the rx ring is refilled during init.
We replenish buffers from napi poll due to the interrupts which
get enabled after hif start. Hence before the entire rx ring is
refilled during the init, the napi poll replenishes a few buffers
in steps of 100 buffers per attempt. During this rx ring replenish
from napi poll, the rx reorder flag has not been set due to which
the replenished buffers are not added to the hash table

Set the rx full reorder support flag before we allocate
the rx ring buffer to avoid the memory leak.

Signed-off-by: Rakesh Pillai <pillair@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 6906bdd..10b3384 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -1886,6 +1886,12 @@ int ath10k_core_start(struct ath10k *ar, enum ath10k_firmware_mode mode,
 		goto err_wmi_detach;
 	}
 
+	/* If firmware indicates Full Rx Reorder support it must be used in a
+	 * slightly different manner. Let HTT code know.
+	 */
+	ar->htt.rx_ring.in_ord_rx = !!(test_bit(WMI_SERVICE_RX_FULL_REORDER,
+						ar->wmi.svc_map));
+
 	status = ath10k_htt_rx_alloc(&ar->htt);
 	if (status) {
 		ath10k_err(ar, "failed to alloc htt rx: %d\n", status);
@@ -1997,12 +2003,6 @@ int ath10k_core_start(struct ath10k *ar, enum ath10k_firmware_mode mode,
 		}
 	}
 
-	/* If firmware indicates Full Rx Reorder support it must be used in a
-	 * slightly different manner. Let HTT code know.
-	 */
-	ar->htt.rx_ring.in_ord_rx = !!(test_bit(WMI_SERVICE_RX_FULL_REORDER,
-						ar->wmi.svc_map));
-
 	status = ath10k_htt_rx_ring_refill(ar);
 	if (status) {
 		ath10k_err(ar, "failed to refill htt rx ring: %d\n", status);
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
