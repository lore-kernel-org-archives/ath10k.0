Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from conuserg-08.nifty.com ([210.131.2.75])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bcEaM-00006z-Ru
 for ath10k@lists.infradead.org; Tue, 23 Aug 2016 16:30:00 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] ath10k: replace config_enabled() with IS_REACHABLE()
Date: Wed, 24 Aug 2016 01:27:26 +0900
Message-Id: <1471969646-13119-1-git-send-email-yamada.masahiro@socionext.com>
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
To: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Kalle Valo <kvalo@qca.qualcomm.com>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, netdev@vger.kernel.org

Commit 97f2645f358b ("tree-wide: replace config_enabled() with
IS_ENABLED()") mostly did away with config_enabled().

This is one of the postponed TODO items as config_enabled() is used
for a tristate option here.  Theoretically, config_enabled() is
equivalent to IS_BUILTIN(), but I guess IS_REACHABLE() is the best
fit for this case because both CONFIG_HWMON and CONFIG_ATH10K are
tristate.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/net/wireless/ath/ath10k/thermal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/thermal.c b/drivers/net/wireless/ath/ath10k/thermal.c
index 444b52c..0a47269 100644
--- a/drivers/net/wireless/ath/ath10k/thermal.c
+++ b/drivers/net/wireless/ath/ath10k/thermal.c
@@ -192,7 +192,7 @@ int ath10k_thermal_register(struct ath10k *ar)
 
 	/* Avoid linking error on devm_hwmon_device_register_with_groups, I
 	 * guess linux/hwmon.h is missing proper stubs. */
-	if (!config_enabled(CONFIG_HWMON))
+	if (!IS_REACHABLE(CONFIG_HWMON))
 		return 0;
 
 	hwmon_dev = devm_hwmon_device_register_with_groups(ar->dev,
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
