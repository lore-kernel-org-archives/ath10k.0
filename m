Return-Path: <SRS0=7cM+=LP=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16498C4743C
	for <ath10k@archiver.kernel.org>; Mon, 21 Jun 2021 14:29:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD9E161151
	for <ath10k@archiver.kernel.org>; Mon, 21 Jun 2021 14:29:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD9E161151
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wqATOt046RJfpRtkhMzgr4jbT0Rlc9DL9mbx0vH4Stc=; b=JwW89UrBDWyjMh
	FNcBGljvuQqtAqz5iSPRn+y6vWU2VIu/EGSDJGAFzAA2t+ziqyDhfVDWEi8zUAHGg4IjhViEIeSGf
	nMY2HWdhFLpUqfr8DnECNmWDWDYHe7hrW4PnqnTrHFner/oWoVKvcGTowzkDUsS2Xy8bCP6A9gmNo
	fdpBbzr0MdDeeVQzU6Kbc2remPfj8spDynSqiRnS52l55YdqInflUzlA4XTinsuFoKC5X4jwvf1G6
	QimHrgill8A3u4uGbsps3/0BCE5v2ybUTOG5iLRzagt5Sz322eCxQqlZwYT2sbJbOOl4ng+Vap/1e
	MKZvjgHr2Nsuq+G+Gx0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvKv8-003lNc-LW; Mon, 21 Jun 2021 14:29:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvKv5-003lM3-95
 for ath10k@lists.infradead.org; Mon, 21 Jun 2021 14:29:00 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3BF96600D4;
 Mon, 21 Jun 2021 14:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624285738;
 bh=Bbqc+TpZHyvo5eaZlnbMGe+NjFZlVQoc3pVkAaPrOO8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=H6Mq0IONHEkDDn82qccbMSxzc96a77FYOeO+ZzpOvLxWbEPNuSLZzpvkzlBOq4NdK
 asyMqA7H3JJULrtSs2UFBHtPke+rFO+qEKkjG8EpyjEk76/iuNxNMCkz+6kMBuX1hE
 9glIpeRtrwE20uQuMFoE/7vcdigH1v1e5/no0M7ralZmz0LYUkrxgP1GeQpDzzhXfi
 s2kdMkONZNlSlw4TvOCau86V5tzgCr+K0oK97zOJ8Ttnxl/gEP5jMyEe2bhP22lMUg
 QyfYyMxuugZDVGz/RLzST0tsvDDukP56RN/PrfBBsLbtW3HTJWUvRKfNgX8Q9pFKSF
 2DTHWRrCNGoVw==
Received: by pali.im (Postfix)
 id 626A471B; Mon, 21 Jun 2021 16:28:55 +0200 (CEST)
Date: Mon, 21 Jun 2021 16:28:55 +0200
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
Message-ID: <20210621142855.gnqtj3ofovx7xryr@pali>
References: <20210602190302.d3ibdtwti4yq57vi@pali>
 <20210616213819.GA3007589@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210616213819.GA3007589@bjorn-Precision-5520>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210621_072859_381482_24A5127A 
X-CRM114-Status: GOOD (  33.59  )
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

T24gV2VkbmVzZGF5IDE2IEp1bmUgMjAyMSAxNjozODoxOSBCam9ybiBIZWxnYWFzIHdyb3RlOgo+
IE9uIFdlZCwgSnVuIDAyLCAyMDIxIGF0IDA5OjAzOjAyUE0gKzAyMDAsIFBhbGkgUm9ow6FyIHdy
b3RlOgo+ID4gT24gV2VkbmVzZGF5IDAyIEp1bmUgMjAyMSAxMDo1NTo1OSBCam9ybiBIZWxnYWFz
IHdyb3RlOgo+ID4gPiBPbiBXZWQsIEp1biAwMiwgMjAyMSBhdCAwMjowODoxNlBNICswMjAwLCBQ
YWxpIFJvaMOhciB3cm90ZToKPiA+ID4gPiBPbiBUdWVzZGF5IDAxIEp1bmUgMjAyMSAxOTowMDoz
NiBCam9ybiBIZWxnYWFzIHdyb3RlOgo+ID4gPiAKPiA+ID4gPiA+IEkgd29uZGVyIGlmIHRoaXMg
Y291bGQgYmUgcmVzdHJ1Y3R1cmVkIGFzIGEgZ2VuZXJpYyBxdWlyayBpbiBxdWlya3MuYwo+ID4g
PiA+ID4gdGhhdCBzaW1wbHkgc2V0IHRoZSBicmlkZ2UncyBUTFMgdG8gMi41IEdUL3MgZHVyaW5n
IGVudW1lcmF0aW9uLiAgT3IKPiA+ID4gPiA+IHdvdWxkIHRoZSByZXRyYWluIGZhaWwgZXZlbiBp
biB0aGF0IGNhc2U/Cj4gPiA+ID4gCj4gPiA+ID4gSWYgSSB1bmRlcnN0YW5kIGl0IGNvcnJlY3Rs
eSB0aGVuIFBDSWUgbGluayBpcyBhbHJlYWR5IHVwIHdoZW4ga2VybmVsCj4gPiA+ID4gc3RhcnRz
IGVudW1lcmF0aW9uLiBTbyBzZXR0aW5nIEJyaWRnZSBUTFMgdG8gMi41IEdUL3MgZG9lcyBub3Qg
Y2hhbmdlCj4gPiA+ID4gYW55dGhpbmcgaGVyZS4KPiA+ID4gPiAKPiA+ID4gPiBNb3Jlb3ZlciBp
dCB3b3VsZCBoYXZlIHNpZGUgZWZmZWN0IHRoYXQgY2FyZHMgd2hpY2ggYXJlIGFscmVhZHkgc2V0
IHRvCj4gPiA+ID4gNSsgR1QvcyB3b3VsZCBiZSBkb3duZ3JhZGVkIHRvIDIuNSBHVC9zIGR1cmlu
ZyBlbnVtZXJhdGlvbiBhbmQgZm9yCj4gPiA+ID4gaW5jcmVhc2luZyBzcGVlZCB3b3VsZCBiZSBu
ZWVkZWQgYW5vdGhlciByb3VuZCBvZiAiZW51bWVyYXRpb24iIHRvIHNldCBhCj4gPiA+ID4gbmV3
IFRMUyBhbmQgcmV0cmFpbiBsaW5rIGFnYWluLiBBcyBUTFMgYWZmZWN0cyBsaW5rIG9ubHkgYWZ0
ZXIgbGluayBnb2VzCj4gPiA+ID4gaW50byBSZWNvdmVyeSBzdGF0ZS4KPiA+ID4gPiAKPiA+ID4g
PiBTbyB0aGlzIHdvdWxkIGp1c3QgY29tcGxpY2F0ZSBjYXJkIGVudW1lcmF0aW9uIGFuZCBzZXR0
aW5ncy4KPiA+ID4gCj4gPiA+IFRoZSBjdXJyZW50IHF1aXJrIGNvbXBsaWNhdGVzIHRoZSBBU1BN
IGNvZGUuICBJJ20gaG9waW5nIHRoYXQgaWYgd2UKPiA+ID4gc2V0IHRoZSBicmlkZ2UncyBUYXJn
ZXQgTGluayBTcGVlZCBkdXJpbmcgZW51bWVyYXRpb24sIHRoZSBsaW5rCj4gPiA+IHJldHJhaW4g
d2lsbCAianVzdCB3b3JrIiB3aXRob3V0IGNvbXBsaWNhdGluZyB0aGUgQVNQTSBjb2RlLgo+ID4g
PiAKPiA+ID4gQW4gZW51bWVyYXRpb24gcXVpcmsgd291bGRuJ3QgaGF2ZSB0byBzZXQgdGhlIGJy
aWRnZSdzIFRMUyB0byAyLjUKPiA+ID4gR1QvczsgdGhlIHF1aXJrIHdvdWxkIGJlIGF0dGFjaGVk
IHRvIHNwZWNpZmljIGVuZHBvaW50IGRldmljZXMgYW5kCj4gPiA+IGNvdWxkIHNldCB0aGUgYnJp
ZGdlJ3MgVExTIHRvIHdoYXRldmVyIHRoZSBlbmRwb2ludCBzdXBwb3J0cy4KPiA+IAo+ID4gTm93
IEkgc2VlIHdoYXQgeW91IG1lYW4uIFllcywgSSBhZ3JlZSB0aGlzIGlzIGEgZ29vZCBpZGVhIGFu
ZCBjYW4KPiA+IHNpbXBsaWZ5IGNvZGUuIFF1aXJrIGlzIG5vdCByZWxhdGVkIHRvIEFTUE0gY29k
ZSBhbmQgYmFzaWNhbGx5IGhhcwo+ID4gbm90aGluZyB3aXRoIGl0LCBqdXN0IEkgcHV0IGl0IGlu
dG8gYXNwbS5jIGJlY2F1c2UgdGhpcyBpcyB0aGUgb25seQo+ID4gcGxhY2Ugd2hlcmUgbGluayBy
ZXRyYWluaW5nIHdhcyBhY3RpdmF0ZWQuCj4gPiAKPiA+IEJ1dCB3aXRoIHRoaXMgcHJvcG9zYWwg
dGhlcmUgaXMgb25lIGlzc3VlLiBTb21lIGtlcm5lbCBkcml2ZXJzIGFscmVhZHkKPiA+IG92ZXJ3
cml0ZSBQQ0lfRVhQX0xOS0NUTDJfVExTIHZhbHVlLiBTbyBpZiBQQ0kgZW51bWVyYXRpb24gY29k
ZSBzZXQgc29tZQo+ID4gdmFsdWUgaW50byBQQ0lfRVhQX0xOS0NUTDJfVExTIGJpdHMgdGhlbiBk
cml2ZXJzIGNhbiBjaGFuZ2UgaXQgYW5kIG9uY2UKPiA+IEFTUE0gd2lsbCB0cnkgdG8gcmV0cmFp
biBsaW5rIHRoaXMgbWF5IGNhdXNlIHRoaXMgaXNzdWUuCj4gCj4gSSBndWVzcyB5b3UgbWVhbiB0
aGUgYW1kZ3B1LCByYWRlb24sIGFuZCBoZmkxIGRyaXZlcnMuICBUaGV5IHJlYWxseQo+IHNob3Vs
ZG4ndCBiZSBtdWNraW5nIHdpdGggdGhhdCBzdHVmZiBhbnl3YXkuICBCdXQgdGhleSBkbyBhbmQg
YXJlCj4gdW5saWtlbHkgdG8gY2hhbmdlIGJlY2F1c2Ugd2UgZG9uJ3QgaGF2ZSBhbnkgZ29vZCBh
bHRlcm5hdGl2ZS4KClllYSwgdGhlc2UgYXJlIGV4YW1wbGVzIG9mIHN1Y2ggZHJpdmVycy4uLiBN
YXliZSBpdCBpcyBhIGdvb2QgaWRlYSB0bwphc2sgdGhvc2UgcGVvcGxlIHdoeSBjaGFuZ2luZyBQ
Q0lfRVhQX0xOS0NUTDJfVExTIGlzIG5lZWRlZC4gQXMgdGhlc2UKZHJpdmVycyBhcmUgb2Z0ZW4g
ZGVyaXZlZCBmcm9tIGNvZGViYXNlIG9mIHNoYXJlZCBtdWx0aXN5c3RlbSBkcml2ZXJzIG9yCmZy
b20gY29tbW9uIGRvY3VtZW50YXRpb24sIGl0IGlzIHBvc3NpYmxlIHRoYXQgb3JpZ2luYWwgc291
cmNlIGhhcyB0aGlzCmNvZGUgYXMgYSB3b3JrYXJvdW5kIG9yIGNvbW1vbiBwYXR0ZXJuIHVzZWQg
aW4gb3RoZXIgb3BlcmF0aW5nIHN5c3RlbXMsCm5vdCByZWxhdGVkIHRvIGxpbnV4Li4uCgo+IE9u
ZSB3YXkgYXJvdW5kIHRoYXQgd291bGQgYmUgdG8gYWRkIHNvbWUgcXVpcmsgY29kZSB0bwo+IHBj
aWVfY2FwYWJpbGl0eV93cml0ZV93b3JkKCkuICBVZ2x5LCBidXQgd2UgZG8gaGF2ZSBzb21ldGhp
bmcgc29ydCBvZgo+IHNpbWlsYXIgaW4gcGNpZV9jYXBhYmlsaXR5X3JlYWRfd29yZCgpIGFscmVh
ZHkuCgpCam9ybiwgZG8geW91IHJlYWxseSB3YW50IHN1Y2ggdWdseSBoYWNrIGluIHBjaWVfY2Fw
YWJpbGl0eV93cml0ZV93b3JkPwpJdCBpcyBjb21tb24gY29kZSB1c2VkIGFuZCBjYWxsZWQgZnJv
bSBsb3Qgb2YgcGxhY2VzIHNvIGl0IG1heSBhZmZlY3QKd2hvbGUgc3lzdGVtIGlmIGluIGZ1dHVy
ZSBzb21lYm9keSBjaGFuZ2VzIGl0IGFnYWluLi4uCgpPciB3ZSBjYW4gbGV0IGl0IGFzIGlzLCBz
YXkgdGhhdCB0aG9zZSBkcml2ZXJzIHdoaWNoIGFyZSBkb2luZyBpdCBhcmUKYnVnZ3kgYW5kIGZv
ciBmdXR1cmUgdHJ5IHRvIHJlZHVjZSBjb2RlIHdoaWNoIHRvdWNoZXMgcmVnaXN0ZXJzClBDSV9F
WFBfTE5LQ1RMMl9UTFMuIEdvb2QgY29kZSByZXZpZXcgb3Igc29tZSBjaGVja3BhdGNoLnBsIHdh
cm5pbmdzIG1heQpwcmV2ZW50IGludHJvZHVjdGlvbiBvZiBvdGhlciBjb2RlIHdoaWNoIHdpbGwg
ZG8gaXQuCgo+IAo+IEJqb3JuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
