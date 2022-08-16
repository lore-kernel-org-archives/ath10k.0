Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B05C19F2C
	for <ath10k@archiver.kernel.org>; Tue, 16 Aug 2022 05:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Date:
	MIME-Version:Subject:Message-ID:Cc:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ZEuTh5CJ9Ts2p/6jSvC6Hc33WT+10kOSB6j+CmJnoNc=; b=LK98r0/kxBNupo7Nc2ZIXoxLGF
	eTxamr6hA1IWRkoeczRaRnl1HOZbos7xWAcvx3twGoILyetYakHCyYJ8vLoGaUwLwc6zdOUpRhxT4
	S21WAWUdESwqnptVxE5nHw9WK12YAy5FWWOsIzSrparfA+jUAOS8L8D8h4w7YBw4LG8WYdPobUPQ4
	M/ommxwsB/1PsZ8bT/p7tg9HW5rpeXr/O21lWRo+ucwihnQrhrJR5RxlgBM4t5HNNX++aWULXq1uy
	A53Fm91c1U4WsScmOGCz6nLKUPT79bv5fsEs9NhzU2JzXFyIwIVwJQXCZLnaO4+lUDHlCgmYwYndT
	0cV7Sm/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNpL2-00CI7m-ME; Tue, 16 Aug 2022 05:42:04 +0000
Received: from send005.gov-dooray.com ([211.56.2.33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNpKy-00CHNq-3j
	for ath10k@lists.infradead.org; Tue, 16 Aug 2022 05:42:03 +0000
DKIM-Signature: a=rsa-sha256;
 b=RJ4qBWrzW900tHzVcz0Q/fX0G5Rg4EgjgCsA8Vl8IYE+lgAhGj8CPms1SDFFa2GJWcTShu3NF0
  Stie8dz79y8whICmZImYv5ii7XPiT9JSg+qnS/9mPA6QTyEwQcQeXTbVfHhCyI9yRZYa3ZjUb41Y
  k45eDK0jBABFGxlqSnWKiOMIO6G7K0Ktr+c6FBnarDyY+2zbFjBA2scRTpTC1yjkjr8xQV+1OUQa
  zv7rOcuCW5KpPMH3Irmchg0CEDnlu4OrBU05VLUFvOVxARmkhpcJ6ZNqoWxb4iElp+h3xg77lQ6Y
  vPiSmjOQaYhPsgA2AsM7FQ9sCbUpshqAv9WLXu+g==;
 c=relaxed/relaxed; s=selector; d=dooray.com; v=1;
 bh=gBovxtY+hk2MRP2mHceSQ6HOhIrxf62QBDPGYweejmw=;
 h=From:To:Subject:Message-ID;
Dooray-Meta-Signature: Z6vC2Djn9ct3Prl16ZlBE31fQhQ3YfYMc5HDHDgv1KeFcE2+UQuG8
  hQoQImQx4/tpNdmjwyNDuTnnrvk3LuwAp67hZuqvy66co7oGDaA0i0WgJHQzW4jWuX1mgcPtBed1
  L7CLDSISCwSw27Yz/PYpwL5CG6s9lKieDdkBT8LyNw599okB8xorZgZS6qV064Bg0zXou2Nbxi1g
  qmHWhyfAKwU1fKgNdHmbsfQwNf+DoSg+kjelb3zJouvP7C4v1j5TodcKm/ZKbOBDbjNdMNu2rZzV
  0nMwXg/dq3xkk8MU/9zneykm0OL3Tmkq/EvMV361o0v1cOh9SPDnizIzjTYmtokpSKKR80KupXMF
  ODf9II=
Received: from [172.226.94.42] (HELO 172.226.94.42) ([172.226.94.42]) by
 send005.gov-dooray.com with SMTP id 1fd8721762fb2e18; Tue, 16 Aug 2022
 14:41:44 +0900
From: Wonsup Yoon <pusnow@kaist.ac.kr>
To: Brett Mastbergen <brett.mastbergen@protectli.com>
Cc: ath10k@lists.infradead.org
Message-ID: <pdwmg9b8y9s0.pdwmg9b8zyhc.g6@dooray.com>
Subject: RE: Re: Questions about QCA6174 firmwares
MIME-Version: 1.0
X-Dsn-Request: true
X-Dooray-Agent: mail-api
X-Dooray-Mail-Id: 3341385912906680832
Importance: Normal
X-Priority: Normal
X-MSMail-Priority: Normal
X-Dooray-Attached: c3+LUOpPU/IB7Wl+oemm0lw5HiI/bJHHYClX72L8E3o=
Date: Tue, 16 Aug 2022 14:41:43 +0900 (KST)
References: <pcoa2db959zn.pcoa2db781x3.g6@dooray.com>
	<20220815195952.GA7798@lycia.zebraskunk.int>
In-Reply-To: <20220815195952.GA7798@lycia.zebraskunk.int>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_224200_447191_062646CB 
X-CRM114-Status: GOOD (  11.49  )
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

SGksCgpJJ20gY3VycmVudGx5IHVzaW5nIHRoZSBsYXRlc3QgImMzIiB2ZXJzaW9uLCBhbmQgaXQg
d29ya3MgZmluZS4KRmlybXdhcmUgdmVyc2lvbjogV0xBTi5STS40LjQuMS5jMy0wMDIzMCAuCgpC
dXQgSSdtIHN0aWxsIGN1cmlvdXMgd2hhdCB0aGUgImMiIHZlcnNpb24gbWVhbnMuCgpCZXN0IHJl
Z2FyZHMsCldvbnN1cCBZb29uCgotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQpGcm9tOiAgIkJy
ZXR0IE1hc3RiZXJnZW4iIDxicmV0dC5tYXN0YmVyZ2VuQHByb3RlY3RsaS5jb20+ClRvOiAgICAg
IldvbnN1cCBZb29uIiA8cHVzbm93QGthaXN0LmFjLmtyPjsgCkNjOiAgICAgIDxhdGgxMGtAbGlz
dHMuaW5mcmFkZWFkLm9yZz47IApTZW50OiAgMjAyMi0wOC0xNiAo7ZmUKSAwNDo1OTo1NyAoVVRD
KzA5OjAwKQpTdWJqZWN0OiBSZTogUXVlc3Rpb25zIGFib3V0IFFDQTYxNzQgZmlybXdhcmVzCgpP
biBXZWQsIEF1ZyAxMCwgMjAyMiBhdCAxMDo1NjozOEFNICswOTAwLCBXb25zdXAgWW9vbiB3cm90
ZToKPiBIaSwKPiAKPiBJZiB5b3UgZG9uJ3QgbWluZCwgSSdkIGxpa2UgYXNrIGEgZmV3IHF1ZXN0
aW9ucyByZWdhcmRpbmcgUUNBNjE3NCBmaXJtd2FyZXMuCj4gCj4gMS4gSSd2ZSBub3RpY2UgdGhh
dCBRQ0E2MTc0IGh3My4wIDQuNC4xIGZpcm13YXJlcyBoYXZlIDQgdmVyc2lvbnMgKG5vbmUsIGMx
LCBjMiwgYzMpLiBBcmUgdGhlcmUgYW55IGRpZmZlcmVuY2VzPyBXaGljaCBvbmUgaXMgbmV3ZXN0
IG9yIGNvcnJlY3Q/Cj4gCj4gMi4gTXkgUUNBNjE3NCBzZWVtcyB0byBoYXZlIGEgY29tcGF0aWJp
bGl0eSBpc3N1ZSB3aXRoIGEgcmVjZW50IGZpcm13YXJlLiBJJ3ZlIHRlc3RlZCB0aGVzZXMgZmly
bXdhcmUgdmVyc2lvbnMsIGJ1dCBvbmx5IHRoZSBvbGRlc3Qgb25lIHdvcmtzLgo+IAoKSSBoYXZl
IG9ic2VydmVkIHRoZSBzYW1lIGZpcm13YXJlIGNyYXNoZXMgd2l0aCB0aG9zZSB2ZXJzaW9ucyB3
aXRoIG15IFFDQTYxNzQgbW9kdWxlIChKV1c2MDUxKS4gIFdvdWxkIGxvdmUgdG8ga25vdyBpZiBS
TS40LjQuMS5jMi0wMDA1Ny1RQ0FSTVNXUC0xIGlzIHRoZSBjb3JyZWN0IHZlcnNpb24gdG8gdXNl
LCBvciBpZiB0aGVyZSBpcyBhbm90aGVyIG5ld2VyIHZlcnNpb24gdGhhdCBJIHNob3VsZCBiZSB1
c2luZy4KClRoYW5rcywKYnJldHQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
