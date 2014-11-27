Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x232.google.com ([2a00:1450:400c:c00::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XtvJ4-0006OT-1L
 for ath10k@lists.infradead.org; Thu, 27 Nov 2014 09:24:13 +0000
Received: by mail-wg0-f50.google.com with SMTP id k14so5844788wgh.23
 for <ath10k@lists.infradead.org>; Thu, 27 Nov 2014 01:23:44 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v2 1/7] ath10k: fix wmi svc bitmap dbg print
Date: Thu, 27 Nov 2014 10:11:15 +0100
Message-Id: <1417079481-22255-2-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1417079481-22255-1-git-send-email-michal.kazior@tieto.com>
References: <1417079481-22255-1-git-send-email-michal.kazior@tieto.com>
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
index 23fee9a..c6c03e5 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -2457,6 +2457,7 @@ static int ath10k_wmi_main_pull_svc_rdy_ev(struct sk_buff *skb,
 	arg->eeprom_rd = ev->hal_reg_capabilities.eeprom_rd;
 	arg->num_mem_reqs = ev->num_mem_reqs;
 	arg->service_map = ev->wmi_service_bitmap;
+	arg->service_map_len = sizeof(ev->wmi_service_bitmap);
 
 	n = min_t(size_t, __le32_to_cpu(arg->num_mem_reqs),
 		  ARRAY_SIZE(arg->mem_reqs));
@@ -2491,6 +2492,7 @@ static int ath10k_wmi_10x_pull_svc_rdy_ev(struct sk_buff *skb,
 	arg->eeprom_rd = ev->hal_reg_capabilities.eeprom_rd;
 	arg->num_mem_reqs = ev->num_mem_reqs;
 	arg->service_map = ev->wmi_service_bitmap;
+	arg->service_map_len = sizeof(ev->wmi_service_bitmap);
 
 	n = min_t(size_t, __le32_to_cpu(arg->num_mem_reqs),
 		  ARRAY_SIZE(arg->mem_reqs));
@@ -2541,7 +2543,7 @@ static void ath10k_wmi_event_service_ready(struct ath10k *ar,
 
 	ath10k_debug_read_service_map(ar, svc_bmap, sizeof(svc_bmap));
 	ath10k_dbg_dump(ar, ATH10K_DBG_WMI, NULL, "wmi svc: ",
-			arg.service_map, sizeof(arg.service_map));
+			arg.service_map, arg.service_map_len);
 
 	/* only manually set fw features when not using FW IE format */
 	if (ar->fw_api == 1 && ar->fw_version_build > 636)
diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index 1b7141a..fc6b844 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -4577,6 +4577,7 @@ struct wmi_svc_rdy_ev_arg {
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
