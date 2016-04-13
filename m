Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aqIkW-000664-HP
 for ath10k@lists.infradead.org; Wed, 13 Apr 2016 11:14:20 +0000
Subject: [PATCH v2 2/5] ath10k: prefer kernel type 'u64' over 'u_int64_t'
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Wed, 13 Apr 2016 14:13:35 +0300
Message-ID: <20160413111335.18823.58746.stgit@potku.adurom.net>
In-Reply-To: <20160413111247.18823.15952.stgit@potku.adurom.net>
References: <20160413111247.18823.15952.stgit@potku.adurom.net>
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
Cc: linux-wireless@vger.kernel.org

Fixes checkpatch warnings:

drivers/net/wireless/ath/ath10k/htt.h:1477: Prefer kernel type 'u64' over 'u_int64_t'
drivers/net/wireless/ath/ath10k/htt.h:1480: Prefer kernel type 'u64' over 'u_int64_t'

Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/htt.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt.h b/drivers/net/wireless/ath/ath10k/htt.h
index 60bd9fe4b2d9..ee7c8f8f8073 100644
--- a/drivers/net/wireless/ath/ath10k/htt.h
+++ b/drivers/net/wireless/ath/ath10k/htt.h
@@ -1475,10 +1475,10 @@ union htt_rx_pn_t {
 	u32 pn24;
 
 	/* TKIP or CCMP: 48-bit PN */
-	u_int64_t pn48;
+	u64 pn48;
 
 	/* WAPI: 128-bit PN */
-	u_int64_t pn128[2];
+	u64 pn128[2];
 };
 
 struct htt_cmd {


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
