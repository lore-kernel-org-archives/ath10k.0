Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c2a1q-000338-MY
 for ath10k@lists.infradead.org; Fri, 04 Nov 2016 08:39:15 +0000
From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
Subject: [PATCH] ath10k: Fix crash during rmmod when probe firmware fails
Date: Fri, 4 Nov 2016 14:08:44 +0530
Message-ID: <1478248724-12773-1-git-send-email-mohammed@qca.qualcomm.com>
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
Cc: mohammed@codeaurora.org, linux-wireless@vger.kernel.org, Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

This fixes the below crash when ath10k probe firmware fails,
NAPI polling tries to access a rx ring resource which was never
allocated, fix this by disabling NAPI right away once the probe
firmware fails

BUG: unable to handle kernel NULL pointer dereference at (null)
IP:  __ath10k_htt_rx_ring_fill_n+0x19/0x230 [ath10k_core]
__ath10k_htt_rx_ring_fill_n+0x19/0x230 [ath10k_core]

Call Trace:

[<ffffffffa113ec62>] ath10k_htt_rx_msdu_buff_replenish+0x42/0x90
[ath10k_core]
[<ffffffffa113f393>] ath10k_htt_txrx_compl_task+0x433/0x17d0
[ath10k_core]
[<ffffffff8114406d>] ? __wake_up_common+0x4d/0x80
[<ffffffff811349ec>] ? cpu_load_update+0xdc/0x150
[<ffffffffa119301d>] ? ath10k_pci_read32+0xd/0x10 [ath10k_pci]
[<ffffffffa1195b17>] ath10k_pci_napi_poll+0x47/0x110 [ath10k_pci]
[<ffffffff817863af>] net_rx_action+0x20f/0x370

Reported-by: Ben Greear <greearb@candelatech.com>
Fixes: 3c97f5de1f28 ("ath10k: implement NAPI support")
Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 7005e2a..8187eb2 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2165,6 +2165,8 @@ err_free_firmware_files:
 
 err_power_down:
 	ath10k_hif_power_down(ar);
+	napi_synchronize(&ar->napi);
+	napi_disable(&ar->napi);
 
 	return ret;
 }
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
