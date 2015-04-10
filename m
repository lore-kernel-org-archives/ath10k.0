Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x230.google.com ([2a00:1450:4010:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YgZ1T-0001rE-5J
 for ath10k@lists.infradead.org; Fri, 10 Apr 2015 13:31:04 +0000
Received: by lagv1 with SMTP id v1so13247663lag.3
 for <ath10k@lists.infradead.org>; Fri, 10 Apr 2015 06:30:42 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 1/4] ath10k: don't use reassoc flag
Date: Fri, 10 Apr 2015 13:23:20 +0000
Message-Id: <1428672203-8604-2-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1428672203-8604-1-git-send-email-michal.kazior@tieto.com>
References: <1428672203-8604-1-git-send-email-michal.kazior@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

Firmware actually re-creates peer entry when
reassoc flag is set. This is undesired and could
cause trouble with IBSS crypto-wise. This is also
important for upcomming bitrate mask improvement.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index a7a84f52b8b4..6664bcc9ba88 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -2593,7 +2593,6 @@ static int ath10k_station_assoc(struct ath10k *ar,
 		return ret;
 	}
 
-	peer_arg.peer_reassoc = reassoc;
 	ret = ath10k_wmi_peer_assoc(ar, &peer_arg);
 	if (ret) {
 		ath10k_warn(ar, "failed to run peer assoc for STA %pM vdev %i: %d\n",
-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
