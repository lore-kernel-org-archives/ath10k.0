Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YhiiN-0000Jr-3o
 for ath10k@lists.infradead.org; Mon, 13 Apr 2015 18:04:07 +0000
From: Peter Oh <poh@qca.qualcomm.com>
Subject: [PATCH v2] ath10k: use MAC clock rate same as FW uses for survey
 accuracy
Date: Mon, 13 Apr 2015 11:01:20 -0700
Message-ID: <6a113cdb1b0dbbb6d98ab6b363b4912474c32bac.1428701627.git.poh@qca.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org

WLAN survey data provides several informative values on each channels
such as noise, active time, transmit time, and etc.
Regarding the channel activity time data, it is reported from firmware
in different form which is number of cycles instead of time itself.
Hence host driver converts it to time unit by dividing it by clock rate
that is used at baseband MAC.

Using difference clock rate from that actual HW is using will result in
inaccurate survey data. For instance, channel active time can be reported
with bigger than 150ms even though we set Dwell time to 150ms.
Therefore set the clock rate to 88000 (88 MHz) which is ath10k baseband
MAC is using.

Signed-off-by: Peter Oh <poh@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/wmi.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index d0942b0..2c03496 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -4653,9 +4653,7 @@ struct wmi_peer_sta_kickout_event {
 } __packed;
 
 #define WMI_CHAN_INFO_FLAG_COMPLETE BIT(0)
-
-/* FIXME: empirically extrapolated */
-#define WMI_CHAN_INFO_MSEC(x) ((x) / 76595)
+#define WMI_CHAN_INFO_MSEC(x) ((x) / 88000)
 
 /* Beacon filter wmi command info */
 #define BCN_FLT_MAX_SUPPORTED_IES	256
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
