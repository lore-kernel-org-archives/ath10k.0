Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B4A0109446A
	for <ath10k@archiver.kernel.org>; Sat, 21 Mar 2026 11:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ef569JwFdhZArx/omdQP7G4f/QaYGZIypXkoSFlABe0=; b=DFVdy9SjW53zkK4tiky3xJt61X
	JNyfSROa+njlClyTqVUEslok7oQVm8ccCVBv34bI48KSpJOZJdDxUYKLGqsL1YnEBTzr3FfEEvHod
	sxcKaqxtO9a4a6FPZEqmQsNB+S2EkA1iZiqHJ5o3dB7QupGgKox5e6baQ3hGQ05ZiD+hUJzcMJALU
	gCcoK/1PX8J77Pf/7RbXkHLZoRNoSOED6Z4z6cXN/z5Bd/otQ1zuo81zB77Mq2v3AT5Wm9ezmhnoP
	S1CNDw+Gpub8yKMPNxuiuk5x6FVexORyPHsbxG7j44z/hFpFIuHvneo/exWCtfwMzhTrUk+4cg4hi
	adhk9t4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3u4Z-0000000ENgw-3Wzh;
	Sat, 21 Mar 2026 11:00:51 +0000
Received: from smtpbg154.qq.com ([15.184.224.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3u4W-0000000ENdn-3GZr
	for ath10k@lists.infradead.org;
	Sat, 21 Mar 2026 11:00:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smail.nju.edu.cn;
	s=iohv2404; t=1774090815;
	bh=Ef569JwFdhZArx/omdQP7G4f/QaYGZIypXkoSFlABe0=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=0JZRyT3XpJzW5ZgGg6zAxUmNmBJvyBMWfuTaphJUDAoImu3b2b/BStGq+9B+1Yw64
	 KKUZfBVGz6ORdOJSlBxV5qA/q800PRjBpZqtB/o93AWbQKNm/dtc31BvfM047UFkeN
	 iZ0klngPHnLzoPaX/uqd9PgNzX0bSxV9tR9IR3+0=
X-QQ-mid: zesmtpsz9t1774090813t02798f32
X-QQ-Originating-IP: 5rdXDJlqFBsdgN+dsz9GeL3hz4oX/Xu8ikpFlPCIiao=
Received: from localhost.localdomain ( [116.172.93.199])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 21 Mar 2026 19:00:11 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1672418629744604756
EX-QQ-RecipientCnt: 9
From: Kexin Sun <kexinsun@smail.nju.edu.cn>
To: jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: julia.lawall@inria.fr,
	xutong.ma@inria.fr,
	kexinsun@smail.nju.edu.cn,
	yunbolyu@smu.edu.sg,
	ratnadiraw@smu.edu.sg
Subject: [PATCH] wifi: ath10k: update outdated comment for renamed ieee80211_tx_status()
Date: Sat, 21 Mar 2026 19:00:11 +0800
Message-Id: <20260321110011.8556-1-kexinsun@smail.nju.edu.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:smail.nju.edu.cn:qybglogicsvrgz:qybglogicsvrgz5b-0
X-QQ-XMAILINFO: MVMn5D3ouL6ClpMhQvg0dsE8alJDF1uZmy0w97vLx37312iOqXMATv0X
	RCFQSLMMNxXPWy95F+e/2Y0QagQzfVKQmE9uTUdAX7tKH+1/Ng+IDXLA/t/yoDffdoSJb1l
	BYi+C8763X7DkVJ0h9OjkhBxJK3BqJLL1lETg6uBSkdsD85kzYOA4F/zMcKmoGd50zVaeIx
	MhWbPOd4hIK/a6nt5f90cD6D9iKmJ/LQahgn+P3PSud1tkdOCtqnbU2MZtdpw/raKKriJih
	LK/dgNVoA7PmH0KYKE2c2dKnw6G1XT8Nm4PFr//VPhFZbehz3ACzK39vmu+f+bxqvD6A5MO
	BPQmM0pDGOIjj0XbNK+BA9eZawlc0BeSTQ5Li4kYtT01Xi83AfjyqgkTYEM5i0Mv0VaJ1P7
	0PnOZcv7p4cr6zise7ODa171BJCTWRdq5TdAdxLtZuGnl5wFm08nuOxIjyo41ve+YwnXieP
	9d1tWS9tI9pjf9IWYkmJXL3kpUpFgMiXG8b8sWKg36m/c7DDU3fa9SRtdJJnL0ZLsJOx4YZ
	SGb09nQD9BEM6PC1CLpx85SnEZVX6VXyVWWvwydPYlnxckP7jGBMCjSXqZmVQ1aO+22JDPm
	I84vK3q4dqEwKn3HuQaoPz7SrzEOZ6WxZBar7i4k6OFfjPbfcjlWluYa5yYtzWkCNIna5ED
	BH2JRWrrsXD5YHfZAQk+bAmbaAKcgPZ+bqthYezx4SpGvDTFJTRkjHTIsv2Z7qLufEYzyqw
	GwRKjrlHJUfENc6hMJhR1dr8wjKmCrUDQRuV6OkJmP4uz8PEWiPmRonCuMx0X+YA/mValSQ
	1FqMZmNllyFzGzyIsluoJPYVCjhXOjpjhV/FbZdn+yHhHQS+V9TzxgqtTSFu9VYV2mu2POJ
	bnhFYZOmQnBlRqE2bmy0wZvc3HMxvdgX+0bA52Z7qbXW2PfGr2xk9W6Ibo0VNiPuRXabgUJ
	6ldYl8+csDD0hvNZWbeMzfH7GveXIZyAiqX6nROAwn2Y2T/BggKzqIH4FRbUwEpnZvimY0A
	+9vD/xR3UrhqWBBjvlzaQYvHuScZo1iZtQbE98073HSNHr2eLdhcxEzAyYrq4vCmiV5MwGb
	Bwfl4JrVxz3VdZuh2uQhPI=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260321_040049_415976_81D60401 
X-CRM114-Status: UNSURE (   8.21  )
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

The function ieee80211_tx_status() was renamed to
ieee80211_tx_status_skb() by commit 2703bc851399
("wifi: mac80211: rename ieee80211_tx_status() to
ieee80211_tx_status_skb()").  Update the stale reference
in ath10k_htt_tx_hl().

Assisted-by: unnamed:deepseek-v3.2 coccinelle
Signed-off-by: Kexin Sun <kexinsun@smail.nju.edu.cn>
---
 drivers/net/wireless/ath/ath10k/htt_tx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index d6f1d85ba871..29e99fbf36fd 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -1353,7 +1353,7 @@ static int ath10k_htt_tx_hl(struct ath10k_htt *htt, enum ath10k_hw_txrx_mode txm
 		msdu_id = res;
 	}
 
-	/* As msdu is freed by mac80211 (in ieee80211_tx_status()) and by
+	/* As msdu is freed by mac80211 (in ieee80211_tx_status_skb()) and by
 	 * ath10k (in ath10k_htt_htc_tx_complete()) we have to increase
 	 * reference by one to avoid a use-after-free case and a double
 	 * free.
-- 
2.25.1


