Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5935C4332F
	for <ath10k@archiver.kernel.org>; Wed, 13 Apr 2022 09:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Do51A2B/I69hQVA6CNHYdTxt9WGU9dlSp+dxCQhyeoM=; b=dF81gq42KGCp7J
	FDyYGY5f3Q0CW2bF+gltExeLTIMi3HbJWKdmqZXHpgEwagmbPCqqqlmqzkmJSGxaiMvmJAd0gcgzR
	87R79KWKQkzZva2ADFyT7rAooL4qirknAyJvFgTXhOIbaKfaI/aQBDE4sniFkcXCSwoenyJOWLVoV
	Qn4qMcCgzkRrBaoa7cJWFkNzZSMgRxmc3KXNFhR+ebNrheofrk8mOjTeBY2KPwN5UNJY5qLBjZ686
	zL8uiKPj4QlyGsgZGf4G3LZaDqv/w2J6uSfsg20jWuRBwUrbvrhlid7D42NuBYVjtaHDquYHIZNmK
	/hiSqWF4RjwJb3dXNO8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neYzI-000EPn-Vw; Wed, 13 Apr 2022 09:08:33 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neYzB-000ELc-VL
 for ath10k@lists.infradead.org; Wed, 13 Apr 2022 09:08:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 53572B82008;
 Wed, 13 Apr 2022 09:08:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CB32C385A4;
 Wed, 13 Apr 2022 09:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649840901;
 bh=2HeOA4zptu/vYtE3afwZcxvf661vYY4u58OgN5Lo/eg=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=oAih9ZTMT2gTsIbvUfw2KyoSQoZgeTABbh1aLw1JJtU81vL9SiPl42cMlGZD2ffwN
 Z8wuaZ0KBL/n4p7ZOuAbPqXxaE3d6AZCxn2pSBAKndIThNLoEtqdUDB2LI97rmLexd
 4gzHbU7PX1LoSexamgIlXgVxlDLKuorLVVx9M8uDost0A2uHv7crgkJTFmD0/sthyS
 TFR87fz7tZZGQQVEcj07giEgmKrcciKlnV+lCR9SB3Jx1KHIFA6y4CPjUrd9orrX4w
 vYeDhr2p+UdKnbyKQEnNfOI0JnlNsO+pFEPiJarR4XzBQxj5kKLdsYNnhPPb2k+wmo
 qd4I0CJnRQ5Vw==
From: Kalle Valo <kvalo@kernel.org>
To: =?utf-8?B?5byg6bmP?= <1805692831@qq.com>
Cc: "ath10k" <ath10k@lists.infradead.org>
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Update Qxwlan E2600AC c2 specific
 BDFs
References: <tencent_81F2482D52E1C78DBA3F04C495E7C5F29507@qq.com>
Date: Wed, 13 Apr 2022 12:08:18 +0300
In-Reply-To: <tencent_81F2482D52E1C78DBA3F04C495E7C5F29507@qq.com>
 (=?utf-8?B?IuW8oOm5jyIncw==?=
 message of "Fri, 25 Mar 2022 18:18:56 +0800")
Message-ID: <87ilrdl5a5.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_020826_218477_226A71C2 
X-CRM114-Status: GOOD (  17.12  )
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

IuW8oOm5jyIgPDE4MDU2OTI4MzFAcXEuY29tPiB3cml0ZXM6Cgo+IEhpLAo+IE1vZGlmaWVkIHRo
ZSByYWRpbyBmcmVxdWVuY3kgaGFyZHdhcmUgcGFydCBvZiBlMjYwMGFjIGMyLAo+IG5lZWQgdG8g
Y29vcGVyYXRlIHdpdGggdGhlIG1vZGlmaWVkIGJvYXJkLmJpbiBmaWxlLCB0aGUgZGV2aWNlCj4g
Y2FuIHdvcmsgbm9ybWFsbHkuCj4KPgo+Cj4gRm9yIHRoZSBxdWVzdGlvbnMgZnJvbSB0aGUgd2lr
aSBwYWdlOgo+Cj4gKiBkZXNjcmlwdGlvbiBmb3Igd2hhdCBoYXJkd2FyZSB0aGlzIGlzOgo+Cj4g
LSBpdCBpcyBhIElQUTQwMTkgYmFzZWQgYm9hcmQgKEFQLURLMDQgYW5kIEFQLURLMDcpCj4gLSBv
bmUgUUNBNDB4eCByYWRpbyBpcyB1c2VkIGFzIDIuNCBHSHogcmFkaW8KPiAtIG9uZSBRQ0E0MHh4
IHJhZGlvIGlzIHVzZWQgYXMgNSBHSHogcmFkaW8KPiAtIG9uZSBRQ0E0MHh4IHJhZGlvIGlzIHVz
ZWQgYXMgNSBHSHogcmFkaW8KPgo+ICogb3JpZ2luIG9mIHRoZSBib2FyZCBmaWxlIChkaWQgeW91
IGNyZWF0ZSBpdCB5b3Vyc2VsZiBvciB3aGVyZSB5b3UgZG93bmxvYWRlZCkKPgo+IC0gVGhlIGJv
YXJkIGZpbGUocykgd2hlcmUgZXh0cmFjdGVkIGZyb20gdGhlIFF4d2xhbiBmaXJtd2FyZS4gCj4g
LSBUaGUgZmlsZXMgaW4gdGhpcyBlbWFpbCBhcmU6Cj4gKiBib2FyZF93aWZpMF8yZy5iaW4KPiAq
IGJvYXJkX3dpZmkwXzVnLmJpbgo+ICogYm9hcmRfd2lmaTFfNWcuYmluCj4KPiAqIGlkcyB0byBi
ZSB1c2VkIHdpdGggdGhlIGJvYXJkIGZpbGUgKEFUSDEwS19CRF9JRV9CT0FSRF9OQU1FIGluIGF0
aDEwaykKPgo+IC0gUUNBNDAxOSBodzEuMAo+Cj4gKyBidXM9YWhiLGJtaS1jaGlwLWlkPTAsYm1p
LWJvYXJkLWlkPTIwLHZhcmlhbnQ9UXh3bGFuLUUyNjAwQUMtQzJiaW4KPiBzaGEyNTZzdW06Cj4g
YTNiMzY4N2MxZDgwZGM5MmI1ZDc4YjFhYTIwNWYxNDYzYmQxMWY0ZWZjMjlmNzMxMWJkYWFiYzI4
YzFkM2ViMgo+ICtidXM9YWhiLGJtaS1jaGlwLWlkPTAsYm1pLWJvYXJkLWlkPTIxLHZhcmlhbnQ9
UXh3bGFuLUUyNjAwQUMtQzJiaW4KPiBzaGEyNTZzdW06Cj4gMTEzODk0ZTBkMWU0ZTdmZWVlZDY5
YzQ4MWYxZWZhYWRlNTExZDA1ZGI3MWUxMjVjZjBiMzJhOTJiM2Q1MDUyMwo+ICtidXM9YWhiLGJt
aS1jaGlwLWlkPTAsYm1pLWJvYXJkLWlkPTI5LHZhcmlhbnQ9UXh3bGFuLUUyNjAwQUMtQzJiaW4K
PiBzaGEyNTZzdW06Cj4gNTMyODcxM2U2NGVjOGNjYjNiMDQwZWE4NDg2Zjc3YmM5NjYyYTM5MGU1
ZmQyMzE0NTgzMzIxNTljMTMxMmYwZQo+Cj4KPgo+ICogYXR0YWNoIHRoZSBhY3R1YWwgYm9hcmQg
ZmlsZSAoYm9hcmQuYmluKQo+Cj4gLSBUaGUgbmFtZSBvZiB0aGUgZmlsZXMgYXJlIGVxdWFsIHRv
IHRoZSBpZCBzdHJpbmcgaW4gdGhlIGJvYXJkLTIuYmluCj4gKG1pbnVzIHRoZSAiLmJpbiIpCgpU
aGUgZmlsZW5hbWVzIGFyZSBub3QgaW4gY29ycmVjdCBmb3JtYXQgc28gbXkgc2NyaXB0IGZhaWxz
LiBQbGVhc2UgcmVhZAp0aGUgZG9jdW1lbnRhdGlvbjoKCmh0dHBzOi8vd2lyZWxlc3Mud2lraS5r
ZXJuZWwub3JnL2VuL3VzZXJzL2RyaXZlcnMvYXRoMTBrL2JvYXJkZmlsZXMKCi0tIApodHRwczov
L3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtd2lyZWxlc3MvbGlzdC8KCmh0dHBz
Oi8vd2lyZWxlc3Mud2lraS5rZXJuZWwub3JnL2VuL2RldmVsb3BlcnMvZG9jdW1lbnRhdGlvbi9z
dWJtaXR0aW5ncGF0Y2hlcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
