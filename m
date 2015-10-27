Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x243.google.com ([2a00:1450:400c:c05::243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zr9Xq-0001dU-B0
 for ath10k@lists.infradead.org; Tue, 27 Oct 2015 19:04:30 +0000
Received: by wibvt6 with SMTP id vt6so29606450wib.3
 for <ath10k@lists.infradead.org>; Tue, 27 Oct 2015 12:04:08 -0700 (PDT)
From: Punit Vara <punitvara@gmail.com>
Subject: [RESEND PATCH 06/10] net: wireless: ath: simplify return flow for
 carl9170_regwrite_result()
Date: Wed, 28 Oct 2015 00:32:41 +0530
Message-Id: <1445972565-14963-6-git-send-email-punitvara@gmail.com>
In-Reply-To: <1445972565-14963-1-git-send-email-punitvara@gmail.com>
References: <1445972565-14963-1-git-send-email-punitvara@gmail.com>
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
To: kvalo@qca.qualcomm.com
Cc: netdev@vger.kernel.org, Punit Vara <punitvara@gmail.com>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

This patch is to the carl9170/phy.c file that fixes warning reported by
coccicheck :

 WARNING: end returns can be simplified

I have removed unneccessary variable declaration and simply return flow
for carl9170_regwrite_result()

Signed-off-by: Punit Vara <punitvara@gmail.com>
---
 drivers/net/wireless/ath/carl9170/phy.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/carl9170/phy.c b/drivers/net/wireless/ath/carl9170/phy.c
index dca6df1..f3b5434 100644
--- a/drivers/net/wireless/ath/carl9170/phy.c
+++ b/drivers/net/wireless/ath/carl9170/phy.c
@@ -966,7 +966,6 @@ static const struct carl9170_phy_freq_entry carl9170_phy_freq_params[] = {
 static int carl9170_init_rf_bank4_pwr(struct ar9170 *ar, bool band5ghz,
 				      u32 freq, enum carl9170_bw bw)
 {
-	int err;
 	u32 d0, d1, td0, td1, fd0, fd1;
 	u8 chansel;
 	u8 refsel0 = 1, refsel1 = 0;
@@ -1024,11 +1023,7 @@ static int carl9170_init_rf_bank4_pwr(struct ar9170 *ar, bool band5ghz,
 	carl9170_regwrite(0x1c58e8, fd1);
 
 	carl9170_regwrite_finish();
-	err = carl9170_regwrite_result();
-	if (err)
-		return err;
-
-	return 0;
+	return carl9170_regwrite_result();
 }
 
 static const struct carl9170_phy_freq_params *
-- 
2.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
