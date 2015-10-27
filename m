Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x241.google.com ([2a00:1450:400c:c05::241])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zr9Xe-0001a1-D1
 for ath10k@lists.infradead.org; Tue, 27 Oct 2015 19:04:19 +0000
Received: by wiut4 with SMTP id t4so29635223wiu.0
 for <ath10k@lists.infradead.org>; Tue, 27 Oct 2015 12:03:56 -0700 (PDT)
From: Punit Vara <punitvara@gmail.com>
Subject: [RESEND PATCH 04/10] net: wireless: brcm80211: Remove duplicated
 arguments to |
Date: Wed, 28 Oct 2015 00:32:39 +0530
Message-Id: <1445972565-14963-4-git-send-email-punitvara@gmail.com>
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

Remove uncessary repeated arguments with OR(|)

This is patch to the brcmsmac/channel.c file that removes following
 warning reported by coccicheck:

-duplicated argument to & or |

Signed-off-by: Punit Vara <punitvara@gmail.com>
---
 drivers/net/wireless/brcm80211/brcmsmac/channel.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/brcm80211/brcmsmac/channel.c b/drivers/net/wireless/brcm80211/brcmsmac/channel.c
index 635ae03..d56fa03 100644
--- a/drivers/net/wireless/brcm80211/brcmsmac/channel.c
+++ b/drivers/net/wireless/brcm80211/brcmsmac/channel.c
@@ -652,7 +652,6 @@ static void brcms_reg_apply_radar_flags(struct wiphy *wiphy)
 		 */
 		if (!(ch->flags & IEEE80211_CHAN_DISABLED))
 			ch->flags |= IEEE80211_CHAN_RADAR |
-				     IEEE80211_CHAN_NO_IR |
 				     IEEE80211_CHAN_NO_IR;
 	}
 }
-- 
2.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
