Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ebb06.tieto.com ([131.207.168.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VVzU9-0008KZ-IH
 for ath10k@lists.infradead.org; Tue, 15 Oct 2013 07:56:09 +0000
From: Bartosz Markowski <bartosz.markowski@tieto.com>
Subject: [PATCH 2/2] ath10k: return better errno for unsupported pdev params
Date: Tue, 15 Oct 2013 09:55:32 +0200
Message-ID: <1381823732-10128-2-git-send-email-bartosz.markowski@tieto.com>
In-Reply-To: <1381823732-10128-1-git-send-email-bartosz.markowski@tieto.com>
References: <1381823732-10128-1-git-send-email-bartosz.markowski@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Bartosz Markowski <bartosz.markowski@tieto.com>

Return -EOPNOTSUPP if given parameter is not supported by firmware.

Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>
---
 drivers/net/wireless/ath/ath10k/wmi.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index ea2669b..b28bd2d3 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -2119,7 +2119,7 @@ int ath10k_wmi_pdev_set_param(struct ath10k *ar, u32 id, u32 value)
 
 	if (id == WMI_PDEV_PARAM_UNSUPPORTED) {
 		ath10k_warn("pdev param %d not supported by firmware\n", id);
-		return -EINVAL;
+		return -EOPNOTSUPP;
 	}
 
 	skb = ath10k_wmi_alloc_skb(sizeof(*cmd));
-- 
1.7.10


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
