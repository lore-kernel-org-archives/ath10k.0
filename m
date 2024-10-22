Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56C2FD1CDC7
	for <ath10k@archiver.kernel.org>; Tue, 22 Oct 2024 09:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xb/z+UNQUk2Bzm3fUSkikryYi3CIF7nhB0KzTo+RcOg=; b=rMEkxjsZV44agFrA3zGwmYxIlQ
	JkgzruJXOMHZeyb5h96rtZL6QvxPCp+t9NLVYv1OlO5voPBSgA5iAAe3FejFjr4jFukJ7ini4kmgA
	8SWQBRE/vwgqCfnbCxckVJ0wzP54C0/38xmxtHFoAMwixj1R5RPnjY050Kgqnw0kqYsUofljZAoWx
	kpJRgRJXjB2rKzlrhDSzW6ARxOUsBxWcR33zjF7RM5Fle4uSb29R3YVEd22L8Ps3DTWn9xGr2NJrJ
	23mu8yD2YLRBU7RBRSa0If/mOZcdabMiwY1W+JI1tijHgKHQTYT0EYBmlT93r947SB4bvb30SQUqr
	+i32Lneg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3B24-0000000AJiW-0XZD;
	Tue, 22 Oct 2024 09:18:28 +0000
Received: from e2i340.smtp2go.com ([103.2.141.84])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Az4-0000000AIiX-0CN9
	for ath10k@lists.infradead.org;
	Tue, 22 Oct 2024 09:15:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=maxzs0.a1-4.dyn; x=1729589409; h=Feedback-ID:
	X-Smtpcorp-Track:Message-Id:Date:Subject:To:From:Reply-To:Sender:
	List-Unsubscribe:List-Unsubscribe-Post;
	bh=xb/z+UNQUk2Bzm3fUSkikryYi3CIF7nhB0KzTo+RcOg=; b=H31Urk6Q8OSQSxrZzYUv0fBiiT
	80wnGfYaLUR5cCmlfOk7oyOoZ0DfaEBGFn2J0KkAx5pOTmrWwtac32Lw/qyTPTStJUbingxiHxymq
	Ek/1N/SSlYlkhklcAsREy1giIsH7YREGn8Nb0Ta+x0NN+1lEF1ij7W/n+pjNSXO1A5jOHbFFKXjFW
	0NcoC9PsWQMeTzEsQWyDep6SqJegyJyBiX7Wfn0YS1FqCe/mSEQyxDXfEa5W9hRFIx7vb94tw5yYE
	iL0A6EjmjwSKMQmi/cInjfq+B05+xV14SqO11j3UVfakuIY+GCrtb93zS0iwjpWQeDpvCLv+WXk/y
	51FPM6bg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triplefau.lt;
 i=@triplefau.lt; q=dns/txt; s=s510616; t=1729588509; h=from : subject
 : to : message-id : date;
 bh=xb/z+UNQUk2Bzm3fUSkikryYi3CIF7nhB0KzTo+RcOg=;
 b=mX8o6dFsBKndBa7iPvpbdPriFvCmenVPNMZtkOLI7yD4OtAgfTnTRoyYKEpXg3QOy68DH
 41H1j028tue2Gc6R5GaWD9aOp0ZV8QgP3KODrEavQiD7AJ6MFqNbNXtqH8MnSRkH7ib0Ltm
 QBPRce12tWMuU/RfEoLnYaC5JevxSYaz7BRpYpy1v8QQrQ4pbgfkPujHp7uRuS/1QEqmSXl
 XKt0eNYTS0fh/RkRtur3zmPH2cpnP0UVSBQHKasnxfH3YsBcvHpA0CChBtdUVqNKluwfURO
 h0kKo8iHgetYJMU0T8zEE56IBfHvCXTyTKoqGQaJhb8+vZ8YgUqMp19yZUZg==
Received: from [10.176.58.103] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <repk@triplefau.lt>)
 id 1t3Ayn-TRk3iE-Qs; Tue, 22 Oct 2024 09:15:05 +0000
Received: from [10.12.239.196] (helo=localhost) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.97.1-S2G) (envelope-from <repk@triplefau.lt>)
 id 1t3Ayn-4o5NDgruWbA-qiYi; Tue, 22 Oct 2024 09:15:05 +0000
From: Remi Pommarel <repk@triplefau.lt>
To: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
 Cedric Veilleux <veilleux.cedric@gmail.com>,
 Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
 Remi Pommarel <repk@triplefau.lt>
Subject: [PATCH v2 0/2] Improve ath10k flush queue mechanism
Date: Tue, 22 Oct 2024 11:14:56 +0200
Message-Id: <cover.1729586267.git.repk@triplefau.lt>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Smtpcorp-Track: ALoC9O_-rIa1.0NPmqV2yaTxy.drDJhA4YSJn
Feedback-ID: 510616m:510616apGKSTK:510616sVJz0R5toj
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_021522_513629_AC58757C 
X-CRM114-Status: GOOD (  12.15  )
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

V2:
  - Add Closes tag
  - Use atomic instead of spinlock for per sta pending frame counter
  - Call ath10k_htt_tx_sta_dec_pending within rcu
  - Rename pending_per_queue[] to num_pending_per_queue[]

Remi Pommarel (2):
  wifi: ath10k: Implement ieee80211 flush_sta callback
  wifi: ath10k: Flush only requested txq in ath10k_flush()

 drivers/net/wireless/ath/ath10k/core.h   |  2 +
 drivers/net/wireless/ath/ath10k/htt.h    | 11 +++-
 drivers/net/wireless/ath/ath10k/htt_tx.c | 49 +++++++++++++++-
 drivers/net/wireless/ath/ath10k/mac.c    | 73 ++++++++++++++++++++----
 drivers/net/wireless/ath/ath10k/txrx.c   | 11 ++--
 5 files changed, 126 insertions(+), 20 deletions(-)

-- 
2.40.0


