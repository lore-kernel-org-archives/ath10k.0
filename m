Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mout.kundenserver.de ([212.227.17.13])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hkT6k-0004Bg-1r
 for ath10k@lists.infradead.org; Mon, 08 Jul 2019 12:51:03 +0000
From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] ath10k: work around uninitialized vht_pfr variable
Date: Mon,  8 Jul 2019 14:50:06 +0200
Message-Id: <20190708125050.3689133-1-arnd@arndb.de>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Sriram R <srirrama@codeaurora.org>, Arnd Bergmann <arnd@arndb.de>, Miaoqing Pan <miaoqing@codeaurora.org>, Pradeep kumar Chitrapu <pradeepc@codeaurora.org>, Balaji Pothunoori <bpothuno@codeaurora.org>, Brian Norris <briannorris@chromium.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, clang-built-linux@googlegroups.com, netdev@vger.kernel.org, Rakesh Pillai <pillair@codeaurora.org>, Wen Gong <wgong@codeaurora.org>, "David S. Miller" <davem@davemloft.net>

As clang points out, the vht_pfr is assigned to a struct member
without being initialized in one case:

drivers/net/wireless/ath/ath10k/mac.c:7528:7: error: variable 'vht_pfr' is used uninitialized whenever 'if' condition
      is false [-Werror,-Wsometimes-uninitialized]
                if (!ath10k_mac_can_set_bitrate_mask(ar, band, mask,
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/net/wireless/ath/ath10k/mac.c:7551:20: note: uninitialized use occurs here
                arvif->vht_pfr = vht_pfr;
                                 ^~~~~~~
drivers/net/wireless/ath/ath10k/mac.c:7528:3: note: remove the 'if' if its condition is always true
                if (!ath10k_mac_can_set_bitrate_mask(ar, band, mask,
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/net/wireless/ath/ath10k/mac.c:7483:12: note: initialize the variable 'vht_pfr' to silence this warning
        u8 vht_pfr;

Add an explicit but probably incorrect initialization here.
I suspect we want a better fix here, but chose this approach to
illustrate the issue.

Fixes: 8b97b055dc9d ("ath10k: fix failure to set multiple fixed rate")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/net/wireless/ath/ath10k/mac.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index e43a566eef77..0606416dc971 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -7541,6 +7541,8 @@ static int ath10k_mac_op_set_bitrate_mask(struct ieee80211_hw *hw,
 								&vht_nss,
 								true);
 			update_bitrate_mask = false;
+		} else {
+			vht_pfr = 0;
 		}
 
 		mutex_lock(&ar->conf_mutex);
-- 
2.20.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
