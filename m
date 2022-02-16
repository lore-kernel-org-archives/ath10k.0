Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 227BFC433EF
	for <ath10k@archiver.kernel.org>; Wed, 16 Feb 2022 13:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bb3IvLXdH4AKMcM5nwxP4SV7yei4009mMtdobT5BdHE=; b=SZQO1rBfJ4515N
	F2umz61TqTESbctghVQg9yrLpy2AXxkQdpxU+hZufDf4X5EPAxpY6bhUA/1lnNXliya1ixypoB9fd
	Vz0zQq8gAIseWex8PXHPFhZ0y99MKgU2nYU7YuNacjRcPMw8wxVqrTxSwD7MT9K7xBh9/9p79sEKY
	8jAHfCLwvbCrYWtdvnZRMTY7x0kQJh1Sq5oIvUbaG4LSNgNbw9AAJFxvS36+V2ts3rTNjb+u/R0dd
	La3Dxu/w/eOI/zntlyqqYDS5pa4P0BYxjwl+uFBY6mZReMCG9PMpBY2J6fzcZ+5L1C9saB9orfUc+
	ldoahlY4b/g27Bn80L0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKKWP-007Eqs-5b; Wed, 16 Feb 2022 13:39:05 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKKWM-007Epk-57
 for ath10k@lists.infradead.org; Wed, 16 Feb 2022 13:39:03 +0000
Received: by mail-qt1-x834.google.com with SMTP id b5so2017636qtq.11
 for <ath10k@lists.infradead.org>; Wed, 16 Feb 2022 05:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=21ndo1beMI8yP0ftAH82Ak+ucIbbctFR1VliNX6f60o=;
 b=Pm6qW+nuN1Uscn8S8rNAsFZPUQCquHw2f7nLd8iiWgi1VBSYRM2MCpojTcqJd6JGWP
 Qn6+Mhh+yJ7QYCvD2cL85h2KQWAIDAgPdl+C/PJm7TrM1mGRrGIkcK55unvVnEXXSvCp
 5L+l0XMcRAy+qoA9kFlvsTxMjOuHlP6V9vim/UxLN4CQQnPQtDbtyV6YogCzj9aoGue1
 O3a798PeDhuFGsJigaZ1H89jQur/b6F2mMy8mb6e29f4zzeSj4ALIEnXeqzuX13TJzgc
 J/MI5xXKQktWxXNgOsATslG7t/632uO8wyQ6HGRZL7EoFWNwMB7KyFUFU9+ojzqzEYUz
 LHRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=21ndo1beMI8yP0ftAH82Ak+ucIbbctFR1VliNX6f60o=;
 b=g9GDqnFM19sCWWIvWy4nzorfqfEHdvgyANWlP4yS4QkSybgkFC0jnXIOE/b91N4qPb
 EVBB7dabRR/+8pSY0DM1bdwqIWk+tqWXN+PFRdEQ2000bMqcie4XX7lOf46dllZ8apic
 AGmo5Cfe9b9FbZ7e4JSyRc1qrxRvxpiPEH83nQTIy6w6Nwq6NfxchSB8C1XdBvA4xH+V
 67N6Vbrzx+iY3g27k//6OP1mWf5gWQbVYuq+zmc4fTNm8HprrKnsyhsuHQEFaQ7hALO5
 xnuXPZDsBZ7LjCAJ2DpiaMkhQoZwGWN1KANr8oBhW2G6tkuZDqrM/y8pPeYcMXm2xqaw
 U/9w==
X-Gm-Message-State: AOAM531sGuhMr1BBT0vx4HtjNL2XZs8lHDZdW0Ld3sZZAMyKNgjuepIx
 MYupRCo7wLTQOxpmEPWMgS8L2VNnEz9J2hsyfhE=
X-Google-Smtp-Source: ABdhPJyFM58ntAw5nr1wH2+4e/Yx3d3h4s3txaYAHeouEPQwV8TP0rj6/pEZ9BuQyKT3p261yqWE5gmV5yn5L4GB6N0=
X-Received: by 2002:a05:622a:d0:b0:2d5:50c1:67a6 with SMTP id
 p16-20020a05622a00d000b002d550c167a6mr1898200qtw.297.1645018740038; Wed, 16
 Feb 2022 05:39:00 -0800 (PST)
MIME-Version: 1.0
References: <20211009221711.2315352-1-robimarko@gmail.com>
 <163890036783.24891.8718291787865192280.kvalo@kernel.org>
 <CAOX2RU5mqUfPRDsQNSpVPdiz6sE_68KN5Ae+2bC_t1cQzdzgTA@mail.gmail.com>
 <09a27912-9ea4-fe75-df72-41ba0fa5fd4e@gmail.com>
 <CAOX2RU6qaZ7NkeRe1bukgH6OxXOPvJS=z9PRp=UYAxMfzwD2oQ@mail.gmail.com>
 <EC2778B3-B957-4F3F-B299-CC18805F8381@slashdirt.org>
 <CAOX2RU7FOdSuo2Jgo0i=8e-4bJwq7ahvQxLzQv_zNCz2HCTBwA@mail.gmail.com>
In-Reply-To: <CAOX2RU7FOdSuo2Jgo0i=8e-4bJwq7ahvQxLzQv_zNCz2HCTBwA@mail.gmail.com>
From: Robert Marko <robimarko@gmail.com>
Date: Wed, 16 Feb 2022 14:38:48 +0100
Message-ID: <CAOX2RU7d9amMseczgp-PRzdOvrgBO4ZFM_+hTRSevCU85qT=kA@mail.gmail.com>
Subject: Re: [PATCH] ath10k: support bus and device specific API 1 BDF
 selection
To: Thibaut <hacks@slashdirt.org>
Cc: Christian Lamparter <chunkeey@gmail.com>, Kalle Valo <kvalo@kernel.org>,
 kvalo@codeaurora.org, 
 davem@davemloft.net, kuba@kernel.org, ath10k@lists.infradead.org, 
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org, 
 open list <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_053902_217613_CD8B3547 
X-CRM114-Status: GOOD (  23.62  )
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

U2lsZW50IHBpbmcsCgpEb2VzIGFueWJvZHkgaGF2ZSBhbiBvcGluaW9uIG9uIHRoaXM/CgpSZWdh
cmRzLApSb2JlcnQKCk9uIFdlZCwgMiBGZWIgMjAyMiBhdCAxOTo0OSwgUm9iZXJ0IE1hcmtvIDxy
b2JpbWFya29AZ21haWwuY29tPiB3cm90ZToKPgo+IEthbGxlLAo+Cj4gV2hhdCBpcyB5b3VyIG9w
aW5pb24gb24gdGhpcz8KPiBJIHdvdWxkIHJlYWxseSBsb3ZlIHRvIHNlZSB0aGlzIGdldCBtZXJn
ZWQgYXMgd2UgYXJlIGhhdmluZyBtb3JlIGFuZAo+IG1vcmUgZGV2aWNlcyB0aGF0IGFyZSBpbXBh
Y3RlZCB3aXRob3V0IGl0Lgo+Cj4gUmVnYXJkcywKPiBSb2JlcnQKPgo+IE9uIEZyaSwgMTcgRGVj
IDIwMjEgYXQgMTM6MjUsIFRoaWJhdXQgPGhhY2tzQHNsYXNoZGlydC5vcmc+IHdyb3RlOgo+ID4K
PiA+Cj4gPgo+ID4gPiBMZSAxNyBkw6ljLiAyMDIxIMOgIDEzOjA2LCBSb2JlcnQgTWFya28gPHJv
YmltYXJrb0BnbWFpbC5jb20+IGEgw6ljcml0IDoKPiA+ID4KPiA+ID4gT24gV2VkLCA4IERlYyAy
MDIxIGF0IDE1OjA3LCBDaHJpc3RpYW4gTGFtcGFydGVyIDxjaHVua2VleUBnbWFpbC5jb20+IHdy
b3RlOgo+ID4gPj4KPiA+ID4+IElzbid0IHRoZSBvbmx5IHVzZXIgb2YgdGhpcyB0aGUgbm9uLXVw
c3RyZWFtYWJsZSByYl9oYXJkY29uZmlnCj4gPiA+PiBtaWtyb3RpayBwbGF0Zm9ybSBkcml2ZXI/
Cj4gPgo+ID4gVGhlIGRyaXZlciBjb3VsZCBiZSB1cHN0cmVhbWVkIGlmIGRlc2lyYWJsZS4KPiA+
IFlldCBJIHRoaW5rIGl04oCZcyBxdWl0ZSBvcnRob2dvbmFsIHRvIGhhdmluZyB0aGUgcG9zc2li
aWxpdHkgdG8gZHluYW1pY2FsbHkgbG9hZCBhIGRpZmZlcmVudCBCREYgdmlhIEFQSSAxIGZvciBl
YWNoIGF2YWlsYWJsZSByYWRpbywgd2hpY2ggYmVmb3JlIHRoaXMgcGF0Y2ggY291bGRu4oCZdCBi
ZSBkb25lIGFuZCBpcyBuZWNlc3NhcnkgZm9yIHRoaXMgcGFydGljdWxhciBoYXJkd2FyZS4KPiA+
Cj4gPiA+PiBTbywgaW4geW91ciBjYXNlIHRoZSBkZXZpY2VzIGluIHF1ZXN0aW9uCj4gPiA+PiBu
ZWVkcyB0byBzZXR1cCBhIGRldG91ciB0aHJvdWdoIHRoZSB1c2Vyc3BhY2UgZmlybXdhcmUgKGhl
bHBlcitzY3JpcHRzKQo+ID4gPj4gdG8gcHVsbCBvbiB0aGUgc3lzZnMgb2YgdGhhdCBtaWtyb3Rp
ayBwbGF0Zm9ybSBkcml2ZXI/IFdvdWxkbid0IGl0Cj4gPiA+PiBiZSBwb3NzaWJsZSB0byBkbyB0
aGlzIG1vcmUgZGlyZWN0bHk/Cj4gPiA+Cj4gPiA+IFllcywgaXRzIHRoZSBzb2xlIGN1cnJlbnQg
dXNlciBhcyBpdHMgdGhlIG9ubHkgdmVuZG9yIHNoaXBwaW5nIHRoZSBCREYKPiA+ID4gYXMgcGFy
dCBvZiB0aGUKPiA+ID4gZmFjdG9yeSBkYXRhIGFuZCBub3QgbGlrZSBhIHVzZXJzcGFjZSBibG9i
Lgo+ID4gPgo+ID4gPiBJIGRvbid0IHNlZSBob3cgY2FuIGl0IGJlIG1vcmUgZGlyZWN0LCBpdHMg
dGhlIHNhbWUgc2V0dXAgYXMgd2hlbgo+ID4gPiBnZXR0aW5nIHByZS1jYWwKPiA+ID4gZGF0YSBm
b3IgbW9zdCBkZXZpY2VzIGN1cnJlbnRseS4KPiA+Cj4gPiBJbmRlZWQsIG5vdCBzdXJlIGhvdyBp
dCBjb3VsZCBiZSBtb3JlIGRpcmVjdCB0aGFuIGl0IGFscmVhZHkgaXMuIEnigJltIG9wZW4gdG8g
c3VnZ2VzdGlvbnMgdGhvdWdoLgo+ID4KPiA+ID4gSSBhbSBhZGRpbmcgVGhpYmF1dCB3aG8gaXMg
dGhlIGF1dGhvciBvZiB0aGUgcGxhdGZvcm0gZHJpdmVyLgo+ID4KPiA+IEJlc3QsCj4gPiBUaGli
YXV0CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgx
MGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
