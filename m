Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mezzanine.sirena.org.uk ([2400:8900::f03c:91ff:fedb:4f4])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a1vTA-0000YB-CV
 for ath10k@lists.infradead.org; Thu, 26 Nov 2015 12:16:13 +0000
From: Mark Brown <broonie@kernel.org>
Date: Thu, 26 Nov 2015 12:15:35 +0000
Message-Id: <1448540135-9388-1-git-send-email-broonie@kernel.org>
Subject: [PATCH] ath10k: Fix check for !THERMAL case
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

When defining stubs for !THERMAL cases we currently check if CONFIG_THERMAL
is defined but this fails when the thermal code is built as a module in
which case CONFIG_THERMAL_MODULE is defined instead causing us to define
the stubs as well as building the actual ath10k thermal code which in turn
causes the build to fail on arm64 allmodconfig. Fix this by changing the
check in the header to use IS_ENABLED().

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/net/wireless/ath/ath10k/thermal.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/thermal.h b/drivers/net/wireless/ath/ath10k/thermal.h
index b610ea5caae8..793eec160e65 100644
--- a/drivers/net/wireless/ath/ath10k/thermal.h
+++ b/drivers/net/wireless/ath/ath10k/thermal.h
@@ -36,7 +36,7 @@ struct ath10k_thermal {
 	int temperature;
 };
 
-#ifdef CONFIG_THERMAL
+#if IS_ENABLED(CONFIG_THERMAL)
 int ath10k_thermal_register(struct ath10k *ar);
 void ath10k_thermal_unregister(struct ath10k *ar);
 void ath10k_thermal_event_temperature(struct ath10k *ar, int temperature);
-- 
2.6.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
