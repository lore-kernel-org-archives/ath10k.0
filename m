Return-Path: <SRS0=2NXS=F3=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5FB1C433E0
	for <ath10k@archiver.kernel.org>; Wed, 23 Dec 2020 02:17:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74FF023433
	for <ath10k@archiver.kernel.org>; Wed, 23 Dec 2020 02:17:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74FF023433
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JPy6a1493c5aAFIXFhKqYcHnWuthyl6MkDVgDl8ccmM=; b=HT/IYB+OB8kFRQmLmDIlBdTPT
	bYF17SeYrKtpXZeUa+l+J2H/+oct+WUddXdr/RWJb4FUxKG8pMsJ1a5c8rJSb9Qp88v+Yb7lzLIUk
	3XpX9ysHq8hxaS8mYeCkpdPghnBUjyNpQVbyKH7PdKQxkM5fgPVx25xvAgx9Yc6KKVltiU0gG3RWK
	yl3WG6qgHaxQX3HUMo8DmdvbhMYyAw8FuP/3ru4O30YdeZpRn7LNK/1+KCih0ku3RYZcxv9esX5+q
	O08E/D1TTeEengWjlVC937a/5KS4aupoFAq59oinsQM7883v+Jr+6tr1k4GqPoglycIX+nP9fB/wb
	kjt4pXWlQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krtiX-0007Jc-2r; Wed, 23 Dec 2020 02:17:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krtiU-0007It-Oc
 for ath10k@lists.infradead.org; Wed, 23 Dec 2020 02:17:32 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1F4E12337F;
 Wed, 23 Dec 2020 02:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608689850;
 bh=vtedTUleFBXNCwzg4s3bdonFwhcKHWAbDQIhK5MwOZE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DZhEERGS4tySGq/PJVDs8oO8H+YJRhCQ1j3wi0cvE0xLvUplQFNOQ2ZVNI/P63JPn
 ll0Jziby4jdayXARGoBi4FI+t0atDpgB0M2VKOufP+vhD5XHfzg883wSC84AaMoj0e
 tB/eCz3++Jpf71H2WleEzmqQ8MI81V/A4mJKVCpyL4SxLdX7X+MasWNXoUjL3q0c+3
 EgXo5nNQoSVbTong/Q6htMenQd/sHaCvo6Z7UHEPYERmWzYjOs0c44MnbiUqhmpPBk
 uWk6WNkWfyZbgBI1EIibfzwPk6cj56BBILw+DnqrlvY24AwI094nyeHrHEYAdLccO5
 PF3Y9AjqdxmjQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 049/217] ath10k: fix compilation warning
Date: Tue, 22 Dec 2020 21:13:38 -0500
Message-Id: <20201223021626.2790791-49-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201223021626.2790791-1-sashal@kernel.org>
References: <20201223021626.2790791-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201222_211730_907408_FA942949 
X-CRM114-Status: GOOD (  10.89  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Cc: Sasha Levin <sashal@kernel.org>, kernel test robot <lkp@intel.com>,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 ath10k@lists.infradead.org, Dan Carpenter <dan.carpenter@oracle.com>,
 Tamizh Chelvam <tamizhr@codeaurora.org>, Kalle Valo <kvalo@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

From: Tamizh Chelvam <tamizhr@codeaurora.org>

[ Upstream commit b9162645117841978a3fb31546409271e007dd28 ]

This change fixes below compilation warning.

smatch warnings:
 drivers/net/wireless/ath/ath10k/mac.c:9125 ath10k_mac_op_set_tid_config() error: uninitialized symbol 'ret'.

No functional changes. Compile tested only.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Tamizh Chelvam <tamizhr@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
Link: https://lore.kernel.org/r/1604507837-29361-1-git-send-email-tamizhr@codeaurora.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath10k/mac.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 2e3eb5bbe49c8..d62b9edd60666 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -9169,10 +9169,11 @@ static int ath10k_mac_op_set_tid_config(struct ieee80211_hw *hw,
 			goto exit;
 	}
 
+	ret = 0;
+
 	if (sta)
 		goto exit;
 
-	ret = 0;
 	arvif->tids_rst = 0;
 	data.curr_vif = vif;
 	data.ar = ar;
-- 
2.27.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
