Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mout.kundenserver.de ([217.72.192.74])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f1JE5-0000oQ-7a
 for ath10k@lists.infradead.org; Wed, 28 Mar 2018 22:07:26 +0000
From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] ath10k: avoid possible string overflow
Date: Thu, 29 Mar 2018 00:06:10 +0200
Message-Id: <20180328220635.3704458-1-arnd@arndb.de>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: Maharaja Kennadyrajan <mkenna@codeaurora.org>, Manikanta Pubbisetty <mpubbise@qti.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>, Johannes Berg <johannes.berg@intel.com>, netdev@vger.kernel.org, Anilkumar Kolli <akolli@codeaurora.org>, Carl Huang <cjhuang@codeaurora.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, "Gustavo A. R. Silva" <garsilva@embeddedor.com>

The way that 'strncat' is used here raised a warning in gcc-8:

drivers/net/wireless/ath/ath10k/wmi.c: In function 'ath10k_wmi_tpc_stats_final_disp_tables':
drivers/net/wireless/ath/ath10k/wmi.c:4649:4: error: 'strncat' output truncated before terminating nul copying as many bytes from a string as its length [-Werror=stringop-truncation]

Effectively, this is simply a strcat() but the use of strncat() suggests
some form of overflow check. Regardless of whether this might actually
overflow, using strlcat() instead of strncat() avoids the warning and
makes the code more robust.

Fixes: bc64d05220f3 ("ath10k: debugfs support to get final TPC stats for 10.4 variants")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/net/wireless/ath/ath10k/wmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 9649bb752bbd..42522ed115f3 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -4309,7 +4309,7 @@ static void ath10k_tpc_config_disp_tables(struct ath10k *ar,
 							    rate_code[i],
 							    type);
 			snprintf(buff, sizeof(buff), "%8d ", tpc[j]);
-			strncat(tpc_value, buff, strlen(buff));
+			strlcat(tpc_value, buff, sizeof(tpc_value));
 		}
 		tpc_stats->tpc_table[type].pream_idx[i] = pream_idx;
 		tpc_stats->tpc_table[type].rate_code[i] = rate_code[i];
@@ -4646,7 +4646,7 @@ ath10k_wmi_tpc_stats_final_disp_tables(struct ath10k *ar,
 							       rate_code[i],
 							       type, pream_idx);
 			snprintf(buff, sizeof(buff), "%8d ", tpc[j]);
-			strncat(tpc_value, buff, strlen(buff));
+			strlcat(tpc_value, buff, sizeof(tpc_value));
 		}
 		tpc_stats->tpc_table_final[type].pream_idx[i] = pream_idx;
 		tpc_stats->tpc_table_final[type].rate_code[i] = rate_code[i];
-- 
2.9.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
