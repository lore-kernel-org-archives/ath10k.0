Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kh7TN-0001G6-DH
 for ath10k@lists.infradead.org; Mon, 23 Nov 2020 08:45:24 +0000
From: Wen Gong <wgong@codeaurora.org>
Subject: [PATCH] mac80211: change back to return true by default of
 ieee80211_chandef_he_6ghz_oper
Date: Mon, 23 Nov 2020 16:45:52 +0800
Message-Id: <1606121152-3452-1-git-send-email-wgong@codeaurora.org>
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
To: ath10k@lists.infradead.org, johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, wgong@codeaurora.org

The default value is true returned by ieee80211_chandef_he_6ghz_oper,
change it to true same with before.

Fixes: 1d00ce807efa ("mac80211: support S1G association")

Signed-off-by: Wen Gong <wgong@codeaurora.org>
---
 net/mac80211/util.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/mac80211/util.c b/net/mac80211/util.c
index 49342060490f..94e624e9439b 100644
--- a/net/mac80211/util.c
+++ b/net/mac80211/util.c
@@ -3455,7 +3455,7 @@ bool ieee80211_chandef_he_6ghz_oper(struct ieee80211_sub_if_data *sdata,
 
 	*chandef = he_chandef;
 
-	return false;
+	return true;
 }
 
 bool ieee80211_chandef_s1g_oper(const struct ieee80211_s1g_oper_ie *oper,
-- 
2.23.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
