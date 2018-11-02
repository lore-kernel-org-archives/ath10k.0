Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gId5n-0002K9-G2
 for ath10k@lists.infradead.org; Fri, 02 Nov 2018 17:18:44 +0000
Received: by mail-pl1-x644.google.com with SMTP id s5-v6so1288036plq.11
 for <ath10k@lists.infradead.org>; Fri, 02 Nov 2018 10:18:33 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
Subject: [PATCH 3/3] ath10k: fix struct init whitespace in SNOC driver
Date: Fri,  2 Nov 2018 10:17:49 -0700
Message-Id: <20181102171749.38680-3-briannorris@chromium.org>
In-Reply-To: <20181102171749.38680-1-briannorris@chromium.org>
References: <20181102171749.38680-1-briannorris@chromium.org>
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
Cc: Govind Singh <govinds@qti.qualcomm.com>, Brian Norris <briannorris@chromium.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, Rakesh Pillai <pillair@qti.qualcomm.com>

Signed-off-by: Brian Norris <briannorris@chromium.org>
---
 drivers/net/wireless/ath/ath10k/snoc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index 8d3d9bca410f..ffdebf9a5ac6 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -1641,12 +1641,12 @@ static int ath10k_snoc_remove(struct platform_device *pdev)
 }
 
 static struct platform_driver ath10k_snoc_driver = {
-		.probe  = ath10k_snoc_probe,
-		.remove = ath10k_snoc_remove,
-		.driver = {
-			.name   = "ath10k_snoc",
-			.of_match_table = ath10k_snoc_dt_match,
-		},
+	.probe  = ath10k_snoc_probe,
+	.remove = ath10k_snoc_remove,
+	.driver = {
+		.name   = "ath10k_snoc",
+		.of_match_table = ath10k_snoc_dt_match,
+	},
 };
 module_platform_driver(ath10k_snoc_driver);
 
-- 
2.19.1.930.g4563a0d9d0-goog


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
