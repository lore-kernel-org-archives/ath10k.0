Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g3SGX-0005U5-2P
 for ath10k@lists.infradead.org; Fri, 21 Sep 2018 20:43:06 +0000
Received: by mail-pl1-x643.google.com with SMTP id g2-v6so6448518plo.2
 for <ath10k@lists.infradead.org>; Fri, 21 Sep 2018 13:42:55 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
Subject: [PATCH] ath10k: add missing sanity check on diag download
Date: Fri, 21 Sep 2018 13:42:41 -0700
Message-Id: <20180921204241.34316-1-briannorris@chromium.org>
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
Cc: Brian Norris <briannorris@chromium.org>, Carl Huang <cjhuang@codeaurora.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

ath10k_hw_diag_fast_download() generally has good boundary checking, but
it misses verifying that the next metadata header actually fits in the
remaining buffer space. Add such a check.

Fixes: 39501ea64116 ("ath10k: download firmware via diag Copy Engine for QCA6174 and QCA9377.")
Signed-off-by: Brian Norris <briannorris@chromium.org>
---
 drivers/net/wireless/ath/ath10k/hw.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/hw.c b/drivers/net/wireless/ath/ath10k/hw.c
index 2c2870e3e84d..af8ae8117c62 100644
--- a/drivers/net/wireless/ath/ath10k/hw.c
+++ b/drivers/net/wireless/ath/ath10k/hw.c
@@ -1044,6 +1044,12 @@ int ath10k_hw_diag_fast_download(struct ath10k *ar,
 	left = length - sizeof(*hdr);
 
 	while (left > 0) {
+		if (left < sizeof(*metadata)) {
+			ath10k_warn(ar, "firmware segment is truncated: %d\n",
+				    left);
+			ret = -EINVAL;
+			break;
+		}
 		base_addr = __le32_to_cpu(metadata->addr);
 		base_len = __le32_to_cpu(metadata->length);
 		buf = metadata->data;
-- 
2.19.0.444.g18242da7ef-goog


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
