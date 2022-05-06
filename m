Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 909E5C433EF
	for <ath10k@archiver.kernel.org>; Fri,  6 May 2022 18:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:
	Subject:From:To:Date:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=2fAdnqCgJFu+JRPe4QswSbE77a3jrdK50uNsYL93u4I=; b=sRZ
	bKIrKEssNgCSqCKR5b61TfmJtsDVKWY0ZsitkIcLX3sJbXfMQpA+8qzrl0vGrQKrGtVUljVgjDpQd
	zOuW5JcDoRz0tBRFZLc+4iWDlxX+M84+2lrtdCJKaXhLok9kmhloKcQ3VyiREZd4vGX4loxWR2pFM
	rKOJ/4P1/UTiv6dQV+o3Pl+WVpOGCn4KSSfxELaqPT6vRSu5mQq6GDkIgfAPnBD1EkN2uXtzoy/ga
	jhFvyt01SYDRhmY4AQWcL0UTktQq6iPWDTcwXxty3nqwSgtKMXYlaw9+TpcfvYgowSakKaVoLCeJC
	APHgYFXSVl6eafCakTAza0V8c+5nHbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nn2xs-004k5o-8J; Fri, 06 May 2022 18:46:08 +0000
Received: from mail-40130.protonmail.ch ([185.70.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nn2xo-004k5X-F6
 for ath10k@lists.infradead.org; Fri, 06 May 2022 18:46:06 +0000
Date: Fri, 06 May 2022 18:45:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=protonmail3; t=1651862760;
 bh=sjJss+FNtHkselknNDMT2aWWbGgsD9Ic1R/jwjO+3DA=;
 h=Date:To:From:Reply-To:Subject:Message-ID:Feedback-ID:From:To:Cc:
 Date:Subject:Reply-To:Feedback-ID:Message-ID;
 b=lXUfqYoV0AFRT0/2vIyTGC5cFs2743S4mTtHhvDW3jrOJush2A6JG5t8xgDx+nX4K
 oq5adSxCKIChkLm3JiaX6/Jr7Oba2yepg6PXJWgXiSPzQPLUT+yoA8FQ6cnMbxijbZ
 gyRaHq5NaFb6juZcQw9yH/qDRP3YatoQ2FOP7sC47/3p6WkxE3H4xUAF7lZJDCiLJW
 hnvLJkLIO91cu6hAg0i4zLeIgoxRzl1DfD0RbvCju7X2p9mVCQNr1B10rFNDh6d5h5
 PSs8dVQG0mI+DtMkPoUcZNtAs1NNRGKOb59r3jqhzyfAiXsEsAmXWmmgGJLvzzUtdv
 NmWs0mhnvdKAg==
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
From: Alex <alexknoptech@proton.me>
Subject: ath_10kpci  Bug
Message-ID: <QV6gW9w50GNada4YipsJxntzNcT84ajnWslhecSa7W6rRxMVw7wpcpPQaZkzWSTDGC1bnKx-h3t5ubVBm5CJqpq5Kg1wFXE8ZOL-SEHZ83k=@proton.me>
Feedback-ID: 46172384:user:proton
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_114605_208776_5856F1B4 
X-CRM114-Status: UNSURE (   3.97  )
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
Reply-To: Alex <alexknoptech@proton.me>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

SGVsbG8sCkkgYW0gcnVubmluZyBpbnRvIGEgYnVnIHdoZXJlIFdpLUZpIHdpbGwgb2NjYXNpb25h
bGx5IHN0b3Agd29ya2luZyBkdXJpbmcgcnVudGltZS4gSSB3aWxsIHN0aWxsIGJlIGNvbm5lY3Rl
ZCB0byB0aGUgV2ktRmkgbmV0d29yayBidXQgbm90IGJlIGFibGUgdG8gcGluZyBteSBkZWZhdWx0
IGdhdGV3YXksIHJlYWNoIHdlYnNpdGVzLCBvciBwaW5nIGV4dGVybmFsIGhvc3RzLiBJdCBhcHBl
YXJzIHRoZXJlIGlzIHNvbWUgaXNzdWUgaGFwcGVuaW5nIGluIHRoZSBrZXJuZWwgYXMgd2VsbC4g
SGVyZSBhcmUgdGhlIGxvZ3MgSSByZWNlaXZlIHdoZW4gdGhpcyBoYXBwZW5zLiBDdXJyZW50IHdv
cmthcm91bmQgaXMgdG8gdHVybiBvZmYgV2ktRmkgdGhlbiB0dXJuIGl0IGJhY2sgb24uClsgNDQ2
NC4xOTUwMTFdIGF0aDEwa19wY2kgMDAwMDowMTowMC4wOiB0aW1lZCBvdXQgd2FpdGluZyBwZWVy
IHN0YXRzIGluZm8KWyA0NDY3LjI3MTAxMV0gYXRoMTBrX3BjaSAwMDAwOjAxOjAwLjA6IHdtaSBj
b21tYW5kIDkwMTEzIHRpbWVvdXQsIHJlc3RhcnRpbmcgaGFyZHdhcmUKWyA0NDY3LjI3MTAzMF0g
YXRoMTBrX3BjaSAwMDAwOjAxOjAwLjA6IGNvdWxkIG5vdCByZXF1ZXN0IHN0YXRzICgtMTEpClsg
NDQ2Ny4yNzEyODRdIGF0aDEwa19wY2kgMDAwMDowMTowMC4wOiBjb3VsZCBub3QgcmVxdWVzdCBw
ZWVyIHN0YXRzIGluZm86IC0xMDgKWyA0NDY3LjI4MjY0OF0gYXRoMTBrX3BjaSAwMDAwOjAxOjAw
LjA6IGZhaWxlZCB0byByZWFkIGhpX2JvYXJkX2RhdGEgYWRkcmVzczogLTE2ClsgNDQ3MC4zMjMx
NzJdIGF0aDEwa19wY2kgMDAwMDowMTowMC4wOiBmYWlsZWQgdG8gcmVjZWl2ZSBpbml0aWFsaXpl
ZCBldmVudCBmcm9tIHRhcmdldDogMDAwMDAwMDAKWyA0NDczLjM0NzA1OF0gYXRoMTBrX3BjaSAw
MDAwOjAxOjAwLjA6IGZhaWxlZCB0byByZWNlaXZlIGluaXRpYWxpemVkIGV2ZW50IGZyb20gdGFy
Z2V0OiAwMDAwMDAwMApbIDQ0NzMuMzQ3MDYzXSBhdGgxMGtfcGNpIDAwMDA6MDE6MDAuMDogZmFp
bGVkIHRvIHdhaXQgZm9yIHRhcmdldCBpbml0OiAtMTEwClsgNDQ3My4zNDgwMDldIGllZWU4MDIx
MSBwaHkwOiBIYXJkd2FyZSByZXN0YXJ0IHdhcyByZXF1ZXN0ZWQKWyA0NDczLjM0ODAyOF0gYXRo
MTBrX3BjaSAwMDAwOjAxOjAwLjA6IGNvdWxkIG5vdCByZXF1ZXN0IHN0YXRzICgtMTA4KQpbIDQ0
NzMuNjY1MjY0XSBhdGgxMGtfcGNpIDAwMDA6MDE6MDAuMDogZGV2aWNlIHN1Y2Nlc3NmdWxseSBy
ZWNvdmVyZWQKCk90aGVyIGluZm86ClsgwqAxNTIuNjcxMDIxXSBhdGgxMGtfcGNpIDAwMDA6MDE6
MDAuMDogcWNhNjE3NCBodzMuMiB0YXJnZXQgMHgwNTAzMDAwMCBjaGlwX2lkIDB4MDAzNDBhZmYg
c3ViIDE3YWE6MDgyNwpbIMKgMTUyLjY3MTQzOV0gYXRoMTBrX3BjaSAwMDAwOjAxOjAwLjA6IGZp
cm13YXJlIHZlciBXTEFOLlJNLjQuNC4xLTAwMjg4LSBhcGkgNiBmZWF0dXJlcyB3b3dsYW4saWdu
b3JlLW90cCxtZnAgY3JjMzIgYmY5MDdjN2MKCgpLZXJuZWw6IExpbnV4IDUuMTEuMC00Ni1nZW5l
cmljIHg4Nl82NAoKQW55IHN1Z2dlc3Rpb25zIG9yIGFueSBvdGhlciBpbmZvIG5lZWRlZCBmb3Ig
dGhpcyBidWcgcGxlYXNlIGxldCBtZSBrbm93LgoKCkFsZXggSwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2F0aDEwawo=
