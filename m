Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ED4CC7EE2A
	for <ath10k@archiver.kernel.org>; Thu,  1 Jun 2023 08:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kLWWcBc+NtZ+o2KDwZs7nfkNIOC395Tv7MzCy5bCa1A=; b=SOnsKqJVNol+lW
	vmOwGQBsyV7fY5YVR482ZoVvki9FSUSy95RZA1ZGd8CymGviaVQJj8FDexqtJXPxZgplsoQFMwagO
	Sycti0cKxXL47RmMTlVUVh2oImUyJ3hOmEKRccQ+brk57Dqo5eOUgl5rrWQexqk3CMsymtm+Cm95Q
	BD2efvicjjypPEPfcIOCYOY1EcvLHqCdD2D0T3guJDnQCRPe6DuZGVg2fuhUuZfeZXEGy7XXtsIyv
	rgPxLtUWl/LCuE2JXG9L/CvOD1cAx6ga4Els2t1W+WXTH7ttCyPogPrbNWGT1eXi+6qyMDJooi2UD
	oIOtygUouksdJ4nUaTCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4ddS-002Xry-1E;
	Thu, 01 Jun 2023 08:26:18 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4ddO-002XoX-1V
	for ath10k@lists.infradead.org;
	Thu, 01 Jun 2023 08:26:16 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1q4ddE-0002tt-GT; Thu, 01 Jun 2023 10:26:04 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q4ddC-004JKe-VT; Thu, 01 Jun 2023 10:26:02 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q4ddB-00A5yW-Tw; Thu, 01 Jun 2023 10:26:01 +0200
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
Subject: [PATCH net-next 1/4] ath10k: Drop cleaning of driver data from probe error path and remove
Date: Thu,  1 Jun 2023 10:25:53 +0200
Message-Id: <20230601082556.2738446-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230601082556.2738446-1-u.kleine-koenig@pengutronix.de>
References: <20230601082556.2738446-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=942; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=/b+eoSPz9HG2VPpR1UR16uVKTcTD7gKSXld+WjvDuk4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkeFYMjksFhfS3h1NyC7+gR5ba3ymfDLI1F5L1W gHLt4wuLt2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZHhWDAAKCRCPgPtYfRL+ TskTCAC7CWyAAZFHB8MYkQ+a5zOuyFeqHkD8VWZl7bDu3yq6x4OTYwLbvQnLT+r42HFnISJV69m xjJhmqV5zUGCSt9SUQKeNHfJFjUX1mK1q7i2jhKPD6Nk6n3Za+72WIB4tv5V8bVQEri5h37OffV OSt9rmwBRHSCAyClqqI0jiU6iZKzkIKyxkmew+rhrKepaIrhFvx3CoB9rk7sObsHF8IydpaM+J4 0OcEbDAPIvWahtN/xETDwsYYNK9xF3oSlCFpGxNM/9CuJDR770Nuvo8wvobCsAm3WkxZb02qUnX /0xx6DGSmkw/xM3wfEvl0OyC+ib8XuR0Y/ukEhc4PUB6SQ2F
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: ath10k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_012614_502756_B83D44AB 
X-CRM114-Status: UNSURE (   9.73  )
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

VGhlIGRyaXZlciBjb3JlIGNhcmVzIGZvciByZXNldHRpbmcgZHJpdmVyIGRhdGEgaWYgcHJvYmUg
ZmFpbHMgYW5kIGFmdGVyCnJlbW92ZS4gU28gZHJvcCB0aGUgZXhwbGljaXQgYW5kIGR1cGxpY2F0
ZSBjbGVhbnVwIGluIHRoZSBkcml2ZXIncwpmdW5jdGlvbnMuCgpTaWduZWQtb2ZmLWJ5OiBVd2Ug
S2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgotLS0KIGRyaXZl
cnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvYWhiLmMgfCAzIC0tLQogMSBmaWxlIGNoYW5nZWQs
IDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0
aDEway9haGIuYyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvYWhiLmMKaW5kZXgg
ZjBjNjE1ZmE1NjE0Li43YmI0NWM2NmNmZjcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbmV0L3dpcmVs
ZXNzL2F0aC9hdGgxMGsvYWhiLmMKKysrIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEw
ay9haGIuYwpAQCAtODE2LDcgKzgxNiw2IEBAIHN0YXRpYyBpbnQgYXRoMTBrX2FoYl9wcm9iZShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCiBlcnJfY29yZV9kZXN0cm95OgogCWF0aDEw
a19jb3JlX2Rlc3Ryb3koYXIpOwotCXBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIE5VTEwpOwog
CiAJcmV0dXJuIHJldDsKIH0KQEAgLTg0NSw4ICs4NDQsNiBAQCBzdGF0aWMgaW50IGF0aDEwa19h
aGJfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJYXRoMTBrX2FoYl9yZXNv
dXJjZV9kZWluaXQoYXIpOwogCWF0aDEwa19jb3JlX2Rlc3Ryb3koYXIpOwogCi0JcGxhdGZvcm1f
c2V0X2RydmRhdGEocGRldiwgTlVMTCk7Ci0KIAlyZXR1cm4gMDsKIH0KIAotLSAKMi4zOS4yCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1h
aWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
