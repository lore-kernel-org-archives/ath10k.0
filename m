Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C9D3C77B7E
	for <ath10k@archiver.kernel.org>; Thu,  1 Jun 2023 08:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZOXXF8G9itFP4SFrtguf1fm0KhqEibVVIHfhad44nAo=; b=LwsOd6wQUf180A
	4UVZ8f22rhka09fhKbcTmpz2ZIjXjvkVzU9KthO9XXBJ0He4EJOz1GFGf0vDdkDsUAfsYhQ6CAAZo
	nKsc1ccyOw4W3ho0L501yioznxir0tuMX9ACa7GO1mkBZBBlNjDaq5OpnRfc/VNN8OrH1D4GdqYZ4
	yTx5zfiw4i6fCUikjDE7Y9w3mbUK+1MCNVbAIEpxQrJyVx9n4gBQ+xa2QG/NIkYx5/n8pfME+vdE6
	zXVAElHwo9oZ1Hvy8bPEby/ctE7ZZl2r052CxJhEwxCQUjkMYM7P6xGLm68d9NaE9YW12UzcfCXPH
	0xKw8iS3IcmwukTTPYcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4ddR-002XrX-12;
	Thu, 01 Jun 2023 08:26:17 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4ddO-002XoV-1S
	for ath10k@lists.infradead.org;
	Thu, 01 Jun 2023 08:26:15 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1q4ddE-0002uE-GT; Thu, 01 Jun 2023 10:26:04 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q4ddD-004JKk-Kn; Thu, 01 Jun 2023 10:26:03 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q4ddC-00A5yf-KJ; Thu, 01 Jun 2023 10:26:02 +0200
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
Subject: [PATCH net-next 4/4] atk10k: Don't opencode ath10k_pci_priv() in ath10k_ahb_priv()
Date: Thu,  1 Jun 2023 10:25:56 +0200
Message-Id: <20230601082556.2738446-5-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230601082556.2738446-1-u.kleine-koenig@pengutronix.de>
References: <20230601082556.2738446-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=824; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=mB84wW1K4jc1xLTUjLQHhA/td0xttZYqfcR4I36/mvA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkeFYQL7s14DdzYELR1Cx2HAvAJ61K34lTqhuXN Yq/CSdxCiOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZHhWEAAKCRCPgPtYfRL+ Tio+B/4hk7D3EVxU+bfB+uzq0dJigX32SKnyzzrImpCpKSo5DIu/Cwrm2CPNSpRyoxsJA9EG/Db rqDhS1JCk4QrSgjoYWVMOJ35wLdxVEQYKBxN8QcvtTz5+Ng88zEnXV06eoK7m3X7A6yPfdRiALT 4rpj5oY8Jis7gIyjEXXMi0/1evYR6wVFLcUOSX9mdc3cFwlKWa3u8Kd7Cvr0O/0vdWHbktCOn3G Esc9RYWUxaMLW0aC3c0dYxqV50Bthr17alGpMQvFJxxQUc4pNNShI0J+zDxNrp1NgjO9Mh3jPeR Ryk307k+z6X1zimvOzeOrKgvT3fiMqDI5/pj9O8Cf/4qXfLL
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: ath10k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_012614_485761_2D7D644C 
X-CRM114-Status: GOOD (  11.05  )
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

VGhpcyBpbnRyb2R1Y2VzIG5vIGNoYW5nZXMgaW4gdGhlIGNvbXBpbGVkIHJlc3VsdCAodGVzdGVk
IGZvciBhbgpBUkNIPWFybSBhbGxtb2Rjb25maWcgYnVpbGQpLgoKU2lnbmVkLW9mZi1ieTogVXdl
IEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KLS0tCiBkcml2
ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL2FoYi5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQv
d2lyZWxlc3MvYXRoL2F0aDEway9haGIuYyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgx
MGsvYWhiLmMKaW5kZXggNjMyZGE0YzVlNWRhLi40YTAwNmZiNGQ0MjQgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvYWhiLmMKKysrIGIvZHJpdmVycy9uZXQvd2ly
ZWxlc3MvYXRoL2F0aDEway9haGIuYwpAQCAtMjcsNyArMjcsNyBAQCBNT0RVTEVfREVWSUNFX1RB
QkxFKG9mLCBhdGgxMGtfYWhiX29mX21hdGNoKTsKIAogc3RhdGljIGlubGluZSBzdHJ1Y3QgYXRo
MTBrX2FoYiAqYXRoMTBrX2FoYl9wcml2KHN0cnVjdCBhdGgxMGsgKmFyKQogewotCXJldHVybiAm
KChzdHJ1Y3QgYXRoMTBrX3BjaSAqKWFyLT5kcnZfcHJpdiktPmFoYlswXTsKKwlyZXR1cm4gJmF0
aDEwa19wY2lfcHJpdihhciktPmFoYlswXTsKIH0KIAogc3RhdGljIHZvaWQgYXRoMTBrX2FoYl93
cml0ZTMyKHN0cnVjdCBhdGgxMGsgKmFyLCB1MzIgb2Zmc2V0LCB1MzIgdmFsdWUpCi0tIAoyLjM5
LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgx
MGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
