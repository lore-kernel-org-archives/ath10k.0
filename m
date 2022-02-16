Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C38B2C433EF
	for <ath10k@archiver.kernel.org>; Wed, 16 Feb 2022 21:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W0P3cTUziaS50BkVbaufExP9ejRSmp6AMdf1pEv69eM=; b=cgdAypL2s9zd6Q
	zfElDzHP9hRHp/E0GqD//RTW8EuOgCpsX6c7vcHtmic9yirQWod778Da7ltF38s/1Mr1211iD52JB
	nCS3z/Vv37yIAAR4gUYRJeUVIoOXElF8UNp+pNqJDP2Xy/b1QTNEAaiVZ6YLd9sXsi8ytf0dqREYB
	ksEBhVXEmEKAydn0U5zGMlCfTAkRLKkqbIige72xognvVPAaoQoMOXGRkCK4yIkadFjSIn2c5ih+H
	hCBpjAMU81Xug6g14J8JQrQ5gI02vaUaPF96KhynC0wnoXk6iI2NwBMf1ZatYVpUo6xE86zIw8bOf
	m1dHCptcQlDUT5/bTAwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKSGa-008QYU-Kc; Wed, 16 Feb 2022 21:55:16 +0000
Received: from vps.slashdirt.org ([144.91.108.218])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKSGX-008QY7-Od
 for ath10k@lists.infradead.org; Wed, 16 Feb 2022 21:55:15 +0000
Received: from smtpclient.apple (tardis.herebedragons.eu [171.22.3.161])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by vps.slashdirt.org (Postfix) with ESMTPSA id D7CE0602F9;
 Wed, 16 Feb 2022 22:55:11 +0100 (CET)
DMARC-Filter: OpenDMARC Filter v1.4.0 vps.slashdirt.org D7CE0602F9
Authentication-Results: vps.slashdirt.org; dmarc=fail (p=quarantine dis=none)
 header.from=slashdirt.org
DKIM-Filter: OpenDKIM Filter v2.11.0 vps.slashdirt.org D7CE0602F9
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=slashdirt.org; s=mail;
 t=1645048512; bh=v0qDUc+ItBsspfMJTkeG+1dEta7rV0qYjnK1c5Z/lho=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To:From;
 b=D7Ih8nLEDAJpiLAysBOiAchFMG3K9rdnRSoNG3AXfCfUYpGwPkDLKp8Y3Z0/OANEY
 qVUp74QTujBUKPfkzf0iAhhIDPJU6i5gzCX3aWCdWVP7OsX8LSwIvjmjrclRhNTKrw
 SLf0aCiKGILBGkRdmwNOem8EYwl4zLgedtW8bC60=
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.60.0.1.1\))
Subject: Re: [PATCH] ath10k: support bus and device specific API 1 BDF
 selection
From: Thibaut <hacks@slashdirt.org>
In-Reply-To: <70a8dd7a-851d-686b-3134-50f21af0450c@gmail.com>
Date: Wed, 16 Feb 2022 22:55:11 +0100
Cc: Robert Marko <robimarko@gmail.com>, Kalle Valo <kvalo@kernel.org>,
 kvalo@codeaurora.org, davem@davemloft.net, kuba@kernel.org,
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, open list <linux-kernel@vger.kernel.org>
Message-Id: <7DCB1B9A-D08E-4837-B2FE-6DA476B54B0D@slashdirt.org>
References: <20211009221711.2315352-1-robimarko@gmail.com>
 <163890036783.24891.8718291787865192280.kvalo@kernel.org>
 <CAOX2RU5mqUfPRDsQNSpVPdiz6sE_68KN5Ae+2bC_t1cQzdzgTA@mail.gmail.com>
 <09a27912-9ea4-fe75-df72-41ba0fa5fd4e@gmail.com>
 <CAOX2RU6qaZ7NkeRe1bukgH6OxXOPvJS=z9PRp=UYAxMfzwD2oQ@mail.gmail.com>
 <EC2778B3-B957-4F3F-B299-CC18805F8381@slashdirt.org>
 <CAOX2RU7FOdSuo2Jgo0i=8e-4bJwq7ahvQxLzQv_zNCz2HCTBwA@mail.gmail.com>
 <CAOX2RU7d9amMseczgp-PRzdOvrgBO4ZFM_+hTRSevCU85qT=kA@mail.gmail.com>
 <70a8dd7a-851d-686b-3134-50f21af0450c@gmail.com>
To: Christian Lamparter <chunkeey@gmail.com>
X-Mailer: Apple Mail (2.3693.60.0.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_135513_978913_14D0955C 
X-CRM114-Status: GOOD (  14.57  )
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

SGksCgo+IExlIDE2IGbDqXZyLiAyMDIyIMOgIDIyOjE5LCBDaHJpc3RpYW4gTGFtcGFydGVyIDxj
aHVua2VleUBnbWFpbC5jb20+IGEgw6ljcml0IDoKPiAKPiBIaSwKPiAKPiBPbiAxNi8wMi8yMDIy
IDE0OjM4LCBSb2JlcnQgTWFya28gd3JvdGU6Cj4+IFNpbGVudCBwaW5nLAo+PiBEb2VzIGFueWJv
ZHkgaGF2ZSBhbiBvcGluaW9uIG9uIHRoaXM/Cj4gCj4gQXMgYSBmYWxsYmFjaywgSSd2ZSBjb2Ji
bGVkIHRvZ2V0aGVyIGZyb20gdGhlIG9sZCBzY3JpcHRzIHRoYXQKPiAiY29uY2F0IGJvYXJkLmJp
biBpbnRvIGEgYm9hcmQtMi5iaW4uIERvIHRoaXMgb24gdGhlIGRldmljZQo+IGluIHVzZXJzcGFj
ZSBvbiB0aGUgZmx5IiBpZGVhLiBUaGlzIHdhcyBzdWNjZXNzZnVsbHkgdGVzdGVkCj4gb24gb25l
IG9mIHRoZSBhZmZlY3RlZCBkZXZpY2VzIChNaWtyb1RpayBTWFRzcSA1IGFjIChSQlNYVHNxRy01
YWNEKSkKPiBhbmQgc2hvdWxkIHdvcmsgZm9yIGFsbCBNaWtyb1Rpay4KPiAKPiAiaXBxNDB4eDog
ZHluYW1pY2FsbHkgYnVpbGQgYm9hcmQtMi5iaW4gZm9yIE1pa3JvdGlrIgo+IDxodHRwczovL2dp
dC5vcGVud3J0Lm9yZy8/cD1vcGVud3J0L3N0YWdpbmcvY2h1bmtlZXkuZ2l0O2E9Y29tbWl0O2g9
NTJmMzQwN2Q5NGRhNjJiOTliYTZjMDlmMzY2MzQ2NGNjY2QyOWI0Zj4KPiAodGhvdWdoIEkgZG9u
J3QgdGhpbmsgdGhpcyBsaW5rIHdpbGwgc3RheSBhY3RpdmUgZm9yCj4gdG9vIGxvbmcuKQoKSU1I
TyBSb2JlcnTigJlzIHBhdGNoIGFkZHJlc3NlcyBhbiBhY3R1YWwgYnVnIGluIGF0aDEwayB3aGVy
ZWJ5IHRoZSBkcml2ZXIgc2VuZHMgdGhlIHNhbWUgZGV2cGF0aCBmb3IgdHdvIGRpZmZlcmVudCBk
ZXZpY2VzIHdoZW4gcmVxdWVzdGluZyBib2FyZC0xIEJERiwgd2hpY2ggZG9lc27igJl0IHNlZW0g
cmlnaHQuCgpZb3VyIHByb3Bvc2FsIGlzIGxlc3Mgc3RyYWlnaHRmb3J3YXJkIHRoYW4gdXNpbmcg
dW5tb2RpZmllZCBib2FyZC0xIGRhdGEgKGFzIGNvdWxkIGJlIGRvbmUgaWYgdGhlIGFib3ZlIGJ1
ZyBkaWQgbm90IG9jY3VyKSBhbmQgbmVnYXRlcyB0aGUgcHJldmlvdXMgZWZmb3J0cyBub3QgdG8g
c3RvcmUgdGhpcyBkYXRhIG9uIGZsYXNoICh1c2luZyBpbnN0ZWFkIHRoZSBrZXJuZWzigJlzIGRv
Y3VtZW50ZWQgZmlybXdhcmUgc3lzZnMgbG9hZGluZyBmYWNpbGl0eSAtIGFnYWluIHBvc3NpYmxl
IHdpdGhvdXQgdGhlIGFib3ZlIGlzc3VlKS4KCkhUSApULUJvbmUKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2F0aDEwawo=
