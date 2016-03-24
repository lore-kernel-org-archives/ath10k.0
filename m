Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aj6BF-0000zR-3o
 for ath10k@lists.infradead.org; Thu, 24 Mar 2016 14:24:11 +0000
Subject: [PATCH 2/4] ath10k: prefer kernel type 'u64' over 'u_int64_t'
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Thu, 24 Mar 2016 16:23:37 +0200
Message-ID: <20160324142337.15808.26266.stgit@potku.adurom.net>
In-Reply-To: <20160324142217.15808.22638.stgit@potku.adurom.net>
References: <20160324142217.15808.22638.stgit@potku.adurom.net>
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
index d196bcc50e50..71d69d0c1960 100644
--- a/drivers/net/wireless/ath/ath10k/htt.h
+++ b/drivers/net/wireless/ath/ath10k/htt.h
@@ -1474,10 +1474,10 @@ union htt_rx_pn_t {
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
