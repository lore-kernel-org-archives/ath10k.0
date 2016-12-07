Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x235.google.com ([2a00:1450:400c:c09::235])
 by casper.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cEfhr-0001KD-GR
 for ath10k@lists.infradead.org; Wed, 07 Dec 2016 17:08:36 +0000
Received: by mail-wm0-x235.google.com with SMTP id g23so177906321wme.1
 for <ath10k@lists.infradead.org>; Wed, 07 Dec 2016 09:08:13 -0800 (PST)
From: Bartosz Markowski <bartosz.markowski@tieto.com>
Subject: [PATCH 3/5] ath10k: decrease num of peers support
Date: Wed,  7 Dec 2016 18:07:32 +0100
Message-Id: <1481130454-27244-3-git-send-email-bartosz.markowski@tieto.com>
In-Reply-To: <1481130454-27244-1-git-send-email-bartosz.markowski@tieto.com>
References: <1481130454-27244-1-git-send-email-bartosz.markowski@tieto.com>
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

The correct number for QCA9377 chip is 33 VDEVs.
This impacts also QCA6174 chip and it's max VDEV number.

Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>
---
 drivers/net/wireless/ath/ath10k/hw.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index 883547f3347c..7feffec531cc 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -512,7 +512,7 @@ ath10k_rx_desc_get_l3_pad_bytes(struct ath10k_hw_params *hw,
 /* Target specific defines for WMI-TLV firmware */
 #define TARGET_TLV_NUM_VDEVS			4
 #define TARGET_TLV_NUM_STATIONS			32
-#define TARGET_TLV_NUM_PEERS			35
+#define TARGET_TLV_NUM_PEERS			33
 #define TARGET_TLV_NUM_TDLS_VDEVS		1
 #define TARGET_TLV_NUM_TIDS			((TARGET_TLV_NUM_PEERS) * 2)
 #define TARGET_TLV_NUM_MSDU_DESC		(1024 + 32)
-- 
2.1.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
