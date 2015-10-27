Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x230.google.com ([2a00:1450:400c:c05::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zr9Y8-0001k3-KO
 for ath10k@lists.infradead.org; Tue, 27 Oct 2015 19:04:49 +0000
Received: by wijp11 with SMTP id p11so228419139wij.0
 for <ath10k@lists.infradead.org>; Tue, 27 Oct 2015 12:04:27 -0700 (PDT)
From: Punit Vara <punitvara@gmail.com>
Subject: [RESEND PATCH 09/10] net: wireless: brcm80211: Remove unneeded
 variable ret_code returning 0
Date: Wed, 28 Oct 2015 00:32:44 +0530
Message-Id: <1445972565-14963-9-git-send-email-punitvara@gmail.com>
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

This patch is to the brcmsmac/stf.c that fixes up warning caught by
coccicheck:

-Unneeded variable: "ret_code". Return "0" on line 328

Remove unneccesary variable ret_code created to return zero.

Signed-off-by: Punit Vara <punitvara@gmail.com>
---
 drivers/net/wireless/brcm80211/brcmsmac/stf.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/brcm80211/brcmsmac/stf.c b/drivers/net/wireless/brcm80211/brcmsmac/stf.c
index dd91627..71ddf42 100644
--- a/drivers/net/wireless/brcm80211/brcmsmac/stf.c
+++ b/drivers/net/wireless/brcm80211/brcmsmac/stf.c
@@ -306,7 +306,6 @@ int brcms_c_stf_txchain_set(struct brcms_c_info *wlc, s32 int_val, bool force)
  */
 int brcms_c_stf_ss_update(struct brcms_c_info *wlc, struct brcms_band *band)
 {
-	int ret_code = 0;
 	u8 prev_stf_ss;
 	u8 upd_stf_ss;
 
@@ -325,7 +324,7 @@ int brcms_c_stf_ss_update(struct brcms_c_info *wlc, struct brcms_band *band)
 				    PHY_TXC1_MODE_SISO : PHY_TXC1_MODE_CDD;
 	} else {
 		if (wlc->band != band)
-			return ret_code;
+			return 0;
 		upd_stf_ss = (wlc->stf->txstreams == 1) ?
 				PHY_TXC1_MODE_SISO : band->band_stf_ss_mode;
 	}
@@ -334,7 +333,7 @@ int brcms_c_stf_ss_update(struct brcms_c_info *wlc, struct brcms_band *band)
 		brcms_b_band_stf_ss_set(wlc->hw, upd_stf_ss);
 	}
 
-	return ret_code;
+	return 0;
 }
 
 int brcms_c_stf_attach(struct brcms_c_info *wlc)
-- 
2.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
