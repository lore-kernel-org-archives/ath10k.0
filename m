Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x22e.google.com ([2a00:1450:4010:c07::22e])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bUYhN-0007Ax-9j
 for ath10k@lists.infradead.org; Tue, 02 Aug 2016 12:21:32 +0000
Received: by mail-lf0-x22e.google.com with SMTP id g62so136906417lfe.3
 for <ath10k@lists.infradead.org>; Tue, 02 Aug 2016 05:21:07 -0700 (PDT)
From: Bartosz Markowski <bartosz.markowski@tieto.com>
Subject: [PATCH 1/2] ath: export alpha2 helper
Date: Tue,  2 Aug 2016 14:20:53 +0200
Message-Id: <1470140454-3899-2-git-send-email-bartosz.markowski@tieto.com>
In-Reply-To: <1470140454-3899-1-git-send-email-bartosz.markowski@tieto.com>
References: <1470140454-3899-1-git-send-email-bartosz.markowski@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>, Bartosz Markowski <bartosz.markowski@tieto.com>

From: Michal Kazior <michal.kazior@tieto.com>

This will be helpful for drivers that can acquire
alpha2 regulatory codes.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>
---
 drivers/net/wireless/ath/regd.c | 3 ++-
 drivers/net/wireless/ath/regd.h | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/regd.c b/drivers/net/wireless/ath/regd.c
index 7e15ed9ed31f..820bf880ada3 100644
--- a/drivers/net/wireless/ath/regd.c
+++ b/drivers/net/wireless/ath/regd.c
@@ -449,7 +449,7 @@ static void ath_reg_apply_world_flags(struct wiphy *wiphy,
 	}
 }
 
-static u16 ath_regd_find_country_by_name(char *alpha2)
+u16 ath_regd_find_country_by_name(char *alpha2)
 {
 	unsigned int i;
 
@@ -460,6 +460,7 @@ static u16 ath_regd_find_country_by_name(char *alpha2)
 
 	return -1;
 }
+EXPORT_SYMBOL(ath_regd_find_country_by_name);
 
 static int __ath_reg_dyn_country(struct wiphy *wiphy,
 				 struct ath_regulatory *reg,
diff --git a/drivers/net/wireless/ath/regd.h b/drivers/net/wireless/ath/regd.h
index 565d3075f06e..5d80be213fac 100644
--- a/drivers/net/wireless/ath/regd.h
+++ b/drivers/net/wireless/ath/regd.h
@@ -251,6 +251,7 @@ enum CountryCode {
 
 bool ath_is_world_regd(struct ath_regulatory *reg);
 bool ath_is_49ghz_allowed(u16 redomain);
+u16 ath_regd_find_country_by_name(char *alpha2);
 int ath_regd_init(struct ath_regulatory *reg, struct wiphy *wiphy,
 		  void (*reg_notifier)(struct wiphy *wiphy,
 				       struct regulatory_request *request));
-- 
2.1.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
