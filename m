Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGq1q-0007Ft-S3
 for ath10k@lists.infradead.org; Wed, 17 Apr 2019 19:15:32 +0000
Received: by mail-lf1-x141.google.com with SMTP id w23so19690982lfc.9
 for <ath10k@lists.infradead.org>; Wed, 17 Apr 2019 12:15:30 -0700 (PDT)
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Subject: [PATCH v2 4/5] ath10k: sdio: add missing error check
Date: Wed, 17 Apr 2019 21:15:02 +0200
Message-Id: <20190417191503.18814-5-erik.stromdahl@gmail.com>
In-Reply-To: <20190417191503.18814-1-erik.stromdahl@gmail.com>
References: <20190417191503.18814-1-erik.stromdahl@gmail.com>
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
To: kvalo@qca.qualcomm.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
Cc: Erik Stromdahl <erik.stromdahl@gmail.com>

Although not likely, the bundle allocation might fail.
Add proper error check and warning print.

Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
---
 drivers/net/wireless/ath/ath10k/sdio.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index b89732aad97c..b8b3059721ee 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -586,6 +586,11 @@ static int ath10k_sdio_mbox_rx_alloc(struct ath10k *ar,
 								act_len,
 								&bndl_cnt);
 
+			if (ret) {
+				ath10k_warn(ar, "alloc_bundle error %d\n", ret);
+				goto err;
+			}
+
 			n_lookaheads += bndl_cnt;
 			i += bndl_cnt;
 			/*Next buffer will be the last in the bundle */
-- 
2.19.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
