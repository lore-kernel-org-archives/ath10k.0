Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x22e.google.com ([2a00:1450:4010:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZD9hb-0004Fm-4h
 for ath10k@lists.infradead.org; Thu, 09 Jul 2015 11:09:16 +0000
Received: by laar3 with SMTP id r3so244402352laa.0
 for <ath10k@lists.infradead.org>; Thu, 09 Jul 2015 04:08:47 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 1/6] ath10k: don't set cck/ofdm scan flags
Date: Thu,  9 Jul 2015 13:08:34 +0200
Message-Id: <1436440119-30231-2-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1436440119-30231-1-git-send-email-michal.kazior@tieto.com>
References: <1436440119-30231-1-git-send-email-michal.kazior@tieto.com>
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

mac80211 already does provide complete IEs for
Probe Requests for hw scan and ath10k firmware was
appending duplicate Supported Rates IEs
unnecessarily.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 3 ---
 drivers/net/wireless/ath/ath10k/wmi.c | 1 -
 2 files changed, 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index b5b74e84ad16..63c59593494e 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -4641,9 +4641,6 @@ static int ath10k_hw_scan(struct ieee80211_hw *hw,
 	arg.vdev_id = arvif->vdev_id;
 	arg.scan_id = ATH10K_SCAN_ID;
 
-	if (!req->no_cck)
-		arg.scan_ctrl_flags |= WMI_SCAN_ADD_CCK_RATES;
-
 	if (req->ie_len) {
 		arg.ie_len = req->ie_len;
 		memcpy(arg.ie, req->ie, arg.ie_len);
diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 638332e96931..0791a4336e80 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -5180,7 +5180,6 @@ void ath10k_wmi_start_scan_init(struct ath10k *ar,
 		| WMI_SCAN_EVENT_BSS_CHANNEL
 		| WMI_SCAN_EVENT_FOREIGN_CHANNEL
 		| WMI_SCAN_EVENT_DEQUEUED;
-	arg->scan_ctrl_flags |= WMI_SCAN_ADD_OFDM_RATES;
 	arg->scan_ctrl_flags |= WMI_SCAN_CHAN_STAT_EVENT;
 	arg->n_bssids = 1;
 	arg->bssids[0].bssid = "\xFF\xFF\xFF\xFF\xFF\xFF";
-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
