Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74EA2C4345F
	for <ath10k@archiver.kernel.org>; Mon, 22 Apr 2024 03:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iEqiEiTLZVacdErxVFwk5krczRhZc+6qW1wqGnTKxyU=; b=s5fCEM4AvtvvmqRq5cf98B1BnT
	xjCTsJAX1+50YiCR+3oWctxLLxGzOxDWCw7tqZ1m8lC/N3d/+eAMtZkc009UY8gvTt0Fowj6wfcUT
	Qr/XQ0De7Xr5107GdMrraoNlGd/gbs+whAD/Vp3BkSub26UxVo+8bH5GUc6TPcOumyXlyEQCn/1zM
	oYpMK+vVpdtGfKYoXmWneKJxGtMZY9AZE7UMDGPmibvBEc7RT/SRcdVCG1jQVwJPMnDAtJxCr0Opb
	2RY7rmkjFNUbkwxu143neY1b1cOO2/ALaWY5ePO9goKfXU2UGUBdFtrFt+Sq9InaoqL0fZK0cpM0R
	wg5N5AhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rykaW-0000000Bt9f-25FF;
	Mon, 22 Apr 2024 03:43:28 +0000
Received: from [42.101.60.195] (helo=mail.nfschina.com)
	by bombadil.infradead.org with smtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rykaS-0000000Bt7t-0DcM
	for ath10k@lists.infradead.org;
	Mon, 22 Apr 2024 03:43:26 +0000
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPSA id A504260680957;
	Mon, 22 Apr 2024 11:43:19 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: quic_jjohnson@quicinc.com,
	kvalo@kernel.org,
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
Subject: [PATCH wireless v2] wifi: ath10k: Fix an error code problem in ath10k_dbg_sta_write_peer_debug_trigger()
Date: Mon, 22 Apr 2024 11:42:44 +0800
Message-Id: <20240422034243.938962-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240421_204324_307756_A151FEFA 
X-CRM114-Status: UNSURE (   7.14  )
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
v2:
 - remove the initializer change.

 drivers/net/wireless/ath/ath10k/debugfs_sta.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/debugfs_sta.c b/drivers/net/wireless/ath/ath10k/debugfs_sta.c
index 394bf3c32abf..c1198e9027ae 100644
--- a/drivers/net/wireless/ath/ath10k/debugfs_sta.c
+++ b/drivers/net/wireless/ath/ath10k/debugfs_sta.c
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


