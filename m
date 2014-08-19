Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x22a.google.com ([2a00:1450:4010:c04::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XJheh-0002h4-Fy
 for ath10k@lists.infradead.org; Tue, 19 Aug 2014 11:32:48 +0000
Received: by mail-lb0-f170.google.com with SMTP id l4so5428183lbv.29
 for <ath10k@lists.infradead.org>; Tue, 19 Aug 2014 04:32:21 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH] ath10k: fix wmi service bitmap
Date: Tue, 19 Aug 2014 13:22:32 +0200
Message-Id: <1408447352-28688-1-git-send-email-michal.kazior@tieto.com>
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

Service mapping for main firmware branch was
incorrectly used for 10.x firmware and vice-versa.
This caused wmi_services in debugfs to print wrong
values.

This actually fixes a problem with the previous
wmi service bitmap patch itself. For some reason
there was either a conflict that wasn't resolved
properly or git had a bad day.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/wmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 23acbad..ec3bf4e 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -2194,7 +2194,7 @@ static void ath10k_wmi_service_ready_event_rx(struct ath10k *ar,
 	ar->ath_common.regulatory.current_rd =
 		__le32_to_cpu(ev->hal_reg_capabilities.eeprom_rd);
 
-	wmi_10x_svc_map(ev->wmi_service_bitmap, svc_bmap);
+	wmi_main_svc_map(ev->wmi_service_bitmap, svc_bmap);
 	ath10k_debug_read_service_map(ar, svc_bmap, sizeof(svc_bmap));
 	ath10k_dbg_dump(ATH10K_DBG_WMI, NULL, "ath10k: wmi svc: ",
 			ev->wmi_service_bitmap, sizeof(ev->wmi_service_bitmap));
@@ -2264,7 +2264,7 @@ static void ath10k_wmi_10x_service_ready_event_rx(struct ath10k *ar,
 	ar->ath_common.regulatory.current_rd =
 		__le32_to_cpu(ev->hal_reg_capabilities.eeprom_rd);
 
-	wmi_main_svc_map(ev->wmi_service_bitmap, svc_bmap);
+	wmi_10x_svc_map(ev->wmi_service_bitmap, svc_bmap);
 	ath10k_debug_read_service_map(ar, svc_bmap, sizeof(svc_bmap));
 	ath10k_dbg_dump(ATH10K_DBG_WMI, NULL, "ath10k: wmi svc: ",
 			ev->wmi_service_bitmap, sizeof(ev->wmi_service_bitmap));
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
