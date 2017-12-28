Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eUdX1-0005mU-UU
 for ath10k@lists.infradead.org; Thu, 28 Dec 2017 19:07:57 +0000
Received: by mail-lf0-x241.google.com with SMTP id u84so26196489lff.7
 for <ath10k@lists.infradead.org>; Thu, 28 Dec 2017 11:07:47 -0800 (PST)
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Subject: [PATCH 3/3] ath10k: bugfix: add USB case in ath10k_core_probe_fw
Date: Thu, 28 Dec 2017 20:06:45 +0100
Message-Id: <20171228190645.25773-4-erik.stromdahl@gmail.com>
In-Reply-To: <20171228190645.25773-1-erik.stromdahl@gmail.com>
References: <20171228190645.25773-1-erik.stromdahl@gmail.com>
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
To: kvalo@qca.qualcomm.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
Cc: Erik Stromdahl <erik.stromdahl@gmail.com>

Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 51444d34a06c..fe9341c97f31 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2427,6 +2427,7 @@ static int ath10k_core_probe_fw(struct ath10k *ar)
 		break;
 	case ATH10K_BUS_PCI:
 	case ATH10K_BUS_AHB:
+	case ATH10K_BUS_USB:
 		memset(&target_info, 0, sizeof(target_info));
 		ret = ath10k_bmi_get_target_info(ar, &target_info);
 		if (ret) {
-- 
2.15.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
