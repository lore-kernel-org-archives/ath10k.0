Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8960AC433EF
	for <ath10k@archiver.kernel.org>; Wed, 20 Jul 2022 10:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/tNsXSrtiCOndeDYh/Af1CxDph2T/WPs9Jn5lEpskL0=; b=idULbL0jbSeIuG
	vEQBb2IflZn7851uPeQpVlDmKRZqp/czKqF4zJQOlsrIfA9KJSR6FxPAMJ438sSeruMHDsEmpOnsu
	/RTJq9hLbieaxttdBKwJMF0J56qrJ0jxvT6iAuK8S3+SoHM5ZwQxk5F7XlBAydiA/ZqlAdsr1MSdL
	4IYrWY0WyuHokHrI583sNBK+ZnBd9yuAySsAlas7K274rZUX3HtJ/zvjHRME1ScqTnpqqUmdarXjz
	lWLNhpmmkVy1BZ3rxdLa5pad0tU2jwK4CN0V1/Y/QWoVOMX4pdUZ6s0gzY6zA9wQwUSvQZKueOGa0
	E8EcXjBR1MDGfaXNGAkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oE7QH-004KyI-QU; Wed, 20 Jul 2022 10:59:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oE7QE-004KxF-93
	for ath10k@lists.infradead.org; Wed, 20 Jul 2022 10:59:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658314755;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L3tIBK3odCi2wiUtSPbriFkXsk8gcjLDaLnSU7OmMoI=;
	b=RHTKkCBaFxVzqFLjMwnsxJKAEFFTumJ9tXL+zCN8ZxBYGZe7SeBpQJLszuZ/QugYX7/0Z0
	n5RZ2hmXFxFRNCG1YXL6K/X2Mqs/ChuhXRuLmQLl+WENwkvJ8kru0rk+sPydENLyR3Lh4i
	32VTioHeuvlrhvjMChbgCoLPPTGFZWg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-iv84md29P5SfU6Oc7VMDpA-1; Wed, 20 Jul 2022 06:57:37 -0400
X-MC-Unique: iv84md29P5SfU6Oc7VMDpA-1
Received: by mail-ed1-f71.google.com with SMTP id t5-20020a056402524500b0043a923324b2so12004240edd.22
        for <ath10k@lists.infradead.org>; Wed, 20 Jul 2022 03:57:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version:content-transfer-encoding;
        bh=L3tIBK3odCi2wiUtSPbriFkXsk8gcjLDaLnSU7OmMoI=;
        b=vpfUlNgIKC+Ffw8gjNY6hbvaDgbmQTP/2/PBEnW5mUpO5UK6UGdGUI/fGoWSIC+WwD
         u9tRXVeSBJt0xJzhvo5we+tLh4MSwZ7emG9D6NxJGwmaUEQYIRr1Q4UdYrVfgmi+vGPb
         Ld/vuYWGUP4Lf5PdI7HuKVdYSp2yhUpTYNilG5I++fGU6Xckgnce+GKRSz7NQ+HENf5/
         sjLt7QextTfTcTCRyg6Fqhwlto3NTyYu1DpTSkHeT3B9yLXELKrmh5GTESMmG2CgqaZi
         uXO0Nafq/KeEjTlVc2O6iBrjYARam9vkBLyDE2ocLx0ZZThpID7SAas/xXR7F3TFk7/m
         B1Kw==
X-Gm-Message-State: AJIora+b6csC3QXT7EFfnidSxHU0UgQd8yyA6H9NcEtw2wbMkKTwQRIs
	ppvAzyx7vUXRXmHrUdofBRFZG7mvoi9xDEUwXJ0xSt7XZT1i7UfRoDT+eFOa1FTD9aowX3QUccE
	VvWWHFDzB8p+bUWeJLf6W8Q==
X-Received: by 2002:a05:6402:1cc8:b0:437:a61a:5713 with SMTP id ds8-20020a0564021cc800b00437a61a5713mr2233484edb.340.1658314656425;
        Wed, 20 Jul 2022 03:57:36 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uDdXKfV3xVrIkUIckfn6yUw5ELuqmmf+oZ2zwhtsXXU1rrwGdBmLWNy+ePIewka02ZjThKhw==
X-Received: by 2002:a05:6402:1cc8:b0:437:a61a:5713 with SMTP id ds8-20020a0564021cc800b00437a61a5713mr2233452edb.340.1658314656095;
        Wed, 20 Jul 2022 03:57:36 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id g8-20020a056402320800b0043bb8023caesm1031429eda.62.2022.07.20.03.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 03:57:35 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id 8C22B4DA011; Wed, 20 Jul 2022 12:57:34 +0200 (CEST)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Linus =?utf-8?Q?L=C3=BCssing?= <ll@simonwunderlich.de>, Adrian Chadd
 <adrian@freebsd.org>, Linus =?utf-8?Q?L=C3=BCssing?=
 <linus.luessing@c0d3.blue>
Cc: Johannes Berg <johannes.berg@intel.com>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Kalle Valo
 <kvalo@kernel.org>, Felix Fietkau <nbd@nbd.name>, Simon Wunderlich
 <sw@simonwunderlich.de>, Sven Eckelmann <sven@narfation.org>, ath10k
 <ath10k@lists.infradead.org>, linux-wireless
 <linux-wireless@vger.kernel.org>, netdev <netdev@vger.kernel.org>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mac80211: Fix wrong channel bandwidths reported for
 aggregates
In-Reply-To: <31e87fa2-6fea-5fe2-ab80-6050da9af7ce@simonwunderlich.de>
References: <20220718222804.21708-1-linus.luessing@c0d3.blue>
 <CAJ-VmomaQ-ai7n5i8-8sXsgaih4vjjHXyw+JQESGMERgC8Qqdw@mail.gmail.com>
 <31e87fa2-6fea-5fe2-ab80-6050da9af7ce@simonwunderlich.de>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Wed, 20 Jul 2022 12:57:34 +0200
Message-ID: <87cze0kq5d.fsf@toke.dk>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=toke@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_035918_434960_AE210640 
X-CRM114-Status: GOOD (  15.43  )
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

TGludXMgTMO8c3NpbmcgPGxsQHNpbW9ud3VuZGVybGljaC5kZT4gd3JpdGVzOgoKPiBPbiAxOS8w
Ny8yMDIyIDE3OjAzLCBBZHJpYW4gQ2hhZGQgd3JvdGU6Cj4+IEhpIQo+PiAKPj4gSXQncyBub3Qg
YSBoYXJkd2FyZSBidWcuIERhdGluZyBiYWNrIHRvIHRoZSBvcmlnaW5hbCBBUjU0MTYgMTFuIGNo
aXAsCj4+IG1vc3QgZmxhZ3MgYXJlbid0IHZhbGlkIGZvciBzdWJmcmFtZXMgaW4gYW4gYWdncmVn
YXRlLiBPbmx5IHRoZSBmaW5hbAo+PiBmcmFtZSBoYXMgdmFsaWQgZmxhZ3MuIFRoaXMgd2FzIGV4
cGxpY2l0bHkgY292ZXJlZCBpbnRlcm5hbGx5IHdheSBiYWNrCj4+IHdoZW4uCj4KPiBBaCwgdGhh
bmtzIGZvciB0aGUgY2xhcmlmaWNhdGlvbiEgSSBzZWUgaXQgaW4gdGhlIGRhdGFzaGVldCBmb3Ig
dGhlIAo+IFFDQTk1MzEsIHRvbywgbm93LiBBbmQgdGhhbmtzIGZvciB0aGUgY29uZmlybWF0aW9u
LCB0aGF0IHdoYXQgd2UgYXJlIAo+IGRvaW5nIHNvIGZhciBpcyBub3QgY29ycmVjdCBmb3IgYXRo
OWsuCj4KPiBXb3JkcyAwKzIgYXJlIHZhbGlkIGZvciBhbGwgUlggZGVzY3JpcHRvcnMsIDArMisx
MSB2YWxpZCBmb3IgdGhlIGxhc3QgUlggCj4gZGVzY3JpcHRvciBvZiBlYWNoIHBhY2tldCBhbmQg
MC0xMSBmb3IgdGhlIGxhc3QgUlggZGVzY3JpcHRvciBvZiBhbiAKPiBhZ2dyZWdhdGUgb3IgbGFz
dCBSWCBkZXNjcmlwdG9yIG9mIGEgc3RhbmQtYWxvbmUgcGFja2V0LiBPciBpbiBvdGhlciAKPiB3
b3Jkcywgd29yZCA0LCB3aGljaCBjb250YWlucyB0aGUgMjAgdnMuIDQwIE1IeiBpbmRpY2F0b3Is
IGlzIGludmFsaWQgCj4gZm9yIGFueSBhZ2dyZWdhdGUgc3ViLWZyYW1lIG90aGVyIHRoYW4gdGhl
IGxhc3Qgb25lLiBJIGNhbiByZW5hbWUgdGhhdCAKPiBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuCj4K
Pgo+IEFub3RoZXIgYXBwcm9hY2ggdGhhdCBhbHNvIGNhbWUgdG8gbXkgbWluZCB3YXMgaW50cm9k
dWNpbmcgbW9yZSBleHBsaWNpdCAKPiBmbGFncyBpbiBjZmc4MDIxMS5oJ3MgInN0cnVjdCByYXRl
X2luZm8iLCBsaWtlIGEgUkFURV9JTkZPX0JXX1VOS05PV04gaW4gCj4gImVudW0gcmF0ZV9pbmZv
X2J3IiBhbmQvb3IgUkFURV9JTkZPX0ZMQUdTX1VOS05PV04gaW4gImVudW0gCj4gcmF0ZV9pbmZv
X2ZsYWdzIi4gQW5kIHNldHRpbmcgdGhvc2UgZmxhZ3MgaW4gYXRoOWtfY21uX3Byb2Nlc3NfcmF0
ZSgpLgo+Cj4gVGhlIGN1cnJlbnQgYXBwcm9hY2ggaXMgc21hbGxlciB0aG91Z2gsIGFzIGl0IHNp
bXBseSB1c2VzIHRoZSBhbHJlYWR5IAo+IGV4aXN0aW5nIGZsYWdzLiBJZiBhbnlvbmUgaGFzIGFu
eSBwcmVmZXJlbmNlcywgcGxlYXNlIGxldCBtZSBrbm93LgoKSSBoYXZlIG5vIG9iamVjdGlvbnMg
dG8gZG9pbmcgaXQgaW4gbWFjODAyMTEgbGlrZSB5b3UncmUgcHJvcG9zaW5nIGhlcmUgOikKCi1U
b2tlCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRo
MTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
