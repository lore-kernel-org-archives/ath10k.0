Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97288C636D3
	for <ath10k@archiver.kernel.org>; Wed,  1 Feb 2023 03:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+7Az54pyUAcTdxIWyo+bAHMWu0MwYydwNiCB7nm7VBo=; b=DwjLC9OxteA0Cy
	AbSXoJFv4cVPSuyf3tVRAzfKAvlZRahXERMeLE22qJVmy3F5hJxzKeDbHQyRNDIW/FFZLH/bmkpcK
	0YHdDTpUpxjhxIPj9tcwHPtVZ+68UA9LGSbgWQJDx+VxYSheHFLfxqbw3zB4bHBVQo5dVzTw8EiNy
	x7QlafH60XvnQ4WlXBpwJZw8G4pD18574L9IiZD098Pk5S3Qzvwb89c24JZHYFy2Zg7dzd0V926A9
	TdABz1WrutnH7/o1nXlAB+dZcT7rlO2ovlpUbQEliYJYKveJuyDO/pUaGGFjLRabW5Nznx4qP3l6L
	oPCaVi1MMc764q1v9xUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN3P0-00A4zD-Vh; Wed, 01 Feb 2023 03:03:15 +0000
Received: from smtp161.vfemail.net ([146.59.185.161])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN3Oy-00A4y4-38
	for ath10k@lists.infradead.org; Wed, 01 Feb 2023 03:03:13 +0000
Received: (qmail 31456 invoked from network); 1 Feb 2023 03:03:04 +0000
Received: from localhost (HELO nl101-3.vfemail.net) ()
  by smtpout.vfemail.net with ESMTPS (ECDHE-RSA-AES256-GCM-SHA384 encrypted); 1 Feb 2023 03:03:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=openmail.cc; h=message-id
	:date:mime-version:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding; s=2018; bh=a0M/Z5vF5O+w
	u1iGce08r1mIpiAiaO7guywRu/f9N7I=; b=GasDnwLarSzqBxVVo/vpZrX9sWbF
	twAlRa48WAaAtDnQM/txXgKYfyvV2k2/+z6esolla8gFIo/t145wuFwYwLC3mfsw
	3TyfGR4hvcqbUiRQFTWt7XGk6gSRYe2yQw15DjFhYgpsIxQnr0X0rFVRCjMtm8BU
	15E6i32zXLcnqbI=
Received: (qmail 27136 invoked from network); 1 Feb 2023 03:03:04 -0000
Received: by simscan 1.4.0 ppid: 27093, pid: 27134, t: 0.3140s
         scanners:none
Received: from unknown (HELO bmwxMDEudmZlbWFpbC5uZXQ=) (ZXF1dUBvcGVubWFpbC5jYw==@MTkyLjE2OC4xLjE5Mg==)
  by nl101.vfemail.net with ESMTPA; 1 Feb 2023 03:03:03 -0000
Message-ID: <ab8ff515-19ec-fe3f-0237-c30275e9744d@openmail.cc>
Date: Wed, 1 Feb 2023 11:02:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/3] wifi: ath9k: stop loading incompatible DT cal data
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: lpieralisi@kernel.org, toke@toke.dk, kvalo@kernel.org,
 linux-pci@vger.kernel.org, robh@kernel.org, linux-wireless@vger.kernel.org,
 ath10k@lists.infradead.org, Edward Chow <equu@openmail.cc>
References: <20230117194614.GA135447@bhelgaas>
Content-Language: en-US
From: Mad Horse <equu@openmail.cc>
In-Reply-To: <20230117194614.GA135447@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_190312_512537_A0D65001 
X-CRM114-Status: GOOD (  18.45  )
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

5ZyoIDIwMjMvMS8xOCAwMzo0NiwgQmpvcm4gSGVsZ2FhcyDlhpnpgZM6Cj4gT24gVHVlLCBKYW4g
MTcsIDIwMjMgYXQgMDU6Mjc6NDZQTSArMDgwMCwgRWR3YXJkIENob3cgd3JvdGU6Cj4+IExvYWRp
bmcgY2FsaWJyYXRpb24gZGF0YSBmcm9tIGFuIE9GIGRldmljZSB0cmVlIG5vZGUgbm90IGRlY2xh
cmVkCj4+IGNvbXBhdGlibGUgd2l0aCB0aGUgZGV2aWNlIChlLmcuIGEgUENJIGRldmljZSB3aXRo
IGNhbGlicmF0aW9uIGRhdGEKPj4gZnJvbSBjb3JyZXNwb25kaW5nIERUIG5vZGUgZ2V0cyByZXBs
YWNlZCwgc28gdGhlIG5ld2x5IGluc3RhbGxlZAo+PiBkZXZpY2UgYmVjb21lIGluY29tcGF0aWJs
ZSB3aXRoIHRoZSBub2RlKSBvciBkcml2ZXIgbWF5IGxlYWQgdG8gZmF0YWwKPj4gcmVzdWx0LCBl
LmcuIGtlcm5lbCBwYW5pYy4KPiBQbGVhc2UgaW5jbHVkZSBhIGxpbmsgdG8gYSBidWcgcmVwb3J0
IGFuZCBpbmNsdWRlIGEgZmV3IGxpbmVzIG9mIHRoZQo+IG9vcHMgb3IgcGFuaWMgZGlyZWN0bHkg
aW4gdGhlIGNvbW1pdCBsb2cgc28gd2hlbiB1c2VycyBzZWUgdGhpcwo+IHByb2JsZW0sIHRoZXkg
Y2FuIHNlYXJjaCBmb3IgdGhlIHRleHQgYW5kIHBvc3NpYmx5IGZpbmQgdGhpcyBmaXguCj4KPj4g
VGhlIGRyaXZlciBzaG91bGQgY2hlY2sgd2hldGhlciB0aGUgRFQgbm9kZSBjb3JyZXNwb25kaW5n
IHRvIHRoZQo+PiBkZXZpY2UgY29tcGF0aWJsZSB3aXRoIGl0LCBhbmQgbG9hZCBjYWxpYnJhdGlv
biBkYXRhIG9ubHkgZnJvbQo+PiBjb21wYXRpYmxlIG5vZGUuCj4gSWYgeW91IHJlYWQgdGhpcyBj
b21taXQgbG9nIGNhcmVmdWxseSwgaXQgZG9lc24ndCBhY3R1YWxseSBzYXkgd2hhdAo+IHRoaXMg
cGF0Y2ggKmRvZXMqLiAgSXQgaGFzIHNvbWUgYmFja2dyb3VuZCBhbmQgdGhpcyBhc3NlcnRpb24g
YWJvdXQKPiB3aGF0IGRyaXZlcnMgKnNob3VsZCogZG8sIGJ1dCBpdCBkb2Vzbid0IHNheSB3aGF0
IHRoaXMgcGF0Y2ggZG9lcy4KPgo+IFN1Z2dlc3Qgc3RydWN0dXJlIGxpa2UgdGhpcyAoZmxlc2gg
b3V0IHdpdGggdGhlIHJlbGV2YW50IERUIHByb3BlcnR5Cj4gbmFtZXMsIGV0Yyk6Cj4KPiAgIEZv
ciBQQ0kgYXRoOWsgZGV2aWNlcywgbG9hZCBjYWxpYnJhdGlvbiBkYXRhIG9ubHkgaWYgdGhlcmUg
aXMgYSBEVAo+ICAgbm9kZSBjb3JyZXNwb25kaW5nIHRvIHRoZSBkZXZpY2Ugd2l0aCBYWFggLi4u
Cj4KPiBNb3JlIGRldGFpbHM6IGh0dHBzOi8vY2hyaXMuYmVhbXMuaW8vcG9zdHMvZ2l0LWNvbW1p
dC8KPgpUaGFua3MgZm9yIHBvaW50aW5nIGl0IG91dC4gVGhlIGNvbW1pdCBsb2cgb2YgdGhlIGxh
c3QgdHdvIHBhdGNoIGhhcyBiZWVuIHJld29yZGVkIHdpdGggcmVxdWlyZWQgY29udGVudCwgYW5k
IHNlbnQgdG8gdGhlIGN1cnJlbnQgdGhyZWFkIGVhcmxpZXIuCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2F0aDEwawo=
