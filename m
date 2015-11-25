Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh03.mail.saunalahti.fi ([62.142.5.109])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a1aHG-0002Fg-Ao
 for ath10k@lists.infradead.org; Wed, 25 Nov 2015 13:38:31 +0000
Subject: [PATCH 1/6] ath10k: fix otp board id error message
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Wed, 25 Nov 2015 15:38:05 +0200
Message-ID: <20151125133804.25507.64575.stgit@potku.adurom.net>
In-Reply-To: <20151125133654.25507.10863.stgit@potku.adurom.net>
References: <20151125133654.25507.10863.stgit@potku.adurom.net>
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
Cc: linux-wireless@vger.kernel.org

We check board id from all board types, not just qca99x0, so the error message
was misleading.

Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index f128adbae454..78fe1863ad04 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -1753,7 +1753,7 @@ static int ath10k_core_probe_fw(struct ath10k *ar)
 
 	ret = ath10k_core_get_board_id_from_otp(ar);
 	if (ret && ret != -EOPNOTSUPP) {
-		ath10k_err(ar, "failed to get board id from otp for qca99x0: %d\n",
+		ath10k_err(ar, "failed to get board id from otp: %d\n",
 			   ret);
 		return ret;
 	}


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
