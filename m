Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3437D0C5E3
	for <ath10k@archiver.kernel.org>; Fri, 25 Oct 2024 08:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wm5L+Qoo/ioFGQt3DT4pcDXXIVurmW309DoYLq1KaIc=; b=oB0mpEwxrmAzHbqyMdkDLpR0UV
	X32g0rl5NIu9GEwqBQw4/gsNBYN7/TGT+yFnR8FIymCpdrQNIPXHDrf8s1GG/mZopJpgaloQvy+Np
	UiEOrq7KHMoBzRXHZcvJBa27nDRuyyacCml2jzitSjcNAx7xZ4UMNx2VGhboHZC9ZXtc053sTDGKJ
	lP3G6YLQYulem7rsP5W1ESENpNsisc5Ve4JoZ04kSFgkOh2adOJDPyCm0yfFL8gFLpQKOGz9K3xeC
	GtMboOeuu3f2NLcL4R+bMPKNKegOMQ34a3HjTb4umj24Nf+ZiBPvnZQAr1wiyy9IW4SsEIZ6w+qHe
	RosOawcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Ffl-00000002ydj-2zYu;
	Fri, 25 Oct 2024 08:27:53 +0000
Received: from e2i340.smtp2go.com ([103.2.141.84])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4FeQ-00000002yQ7-1WHm
	for ath10k@lists.infradead.org;
	Fri, 25 Oct 2024 08:26:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=maxzs0.a1-4.dyn; x=1729845677; h=Feedback-ID:
	X-Smtpcorp-Track:Message-Id:Date:Subject:To:From:Reply-To:Sender:
	List-Unsubscribe:List-Unsubscribe-Post;
	bh=wm5L+Qoo/ioFGQt3DT4pcDXXIVurmW309DoYLq1KaIc=; b=QEXa1fxcFq46HdvJcXZGN3deGK
	8H2BI4mokkFIEFwutxBHUjMxU6BRGk9ZfvK41D2W0zJ0xLgKnBeXSvvp7rU44ad5gWa7UWVuiqDJd
	wrR0UcIsopf/BPb9qznRE1E/6l9/LmNhXm6bh3othrgthPEg7nXM3wZzfi1UeI6Ju+NHr54KJYZtR
	ikkSXUmc4klZu6coQ6PNVq4gMQowTSmqmZyky7nSZKlSA4gKaA5ciaVSshHsFoVj/nwUbZp2VZmdu
	5c+7qOz1IpGUqMXgbuX8bggLVzAP++tMZVnuhtqhefVFbxrzXABKCO8Dj1wqssqn1JERQg4PFvT9k
	VzsXnXug==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triplefau.lt;
 i=@triplefau.lt; q=dns/txt; s=s510616; t=1729844777; h=from : subject
 : to : message-id : date;
 bh=wm5L+Qoo/ioFGQt3DT4pcDXXIVurmW309DoYLq1KaIc=;
 b=gTMFuahLpB/IjKJEfVT+IzIStXNqbqKZlEgvdtP6BvuxJcch8gMIaduTk69bRHfqXRntD
 rln8TcXq7mkXJmYDdx7FrLp7g2iMVWhohND48isjOKhITUzb8FVwN0TaTQc6swe1J5dVcnR
 CaCeMq505XWHoRSpoNdv9pcmuig7+UFBHu11LoHEfLl7gm6jLeWnSIs0GWZwTFOt7X/E6o1
 SsD+bZorp1Wj056VAUc6CzqdxKAKpP4N50DZ5etG8TalovYCHz2ul1/4BzYqsdDocwNZrnC
 98zHMV3bgATs1wz59DUFY26x854gyNyw7e23WtslL3+gyE2qsMjdEMuAwW8Q==
Received: from [10.172.233.45] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <repk@triplefau.lt>)
 id 1t4Fe9-TRjx1p-TM; Fri, 25 Oct 2024 08:26:13 +0000
Received: from [10.12.239.196] (helo=localhost) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.97.1-S2G) (envelope-from <repk@triplefau.lt>)
 id 1t4Fe9-AIkwcC8o9IX-JQxw; Fri, 25 Oct 2024 08:26:13 +0000
From: Remi Pommarel <repk@triplefau.lt>
To: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
 Cedric Veilleux <veilleux.cedric@gmail.com>,
 Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
 Remi Pommarel <repk@triplefau.lt>
Subject: [PATCH v3 0/2] Improve ath10k flush queue mechanism
Date: Fri, 25 Oct 2024 10:23:46 +0200
Message-Id: <cover.1729844329.git.repk@triplefau.lt>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Smtpcorp-Track: 1oVY-IQ_E8OC.2815nbtnPLON.Q8xgbAcUwwc
Feedback-ID: 510616m:510616apGKSTK:510616sq2b0s9roU
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_012630_721618_340CBF0F 
X-CRM114-Status: GOOD (  12.12  )
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

V3:
  - Initialize empty to true to fix smatch error

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
 drivers/net/wireless/ath/ath10k/mac.c    | 75 ++++++++++++++++++++----
 drivers/net/wireless/ath/ath10k/txrx.c   | 11 ++--
 5 files changed, 127 insertions(+), 21 deletions(-)

-- 
2.40.0


