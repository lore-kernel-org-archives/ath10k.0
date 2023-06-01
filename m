Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F61DC77B7E
	for <ath10k@archiver.kernel.org>; Thu,  1 Jun 2023 08:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=obEGb3Bt0QGZNUDOXP5NKF/gCL/OWZYD1AlBOUl32sw=; b=0QernvpjVklMbl
	Q4kOrNOm6ghnkzBSTnGnrNfNowkvLzT8E4V/V9SJdRU1pRyI4002/6PGGas+9mXBibGSSi7m/dvTw
	uthg6wSQb25epHLBugojJX9CJjJB9mL/sfE+K26sOnDeph7wwC7U3E7wgpVLH3lO5WC2G+DKmzqAE
	VXJgdvceDmQvm2jj6keSyCq0lPr4K0k53W8kAWC4iCrPmbdlKbg09d1pQ4dEMO33j9kjh+6RgWG+S
	BwXcPBVWu6Nf2c0CnG5wxLB7bl9r5VEAm6UVPfRhzdW4ofpiQKvCvrT/xmIFdb3CyfmdiXeYWAxpe
	NmGp6JrHX8vgYwNBFNSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4ddR-002Xrl-2l;
	Thu, 01 Jun 2023 08:26:17 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4ddO-002XoW-1U
	for ath10k@lists.infradead.org;
	Thu, 01 Jun 2023 08:26:16 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1q4ddE-0002ti-GT; Thu, 01 Jun 2023 10:26:04 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q4ddC-004JKW-Se; Thu, 01 Jun 2023 10:26:02 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q4ddB-00A5yT-N0; Thu, 01 Jun 2023 10:26:01 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Kalle Valo <kvalo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH net-next 0/4] Convert to platform remove callback returning void
Date: Thu,  1 Jun 2023 10:25:52 +0200
Message-Id: <20230601082556.2738446-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=694; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=LDH1GV5OzpFdWpqljYlURuz66Yddzkf91qnNMP1L1/I=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkeFYL6blk48dDBZlBxSMvwwo9tSJyyfPVB8GgZ uLtgKzsALKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZHhWCwAKCRCPgPtYfRL+ Toa3B/9QAE/Xf3Bc5GdAS3I3ut7SbNYsFuCllbzG2XTQZQTj/c/5jvjl3XjNp1b6NoK8gNt5oUa umkrElgUY5f+g58K8dUW0x0ui3qMQYomra028yxPCzzZQacYM/Wi1cQnehHCzVZMjX9Y9BTtWUL NmnORDdGxmitfQ3b11inPsGDZEjVP6xge4k6bWQOaVCTMwZBRIP4A0TiSbJaw6b9JpSjPtqOHhW l/tEHoOWdhCgDu1cvzMwJQ/PPap861qVnY878uyDuoN1ZEUG3L8p7UAkfRELNibTZx/XW6KElgK 1nmOYQF1OXLYv3WBrORk2RfrpmBn0XJ656LKWq3/k66hh8qn
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: ath10k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_012614_495184_72A07490 
X-CRM114-Status: UNSURE (   8.09  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgp0aGUgbW90aXZhdGlvbiBmb3IgdGhpcyBzZXJpZXMgaXMgcGF0Y2ggIzMsIHBhdGNo
ICMyIGlzIGEgcHJlcGFyYXRpb24gZm9yIGl0CmFuZCBwYXRjaGVzICMxIGFuZCAjNCBhcmUganVz
dCBjbGVhbnVwcyB0aGF0IEkgbm90aWNlZCBlbiBwYXNzYW50LgoKQmVzdCByZWdhcmRzClV3ZQoK
VXdlIEtsZWluZS1Lw7ZuaWcgKDQpOgogIGF0aDEwazogRHJvcCBjbGVhbmluZyBvZiBkcml2ZXIg
ZGF0YSBmcm9tIHByb2JlIGVycm9yIHBhdGggYW5kIHJlbW92ZQogIGF0aDEwazogRHJvcCBjaGVj
a3MgdGhhdCBhcmUgYWx3YXlzIGZhbHNlCiAgYXRoMTBrOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJl
bW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAogIGF0azEwazogRG9uJ3Qgb3BlbmNvZGUgYXRo
MTBrX3BjaV9wcml2KCkgaW4gYXRoMTBrX2FoYl9wcml2KCkKCiBkcml2ZXJzL25ldC93aXJlbGVz
cy9hdGgvYXRoMTBrL2FoYi5jICB8IDIwICsrKy0tLS0tLS0tLS0tLS0tLS0tCiBkcml2ZXJzL25l
dC93aXJlbGVzcy9hdGgvYXRoMTBrL3Nub2MuYyB8ICA4ICsrKy0tLS0tCiAyIGZpbGVzIGNoYW5n
ZWQsIDYgaW5zZXJ0aW9ucygrKSwgMjIgZGVsZXRpb25zKC0pCgpiYXNlLWNvbW1pdDogYWM5YTc4
NjgxYjkyMTg3NzUxODc2M2JhMGU4OTIwMjI1NDM0OWQxYgotLSAKMi4zOS4yCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlz
dAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
