Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EFBAC4332F
	for <ath10k@archiver.kernel.org>; Thu,  3 Mar 2022 11:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HjRj9XEPFAcVV2/Vmx/SLczLC2vZ89+62S2KTiawutc=; b=LDi8T9DSVdYUZK
	wT6qZUECZUc6Tr2jzvPcVB1ZCcZbG7CDTvTIdGdF+toycNHDUsx6O+IKdhBpQltqIZjkNxrBWYM2o
	5bdemYT1ZVr5uBI4q0UGs2RvN7Xqv7TAZPIPP2c/oMvgkNUthZhzs7EDtUeg6CTsQWHD+2/pZeyFy
	cCaRThsqACobxolX8fVS32vx5nbeAYQ/oShub5p66IZcoLl2I/dXrpC7JiArukf2cRbkHnzK3GNEC
	Jj+DYr6yv2x2xcOLXNm7mfvTgetl5dDAVz2nfJjuW4w5nmSAMenQPWyuBU4LbZSk92Tl6/kcqpcdM
	zl7ZCgO7QHyLwLwdUkpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPk3t-006Gdz-8V; Thu, 03 Mar 2022 11:56:01 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPk3q-006GcJ-5M
 for ath10k@lists.infradead.org; Thu, 03 Mar 2022 11:55:59 +0000
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 03 Mar 2022 03:55:57 -0800
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 03 Mar 2022 03:55:56 -0800
X-QCInternal: smtphost
Received: from unknown (HELO youghand-linux.qualcomm.com) ([10.206.66.115])
 by ironmsg01-blr.qualcomm.com with ESMTP; 03 Mar 2022 17:25:45 +0530
Received: by youghand-linux.qualcomm.com (Postfix, from userid 2370257)
 id 32DFD22770; Thu,  3 Mar 2022 17:25:44 +0530 (IST)
From: Youghandhar Chintala <youghand@codeaurora.org>
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 pillair@codeaurora.org, dianders@chromium.org, kuabhs@chromium.org,
 briannorris@chromium.org, mpubbise@codeaurora.org,
 Youghandhar Chintala <youghand@codeaurora.org>
Subject: [PATCH v4 0/2] mac80211: Trigger disconnect for STA during target
 hardware restart
Date: Thu,  3 Mar 2022 17:25:39 +0530
Message-Id: <20220303115541.15892-1-youghand@codeaurora.org>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220303_035558_282642_C4ADC914 
X-CRM114-Status: UNSURE (   8.92  )
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

---
Changes from v3:
- Added common API to trigger disconnect.

Youghandhar Chintala (2):
  mac80211: Add support to trigger sta disconnect on  hardware restart
  ath10k:trigger sta disconnect on hardware restart

 drivers/net/wireless/ath/ath10k/core.c | 27 ++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/hw.h   |  2 ++
 include/net/mac80211.h                 | 23 +++++++++++++++++
 net/mac80211/ieee80211_i.h             |  3 +++
 net/mac80211/mlme.c                    | 12 +++++++++
 net/mac80211/util.c                    | 34 +++++++++++++++++++++++---
 6 files changed, 98 insertions(+), 3 deletions(-)

-- 
2.29.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
