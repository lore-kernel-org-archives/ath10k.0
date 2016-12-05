Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cE1CB-00087C-0G
 for ath10k@lists.infradead.org; Mon, 05 Dec 2016 21:53:11 +0000
Received: by mail-wm0-x243.google.com with SMTP id u144so18241572wmu.0
 for <ath10k@lists.infradead.org>; Mon, 05 Dec 2016 13:52:48 -0800 (PST)
From: Christian Lamparter <chunkeey@googlemail.com>
Subject: [PATCH 2/2] ath10k: fix potential memory leak in
 ath10k_wmi_tlv_op_pull_fw_stats()
Date: Mon,  5 Dec 2016 22:52:46 +0100
Message-Id: <e0909741dfae742197d5f5d60709d225cc179b42.1480974623.git.chunkeey@googlemail.com>
In-Reply-To: <992a4e2676037a06f482cdbe2d3d39e287530be5.1480974623.git.chunkeey@googlemail.com>
References: <992a4e2676037a06f482cdbe2d3d39e287530be5.1480974623.git.chunkeey@googlemail.com>
In-Reply-To: <992a4e2676037a06f482cdbe2d3d39e287530be5.1480974623.git.chunkeey@googlemail.com>
References: <992a4e2676037a06f482cdbe2d3d39e287530be5.1480974623.git.chunkeey@googlemail.com>
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
To: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
Cc: Kalle Valo <kvalo@qca.qualcomm.com>

ath10k_wmi_tlv_op_pull_fw_stats() uses tb = ath10k_wmi_tlv_parse_alloc(...)
function, which allocates memory. If any of the three error-paths are
taken, this tb needs to be freed.

Signed-off-by: Christian Lamparter <chunkeey@googlemail.com>
---
 drivers/net/wireless/ath/ath10k/wmi-tlv.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
index f304f6632c4f..1f6bb9e8bb01 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
@@ -1105,8 +1105,10 @@ static int ath10k_wmi_tlv_op_pull_fw_stats(struct ath10k *ar,
 		struct ath10k_fw_stats_pdev *dst;
 
 		src = data;
-		if (data_len < sizeof(*src))
+		if (data_len < sizeof(*src)) {
+			kfree(tb);
 			return -EPROTO;
+		}
 
 		data += sizeof(*src);
 		data_len -= sizeof(*src);
@@ -1126,8 +1128,10 @@ static int ath10k_wmi_tlv_op_pull_fw_stats(struct ath10k *ar,
 		struct ath10k_fw_stats_vdev *dst;
 
 		src = data;
-		if (data_len < sizeof(*src))
+		if (data_len < sizeof(*src)) {
+			kfree(tb);
 			return -EPROTO;
+		}
 
 		data += sizeof(*src);
 		data_len -= sizeof(*src);
@@ -1145,8 +1149,10 @@ static int ath10k_wmi_tlv_op_pull_fw_stats(struct ath10k *ar,
 		struct ath10k_fw_stats_peer *dst;
 
 		src = data;
-		if (data_len < sizeof(*src))
+		if (data_len < sizeof(*src)) {
+			kfree(tb);
 			return -EPROTO;
+		}
 
 		data += sizeof(*src);
 		data_len -= sizeof(*src);
-- 
2.11.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
