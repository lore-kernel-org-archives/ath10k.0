Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22b.google.com ([2a00:1450:400c:c05::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zr9YD-0001mG-Tp
 for ath10k@lists.infradead.org; Tue, 27 Oct 2015 19:04:54 +0000
Received: by wicfv8 with SMTP id fv8so176589006wic.0
 for <ath10k@lists.infradead.org>; Tue, 27 Oct 2015 12:04:32 -0700 (PDT)
From: Punit Vara <punitvara@gmail.com>
Subject: [RESEND PATCH 10/10] net: wireless: ath: Remove unneeded variable ret
 returning 0
Date: Wed, 28 Oct 2015 00:32:45 +0530
Message-Id: <1445972565-14963-10-git-send-email-punitvara@gmail.com>
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

This patch is to the ath5k/eeprom.c that fixes up warning caught by
coccicheck:

-Unneeded variable: "ret". Return "0" on line 1733

Remove unneccesary variable ret created to return zero.

Signed-off-by: Punit Vara <punitvara@gmail.com>
---
 drivers/net/wireless/ath/ath5k/eeprom.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath5k/eeprom.c b/drivers/net/wireless/ath/ath5k/eeprom.c
index 94d34ee..673ab8d 100644
--- a/drivers/net/wireless/ath/ath5k/eeprom.c
+++ b/drivers/net/wireless/ath/ath5k/eeprom.c
@@ -1707,7 +1707,7 @@ ath5k_eeprom_read_spur_chans(struct ath5k_hw *ah)
 	struct ath5k_eeprom_info *ee = &ah->ah_capabilities.cap_eeprom;
 	u32 offset;
 	u16 val;
-	int ret = 0, i;
+	int i;
 
 	offset = AR5K_EEPROM_CTL(ee->ee_version) +
 				AR5K_EEPROM_N_CTLS(ee->ee_version);
@@ -1730,7 +1730,7 @@ ath5k_eeprom_read_spur_chans(struct ath5k_hw *ah)
 		}
 	}
 
-	return ret;
+	return 0;
 }
 
 
-- 
2.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
