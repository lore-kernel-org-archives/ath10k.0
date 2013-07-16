Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ebb06.tieto.com ([131.207.168.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Uyzr6-0003VZ-EQ
 for ath10k@lists.infradead.org; Tue, 16 Jul 2013 07:39:29 +0000
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v4 04/10] ath10k: reset BMI state upon init
Date: Tue, 16 Jul 2013 09:38:53 +0200
Message-ID: <1373960339-8525-5-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1373960339-8525-1-git-send-email-michal.kazior@tieto.com>
References: <1371041642-20273-1-git-send-email-michal.kazior@tieto.com>
 <1373960339-8525-1-git-send-email-michal.kazior@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

This is necessary if we want to be able to restart
hw on-the-fly.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/bmi.c  |    6 ++++++
 drivers/net/wireless/ath/ath10k/bmi.h  |    1 +
 drivers/net/wireless/ath/ath10k/core.c |    2 ++
 3 files changed, 9 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/bmi.c b/drivers/net/wireless/ath/ath10k/bmi.c
index aeae029..744da6d 100644
--- a/drivers/net/wireless/ath/ath10k/bmi.c
+++ b/drivers/net/wireless/ath/ath10k/bmi.c
@@ -20,6 +20,12 @@
 #include "debug.h"
 #include "htc.h"
 
+void ath10k_bmi_start(struct ath10k *ar)
+{
+	ath10k_dbg(ATH10K_DBG_CORE, "BMI started\n");
+	ar->bmi.done_sent = false;
+}
+
 int ath10k_bmi_done(struct ath10k *ar)
 {
 	struct bmi_cmd cmd;
diff --git a/drivers/net/wireless/ath/ath10k/bmi.h b/drivers/net/wireless/ath/ath10k/bmi.h
index 32c56aa..8d81ce1 100644
--- a/drivers/net/wireless/ath/ath10k/bmi.h
+++ b/drivers/net/wireless/ath/ath10k/bmi.h
@@ -184,6 +184,7 @@ struct bmi_target_info {
 #define BMI_CE_NUM_TO_TARG 0
 #define BMI_CE_NUM_TO_HOST 1
 
+void ath10k_bmi_start(struct ath10k *ar);
 int ath10k_bmi_done(struct ath10k *ar);
 int ath10k_bmi_get_target_info(struct ath10k *ar,
 			       struct bmi_target_info *target_info);
diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index dcddae4..3d75c6a 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -507,6 +507,8 @@ int ath10k_core_start(struct ath10k *ar)
 	struct bmi_target_info target_info;
 	int status;
 
+	ath10k_bmi_start(ar);
+
 	memset(&target_info, 0, sizeof(target_info));
 	status = ath10k_bmi_get_target_info(ar, &target_info);
 	if (status)
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
