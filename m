Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ebb05.tieto.com ([131.207.168.36])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V4SC9-0007fM-Fu
 for ath10k@lists.infradead.org; Wed, 31 Jul 2013 08:55:47 +0000
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 2/5] ath10k: make sure to use passive scan when n_ssids is 0
Date: Wed, 31 Jul 2013 10:55:12 +0200
Message-ID: <1375260915-22500-3-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1375260915-22500-1-git-send-email-michal.kazior@tieto.com>
References: <1375260915-22500-1-git-send-email-michal.kazior@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

Normally user specifies broadcast ssid for
scanning. If the user wants to do a passive scan
it does not pass any ssids.

The patch makes sure we ath10k tells firmware to
not send anything at all in case it decides no
ssids equals broadcast ssid.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 344ad27..1ea386e 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -2338,6 +2338,8 @@ static int ath10k_hw_scan(struct ieee80211_hw *hw,
 			arg.ssids[i].len  = req->ssids[i].ssid_len;
 			arg.ssids[i].ssid = req->ssids[i].ssid;
 		}
+	} else {
+		arg.scan_ctrl_flags |= WMI_SCAN_FLAG_PASSIVE;
 	}
 
 	if (req->n_channels) {
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
