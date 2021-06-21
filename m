Return-Path: <SRS0=7cM+=LP=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47A8BC48BC2
	for <ath10k@archiver.kernel.org>; Mon, 21 Jun 2021 14:39:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CA9660FDC
	for <ath10k@archiver.kernel.org>; Mon, 21 Jun 2021 14:39:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CA9660FDC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D6cHCWo2IHht0q13uIXqlqGjLirvR1zfL4z0DHx9+AI=; b=WhC4omKsyfo64Y
	fkSIOF+3i+gGfSVBOcR+wePPy1CLeXdHrEKX3hZ5vl0Em3G8rhy5IpJ8ls/ol/OHFlkkj3N3XxxwO
	AlquykwWPzx5Y3gpq7M7m1eTyHeYHqy++cgMI8k+YhEsjy+4z+j+R7Tv5H5vsam2pmeJ6EcFVk3FD
	GsUvbnjrnGV+ji95+ZaJBixGlHnKmU/7qu2rzqBo/dMjfR7nhs6YyO1moCKUSdQ+m56B3qIJX3uE9
	FaYVtbofbBDmsKjTeLOJ9rLIztbFKamZu+KovMf7P66k3xJVn6OYRXcNAR4sZm+ULc9qUblY3SrRT
	3PAEZz0c4U6dCN2b2O+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvL5R-003olX-3a; Mon, 21 Jun 2021 14:39:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvL5O-003okr-AN
 for ath10k@lists.infradead.org; Mon, 21 Jun 2021 14:39:39 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id AC64F610C7;
 Mon, 21 Jun 2021 14:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624286377;
 bh=AJQGZhya+hZVU6zO/cwUIXVHEh/2BetaXp4xScpcpBY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EvlUBmUGsaqUjQFgOD/wqKL8Lj4R9mniPixNP63F9SI2sZ9Cv/gT9NkSt3XPm9HWF
 HelJ6XDkX8pWcIhUt32tn3bBttQJVXVcKBxI1HaXjqk7CTQI3e3QwPg74PRm/pPoPF
 QCh7R2AESRXSWPynKKv1v9tCdmLvQ5JG6/ZrzGNC1JkuB5pi7NilCBcXjvzldGjw7J
 xs3AU9K/IxbkBzi+NElq3VoysLQOElj6rvXFdhYg4u0auMbwRS2X/jkpxXeOMzhfM1
 G0dPC11GSHN4m7dH5DVUWM2o6hnbTM2ya92sQnQ+0CxatQyTKY25qVTR1M+VPrd2Mw
 EWejjQOR2MDwg==
Received: by pali.im (Postfix)
 id 2623571B; Mon, 21 Jun 2021 16:39:35 +0200 (CEST)
Date: Mon, 21 Jun 2021 16:39:34 +0200
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
Message-ID: <20210621143934.rwhdlzujz5f4yymc@pali>
References: <20210602120816.axi4dtnyg5gl2h2z@pali>
 <20210602155559.GA2028037@bjorn-Precision-5520>
 <20210602190302.d3ibdtwti4yq57vi@pali>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210602190302.d3ibdtwti4yq57vi@pali>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210621_073938_443328_E43D068A 
X-CRM114-Status: GOOD (  27.81  )
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

T24gV2VkbmVzZGF5IDAyIEp1bmUgMjAyMSAyMTowMzowMiBQYWxpIFJvaMOhciB3cm90ZToKPiBP
biBXZWRuZXNkYXkgMDIgSnVuZSAyMDIxIDEwOjU1OjU5IEJqb3JuIEhlbGdhYXMgd3JvdGU6Cj4g
PiBPbiBXZWQsIEp1biAwMiwgMjAyMSBhdCAwMjowODoxNlBNICswMjAwLCBQYWxpIFJvaMOhciB3
cm90ZToKPiA+ID4gT24gVHVlc2RheSAwMSBKdW5lIDIwMjEgMTk6MDA6MzYgQmpvcm4gSGVsZ2Fh
cyB3cm90ZToKPiA+IAo+ID4gPiA+IEkgd29uZGVyIGlmIHRoaXMgY291bGQgYmUgcmVzdHJ1Y3R1
cmVkIGFzIGEgZ2VuZXJpYyBxdWlyayBpbiBxdWlya3MuYwo+ID4gPiA+IHRoYXQgc2ltcGx5IHNl
dCB0aGUgYnJpZGdlJ3MgVExTIHRvIDIuNSBHVC9zIGR1cmluZyBlbnVtZXJhdGlvbi4gIE9yCj4g
PiA+ID4gd291bGQgdGhlIHJldHJhaW4gZmFpbCBldmVuIGluIHRoYXQgY2FzZT8KPiA+ID4gCj4g
PiA+IElmIEkgdW5kZXJzdGFuZCBpdCBjb3JyZWN0bHkgdGhlbiBQQ0llIGxpbmsgaXMgYWxyZWFk
eSB1cCB3aGVuIGtlcm5lbAo+ID4gPiBzdGFydHMgZW51bWVyYXRpb24uIFNvIHNldHRpbmcgQnJp
ZGdlIFRMUyB0byAyLjUgR1QvcyBkb2VzIG5vdCBjaGFuZ2UKPiA+ID4gYW55dGhpbmcgaGVyZS4K
PiA+ID4gCj4gPiA+IE1vcmVvdmVyIGl0IHdvdWxkIGhhdmUgc2lkZSBlZmZlY3QgdGhhdCBjYXJk
cyB3aGljaCBhcmUgYWxyZWFkeSBzZXQgdG8KPiA+ID4gNSsgR1QvcyB3b3VsZCBiZSBkb3duZ3Jh
ZGVkIHRvIDIuNSBHVC9zIGR1cmluZyBlbnVtZXJhdGlvbiBhbmQgZm9yCj4gPiA+IGluY3JlYXNp
bmcgc3BlZWQgd291bGQgYmUgbmVlZGVkIGFub3RoZXIgcm91bmQgb2YgImVudW1lcmF0aW9uIiB0
byBzZXQgYQo+ID4gPiBuZXcgVExTIGFuZCByZXRyYWluIGxpbmsgYWdhaW4uIEFzIFRMUyBhZmZl
Y3RzIGxpbmsgb25seSBhZnRlciBsaW5rIGdvZXMKPiA+ID4gaW50byBSZWNvdmVyeSBzdGF0ZS4K
PiA+ID4gCj4gPiA+IFNvIHRoaXMgd291bGQganVzdCBjb21wbGljYXRlIGNhcmQgZW51bWVyYXRp
b24gYW5kIHNldHRpbmdzLgo+ID4gCj4gPiBUaGUgY3VycmVudCBxdWlyayBjb21wbGljYXRlcyB0
aGUgQVNQTSBjb2RlLiAgSSdtIGhvcGluZyB0aGF0IGlmIHdlCj4gPiBzZXQgdGhlIGJyaWRnZSdz
IFRhcmdldCBMaW5rIFNwZWVkIGR1cmluZyBlbnVtZXJhdGlvbiwgdGhlIGxpbmsKPiA+IHJldHJh
aW4gd2lsbCAianVzdCB3b3JrIiB3aXRob3V0IGNvbXBsaWNhdGluZyB0aGUgQVNQTSBjb2RlLgo+
ID4gCj4gPiBBbiBlbnVtZXJhdGlvbiBxdWlyayB3b3VsZG4ndCBoYXZlIHRvIHNldCB0aGUgYnJp
ZGdlJ3MgVExTIHRvIDIuNQo+ID4gR1QvczsgdGhlIHF1aXJrIHdvdWxkIGJlIGF0dGFjaGVkIHRv
IHNwZWNpZmljIGVuZHBvaW50IGRldmljZXMgYW5kCj4gPiBjb3VsZCBzZXQgdGhlIGJyaWRnZSdz
IFRMUyB0byB3aGF0ZXZlciB0aGUgZW5kcG9pbnQgc3VwcG9ydHMuCj4gCj4gTm93IEkgc2VlIHdo
YXQgeW91IG1lYW4uIFllcywgSSBhZ3JlZSB0aGlzIGlzIGEgZ29vZCBpZGVhIGFuZCBjYW4KPiBz
aW1wbGlmeSBjb2RlLiBRdWlyayBpcyBub3QgcmVsYXRlZCB0byBBU1BNIGNvZGUgYW5kIGJhc2lj
YWxseSBoYXMKPiBub3RoaW5nIHdpdGggaXQsIGp1c3QgSSBwdXQgaXQgaW50byBhc3BtLmMgYmVj
YXVzZSB0aGlzIGlzIHRoZSBvbmx5Cj4gcGxhY2Ugd2hlcmUgbGluayByZXRyYWluaW5nIHdhcyBh
Y3RpdmF0ZWQuCj4gCj4gQnV0IHdpdGggdGhpcyBwcm9wb3NhbCB0aGVyZSBpcyBvbmUgaXNzdWUu
IFNvbWUga2VybmVsIGRyaXZlcnMgYWxyZWFkeQo+IG92ZXJ3cml0ZSBQQ0lfRVhQX0xOS0NUTDJf
VExTIHZhbHVlLiBTbyBpZiBQQ0kgZW51bWVyYXRpb24gY29kZSBzZXQgc29tZQo+IHZhbHVlIGlu
dG8gUENJX0VYUF9MTktDVEwyX1RMUyBiaXRzIHRoZW4gZHJpdmVycyBjYW4gY2hhbmdlIGl0IGFu
ZCBvbmNlCj4gQVNQTSB3aWxsIHRyeSB0byByZXRyYWluIGxpbmsgdGhpcyBtYXkgY2F1c2UgdGhp
cyBpc3N1ZS4KCkFuZCBJIHNlZSB0aGVyZSBhbm90aGVyIGlzc3VlIHdoaWNoIGRvZXMgbm90IGFs
bG93IHRvIGZ1bGx5IG1vdmUgY29kZQpmcm9tIGFzcG0uYyBmaWxlLiBCcmlkZ2UgZG9lcyBub3Qg
aGF2ZSB0byBzdXBwb3J0IGNoYW5naW5nIHZhbHVlIGluClBDSV9FWFBfTE5LQ1RMMl9UTFMgcmVn
aXN0ZXIgb3IgZG9lcyBub3Qgc3VwcG9ydCBzZXR0aW5nIDIuNSBHVC9zIGJpdHMuClNvIGxvZ2lj
IGZvciB0aGVzZSBjaGVja3MgbmVlZHMgdG8gYmUgaW4gY29kZSB3aGljaCB0cmllcyB0byByZXRy
YWluCmxpbmssIGluIG91ciBjYXNlIGFzcG0uYy4KCkFuZCB5ZXMsIHRoZXJlIGFyZSBicmlkZ2Vz
IHdoaWNoIGRvIG5vdCBzdXBwb3J0IHRoaXMgZnVuY3Rpb25hbGl0eS4gSXQKYXBwbGllcyBhbHNv
IGZvciBQQ0kgYnJpZGdlIGltcGxlbWVudGVkIC8gZW11bGF0ZWQgYnkga2VybmVsIGRyaXZlcgpk
cml2ZXJzL3BjaS9wY2ktYnJpZGdlLWVtdWwuYy4KClNvIHdoYXQgd2UgY2FuIGRvIGlzIGp1c3Qg
dG8gbW92ZSBjb2RlIHdoaWNoIHNldHMgUENJX0VYUF9MTktDVEwyX1RMUwpiaXRzLCBub3QgY29k
ZSB3aGljaCByZWFkcyB0aGVtIGFuZCB2ZXJpZmllcyB0aGF0IGJyaWRnZSBpcyBpbiBjb3JyZWN0
CnN0YXRlLgoKQ3VycmVudCBxdWlyayBjb2RlIGhhcyBhbHJlYWR5IGNvZGUgcGF0aCB3aGVuIGl0
IGZvcmJpZCBsaW5rIHJldHJhaW5pbmcKYW5kIHRoZXJlZm9yZSBmb3JiaWQgZW5hYmxpbmcgQVNQ
TSB3aGVuICJiYWQgYnJpZGdlIiAoZS5nLiB0aGF0IGVtdWxhdGVkCmJ5IGtlcm5lbCkgaXMgaW4g
dXNlLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRo
MTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
