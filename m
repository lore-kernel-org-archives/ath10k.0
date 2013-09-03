Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ebb05.tieto.com ([131.207.168.36])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VGpfu-00066h-37
 for ath10k@lists.infradead.org; Tue, 03 Sep 2013 12:25:38 +0000
From: Bartosz Markowski <bartosz.markowski@tieto.com>
Subject: [PATCH 2/2] ath10k: remove obsolete INIT STATUS definitions
Date: Tue, 3 Sep 2013 14:24:03 +0200
Message-ID: <1378211043-20299-2-git-send-email-bartosz.markowski@tieto.com>
In-Reply-To: <1378211043-20299-1-git-send-email-bartosz.markowski@tieto.com>
References: <1378211043-20299-1-git-send-email-bartosz.markowski@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Bartosz Markowski <bartosz.markowski@tieto.com>

There's no functional changes. Just a small cleanup.

Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>
---
 drivers/net/wireless/ath/ath10k/wmi.h |    8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index 08860c4..40fcf05 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -763,14 +763,6 @@ struct wmi_service_ready_event {
 	struct wlan_host_mem_req mem_reqs[1];
 } __packed;
 
-/*
- * status consists of  upper 16 bits fo int status and lower 16 bits of
- * module ID that retuned status
- */
-#define WLAN_INIT_STATUS_SUCCESS   0x0
-#define WLAN_GET_INIT_STATUS_REASON(status)    ((status) & 0xffff)
-#define WLAN_GET_INIT_STATUS_MODULE_ID(status) (((status) >> 16) & 0xffff)
-
 #define WMI_SERVICE_READY_TIMEOUT_HZ (5*HZ)
 #define WMI_UNIFIED_READY_TIMEOUT_HZ (5*HZ)
 
-- 
1.7.10


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
