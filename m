Return-Path: <SRS0=zCVD=KA=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0654C433ED
	for <ath10k@archiver.kernel.org>; Wed,  5 May 2021 08:59:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42C7361157
	for <ath10k@archiver.kernel.org>; Wed,  5 May 2021 08:59:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42C7361157
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=dd-wrt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SJ+Hu0uhlwSCuSxte4N7Ie6ctTwh38Mx4p0CWqzofM8=; b=AaL4M16saC79RhcUh09SiMa3fb
	RHvsiYIcympqj2nDGq52BjEBsijn6uAU5e8T+AGBpG+x+kVZTxd3qIhJFouH7WrVmMrxx/4vOYv7Z
	dFk58+AQ3yAe1xAuxPPqo93bqPFWIBO2XeBnMVXKvWGEETwSzpM8FIRrx1fk7DPP13ZNPpGtwkDX5
	GPStjpDYGx0sE90JT7pjkqG9vkCLW5KZHd7IrjKGAZ8bUvDK1m+DmCIjY50pAOdbCADMJjRw9FKiT
	E0h/lkz2yX7WnG6Mvn5pNhcLiJFcQVQ3J6Vdq7jpzG9LPDcnfVBojLSV6TnzCm76izoNmeozNvDi6
	jKDyrZDQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leDML-000fuq-RW; Wed, 05 May 2021 08:58:22 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leDMI-000fuT-6U
 for ath10k@desiato.infradead.org; Wed, 05 May 2021 08:58:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=P85S0XPIM6wCqaYwWRfiHU2er+qx8scogUOEsj3QIwg=; b=tz8xE+7O7tNpOSa9ZFCU+qyCcr
 E5TJh0ALnJftPQ/VBFcAuU3jEiSBhihFf3b2e2a7wQKaid+H3ZNMwQ8ye1u8wjyDxlUYxe+Qvhr8z
 751ub1zZD9JwgB6APZnlTfbLNO8VrZr+qf2GqHyp7Y3XjR1/Y1kC0qiMYP7G3dy4rD2aPQ9tN9DcW
 AscjYgJ54wSCOAO0/0m4eZTnrkzgSxwDpLPyRNg8yXXXpBzFT9xL+OY93tTKf1RbuHainU4ZfH28a
 RCIZUhVeL5POYDKSme73lolF5lXWnM30+JFvuaM/MIb77fGVGhPgeB+V5YQoOrxLMeLxudixLc6Qk
 ZpqUYfyA==;
Received: from mail.as201155.net ([185.84.6.188])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leDME-004alF-Is
 for ath10k@lists.infradead.org; Wed, 05 May 2021 08:58:17 +0000
Received: from smtps.newmedia-net.de ([2a05:a1c0:0:de::167]:58612
 helo=webmail.newmedia-net.de)
 by mail.as201155.net with esmtps (TLSv1:DHE-RSA-AES256-SHA:256)
 (Exim 4.82_1-5b7a7c0-XX) (envelope-from <s.gottschall@dd-wrt.com>)
 id 1leDM7-0004E8-2j; Wed, 05 May 2021 10:58:07 +0200
X-CTCH-RefID: str=0001.0A782F16.60925E1F.00D0, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=dd-wrt.com;
 s=mikd; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From;
 bh=P85S0XPIM6wCqaYwWRfiHU2er+qx8scogUOEsj3QIwg=; 
 b=qJ3/CDN8bQh1MesFIfbSw3ePuv0vNzwbq7HmRx6llr9sU2+kuEIfutSAXBGdHxru5F8AB5UAom9evLmgO92j+SSzwmPkl9J+Onj4ytc2cebKvWlZWJ/WO8ueRPb6GuSjE3KHew+mf+qNYRgVaAIZhzls6if7fhrqehFc6crMN9s=;
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
 Sebastian Gottschall <s.gottschall@dd-wrt.com>
Subject: [PATCH] ath10k: Fix tx hanging
Date: Wed,  5 May 2021 15:58:06 +0700
Message-Id: <20210505085806.11474-1-s.gottschall@dd-wrt.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Received: from [81.201.155.134] (helo=linux.suse)
 by webmail.newmedia-net.de with esmtpa (Exim 4.72)
 (envelope-from <s.gottschall@dd-wrt.com>)
 id 1leDM7-000TIB-Ja; Wed, 05 May 2021 10:58:07 +0200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_015814_844230_6326BA20 
X-CRM114-Status: UNSURE (   8.44  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

While running stress tests in roaming scenarios (switching ap's every 5
seconds, we discovered a issue which leads to tx hangings of exactly 5
seconds while or after scanning for new accesspoints. We found out that
this hanging is triggered by ath10k_mac_wait_tx_complete since the
empty_tx_wq was not wake when the num_tx_pending counter reaches zero.
To fix this, we simply move the wake_up call to htt_tx_dec_pending,
since this call was missed on several locations within the ath10k code.

Signed-off-by: Sebastian Gottschall <s.gottschall@dd-wrt.com>
---
 drivers/net/wireless/ath/ath10k/htt_tx.c | 3 +++
 drivers/net/wireless/ath/ath10k/txrx.c   | 2 --
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index d6b8bdcef416..b793eac2cfac 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -147,6 +147,9 @@ void ath10k_htt_tx_dec_pending(struct ath10k_htt *htt)
 	htt->num_pending_tx--;
 	if (htt->num_pending_tx == htt->max_num_pending_tx - 1)
 		ath10k_mac_tx_unlock(htt->ar, ATH10K_TX_PAUSE_Q_FULL);
+
+	if (htt->num_pending_tx == 0)
+		wake_up(&htt->empty_tx_wq);
 }
 
 int ath10k_htt_tx_inc_pending(struct ath10k_htt *htt)
diff --git a/drivers/net/wireless/ath/ath10k/txrx.c b/drivers/net/wireless/ath/ath10k/txrx.c
index 7c9ea0c073d8..6f8b64218894 100644
--- a/drivers/net/wireless/ath/ath10k/txrx.c
+++ b/drivers/net/wireless/ath/ath10k/txrx.c
@@ -82,8 +82,6 @@ int ath10k_txrx_tx_unref(struct ath10k_htt *htt,
 	flags = skb_cb->flags;
 	ath10k_htt_tx_free_msdu_id(htt, tx_done->msdu_id);
 	ath10k_htt_tx_dec_pending(htt);
-	if (htt->num_pending_tx == 0)
-		wake_up(&htt->empty_tx_wq);
 	spin_unlock_bh(&htt->tx_lock);
 
 	rcu_read_lock();
-- 
2.31.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
