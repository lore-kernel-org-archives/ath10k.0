Return-Path: <SRS0=cv9Q=FY=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FORGED_HOTMAIL_RCVD2,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 821F5C4361B
	for <ath10k@archiver.kernel.org>; Sun, 20 Dec 2020 01:33:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2141233E2
	for <ath10k@archiver.kernel.org>; Sun, 20 Dec 2020 01:33:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2141233E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=hotmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mH41OAMj9koFm3w/K2RSaIeJk7QFwid4qb3w0LwLA5o=; b=dEFzhki4/dMAKQ7Z8N8wmTQKoV
	ex1NHQuLRl5SpWgbqpu3JLmhJ8puEDGxPJZ78enXGznVEieFxLXG0CpxWGVCZFbfRhWmwYw/qRVOU
	bWC9A3f05t4DEYveF/4qJY66TrjGmcsGsaHu780DmeR9dd+QJjVoE8WrF/4QUIN/ZF+y80ZCuq3Wv
	RB6iKS3b9P4ENyR3iAp5AIIFKRjGgxQNg+qey0jV8CYI0fQaVUFWCtX5PCRTGObXmIRjxvE7P8wvB
	q3cMpjKeE5WAMGLxU9+KgDWFPRAPP01zBevC+iOikRTDmpYsGJTu3de4KFbCkOIVVY9wQ6Y8/N6kE
	AChV8SbA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqna9-0004Yj-5d; Sun, 20 Dec 2020 01:32:21 +0000
Received: from mail-bn8nam11olkn2043.outbound.protection.outlook.com
 ([40.92.20.43] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqna6-0004YE-Fw
 for ath10k@lists.infradead.org; Sun, 20 Dec 2020 01:32:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lTf4I+4qg8eXsmvZKbSKW68yNtZcfsMiOQS1PPlT6TiYRZjd4j0LnvfzhcsYppy17BhbnPTxDYIO+XaEd0u7wWASGnAsG0h0Xh0+FFThfegDArLJ3PR5q/ork3JIYttEGt3Ct0wmduHFYJdT0I/EBy5VcbvQ80OMwon9RJJW0tS6HZZny2PbWcRijjYu13OBdt019uhxhMMYeH+6zM31TDUh8UywW8O4/40+YJY9MhRxLRw3b41ts6uZgTwTAzc1ypddJIhatrQhlIHkPSAiM846mjcd0p5DNwB3O5qZdCn8XNMdvAgpE6mJ2Y3DzOmK1Lwx32Ic1KklWjwuSEN+mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V/lRAILQlqxmGiAppol6UwU2z2Cc18OpmM1LSa7Jqc8=;
 b=jLFOk9+IDXg9XD0zhfGcM85PPx3dquukkmxs86Ae7RNzdAaeUfL8tUP6UQRa5Hgcfi0lgQunUDZP60coDObMmeEGUdZ6r6tRyLY6Lxhq0/f3pJOznHdIILU3g1oCO2ZurWR0DIkTYYyC7q/DJtWzv5+/BQxQtB5znHLKOxKsPI70FMIEV092kadsMXXWNmFw+rr4RI2yX5vCS7jAgykJSQcrYcvY6BZ/L6TP4TsgNFpOGqo7yazAZ0zIbsmvROKmMrxfIjuM/wS5rsGZcWDwdgQngI7aX0abRQq0L1hqtScC6YSdBPhq26B76C9Xn6l5WM6WqNNtwcMXikJS1tLHlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V/lRAILQlqxmGiAppol6UwU2z2Cc18OpmM1LSa7Jqc8=;
 b=kF5bQCPjmvrUjKRI9QRDnuP6x/iD4YN0tLQ73VU1Pzt59mvKC4XdsRi/B78OiTt9IKnYHOCOdq5Tn6UIlpW6ASvk5xRFcrHfWzkfxwXcBxM8X00qoWUKnwj1UgULyvm9X0burZWiiczRdnmoSJfcs2dr6b+OBU0fp7qVB99SNpWGWlWE+6Kc3qVFmIPk2q+HT2JBnYtidlWFemAB0pde71AD6Gr6sPi7kxM6lgiEgBQCecrB/rW2VlqwQKpCJM0fywlbnM+1p7iIo/j7WnPJUvNFPNLhQVgDPo05hSYmEHm1E/8gdgBjGrAZ+/WUSgnOp9Bg/tWaKMQAB7G5PhMHDw==
Received: from BN8NAM11FT040.eop-nam11.prod.protection.outlook.com
 (2a01:111:e400:fc4b::49) by
 BN8NAM11HT207.eop-nam11.prod.protection.outlook.com (2a01:111:e400:fc4b::208)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.25; Sun, 20 Dec
 2020 01:32:16 +0000
Received: from MWHPR0701MB3835.namprd07.prod.outlook.com
 (2a01:111:e400:fc4b::43) by BN8NAM11FT040.mail.protection.outlook.com
 (2a01:111:e400:fc4b::422) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.25 via Frontend
 Transport; Sun, 20 Dec 2020 01:32:16 +0000
Received: from MWHPR0701MB3835.namprd07.prod.outlook.com
 ([fe80::f4e1:e8b5:f6c6:ae7f]) by MWHPR0701MB3835.namprd07.prod.outlook.com
 ([fe80::f4e1:e8b5:f6c6:ae7f%7]) with mapi id 15.20.3676.030; Sun, 20 Dec 2020
 01:32:16 +0000
From: Julian Phillips <jules_stix@hotmail.com>
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Subject: Re: [PATCH] Revert "ath: add support for special 0x0 regulatory
 domain"
Thread-Topic: [PATCH] Revert "ath: add support for special 0x0 regulatory
 domain"
Thread-Index: AQHWqJfg30G8jjK+70+/yavoDTFC3amuqIdegAEglACAABlMAIBPqgFe
Date: Sun, 20 Dec 2020 01:32:16 +0000
Message-ID: <MWHPR0701MB383594824907C78036963365E3C10@MWHPR0701MB3835.namprd07.prod.outlook.com>
References: <20201022172113.GA1367233@capeo.gueux.org>
 <CANe27jKpYm29QOjYOZ_jwHiRxuWx66J+th8-zgbXK4geiCU0_Q@mail.gmail.com>
 <20201029140616.GG515433@capeo.gueux.org>
 <CANe27j+fur52HydqqzLc2hBV3QwC2La8+RTJcV=5W5LkUr=PqQ@mail.gmail.com>,
 <20201030085102.GA2137481@capeo.gueux.org>
In-Reply-To: <20201030085102.GA2137481@capeo.gueux.org>
Accept-Language: en-CA, en-US
Content-Language: en-CA
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:4165B130553EB3FF42F5AE2DE5FDD3B94758FD2BFF3EDA060AD9F634DCB3CE28;
 UpperCasedChecksum:9D9D94C2627BF4326ACB7E91EA3C535565B1F6C4630B6CE87D58CF3C7F8A99AB;
 SizeAsReceived:7159; Count:44
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [9Eng3kZ3gPQTryIl2ytOBKx5/IIsDdpx54U1EG7XlMw=]
x-ms-publictraffictype: Email
x-incomingheadercount: 44
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 46e83236-2818-4617-d019-08d8a48715cf
x-ms-traffictypediagnostic: BN8NAM11HT207:
x-ms-exchange-minimumurldomainage: infradead.org#7845
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ghJLnC59+PHPZuDWQFF1Qg4wuWWQx+cuVh9CVKB7cVLkSbCm5j33KjwmVeaU+1ZbmGBQe/tGn5dCvRgVFIVt13+FfkNf7CWzeUsuAjb6cNTWFmOc+JwsPUcPa6jfj5kuDlv5sUgc/0Iy6oR55sxQqx1GW0EULp+/2lUYBB2RQgvu/pLGA/Fb2vhBUJLQ/zHNLvXeHlbMHB56AR67F34q4WPkNc6Hf4LIynIdv6ww0oIR3yRsJ/YHN54qD6wO5dgmRtPlQDXjpcXSqcjSWbd3Ia+W1SymR1xPJKQm/uQmR4c=
x-ms-exchange-antispam-messagedata: HUKX5nn37HjW/M6QKLku4PMQa7dJ+sTCdHtKyoyj+ReRvRP3S+4UuvnFy0XH08/y71r7/oSyoxwPiKu56ou3zYIWpfteDbUg9edIgMFs1gWR43M3MnO7Uxp4m2qXoG3YgDLpooktf2z0zHX4lITtgg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT040.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 46e83236-2818-4617-d019-08d8a48715cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2020 01:32:16.6136 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8NAM11HT207
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201219_203218_628784_71461EE5 
X-CRM114-Status: GOOD (  24.23  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.29
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

4oCLSGVsbG8sCgpIYXMgYSBkZWNpc2lvbiBiZWVuIHJlYWNoZWQgYXMgdG8gd2hldGhlciBvciBu
b3QgdGhpcyBjb21taXQgd2lsbCBiZSByZXZlcnRlZD8gSXQgYXBwZWFycyB0byBzdGlsbCBleGlz
dCBpbiBrZXJuZWwgNS4xMC4gCgpJIHRvbyBoYXZlIGEgQ29tcGV4IFdMRTkwMFZYIFFDQTk4Nngv
OTg4eCA4MDIuMTFhYyBjYXJkIGFuZCBhbSBhZmZlY3RlZC4gSSBwdXJjaGFzZWQgdGhlIGNhcmQg
ZnJvbSBTd2l0emVybGFuZCBhbmQgYW0gcnVubmluZyBpdCBpbiBDYW5hZGEuCgpJJ3ZlIGJlZW4g
dXNpbmcgdGhlIHY1LjQgTFRTIGtlcm5lbCBhcyBhIHRlbXBvcmFyeSB3b3JrYXJvdW5kLCBidXQg
Z2l2ZW4gNS4xMCB3aWxsIGJlIHRoZSBuZXh0IExUUyBpdCB3b3VsZCBiZSBoZWxwZnVsIHRvIGhh
dmUgYSBkZWZpbml0aXZlIGFuc3dlciBvbmUgd2F5IG9yIGFub3RoZXIgb24gdGhpcyBpc3N1ZSBz
byB0aG9zZSBvZiB1cyB3aG8gYXJlIGFmZmVjdGVkIGNhbiBwbGFuIGFjY29yZGluZ2x5LgoKVGhl
IGxhc3QgdXBkYXRlIEknbSBhd2FyZSBvZiBpcyBBbHZpbidzIGFyZ3VtZW50IHRvIHJldmVydCB0
aGUgcGF0Y2g6IGh0dHBzOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9waXBlcm1haWwvYXRoMTBrLzIw
MjAtT2N0b2Jlci8wMTIwNDkuaHRtbCAuCgpLaW5kIHJlZ2FyZHMsCkp1bGlhbgrigIsKCkZyb206
IGF0aDEwayA8YXRoMTBrLWJvdW5jZXNAbGlzdHMuaW5mcmFkZWFkLm9yZz4gb24gYmVoYWxmIG9m
IEbDqWxpeCBTaXBtYSA8ZmVsaXgra2VybmVsQGd1ZXV4Lm9yZz4KU2VudDogT2N0b2JlciAzMCwg
MjAyMCA4OjUxIEFNClRvOiBKb3VuaSBNYWxpbmVuIDxqa21hbGluZW5AZ21haWwuY29tPgpDYzog
YXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcgPGF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnPgpT
dWJqZWN0OiBSZTogW1BBVENIXSBSZXZlcnQgImF0aDogYWRkIHN1cHBvcnQgZm9yIHNwZWNpYWwg
MHgwIHJlZ3VsYXRvcnkgZG9tYWluIiAKwqAKT24gMjAyMC0xMC0zMCAwOToyMCswMjAwLCBKb3Vu
aSBNYWxpbmVuIHdyb3RlOgo+T24gVGh1LCBPY3QgMjksIDIwMjAgYXQgNDowNiBQTSBGw6lsaXgg
U2lwbWEgPGZlbGl4K2tlcm5lbEBndWV1eC5vcmc+IHdyb3RlOgo+PiBJIG1hZGUgYSBkZXRhaWxl
ZCByZXBvcnQsIHdpdGggZG1lc2cgb3V0cHV0cyBvZiBkaWZmZXJlbnQKPj4ga2VybmVsL2Zpcm13
YXJlLWF0aGVyb3MgYW5kIHdpcmVsZXNzLXJlZ2RiIGNvbWJpbmF0aW9ucyBhdAo+PiBodHRwczov
L2J1Z3MuZGViaWFuLm9yZy9jZ2ktYmluL2J1Z3JlcG9ydC5jZ2k/YnVnPTk3MDY3OQo+Cj5TbyB0
aGUgaXNzdWUgaXMgaW4gbm90IGJlaW5nIGFibGUgdG8gb3BlcmF0ZSBhbiBBUCBvbiB0aGUgNSBH
SHogYmFuZD8KClllcywgc29ycnkgZm9yIG5vdCBiZWluZyBjbGVhciBhYm91dCB0aGlzLgoKPlRo
YXQgc291bmRzIGxpa2UgdGhlIGV4cGVjdGVkIGJlaGF2aW9yIGZvciBhbnkgZGV2aWNlIHRoYXQg
aGFzIG5vdAo+YmVlbiBjYWxpYnJhdGVkIGFuZCBwcm92aXNpb25lZCBmb3IgYSBzcGVjaWZpYyBj
b3VudHJ5IHdoZXJlCj5yZWd1bGF0b3J5IHJ1bGVzIGFsbG93IG9wZXJhdGlvbiBvbiB0aGUgNSBH
SHogYmFuZC4gSSB1bmRlcnN0YW5kIHRoYXQKPnRoaXMgbWF5IGxvb2sgbGlrZSBhIHJlZ3Jlc3Np
b24gc2luY2UgdGhlIGNvbW1pdCByZW1vdmVkCj5mdW5jdGlvbmFsaXR5LCBidXQgaXQgZmVlbHMg
bGlrZSBhIGJ1ZyBmaXggdG8gbWUgc2luY2UgdGhhdAo+ZnVuY3Rpb25hbGl0eSBzaG91bGQgbm90
IGhhdmUgYmVlbiBlbmFibGVkIGJ5IGRlZmF1bHQgaW4gdGhlIGZpcnN0Cj5wbGFjZS4gVGhlIGdv
YWwgaGVyZSBpcyB0byBhdm9pZCBpbmFwcHJvcHJpYXRlIG9wZXJhdGlvbiBvbiB0aGUgYmFuZAo+
d2l0aG91dCBleHBsaWNpdCBjb25maWd1cmF0aW9uIHRvIGVuYWJsZSBzdWNoIG9wZXJhdGlvbi4g
SW4gQVAKPmRldmljZXMsIHRoZSBkZXZpY2Ugc2hvdWxkIGhhdmUgYmVlbiBwcm92aXNpb25lZCBm
b3IgYSBzcGVjaWZpYwo+Y291bnRyeSB0byBiZSBhYmxlIHRvIGVuZm9yY2UgdGhlIGNvcnJlY3Qg
ZnJlcXVlbmN5IHJhbmdlCj5yZXN0cmljdGlvbnMuIFRoZSBzYWZlIGRlZmF1bHQgZm9yIGEgZGV2
aWNlIHRoYXQgZG9lcyBub3QgaGF2ZSBzdWNoCj5leHBsaWNpdCBjb25maWd1cmF0aW9uIHdpdGhp
biB0aGUgV0xBTiBjb21wb25lbnQgaXRzZWxmIGlzIHRvIHVzZSB0aGUKPndvcmxkIHJvYW1pbmcg
bW9kZSB3aGljaCBwcmV2ZW50cyBpbml0aWFsaXphdGlvbiBvZiByYWRpYXRpb24gKGkuZS4sCj5k
b2VzIG5vdCBhbGxvdyBBUCBtb2RlIHRvIGJlIHN0YXJ0ZWQgYnV0IGFsbG93cyBzdGF0aW9uIG1v
ZGUgb3BlcmF0aW9uCj50byBjb25uZWN0IHRvIGFuIGFscmVhZHkgc3RhcnRlZCBBUCkgb24gdGhl
IDUgR0h6IGJhbmQuCgpTbywgaWYgSSB1bmRlcnN0YW5kIHdlbGwsIHRoZSBuZXcgYmVoYXZpb3Vy
IChub24gd29ya2luZyBBUCB3aXRoIGFjKSBpcyAKZXhwZWN0ZWQsIGdpdmVuIHRoYXQgdGhlIGRl
dmljZSB3YXMgbm90IHByb3Zpc2lvbmVkIHdpdGggdGhlIHNldHRpbmdzIApzcGVjaWZpY3MgdG8g
bXkgem9uZT8gQW5kIHRvIHByZXZlbnQgcGVvcGxlIGZyb20gb3BlcmF0aW5nIGFuIEFQIHdpdGgg
CnRoZSB3cm9uZyBzZXR0aW5ncywgd2UgZm9yY2UgdGhlbSB0byB1c2UgaGFyZHdhcmUgdGhhdCBp
cyBzcGVjaWZpYyB0byAKdGhlaXIgem9uZT8gSWYgdGhhdCdzIHRoZSBpbnRlbnRpb24sIEknbSBu
b3Qgc3VyZSBpdCBpcyB2ZXJ5IGVmZmVjdGl2ZTogCkkgY2FuIHN0aWxsIGJ1eSBhIEdlcm1hbiB3
aWZpIGNhcmQgYW5kIHVzZSBpdCBpbiBGcmFuY2UuIEl0IHdpbGwgCnByb2JhYmx5IHN1aXRzIG1v
c3Qgb2YgdGhlIGhhcmR3YXJlIHZlbmRvcnMsIHRob3VnaDogcGVvcGxlIG1vdmluZyB0byAKYW5v
dGhlciBjb3VudHJ5IGFyZSBmb3JjZWQgdG8gYnV5IG5ldyBzdHVmZiBhbmQgdGhleSBjYW4ndCBi
dXkgY2hlYXBlciAKc3R1ZmYgYWJyb2FkLCBidXQsIHNlZW4gZnJvbSBhbm90aGVyIGFuZ2xlLCBp
dCBzb3VuZHMgbGlrZSBwbGFubmVkIApvYnNvbGVzY2VuY2UuCgpUaGUgdmVuZG9yIG9mIG15IChu
ZXcpIGhhcmR3YXJlIGlzIGZyb20gU3dpdHplcmxhbmQsIGFuZCBpcyBzZWxsaW5nIHRvIAooYXQg
bGVhc3QpIGV2ZXJ5d2hlcmUgaW4gRXVyb3BlLCBhbmQgdGhleSBzZWxsIHRoZSBzYW1lIGhhcmR3
YXJlICh0aGF0IAp1c2VkIHRvIHdvcmspIGZvciBldmVyeWJvZHkuIFNvLCBub3csIHRoZXkgYXJl
IHN1cHBvc2VkIHRvIHNlbGwgCnNwZWNpZmljIGhhcmR3YXJlIGZvciBlYWNoIGNvdW50cnk/IEkg
dGhpbmsgdGhlIGNhcmQgd2FzIG5vdCAKcHJvdmlzaW9uZWQgd2l0aCBhIHNwZWNpZmljIGNvdW50
cnkgKEknbSBpbiBGcmFuY2UsIGFuZCBJIHRyaWVkIEZSLCBDSCwgClVTLMKgIC4uLiksIHNvIEkg
Z3Vlc3MgSSBoYXZlIHRvIHRocm93IGl0IHRvIHRoZSBiaW4gYW55d2F5IChhbmQgdGhleSAKc2hv
dWxkIGRvIHRoZSBzYW1lIHdpdGggYWxsIHRoZWlyIHN0b2NrcykuCgpJIGhvcGUgSSBoYXZlIG1p
c3VuZGVyc3Rvb2QgeW91ciBtZXNzYWdlLCBlbHNlIEkgaGF2ZSB0byBhZG1pdCBJJ20gYSAKbGl0
dGxlIGRpc2FwcG9pbnRlZC4uLiBUaGFua3MgZm9yIHlvdXIgZXhwbGFuYXRpb24sIHRob3VnaCEK
CklmIHRoYXQncyByZWFsbHkgdGhlIGludGVudGlvbiwgaXMgdGhlcmUgYSB3b3JrYXJvdW5kIGZv
ciBpcnJlc3BvbnNpYmxlIApwZW9wbGUgbGlrZSBtZSwgd2hvIGp1c3Qgd2FuJ3QgdG8gYXZvaWQg
YnV5aW5nIG5ldyBzdHVmZj8KClJlZ2FyZHMsCgotLSAKRsOpbGl4Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBr
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hdGgxMGsK
