Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F35FEC32771
	for <ath10k@archiver.kernel.org>; Mon, 26 Sep 2022 21:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pUk6hz4cBgV3J3cIYAhbYj7V0uDfq5Hm0rWVMVzNHMo=; b=ZWaOdcbmnoKJnp
	GLv592LccmNdj54rSkvG+6i7GXgNiH9i03ZBNfLQErDsLDvw8gj+/IwN6JxCnsns2mSlCUoQFOC+2
	Kaqa03gJjkRcNtkWWXly/dt/EnZXEQAWbrwA6jWuHl/tmDPClF4p3ELS2jghsjMNL8HMYxQXyhhOk
	GiWIQ31JQLt6FLUHrMwzQgIrnaSLDeeDUeeXBjZgestyesk9RYAZ/VA7TR6t0dQgkiallfp8BveTZ
	KjpzIS2h9DlN7b8tfQY3YOC0MIwzd2rAlaiBupnSAuhE89CcB/UWTrWFP5qLZi7GIrTPNwQvOHv/g
	ZY/qKqXkKPYxvQ8RWkzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocvra-0070LY-4a; Mon, 26 Sep 2022 21:42:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocvrX-0070DD-2i
	for ath10k@lists.infradead.org; Mon, 26 Sep 2022 21:42:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AA68B61387;
	Mon, 26 Sep 2022 21:42:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EA4FC433D6;
	Mon, 26 Sep 2022 21:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664228520;
	bh=Xa4BkxMFeIIJfKHYr4ePJYQZBBTMBlGFQ0Mb8GYffik=;
	h=Date:From:To:Cc:Subject:From;
	b=S6n/iFfWfO0akHLJkH4ZyqWVbWLfcz7qUaEqZPxOhUN/OHQ/zGk/ctEyX/E+Rb9Xd
	 egpdAHEck9L41dnAlaOUBTfxfIuS3z/cs/0bstdYtRncPcUHXdwDJy99TDjNon38X/
	 tFGgpHiZC646p35urLUndeRicARWEwLDVzgyeVZyW5GdxSlUKf45LzePxy/dXLIzKw
	 oIDzPb+uCJUZz7782eXeYjdgRCPZvfQO4OJyUJOsRc9eqLnm4RuXTgwTkoAAJ9As8U
	 OCU85uUsSaY27/Hdlv7bORY8wEK/Ac//ApJDNBvON5qK/kRyzHHVgnYKHzgc+Bp4D/
	 mYnfeyFwEkP/g==
Date: Mon, 26 Sep 2022 16:41:54 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Kalle Valo <kvalo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-hardening@vger.kernel.org
Subject: [PATCH][next] ath10k: Replace zero-length arrays with
 DECLARE_FLEX_ARRAY() helper
Message-ID: <YzIcoloIQBDqGlgc@work>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_144203_220809_FE4070A8 
X-CRM114-Status: UNSURE (   9.30  )
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

Zero-length arrays are deprecated and we are moving towards adopting
C99 flexible-array members, instead. So, replace zero-length arrays
declarations in anonymous union with the new DECLARE_FLEX_ARRAY()
helper macro.

This helper allows for flexible-array members in unions.

Link: https://github.com/KSPP/linux/issues/193
Link: https://github.com/KSPP/linux/issues/212
Link: https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/net/wireless/ath/ath10k/htt.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt.h b/drivers/net/wireless/ath/ath10k/htt.h
index f06cf39204e2..c051a22fce14 100644
--- a/drivers/net/wireless/ath/ath10k/htt.h
+++ b/drivers/net/wireless/ath/ath10k/htt.h
@@ -1108,8 +1108,10 @@ struct htt_rx_in_ord_ind {
 	u8 reserved;
 	__le16 msdu_count;
 	union {
-		struct htt_rx_in_ord_msdu_desc msdu_descs32[0];
-		struct htt_rx_in_ord_msdu_desc_ext msdu_descs64[0];
+		DECLARE_FLEX_ARRAY(struct htt_rx_in_ord_msdu_desc,
+				   msdu_descs32);
+		DECLARE_FLEX_ARRAY(struct htt_rx_in_ord_msdu_desc_ext,
+				   msdu_descs64);
 	} __packed;
 } __packed;
 
-- 
2.34.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
