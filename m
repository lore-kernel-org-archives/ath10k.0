Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x242.google.com ([2a00:1450:400c:c05::242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zr9Y0-0001hX-K2
 for ath10k@lists.infradead.org; Tue, 27 Oct 2015 19:04:41 +0000
Received: by wicuv6 with SMTP id uv6so29614020wic.2
 for <ath10k@lists.infradead.org>; Tue, 27 Oct 2015 12:04:21 -0700 (PDT)
From: Punit Vara <punitvara@gmail.com>
Subject: [RESEND PATCH 08/10] net: wireless: brcm80211: Remove unneeded
 variable which return 0
Date: Wed, 28 Oct 2015 00:32:43 +0530
Message-Id: <1445972565-14963-8-git-send-email-punitvara@gmail.com>
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

This is patch to the brcmsmac/main.c that removes unnecessary variable
which was declared to return zero.

This patch fixes up warning reported by coccicheck:
-Unneeded variable: "err". Return "0" on line 3788

Signed-off-by: Punit Vara <punitvara@gmail.com>
---
 drivers/net/wireless/brcm80211/brcmsmac/main.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/wireless/brcm80211/brcmsmac/main.c b/drivers/net/wireless/brcm80211/brcmsmac/main.c
index 9728be0..9d717b6 100644
--- a/drivers/net/wireless/brcm80211/brcmsmac/main.c
+++ b/drivers/net/wireless/brcm80211/brcmsmac/main.c
@@ -3777,7 +3777,6 @@ static void brcms_c_set_ps_ctrl(struct brcms_c_info *wlc)
  */
 static int brcms_c_set_mac(struct brcms_bss_cfg *bsscfg)
 {
-	int err = 0;
 	struct brcms_c_info *wlc = bsscfg->wlc;
 
 	/* enter the MAC addr into the RXE match registers */
@@ -3785,7 +3784,7 @@ static int brcms_c_set_mac(struct brcms_bss_cfg *bsscfg)
 
 	brcms_c_ampdu_macaddr_upd(wlc);
 
-	return err;
+	return 0;
 }
 
 /* Write the BSS config's BSSID address to core (set_bssid in d11procs.tcl).
-- 
2.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
