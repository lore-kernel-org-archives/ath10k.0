Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B2FEC71136
	for <ath10k@archiver.kernel.org>; Tue, 17 Jun 2025 12:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PRkt1GN29Y4MfOD6Ai5CPr029+IM2RJCJEc/r84lt+c=; b=ehkSxKEkXE2zNXYsRQKohnSSG1
	9fFoRETrwbLwjEMHjEqtX5LpQqxQ+lQQQkkoSvLGnYrL5T8GP6miEpWCbJxU61SFjwtUR67tZV0MP
	w2NmoCNb7LU+YZu8JRk7Q7Rz7htCaN3boMfLPSbnhMIVgnned+ZcGXKxqyW0o3eIKiYbdVW+A1WrC
	WY7krxk6xGAWbQzHHljaWq8R20IOsHnQooZHTdyVKGySj9y7iiNdxK9F8foamYq/r7HEFfJ/glNiN
	lFpgbqx0BcWEqrpudR6LGKWVDDYgFIFrugyAeTMTDBkqBGhJ00oTfAzXWHYv+z7xe4f74i2IW5UWe
	arrtFUxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRVeG-00000007DXJ-0dgJ;
	Tue, 17 Jun 2025 12:42:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRVKY-00000007AfG-0HLj
	for ath10k@lists.infradead.org;
	Tue, 17 Jun 2025 12:22:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 39DA7629F9;
	Tue, 17 Jun 2025 12:22:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BDC4C4CEE3;
	Tue, 17 Jun 2025 12:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750162940;
	bh=zjVpP8xlXZprEOx6Ge5vzFxJC4jzf/M6qqSN+ugLKhQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MTmiCwBVjj8YSbPlSBCUoeLI6XsTJup6yXi7DV5UWXKbpXlEBCwHAP904cYCfIhB3
	 +JxLEB2QrLq42efy4GB+rnTjlTjwbEgNmh/kQ2b3g/5fJFYl/rDvxzELFfpCNLOTxe
	 Cfkdo/6coz7RJdogz+kP5Spq12Pprk48OSmCT/y8vdeSuPxyyaW8/x8w7SJvx8rivb
	 pB0CY5WCnU74mCqokOocyKeaLLnDDvSC47y9GFNA1+M0kjdhSjKRampmePDHlk4zjM
	 nLR7jNklK5qw44suI8YBqGrVTmZGR6tUMSd3/kJ+dEw0R76NijLDt+GeQaM7kG5ei1
	 BghRs5Vjb441g==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Sasha Levin <sashal@kernel.org>,
	jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org
Subject: [PATCH AUTOSEL 6.15 15/15] wifi: ath10k: Avoid vdev delete timeout when firmware is already down
Date: Tue, 17 Jun 2025 08:21:45 -0400
Message-Id: <20250617122147.1968355-15-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250617122147.1968355-1-sashal@kernel.org>
References: <20250617122147.1968355-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.15.2
Content-Transfer-Encoding: 8bit
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

From: Loic Poulain <loic.poulain@oss.qualcomm.com>

[ Upstream commit dc9c4252fe0d7a7f1ee904405ea91534277305bf ]

In some scenarios, the firmware may be stopped before the interface is
removed, either due to a crash or because the remoteproc (e.g., MPSS)
is shut down early during system reboot or shutdown.

This leads to a delay during interface teardown, as the driver waits for
a vdev delete response that never arrives, eventually timing out.

Example (SNOC):
$ echo stop > /sys/class/remoteproc/remoteproc0/state
[ 71.64] remoteproc remoteproc0: stopped remote processor modem
$ reboot
[ 74.84] ath10k_snoc c800000.wifi: failed to transmit packet, dropping: -108
[ 74.84] ath10k_snoc c800000.wifi: failed to submit frame: -108
[...]
[ 82.39] ath10k_snoc c800000.wifi: Timeout in receiving vdev delete response

To avoid this, skip waiting for the vdev delete response if the firmware is
already marked as unreachable (`ATH10K_FLAG_CRASH_FLUSH`), similar to how
`ath10k_mac_wait_tx_complete()` and `ath10k_vdev_setup_sync()` handle this case.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Link: https://patch.msgid.link/20250522131704.612206-1-loic.poulain@oss.qualcomm.com
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

Based on my analysis of the commit and code changes:

**YES**

This commit should be backported to stable kernel trees for the
following reasons:

1. **It fixes a real-world bug**: The commit addresses a specific issue
   where the driver waits for a vdev delete response that will never
   arrive when the firmware has already crashed or been stopped. This
   causes a 5-second timeout delay during interface teardown, which is a
   user-visible problem.

2. **Clear reproduction scenario**: The commit provides a concrete
   example showing how the issue manifests in SNOC (Snapdragon) systems
   when remoteproc is stopped before interface removal during system
   shutdown/reboot.

3. **Minimal and safe change**: The fix is small and follows established
   patterns within the driver:
   - It introduces `ath10k_vdev_delete_sync()` that mirrors the existing
     `ath10k_vdev_setup_sync()` function
   - Both functions check `ATH10K_FLAG_CRASH_FLUSH` before waiting,
     which is the standard way the driver handles firmware crash
     scenarios
   - The change is localized to the vdev delete path and doesn't
     introduce new behavior, just skips unnecessary waiting

4. **Prevents user-facing delays**: Without this fix, users experience
   unnecessary 5-second delays during system shutdown/reboot or when the
   firmware crashes, which degrades the user experience.

5. **Follows established patterns**: The fix uses the same approach as
   other parts of the driver (`ath10k_vdev_setup_sync()` and
   `ath10k_mac_wait_tx_complete()`) that already check
   `ATH10K_FLAG_CRASH_FLUSH` to avoid waiting for responses from a
   crashed firmware.

6. **Low regression risk**: The change only affects the error path when
   firmware is already marked as crashed. In normal operation when
   firmware is responsive, the behavior remains unchanged.

The commit is similar in nature to the historical commit #5 which was
marked as suitable for backporting - both deal with avoiding unnecessary
waits/timeouts when the firmware state makes it impossible to receive
the expected response.

 drivers/net/wireless/ath/ath10k/mac.c | 33 ++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index c61b95a928dac..71a354f6b6e66 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -4,6 +4,7 @@
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
  * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include "mac.h"
@@ -1022,6 +1023,26 @@ static inline int ath10k_vdev_setup_sync(struct ath10k *ar)
 	return ar->last_wmi_vdev_start_status;
 }
 
+static inline int ath10k_vdev_delete_sync(struct ath10k *ar)
+{
+	unsigned long time_left;
+
+	lockdep_assert_held(&ar->conf_mutex);
+
+	if (!test_bit(WMI_SERVICE_SYNC_DELETE_CMDS, ar->wmi.svc_map))
+		return 0;
+
+	if (test_bit(ATH10K_FLAG_CRASH_FLUSH, &ar->dev_flags))
+		return -ESHUTDOWN;
+
+	time_left = wait_for_completion_timeout(&ar->vdev_delete_done,
+						ATH10K_VDEV_DELETE_TIMEOUT_HZ);
+	if (time_left == 0)
+		return -ETIMEDOUT;
+
+	return 0;
+}
+
 static int ath10k_monitor_vdev_start(struct ath10k *ar, int vdev_id)
 {
 	struct cfg80211_chan_def *chandef = NULL;
@@ -5900,7 +5921,6 @@ static void ath10k_remove_interface(struct ieee80211_hw *hw,
 	struct ath10k *ar = hw->priv;
 	struct ath10k_vif *arvif = (void *)vif->drv_priv;
 	struct ath10k_peer *peer;
-	unsigned long time_left;
 	int ret;
 	int i;
 
@@ -5940,13 +5960,10 @@ static void ath10k_remove_interface(struct ieee80211_hw *hw,
 		ath10k_warn(ar, "failed to delete WMI vdev %i: %d\n",
 			    arvif->vdev_id, ret);
 
-	if (test_bit(WMI_SERVICE_SYNC_DELETE_CMDS, ar->wmi.svc_map)) {
-		time_left = wait_for_completion_timeout(&ar->vdev_delete_done,
-							ATH10K_VDEV_DELETE_TIMEOUT_HZ);
-		if (time_left == 0) {
-			ath10k_warn(ar, "Timeout in receiving vdev delete response\n");
-			goto out;
-		}
+	ret = ath10k_vdev_delete_sync(ar);
+	if (ret) {
+		ath10k_warn(ar, "Error in receiving vdev delete response: %d\n", ret);
+		goto out;
 	}
 
 	/* Some firmware revisions don't notify host about self-peer removal
-- 
2.39.5


