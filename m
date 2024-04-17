Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A97E8C04FF9
	for <ath10k@archiver.kernel.org>; Wed, 17 Apr 2024 08:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=i9Fzb8owIqPtf8dJHGOdMDYW3cJzw4WxSJMXQjiseZ4=; b=kh9TeIxNR1EAjLdZGKwqA1lAVU
	k021dEvs5mR8v3bZSiUQHiYOYWB5znvxftWS0ubYeCJAmC481orxwUVidk0QV2Z5I1nPwDfmbPsMA
	DoM4D5BEnshx09xx3wgRbSigunP1jVID/t2116ZwQiRU3uFUN21RbUEsdoQwm2hd/WangKGYLPFFI
	xy6HGr6k1jg9vbqKb1s8NqDnyjoFw9RZFBOpxIwCINH/idZUPSRIssYji6JxjEkc5gQH9n6MCA0Ee
	SI1pYsV1AnOmFo0mtIhzhNTM+cUq4OHfr9PF3tnOkufZBc3BBuTPzXbKD/SNcC3LzTzSPbDBz9dG4
	tsxB72GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx0VO-0000000FB4o-3jFc;
	Wed, 17 Apr 2024 08:18:58 +0000
Received: from [42.101.60.195] (helo=mail.nfschina.com)
	by bombadil.infradead.org with smtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx0VL-0000000FB24-2bQt
	for ath10k@lists.infradead.org;
	Wed, 17 Apr 2024 08:18:57 +0000
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPSA id 5BF316061479A;
	Wed, 17 Apr 2024 16:18:46 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: kvalo@kernel.org,
	jjohnson@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com
Cc: Su Hui <suhui@nfschina.com>,
	c_mkenna@qti.qualcomm.com,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org
Subject: [PATCH wireless] wifi: ath10k: Fix an error code problem in ath10k_dbg_sta_write_peer_debug_trigger()
Date: Wed, 17 Apr 2024 16:17:37 +0800
Message-Id: <20240417081736.2226586-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_011855_868721_70FCA3B6 
X-CRM114-Status: UNSURE (   7.67  )
X-CRM114-Notice: Please train this message.
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

Clang Static Checker (scan-build) Warning:
drivers/net/wireless/ath/ath10k/debugfs_sta.c:line 429, column 3
Value stored to 'ret' is never read.

Return 'ret' rather than 'count' when 'ret' stores an error code.
By the way, remove some useless code.

Fixes: ee8b08a1be82 ("ath10k: add debugfs support to get per peer tids log via tracing")
Signed-off-by: Su Hui <suhui@nfschina.com>
---
 drivers/net/wireless/ath/ath10k/debugfs_sta.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/debugfs_sta.c b/drivers/net/wireless/ath/ath10k/debugfs_sta.c
index 394bf3c32abf..5525dabe390a 100644
--- a/drivers/net/wireless/ath/ath10k/debugfs_sta.c
+++ b/drivers/net/wireless/ath/ath10k/debugfs_sta.c
@@ -415,7 +415,7 @@ ath10k_dbg_sta_write_peer_debug_trigger(struct file *file,
 	struct ath10k_sta *arsta = (struct ath10k_sta *)sta->drv_priv;
 	struct ath10k *ar = arsta->arvif->ar;
 	u8 peer_debug_trigger;
-	int ret;
+	int ret = 0;
 
 	if (kstrtou8_from_user(user_buf, count, 0, &peer_debug_trigger))
 		return -EINVAL;
@@ -432,14 +432,12 @@ ath10k_dbg_sta_write_peer_debug_trigger(struct file *file,
 
 	ret = ath10k_wmi_peer_set_param(ar, arsta->arvif->vdev_id, sta->addr,
 					ar->wmi.peer_param->debug, peer_debug_trigger);
-	if (ret) {
+	if (ret)
 		ath10k_warn(ar, "failed to set param to trigger peer tid logs for station ret: %d\n",
 			    ret);
-		goto out;
-	}
 out:
 	mutex_unlock(&ar->conf_mutex);
-	return count;
+	return ret ?: count;
 }
 
 static const struct file_operations fops_peer_debug_trigger = {
-- 
2.30.2


