Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mout.kundenserver.de ([217.72.192.74])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXOGd-0004WS-33
 for ath10k@lists.infradead.org; Sat, 09 May 2020 12:07:44 +0000
From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH net-next 1/2] ath10k: fix gcc-10 zero-length-bounds warnings
Date: Sat,  9 May 2020 14:06:32 +0200
Message-Id: <20200509120707.188595-1-arnd@arndb.de>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Arnd Bergmann <arnd@arndb.de>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Erik Stromdahl <erik.stromdahl@gmail.com>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Kalle Valo <kvalo@qca.qualcomm.com>, Michal Kazior <michal.kazior@tieto.com>, Wen Gong <wgong@codeaurora.org>, "David S. Miller" <davem@davemloft.net>

gcc-10 started warning about out-of-bounds access for zero-length
arrays:

In file included from drivers/net/wireless/ath/ath10k/core.h:18,
                 from drivers/net/wireless/ath/ath10k/htt_rx.c:8:
drivers/net/wireless/ath/ath10k/htt_rx.c: In function 'ath10k_htt_rx_tx_fetch_ind':
drivers/net/wireless/ath/ath10k/htt.h:1683:17: warning: array subscript 65535 is outside the bounds of an interior zero-length array 'struct htt_tx_fetch_record[0]' [-Wzero-length-bounds]
 1683 |  return (void *)&ind->records[le16_to_cpu(ind->num_records)];
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/net/wireless/ath/ath10k/htt.h:1676:29: note: while referencing 'records'
 1676 |  struct htt_tx_fetch_record records[0];
      |                             ^~~~~~~

Make records[] a flexible array member to allow this, moving it behind
the other zero-length member that is not accessed in a way that gcc
warns about.

Fixes: 3ba225b506a2 ("treewide: Replace zero-length array with flexible-array member")
Fixes: 22e6b3bc5d96 ("ath10k: add new htt definitions")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/net/wireless/ath/ath10k/htt.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt.h b/drivers/net/wireless/ath/ath10k/htt.h
index 8f3710cf28f4..aa056a186402 100644
--- a/drivers/net/wireless/ath/ath10k/htt.h
+++ b/drivers/net/wireless/ath/ath10k/htt.h
@@ -1673,8 +1673,8 @@ struct htt_tx_fetch_ind {
 	__le32 token;
 	__le16 num_resp_ids;
 	__le16 num_records;
-	struct htt_tx_fetch_record records[0];
 	__le32 resp_ids[0]; /* ath10k_htt_get_tx_fetch_ind_resp_ids() */
+	struct htt_tx_fetch_record records[];
 } __packed;
 
 static inline void *
-- 
2.26.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
