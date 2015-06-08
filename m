Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x229.google.com ([2a00:1450:400c:c05::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z1vyG-0005ah-8r
 for ath10k@lists.infradead.org; Mon, 08 Jun 2015 12:16:05 +0000
Received: by wibdq8 with SMTP id dq8so82961847wib.1
 for <ath10k@lists.infradead.org>; Mon, 08 Jun 2015 05:15:41 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 2/2] ath10k: print htt op_version upon driver boot
Date: Mon,  8 Jun 2015 14:15:34 +0200
Message-Id: <1433765734-646-2-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1433765734-646-1-git-send-email-michal.kazior@tieto.com>
References: <1433765734-646-1-git-send-email-michal.kazior@tieto.com>
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

HTT version itself isn't sufficient to know what
HTT version given firmware blob uses. Hence print
the recently introduced HTT op version code.

While at it make the info string a bit more
consistent and clear.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/debug.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
index 8a4edfd36e47..edf6047997a7 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -128,7 +128,7 @@ void ath10k_print_driver_info(struct ath10k *ar)
 
 	ath10k_core_get_fw_features_str(ar, fw_features, sizeof(fw_features));
 
-	ath10k_info(ar, "%s (0x%08x, 0x%08x%s%s%s) fw %s api %d htt %d.%d wmi %d cal %s max_sta %d features %s\n",
+	ath10k_info(ar, "%s (0x%08x, 0x%08x%s%s%s) fw %s api %d htt-ver %d.%d wmi-op %d htt-op %d cal %s max-sta %d features %s\n",
 		    ar->hw_params.name,
 		    ar->target_version,
 		    ar->chip_id,
@@ -141,6 +141,7 @@ void ath10k_print_driver_info(struct ath10k *ar)
 		    ar->htt.target_version_major,
 		    ar->htt.target_version_minor,
 		    ar->wmi.op_version,
+		    ar->htt.op_version,
 		    ath10k_cal_mode_str(ar->cal_mode),
 		    ar->max_num_stations,
 		    fw_features);
-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
