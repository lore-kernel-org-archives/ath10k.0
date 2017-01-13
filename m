Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cS9NP-0005cw-Fk
 for ath10k@lists.infradead.org; Fri, 13 Jan 2017 21:27:14 +0000
Received: by mail-lf0-x242.google.com with SMTP id q89so7066695lfi.1
 for <ath10k@lists.infradead.org>; Fri, 13 Jan 2017 13:26:51 -0800 (PST)
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Subject: [RFC v3 7/8] ath10k: sdio get target info
Date: Fri, 13 Jan 2017 22:26:10 +0100
Message-Id: <1484342771-6160-8-git-send-email-erik.stromdahl@gmail.com>
In-Reply-To: <1484342771-6160-1-git-send-email-erik.stromdahl@gmail.com>
References: <1484342771-6160-1-git-send-email-erik.stromdahl@gmail.com>
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

Special BMI get target info function for SDIO.

Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
---
 drivers/net/wireless/ath/ath10k/bmi.c  | 70 ++++++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/bmi.h  |  2 +
 drivers/net/wireless/ath/ath10k/core.c |  5 ++-
 3 files changed, 76 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/bmi.c b/drivers/net/wireless/ath/ath10k/bmi.c
index 2872d34..d9db153 100644
--- a/drivers/net/wireless/ath/ath10k/bmi.c
+++ b/drivers/net/wireless/ath/ath10k/bmi.c
@@ -88,6 +88,76 @@ int ath10k_bmi_get_target_info(struct ath10k *ar,
 	return 0;
 }
 
+#define TARGET_VERSION_SENTINAL 0xffffffffu
+
+int ath10k_bmi_get_target_info_sdio(struct ath10k *ar,
+				    struct bmi_target_info *target_info)
+{
+	struct bmi_cmd cmd;
+	union bmi_resp resp;
+	u32 cmdlen = sizeof(cmd.id) + sizeof(cmd.get_target_info);
+	u32 resplen, tmp, ver_len;
+	int ret;
+
+	ath10k_dbg(ar, ATH10K_DBG_BMI, "bmi get target info SDIO\n");
+
+	if (ar->bmi.done_sent) {
+		ath10k_warn(ar, "BMI Get Target Info Command disallowed\n");
+		return -EBUSY;
+	}
+
+	cmd.id = __cpu_to_le32(BMI_GET_TARGET_INFO);
+
+	/* Step 1: Read 4 bytes of the target info and check if it is
+	 * the special sentinal version word or the first word in the
+	 * version response.
+	 */
+	resplen = sizeof(u32);
+	ret = ath10k_hif_exchange_bmi_msg(ar, &cmd, cmdlen, &tmp, &resplen);
+	if (ret) {
+		ath10k_warn(ar, "unable to read from device\n");
+		return ret;
+	}
+
+	/* Some SDIO boards have a special sentinal byte before the real
+	 * version response.
+	 */
+	if (tmp == TARGET_VERSION_SENTINAL) {
+		/* Step 1b: Read the version length */
+		resplen = sizeof(u32);
+		ret = ath10k_hif_exchange_bmi_msg(ar, NULL, 0, &tmp,
+						  &resplen);
+		if (ret) {
+			ath10k_warn(ar, "unable to read from device\n");
+			return ret;
+		}
+	}
+
+	ver_len = __le32_to_cpu(tmp);
+
+	/* Step 2: Check the target info length */
+	if (ver_len != sizeof(resp.get_target_info)) {
+		ath10k_warn(ar, "Unexpected target info len: %u. Expected: %lu\n",
+			    ver_len, sizeof(resp.get_target_info));
+		return -EINVAL;
+	}
+
+	/* Step 3: Read the rest of the version response */
+	resplen = sizeof(resp.get_target_info) - sizeof(u32);
+	ret = ath10k_hif_exchange_bmi_msg(ar, NULL, 0,
+					  &resp.get_target_info.version,
+					  &resplen);
+	if (ret) {
+		ath10k_warn(ar, "unable to read from device\n");
+		return ret;
+	}
+
+	target_info->version = __le32_to_cpu(resp.get_target_info.version);
+	target_info->type    = __le32_to_cpu(resp.get_target_info.type);
+
+	return 0;
+}
+
 int ath10k_bmi_read_memory(struct ath10k *ar,
 			   u32 address, void *buffer, u32 length)
 {
diff --git a/drivers/net/wireless/ath/ath10k/bmi.h b/drivers/net/wireless/ath/ath10k/bmi.h
index 7d3231a..8a5ef1b 100644
--- a/drivers/net/wireless/ath/ath10k/bmi.h
+++ b/drivers/net/wireless/ath/ath10k/bmi.h
@@ -197,6 +197,8 @@ void ath10k_bmi_start(struct ath10k *ar);
 int ath10k_bmi_done(struct ath10k *ar);
 int ath10k_bmi_get_target_info(struct ath10k *ar,
 			       struct bmi_target_info *target_info);
+int ath10k_bmi_get_target_info_sdio(struct ath10k *ar,
+				    struct bmi_target_info *target_info);
 int ath10k_bmi_read_memory(struct ath10k *ar, u32 address,
 			   void *buffer, u32 length);
 int ath10k_bmi_write_memory(struct ath10k *ar, u32 address,
diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 874c2a7..e34c734 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2084,7 +2084,10 @@ static int ath10k_core_probe_fw(struct ath10k *ar)
 	}
 
 	memset(&target_info, 0, sizeof(target_info));
-	ret = ath10k_bmi_get_target_info(ar, &target_info);
+	if (ar->hif.bus == ATH10K_BUS_SDIO)
+		ret = ath10k_bmi_get_target_info_sdio(ar, &target_info);
+	else
+		ret = ath10k_bmi_get_target_info(ar, &target_info);
 	if (ret) {
 		ath10k_err(ar, "could not get target info (%d)\n", ret);
 		goto err_power_down;
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
