Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-15.mailgun.net ([69.72.43.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1km7JJ-0007se-Dw
 for ath10k@lists.infradead.org; Mon, 07 Dec 2020 03:35:39 +0000
From: Wen Gong <wgong@codeaurora.org>
Subject: [PATCH 0/2] mac80211/ath10k: save ssid info for STATION mode
Date: Mon,  7 Dec 2020 11:36:33 +0800
Message-Id: <1607312195-3583-1-git-send-email-wgong@codeaurora.org>
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

save the ssid info for STATION mode which could be used for ath10k to
get the corret/exact cfg80211_bss.

Wen Gong (2):
  mac80211: save ssid info to ieee80211_bss_conf while assoc
  ath10k: pass the ssid info to get the correct bss entity

 drivers/net/wireless/ath/ath10k/mac.c | 3 ++-
 net/mac80211/mlme.c                   | 3 +++
 2 files changed, 5 insertions(+), 1 deletion(-)

-- 
2.23.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
