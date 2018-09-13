Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g0SsN-0004Yf-Lk
 for ath10k@lists.infradead.org; Thu, 13 Sep 2018 14:45:49 +0000
Received: by mail-lj1-x243.google.com with SMTP id f8-v6so4842022ljk.1
 for <ath10k@lists.infradead.org>; Thu, 13 Sep 2018 07:45:35 -0700 (PDT)
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Subject: [PATCH 1/2] ath10k: add default value for num_peers in WMI TLV init
Date: Thu, 13 Sep 2018 16:45:05 +0200
Message-Id: <20180913144506.8272-1-erik.stromdahl@gmail.com>
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
To: kvalo@qca.qualcomm.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
Cc: Erik Stromdahl <erik.stromdahl@gmail.com>

The hw_params value will only be used if it was explicitly set in the
global hw_params array.

This makes it possible to have the num_peers member unset.

Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
---
 drivers/net/wireless/ath/ath10k/wmi-tlv.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
index 2640bc389f1d..e8e4ec5443e7 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
@@ -1569,7 +1569,10 @@ static struct sk_buff *ath10k_wmi_tlv_op_gen_init(struct ath10k *ar)
 
 	cfg->num_vdevs = __cpu_to_le32(TARGET_TLV_NUM_VDEVS);
 
-	cfg->num_peers = __cpu_to_le32(ar->hw_params.num_peers);
+	if (ar->hw_params.num_peers)
+		cfg->num_peers = __cpu_to_le32(ar->hw_params.num_peers);
+	else
+		cfg->num_peers = __cpu_to_le32(TARGET_TLV_NUM_PEERS);
 	cfg->ast_skid_limit = __cpu_to_le32(ar->hw_params.ast_skid_limit);
 	cfg->num_wds_entries = __cpu_to_le32(ar->hw_params.num_wds_entries);
 
-- 
2.18.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
