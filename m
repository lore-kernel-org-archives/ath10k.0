Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x232.google.com ([2a00:1450:400c:c00::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XbRzr-0000Rt-AZ
 for ath10k@lists.infradead.org; Tue, 07 Oct 2014 10:28:00 +0000
Received: by mail-wg0-f50.google.com with SMTP id a1so8973824wgh.9
 for <ath10k@lists.infradead.org>; Tue, 07 Oct 2014 03:27:34 -0700 (PDT)
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Subject: [PATCH] ath10k: fix WMI scan command length
Date: Tue,  7 Oct 2014 12:26:43 +0200
Message-Id: <1412677603-11748-1-git-send-email-janusz.dziedzic@tieto.com>
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
Cc: Janusz Dziedzic <janusz.dziedzic@tieto.com>, linux-wireless@vger.kernel.org

Fix WMI scan command length we setup when scan request.

This fix issue with 636 firmware when scan always failed
with message:

ath10k_pci 0000:02:00.0: wmi start scan
ath10k_pci 0000:02:00.0: wmi stop scan reqid 1 req_type 0 vdev/scan_id 0
ath10k_pci 0000:02:00.0: failed to stop wmi scan: -11
ath10k_pci 0000:02:00.0: failed to stop scan: -11
ath10k_pci 0000:02:00.0: failed to start hw scan: -110

Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>
---
 drivers/net/wireless/ath/ath10k/wmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index f65032f..d878fbe 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -3506,10 +3506,10 @@ int ath10k_wmi_start_scan(struct ath10k *ar,
 		return ret;
 
 	if (test_bit(ATH10K_FW_FEATURE_WMI_10X, ar->fw_features))
-		len = sizeof(struct wmi_start_scan_cmd) +
+		len = sizeof(struct wmi_10x_start_scan_cmd) +
 		      ath10k_wmi_start_scan_tlvs_len(arg);
 	else
-		len = sizeof(struct wmi_10x_start_scan_cmd) +
+		len = sizeof(struct wmi_start_scan_cmd) +
 		      ath10k_wmi_start_scan_tlvs_len(arg);
 
 	skb = ath10k_wmi_alloc_skb(ar, len);
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
