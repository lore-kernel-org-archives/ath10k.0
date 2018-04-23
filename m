Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-io0-x241.google.com ([2607:f8b0:4001:c06::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fAhpC-0004q5-Um
 for ath10k@lists.infradead.org; Mon, 23 Apr 2018 20:12:49 +0000
Received: by mail-io0-x241.google.com with SMTP id t23-v6so7050621ioc.10
 for <ath10k@lists.infradead.org>; Mon, 23 Apr 2018 13:12:24 -0700 (PDT)
From: Andres Rodriguez <andresx7@gmail.com>
Subject: [PATCH 7/9] firmware: use rename fw_sysfs_fallback to use the
 firmware_ prefix
Date: Mon, 23 Apr 2018 16:12:03 -0400
Message-Id: <20180423201205.20533-8-andresx7@gmail.com>
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

Use the correct prefix for symbols exported by firmware_loader(). This
is done since firmware_sysfs_fallback() is now exposed through
kernel-doc.

Signed-off-by: Andres Rodriguez <andresx7@gmail.com>
---
 drivers/base/firmware_loader/fallback.c | 8 ++++----
 drivers/base/firmware_loader/fallback.h | 4 ++--
 drivers/base/firmware_loader/firmware.h | 6 +++---
 drivers/base/firmware_loader/main.c     | 2 +-
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/base/firmware_loader/fallback.c b/drivers/base/firmware_loader/fallback.c
index 1a47ddc70c31..fc186b5bccce 100644
--- a/drivers/base/firmware_loader/fallback.c
+++ b/drivers/base/firmware_loader/fallback.c
@@ -661,10 +661,10 @@ static bool fw_run_sysfs_fallback(enum fw_opt opt_flags)
 	return fw_force_sysfs_fallback(opt_flags);
 }
 
-int fw_sysfs_fallback(struct firmware *fw, const char *name,
-		      struct device *device,
-		      enum fw_opt opt_flags,
-		      int ret)
+int firmware_sysfs_fallback(struct firmware *fw, const char *name,
+			    struct device *device,
+			    enum fw_opt opt_flags,
+			    int ret)
 {
 	if (!fw_run_sysfs_fallback(opt_flags))
 		return ret;
diff --git a/drivers/base/firmware_loader/fallback.h b/drivers/base/firmware_loader/fallback.h
index a3b73a09db6c..8cfaa3299bb7 100644
--- a/drivers/base/firmware_loader/fallback.h
+++ b/drivers/base/firmware_loader/fallback.h
@@ -31,7 +31,7 @@ struct firmware_fallback_config {
 };
 
 #ifdef CONFIG_FW_LOADER_USER_HELPER
-int fw_sysfs_fallback(struct firmware *fw, const char *name,
+int firmware_sysfs_fallback(struct firmware *fw, const char *name,
 		      struct device *device,
 		      enum fw_opt opt_flags,
 		      int ret);
@@ -43,7 +43,7 @@ void fw_fallback_set_default_timeout(void);
 int register_sysfs_loader(void);
 void unregister_sysfs_loader(void);
 #else /* CONFIG_FW_LOADER_USER_HELPER */
-static inline int fw_sysfs_fallback(struct firmware *fw, const char *name,
+static inline int firmware_sysfs_fallback(struct firmware *fw, const char *name,
 				    struct device *device,
 				    enum fw_opt opt_flags,
 				    int ret)
diff --git a/drivers/base/firmware_loader/firmware.h b/drivers/base/firmware_loader/firmware.h
index a405d400a925..59836d50c5bd 100644
--- a/drivers/base/firmware_loader/firmware.h
+++ b/drivers/base/firmware_loader/firmware.h
@@ -15,12 +15,12 @@
  * enum fw_opt - options to control firmware loading behaviour
  *
  * @FW_OPT_UEVENT: Enables the fallback mechanism to send a kobject uevent
- *                  when the firmware is not found. Userspace is in charge
- *                  to load the firmware using the sysfs loading facility.
+ *                 when the firmware is not found. Userspace is in charge
+ *                 to load the firmware using the sysfs loading facility.
  * @FW_OPT_NOWAIT: Used to describe the firmware request is asynchronous.
  * @FW_OPT_USERHELPER: Enable the fallback mechanism, in case the direct
  *                     filesystem lookup fails at finding the firmware.
- *                     For details refer to fw_sysfs_fallback().
+ *                     For details refer to firmware_sysfs_fallback().
  * @FW_OPT_NO_WARN: Quiet, avoid printing warning messages.
  * @FW_OPT_NOCACHE: Disables firmware caching. Firmware caching is used to
  *                  cache the firmware upon suspend, so that upon resume
diff --git a/drivers/base/firmware_loader/main.c b/drivers/base/firmware_loader/main.c
index 58aaadf81e12..f009566acd35 100644
--- a/drivers/base/firmware_loader/main.c
+++ b/drivers/base/firmware_loader/main.c
@@ -581,7 +581,7 @@ _firmware_request(const struct firmware **firmware_p, const char *name,
 			dev_warn(device,
 				 "Direct firmware load for %s failed with error %d\n",
 				 name, ret);
-		ret = fw_sysfs_fallback(fw, name, device, opt_flags, ret);
+		ret = firmware_sysfs_fallback(fw, name, device, opt_flags, ret);
 	} else
 		ret = assign_fw(fw, device, opt_flags);
 
-- 
2.14.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
