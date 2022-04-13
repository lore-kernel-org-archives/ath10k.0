Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6489C433EF
	for <ath10k@archiver.kernel.org>; Wed, 13 Apr 2022 09:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lj88oQGzCWYE32/JkmpBsTNBASXSXqbZI/FUjPYNOjI=; b=Qn2xyVww1I3NmN
	nUnq/xK+6cpLGJq6CF0ZtxbRyeO5tgnRQWCE2kdVf4sXzR1o5TwS4TqTz0TjWoYOWHhGEqAr0Nfsj
	lnvls5TaGVjkSQokfj9ujFTbIlKfPMpKpHmyJVFvVVZF5jVYL6nkPAE9Rq4BYRTNs26PcASZOgR9p
	tKKsz5CTsQSDkQYDZxZqYiJVdHvlWDWd6t9h2pWUMJxe7mSdsYsfO+MCOO7dvbWIf42cwG1o73QOE
	ZsBLv51b2WVfG4OWiIj5DYnJnZW0iN3RQBb2mbhaLjK3BHX773YWMHt7DIvdUcL9P+YxADlZjGSDO
	/cXRFZVY4986/zkYdrGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neYtD-000D4T-Nz; Wed, 13 Apr 2022 09:02:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neYtB-000D46-AR
 for ath10k@lists.infradead.org; Wed, 13 Apr 2022 09:02:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7CA9261A8B;
 Wed, 13 Apr 2022 09:02:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23A07C385A3;
 Wed, 13 Apr 2022 09:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649840531;
 bh=A+KEmqGD5HjzFZt3wo53bxpbY5EtGbNqU5hyP49uAoQ=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=cHMm+WWJnbaE1Sb6Rsl814+v+I+wHoADqT6USEmDxkwmbxFYueOPKnIL0Kx2dtxmr
 3V+u2t7KjQ0fuMF6w4zNhA15giqi2O5AUtdd4b2gAD2e5e2/MbxS1m/LHhH/4qbSj9
 Sp6iz6FgBPt/p6HIGY5Opx+FcuDVeNpa1AGnoz7OfteYOhGtSicdzCyPMCmA5ch2Aj
 942Y1UJXlgV1TsFfYuMEFJZ9V4LZYW0MrsJwwYPM3lqyzdIRLbQVsNy/nkZkRvOVUg
 QazX7HKrd4O6PqRD9o4baKSy3jQpZDSicTI6yi8ya4cTwh/KzuiBYG9F1sDW7ClZ0a
 jW8Zn6HZWUfCw==
From: Kalle Valo <kvalo@kernel.org>
To: Christian Lamparter <chunkeey@gmail.com>
Cc: Hans Geiblinger <cybrnook2002@yahoo.com>,
 "ath10k\@lists.infradead.org" <ath10k@lists.infradead.org>
Subject: Re: [v2] ath10k-firmware: QCA9888 hw1.0: Add Linksys MR8300 V1.0
 specific BDFs
References: <836543238.4244780.1600533511769.ref@mail.yahoo.com>
 <836543238.4244780.1600533511769@mail.yahoo.com>
 <87mtjp9o58.fsf@kernel.org>
 <078ed972-edb9-5611-6757-a8a907b7a6b8@gmail.com>
Date: Wed, 13 Apr 2022 12:02:07 +0300
In-Reply-To: <078ed972-edb9-5611-6757-a8a907b7a6b8@gmail.com> (Christian
 Lamparter's message of "Sun, 20 Feb 2022 01:06:48 +0100")
Message-ID: <8735ihmk4w.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_020213_438903_4853850C 
X-CRM114-Status: GOOD (  15.08  )
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

Q2hyaXN0aWFuIExhbXBhcnRlciA8Y2h1bmtlZXlAZ21haWwuY29tPiB3cml0ZXM6Cgo+IEhpLAo+
Cj4gT24gMjEvMDEvMjAyMiAxNTowOSwgS2FsbGUgVmFsbyB3cm90ZToKPj4gSGFucyBHZWlibGlu
Z2VyIDxjeWJybm9vazIwMDJAeWFob28uY29tPiB3cml0ZXM6Cj4+Cj4+PiBUaGUgc3VwcG9ydCBm
b3IgdGhpcyBkZXZpY2UgaXMgY3VycmVudGx5IGJlaW5nIGFkZGVkIGludG8gT3BlbldydC4gVGhp
cyBBUCByZXF1aXJlcwo+Pj4gdHdvIHNwZWNpYWwgQkRGcyB0byBnZXQgdGhlIFdpLUZpIFBIWXMg
d29ya2luZyAoY29ycmVjdGx5KS4KPj4+Cj4+Pgo+Pj4gKiBkZXNjcmlwdGlvbiBmb3Igd2hhdCBo
YXJkd2FyZSB0aGlzIGlzOgo+Pj4gIMKgIMKgLSBpdCBpcyBhIFFDQTk4ODggYmFzZWQgcmFkaW8g
dXNlZCBmb3IgNUdoego+Pj4KPj4+Cj4+PiAqIG9yaWdpbiBvZiB0aGUgYm9hcmQgZmlsZQo+Pj4g
IMKgIMKgLSBib2FyZGRhdGEgZmlsZXMgd2VyZSB0YWtlbiBmcm9tIE9FTSBMaW5rc3lzIEZXX01S
ODMwMF8xLjEuNy4yMDEyODFfcHJvZC5pbWcKPj4+Cj4+Pgo+Pj4gKiBpZHMgdG8gYmUgdXNlZCB3
aXRoIHRoZSBib2FyZCBmaWxlCj4+PiAgwqAgwqAtIFFDQTk4ODggaHcxLjAKPj4+ICDCoCDCoCDC
oCvCoGJ1cz1wY2ksYm1pLWNoaXAtaWQ9MCxibWktYm9hcmQtaWQ9MjMsdmFyaWFudD1saW5rc3lz
LW1yODMwMC12MC1mY2MKPj4+ICDCoCDCoCDCoE1ENTrCoDFmMjYzYzUyZTc4NjJiY2NhYjZmZDY1
NTEwOTIwNzdjCj4+Pgo+Pj4KPj4+ICogYXR0YWNoIHRoZSBhY3R1YWwgYm9hcmQgZmlsZQo+Pj4g
IMKgIMKgLSBUaGUgbmFtZSBvZiB0aGUgZmlsZXMgYXJlIGVxdWFsIHRvIHRoZSBpZCBzdHJpbmcg
aW4gdGhlCj4+PiBib2FyZC0yLmJpbiAobWludXMgdGhlICIuYmluIikKPj4KPj4gVGhhbmtzLCBh
ZGRlZCB0byBRQ0E5OTg0L2h3MS4wL2JvYXJkLTIuYmluOgo+Cj4gT2guLi4gSSBqdXN0IG5vdGlj
ZWQuIEkgdGhpbmsgdGhpcyBnb3QgbWlzcGxhY2VkIGludG8KPiBRQ0E5OTg0J3MgYm9hcmQtMi5i
aW4uIEJ1dCB0aGlzIHdhcyBmb3IgdGhlIFFDQTk4ODgodjIpLiA6KAoKT2gsIHNvcnJ5IGFib3V0
IHRoYXQuIFZlcnkgZ29vZCB0aGF0IHlvdSBub3RpY2VkIGl0ISBJIHN0aWxsIG1hbnVhbGx5CmNo
b29zZSB0aGUgZGlyZWN0b3J5IHNvIG1pc3Rha2VzIGNhbiBoYXBwZW4uCgpCVFcsIHRoZSBzdWJq
ZWN0IHNob3VsZCBoYXZlIGh3Mi4wIGluc3RlYWQgb2YgaHcxLjAuCgo+IFdlbGwsIGF0IGxlYXN0
IHRoZXJlIHNob3VsZG4ndCBiZSBhbnkgY29uZmxpY3RzLgo+IFNob3VsZCBJIHJlc2VuZCB0aGUg
TGlua3N5cyBNUjgzMDAncyBib2FyZCBmaWxlcyBhbmQKPiBhZGQgdGhhdCBhcyBhIG5vdGUgZm9y
IHlvdXIgbmV4dCByb3VuZD8KCk5vIG5lZWQgdG8gcmVzZW5kLCBJIGZpeGVkIGl0IG1hbnVhbGx5
IG5vdy4gUGxlYXNlIGRvdWJsZSBjaGVjazoKCmh0dHBzOi8vZ2l0aHViLmNvbS9rdmFsby9hdGgx
MGstZmlybXdhcmUvY29tbWl0L2I4MGYxYzUyMWUzYzQwNmYzMDE4YWEyYjJiMzQ4YjQ5NWI1MWYw
ZjMKCi0tIApodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtd2lyZWxl
c3MvbGlzdC8KCmh0dHBzOi8vd2lyZWxlc3Mud2lraS5rZXJuZWwub3JnL2VuL2RldmVsb3BlcnMv
ZG9jdW1lbnRhdGlvbi9zdWJtaXR0aW5ncGF0Y2hlcwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2F0aDEwawo=
