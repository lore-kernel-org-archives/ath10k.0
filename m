Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x234.google.com ([2a00:1450:400c:c05::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YwrAc-0000CV-Ql
 for ath10k@lists.infradead.org; Mon, 25 May 2015 12:07:55 +0000
Received: by wicmc15 with SMTP id mc15so38919055wic.1
 for <ath10k@lists.infradead.org>; Mon, 25 May 2015 05:07:26 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v4 1/3] ath10k: move cycle_count macro
Date: Mon, 25 May 2015 14:06:17 +0200
Message-Id: <1432555579-18347-1-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1432282693-4553-1-git-send-email-michal.kazior@tieto.com>
References: <1432282693-4553-1-git-send-email-michal.kazior@tieto.com>
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

The macro isn't WMI specific. Instead it is
related to hardware chip so move the macro
accordingly. While at it document the magic value.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---

Notes:
    I've had to move more survey logic in "ath10k:
    handle cycle counter wraparound" into hw.c hence
    this patch.
    
    v4:
     * add this patch

 drivers/net/wireless/ath/ath10k/hw.h  | 3 +++
 drivers/net/wireless/ath/ath10k/wmi.c | 4 ++--
 drivers/net/wireless/ath/ath10k/wmi.h | 1 -
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index 89e09cbeac19..372f0b8c96f5 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -449,6 +449,9 @@ enum ath10k_hw_rate_cck {
 #define SCRATCH_3_ADDRESS			ar->regs->scratch_3_address
 #define CPU_INTR_ADDRESS			0x0010
 
+/* Cycle counters are running at 88MHz */
+#define CCNT_TO_MSEC(x) ((x) / 88000)
+
 /* Firmware indications to the Host via SCRATCH_3 register. */
 #define FW_INDICATOR_ADDRESS	(SOC_CORE_BASE_ADDRESS + SCRATCH_3_ADDRESS)
 #define FW_IND_EVENT_PENDING			1
diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 0fabe689179c..43caabf5b025 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -1644,8 +1644,8 @@ void ath10k_wmi_event_chan_info(struct ath10k *ar, struct sk_buff *skb)
 		rx_clear_count -= ar->survey_last_rx_clear_count;
 
 		survey = &ar->survey[idx];
-		survey->time = WMI_CHAN_INFO_MSEC(cycle_count);
-		survey->time_busy = WMI_CHAN_INFO_MSEC(rx_clear_count);
+		survey->time = CCNT_TO_MSEC(cycle_count);
+		survey->time_busy = CCNT_TO_MSEC(rx_clear_count);
 		survey->noise = noise_floor;
 		survey->filled = SURVEY_INFO_TIME |
 				 SURVEY_INFO_TIME_BUSY |
diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index cad72ae76253..cf44a3d080a3 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -4665,7 +4665,6 @@ struct wmi_peer_sta_kickout_event {
 } __packed;
 
 #define WMI_CHAN_INFO_FLAG_COMPLETE BIT(0)
-#define WMI_CHAN_INFO_MSEC(x) ((x) / 88000)
 
 /* Beacon filter wmi command info */
 #define BCN_FLT_MAX_SUPPORTED_IES	256
-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
