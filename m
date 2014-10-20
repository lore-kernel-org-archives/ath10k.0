Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x22c.google.com ([2a00:1450:4010:c04::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgCjL-00083K-R8
 for ath10k@lists.infradead.org; Mon, 20 Oct 2014 13:10:44 +0000
Received: by mail-lb0-f172.google.com with SMTP id b6so3865381lbj.3
 for <ath10k@lists.infradead.org>; Mon, 20 Oct 2014 06:10:13 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 1/7] ath10k: fix wmi svc bitmap dbg print
Date: Mon, 20 Oct 2014 14:58:39 +0200
Message-Id: <1413809925-4352-2-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1413809925-4352-1-git-send-email-michal.kazior@tieto.com>
References: <1413809925-4352-1-git-send-email-michal.kazior@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

The dump print uses sizeof() but since service_map
was a mere pointer the dump was too short.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/wmi.c | 4 +++-
 drivers/net/wireless/ath/ath10k/wmi.h | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 829fccf..45768c9 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -2411,6 +2411,7 @@ static int ath10k_wmi_main_pull_svc_rdy_ev(struct sk_buff *skb,
 	arg->eeprom_rd = ev->hal_reg_capabilities.eeprom_rd;
 	arg->num_mem_reqs = ev->num_mem_reqs;
 	arg->service_map = ev->wmi_service_bitmap;
+	arg->service_map_len = sizeof(ev->wmi_service_bitmap);
 
 	n = min_t(size_t, __le32_to_cpu(arg->num_mem_reqs),
 		  ARRAY_SIZE(arg->mem_reqs));
@@ -2445,6 +2446,7 @@ static int ath10k_wmi_10x_pull_svc_rdy_ev(struct sk_buff *skb,
 	arg->eeprom_rd = ev->hal_reg_capabilities.eeprom_rd;
 	arg->num_mem_reqs = ev->num_mem_reqs;
 	arg->service_map = ev->wmi_service_bitmap;
+	arg->service_map_len = sizeof(ev->wmi_service_bitmap);
 
 	n = min_t(size_t, __le32_to_cpu(arg->num_mem_reqs),
 		  ARRAY_SIZE(arg->mem_reqs));
@@ -2495,7 +2497,7 @@ static void ath10k_wmi_event_service_ready(struct ath10k *ar,
 
 	ath10k_debug_read_service_map(ar, svc_bmap, sizeof(svc_bmap));
 	ath10k_dbg_dump(ar, ATH10K_DBG_WMI, NULL, "wmi svc: ",
-			arg.service_map, sizeof(arg.service_map));
+			arg.service_map, arg.service_map_len);
 
 	/* only manually set fw features when not using FW IE format */
 	if (ar->fw_api == 1 && ar->fw_version_build > 636)
diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index a38d788..4d16dfe 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -4572,6 +4572,7 @@ struct wmi_svc_rdy_ev_arg {
 	__le32 eeprom_rd;
 	__le32 num_mem_reqs;
 	const __le32 *service_map;
+	size_t service_map_len;
 	const struct wlan_host_mem_req *mem_reqs[WMI_MAX_MEM_REQS];
 };
 
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
