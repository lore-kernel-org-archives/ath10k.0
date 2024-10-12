Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 035D3CF2568
	for <ath10k@archiver.kernel.org>; Sat, 12 Oct 2024 14:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nZwbub+Y+2CpDF1gb5jtpGb5EXEnMSxGMYCK7/dCUDI=; b=Ppv2ZDEd6tJSH0+27bGKNkq+hz
	ETop4CXvnJWNTAw6jjsgGt1Zjwf6KTtQR8hs8SUGYOmy9XaVNK8tBttjH/q05w99wmA5Ya5j2tafT
	93EjlpLj35Dj4/ljLpaIjXYhxfcYGGzbaHMBRPBJKhv5mgPSSJt82Bp5+4RrpNcvWgQ04PUNg7BKd
	oakGNDaSTeiYrAOlu3GeMt3NFShv2v0l8oBOSkekCWRC05ojGrHvgT4rbLBxCB6L24fjxl87QYgGO
	jd9xV7zCY20ahXwXQtcq/XerbyJmyyyynJKlZXwQZjtdfCkaADoBMov4cMpd1H1NM/3B8MTBqQ9fv
	FocF9VMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szcsa-00000001JqN-48Ly;
	Sat, 12 Oct 2024 14:14:00 +0000
Received: from e2i340.smtp2go.com ([103.2.141.84])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szcsX-00000001Jpw-3Wn8
	for ath10k@lists.infradead.org;
	Sat, 12 Oct 2024 14:13:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=maxzs0.a1-4.dyn; x=1728743325; h=Feedback-ID:
	X-Smtpcorp-Track:Message-Id:Date:Subject:To:From:Reply-To:Sender:
	List-Unsubscribe:List-Unsubscribe-Post;
	bh=nZwbub+Y+2CpDF1gb5jtpGb5EXEnMSxGMYCK7/dCUDI=; b=dkKAbigNS9YRGA5BuL5Tgclw2t
	F6/cxrG6RgTn5SdQOjYUQ4eTQfLM8Zczmeahag4vjNX6uI+lSJD7Dd8Rq32QXuleDIeT0rvG9+aUp
	HMreqsKYVcNCg0rg7FBQqQtPbwG8jqp+kFNV4kcrpvUN5BNwLXfYIVoHpzMRpj+ufCtdqwxyJnsJx
	8OCphL9ttvzfoMwchFRHo0AGDle9a/ZZWovpXV8avEuO9JCpWYiwYIizkIG6Z3VvxN067kBvtD2tM
	E2aF0Q//31J99vDXGtFGSU4VfhyyfhxTSJdzYrqFXPJLO4SXbFd8Qgzp65rVIwowYyn9r/kG9TYpq
	pLqaVdPA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triplefau.lt;
 i=@triplefau.lt; q=dns/txt; s=s510616; t=1728742425; h=from : subject
 : to : message-id : date;
 bh=nZwbub+Y+2CpDF1gb5jtpGb5EXEnMSxGMYCK7/dCUDI=;
 b=RuV1p76sIVfkCMmVzZePcm7dGiPKWBWLRKCM5p8t0C+JQ374C+evIjGoZ1YZ+uEaKu4NG
 U8h3mmMJ+2OZNM5GNaRffP6JGOlkjvXzvt0DSQSVn/t42aJxazaa0rLkrOP3KyKbf/lc9yw
 UE7vsNwJd0NHjrr6yM0ptSKX89xOKq8c7MSVqVy3JP42uHt/p7A1U19/FM1luQLkjvHXFE4
 d0I5uEaKXkH9v1d84djnFg254BN7370X7rB+qBDjVu54Q3PIifW/kad2NOK9LZ8cCXebked
 sJ+h2Pr4NGz1oO3T1GAKtkeL0QT4Db+7qqVLe+W0K6Hmdh+xG8u4N8tDl7RQ==
Received: from [10.172.233.58] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <repk@triplefau.lt>)
 id 1szcsI-TRjz50-AJ; Sat, 12 Oct 2024 14:13:42 +0000
Received: from [10.12.239.196] (helo=localhost) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.97.1-S2G) (envelope-from <repk@triplefau.lt>)
 id 1szcsH-FnQW0hPuzUP-oFaB; Sat, 12 Oct 2024 14:13:42 +0000
From: Remi Pommarel <repk@triplefau.lt>
To: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
 Cedric Veilleux <veilleux.cedric@gmail.com>,
 Remi Pommarel <repk@triplefau.lt>
Subject: [PATCH 0/2] Improve ath10k flush queue mechanism
Date: Sat, 12 Oct 2024 16:13:53 +0200
Message-Id: <cover.1728741827.git.repk@triplefau.lt>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Smtpcorp-Track: vtPVE6UPbXVR.EAvrXvg1ai8x.ZDaYzQHTAgz
Feedback-ID: 510616m:510616apGKSTK:510616sE1o2YokP8
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241012_071358_365264_7DD1E050 
X-CRM114-Status: GOOD (  11.19  )
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

It has been reported [0] that a 3-4 seconds (actually up to 5 sec) of
radio silence could be observed followed by the error below on ath10k
devices:

 ath10k_pci 0000:04:00.0: failed to flush transmit queue (skip 0 ar-state 1): 0

This is due to how the TX queues are flushed in ath10k. When a STA is
removed, mac80211 need to flush queues [1], but because ath10k does not
have a lightweight .flush_sta operation, ieee80211_flush_queues() is
called instead effectively blocking the whole queue during the drain
causing this radio silence. Also because ath10k_flush() waits for all
queued to be emptied, not only the flushed ones it could more easily
take up to 5 seconds to finish making the whole situation worst.

The first patch of this series adds a .flush_sta operation to flush only
specific STA traffic avoiding the need to stop whole queues and should
be enough in itself to fix the reported issue.

The second patch of this series is a proposal to improve ath10k_flush so
that it will be less likely to timeout waiting for non related queues to
drain.

The abose kernel warning could still be observed (e.g. flushing a dead
STA) but should be now harmless.

[0]: https://lore.kernel.org/all/CA+Xfe4FjUmzM5mvPxGbpJsF3SvSdE5_wgxvgFJ0bsdrKODVXCQ@mail.gmail.com/
[1]: commit 0b75a1b1e42e ("wifi: mac80211: flush queues on STA removal")

Remi Pommarel (2):
  wifi: ath10k: Implement ieee80211 flush_sta callback
  wifi: ath10k: Flush only requested txq in ath10k_flush()

 drivers/net/wireless/ath/ath10k/core.h   |  4 ++
 drivers/net/wireless/ath/ath10k/htt.h    | 11 +++-
 drivers/net/wireless/ath/ath10k/htt_tx.c | 50 +++++++++++++++-
 drivers/net/wireless/ath/ath10k/mac.c    | 76 ++++++++++++++++++++----
 drivers/net/wireless/ath/ath10k/txrx.c   |  5 +-
 5 files changed, 129 insertions(+), 17 deletions(-)

-- 
2.40.0


