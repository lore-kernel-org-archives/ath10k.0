Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-185.smtp-out.us-west-2.amazonses.com ([54.240.27.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iaan9-0001gF-3e
 for ath10k@lists.infradead.org; Fri, 29 Nov 2019 07:34:16 +0000
From: Wen Gong <wgong@codeaurora.org>
Subject: [PATCH] ath: add support for special 0x0 regulatory domain
Date: Fri, 29 Nov 2019 07:34:09 +0000
Message-ID: <0101016eb614d48f-c13bb166-f01f-41ed-b12b-332bb69e5f06-000000@us-west-2.amazonses.com>
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

Some sdio chips of rome QCA6174's regulatory domain code of EEPROM is
empty, then ath_is_world_regd will return false for this case, and
it will lead function __ath_reg_dyn_country not work, thus the regdomain
will not update for NL80211_REGDOM_SET_BY_COUNTRY_IE type, it result
ath10k set the same regdomain/reg_5ghz_ctl/reg_2ghz_ctl to firmware,
then the tx power will not changed with different regdomain's AP. The
regulatory domain code of EEPROM of some QCA6174 PCIE chip is 0x6c, it
means world wide regdomain, for this chip, it does not have the issue.

For empty reulatory domain code chip, set it to world regulatory domain
in functio ath_regd_sanitize, then it will fix the issue.

Tested with QCA6174 SDIO with firmware
WLAN.RMH.4.4.1-00029.

Signed-off-by: Wen Gong <wgong@codeaurora.org>
---
 drivers/net/wireless/ath/regd.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/regd.c b/drivers/net/wireless/ath/regd.c
index 20f4f8ea9f89..bee9110b91f3 100644
--- a/drivers/net/wireless/ath/regd.c
+++ b/drivers/net/wireless/ath/regd.c
@@ -666,14 +666,14 @@ ath_regd_init_wiphy(struct ath_regulatory *reg,
 
 /*
  * Some users have reported their EEPROM programmed with
- * 0x8000 set, this is not a supported regulatory domain
- * but since we have more than one user with it we need
- * a solution for them. We default to 0x64, which is the
- * default Atheros world regulatory domain.
+ * 0x8000 or 0x0 set, this is not a supported regulatory
+ * domain but since we have more than one user with it we
+ * need a solution for them. We default to 0x64, which is
+ * the default Atheros world regulatory domain.
  */
 static void ath_regd_sanitize(struct ath_regulatory *reg)
 {
-	if (reg->current_rd != COUNTRY_ERD_FLAG)
+	if (reg->current_rd != COUNTRY_ERD_FLAG && reg->current_rd != 0)
 		return;
 	printk(KERN_DEBUG "ath: EEPROM regdomain sanitized\n");
 	reg->current_rd = 0x64;
-- 
2.23.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
