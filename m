Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B6AC77B60
	for <ath10k@archiver.kernel.org>; Wed,  5 Apr 2023 13:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2SAtsVPnZ45riQSmKZyfj1Y4ClYKfccZuMR0Zsd02yw=; b=1mlTAatDVyy9w7
	regyCSy/9mFiwLTEslolCpuwe8ZRQlNefEpk2BYZtr86r9e4LOrta7ogKcnk5Sdwc/mb5vv6beJOA
	LUwL3dxbLAzTYNlUZypMws4eER1PzYI5YwuJ+AY1EDIaT7ufxgOYvNnmOHqEmYuWyeFCEW4X5X9u2
	zSrkEmpGAgGgyH0FyCMO6ktku0keHR6ECq+PvBq2kw7MjQeVJoZCakODRXZRectw1/WqL10kRXClL
	5GAbMnhkWrnKq3MXVN74fpUHK9E1GmPTzy6LJWEXWKuCM73h0kBvgAgqKZB/RbkFpfUhRakSV9q6d
	eiBehZyFkRgwMyGbEILA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pk3MZ-004YPR-0c;
	Wed, 05 Apr 2023 13:39:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pk3MW-004YOP-1X
	for ath10k@lists.infradead.org;
	Wed, 05 Apr 2023 13:39:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0CF9662905;
	Wed,  5 Apr 2023 13:39:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9D9AC4339B;
	Wed,  5 Apr 2023 13:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680701983;
	bh=Ke1sjmg8XjX4lXQXLETVhVTBNRkpm5HXwlQtPNG0E58=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=PjCeQa+huYi34YZ1weEmCcr6vfsGfMjElQWJb8T+5K3+bcplEwYufahR+xeLRiXQz
	 3tnsZqd+EsBDSp4vHsvLRNO854sKt5tZHILkIC58cuo0+I5aViS1dHjwjI3ARtui/e
	 +5Z0qUpezaopyMrKVOTUKNWi3ClBCl8lTy6pETGEiCfGyhhLctO4NofhP8ZD1aJVVT
	 D8tvrzXLNrKMyx0Dmes54nJA19s70S4F9EokYEs2PPUCxyEfeH3S2ZsK23befdXnr5
	 VxxN50MExHhDaEnPULhlU/vr8ZH206UskDAc8NBobPE9WFjLVOY8d6VBelDeaLNzgC
	 qROfYV/McmuZg==
From: Kalle Valo <kvalo@kernel.org>
To: Peter Dohm <peterdohm@blackmesa.com>
Cc: "ath10k\@lists.infradead.org" <ath10k@lists.infradead.org>
Subject: Re: Odd crash in ath10k card only on certain firmware versions...
References: <IA0PR20MB5731A6A9BAFB17E886DF2097B0889@IA0PR20MB5731.namprd20.prod.outlook.com>
Date: Wed, 05 Apr 2023 16:39:40 +0300
In-Reply-To: <IA0PR20MB5731A6A9BAFB17E886DF2097B0889@IA0PR20MB5731.namprd20.prod.outlook.com>
	(Peter Dohm's message of "Tue, 28 Mar 2023 20:56:33 +0000")
Message-ID: <874jpua1nn.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_063944_597291_860ED397 
X-CRM114-Status: GOOD (  17.33  )
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

UGV0ZXIgRG9obSA8cGV0ZXJkb2htQGJsYWNrbWVzYS5jb20+IHdyaXRlczoKCj4gSeKAmXZlIGJl
ZW4gZXhwZXJpbWVudGluZyB3aXRoIGEgZ2VuZXJpYyBRQ0E2MTc0IGh3IDMuMCBjYXJkIHRoYXQg
d2FzCj4gcHVyY2hhc2VkIHdpdGggbXkgUHJvdGVjdGxpIFZhdWx0IGFwcGxpYW5jZQo+IChodHRw
czovL3Byb3RlY3RsaS5jb20vcHJvZHVjdC9tMi13aWZpLykgd2hpY2ggbG9va3MgdG8ganVzdCBi
ZSB0aGlzCj4gZGV2aWNlIHJlc29sZDogaHR0cHM6Ly93d3cuamV0b25lLmNvbS50dy9qd3c2MDUx
Lmh0bWwKPgo+IFRoZSBkZXZpY2UgcGVyIGxzcGNpIGxvb2tzIGxpa2Ugc286Cj4KPiAwNzowMC4w
IE5ldHdvcmsgY29udHJvbGxlcjogUXVhbGNvbW0gQXRoZXJvcyBRQ0E2MTc0IDgwMi4xMWFjIFdp
cmVsZXNzCj4gTmV0d29yayBBZGFwdGVyIChyZXYgMzApCj4gICAgIFN1YnN5c3RlbTogUXVhbGNv
bW0gQXRoZXJvcyBEZXZpY2UgMzM2MQo+ICAgICBGbGFnczogYnVzIG1hc3RlciwgZmFzdCBkZXZz
ZWwsIGxhdGVuY3kgMCwgSVJRIDE3Ngo+ICAgICBNZW1vcnkgYXQgYjEwMDAwMDAgKDY0LWJpdCwg
bm9uLXByZWZldGNoYWJsZSkgW3NpemU9Mk1dCj4gICAgIENhcGFiaWxpdGllczogWzQwXSBQb3dl
ciBNYW5hZ2VtZW50IHZlcnNpb24gMwo+ICAgICBDYXBhYmlsaXRpZXM6IFs1MF0gTVNJOiBFbmFi
bGUrIENvdW50PTEvOCBNYXNrYWJsZSsgNjRiaXQtCj4gICAgIENhcGFiaWxpdGllczogWzcwXSBF
eHByZXNzIEVuZHBvaW50LCBNU0kgMDAKPiAgICAgQ2FwYWJpbGl0aWVzOiBbMTAwXSBBZHZhbmNl
ZCBFcnJvciBSZXBvcnRpbmcKPiAgICAgQ2FwYWJpbGl0aWVzOiBbMTQ4XSBWaXJ0dWFsIENoYW5u
ZWwKPiAgICAgQ2FwYWJpbGl0aWVzOiBbMTY4XSBEZXZpY2UgU2VyaWFsIE51bWJlciAwMC0wMC0w
MC0wMC0wMC0wMC0wMC0wMAo+ICAgICBDYXBhYmlsaXRpZXM6IFsxNzhdIExhdGVuY3kgVG9sZXJh
bmNlIFJlcG9ydGluZwo+ICAgICBDYXBhYmlsaXRpZXM6IFsxODBdIEwxIFBNIFN1YnN0YXRlcwo+
ICAgICBLZXJuZWwgZHJpdmVyIGluIHVzZTogYXRoMTBrX3BjaQo+ICAgICBLZXJuZWwgbW9kdWxl
czogYXRoMTBrX3BjaQo+Cj4gVGhpcyBpcyBhbiBhcmNoIGxpbnV4IGtlcm5lbDogNi4yLjgtYXJj
aDEtMSMxIFNNUCBQUkVFTVBUWV9EWU5BTUlDLAo+IGFuZCBldmVyeXRoaW5nIGlzIHRoZSBsYXRl
c3QgZ2VuZXJhbGx5IGF2YWlsYWJsZSBhcyBwZXIgdGhlIGRhdGUgb2YKPiB0aGlzIG9yaWdpbmFs
IGVtYWlsLCBNYXJjaCAyOCwgMjAyMy4KPgo+IFRoZSBkZWZhdWx0IGxpbnV4IGZpcm13YXJlIHRo
YXQgc2hpcHMgd2l0aCBhcmNoICh3aGljaCB1c2VzIHRoZSBsYXRlc3QKPiBwZXIgaGFzaGVzIG9m
IHRoZSBsYXRlc3QgYXZhaWxhYmxlIG9uIGdpdGh1YikgY3Jhc2hlcyBhcyBp4oCZbGwgZGVzY3Jp
YmUKPiBiZWxvdy4uLgo+ICAKPiBJZiBJIHVzZSBmaXJtd2FyZSB2ZXJzaW9uCj4gUUNBNjE3NC9o
dzMuMC80LjQuMS9maXJtd2FyZS02LmJpbl9XTEFOLlJNLjQuNC4xLTAwMTMyLVFDQVJNU1dQLTEs
Cj4gZXZlcnl0aGluZyB3b3JrcyBwZXJmZWN0bHkuIElmIGkgdXNlIGFueSBmaXJtd2FyZSBuZXdl
ciB0aGFuIHZlcnNpb24KPiAwMDEzMiwgaSBnZXQgdGhlIGZvbGxvd2luZyBjcmFzaCBkdXJpbmcg
aW4gbW9kdWxlIGxvYWQ6Cj4gIAo+ICh0aGVzZSBhcmUgdGhlIG9ubHkgZG1lc2cgbGluZXMgZW1p
dHRlZCwgYW5kIHRoZSBhZGFwdGVyIGludGVyZmFjZSBkb2VzIG5vdCBwbHVtYikKPiAgCj4gW3Rp
bWVzdGFtcF0gYXRoMTBrX3BjaSAwMDAwOjA3OjAwLjA6IHdtaSB1bmlmaWVkIHJlYWR5IGV2ZW50
IG5vdCByZWNlaXZlZAo+IFt0aW1lc3RhbXBdIGF0aDEwa19wY2kgMDAwMDowNzowMC4wOiBkZXZp
Y2UgaGFzIGNyYXNoZWQgZHVyaW5nIGluaXQKPiBbdGltZXN0YW1wXSBhdGgxMGtfcGNpIDAwMDA6
MDc6MDAuMDogZGV2aWNlIGhhcyBjcmFzaGVkIGR1cmluZyBpbml0Cj4gW3RpbWVzdGFtcF0gYXRo
MTBrX3BjaSAwMDAwOjA3OjAwLjA6IGZhaWxlZCB0byB3YWl0IGZvciB0YXJnZXQgaW5pdDogLTcw
Cj4gW3RpbWVzdGFtcF0gYXRoMTBrX3BjaSAwMDAwOjA3OjAwLjA6IGNvdWxkIG5vdCBpbml0IGNv
cmUgKC0xMTApCj4gW3RpbWVzdGFtcF0gYXRoMTBrX3BjaSAwMDAwOjA3OjAwLjA6IGNvdWxkIG5v
dCBwcm9iZSBmdyAoLTExMCkKPiAgCj4gRG9lcyBhbnlvbmUgaGF2ZSBBTlkgaWRlYXMgd2h5IHRo
aXMgcGFydGljdWxhciBjYXJkIGlzIGNyYXNoaW5nIG9uIHRoZQo+IG1vc3QgcmVjZW50IGZpcm13
YXJlcz8gSSBhbSBnbGFkIHRvIGV4cGVyaW1lbnQgdG8gdHJ5IGFuZCBmaWd1cmUgdGhpcwo+IG91
dCB3aXRoIG90aGVyc+KAmSBoZWxwLgoKVGhlcmUgd2FzIGEgc2ltaWxhciB0aHJlYWQgYWxyZWFk
eSBmcm9tIGxhc3QgeWVhciwgSSdsbCBpbmNsdWRlIHlvdSB0bwp0aGF0IHRocmVhZDoKCmh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2F0aDEway84NzhyZjZhMXMyLmZzZkBrZXJuZWwub3JnL1QvI3QK
Ci0tIApodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtd2lyZWxlc3Mv
bGlzdC8KCmh0dHBzOi8vd2lyZWxlc3Mud2lraS5rZXJuZWwub3JnL2VuL2RldmVsb3BlcnMvZG9j
dW1lbnRhdGlvbi9zdWJtaXR0aW5ncGF0Y2hlcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0
aDEwawo=
