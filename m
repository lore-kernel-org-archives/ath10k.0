Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDwBF-0001mI-H7
 for ath10k@lists.infradead.org; Tue, 09 Apr 2019 19:13:15 +0000
Received: by mail-lj1-x244.google.com with SMTP id j89so15536992ljb.1
 for <ath10k@lists.infradead.org>; Tue, 09 Apr 2019 12:13:13 -0700 (PDT)
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Subject: [PATCH 5/6] ath10k: sdio: add missing error check
Date: Tue,  9 Apr 2019 21:08:50 +0200
Message-Id: <20190409190851.4557-6-erik.stromdahl@gmail.com>
In-Reply-To: <20190409190851.4557-1-erik.stromdahl@gmail.com>
References: <20190409190851.4557-1-erik.stromdahl@gmail.com>
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
index 295e1e7ec3b0..3eb241cb8a25 100644
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
