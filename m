Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-it0-x243.google.com ([2607:f8b0:4001:c0b::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fAhp6-0004lj-Fu
 for ath10k@lists.infradead.org; Mon, 23 Apr 2018 20:12:37 +0000
Received: by mail-it0-x243.google.com with SMTP id h143-v6so12617973ita.4
 for <ath10k@lists.infradead.org>; Mon, 23 Apr 2018 13:12:17 -0700 (PDT)
From: Andres Rodriguez <andresx7@gmail.com>
Subject: [PATCH 2/9] firmware: wrap FW_OPT_* into an enum
Date: Mon, 23 Apr 2018 16:11:58 -0400
Message-Id: <20180423201205.20533-3-andresx7@gmail.com>
In-Reply-To: <20180423201205.20533-1-andresx7@gmail.com>
References: <20180423201205.20533-1-andresx7@gmail.com>
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
To: linux-kernel@vger.kernel.org
Cc: arend.vanspriel@broadcom.com, gregkh@linuxfoundation.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, hdegoede@redhat.com, mcgrof@kernel.org, andresx7@gmail.com, alexdeucher@gmail.com, christian.koenig@amd.com, kvalo@codeaurora.org

This should let us associate enum kdoc to these values.

v2: use BIT() macro

Signed-off-by: Andres Rodriguez <andresx7@gmail.com>
---
 drivers/base/firmware_loader/fallback.c | 12 ++++++------
 drivers/base/firmware_loader/fallback.h |  6 ++++--
 drivers/base/firmware_loader/firmware.h | 18 ++++++++++--------
 drivers/base/firmware_loader/main.c     |  6 +++---
 4 files changed, 23 insertions(+), 19 deletions(-)

diff --git a/drivers/base/firmware_loader/fallback.c b/drivers/base/firmware_loader/fallback.c
index da97fc26119c..ecc49a619298 100644
--- a/drivers/base/firmware_loader/fallback.c
+++ b/drivers/base/firmware_loader/fallback.c
@@ -511,7 +511,7 @@ static const struct attribute_group *fw_dev_attr_groups[] = {
 
 static struct fw_sysfs *
 fw_create_instance(struct firmware *firmware, const char *fw_name,
-		   struct device *device, unsigned int opt_flags)
+		   struct device *device, enum fw_opt opt_flags)
 {
 	struct fw_sysfs *fw_sysfs;
 	struct device *f_dev;
@@ -544,7 +544,7 @@ fw_create_instance(struct firmware *firmware, const char *fw_name,
  * In charge of constructing a sysfs fallback interface for firmware loading.
  **/
 static int fw_load_sysfs_fallback(struct fw_sysfs *fw_sysfs,
-				  unsigned int opt_flags, long timeout)
+				  enum fw_opt opt_flags, long timeout)
 {
 	int retval = 0;
 	struct device *f_dev = &fw_sysfs->dev;
@@ -598,7 +598,7 @@ static int fw_load_sysfs_fallback(struct fw_sysfs *fw_sysfs,
 
 static int fw_load_from_user_helper(struct firmware *firmware,
 				    const char *name, struct device *device,
-				    unsigned int opt_flags)
+				    enum fw_opt opt_flags)
 {
 	struct fw_sysfs *fw_sysfs;
 	long timeout;
@@ -639,7 +639,7 @@ static int fw_load_from_user_helper(struct firmware *firmware,
 	return ret;
 }
 
-static bool fw_force_sysfs_fallback(unsigned int opt_flags)
+static bool fw_force_sysfs_fallback(enum fw_opt opt_flags)
 {
 	if (fw_fallback_config.force_sysfs_fallback)
 		return true;
@@ -648,7 +648,7 @@ static bool fw_force_sysfs_fallback(unsigned int opt_flags)
 	return true;
 }
 
-static bool fw_run_sysfs_fallback(unsigned int opt_flags)
+static bool fw_run_sysfs_fallback(enum fw_opt opt_flags)
 {
 	if (fw_fallback_config.ignore_sysfs_fallback) {
 		pr_info_once("Ignoring firmware sysfs fallback due to sysctl knob\n");
@@ -663,7 +663,7 @@ static bool fw_run_sysfs_fallback(unsigned int opt_flags)
 
 int fw_sysfs_fallback(struct firmware *fw, const char *name,
 		      struct device *device,
-		      unsigned int opt_flags,
+		      enum fw_opt opt_flags,
 		      int ret)
 {
 	if (!fw_run_sysfs_fallback(opt_flags))
diff --git a/drivers/base/firmware_loader/fallback.h b/drivers/base/firmware_loader/fallback.h
index f8255670a663..a3b73a09db6c 100644
--- a/drivers/base/firmware_loader/fallback.h
+++ b/drivers/base/firmware_loader/fallback.h
@@ -5,6 +5,8 @@
 #include <linux/firmware.h>
 #include <linux/device.h>
 
+#include "firmware.h"
+
 /**
  * struct firmware_fallback_config - firmware fallback configuration settings
  *
@@ -31,7 +33,7 @@ struct firmware_fallback_config {
 #ifdef CONFIG_FW_LOADER_USER_HELPER
 int fw_sysfs_fallback(struct firmware *fw, const char *name,
 		      struct device *device,
-		      unsigned int opt_flags,
+		      enum fw_opt opt_flags,
 		      int ret);
 void kill_pending_fw_fallback_reqs(bool only_kill_custom);
 
@@ -43,7 +45,7 @@ void unregister_sysfs_loader(void);
 #else /* CONFIG_FW_LOADER_USER_HELPER */
 static inline int fw_sysfs_fallback(struct firmware *fw, const char *name,
 				    struct device *device,
-				    unsigned int opt_flags,
+				    enum fw_opt opt_flags,
 				    int ret)
 {
 	/* Keep carrying over the same error */
diff --git a/drivers/base/firmware_loader/firmware.h b/drivers/base/firmware_loader/firmware.h
index d11d37db370b..b252bfa82295 100644
--- a/drivers/base/firmware_loader/firmware.h
+++ b/drivers/base/firmware_loader/firmware.h
@@ -2,6 +2,7 @@
 #ifndef __FIRMWARE_LOADER_H
 #define __FIRMWARE_LOADER_H
 
+#include <linux/bitops.h>
 #include <linux/firmware.h>
 #include <linux/types.h>
 #include <linux/kref.h>
@@ -10,13 +11,14 @@
 
 #include <generated/utsrelease.h>
 
-/* firmware behavior options */
-#define FW_OPT_UEVENT			(1U << 0)
-#define FW_OPT_NOWAIT			(1U << 1)
-#define FW_OPT_USERHELPER		(1U << 2)
-#define FW_OPT_NO_WARN			(1U << 3)
-#define FW_OPT_NOCACHE			(1U << 4)
-#define FW_OPT_NOFALLBACK		(1U << 5)
+enum fw_opt {
+	FW_OPT_UEVENT =         BIT(0),
+	FW_OPT_NOWAIT =         BIT(1),
+	FW_OPT_USERHELPER =     BIT(2),
+	FW_OPT_NO_WARN =        BIT(3),
+	FW_OPT_NOCACHE =        BIT(4),
+	FW_OPT_NOFALLBACK =     BIT(5),
+};
 
 enum fw_status {
 	FW_STATUS_UNKNOWN,
@@ -110,6 +112,6 @@ static inline void fw_state_done(struct fw_priv *fw_priv)
 }
 
 int assign_fw(struct firmware *fw, struct device *device,
-	      unsigned int opt_flags);
+	      enum fw_opt opt_flags);
 
 #endif /* __FIRMWARE_LOADER_H */
diff --git a/drivers/base/firmware_loader/main.c b/drivers/base/firmware_loader/main.c
index 5812148694b6..5baadad3012d 100644
--- a/drivers/base/firmware_loader/main.c
+++ b/drivers/base/firmware_loader/main.c
@@ -443,7 +443,7 @@ static int fw_add_devm_name(struct device *dev, const char *name)
 #endif
 
 int assign_fw(struct firmware *fw, struct device *device,
-	      unsigned int opt_flags)
+	      enum fw_opt opt_flags)
 {
 	struct fw_priv *fw_priv = fw->priv;
 	int ret;
@@ -558,7 +558,7 @@ static void fw_abort_batch_reqs(struct firmware *fw)
 static int
 _firmware_request(const struct firmware **firmware_p, const char *name,
 		  struct device *device, void *buf, size_t size,
-		  unsigned int opt_flags)
+		  enum fw_opt opt_flags)
 {
 	struct firmware *fw = NULL;
 	int ret;
@@ -734,7 +734,7 @@ struct firmware_work {
 	struct device *device;
 	void *context;
 	void (*cont)(const struct firmware *fw, void *context);
-	unsigned int opt_flags;
+	enum fw_opt opt_flags;
 };
 
 static void firmware_request_work_func(struct work_struct *work)
-- 
2.14.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
