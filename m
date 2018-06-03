Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fPXe2-0006VU-9Y
 for ath10k@lists.infradead.org; Sun, 03 Jun 2018 18:22:30 +0000
Received: by mail-lf0-x243.google.com with SMTP id y20-v6so21789689lfy.0
 for <ath10k@lists.infradead.org>; Sun, 03 Jun 2018 11:22:13 -0700 (PDT)
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Subject: [RFC v5 04/12] ath10k: use hw_params.num_peers for num_tids in TLV
 init
Date: Sun,  3 Jun 2018 20:20:21 +0200
Message-Id: <20180603182029.8914-5-erik.stromdahl@gmail.com>
In-Reply-To: <20180603182029.8914-1-erik.stromdahl@gmail.com>
References: <20180603182029.8914-1-erik.stromdahl@gmail.com>
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

As TARGET_TLV_NUM_TIDS is calculated like this:

	#define TARGET_TLV_NUM_TIDS ((TARGET_TLV_NUM_PEERS) * 2)

... it is better to use the per device hw_params.num_peers value in
the TLV init message (if set), rather than using a hard coded value.

This makes the value used in the TLV init message match the hw_param
value.

Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
---
 drivers/net/wireless/ath/ath10k/wmi-tlv.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
index 2e34a1fc5ba6..acd2186526b7 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
@@ -1552,7 +1552,10 @@ static struct sk_buff *ath10k_wmi_tlv_op_gen_init(struct ath10k *ar)
 	}
 
 	cfg->num_peer_keys = __cpu_to_le32(2);
-	cfg->num_tids = __cpu_to_le32(TARGET_TLV_NUM_TIDS);
+	if (ar->hw_params.num_peers)
+		cfg->num_tids = __cpu_to_le32(ar->hw_params.num_peers * 2);
+	else
+		cfg->num_tids = __cpu_to_le32(TARGET_TLV_NUM_TIDS);
 	cfg->tx_chain_mask = __cpu_to_le32(0x7);
 	cfg->rx_chain_mask = __cpu_to_le32(0x7);
 	cfg->rx_timeout_pri[0] = __cpu_to_le32(0x64);
-- 
2.17.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
