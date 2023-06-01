Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30DC3C77B7A
	for <ath10k@archiver.kernel.org>; Thu,  1 Jun 2023 10:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YcWFCJFZhjMGs3A9XniobLryjq+fBoyFkrL/d7hjzo0=; b=tbggYrDn8r0RMo
	Nda8DVMBQFSoOJek1w8H3GkerUhSKRDPkIGxF4sWKccaPtmseUJPwTZfiOCuS23r6R/TPiNnZoDTn
	876At+xWOGaWCItzoKnE0uj8T0o9v4IXO0dVMylc1SZdRi95XB2dmBpg2WJNsVAIOIqVgGYzmUl6H
	7lE0O9mEPyFyN66yDQPGSS88H9J2RUoL+HCdUdpzhD+a/h9CPcS44fX8Luqi/mUGNs4yon5deywGV
	gZO196+HYZgGJNIrVTJaj37v35B4yCwPgcfQ5N6PPrwTv5hgY8Zde6MdsvccFB2K7SwGGBCHThXh1
	LQD9C/qKkCTCmWzyDyVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4fnF-0036XW-0H;
	Thu, 01 Jun 2023 10:44:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4fnC-0036WZ-0x
	for ath10k@lists.infradead.org;
	Thu, 01 Jun 2023 10:44:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E92A76436D;
	Thu,  1 Jun 2023 10:44:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C34AC433EF;
	Thu,  1 Jun 2023 10:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685616268;
	bh=bYp2io0uVTl+f+qPUizOw5UzogwUPAvYmR0vmqDhLS4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=G2Hx5V2r5FFcHtNRyoufeCN0O47XHgkfZ1TEc9ykqPyPxydM3nBiMMatnsVqEOpuO
	 gowNYFw9L6RDlSb/h800DsxkbIKIIl547DYwYCynn34kkoaMC/zZisfyJnYuuo8AMa
	 +qIIHYVKYs9hoiCLxc1hDoYveDldSX7ecQkdIP1mbtrPtZsy5AtGESWmSNDLuvhzFQ
	 Z67+3JHPBykyYmCLgNp7hX70zYPW31lthTZD9hj3MaeN0fUYIYEaOWR/WPQ9VhWpa9
	 8iKDHLkKQLOvTbQcRoLuYEw/kUAM03iuuakzvcGwvYt0Phg/Yi33FDWLUlxsJxDgXF
	 pY8pj+bnv2BAQ==
From: Kalle Valo <kvalo@kernel.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: netdev@vger.kernel.org,  linux-wireless@vger.kernel.org,  ath10k@lists.infradead.org,  Eric Dumazet <edumazet@google.com>,  kernel@pengutronix.de,  Jakub Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  "David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH net-next 0/4] Convert to platform remove callback returning void
References: <20230601082556.2738446-1-u.kleine-koenig@pengutronix.de>
	<87h6rrk0cn.fsf@kernel.org>
	<20230601093055.ovmhypa5jw2bq32q@pengutronix.de>
Date: Thu, 01 Jun 2023 13:44:24 +0300
In-Reply-To: <20230601093055.ovmhypa5jw2bq32q@pengutronix.de> ("Uwe
	\=\?utf-8\?Q\?Kleine-K\=C3\=B6nig\=22's\?\= message of "Thu, 1 Jun 2023 11:30:55
 +0200")
Message-ID: <874jnrjwc7.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_034430_394280_A5DE894D 
X-CRM114-Status: GOOD (  17.68  )
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

VXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4gd3JpdGVz
OgoKPiBIZWxsbyBLYWxsZSwKPgo+IE9uIFRodSwgSnVuIDAxLCAyMDIzIGF0IDEyOjE3OjQ0UE0g
KzAzMDAsIEthbGxlIFZhbG8gd3JvdGU6Cj4+IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1r
b2VuaWdAcGVuZ3V0cm9uaXguZGU+IHdyaXRlczoKPj4gCj4+ID4gdGhlIG1vdGl2YXRpb24gZm9y
IHRoaXMgc2VyaWVzIGlzIHBhdGNoICMzLCBwYXRjaCAjMiBpcyBhIHByZXBhcmF0aW9uIGZvciBp
dAo+PiA+IGFuZCBwYXRjaGVzICMxIGFuZCAjNCBhcmUganVzdCBjbGVhbnVwcyB0aGF0IEkgbm90
aWNlZCBlbiBwYXNzYW50Lgo+PiA+Cj4+ID4gQmVzdCByZWdhcmRzCj4+ID4gVXdlCj4+ID4KPj4g
PiBVd2UgS2xlaW5lLUvDtm5pZyAoNCk6Cj4+ID4gICBhdGgxMGs6IERyb3AgY2xlYW5pbmcgb2Yg
ZHJpdmVyIGRhdGEgZnJvbSBwcm9iZSBlcnJvciBwYXRoIGFuZCByZW1vdmUKPj4gPiAgIGF0aDEw
azogRHJvcCBjaGVja3MgdGhhdCBhcmUgYWx3YXlzIGZhbHNlCj4+ID4gICBhdGgxMGs6IENvbnZl
cnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCj4+ID4gICBhdGsx
MGs6IERvbid0IG9wZW5jb2RlIGF0aDEwa19wY2lfcHJpdigpIGluIGF0aDEwa19haGJfcHJpdigp
Cj4+ID4KPj4gPiAgZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9haGIuYyAgfCAyMCAr
KystLS0tLS0tLS0tLS0tLS0tLQo+PiA+ICBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBr
L3Nub2MuYyB8ICA4ICsrKy0tLS0tCj4+ID4gIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25z
KCspLCAyMiBkZWxldGlvbnMoLSkKPj4gCj4+IGF0aDEwayBwYXRjaGVzIGdvIHRvIG15IGF0aC5n
aXQgdHJlZSwgbm90IG5ldC1uZXh0Lgo+Cj4gVGhpcyBpc24ndCBvYnZpb3VzIGZvciBvdXRzaWRl
cnMuIE5vdCBzdXJlIHdoYXQgY2FuIGJlIGltcHJvdmVkIHRvCj4gbWFrZSB0aGlzIGVhc2llciB0
byBzcG90LgoKWWVhaCwgeW91IGFyZSBkZWZpbml0ZWx5IG5vdCB0aGUgZmlyc3Qgb25lIHdobyBp
cyBiaXR0ZW4gYnkgdGhpcy4gV2UgZG8KaGF2ZSB0aGUgdHJlZSBkb2N1bWVudGVkIGluIE1BSU5U
QUlORVJTIGJ1dCB0aGF0J3MgZWFzeSB0byBtaXNzOgoKUVVBTENPTU0gQVRIRVJPUyBBVEgxMEsg
V0lSRUxFU1MgRFJJVkVSCk06ICAgICAgS2FsbGUgVmFsbyA8a3ZhbG9Aa2VybmVsLm9yZz4KTDog
ICAgICBhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpTOiAgICAgIFN1cHBvcnRlZApXOiAgICAg
IGh0dHBzOi8vd2lyZWxlc3Mud2lraS5rZXJuZWwub3JnL2VuL3VzZXJzL0RyaXZlcnMvYXRoMTBr
ClQ6ICAgICAgZ2l0IGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dp
dC9rdmFsby9hdGguZ2l0CkY6ICAgICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L25ldC93aXJlbGVzcy9xY29tLGF0aDEway55YW1sCkY6ICAgICAgZHJpdmVycy9uZXQvd2lyZWxl
c3MvYXRoL2F0aDEway8KCkFuZCBhIHJ1bGUgb2YgdGh1bWIgaXMgdGhhdCBhbGwgd2lyZWxlc3Mg
cGF0Y2hlcyBkbyBub3JtYWxseSBnbyB0bwp3aXJlbGVzcyBvciB3aXJlbGVzcy1uZXh0IHRyZWVz
LCBhbmQgZm9yIG1vc3QgYWN0aXZlIHdpcmVsZXNzIGRyaXZlcnMgd2UKaGF2ZSBzZXBhcmF0ZSB0
cmVlcyBhcyB3ZWxsIChsaWtlIGF0aC5naXQgaW4gdGhpcyBjYXNlKS4KCi0tIApodHRwczovL3Bh
dGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtd2lyZWxlc3MvbGlzdC8KCmh0dHBzOi8v
d2lyZWxlc3Mud2lraS5rZXJuZWwub3JnL2VuL2RldmVsb3BlcnMvZG9jdW1lbnRhdGlvbi9zdWJt
aXR0aW5ncGF0Y2hlcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
