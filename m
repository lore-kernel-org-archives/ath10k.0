Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79D0EC61DA4
	for <ath10k@archiver.kernel.org>; Thu,  2 Feb 2023 07:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r+sT4LLo3+/yNWqeZlr7rFT8Rvi2P4DdinWJG4Y1yxo=; b=eiwVc33igPH8TH
	pedxTTIcOlC9EiMBiKG8OHdSfnkxUI/nQNyhVmpzusN3LxWqlhiJal6M0LB3GxZBW8JkM1HAPOE9U
	7EFHp2dxWNvmK9QIWNPFXfkJLi9KfXDtsKrf5msRBiMyeINd0/DfrELRkrB3Anfj0SmdJC/pRgoCV
	FHKvDlj8M44Dzgd1plgy+CxChzhip+o/ww8S58tpRKd2uEEQ4ZQT2cRSxLGVzHLoYK5WAsq2iMR9j
	hQAdfW7WZHtQUb6UWnX/vS28fYUUURSMGY5sIKnrRMg5hADk3J617rl/GauevOAPV8uEMNikz1j3I
	tSNbfExhHxi3p3QEEZKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNURr-00EnTi-Pm; Thu, 02 Feb 2023 07:55:59 +0000
Received: from smtp161.vfemail.net ([146.59.185.161])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNURo-00EnPO-CM
	for ath10k@lists.infradead.org; Thu, 02 Feb 2023 07:55:58 +0000
Received: (qmail 28534 invoked from network); 2 Feb 2023 07:55:50 +0000
Received: from localhost (HELO nl101-3.vfemail.net) ()
  by smtpout.vfemail.net with ESMTPS (ECDHE-RSA-AES256-GCM-SHA384 encrypted); 2 Feb 2023 07:55:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=openmail.cc; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=2018; bh=z/HlddiXa1WI0XW8/XB84VymR
	oSh0Q8WPhsO3JQmvdM=; b=gNtULlWN/dKwae/NAZVbdZMkOuNOuY7NfzenmGcJG
	cBuw0uun7s5eVy06oh/uW+rmkTTlXWWskjgTiMyL68LWk2FMDs3nCOXnn+PtOOlV
	Ulre49Zr/ergHk4JRh/gwxwxfDfC3gipZmBacN7J27m+W90F1v96FoLNhL5newez
	ws=
Received: (qmail 13603 invoked from network); 2 Feb 2023 07:55:50 -0000
Received: by simscan 1.4.0 ppid: 13438, pid: 13558, t: 0.6587s
         scanners:none
Received: from unknown (HELO bmwxMDEudmZlbWFpbC5uZXQ=) (ZXF1dUBvcGVubWFpbC5jYw==@MTkyLjE2OC4xLjE5Mg==)
  by nl101.vfemail.net with ESMTPA; 2 Feb 2023 07:55:49 -0000
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
Subject: [PATCH v3 0/3] PCI: of: Load extra data only from compatible DT nodes
Date: Thu,  2 Feb 2023 15:55:21 +0800
Message-Id: <20230202075524.2911058-1-equu@openmail.cc>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <ab8ff515-19ec-fe3f-0237-c30275e9744d@openmail.cc>
References: <ab8ff515-19ec-fe3f-0237-c30275e9744d@openmail.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_235556_750955_418C2F8F 
X-CRM114-Status: UNSURE (   8.05  )
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

V2 -> V3:
2, include <linux/of_pci.h> instead for necessary functions.

3, include <linux/of_pci.h> instead for necessary functions,
   return error as int variable.

Signed-off-by: Edward Chow <equu@openmail.cc>
Reported-by: kernel test robot <lkp@intel.com>

Edward Chow (3):
  PCI: of: Match pci devices or drivers against OF DT nodes
  wifi: ath9k: stop loading incompatible DT cal data
  wifi: ath10k: only load compatible DT cal data

 drivers/net/wireless/ath/ath10k/core.c |  29 +++
 drivers/net/wireless/ath/ath10k/pci.c  |   2 +-
 drivers/net/wireless/ath/ath10k/pci.h  |   2 +
 drivers/net/wireless/ath/ath9k/ath9k.h |   1 +
 drivers/net/wireless/ath/ath9k/init.c  |  26 +++
 drivers/net/wireless/ath/ath9k/pci.c   |   2 +-
 drivers/pci/of.c                       | 299 +++++++++++++++++++++++++
 drivers/pci/pci-driver.c               |   5 -
 drivers/pci/pci.h                      |  56 +++++
 include/linux/of_pci.h                 |  25 +++
 include/linux/pci.h                    |   6 +
 11 files changed, 446 insertions(+), 7 deletions(-)

-- 
2.39.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
