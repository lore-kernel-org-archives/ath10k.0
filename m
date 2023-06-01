Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49503C77B7A
	for <ath10k@archiver.kernel.org>; Thu,  1 Jun 2023 08:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kCST7/XsKyGC+oNumKA9ii6wR+MDj1LltsQkPeppYh8=; b=1S19toltN7QkqG
	0X/qj1OXK2sEXTXj1dkxXjP5sHJJFvjl+x1wFt198CSYt8vo6Wly+HNMTPVynSowFHlOfx41CnuHY
	HEiNyFuucbiWPO9zTrc7DQfrx0ywMYbwbqVIkfZ6aWkpboF/LbCL1EKsC5DuBTEPRVvB6BFf5MU0c
	8pdJf0z/hbAxv4RbR8p1Z63CaXXk8Lyb37c+knrnx25L9KpkPkIBfdIGR0HpJlVdhaywIFO0/xIE8
	epfp+TF+nH0jUAoNYqataDoAxkLdwX0lRoCaFwnO7IEx4lhW4vkoWP+duCayH57pCiwMZeyhnYJ2N
	YjB4gAWmI5R710ZVpkyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4ddT-002XsO-1b;
	Thu, 01 Jun 2023 08:26:19 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4ddP-002Xon-2d
	for ath10k@lists.infradead.org;
	Thu, 01 Jun 2023 08:26:17 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1q4ddE-0002th-GT; Thu, 01 Jun 2023 10:26:04 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q4ddC-004JKY-Se; Thu, 01 Jun 2023 10:26:02 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q4ddC-00A5yZ-4N; Thu, 01 Jun 2023 10:26:02 +0200
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
Subject: [PATCH net-next 2/4] ath10k: Drop checks that are always false
Date: Thu,  1 Jun 2023 10:25:54 +0200
Message-Id: <20230601082556.2738446-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230601082556.2738446-1-u.kleine-koenig@pengutronix.de>
References: <20230601082556.2738446-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1156; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=Yfnwqnu04xN5zBPB75lffig/GKnzspVu8L0rjK4grlM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkeFYNH9B9+cgVgG1rALdO44a+2awW1rJORFSvx 5lBEbtN+3eJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZHhWDQAKCRCPgPtYfRL+ TpRCB/47yB+eQRU7pdV1LYcp0fUx1OeF3hlOATCnnNXYV4ZMpzUEemcA9EZktaH4Ako6XjMW9D9 3wDC53dbWEhhRYJ/NNnaz9NZp9cG88rtC3ij4HdEwjSeGUdU2UhSfhaEFwNWtzhKLPeCbEgZhTH FGgtQ5Hiriu79W9CPXymRD1QXisW8Hs8ZOUtmE7ddnS5xnXJiHB3s3OZ7VGGsbKPjDxerJ895mo YRBLWh3Trd8eaBSRbjxqeDLHZEKe0iod0ea7buh3YFZYzCgacYMFcwe2dV0eUhPm3PGfABPrHrL RZ0q6czA2fUYs93OrE72DGM0v7Ikhx1OLEzRSAczbVaQRVsk
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: ath10k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_012615_850555_811ECE56 
X-CRM114-Status: GOOD (  10.82  )
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

cGxhdGZvcm1fZ2V0X2RydmRhdGEoKSBjYW5ub3QgcmV0dXJuIE5VTEwgYXMgdGhlIHByb2JlIGZ1
bmN0aW9uIGNhbGxzCnBsYXRmb3JtX3NldF9kcnZkYXRhKCkgd2l0aCBhIG5vbi1OVUxMIGFyZ3Vt
ZW50IG9yIHJldHVybnMgd2l0aCBhIGZhaWx1cmUuCkluIHRoZSBmaXJzdCBjYXNlLCBwbGF0Zm9y
bV9nZXRfZHJ2ZGF0YSgpIHJldHVybnMgdGhpcyBub24tTlVMTCB2YWx1ZSBhbmQKaW4gdGhlIHNl
Y29uZCB0aGUgcmVtb3ZlIGNhbGxiYWNrIGlzbid0IGNhbGxlZCBhdCBhbGwuCgphdGgxMGtfYWhi
X3ByaXYoKSBjYW5ub3QgcmV0dXJuIE5VTEwgYW5kIGFyX2FoYiBpcyB1bnVzZWQgYWZ0ZXIgdGhl
IGNoZWNrCmFueWhvdy4KClNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWlu
ZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Ci0tLQogZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0
aDEway9haGIuYyB8IDkgLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOSBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL2FoYi5jIGIvZHJp
dmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9haGIuYwppbmRleCA3YmI0NWM2NmNmZjcuLmZm
ZmRiYWQ3NTA3NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9h
aGIuYworKysgYi9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL2FoYi5jCkBAIC04MjMs
MTUgKzgyMyw2IEBAIHN0YXRpYyBpbnQgYXRoMTBrX2FoYl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQogc3RhdGljIGludCBhdGgxMGtfYWhiX3JlbW92ZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2KQogewogCXN0cnVjdCBhdGgxMGsgKmFyID0gcGxhdGZvcm1fZ2V0X2Ry
dmRhdGEocGRldik7Ci0Jc3RydWN0IGF0aDEwa19haGIgKmFyX2FoYjsKLQotCWlmICghYXIpCi0J
CXJldHVybiAtRUlOVkFMOwotCi0JYXJfYWhiID0gYXRoMTBrX2FoYl9wcml2KGFyKTsKLQotCWlm
ICghYXJfYWhiKQotCQlyZXR1cm4gLUVJTlZBTDsKIAogCWF0aDEwa19kYmcoYXIsIEFUSDEwS19E
QkdfQUhCLCAiYWhiIHJlbW92ZVxuIik7CiAKLS0gCjIuMzkuMgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBr
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hdGgxMGsK
