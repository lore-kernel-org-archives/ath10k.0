Return-Path: <SRS0=ZFlJ=IZ=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD9B9C433C1
	for <ath10k@archiver.kernel.org>; Sat, 27 Mar 2021 13:31:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65ABD619BA
	for <ath10k@archiver.kernel.org>; Sat, 27 Mar 2021 13:31:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65ABD619BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cV9b7hXlsqVpcK1Za6G9j+uVLXmJkuWJdNe7OQEWvXk=; b=AIcsg7TeLy5P8IYz5YAeGJVpA
	Bl5BavLOE21Ak6zQbauRAqzyS6od4xhYm8cwst+gRrCfAFd3d5YgwzfV1DT7i9dQVPFA+VNXpTe2m
	yXebvy7EwvqIQsm/FYYWil4ECvT0S/NlYfpcWEiiGSPl5/4DfnzbE9iFfuCo+rPmxp/7Q9IfUpeT3
	5gjiDwtodxl389OLyug6c0dHFxRlSFyrY9yvlDxggLw8f/CNmKsmedZ2d9Z2eyBUz0ByCnbr2DqQL
	hRuMIvkwmjvdgqfPjIwJDLMwgMefxbaO1nQDWsu6vdh0U2bbWScQEPHl+nAe84xMA2aPeFbQ4hKS4
	f+V0XipYw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQ912-0058d5-HD; Sat, 27 Mar 2021 13:30:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQ90x-0058cW-Fs
 for ath10k@lists.infradead.org; Sat, 27 Mar 2021 13:30:09 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6783161966;
 Sat, 27 Mar 2021 13:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616851802;
 bh=n8sXS1//HNddHQmSXJmBqsBbpbXrAQw627EGz2mYdAo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AvCK9mdMat6gE2h7ERaT3A18hXaVBuWX9PrKu3Z3bhya8p/5X0HobTPXrJ2cDwg4P
 dmHgQ0zbszwZn03zimFCqpa3vyWI/FNWQT/ubvwbDQ7LFiZoa96KmUK+16TIvVrSSh
 J76pXRXXikhb/gaERMevu4lRjM+5+JGsFwhiyN4pLzoz9aTU4VOikWhxo7cJ7Dpmsn
 n8nsijEslo/nhb7y5xwBqexo94uQAw+E3VHJ6wIRRZWqHjRNIO0CcH1v0RJrxxHUNb
 3n3DVINKKj6S5U8X1vkTms56y1AJu7QCJAeJD9ewiLK1cZHrWgMN0Ff+HmXQsAOupu
 IXfw3GR5mHTvw==
Received: by pali.im (Postfix)
 id D3B8F95D; Sat, 27 Mar 2021 14:29:59 +0100 (CET)
Date: Sat, 27 Mar 2021 14:29:59 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Kalle Valo <kvalo@codeaurora.org>,
 Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
 Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>, vtolkm@gmail.com,
 Rob Herring <robh@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jason Cooper <jason@lakedaemon.net>, linux-pci@vger.kernel.org,
 ath10k@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: Disallow retraining link for Atheros QCA98xx chips
 on non-Gen1 PCIe bridges
Message-ID: <20210327132959.fwkphna7gg57aove@pali>
References: <20210326124326.21163-1-pali@kernel.org>
 <YF540gjh156QIirA@rocinante>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YF540gjh156QIirA@rocinante>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210327_133008_006674_86C7BE47 
X-CRM114-Status: GOOD (  30.95  )
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

SGVsbG8hCgpPbiBTYXR1cmRheSAyNyBNYXJjaCAyMDIxIDAxOjE0OjEwIEtyenlzenRvZiBXaWxj
ennFhHNraSB3cm90ZToKPiBIaSBQYWxpLAo+IAo+IFRoYW5rIHlvdSBmb3Igc2VuZGluZyB0aGUg
cGF0Y2ggb3ZlciEKPiAKPiBbLi4uXQo+ID4gK3N0YXRpYyBpbnQgcGNpZV9jaGFuZ2VfdGxzX3Rv
X2dlbjEoc3RydWN0IHBjaV9kZXYgKnBhcmVudCkKPiAKPiBKdXN0IGEgbml0cGljaywgc28gZmVl
bCBmcmVlIHRvIGlnbm9yZSBpdC4gIEkgd291bGQganVzdCBjYWxsIHRoZQo+IHZhcmlhYmxlICJk
ZXYiIGFzIHdlIHBhc3MgYSBwb2ludGVyIHRvIGEgcGFydGljdWxhciBkZXZpY2UsIGJ1dCBpdCBk
b2VzCj4gbm90IG1hdHRlciBhcyBtdWNoLCBzbyBJIGFtIGxlYXZpbmcgdGhpcyB0byB5b3UuCgpJ
IGNhbGxlZCBpdCAncGFyZW50JyBiZWNhdXNlIGl0IGlzIGNhbGxlZCAncGFyZW50JyBhbHNvIGlu
IGNhbGxlcgpmdW5jdGlvbi4gTGluayBjb25zaXN0cyBvZiB0d28gZGV2aWNlcywgc28gJ2Rldicg
Y291bGQgYmUgYW1iaWd1b3VzLgoKPiBbLi4uXQo+ID4gKwlpZiAocmV0ID09IDApIHsKPiAKPiBZ
b3UgcHJlZmVyIHRoaXMgc3R5bGUgb3ZlciAiaWYgKCFyZXQpIj8gIEp1c3QgYXNraW5nIGluIHRo
ZSB2aWV3IG9mIHRoZQo+IHN0eWxlIHRoYXQgc2VlbSB0byBiZSBwcmVmZXJyZWQgaW4gdGhlIGNv
ZGUgYmFzZSBhdCB0aGUgbW9tZW50LgoKSSBjYW4gY2hhbmdlIHRoaXMgdG8gJ2lmICghcmV0KScg
aWYgbmVlZGVkLCBubyBwcm9ibGVtLgoKSSB1c2UgJ2lmICghdmFsKScgbW9zdGx5IGZvciBib29s
ZWFuIGFuZCBwb2ludGVyIHZhcmlhYmxlcy4gSWYgdmFyaWFibGUKY2FuIGNvbnRhaW4gbW9yZSBp
bnRlZ2VyIHZhbHVlcyB0aGVuIEkgbG90IG9mIHRpbWVzIEkgdXNlICc9PScuCgo+ID4gKwkJLyog
VmVyaWZ5IHRoYXQgbmV3IHZhbHVlIHdhcyByZWFsbHkgc2V0ICovCj4gPiArCQlwY2llX2NhcGFi
aWxpdHlfcmVhZF93b3JkKHBhcmVudCwgUENJX0VYUF9MTktDVEwyLCAmcmVnMTYpOwo+ID4gKwkJ
aWYgKChyZWcxNiAmIFBDSV9FWFBfTE5LQ1RMMl9UTFMpICE9IFBDSV9FWFBfTE5LQ1RMMl9UTFNf
Ml81R1QpCj4gPiArCQkJcmV0ID0gLUVJTlZBTDsKPiAKPiBJIGFtIHdvbmRlcmluZyBhYm91dCB0
aGlzIHZlcmlmaWNhdGlvbiAtIGRpZCB5b3UgaGF2ZSBhIGNhc2Ugd2hlcmUgdGhlCj4gZGV2aWNl
IHdvdWxkIG5vdCBwcm9wZXJseSBzZXQgaXRzIGNhcGFiaWxpdHksIG9yIGFjY2VwdCB0aGUgd3Jp
dGUgYW5kIGRvCj4gbm90aGluZz8KCkkgZG8gbm90IGtub3cgYW55IHJlYWwgZGV2aWNlIHdoaWNo
IGlzIGRvaW5nIHRoaXMgdGhpbmcuCgpCdXQgdGhpcyBpc3N1ZSBjYW4gaGFwcGVuIHdpdGgga2Vy
bmVsJ3MgUENJZSBlbXVsYXRlZCByb290IGJyaWRnZToKZHJpdmVycy9wY2kvcGNpLWJyaWRnZS1l
bXVsLmMKCkRyaXZlcnMgd2hpY2ggYXJlIHVzaW5nIHRoaXMgZW11bGF0ZWQgcm9vdCBicmlkZ2Ug
KGFuZCBib3RoIHBjaS1tdmVidS5jCmFuZCBwY2ktYWFyZHZhcmsuYyBhcmUgdXNpbmcgaXQhKSBk
byBub3QgaGF2ZSB0byBpbXBsZW1lbnQgY2FsbGJhY2sgZm9yCmV2ZXJ5IHJlYWQgYW5kIGV2ZXJ5
IHdyaXRlIG9wZXJhdGlvbiBvZiBldmVyeSByZWdpc3Rlci4KCk5vdGUgdGhhdCBib3RoIHBjaS1t
dmVidS5jIGFuZCBwY2ktYWFyZHZhcmsuYyBjdXJyZW50bHkgZG9lcyBub3QKaW1wbGVtZW50IGFj
Y2VzcyB0byBIVyByZWdpc3RlciBQQ0lfRVhQX0xOS0NUTDIuIFNvIGN1cnJlbnRseSBpdCBpcyBu
b3QKcG9zc2libGUgdG8gc2V0IFBDSV9FWFBfTE5LQ1RMMl9UTFNfMl81R1QuIEFuZCBhYm92ZSBj
b2RlIGNvcnJlY3RseQpmYWlscyBhbmQgZGlzYWxsb3cgQVNQTSBjb2RlIHRvIHJldHJhaW4gbGlu
ay4KCkkgaGF2ZSBzb21lIFdJUCBwYXRjaGVzIHdoaWNoIGltcGxlbWVudCBMTktDQVAyLCBMTktD
VEwyIGFuZCBMTktTVEEyCnJlYWQvd3JpdGUgY2FsbGJhY2tzIG9uIGVtdWxhdGVkIGJyaWRnZSBm
b3IgcGNpLW12ZWJ1LmMgYW5kCnBjaS1hYXJkdmFyay5jLiBBbmQgSSBoYXZlIHRlc3RlZCB0aGF0
IHdpdGggdGhvc2UgV0lQIHBhdGNoZXMgQVNQTSBjb2RlCmNhbiBjb3JyZWN0bHkgc3dpdGNoIGxp
bmsgdG8gMi41R1QvcyBhbmQgZW5hYmxlIEFTUE0uCgo+ID4gKwlpZiAocmV0ICE9IDApCj4gCj4g
SSB0aGluayAiaWYgKHJldCkiIHdvdWxkIGJlIGZpbmUgdG8gdXNlIGhlcmUsIHVubGVzcyB5b3Ug
cHJlZmVyIGJlaW5nCj4gbW9yZSBleHBsaWNpdC4gIFNlZSBteSBxdWVzdGlvbiBhYm91dCBzdHls
ZSBhYm92ZS4KPiAKPiA+ICBzdGF0aWMgYm9vbCBwY2llX3JldHJhaW5fbGluayhzdHJ1Y3QgcGNp
ZV9saW5rX3N0YXRlICpsaW5rKQo+ID4gIHsKPiA+ICAJc3RydWN0IHBjaV9kZXYgKnBhcmVudCA9
IGxpbmstPnBkZXY7Cj4gPiAgCXVuc2lnbmVkIGxvbmcgZW5kX2ppZmZpZXM7Cj4gPiAgCXUxNiBy
ZWcxNjsKPiA+ICsJdTMyIHJlZzMyOwo+ID4gKwo+ID4gKwkJLyogQ2hlY2sgaWYgbGluayBpcyBj
YXBhYmxlIG9mIGhpZ2hlciBzcGVlZCB0aGFuIDIuNSBHVC9zIGFuZCBuZWVkcyBxdWlyayAqLwo+
ID4gKwkJcGNpZV9jYXBhYmlsaXR5X3JlYWRfZHdvcmQocGFyZW50LCBQQ0lfRVhQX0xOS0NBUCwg
JnJlZzMyKTsKPiA+ICsJCWlmICgocmVnMzIgJiBQQ0lfRVhQX0xOS0NBUF9TTFMpID4gUENJX0VY
UF9MTktDQVBfU0xTXzJfNUdCKSB7Cj4gCj4gSSB3b25kZXIgaWYgbW92aW5nIHRoaXMgY2hlY2sg
dG8gcGNpZV9jaGFuZ2VfdGxzX3RvX2dlbjEoKSB3b3VsZCBtYWtlCj4gbW9yZSBzZW5zZT8gIEl0
IHdvdWxkIHRoZW4gbWFrZSB0aGlzIGZ1bmN0aW9uIGEgbGl0dGxlIGNsZWFuZXIuICBXaGF0IGRv
Cj4geW91IHRoaW5rPwoKT2ssIG5vIHByb2JsZW0uIEJ1dCB0aGVuIGZ1bmN0aW9uIG5lZWRzIHRv
IGJlIHJlbmFtZWQuIEFueSBpZGVhIGhvdwpzaG91bGQgYmUgdGhpcyBmdW5jdGlvbiBjYWxsZWQ/
Cgo+IFsuLi5dCj4gPiArc3RhdGljIHZvaWQgcXVpcmtfbm9fYnVzX3Jlc2V0X2FuZF9ub19yZXRy
YWluX2xpbmsoc3RydWN0IHBjaV9kZXYgKmRldikKPiA+ICt7Cj4gPiArCWRldi0+ZGV2X2ZsYWdz
IHw9IFBDSV9ERVZfRkxBR1NfTk9fQlVTX1JFU0VUIHwgUENJX0RFVl9GTEFHU19OT19SRVRSQUlO
X0xJTktfV0hFTl9OT1RfR0VOMTsKPiA+ICt9Cj4gWy4uLl0KPiAKPiBJIGtub3cgdGhhdCB0aGUg
c3R5bGUgaGFzIGJlZW4gY2hhbmdlZCB0byBhbGxvdyAxMDAgY2hhcmFjdGVycyB3aWR0aCBhbmQK
PiB0aGF0IGNoZWNrcGF0Y2gucGwgbm93IGFsc28gZG9lcyBub3Qgd2FybiBhYm91dCBsaW5lIGxl
bmd0aCwgYXMgcGVyCj4gY29tbWl0IGJkYzQ4ZmExMWU0NiAoImNoZWNrcGF0Y2gvY29kaW5nLXN0
eWxlOiBkZXByZWNhdGUgODAtY29sdW1uCj4gd2FybmluZyIpLCBidXQgSSB0aGluayBCam9ybiBz
dGlsbCBwcmVmZXJzIDgwIGNoYXJhY3RlcnMsIHRodXMgdGhpcyBsaW5lCj4gYWJvdmUgbWlnaHQg
aGF2ZSB0byBiZSBhbGlnbmVkLgoKT2shIElmIG5lZWRlZCBJIGNhbiByZWZvcm1hdCBwYXRjaCB0
byA4MCBjaGFyYWN0ZXJzIHBlciBsaW5lLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEw
awo=
