Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mailout2.samsung.com ([203.254.224.25])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1flXWI-0005ms-Hl
 for ath10k@lists.infradead.org; Fri, 03 Aug 2018 10:41:20 +0000
From: "K.T.VIJAYAKUMAAR" <vijay.bvb@samsung.com>
Subject: [PATCH 1/1] ath10k: avoid possible memory access violation
Date: Fri, 03 Aug 2018 16:10:05 +0530
Message-id: <1533292805-9709-1-git-send-email-vijay.bvb@samsung.com>
References: <CGME20180803104058epcas1p1d5cdd51e2774d72679aaf15358cb3d00@epcas1p1.samsung.com>
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
To: kvalo@codeaurora.org, davem@davemloft.net, ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: vijay.bvb@samsung.com, cpgs@samsung.com

array "ctl_power_table" access index "pream" is initialized with -1 and
is raised as a static analysis tool issue.
[drivers\net\wireless\ath\ath10k\wmi.c:4719] ->
[drivers\net\wireless\ath\ath10k\wmi.c:4730]: (error) Array index -1 is
out of bounds.

Since the "pream" index for accessing ctl_power_table array is initialized
with -1, there is a chance of memory access violation for the cases below.
1) wmi_pdev_tpc_final_table_event change frequency is between 2483 and 5180
2) pream_idx is out of the enumeration ranges of wmi_tpc_pream_2ghz,
wmi_tpc_pream_5ghz

Signed-off-by: K.T.VIJAYAKUMAAR <vijay.bvb@samsung.com>
---
 drivers/net/wireless/ath/ath10k/wmi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 877249a..23502cd 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -4721,6 +4721,13 @@ ath10k_wmi_tpc_final_get_rate(struct ath10k *ar,
 		}
 	}
 
+	if (pream == -1) {
+		ath10k_warn(ar, "unknown wmi tpc final: pream_idx[%u], chan_freq[%u]\n",
+			    pream_idx, __le32_to_cpu(ev->chan_freq));
+		tpc = 0;
+		goto out;
+	}
+
 	if (pream == 4)
 		tpc = min_t(u8, ev->rates_array[rate_idx],
 			    ev->max_reg_allow_pow[ch]);
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
