Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ebb05.tieto.com ([131.207.168.36])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V3izu-0005Fv-Oy
 for ath10k@lists.infradead.org; Mon, 29 Jul 2013 08:40:07 +0000
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [RFC 3/3] ath10k: respect chan_time parameter in scan request
Date: Mon, 29 Jul 2013 10:39:18 +0200
Message-ID: <1375087158-22077-4-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1375087158-22077-1-git-send-email-michal.kazior@tieto.com>
References: <1375087158-22077-1-git-send-email-michal.kazior@tieto.com>
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
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>, ath10k@lists.infradead.org

Respect the new scan request parameter.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index da5c333..cd20a20 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -2150,6 +2150,12 @@ static int ath10k_hw_scan(struct ieee80211_hw *hw,
 	arg.vdev_id = arvif->vdev_id;
 	arg.scan_id = ATH10K_SCAN_ID;
 
+	if (req->chan_time) {
+		arg.dwell_time_active = req->chan_time;
+		arg.dwell_time_passive = req->chan_time;
+		arg.max_scan_time = 2 * req->chan_time * req->n_channels;
+	}
+
 	if (!req->no_cck)
 		arg.scan_ctrl_flags |= WMI_SCAN_ADD_CCK_RATES;
 
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
