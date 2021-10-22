Return-Path: <SRS0=d3gV=PK=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C091AC433F5
	for <ath10k@archiver.kernel.org>; Fri, 22 Oct 2021 14:11:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8034161213
	for <ath10k@archiver.kernel.org>; Fri, 22 Oct 2021 14:11:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8034161213
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bda.space
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:To:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ge+q8tLCV47rN471vPSn7eQgGap4/yX7dEeTGQCz4wM=; b=TT2F5KmEt0pIWXgztzxOC5NDjF
	jDBUTz7vnQ9wGRMZHgCeKvzhbsPRBhFRQRprPvNJX4z11bnuLbQnoqEiBZvIhS1/NTzbJOAmMbxw8
	16p6beJjpULiV6zSZutLrRDQTNKm5x2KvSTGw1RFGUwjr+lQMxXl/WGSrfMfdabg9jB8Z1rgM2NqX
	xAmEZW4a83yN4qfVrdJXVGk0S0DwLNBPFyY540oXKxLTzmX1lfGDG0Y4XoVEHi/1pEMec51lj4CMs
	BuX8WQtyJ8OMvaZaBaXYoj0EC67vFD094NSGJPPRAkUzIIeQl8Fi0nA4lEhG0IDBhT1R9+UAERn6+
	Sluhs57Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdvFv-00BDDR-PG; Fri, 22 Oct 2021 14:10:47 +0000
Received: from bda.space ([207.192.72.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdvF9-00BCpM-8O
 for ath10k@lists.infradead.org; Fri, 22 Oct 2021 14:10:00 +0000
Message-ID: <d2919db8-af63-5089-03a1-801a22a91f4a@bda.space>
Date: Fri, 22 Oct 2021 10:09:22 -0400
MIME-Version: 1.0
Content-Language: en-US
To: ath10k@lists.infradead.org
References: <c581bff7f4114be98fb676ca60937587@stpinfexc1vp.corporate.storopack.net>
From: Bryce Allen <bryce@bda.space>
Subject: Re: PHY settings for QCA9377-3 based module
In-Reply-To: <c581bff7f4114be98fb676ca60937587@stpinfexc1vp.corporate.storopack.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_070959_425158_594BDD4E 
X-CRM114-Status: UNSURE (   6.25  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

VXNlIHRoZSAiaXciIGNvbW1hbmQgYXMgcm9vdCwgc29tZXRoaW5nIGxpa2UgdGhpcywgYXNzdW1p
bmcgJ3dsYW4wJyBpcyAKdGhlIGRldmljZSBuYW1lLiBUbyBmaWd1cmUgb3V0IHlvdXIgd2lyZWxl
c3MgZGV2aWNlIG5hbWUsIHlvdSBjYW4gZG8gJ2lwIApsaW5rJyB0byBzZWUgYSBsaXN0IG9mIGlu
dGVyZmFjZXMgYW5kIHRoZSB3aXJlbGVzcyBvbmUgc2hvdWxkIGJlIHByZXR0eSAKb2J2aW91cy4K
CiMgZ2V0IGN1cnJlbnQgdHhwb3dlcgokIGl3IGRldiB3bGFuMCBpbmZvIHwgZ3JlcCB0eHBvd2Vy
CiDCoMKgwqDCoCB0eHBvd2VyIDIyLjAwIGRCbQoKIyBzZXQKJCBpdyBkZXYgd2xhbjAgc2V0IHR4
cG93ZXIgZml4ZWQgMjAwMAokIGl3IGRldiB3bGFuMCBpbmZvIHwgZ3JlcCB0eHBvd2VyCiDCoMKg
wqDCoCB0eHBvd2VywqAgMjAuMDAgZEJtCgojIHNldCBiYWNrIHRvIGF1dG8KJCBpdyBkZXYgd2xh
bjAgc2V0IHR4cG93ZXIgYXV0bwoKTm90ZSB0aGF0IGluY3JlYXNpbmcgdHhwb3dlciBtYXkgYmUg
bGltaXRlZCBieSBsb2NhbCByZWd1bGF0aW9ucywgYGl3IApyZWcgZ2V0YCB3aWxsIHNob3cgY3Vy
cmVudCByZWdpb24uIFRoZXJlIGFyZSByZWdpb24gZnJlZSBwYXRjaGVzIApmbG9hdGluZyBhcm91
bmQuCgpOb3RlIHRoZSBjb25mdXNpbmcgZGlmZmVyZW5jZSBpbiB1bml0cyBmb3IgZGlzcGxheSAo
ZEJtKSwgYW5kIHNldHRpbmcgCihtQm0pLCBmYWN0b3Igb2YgMTAwIGRpZmZlcmVuY2UgZm9yIHNv
bWUgcmVhc29uPwoKU2VlIGFsc28gJ21hbiBpcCcsICdtYW4gaXcnLCBhbmQgJ2l3IGhlbHAgfCBs
ZXNzJwoKT24gMTAvMjIvMjEgMDc6NDQsIFdhZGVwb2hsLCBXb2xmcmFtIHdyb3RlOgo+IEhpLAo+
Cj4gSSdtIGEgY29tcGxldGUgbmV3YmllIHRvIGxpbnV4IHdpcmVsZXNzIGFuZCB3YW50IHRvIGtu
b3csIGhvdyBJIGNhbiBzZXQgdHJhbnNtaXQgcG93ZXIgYW5kIGFudGVubmEgZ2FpbiBmb3IgdGhl
IDhkZXZpY2UgUmVkQmVhbiAoUUNBOTM3Ny0zIGJhc2VkKT8KPgo+CgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgx
MGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2F0aDEwawo=
