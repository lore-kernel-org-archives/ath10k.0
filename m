Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5742C04AA9
	for <ath10k@archiver.kernel.org>; Wed, 20 Sep 2023 15:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sORlsFsq3mj9yQgHcoEthSqarr14huoiP1gq5FFUWJc=; b=x5Yyc4qvU7xqLH
	e2KppPQiF2CNGXh0gPAA0eoCWdFGYwlMIZ0NuWMoN27G9Yu/mNnWOtbMGPa9OrpFaUf+H/N1E5R25
	YM4J77AjWv1nIFlfkmA8iYOneXSs1utX1LYGM4OkzEBGrXuZJ9eY9pvZavvuBm5RlEZMYrk3DaWT+
	wMHQKJziCTpnsbyTUAXB7emO+x9AQh0wyphKVIC58pfBV44c6lJoSMnGuCRM5hHBF5age5bR3vBRV
	lfpWfMGMFnn3IEiKt3MCvhVY5Il2oN1Kz9QXZBQ76r0QWuRF207ds8X2bGSWU3PN/80N8rqW4nYzV
	peLzwf5x/5fkLaUqIVEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qizJq-003Wr9-04;
	Wed, 20 Sep 2023 15:40:50 +0000
Received: from forward103c.mail.yandex.net ([2a02:6b8:c03:500:1:45:d181:d103])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qizJl-003WpI-1i
	for ath10k@lists.infradead.org;
	Wed, 20 Sep 2023 15:40:48 +0000
Received: from mail-nwsmtp-smtp-production-main-38.myt.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-38.myt.yp-c.yandex.net [IPv6:2a02:6b8:c12:542b:0:640:ed6e:0])
	by forward103c.mail.yandex.net (Yandex) with ESMTP id 14D5860067;
	Wed, 20 Sep 2023 18:40:40 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-38.myt.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id deLmPMFDb8c0-XGB0KKab;
	Wed, 20 Sep 2023 18:40:39 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1695224439; bh=IhEOIrsQKh4pJlq+AbsRsPnnktRCfyzV73aWUmX4RHc=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=jSoDq4rxE4dKcrCDFaGnmW9SCHJ0KbA7q8PEzxwpErfRJFBg52kbOlYjP+A7g5Lv1
	 9EmrIS+T6lYWRwryBEtvf0HO3YLzUYclV+ekWp1Drosfz1tTglb/AX4eFCytNDH8oq
	 zJLm5/TFiN0ejobuTqBROx7pIWnF7LinqFchFpQI=
Authentication-Results: mail-nwsmtp-smtp-production-main-38.myt.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>,
	ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH] [v2] wifi: ath10k: consistently use kstrtoX_from_user() functions
Date: Wed, 20 Sep 2023 18:39:13 +0300
Message-ID: <20230920154018.48314-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <202309202242.GlXozks6-lkp@intel.com>
References: <202309202242.GlXozks6-lkp@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_084046_083117_DB687BB6 
X-CRM114-Status: GOOD (  11.33  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Use 'kstrtoul_from_user()', 'kstrtobool_from_user()' and
'kstrtoint_from_user()' where appropriate and thus avoid
some code duplication.

Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
v2: fix ath10k_warn() format specifier (kernel test robot)
---
 drivers/net/wireless/ath/ath10k/debug.c    | 47 +++++++---------------
 drivers/net/wireless/ath/ath10k/spectral.c | 26 ++++--------
 2 files changed, 22 insertions(+), 51 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
index f9518e1c9903..5a8c74db974d 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -1964,20 +1964,13 @@ static ssize_t ath10k_write_btcoex(struct file *file,
 				   size_t count, loff_t *ppos)
 {
 	struct ath10k *ar = file->private_data;
-	char buf[32];
-	size_t buf_size;
-	int ret;
+	ssize_t ret;
 	bool val;
 	u32 pdev_param;
 
-	buf_size = min(count, (sizeof(buf) - 1));
-	if (copy_from_user(buf, ubuf, buf_size))
-		return -EFAULT;
-
-	buf[buf_size] = '\0';
-
-	if (kstrtobool(buf, &val) != 0)
-		return -EINVAL;
+	ret = kstrtobool_from_user(ubuf, count, &val);
+	if (ret)
+		return ret;
 
 	if (!ar->coex_support)
 		return -EOPNOTSUPP;
@@ -2000,7 +1993,7 @@ static ssize_t ath10k_write_btcoex(struct file *file,
 		     ar->running_fw->fw_file.fw_features)) {
 		ret = ath10k_wmi_pdev_set_param(ar, pdev_param, val);
 		if (ret) {
-			ath10k_warn(ar, "failed to enable btcoex: %d\n", ret);
+			ath10k_warn(ar, "failed to enable btcoex: %zd\n", ret);
 			ret = count;
 			goto exit;
 		}
@@ -2103,19 +2096,12 @@ static ssize_t ath10k_write_peer_stats(struct file *file,
 				       size_t count, loff_t *ppos)
 {
 	struct ath10k *ar = file->private_data;
-	char buf[32];
-	size_t buf_size;
-	int ret;
+	ssize_t ret;
 	bool val;
 
-	buf_size = min(count, (sizeof(buf) - 1));
-	if (copy_from_user(buf, ubuf, buf_size))
-		return -EFAULT;
-
-	buf[buf_size] = '\0';
-
-	if (kstrtobool(buf, &val) != 0)
-		return -EINVAL;
+	ret = kstrtobool_from_user(ubuf, count, &val);
+	if (ret)
+		return ret;
 
 	mutex_lock(&ar->conf_mutex);
 
@@ -2239,21 +2225,16 @@ static ssize_t ath10k_sta_tid_stats_mask_write(struct file *file,
 					       size_t count, loff_t *ppos)
 {
 	struct ath10k *ar = file->private_data;
-	char buf[32];
-	ssize_t len;
+	ssize_t ret;
 	u32 mask;
 
-	len = min(count, sizeof(buf) - 1);
-	if (copy_from_user(buf, user_buf, len))
-		return -EFAULT;
-
-	buf[len] = '\0';
-	if (kstrtoint(buf, 0, &mask))
-		return -EINVAL;
+	ret = kstrtoint_from_user(user_buf, count, 0, &mask);
+	if (ret)
+		return ret;
 
 	ar->sta_tid_stats_mask = mask;
 
-	return len;
+	return count;
 }
 
 static const struct file_operations fops_sta_tid_stats_mask = {
diff --git a/drivers/net/wireless/ath/ath10k/spectral.c b/drivers/net/wireless/ath/ath10k/spectral.c
index 68254a967ccb..2240994390ed 100644
--- a/drivers/net/wireless/ath/ath10k/spectral.c
+++ b/drivers/net/wireless/ath/ath10k/spectral.c
@@ -384,16 +384,11 @@ static ssize_t write_file_spectral_count(struct file *file,
 {
 	struct ath10k *ar = file->private_data;
 	unsigned long val;
-	char buf[32];
-	ssize_t len;
-
-	len = min(count, sizeof(buf) - 1);
-	if (copy_from_user(buf, user_buf, len))
-		return -EFAULT;
+	ssize_t ret;
 
-	buf[len] = '\0';
-	if (kstrtoul(buf, 0, &val))
-		return -EINVAL;
+	ret = kstrtoul_from_user(user_buf, count, 0, &val);
+	if (ret)
+		return ret;
 
 	if (val > 255)
 		return -EINVAL;
@@ -440,16 +435,11 @@ static ssize_t write_file_spectral_bins(struct file *file,
 {
 	struct ath10k *ar = file->private_data;
 	unsigned long val;
-	char buf[32];
-	ssize_t len;
-
-	len = min(count, sizeof(buf) - 1);
-	if (copy_from_user(buf, user_buf, len))
-		return -EFAULT;
+	ssize_t ret;
 
-	buf[len] = '\0';
-	if (kstrtoul(buf, 0, &val))
-		return -EINVAL;
+	ret = kstrtoul_from_user(user_buf, count, 0, &val);
+	if (ret)
+		return ret;
 
 	if (val < 64 || val > SPECTRAL_ATH10K_MAX_NUM_BINS)
 		return -EINVAL;
-- 
2.41.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
