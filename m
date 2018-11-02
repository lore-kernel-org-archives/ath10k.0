Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mout.kundenserver.de ([212.227.126.134])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gIc9x-0006Lw-1A
 for ath10k@lists.infradead.org; Fri, 02 Nov 2018 16:18:59 +0000
From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] ath10k: avoid -Wmaybe-uninitialized warning
Date: Fri,  2 Nov 2018 17:17:19 +0100
Message-Id: <20181102161833.2956376-1-arnd@arndb.de>
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
To: Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>
Cc: Sriram R <srirrama@codeaurora.org>, Arnd Bergmann <arnd@arndb.de>, Balaji Pothunoori <bpothuno@codeaurora.org>, Anilkumar Kolli <akolli@codeaurora.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, Yingying Tang <yintang@qti.qualcomm.com>, Rakesh Pillai <pillair@codeaurora.org>, ath10k@lists.infradead.org, netdev@vger.kernel.org

In some configurations the inlining in gcc is suboptimal, causing
a false-positive warning:

drivers/net/wireless/ath/ath10k/mac.c: In function 'ath10k_mac_init_rd':
drivers/net/wireless/ath/ath10k/mac.c:8374:39: error: 'rd' may be used uninitialized in this function [-Werror=maybe-uninitialized]
  ar->ath_common.regulatory.current_rd = rd;

If we initialize the output of ath10k_mac_get_wrdd_regulatory()
before returning, this problem goes away.

Fixes: 209b2a68de76 ("ath10k: add platform regulatory domain support")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/net/wireless/ath/ath10k/mac.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index a1c2801ded10..0d5fde28ee44 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -8321,6 +8321,8 @@ static int ath10k_mac_get_wrdd_regulatory(struct ath10k *ar, u16 *rd)
 	u32 alpha2_code;
 	char alpha2[3];
 
+	*rd = ar->hw_eeprom_rd;
+
 	root_handle = ACPI_HANDLE(&pdev->dev);
 	if (!root_handle)
 		return -EOPNOTSUPP;
@@ -8365,11 +8367,9 @@ static int ath10k_mac_init_rd(struct ath10k *ar)
 	u16 rd;
 
 	ret = ath10k_mac_get_wrdd_regulatory(ar, &rd);
-	if (ret) {
+	if (ret)
 		ath10k_dbg(ar, ATH10K_DBG_BOOT,
 			   "fallback to eeprom programmed regulatory settings\n");
-		rd = ar->hw_eeprom_rd;
-	}
 
 	ar->ath_common.regulatory.current_rd = rd;
 	return 0;
-- 
2.18.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
