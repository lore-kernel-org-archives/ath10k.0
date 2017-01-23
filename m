Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-f44.google.com ([74.125.82.44])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cVgC9-0004f5-DI
 for ath10k@lists.infradead.org; Mon, 23 Jan 2017 15:06:12 +0000
Received: by mail-wm0-f44.google.com with SMTP id c206so160020877wme.0
 for <ath10k@lists.infradead.org>; Mon, 23 Jan 2017 07:05:48 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 3/3] ath10k: fix typo in addr calculation
Date: Mon, 23 Jan 2017 15:04:36 +0000
Message-Id: <1485183876-27080-3-git-send-email-srinivas.kandagatla@linaro.org>
In-Reply-To: <1485183876-27080-1-git-send-email-srinivas.kandagatla@linaro.org>
References: <1485183876-27080-1-git-send-email-srinivas.kandagatla@linaro.org>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: netdev@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

CORE_CTRL_ADDRESS is offset in register address space, it does not
make sense to OR it to derive the final address. It looks like its
a typo, so fix it.
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/net/wireless/ath/ath10k/pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 855e3de..023ab10 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -1936,7 +1936,7 @@ static int ath10k_pci_wake_target_cpu(struct ath10k *ar)
 {
 	u32 addr, val;
 
-	addr = SOC_CORE_BASE_ADDRESS | CORE_CTRL_ADDRESS;
+	addr = SOC_CORE_BASE_ADDRESS + CORE_CTRL_ADDRESS;
 	val = ath10k_pci_read32(ar, addr);
 	val |= CORE_CTRL_CPU_INTR_MASK;
 	ath10k_pci_write32(ar, addr, val);
-- 
2.10.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
