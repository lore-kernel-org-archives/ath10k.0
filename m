Return-Path: <SRS0=Ps4A=K4=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95197C4708F
	for <ath10k@archiver.kernel.org>; Wed,  2 Jun 2021 19:03:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 501A8613E6
	for <ath10k@archiver.kernel.org>; Wed,  2 Jun 2021 19:03:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 501A8613E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IgZbU3kyKfqOpqOlakWZbEgtPSQyrsnBVFV3Pf9Po04=; b=VDcUBmxfI35JAI
	hTVRurnxyzmM/afrpgqEqtAvIFHCo+7Qc9LEFVthUNvuB2ONG+tNy6w9xEyhP4d4Ja6koQFdwLBif
	+yQDWe1bXVuWvWPzUM0hWpO3RuSkc67C1wxqbMOCSve0n7pvPX1nTMEMhDM/yckM4OZ6hv9ONkqz2
	3h3X2FM6PVoTbevUt/TQI//siMxwc8rhxlUgljYD3ZzSRqaWyytK9hyzX5AxaJFRknhpjErdQOfY3
	QKxpxhejXpu7PSJS/qkBRu627Zdtjm9X12IUIbhmXsxOAqoMHK2DeA/b8nCHEXMy1zhUqcAwBfSuF
	jXG0pbDisp9KJDFMmu9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loW8y-005sHq-Os; Wed, 02 Jun 2021 19:03:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loW8v-005sGQ-Iy
 for ath10k@lists.infradead.org; Wed, 02 Jun 2021 19:03:07 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 06146613DE;
 Wed,  2 Jun 2021 19:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622660585;
 bh=UmpCat1vUqyqVee399R6xx/T2Sz4LjLr8R8Go7S3p1k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IslsaRMEZqqFu3ZzSgqNdLrDRXTjEsWWBTdbepFtuZAlmqCW7jni6jsPwMosOCRva
 hVL4+t36l+lWWC9rTXUuGHZZNChuQuVPwsgAcgarySIPQWhv3ySLboMSW6JMAf2YId
 ToOOtiPdJHHzvzYjHqjjfZEO2eYA4AX3Aljp7kAmGXZVA7L2lL6g56NGyyXCmMhVl1
 sQBuEtFrWqF1K+sFvakhAFEVFj0EMbQqcXRB118BwCBgCvQ2560yN11nj7Z+69id6J
 JER6VIjNBqPeimx5Ez/tElO4wGeBBVyTueFWmNTpZMfSZeX2/qtGWJoWzcr8IJn95m
 meDf8kBhp6UbA==
Received: by pali.im (Postfix)
 id 81EBA1534; Wed,  2 Jun 2021 21:03:02 +0200 (CEST)
Date: Wed, 2 Jun 2021 21:03:02 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Kalle Valo <kvalo@codeaurora.org>,
 Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
 Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 vtolkm@gmail.com, Rob Herring <robh@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-pci@vger.kernel.org, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] PCI: Disallow retraining link for Atheros chips on
 non-Gen1 PCIe bridges
Message-ID: <20210602190302.d3ibdtwti4yq57vi@pali>
References: <20210602120816.axi4dtnyg5gl2h2z@pali>
 <20210602155559.GA2028037@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210602155559.GA2028037@bjorn-Precision-5520>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210602_120305_685537_3BF8FB76 
X-CRM114-Status: GOOD (  32.46  )
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

T24gV2VkbmVzZGF5IDAyIEp1bmUgMjAyMSAxMDo1NTo1OSBCam9ybiBIZWxnYWFzIHdyb3RlOgo+
IE9uIFdlZCwgSnVuIDAyLCAyMDIxIGF0IDAyOjA4OjE2UE0gKzAyMDAsIFBhbGkgUm9ow6FyIHdy
b3RlOgo+ID4gT24gVHVlc2RheSAwMSBKdW5lIDIwMjEgMTk6MDA6MzYgQmpvcm4gSGVsZ2FhcyB3
cm90ZToKPiAKPiA+ID4gSSB3b25kZXIgaWYgdGhpcyBjb3VsZCBiZSByZXN0cnVjdHVyZWQgYXMg
YSBnZW5lcmljIHF1aXJrIGluIHF1aXJrcy5jCj4gPiA+IHRoYXQgc2ltcGx5IHNldCB0aGUgYnJp
ZGdlJ3MgVExTIHRvIDIuNSBHVC9zIGR1cmluZyBlbnVtZXJhdGlvbi4gIE9yCj4gPiA+IHdvdWxk
IHRoZSByZXRyYWluIGZhaWwgZXZlbiBpbiB0aGF0IGNhc2U/Cj4gPiAKPiA+IElmIEkgdW5kZXJz
dGFuZCBpdCBjb3JyZWN0bHkgdGhlbiBQQ0llIGxpbmsgaXMgYWxyZWFkeSB1cCB3aGVuIGtlcm5l
bAo+ID4gc3RhcnRzIGVudW1lcmF0aW9uLiBTbyBzZXR0aW5nIEJyaWRnZSBUTFMgdG8gMi41IEdU
L3MgZG9lcyBub3QgY2hhbmdlCj4gPiBhbnl0aGluZyBoZXJlLgo+ID4gCj4gPiBNb3Jlb3ZlciBp
dCB3b3VsZCBoYXZlIHNpZGUgZWZmZWN0IHRoYXQgY2FyZHMgd2hpY2ggYXJlIGFscmVhZHkgc2V0
IHRvCj4gPiA1KyBHVC9zIHdvdWxkIGJlIGRvd25ncmFkZWQgdG8gMi41IEdUL3MgZHVyaW5nIGVu
dW1lcmF0aW9uIGFuZCBmb3IKPiA+IGluY3JlYXNpbmcgc3BlZWQgd291bGQgYmUgbmVlZGVkIGFu
b3RoZXIgcm91bmQgb2YgImVudW1lcmF0aW9uIiB0byBzZXQgYQo+ID4gbmV3IFRMUyBhbmQgcmV0
cmFpbiBsaW5rIGFnYWluLiBBcyBUTFMgYWZmZWN0cyBsaW5rIG9ubHkgYWZ0ZXIgbGluayBnb2Vz
Cj4gPiBpbnRvIFJlY292ZXJ5IHN0YXRlLgo+ID4gCj4gPiBTbyB0aGlzIHdvdWxkIGp1c3QgY29t
cGxpY2F0ZSBjYXJkIGVudW1lcmF0aW9uIGFuZCBzZXR0aW5ncy4KPiAKPiBUaGUgY3VycmVudCBx
dWlyayBjb21wbGljYXRlcyB0aGUgQVNQTSBjb2RlLiAgSSdtIGhvcGluZyB0aGF0IGlmIHdlCj4g
c2V0IHRoZSBicmlkZ2UncyBUYXJnZXQgTGluayBTcGVlZCBkdXJpbmcgZW51bWVyYXRpb24sIHRo
ZSBsaW5rCj4gcmV0cmFpbiB3aWxsICJqdXN0IHdvcmsiIHdpdGhvdXQgY29tcGxpY2F0aW5nIHRo
ZSBBU1BNIGNvZGUuCj4gCj4gQW4gZW51bWVyYXRpb24gcXVpcmsgd291bGRuJ3QgaGF2ZSB0byBz
ZXQgdGhlIGJyaWRnZSdzIFRMUyB0byAyLjUKPiBHVC9zOyB0aGUgcXVpcmsgd291bGQgYmUgYXR0
YWNoZWQgdG8gc3BlY2lmaWMgZW5kcG9pbnQgZGV2aWNlcyBhbmQKPiBjb3VsZCBzZXQgdGhlIGJy
aWRnZSdzIFRMUyB0byB3aGF0ZXZlciB0aGUgZW5kcG9pbnQgc3VwcG9ydHMuCgpOb3cgSSBzZWUg
d2hhdCB5b3UgbWVhbi4gWWVzLCBJIGFncmVlIHRoaXMgaXMgYSBnb29kIGlkZWEgYW5kIGNhbgpz
aW1wbGlmeSBjb2RlLiBRdWlyayBpcyBub3QgcmVsYXRlZCB0byBBU1BNIGNvZGUgYW5kIGJhc2lj
YWxseSBoYXMKbm90aGluZyB3aXRoIGl0LCBqdXN0IEkgcHV0IGl0IGludG8gYXNwbS5jIGJlY2F1
c2UgdGhpcyBpcyB0aGUgb25seQpwbGFjZSB3aGVyZSBsaW5rIHJldHJhaW5pbmcgd2FzIGFjdGl2
YXRlZC4KCkJ1dCB3aXRoIHRoaXMgcHJvcG9zYWwgdGhlcmUgaXMgb25lIGlzc3VlLiBTb21lIGtl
cm5lbCBkcml2ZXJzIGFscmVhZHkKb3ZlcndyaXRlIFBDSV9FWFBfTE5LQ1RMMl9UTFMgdmFsdWUu
IFNvIGlmIFBDSSBlbnVtZXJhdGlvbiBjb2RlIHNldCBzb21lCnZhbHVlIGludG8gUENJX0VYUF9M
TktDVEwyX1RMUyBiaXRzIHRoZW4gZHJpdmVycyBjYW4gY2hhbmdlIGl0IGFuZCBvbmNlCkFTUE0g
d2lsbCB0cnkgdG8gcmV0cmFpbiBsaW5rIHRoaXMgbWF5IGNhdXNlIHRoaXMgaXNzdWUuCgo+ID4g
TW9yZW92ZXIgaGVyZSB3ZSBhcmUgZGVhbGluZyB3aXRoIHNwZWNpZmljIE9UUC9FRVBST00gYnVn
IGluIEF0aGVyb3MKPiA+IGNoaXBzLCB3aGljaCB3YXMgY29uZmlybWVkIHRoYXQgZXhpc3RzLiBB
cyBJIHdyb3RlIGluIHByZXZpb3VzIGVtYWlsLCBJCj4gPiB3YXMgdG9sZCB0aGF0IHNlbWktb2Zm
aWNpYWwgd29ya2Fyb3VuZCBpcyBkbyBXYXJtIFJlc2V0IG9yIENvbGQgUmVzZXQKPiA+IHdpdGgg
dHVybmluZyBwb3dlciBvZmYgZnJvbSBjYXJkLiBXaGljaCBvbiBtb3N0IHBsYXRmb3JtcyAvIGJv
YXJkcyBpcwo+ID4gbm90IHBvc3NpYmxlLgo+IAo+IElmIHRoZXJlJ3MgYSBzcGVjaWZpYyBidWcg
d2l0aCBhIHJlYWwgcm9vdC1jYXVzZSBhbmFseXNpcywgcGxlYXNlIGNpdGUKPiBpdC4gIFRoZSB0
aHJlYWRzIG1lbnRpb25lZCBpbiB0aGUgY3VycmVudCBjb21taXQgbG9nIGFyZSBiYXNpY2FsbHkK
PiBpbmZvcm1lZCBzcGVjdWxhdGlvbi4KCkkgaGFkIChwcml2YXRlKSBkaXNjdXNzaW9uIHdpdGgg
QWRyaWFuIENoYWRkIGFib3V0IEFCQ0QgZGV2aWNlIGlkIGlzc3VlLgpJIGhvcGUgdGhhdCBub2Jv
ZHkgaXMgYWdhaW5zdCBpZiBJIHB1dCB0aGVyZSBzdW1tYXJ5IGFuZCBpbXBvcnRhbnQgcGFydHMK
YWJvdXQgc2Vjb25kYXJ5IGJ1cyByZXNldCAoPWhvdCByZXNldCk6CgoKVGhlIHJlYXNvbiBmb3Ig
YWJjZCBpcyBiZWNhdXNlOgoqIHRoZSBNQUMgaGFzIGhhcmR3YXJlIHRoYXQgdXBvbiBjb2xkIHJl
c2V0LCB3aWxsIHJlYWQgRUVQUk9NL09UUAogIHZhbHVlcyBmb3IgdGhpbmdzIGxpa2UgUENJZSBh
bmQgb3RoZXIgcmVnaXN0ZXIgZGVmYXVsdHMsIGFuZCBzcXVpcnQKICB0aGVtIGludG8gdGhlIE1B
Qy9QSFkvZXRjIHJlZ2lzdGVycwoqIHRoZSBkZWZhdWx0IHZhbHVlcyBmb3IgdGhlIFBDSWUgYnVz
IHByZS1BUjkzMDAgd2VyZSAweDE2OGM6MHhmZjxpZD4sCiAgd2hlcmUgPGlkPiBpcyB0aGUgbm9y
bWFsIGNoaXAgSUQKKiB0aGUgZGVmYXVsdCB2YWx1ZXMgZm9yIHRoZSBQQ0llIGJ1cyBQT1NULUFS
OTMwMCB3ZXJlIDB4MTY4YzoweGFiY2QsCiAgd2hlcmUgdGhleSdyZSBhbHdheXMgdGhhdCByZWdh
cmRsZXNzIG9mIHRoZSBjaGlwIGZhbWlseQoqIHNvIHllYWgsIGFsbCB5b3Uga25vdyB3aXRoIDB4
MTY4YzoweGFiY2QgaXMgdGhlcmUncyBhbiBhdGhlcm9zCiAgZGV2aWNlIHRoZXJlLCBidXQgbm90
IFdISUNIIGl0IGlzLgoKKiB0aGUgYnVnIGlzIHRoYXQgdGhlIHJlc2V0IGxpbmUgaXNuJ3QgaGVs
ZCBsb3cgZm9yIGxvbmcgZW5vdWdoLCBvciBpdCdzCiAgYm91bmNlZCB0d2ljZSBpbiBxdWljayBz
dWNjZXNzaW9uLCBiZWZvcmUgdGhlIE1BQyBoYXMgdGltZSB0byBwcm9ncmFtCiAgaW4gdGhlIGRl
ZmF1bHRzIGZyb20gRUVQUk9NL09UUCBhbmQgaXQgZG9lc24ndCBkbyBpdCBhIHNlY29uZCB0aW1l
LgoKKiB0aGUgTUFDIGhhcyBoYXJkd2FyZSB0aGF0IHVwb24gY29sZCByZXNldCwgd2lsbCByZWFk
IEVFUFJPTS9PVFAKICB2YWx1ZXMgZm9yIHRoaW5ncyBsaWtlIFBDSWUgYW5kIG90aGVyIHJlZ2lz
dGVyIGRlZmF1bHRzLCBhbmQgc3F1aXJ0CiAgdGhlbSBpbnRvIHRoZSBNQUMvUEhZL2V0YyByZWdp
c3RlcnMKCiogbmVlZCB0byB1c2UgdGhlIGV4dGVybmFsIHJlc2V0IGxpbmUgT1IgdHJ5IHVzaW5n
IEQzLCBub3QgRDNob3QKICAoSSBhc3N1bWUgdGhhdCAiZXh0ZXJuYWwgcmVzZXQgbGluZSIgbWVh
bnMgUEVSU1QjIC0gUENJZSBXYXJtIFJlc2V0CiAgYW5kICJEMywgbm90IEQzaG90IiBtZWFucyBE
M2NvbGQpCgoKQW5kIG5vdyBteSBleHBlcmltZW50czogRGlzYWJsaW5nIGFuZCBFbmFibGluZyBs
aW5rIHZpYSByb290IGJyaWRnZSBoYXMKZXhhY3RseSBzYW1lIHN5bmRyb21lcyBhcyBob3QgcmVz
ZXQgb24gYWxsIHRlc3RlZCBjYXJkcy4gU2VlIHRoYXQKZGlmZmVyZW50IGNoaXBzIChwcmUtQVI5
MzAwIGFuZCBwb3N0LUFSOTMwMCkgaGF2ZSBzbGlnaHRseSBkaWZmZXJlbnQKYmVoYXZpb3IgYW5k
IGl0IG1hdGNoZXMgYWxsIG15IGV4cGVyaW1lbnRzIChJIHdyb3RlIHRlc3QgZGV0YWlscyBpbgpj
b21taXQgbWVzc2FnZSkuIEFuZCBkb2luZyBsaW5rIHJldHJhaW4gd2hlbiByb290IGJyaWRnZSBo
YXMgbm9uLTIuNUdUL3MKdmFsdWUgaW4gUENJX0VYUF9MTktDVEwyX1RMUyBoYXMgYWxzbyBzYW1l
IGVmZmVjdCBhcyBob3QgcmVzZXQuClNvIGJhc2VkIG9uIHNhbWUgcmVzdWx0cyBmcm9tIG15IGV4
cGVyaW1lbnRzIGFsbCB0aGVzZSBhY3Rpb25zCihkaXNhYmxpbmcgbGluaywgaG90IHJlc2V0IGFu
ZCBsaW5rIHJldHJhaW4pIGhhdmUgY29tbW9uIGlzc3VlLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2F0aDEwawo=
