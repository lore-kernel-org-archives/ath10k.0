Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2EC7C4167B
	for <ath10k@archiver.kernel.org>; Fri,  2 Dec 2022 10:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KK/OTat2i24jcEXgbjPXtBcRbuQ/HFip+YvCLn0qyL0=; b=T5W+j3czmWBscC
	V3eENPr6WKD9sjrqlBnSbWkqXmI45y2ZZ4lAAop+3+IiP9xGXTLrV/vFArWpQrpaPEs3bZVqZEWzK
	xP2p5nTN1vJl03xbtyv7OGVasAPogbhDSN5uv1/TUAhNCypi9zhGcNABdOZwHyqzIwhhzVpoLFawg
	u7+4rX71PSCqOTIWyxiWH6+/pCTAsjCoOBhp6qEhPmvQzSn6Jw7hWLTfEpC/5XXw1OGQBnT/DMcmL
	d91AEyQtuEraPt+vzfXNyIBXm4H63pqYd9smnefGH+Lc2EWbZJbkFkMfUh+bnKuo8yhgtJhku34yq
	XhlCwv2w16FlvcSeGn/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p13JT-00FSaV-8q; Fri, 02 Dec 2022 10:30:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p13JQ-00FSZU-SZ
	for ath10k@lists.infradead.org; Fri, 02 Dec 2022 10:30:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2EE51621C4
	for <ath10k@lists.infradead.org>; Fri,  2 Dec 2022 10:30:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 090CDC433C1;
	Fri,  2 Dec 2022 10:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669977031;
	bh=CfgyzpxmSmzWgIJtr6+lsNS9AutZwLfpv3tLyzOCSis=;
	h=From:To:Cc:Subject:Date:From;
	b=Q1EWW03Alvg9kwkss5etZrV15t6vHoC5FTGJwnmA4/jo0AsGEj8zHEGpDeBzTssY4
	 XOogjolP6t9IKglOEDyyAHVBQVdbnKzavtK0FCcW4NWgqpZT1pA6Sqkb3jcD8rU98x
	 l7mqiTKGo1AVY2pOm/PH0e3ri0BcQlRP/ZQOIttXqCrDD5D7NnGic1MJRMh8BfG08j
	 BJmxtPKstwTFCaUhhTLDHQAJaMG7yZTA4iqZyzcqHa6j1bGE6Sfue7MKYH6if9IqL3
	 6IhYYhMjmV8Xl3OcN45VriZnq0csHJmqDqIqlLOYBLMUc+Z85AcFOlHxVTg2SP33ui
	 IT42alFOLQy7g==
From: Kalle Valo <kvalo@kernel.org>
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH] wifi: ath10k: fix QCOM_SMEM dependency
Date: Fri,  2 Dec 2022 12:30:27 +0200
Message-Id: <20221202103027.25974-1-kvalo@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_023032_985403_FA966B5C 
X-CRM114-Status: GOOD (  11.47  )
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

From: Kalle Valo <quic_kvalo@quicinc.com>

Nathan noticed that when HWSPINLOCK is disabled there's a Kconfig warning:

  WARNING: unmet direct dependencies detected for QCOM_SMEM
    Depends on [n]: (ARCH_QCOM [=y] || COMPILE_TEST [=n]) && HWSPINLOCK [=n]
    Selected by [m]:
    - ATH10K_SNOC [=m] && NETDEVICES [=y] && WLAN [=y] && WLAN_VENDOR_ATH [=y] && ATH10K [=m] && (ARCH_QCOM [=y] || COMPILE_TEST [=n])

The problem here is that QCOM_SMEM depends on HWSPINLOCK so we cannot select
QCOM_SMEM and instead we neeed to use 'depends on'.

Reported-by: Nathan Chancellor <nathan@kernel.org>
Link: https://lore.kernel.org/all/Y4YsyaIW+CPdHWv3@dev-arch.thelio-3990X/
Fixes: 4d79f6f34bbb ("wifi: ath10k: Store WLAN firmware version in SMEM image table")
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath10k/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/Kconfig b/drivers/net/wireless/ath/ath10k/Kconfig
index e0a51dad8e42..e6ea884cafc1 100644
--- a/drivers/net/wireless/ath/ath10k/Kconfig
+++ b/drivers/net/wireless/ath/ath10k/Kconfig
@@ -44,7 +44,7 @@ config ATH10K_SNOC
 	tristate "Qualcomm ath10k SNOC support"
 	depends on ATH10K
 	depends on ARCH_QCOM || COMPILE_TEST
-	select QCOM_SMEM
+	depends on QCOM_SMEM
 	select QCOM_SCM
 	select QCOM_QMI_HELPERS
 	help

base-commit: e9ab0b2e680b069437f54bf4076310f636af05e6
-- 
2.30.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
