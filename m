Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fSheP-0006UI-4n
 for ath10k@lists.infradead.org; Tue, 12 Jun 2018 11:39:50 +0000
Received: by mail-lf0-x244.google.com with SMTP id y20-v6so35535467lfy.0
 for <ath10k@lists.infradead.org>; Tue, 12 Jun 2018 04:39:38 -0700 (PDT)
From: Niklas Cassel <niklas.cassel@linaro.org>
Subject: [PATCH 2/2] ath10k: allow ATH10K_SNOC with COMPILE_TEST
Date: Tue, 12 Jun 2018 13:39:06 +0200
Message-Id: <20180612113907.15043-2-niklas.cassel@linaro.org>
In-Reply-To: <20180612113907.15043-1-niklas.cassel@linaro.org>
References: <20180612113907.15043-1-niklas.cassel@linaro.org>
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
Cc: Niklas Cassel <niklas.cassel@linaro.org>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

ATH10K_SNOC builds just fine with COMPILE_TEST, so make that possible.

Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
---
 drivers/net/wireless/ath/ath10k/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/Kconfig b/drivers/net/wireless/ath/ath10k/Kconfig
index 54ff5930126c..6572a43590a8 100644
--- a/drivers/net/wireless/ath/ath10k/Kconfig
+++ b/drivers/net/wireless/ath/ath10k/Kconfig
@@ -42,7 +42,8 @@ config ATH10K_USB
 
 config ATH10K_SNOC
 	tristate "Qualcomm ath10k SNOC support (EXPERIMENTAL)"
-	depends on ATH10K && ARCH_QCOM
+	depends on ATH10K
+	depends on ARCH_QCOM || COMPILE_TEST
 	---help---
 	  This module adds support for integrated WCN3990 chip connected
 	  to system NOC(SNOC). Currently work in progress and will not
-- 
2.17.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
