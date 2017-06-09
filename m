Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr0-x22c.google.com ([2a00:1450:400c:c0c::22c])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dJHmH-0002Jd-Qc
 for ath10k@lists.infradead.org; Fri, 09 Jun 2017 11:08:32 +0000
Received: by mail-wr0-x22c.google.com with SMTP id q97so29171809wrb.2
 for <ath10k@lists.infradead.org>; Fri, 09 Jun 2017 04:08:09 -0700 (PDT)
From: Sven Eckelmann <sven.eckelmann@openmesh.com>
Subject: [PATCH v2 3/3] ath10k: Set rxnss_override for QCA9888
Date: Fri,  9 Jun 2017 13:07:50 +0200
Message-Id: <20170609110750.14950-3-sven.eckelmann@openmesh.com>
In-Reply-To: <20170609110750.14950-1-sven.eckelmann@openmesh.com>
References: <20170609110750.14950-1-sven.eckelmann@openmesh.com>
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
Cc: linux-wireless@vger.kernel.org, Sven Eckelmann <sven.eckelmann@openmesh.com>

QCA9888 supports VHT80 with 2x2. But it only support 1x1 with VHT160 or
VHT80+80. Inform userspace and the the QCA firmware about that limitation
whenever VHT80+80 or VHT160 is configured.

Signed-off-by: Sven Eckelmann <sven.eckelmann@openmesh.com>
---
v2:
 - new patch

 drivers/net/wireless/ath/ath10k/mac.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 0752cf351b4a..75e90adc8fb4 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -4436,6 +4436,14 @@ static struct ieee80211_sta_vht_cap ath10k_create_vht_cap(struct ath10k *ar)
 			vht_cap.vht_mcs.rx_highest = 1560;
 			vht_cap.vht_mcs.tx_highest = 1560;
 			break;
+		case QCA9888_2_0_DEVICE_ID:
+			/* Can do only 1x1 VHT160 or 80+80.
+			 * 780Mbps is 2x2 80Mhz or 1x1 160Mhz,
+			 * long-guard-interval
+			 */
+			vht_cap.vht_mcs.rx_highest = 780;
+			vht_cap.vht_mcs.tx_highest = 780;
+			break;
 		}
 	}
 
-- 
2.11.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
