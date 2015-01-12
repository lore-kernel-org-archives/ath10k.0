Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YAksx-0005zq-LC
 for ath10k@lists.infradead.org; Mon, 12 Jan 2015 19:42:48 +0000
From: greearb@candelatech.com
Subject: [PATCH 8/8] ath10k:  fix CE_DESC_FLAGS_META_DATA_LSB definition.
Date: Mon, 12 Jan 2015 11:41:49 -0800
Message-Id: <1421091709-19891-8-git-send-email-greearb@candelatech.com>
In-Reply-To: <1421091709-19891-1-git-send-email-greearb@candelatech.com>
References: <1421091709-19891-1-git-send-email-greearb@candelatech.com>
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
Cc: Ben Greear <greearb@candelatech.com>, linux-wireless@vger.kernel.org

From: Ben Greear <greearb@candelatech.com>

The value was off by one.  The error probably has no negative
affect on any upstream firmware, but should be fixed anyway
in case it comes into use in the future.

Signed-off-by: Ben Greear <greearb@candelatech.com>
---
 drivers/net/wireless/ath/ath10k/ce.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/ce.h b/drivers/net/wireless/ath/ath10k/ce.h
index f4919e9..b92610b 100644
--- a/drivers/net/wireless/ath/ath10k/ce.h
+++ b/drivers/net/wireless/ath/ath10k/ce.h
@@ -39,7 +39,7 @@ struct ath10k_ce_pipe;
 #define CE_DESC_FLAGS_GATHER         (1 << 0)
 #define CE_DESC_FLAGS_BYTE_SWAP      (1 << 1)
 #define CE_DESC_FLAGS_META_DATA_MASK 0xFFFC
-#define CE_DESC_FLAGS_META_DATA_LSB  3
+#define CE_DESC_FLAGS_META_DATA_LSB  2
 
 struct ce_desc {
 	__le32 addr;
-- 
1.7.11.7


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
