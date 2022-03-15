Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A29C433EF
	for <ath10k@archiver.kernel.org>; Tue, 15 Mar 2022 08:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=83calHOLdZjKj3TPmz5Ryw8ZuZ1I5yScpqxbKQuNkXQ=; b=LMmNZjvDX0sGCz
	IROo4KrfAsr2NS/hQK9jkimas+zWLIv/xuruoH+1SXQzpZAAhPT8hU3jJLn5pBd+goN2nYXQSlhDI
	YI+Gdqb1n4StCHDGDn6GfSuXkelHwYpSyNovqVjaAyKym49pk2S5OsQ8CANFqdHG8sjOtc4HU78vy
	9Ox3N66Mb+QeFOzX3lkuyyRkqUzebYyJM95gLTeE3TGmtzYqPDshJ4Vkn9VY9HxFStTeFm5I7rSlV
	xp9tMTgCtqd7XXOXh3noupnfkqVYs0jAT5+IA/fJMPUgIwu3zIwrPQiba0DculEu5c4BD0c4t9Qtv
	IuNsXOLklXRoplQzohqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nU2ZJ-008GvA-Pb; Tue, 15 Mar 2022 08:30:13 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nU2ZF-008Gu1-NG
 for ath10k@lists.infradead.org; Tue, 15 Mar 2022 08:30:10 +0000
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 15 Mar 2022 01:30:08 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 15 Mar 2022 01:30:07 -0700
X-QCInternal: smtphost
Received: from unknown (HELO youghand-linux.qualcomm.com) ([10.206.66.115])
 by ironmsg01-blr.qualcomm.com with ESMTP; 15 Mar 2022 13:59:54 +0530
Received: by youghand-linux.qualcomm.com (Postfix, from userid 2370257)
 id D9466227E3; Tue, 15 Mar 2022 13:59:52 +0530 (IST)
From: Youghandhar Chintala <youghand@codeaurora.org>
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 pillair@codeaurora.org, dianders@chromium.org, kuabhs@chromium.org,
 briannorris@chromium.org, mpubbise@codeaurora.org,
 Youghandhar Chintala <youghand@codeaurora.org>
Subject: [PATCH v6 0/2] mac80211: Trigger disconnect for STA during target
 hardware restart
Date: Tue, 15 Mar 2022 13:59:42 +0530
Message-Id: <20220315082944.12406-1-youghand@codeaurora.org>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_013009_837161_5DCC5B07 
X-CRM114-Status: UNSURE (   9.08  )
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
Changes from v5:
- Fixed kernel test robot error

Youghandhar Chintala (2):
  mac80211: Add support to trigger sta disconnect on  hardware restart
  ath10k: Trigger sta disconnect on hardware restart

 drivers/net/wireless/ath/ath10k/core.c | 25 +++++++++++++++++++
 drivers/net/wireless/ath/ath10k/hw.h   |  2 ++
 include/net/mac80211.h                 | 10 ++++++++
 net/mac80211/ieee80211_i.h             |  3 +++
 net/mac80211/mlme.c                    | 14 ++++++++++-
 net/mac80211/util.c                    | 33 +++++++++++++++++++++++---
 6 files changed, 83 insertions(+), 4 deletions(-)

-- 
2.29.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
