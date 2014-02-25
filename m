Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x22d.google.com ([2a00:1450:4013:c00::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WIBzX-00061E-Nv
 for ath10k@lists.infradead.org; Tue, 25 Feb 2014 06:59:48 +0000
Received: by mail-ee0-f45.google.com with SMTP id d17so118321eek.4
 for <ath10k@lists.infradead.org>; Mon, 24 Feb 2014 22:59:23 -0800 (PST)
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Subject: [PATCH] ath10k: enable spectrum management support
Date: Tue, 25 Feb 2014 07:59:14 +0100
Message-Id: <1393311554-8131-1-git-send-email-janusz.dziedzic@tieto.com>
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
Cc: Janusz Dziedzic <janusz.dziedzic@tieto.com>, linux-wireless@vger.kernel.org

Indicate spectrum management support in hardware
flags, while we already handle power set
(IEEE80211_CONF_CHANGE_POWER) in the ath10k driver.
This enable 802.11h support for station mode.

Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 1e0308f..78fc4f5 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -4235,7 +4235,8 @@ int ath10k_mac_register(struct ath10k *ar)
 			IEEE80211_HW_HAS_RATE_CONTROL |
 			IEEE80211_HW_SUPPORTS_STATIC_SMPS |
 			IEEE80211_HW_WANT_MONITOR_VIF |
-			IEEE80211_HW_AP_LINK_PS;
+			IEEE80211_HW_AP_LINK_PS |
+			IEEE80211_HW_SPECTRUM_MGMT;
 
 	/* MSDU can have HTT TX fragment pushed in front. The additional 4
 	 * bytes is used for padding/alignment if necessary. */
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
