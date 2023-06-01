Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36559C77B7A
	for <ath10k@archiver.kernel.org>; Thu,  1 Jun 2023 08:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pFM2mtp1u9gzcfkGjW2ww3YBTvTgJHFuS3DmLH0cOSw=; b=kn5FAiUPLxYtgg
	LcnPzhXWl+sQULRBmgn1h5k6elih4DIwz4+VLfxpurTAnqSsgtuhfqNs1t3dIH2hT/QM/NS33c2GM
	u4Rd1xZid5PZU6Xa1GipJ+wPjDHMoHNAEV9AFJswjW9Rw7+omYzFqEvfpYD73buWQ81LNhPl+AmGd
	csUR+ZyuXfB4B0m7Tea6WnrL1vTvafMPnbbt+9RDC3yN1+O3zjZU4520/LqmsI7jmRD5dGzp9cWC3
	87stBAweW76eaDXxQm02JPCA7N59nsMJ1vlI/ii8VIXD3mluU8vJKmnVgMsVK/5TEYAg4vg49cjR8
	syTezxSw75qzXljjLIYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4ddS-002Xs9-36;
	Thu, 01 Jun 2023 08:26:18 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4ddO-002XoZ-1f
	for ath10k@lists.infradead.org;
	Thu, 01 Jun 2023 08:26:16 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1q4ddE-0002u2-GT; Thu, 01 Jun 2023 10:26:04 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q4ddC-004JKf-WC; Thu, 01 Jun 2023 10:26:03 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q4ddC-00A5yc-DB; Thu, 01 Jun 2023 10:26:02 +0200
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
Subject: [PATCH net-next 3/4] ath10k: Convert to platform remove callback returning void
Date: Thu,  1 Jun 2023 10:25:55 +0200
Message-Id: <20230601082556.2738446-4-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230601082556.2738446-1-u.kleine-koenig@pengutronix.de>
References: <20230601082556.2738446-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3192; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=wPyGg8vqpI8ICYVHsb0hUkRVG2HoNMcDpA8BThv+i/s=; b=owGbwMvMwMXY3/A7olbonx/jabUkhpSKMP6rJpo9+xvfsvtVLnt5ZKsPF+vVxqXmyz1XTVZXu rj3wWa9TkZjFgZGLgZZMUUW+8Y1mVZVcpGda/9dhhnEygQyhYGLUwAmknGHg6Epw1nEuX3Ps/YL LCozXG/LN7wQVf7y4s6CeW4VdlOsGc6bGX7+8iD6nktBurDCxxl3TzcoKkU84ksvYvdleRih/8J sxYMSty1dJa23Xj76E+yzQOXIBO88s2+xSkFyNzYwMRyzivZPOmzlvrXLQ6aRXfTWk377dpb7q9 7Jei39drj2n8XUyjiT11PnLOE6bvHc5dS6xYUR7O+Ninx/Hze6I7PezjSZhS3l/ESBbf0uy8KDv ppejPb99vrv7bj4vfcCe7PmaZZPi2AIushxLnqpsBjP2fSUzJU1zY5OmxllzmTsWbqc/0Bwaa// 3DWRAbKbDkVb2sxjnXE8PCFmYq2MarZQkQg7e/72WpliAA==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: ath10k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_012614_572440_D6263372 
X-CRM114-Status: GOOD (  17.29  )
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

VGhlIC5yZW1vdmUoKSBjYWxsYmFjayBmb3IgYSBwbGF0Zm9ybSBkcml2ZXIgcmV0dXJucyBhbiBp
bnQgd2hpY2ggbWFrZXMKbWFueSBkcml2ZXIgYXV0aG9ycyB3cm9uZ2x5IGFzc3VtZSBpdCdzIHBv
c3NpYmxlIHRvIGRvIGVycm9yIGhhbmRsaW5nIGJ5CnJldHVybmluZyBhbiBlcnJvciBjb2RlLiBI
b3dldmVyIHRoZSB2YWx1ZSByZXR1cm5lZCBpcyAobW9zdGx5KSBpZ25vcmVkCmFuZCB0aGlzIHR5
cGljYWxseSByZXN1bHRzIGluIHJlc291cmNlIGxlYWtzLiBUbyBpbXByb3ZlIGhlcmUgdGhlcmUg
aXMgYQpxdWVzdCB0byBtYWtlIHRoZSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuIHZvaWQuIEluIHRo
ZSBmaXJzdCBzdGVwIG9mIHRoaXMKcXVlc3QgYWxsIGRyaXZlcnMgYXJlIGNvbnZlcnRlZCB0byAu
cmVtb3ZlX25ldygpIHdoaWNoIGFscmVhZHkgcmV0dXJucwp2b2lkLgoKQm90aCBhdGgxMGsgcGxh
dGZvcm0gZHJpdmVycyByZXR1cm4gemVybyB1bmNvbmRpdGlvbmFsbHkgaW4gdGhlaXIgcmVtb3Zl
CmNhbGxiYWNrLCBzbyB0aGV5IGNhbiBiZSB0cml2aWFsbHkgY29udmVydGVkIHRvIHVzZSAucmVt
b3ZlX25ldygpLgoKQWxzbyBmaXggb24gb2YgdGhlIG1vcmUgb2ZmZW5kaW5nIHdoaXRlc3BhY2Ug
aXNzdWVzIGluIHRoZSBkZWZpbml0aW9uCm9mIGF0aDEwa19zbm9jX2RyaXZlci4KClNpZ25lZC1v
ZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+
Ci0tLQogZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9haGIuYyAgfCA2ICsrLS0tLQog
ZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9zbm9jLmMgfCA4ICsrKy0tLS0tCiAyIGZp
bGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL2FoYi5jIGIvZHJpdmVycy9uZXQvd2ly
ZWxlc3MvYXRoL2F0aDEway9haGIuYwppbmRleCBmZmZkYmFkNzUwNzQuLjYzMmRhNGM1ZTVkYSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9haGIuYworKysgYi9k
cml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL2FoYi5jCkBAIC04MjAsNyArODIwLDcgQEAg
c3RhdGljIGludCBhdGgxMGtfYWhiX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
CiAJcmV0dXJuIHJldDsKIH0KIAotc3RhdGljIGludCBhdGgxMGtfYWhiX3JlbW92ZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQorc3RhdGljIHZvaWQgYXRoMTBrX2FoYl9yZW1vdmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIHsKIAlzdHJ1Y3QgYXRoMTBrICphciA9IHBsYXRm
b3JtX2dldF9kcnZkYXRhKHBkZXYpOwogCkBAIC04MzQsOCArODM0LDYgQEAgc3RhdGljIGludCBh
dGgxMGtfYWhiX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCWF0aDEwa19h
aGJfY2xvY2tfZGlzYWJsZShhcik7CiAJYXRoMTBrX2FoYl9yZXNvdXJjZV9kZWluaXQoYXIpOwog
CWF0aDEwa19jb3JlX2Rlc3Ryb3koYXIpOwotCi0JcmV0dXJuIDA7CiB9CiAKIHN0YXRpYyBzdHJ1
Y3QgcGxhdGZvcm1fZHJpdmVyIGF0aDEwa19haGJfZHJpdmVyID0gewpAQCAtODQ0LDcgKzg0Miw3
IEBAIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIGF0aDEwa19haGJfZHJpdmVyID0gewog
CQkub2ZfbWF0Y2hfdGFibGUgPSBhdGgxMGtfYWhiX29mX21hdGNoLAogCX0sCiAJLnByb2JlICA9
IGF0aDEwa19haGJfcHJvYmUsCi0JLnJlbW92ZSA9IGF0aDEwa19haGJfcmVtb3ZlLAorCS5yZW1v
dmVfbmV3ID0gYXRoMTBrX2FoYl9yZW1vdmUsCiB9OwogCiBpbnQgYXRoMTBrX2FoYl9pbml0KHZv
aWQpCmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL3Nub2MuYyBi
L2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvc25vYy5jCmluZGV4IDUxMjhhNDUyYzY1
Zi4uMjYyMTRjMDBjZDBkIDEwMDY0NAotLS0gYS9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRo
MTBrL3Nub2MuYworKysgYi9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL3Nub2MuYwpA
QCAtMTg0OCw3ICsxODQ4LDcgQEAgc3RhdGljIGludCBhdGgxMGtfc25vY19mcmVlX3Jlc291cmNl
cyhzdHJ1Y3QgYXRoMTBrICphcikKIAlyZXR1cm4gMDsKIH0KIAotc3RhdGljIGludCBhdGgxMGtf
c25vY19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKK3N0YXRpYyB2b2lkIGF0
aDEwa19zbm9jX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogewogCXN0cnVj
dCBhdGgxMGsgKmFyID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldik7CiAJc3RydWN0IGF0aDEw
a19zbm9jICphcl9zbm9jID0gYXRoMTBrX3Nub2NfcHJpdihhcik7CkBAIC0xODYxLDggKzE4NjEs
NiBAQCBzdGF0aWMgaW50IGF0aDEwa19zbm9jX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQogCQl3YWl0X2Zvcl9jb21wbGV0aW9uX3RpbWVvdXQoJmFyLT5kcml2ZXJfcmVjb3Zl
cnksIDMgKiBIWik7CiAKIAlhdGgxMGtfc25vY19mcmVlX3Jlc291cmNlcyhhcik7Ci0KLQlyZXR1
cm4gMDsKIH0KIAogc3RhdGljIHZvaWQgYXRoMTBrX3Nub2Nfc2h1dGRvd24oc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikKQEAgLTE4NzUsOCArMTg3Myw4IEBAIHN0YXRpYyB2b2lkIGF0aDEw
a19zbm9jX3NodXRkb3duKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAKIHN0YXRpYyBz
dHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIGF0aDEwa19zbm9jX2RyaXZlciA9IHsKIAkucHJvYmUgID0g
YXRoMTBrX3Nub2NfcHJvYmUsCi0JLnJlbW92ZSA9IGF0aDEwa19zbm9jX3JlbW92ZSwKLQkuc2h1
dGRvd24gPSAgYXRoMTBrX3Nub2Nfc2h1dGRvd24sCisJLnJlbW92ZV9uZXcgPSBhdGgxMGtfc25v
Y19yZW1vdmUsCisJLnNodXRkb3duID0gYXRoMTBrX3Nub2Nfc2h1dGRvd24sCiAJLmRyaXZlciA9
IHsKIAkJLm5hbWUgICA9ICJhdGgxMGtfc25vYyIsCiAJCS5vZl9tYXRjaF90YWJsZSA9IGF0aDEw
a19zbm9jX2R0X21hdGNoLAotLSAKMi4zOS4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0
aDEwawo=
