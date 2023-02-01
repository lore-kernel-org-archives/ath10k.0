Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE9AAC636D4
	for <ath10k@archiver.kernel.org>; Wed,  1 Feb 2023 21:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=1CPPG7xIhrP8lcXG82hML0W1Yr/vzMNfsGTVBRzoxHs=; b=x8FogZQdjmz2e8
	Ufjn5g+j6qx7l2GB1A+o1ooJl7A1PYf0w3H4Ls5PugWCIlQoWSMeGgOyx3pg6Pw2Rat3mrwkMNlNP
	fuu698yGdH/SknHyveQ5oAiyBQzN9G0Rt1z4f+zSid4SJg1UhrWJXat63xLtQe+Aj4KWr2n6as5gd
	yg7bpeRq2f8NpaOY3nQZRR28WW3G3TBoAmbDbmPzLe60iKbzLuXWxpG4MEnjTejiDF+2Njioofu8R
	wDwwFKTnweLZ+ehIKv34gTNsioxQ+x6QU4Q8UA+s41yNH6VTRTEpo29XVVdGHXIBSkmcTy8Idi1ww
	K3Xm2w4ZMphBIvi58QgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNKt8-00Dgzd-L5; Wed, 01 Feb 2023 21:43:30 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNKt5-00DgyI-3O
	for ath10k@lists.infradead.org; Wed, 01 Feb 2023 21:43:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C149FB82272;
	Wed,  1 Feb 2023 21:43:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C076C433EF;
	Wed,  1 Feb 2023 21:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675287795;
	bh=n5zwfnJq/0k7NqmhaM7dDS0iPBkLiQGnHNC0chJvoyo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=LbLSy0ip7DQZscgc8KHtS0nzvggLwtqJ5rHcAlvuMqiMbPxZXB6Ysfe/NlR/fII8y
	 yuf/fl/Aj7+BjiG8cy/KpwOE1SlIfxUlyTYFv+yCONgj6sNQCl27z7FjkjF2otAAV9
	 SwGjr74/6Sip7yBA3gaVKK2FpHyeV98wV2kEUDjbxlNjhXby6fMOeHK1OC5CEQ1ShF
	 5UXxJag6TMquAS1jvsYi7vCsew4jNCkIDIdJh06j08892/Zrw5FTy5RTk3Z5TSTAjm
	 oNS8Quy6fDI2xiC7po2qgXO2sss9f/XAFjvQ8vrB/+jNMUwZpvVaGTUh+8qurEStGR
	 s0pMk8QNoEGxg==
Date: Wed, 1 Feb 2023 15:43:13 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Mad Horse <equu@openmail.cc>
Cc: lpieralisi@kernel.org, toke@toke.dk, kvalo@kernel.org,
	linux-pci@vger.kernel.org, robh@kernel.org,
	linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
Subject: Re: [PATCH 2/3] wifi: ath9k: stop loading incompatible DT cal data
Message-ID: <20230201214313.GA1898614@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ab8ff515-19ec-fe3f-0237-c30275e9744d@openmail.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_134327_479203_AC91F658 
X-CRM114-Status: GOOD (  19.76  )
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

T24gV2VkLCBGZWIgMDEsIDIwMjMgYXQgMTE6MDI6NTlBTSArMDgwMCwgTWFkIEhvcnNlIHdyb3Rl
Ogo+IOWcqCAyMDIzLzEvMTggMDM6NDYsIEJqb3JuIEhlbGdhYXMg5YaZ6YGTOgoKPiA+IFN1Z2dl
c3Qgc3RydWN0dXJlIGxpa2UgdGhpcyAoZmxlc2ggb3V0IHdpdGggdGhlIHJlbGV2YW50IERUIHBy
b3BlcnR5Cj4gPiBuYW1lcywgZXRjKToKPiA+Cj4gPiAgIEZvciBQQ0kgYXRoOWsgZGV2aWNlcywg
bG9hZCBjYWxpYnJhdGlvbiBkYXRhIG9ubHkgaWYgdGhlcmUgaXMgYSBEVAo+ID4gICBub2RlIGNv
cnJlc3BvbmRpbmcgdG8gdGhlIGRldmljZSB3aXRoIFhYWCAuLi4KPiA+Cj4gPiBNb3JlIGRldGFp
bHM6IGh0dHBzOi8vY2hyaXMuYmVhbXMuaW8vcG9zdHMvZ2l0LWNvbW1pdC8KPiA+Cj4gVGhhbmtz
IGZvciBwb2ludGluZyBpdCBvdXQuIFRoZSBjb21taXQgbG9nIG9mIHRoZSBsYXN0IHR3byBwYXRj
aCBoYXMKPiBiZWVuIHJld29yZGVkIHdpdGggcmVxdWlyZWQgY29udGVudCwgYW5kIHNlbnQgdG8g
dGhlIGN1cnJlbnQgdGhyZWFkCj4gZWFybGllci4KClRoYW5rcy4gIFNlbmRpbmcgdXBkYXRlZCB2
ZXJzaW9uIGFzIHJlcGxpZXMgdG8gdGhlIG9yaWdpbmFsIHNlcmllcwpwb3N0aW5nIG1ha2VzIGl0
IGhhcmQgdG8ga2VlcCB0cmFjayBvZiB3aGF0J3MgaGFwcGVuaW5nLiAgQmV0dGVyIGlmCnlvdSBz
ZW5kIGEgInYyIiBzZXJpZXMgb2YgKmFsbCogdGhlIHBhdGNoZXMsIGV2ZW4gaWYgc29tZSBvZiB0
aGVtCmhhdmVuJ3QgY2hhbmdlZC4gIFRoZXJlIGFyZSBhIGZldyBoaW50cyBoZXJlLCBhbHRob3Vn
aCBpdCdzIG5vdCB2ZXJ5CmV4cGxpY2l0OgoKICBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9z
Y20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJlZS9Eb2N1bWVudGF0aW9u
L3Byb2Nlc3Mvc3VibWl0dGluZy1wYXRjaGVzLnJzdD9pZD12Ni4xI242MzMKCkFsc28sIHlvdSB1
c2UgbXVsdGlwbGUgZW1haWwgYWRkcmVzc2VzLCBhbmQgaWYgeW91IGNhbiBmaWd1cmUgb3V0IGhv
dwp0byBhdCBsZWFzdCBtYWtlIHRoZSBkaXNwbGF5IG5hbWVzIHRoZSBzYW1lLCBpdCB3aWxsIG1h
a2UgdGhlCmNvbnZlcnNhdGlvbiBlYXNpZXIgdG8gZm9sbG93LiAgSGVyZSdzIHdoYXQgaXQgbG9v
a3MgbGlrZSBpbiBtdXR0OgoKICAtIEphbiAgNyAgOToxNCBNYWQgSG9yc2UgICAgICAgW1BBVENI
XSBwY2k6IEFkZCBmdW5jdGlvbnMgLi4uCiAgLSBKYW4gMTAgIDk6MjQgVG8gTWFkIEhvcnNlICAg
IOKUnOKUgD4KICAtIEphbiAxNyAgNDowMSBNYWQgSG9yc2UgICAgICAg4pSc4pSAPltQQVRDSCAx
LzNdIFBDSTogb2Y6IE1hdGNoIC4uLgogIC0gSmFuIDE3ICA0OjAyIE1hZCBIb3JzZSAgICAgICDi
lJzilIA+W1BBVENIIDIvM10gd2lmaTogYXRoOWs6IHN0b3AgLi4uCiAgLSBKYW4gMTcgIDQ6MDIg
TWFkIEhvcnNlICAgICAgIOKUnOKUgD5bUEFUQ0ggMy8zXSB3aWZpOiBhdGgxMGs6IG9ubHkgLi4u
CiAgLSBKYW4gMTcgIDQ6MjkgTWFkIEhvcnNlICAgICAgIOKUnOKUgD5bUEFUQ0ggMS8zXSBQQ0k6
IG9mOiBNYXRjaCBwY2kgLi4uCiAgLSBKYW4gMTcgIDM6MjcgRWR3YXJkIENob3cgICAgIOKUnOKU
gD5bUEFUQ0ggMS8zXSBQQ0k6IG9mOiBNYXRjaCBwY2kgLi4uCiAgLSBKYW4gMTcgIDM6MjggRWR3
YXJkIENob3cgICAgIOKUnOKUgD5bUEFUQ0ggMy8zXSB3aWZpOiBhdGgxMGs6IG9ubHkgLi4uCiAg
LSBKYW4gMjEgIDQ6MDAgcGVyc211bGVAZ21haWwuIOKUnOKUgD5bUEFUQ0ggMi8zXSB3aWZpOiBh
dGg5azogc3RvcCAuLi4KICAtIEphbiAyMSAgNDowNiBwZXJzbXVsZUBnbWFpbC4g4pSc4pSAPltQ
QVRDSCAzLzNdIHdpZmk6IGF0aDEwazogb25seSAuLi4KICAtIEphbiAxNyAgMzoyNyBFZHdhcmQg
Q2hvdyAgICAg4pSU4pSAPltQQVRDSCAyLzNdIHdpZmk6IGF0aDlrOiBzdG9wIC4uLgogIC0gSmFu
IDE3IDEzOjQ2IFRvIEVkd2FyZCBDaG93ICAgIOKUlOKUgD4KICAtIEphbiAzMSAyMTowMiBNYWQg
SG9yc2UgICAgICAgICAgIOKUlOKUgD4KClRoaXMgYWxzbyBzaG93cyB0aGUgcHJvYmxlbSB3aXRo
IHVwZGF0ZWQgdmVyc2lvbnMgaW4gdGhlIHNhbWUgdGhyZWFkLgpJIGNhbiB3b3JrIG91dCB0aGF0
ICJKYW4gMTcgMS8zIiwgIkphbiAyMSAyLzMiLCBhbmQgIkphbiAyMSAzLzMiIGFyZQpzdXBwb3Nl
ZCB0byBiZSB0aGUgbmV3ZXN0IHZlcnNpb25zLCBidXQgdG9vbHMgbGlrZSBwYXRjaHdvcmsgYW5k
IGI0CmFyZSBub3Qgc21hcnQgZW5vdWdoIHRvIGRvIHRoYXQsIHNvIGl0J3MgcmVhbGx5IGhhcmQg
dG8gYXBwbHkgdGhpcy4KCklmIHlvdSBqdXN0IHBvc3QgYW4gdXBkYXRlZCBzZXJpZXMsIGUuZy4s
CgogIFtQQVRDSCB2MiAwLzNdIFBDSTogLi4uCiAgfC0+IFtQQVRDSCB2MiAxLzNdIFBDSTogb2Y6
IE1hdGNoIC4uLgogIHwtPiBbUEFUQ0ggdjIgMS8zXSBQQ0k6IG9mOiBNYXRjaCAuLi4KICB8LT4g
W1BBVENIIHYyIDEvM10gUENJOiBvZjogTWF0Y2ggLi4uCgp0aGVuIGV2ZXJ5dGhpbmcgd2lsbCBi
ZSBuaWNlIGFuZCBjbGVhbiBhbmQgZWFzeSB0byByZXZpZXcgYW5kIGFwcGx5LgoKQmpvcm4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWls
aW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
