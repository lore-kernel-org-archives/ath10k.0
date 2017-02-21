Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244])
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cgD7K-0006hJ-SD
 for ath10k@lists.infradead.org; Tue, 21 Feb 2017 16:16:45 +0000
Received: by mail-lf0-x244.google.com with SMTP id 90so4026916lfr.3
 for <ath10k@lists.infradead.org>; Tue, 21 Feb 2017 08:16:25 -0800 (PST)
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Subject: [RFC v4 12/21] ath10k: high_latency detection
Date: Tue, 21 Feb 2017 17:15:32 +0100
Message-Id: <1487693741-10042-13-git-send-email-erik.stromdahl@gmail.com>
In-Reply-To: <1487693741-10042-1-git-send-email-erik.stromdahl@gmail.com>
References: <1487693741-10042-1-git-send-email-erik.stromdahl@gmail.com>
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

The setup of high latency chips (USB and SDIO) is
sometimes different than for chips using low latency
interfaces.

The bus type is used to determine if the interface is
a high latency interface.

Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 1 +
 drivers/net/wireless/ath/ath10k/core.h | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index a0b331d..39c407e 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2400,6 +2400,7 @@ struct ath10k *ath10k_core_create(size_t priv_size, struct device *dev,
 	ar->hw_rev = hw_rev;
 	ar->hif.ops = hif_ops;
 	ar->hif.bus = bus;
+	ar->is_high_latency = ath10k_is_high_latency(bus);
 
 	switch (hw_rev) {
 	case ATH10K_HW_QCA988X:
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 2768b07..0c970fe 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -785,6 +785,8 @@ struct ath10k {
 
 	bool p2p;
 
+	bool is_high_latency;
+
 	struct {
 		enum ath10k_bus bus;
 		const struct ath10k_hif_ops *ops;
@@ -1003,6 +1005,11 @@ static inline bool ath10k_peer_stats_enabled(struct ath10k *ar)
 	return false;
 }
 
+static inline bool ath10k_is_high_latency(enum ath10k_bus bus)
+{
+	return ((bus == ATH10K_BUS_SDIO) || (bus == ATH10K_BUS_USB));
+}
+
 struct ath10k *ath10k_core_create(size_t priv_size, struct device *dev,
 				  enum ath10k_bus bus,
 				  enum ath10k_hw_rev hw_rev,
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
