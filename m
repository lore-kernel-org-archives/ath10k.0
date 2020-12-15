Return-Path: <SRS0=cltn=FT=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F38AEC4361B
	for <ath10k@archiver.kernel.org>; Tue, 15 Dec 2020 17:22:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FB5E229C5
	for <ath10k@archiver.kernel.org>; Tue, 15 Dec 2020 17:22:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9FB5E229C5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ivFqSP0NoHhED/1+kctS+q8yYCl8HkkyRV5EZGYH75Q=; b=NWGUndMAvASrCqE+AMGGzIiojE
	Bx29bVfw0kB0SBxdQmC7Ry96dA7iaCQHLSx4xL17enEi9602u7c77PujtJkmawjJ9C5QZRqLqQP/t
	zyG3RHAw+KPqi/vtwIhZlGVe/ycTBEne1l+0qJMIOyzFmHuTGQdzCQlIwZBpyNoP57cNcz/R1v5g+
	ni/Z8lQKyFIIh6tJZuRtFDMc63/682wQgXT8s6+4DVYCCZTbnDZlOvFbi/mDv55McdjGRwCCWqdTp
	6OaNMO9f6PxfRfQiG4K1+ylqSSnhe+/KEgNNRM170cWICplEoSNNJ7VCEFznNo3vXHvlvMZ7upQAX
	8hBatrag==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpE1G-0004iZ-Mj; Tue, 15 Dec 2020 17:21:50 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpE1D-0004hY-Ox
 for ath10k@lists.infradead.org; Tue, 15 Dec 2020 17:21:48 +0000
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 15 Dec 2020 09:21:44 -0800
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA;
 15 Dec 2020 09:21:42 -0800
X-QCInternal: smtphost
Received: from youghand-linux.qualcomm.com ([10.206.66.115])
 by ironmsg02-blr.qualcomm.com with ESMTP; 15 Dec 2020 22:51:17 +0530
Received: by youghand-linux.qualcomm.com (Postfix, from userid 2370257)
 id 3B2F120F17; Tue, 15 Dec 2020 22:51:16 +0530 (IST)
From: Youghandhar Chintala <youghand@codeaurora.org>
To: johannes@sipsolutions.net,
	ath10k@lists.infradead.org
Subject: [PATCH 0/3] mac80211: Trigger disconnect for STA during recovery
Date: Tue, 15 Dec 2020 22:51:13 +0530
Message-Id: <20201215172113.5038-1-youghand@codeaurora.org>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201215_122147_931707_C0D9D761 
X-CRM114-Status: UNSURE (   8.75  )
X-CRM114-Notice: Please train this message.
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
Cc: kuabhs@chromium.org, netdev@vger.kernel.org, briannorris@chromium.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 dianders@chromium.org, pillair@codeaurora.org, kuba@kernel.org,
 davem@davemloft.net, kvalo@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

From: Rakesh Pillai <pillair@codeaurora.org>

Currently in case of target hardware restart ,we just reconfig and
re-enable the security keys and enable the network queues to start
data traffic back from where it was interrupted.

Many ath10k wifi chipsets have sequence numbers for the data
packets assigned by firmware and the mac sequence number will
restart from zero after target hardware restart leading to mismatch
in the sequence number expected by the remote peer vs the sequence
number of the frame sent by the target firmware.

This mismatch in sequence number will cause out-of-order packets
on the remote peer and all the frames sent by the device are dropped
until we reach the sequence number which was sent before we restarted
the target hardware

In order to fix this, we trigger a disconnect in case of hardware
restart. After this there will be a fresh connection and thereby
avoiding the dropping of frames by remote peer.

The right fix would be to pull the entire data path into the host
which is not feasible or would need lots of complex/inefficient
datapath changes.

Rakesh Pillai (1):
  ath10k: Set wiphy flag to trigger sta disconnect on hardware restart

Youghandhar Chintala (2):
  cfg80211: Add wiphy flag to trigger STA disconnect after hardware
    restart
  mac80211: Add support to trigger sta disconnect on hardware restart

 drivers/net/wireless/ath/ath10k/core.c | 15 +++++++++++++++
 drivers/net/wireless/ath/ath10k/hw.h   |  3 +++
 drivers/net/wireless/ath/ath10k/mac.c  |  3 +++
 include/net/cfg80211.h                 |  4 ++++
 net/mac80211/ieee80211_i.h             |  3 +++
 net/mac80211/mlme.c                    |  9 +++++++++
 net/mac80211/util.c                    | 22 +++++++++++++++++++---
 7 files changed, 56 insertions(+), 3 deletions(-)

-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
