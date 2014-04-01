Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-we0-x22e.google.com ([2a00:1450:400c:c03::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WUtza-0002Yo-1f
 for ath10k@lists.infradead.org; Tue, 01 Apr 2014 08:24:23 +0000
Received: by mail-we0-f174.google.com with SMTP id t60so5807597wes.19
 for <ath10k@lists.infradead.org>; Tue, 01 Apr 2014 01:23:56 -0700 (PDT)
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Subject: [PATCH] ath10k: remove not needed warning when peer unmap
Date: Tue,  1 Apr 2014 10:23:48 +0200
Message-Id: <1396340628-4570-1-git-send-email-janusz.dziedzic@tieto.com>
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

Remove not needed warning when get peer unmap
event from the firmware. This is not critical
message. Instead print this as a debug message.

Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>
---
 drivers/net/wireless/ath/ath10k/txrx.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/txrx.c b/drivers/net/wireless/ath/ath10k/txrx.c
index 82669a7..b7f4acc 100644
--- a/drivers/net/wireless/ath/ath10k/txrx.c
+++ b/drivers/net/wireless/ath/ath10k/txrx.c
@@ -200,7 +200,7 @@ void ath10k_peer_unmap_event(struct ath10k_htt *htt,
 	spin_lock_bh(&ar->data_lock);
 	peer = ath10k_peer_find_by_id(ar, ev->peer_id);
 	if (!peer) {
-		ath10k_warn("peer-unmap-event: unknown peer id %d\n",
+		ath10k_dbg(ATH10K_DBG_HTT, "peer-unmap-event: unknown peer id %d\n",
 			    ev->peer_id);
 		goto exit;
 	}
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
