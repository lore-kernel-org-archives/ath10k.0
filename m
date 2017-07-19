Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dXr2X-0000IJ-Or
 for ath10k@lists.infradead.org; Wed, 19 Jul 2017 15:37:31 +0000
Received: by mail-wm0-x244.google.com with SMTP id p204so532114wmg.1
 for <ath10k@lists.infradead.org>; Wed, 19 Jul 2017 08:37:09 -0700 (PDT)
From: Gabriel C <nix.or.die@gmail.com>
Subject: [PATCH] ath10k_htt_rx_amsdu_allowed(): use ath10k_dbg()
Message-ID: <288fce5b-d738-f0ac-2433-67e1b35a0664@gmail.com>
Date: Wed, 19 Jul 2017 17:37:08 +0200
MIME-Version: 1.0
Content-Language: en-US
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Kalle Valo <kvalo@qca.qualcomm.com>, Ryan Hsu <ryanhsu@qti.qualcomm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>


         Each time we get disconencted from AP we get flooded with messages like:

         ...
         ath10k_pci 0000:03:00.0: no channel configured; ignoring frame(s)!
         <until ratelimit kicks in>
         ath10k_warn: 155 callbacks suppressed
         ...

         Use ath10k_dbg() here too.

Signed-off-by: Gabriel Craciunescu <nix.or.die@gmail.com>
---
  drivers/net/wireless/ath/ath10k/htt_rx.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 398dda978d6e..75d9b59b7e63 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -1514,7 +1514,7 @@ static bool ath10k_htt_rx_amsdu_allowed(struct ath10k *ar,
          */

         if (!rx_status->freq) {
-               ath10k_warn(ar, "no channel configured; ignoring frame(s)!\n");
+               ath10k_dbg(ar, ATH10K_DBG_HTT, "no channel configured; ignoring frame(s)!\n");
                 return false;
         }

-- 
2.13.3

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
