Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iT2ce-0000YY-AY
 for ath10k@lists.infradead.org; Fri, 08 Nov 2019 11:40:16 +0000
From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.19 092/205] ath10k: avoid possible memory access
 violation
Date: Fri,  8 Nov 2019 06:35:59 -0500
Message-Id: <20191108113752.12502-92-sashal@kernel.org>
In-Reply-To: <20191108113752.12502-1-sashal@kernel.org>
References: <20191108113752.12502-1-sashal@kernel.org>
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
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Sasha Levin <sashal@kernel.org>, "K.T.VIJAYAKUMAAR" <vijay.bvb@samsung.com>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, netdev@vger.kernel.org, Kalle Valo <kvalo@codeaurora.org>

From: "K.T.VIJAYAKUMAAR" <vijay.bvb@samsung.com>

[ Upstream commit 97c69a70dc2cecb2c3b96a66529e0082dabc2d2c ]

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
[kvalo@codeaurora.org: clean up the warning message]
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath10k/wmi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 9f31b9a108507..583147f00fa4e 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -4785,6 +4785,13 @@ ath10k_wmi_tpc_final_get_rate(struct ath10k *ar,
 		}
 	}
 
+	if (pream == -1) {
+		ath10k_warn(ar, "unknown wmi tpc final index and frequency: %u, %u\n",
+			    pream_idx, __le32_to_cpu(ev->chan_freq));
+		tpc = 0;
+		goto out;
+	}
+
 	if (pream == 4)
 		tpc = min_t(u8, ev->rates_array[rate_idx],
 			    ev->max_reg_allow_pow[ch]);
-- 
2.20.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
