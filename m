Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21586C433EF
	for <ath10k@archiver.kernel.org>; Wed, 16 Feb 2022 19:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vcj1hA8w8o4QJVJWMEqZoOMQQGfUjBsFbvgRGYlt6xE=; b=3si5OuNfyb20zf
	mluSW4geNfyK1Agu8pOv8zw2pZSYaATQLmDdCL48wBmyfNoa9Hm+g4cddw+92oz8rLY4bn/4oEx0o
	5AL+l90T0ZPimB9yVDqmt67N4b96mXQJFnA8pHHDC8OulUj0mx9qv7ObqujG13INBMYZU4BLdxJRH
	DYu0YrTuRR9tXBR5WxYVmEUykSsIL+AMutxOY0Jg6XRGDZhde7s7V43hPwaDXLLuBkfnLoqqAPXc8
	jyo/cTupB88TCimFnF08KJOSxP4XN28HMuE4OMjsnl38xofuJHWLDZScLQ4dn20C/pkaMeUwCmqYL
	aN5Gc4bw4TrXZ7eQMJeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKQAC-008Eb8-CJ; Wed, 16 Feb 2022 19:40:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKQA9-008Eae-3Y
 for ath10k@lists.infradead.org; Wed, 16 Feb 2022 19:40:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 752386183C;
 Wed, 16 Feb 2022 19:40:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25AC4C004E1;
 Wed, 16 Feb 2022 19:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645040427;
 bh=AujISKMm3XyoLDMIk3p5HcFU3+0xU5+dA8Sed0Hwfw4=;
 h=Date:From:To:Cc:Subject:From;
 b=DpvHL5oep/tbOSM43uv3wRPdV5n/OJQ1B54+iJliGGdBY8yE/VMr6HdLqbb07ao0c
 bdLaAtj6s4O5Yxc936mJ8AnfBV3ZXbCfsuto2JVwSO+lhuPTeNZrSh3OdChv+vzknM
 nQDxWR9ZljvdQ0SGs8Oru2UUxZmJ0MtpavUPPTr7NIeOnIJCgLJ0KUWeLvy3XXeZyw
 L4h2s+bEO239hNdhpjjniVbl3f+4gbfToAwaIx3Q/GutKHZULCrOYSxVncGnfvul3r
 ECJtOkpiYUSxN+u8WRALtHetDwxfX0CJTOE5ZHxJBR+zemFB2mTNfKnbxTojURbeVg
 9up2hYvs90PNQ==
Date: Wed, 16 Feb 2022 13:48:07 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Kalle Valo <kvalo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-hardening@vger.kernel.org
Subject: [PATCH][next] ath10k: Replace zero-length array with flexible-array
 member
Message-ID: <20220216194807.GA904008@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_114029_213506_EA5BC283 
X-CRM114-Status: GOOD (  11.07  )
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

VGhlcmUgaXMgYSByZWd1bGFyIG5lZWQgaW4gdGhlIGtlcm5lbCB0byBwcm92aWRlIGEgd2F5IHRv
IGRlY2xhcmUKaGF2aW5nIGEgZHluYW1pY2FsbHkgc2l6ZWQgc2V0IG9mIHRyYWlsaW5nIGVsZW1l
bnRzIGluIGEgc3RydWN0dXJlLgpLZXJuZWwgY29kZSBzaG91bGQgYWx3YXlzIHVzZSDigJxmbGV4
aWJsZSBhcnJheSBtZW1iZXJz4oCdWzFdIGZvciB0aGVzZQpjYXNlcy4gVGhlIG9sZGVyIHN0eWxl
IG9mIG9uZS1lbGVtZW50IG9yIHplcm8tbGVuZ3RoIGFycmF5cyBzaG91bGQKbm8gbG9uZ2VyIGJl
IHVzZWRbMl0uCgpbMV0gaHR0cHM6Ly9lbi53aWtpcGVkaWEub3JnL3dpa2kvRmxleGlibGVfYXJy
YXlfbWVtYmVyClsyXSBodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1sL3Y1LjE2L3Byb2Nl
c3MvZGVwcmVjYXRlZC5odG1sI3plcm8tbGVuZ3RoLWFuZC1vbmUtZWxlbWVudC1hcnJheXMKCkxp
bms6IGh0dHBzOi8vZ2l0aHViLmNvbS9LU1BQL2xpbnV4L2lzc3Vlcy83OApTaWduZWQtb2ZmLWJ5
OiBHdXN0YXZvIEEuIFIuIFNpbHZhIDxndXN0YXZvYXJzQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVy
cy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9zd2FwLmggfCAyICstCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC93
aXJlbGVzcy9hdGgvYXRoMTBrL3N3YXAuaCBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgx
MGsvc3dhcC5oCmluZGV4IDI1ZTBhZDM2ZGRiMS4uYjQ3MzNiNWRlZDM0IDEwMDY0NAotLS0gYS9k
cml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL3N3YXAuaAorKysgYi9kcml2ZXJzL25ldC93
aXJlbGVzcy9hdGgvYXRoMTBrL3N3YXAuaApAQCAtMTcsNyArMTcsNyBAQCBzdHJ1Y3QgYXRoMTBr
X2Z3X2ZpbGU7CiBzdHJ1Y3QgYXRoMTBrX3N3YXBfY29kZV9zZWdfdGx2IHsKIAlfX2xlMzIgYWRk
cmVzczsKIAlfX2xlMzIgbGVuZ3RoOwotCXU4IGRhdGFbMF07CisJdTggZGF0YVtdOwogfSBfX3Bh
Y2tlZDsKIAogc3RydWN0IGF0aDEwa19zd2FwX2NvZGVfc2VnX3RhaWwgewotLSAKMi4yNy4wCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1h
aWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
