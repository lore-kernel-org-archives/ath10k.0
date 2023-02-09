Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5EDAC61DA4
	for <ath10k@archiver.kernel.org>; Thu,  9 Feb 2023 04:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yt7ekpe4q5Ejfdj16RRVvjvo4ZBUQ5rAKL3rM0dX7CE=; b=cGP1GDdWDWn21C
	R548HrIykkauQ1yforgtfnwZCQN6FOFoz2Kio872ShJHGHPv48IRnsi9N+0q3QIAScH2lTmy06kKS
	c2Q2Ysj/Nn9s6QcuXhrYauGm8RAPqIGqmxKNilfUTbHcAnueMJaIEgFuBqCgdSww5Etyr6lwDfffQ
	D8xpetmLQO0K1npj1MRjgHCaWZLQB6lc4AzApdLlxAkb9r9tw43g5RjTDIn+gkO1S0M1rdBsQP58B
	0neHWUwUV26HCV8pNUK5ADDBQ7ef6TSzot7nZktmSzGfwIUq4o/wpf0GheTykkiceIFeHRwCiGQR/
	B9FkmsmHWSwkliKv+kHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPyuC-000A6g-54; Thu, 09 Feb 2023 04:51:32 +0000
Received: from smtp161.vfemail.net ([146.59.185.161])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPyu9-000A5o-8P
	for ath10k@lists.infradead.org; Thu, 09 Feb 2023 04:51:30 +0000
Received: (qmail 21929 invoked from network); 9 Feb 2023 04:51:20 +0000
Received: from localhost (HELO nl101-3.vfemail.net) ()
  by smtpout.vfemail.net with ESMTPS (ECDHE-RSA-AES256-GCM-SHA384 encrypted); 9 Feb 2023 04:51:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=openmail.cc; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=2018; bh=WssdM5a1RcW2/J6PdZ6f5OpYU
	CpCFUw6rGH2tDY9h2M=; b=bjlGUb+nTzpY+F7xbUkbldJoVmYUSoZPUO8CbMuqZ
	Gzauz2dhAfOQIG4Bx6PUGLJGUjB1dcoNAp/R6jaqTPXjG2c6eB6P9QMsWq57lh6D
	tlDB9Uf9A505A86evd+AIIAF7OpP+5pwl7ASXTFW/fjy5BSKWy1M3vhyPhOTHVY7
	e0=
Received: (qmail 87683 invoked from network); 9 Feb 2023 04:51:19 -0000
Received: by simscan 1.4.0 ppid: 87524, pid: 87638, t: 1.5055s
         scanners:none
Received: from unknown (HELO bmwxMDEudmZlbWFpbC5uZXQ=) (ZXF1dUBvcGVubWFpbC5jYw==@MTkyLjE2OC4xLjE5Mg==)
  by nl101.vfemail.net with ESMTPA; 9 Feb 2023 04:51:18 -0000
From: equu@openmail.cc
To: lpieralisi@kernel.org,
	toke@toke.dk,
	kvalo@kernel.org
Cc: linux-pci@vger.kernel.org,
	robh@kernel.org,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	equu@openmail.cc,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v6 0/3] PCI: of: Load extra data only from compatible DT nodes
Date: Thu,  9 Feb 2023 12:50:24 +0800
Message-Id: <20230209045026.1806587-1-equu@openmail.cc>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <ab8ff515-19ec-fe3f-0237-c30275e9744d@openmail.cc>
References: <ab8ff515-19ec-fe3f-0237-c30275e9744d@openmail.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_205129_650901_87458759 
X-CRM114-Status: UNSURE (   8.46  )
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

From: Edward Chow <equu@openmail.cc>

In order to solve the issue reported in
https://github.com/openwrt/openwrt/pull/11345 , this patchset attempt
to add mechanisms to ckeck whether an OF DT node is compatible to the
PCI device installed on the corresponding location or the driver for
it, and make ath9k and ath10k only load extra data from compatible
nodes.

V5 -> V6:
3, handle generic "qcom,ath10k" via of_device_get_match_data()

Signed-off-by: Edward Chow <equu@openmail.cc>
Reported-by: kernel test robot <lkp@intel.com>

Edward Chow (3):
  PCI: of: Match pci devices or drivers against OF DT nodes
  wifi: ath9k: stop loading incompatible DT cal data
  wifi: ath10k: only load compatible DT cal data

 drivers/net/wireless/ath/ath10k/core.c |  31 +++
 drivers/net/wireless/ath/ath10k/hw.h   |   4 +
 drivers/net/wireless/ath/ath10k/pci.c  |  18 +-
 drivers/net/wireless/ath/ath10k/pci.h  |   2 +
 drivers/net/wireless/ath/ath9k/ath9k.h |   1 +
 drivers/net/wireless/ath/ath9k/init.c  |  27 +++
 drivers/net/wireless/ath/ath9k/pci.c   |   2 +-
 drivers/pci/of.c                       | 299 +++++++++++++++++++++++++
 drivers/pci/pci-driver.c               |   5 -
 drivers/pci/pci.h                      |  56 +++++
 include/linux/of_pci.h                 |  25 +++
 include/linux/pci.h                    |   6 +
 12 files changed, 469 insertions(+), 7 deletions(-)

-- 
2.39.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
