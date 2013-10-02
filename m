Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x22a.google.com ([2a00:1450:4013:c00::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VRGFP-00070O-EX
 for ath10k@lists.infradead.org; Wed, 02 Oct 2013 06:49:24 +0000
Received: by mail-ee0-f42.google.com with SMTP id b45so156104eek.29
 for <ath10k@lists.infradead.org>; Tue, 01 Oct 2013 23:49:01 -0700 (PDT)
From: Bartosz Markowski <bartosz.markowski@tieto.com>
Subject: [PATCH 2/2] ath10k: extend the max_scan time
Date: Wed,  2 Oct 2013 08:48:52 +0200
Message-Id: <1380696532-4147-2-git-send-email-bartosz.markowski@tieto.com>
In-Reply-To: <1380696532-4147-1-git-send-email-bartosz.markowski@tieto.com>
References: <1380696532-4147-1-git-send-email-bartosz.markowski@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Bartosz Markowski <bartosz.markowski@tieto.com>

It was observed few times, the artificial max_scan limit we
are using mainly to detect FW hangs, can be not enough for
instance while being associated and during heavy traffic.

What we do if the FW won't return with scan results within
the max_time time is a scan abort.

This is especially visible with 10.X fw which in combination
with dual band HW (scanning 32 channels) can end up with
hw_scan close to 10 seconds.

Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>
---
 drivers/net/wireless/ath/ath10k/wmi.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 416dabb..f9766fa 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -2522,7 +2522,7 @@ void ath10k_wmi_start_scan_init(struct ath10k *ar,
 	arg->repeat_probe_time = 0;
 	arg->probe_spacing_time = 0;
 	arg->idle_time = 0;
-	arg->max_scan_time = 5000;
+	arg->max_scan_time = 20000;
 	arg->probe_delay = 5;
 	arg->notify_scan_events = WMI_SCAN_EVENT_STARTED
 		| WMI_SCAN_EVENT_COMPLETED
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
