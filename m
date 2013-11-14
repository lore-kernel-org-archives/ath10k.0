Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ebb05.tieto.com ([131.207.168.36])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VgrsJ-0000Vg-Ad
 for ath10k@lists.infradead.org; Thu, 14 Nov 2013 08:02:04 +0000
From: Bartosz Markowski <bartosz.markowski@tieto.com>
Subject: [PATCH] ath10k: expand the wmi mgmt queue limit to 128
Date: Thu, 14 Nov 2013 09:01:15 +0100
Message-ID: <1384416075-13751-1-git-send-email-bartosz.markowski@tieto.com>
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

It was obseverd many times the short queue limit can be
easily exceeded in case of AP multiple BSSID scenarios.

"ath10k: wmi mgmt_tx queue limit reached."

This was leading to TX packets drops.

This patch expands the queue limit to 128. After many stress
experiments (high traffic and lot of management frames in
the air) the new value seems to fix the problem on platforms
with limited resources.

Reported-By: Tomasz Skapski <tomasz.skapski@tieto.com>
Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>
---
 drivers/net/wireless/ath/ath10k/core.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 0934f76..be35df2 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -43,7 +43,7 @@
 /* Antenna noise floor */
 #define ATH10K_DEFAULT_NOISE_FLOOR -95
 
-#define ATH10K_MAX_NUM_MGMT_PENDING 16
+#define ATH10K_MAX_NUM_MGMT_PENDING 128
 
 struct ath10k;
 
-- 
1.7.10


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
