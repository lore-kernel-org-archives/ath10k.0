Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh03.mail.saunalahti.fi ([62.142.5.109])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WDt2o-0000M6-Eb
 for ath10k@lists.infradead.org; Thu, 13 Feb 2014 09:57:23 +0000
Subject: [PATCH 2/3] ath: remove camel case from struct reg_dmn_pair_mapping
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Thu, 13 Feb 2014 11:56:58 +0200
Message-ID: <20140213095658.13999.99721.stgit@potku.adurom.net>
In-Reply-To: <20140213095652.13999.63855.stgit@potku.adurom.net>
References: <20140213095652.13999.63855.stgit@potku.adurom.net>
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

Fixes a checkpatch warning in ath10k:

drivers/net/wireless/ath/ath10k/mac.c:1636: WARNING: Avoid CamelCase: <regpair->regDmnEnum>

Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath.h        |    2 +-
 drivers/net/wireless/ath/ath10k/mac.c |    6 +++---
 drivers/net/wireless/ath/ath6kl/wmi.c |    4 ++--
 drivers/net/wireless/ath/regd.c       |   10 +++++-----
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/ath/ath.h b/drivers/net/wireless/ath/ath.h
index b59cfbe..2f4f251 100644
--- a/drivers/net/wireless/ath/ath.h
+++ b/drivers/net/wireless/ath/ath.h
@@ -63,7 +63,7 @@ enum ath_bus_type {
 };
 
 struct reg_dmn_pair_mapping {
-	u16 regDmnEnum;
+	u16 reg_domain;
 	u16 reg_5ghz_ctl;
 	u16 reg_2ghz_ctl;
 };
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 144b4d6..a57dc20 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -1633,9 +1633,9 @@ static void ath10k_regd_update(struct ath10k *ar)
 	/* Target allows setting up per-band regdomain but ath_common provides
 	 * a combined one only */
 	ret = ath10k_wmi_pdev_set_regdomain(ar,
-					    regpair->regDmnEnum,
-					    regpair->regDmnEnum, /* 2ghz */
-					    regpair->regDmnEnum, /* 5ghz */
+					    regpair->reg_domain,
+					    regpair->reg_domain, /* 2ghz */
+					    regpair->reg_domain, /* 5ghz */
 					    regpair->reg_2ghz_ctl,
 					    regpair->reg_5ghz_ctl);
 	if (ret)
diff --git a/drivers/net/wireless/ath/ath6kl/wmi.c b/drivers/net/wireless/ath/ath6kl/wmi.c
index 4f16d79..8b4ce28 100644
--- a/drivers/net/wireless/ath/ath6kl/wmi.c
+++ b/drivers/net/wireless/ath/ath6kl/wmi.c
@@ -914,7 +914,7 @@ ath6kl_get_regpair(u16 regdmn)
 		return NULL;
 
 	for (i = 0; i < ARRAY_SIZE(regDomainPairs); i++) {
-		if (regDomainPairs[i].regDmnEnum == regdmn)
+		if (regDomainPairs[i].reg_domain == regdmn)
 			return &regDomainPairs[i];
 	}
 
@@ -954,7 +954,7 @@ static void ath6kl_wmi_regdomain_event(struct wmi *wmi, u8 *datap, int len)
 		country = ath6kl_regd_find_country_by_rd((u16) reg_code);
 		if (regpair)
 			ath6kl_dbg(ATH6KL_DBG_WMI, "Regpair used: 0x%0x\n",
-				   regpair->regDmnEnum);
+				   regpair->reg_domain);
 		else
 			ath6kl_warn("Regpair not found reg_code 0x%0x\n",
 				    reg_code);
diff --git a/drivers/net/wireless/ath/regd.c b/drivers/net/wireless/ath/regd.c
index e5e9059..415393d 100644
--- a/drivers/net/wireless/ath/regd.c
+++ b/drivers/net/wireless/ath/regd.c
@@ -222,7 +222,7 @@ static const struct ieee80211_regdomain *ath_default_world_regdomain(void)
 static const struct
 ieee80211_regdomain *ath_world_regdomain(struct ath_regulatory *reg)
 {
-	switch (reg->regpair->regDmnEnum) {
+	switch (reg->regpair->reg_domain) {
 	case 0x60:
 	case 0x61:
 	case 0x62:
@@ -431,7 +431,7 @@ static void ath_reg_apply_world_flags(struct wiphy *wiphy,
 				      enum nl80211_reg_initiator initiator,
 				      struct ath_regulatory *reg)
 {
-	switch (reg->regpair->regDmnEnum) {
+	switch (reg->regpair->reg_domain) {
 	case 0x60:
 	case 0x63:
 	case 0x66:
@@ -560,7 +560,7 @@ static bool ath_regd_is_eeprom_valid(struct ath_regulatory *reg)
 			printk(KERN_DEBUG "ath: EEPROM indicates we "
 			       "should expect a direct regpair map\n");
 		for (i = 0; i < ARRAY_SIZE(regDomainPairs); i++)
-			if (regDomainPairs[i].regDmnEnum == rd)
+			if (regDomainPairs[i].reg_domain == rd)
 				return true;
 	}
 	printk(KERN_DEBUG
@@ -617,7 +617,7 @@ ath_get_regpair(int regdmn)
 	if (regdmn == NO_ENUMRD)
 		return NULL;
 	for (i = 0; i < ARRAY_SIZE(regDomainPairs); i++) {
-		if (regDomainPairs[i].regDmnEnum == regdmn)
+		if (regDomainPairs[i].reg_domain == regdmn)
 			return &regDomainPairs[i];
 	}
 	return NULL;
@@ -741,7 +741,7 @@ static int __ath_regd_init(struct ath_regulatory *reg)
 	printk(KERN_DEBUG "ath: Country alpha2 being used: %c%c\n",
 		reg->alpha2[0], reg->alpha2[1]);
 	printk(KERN_DEBUG "ath: Regpair used: 0x%0x\n",
-		reg->regpair->regDmnEnum);
+		reg->regpair->reg_domain);
 
 	return 0;
 }


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
