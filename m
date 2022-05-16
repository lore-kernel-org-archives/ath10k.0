Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B29C433EF
	for <ath10k@archiver.kernel.org>; Mon, 16 May 2022 20:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=svLe9whdvSxgl5vfK1utugG/MwUlW4AClPKX4AgiJdk=; b=3XFt3WQvbGE4mx
	bNBer8HfwY4MCpT8TV2UZIfM8i/8hPt/5dlCUzXz0VrAZMWgHAhRnkXLkQ9PG45LevuZY2A1+CJr9
	9IYHtfFvxK4OQbmdlL+lSgrduWIRDs8VSd0Hoe95eKg9Q9rz4zectYe425c5cP6l61psH//K7gypN
	t/MacPvFADsVTDi6Ffogu02FdNsLb5K/0RpYY/91aYCtAxeumbDfS7Xsq5Zt9IXBpsQ2EceRrDZxk
	8lOLIQdmAaZWJHgmy4OGEDbcOgSJ76hEF5X5/tebbQ5wUE6ED0B0Z9465Fq4Rh7FqAB7WIIsYXzh9
	4wO1eO0jNv1BNbaXr9eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqhmp-00AABv-1z; Mon, 16 May 2022 20:57:51 +0000
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqhml-00AAAY-Oq
 for ath10k@lists.infradead.org; Mon, 16 May 2022 20:57:49 +0000
Received: by mail-vk1-xa2d.google.com with SMTP id s68so8120598vke.6
 for <ath10k@lists.infradead.org>; Mon, 16 May 2022 13:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rneFECe0WdCdTO+pXzR0vTp36w5ITL2tNrXp2IqQl04=;
 b=QGpM2vLqJadQax9o7erYEBrVDEef4JzoBn/aIXh54JpYzmtrDW/cI0OHn3tLirbv2Y
 hU1XVsk+b2JaUW2TTqXO8JEmKyTxcWdSD0s7UKtjDRUE1shE1UYzVMtF2JOgdpZ2uppx
 vGSAMM8O9NbayBBJ/cNvrIkC8eyEGI6hC0/dk/3EtqqeTcfAS+9mijiuOr3JE9UuFfwN
 6DyuaARR5rbIpMiVkz7goJcWTm6cqSZPXQKxej4oUPuMIvavzDPHov1W3zAO0KMvNhS6
 7YW/Cx2pZ6BzXi/MKmOhOQmiru+WKPUOwQhmefC5TqBGMV6ktxPA09fcfvBDHvkYdoJk
 XTrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rneFECe0WdCdTO+pXzR0vTp36w5ITL2tNrXp2IqQl04=;
 b=0ais3TM6f7ASvwqUBVCREdPbem4fYzi6EUU5LPUrmyHyUzKwOz/U5OwMaR56vR6kIO
 DJIbs3BJ23F+8jUvtfWweeTdKlRuCAejPgVRZWUKbXHq9kMBtSQMCh8o/8M55fhKZ5sg
 AatODl6WaODEw4wvL8K7tEvotJv0tcI8/kdsjKz65SWAGeqK3vmt7e53HxvYqtaDCuJB
 cvh4b6CyRiwm9gfCkpumgCWP2UhAgJetkKT5hd5HF/XPYj/rd+ohckaWqdqr+TuO8XTZ
 In3R4iYIhuS9Qtb0KQ6o88BovRUBwgWMPlQkg61tOIM/sh1yqtFJwVHjrmq0zRUasx5S
 bcgw==
X-Gm-Message-State: AOAM53198jJGDvQBXcgDo1y0bYH9DU3X1A2aZ+e+iI92eYm3M5FS6F9B
 rO1YK4RqrvF1ehAny+M6/luIikNZ+w3T7KvsLDw=
X-Google-Smtp-Source: ABdhPJymoMzayaZSmuQTg2xaF4WJu7vYrD74BO8PKS+IzydafbThZjJnGHrG98eGzYSVkdAxThqsfEuNoocfhsSPfz8=
X-Received: by 2002:a05:6122:890:b0:352:b096:d44b with SMTP id
 16-20020a056122089000b00352b096d44bmr7086174vkf.41.1652734665510; Mon, 16 May
 2022 13:57:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220516032519.29831-1-ryazanov.s.a@gmail.com>
 <20220516032519.29831-2-ryazanov.s.a@gmail.com>
In-Reply-To: <20220516032519.29831-2-ryazanov.s.a@gmail.com>
From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
Date: Mon, 16 May 2022 23:57:34 +0300
Message-ID: <CAHNKnsS2_vVPZT-PSjNDzfQmyXEaOJNO8MHqVfntN=GSG3P_Ng@mail.gmail.com>
Subject: Re: [PATCH 1/4] ath10k: improve tx status reporting
To: Kalle Valo <kvalo@kernel.org>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, 
 Edward Matijevic <motolav@gmail.com>, John Crispin <john@phrozen.org>, 
 =?UTF-8?B?T2xkxZlpY2ggSmVkbGnEjWth?= <oldium.pro@gmail.com>, 
 Tom Psyborg <pozega.tomislav@gmail.com>, 
 Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>,
 Zhijun You <hujy652@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_135747_844216_A07A0740 
X-CRM114-Status: GOOD (  21.91  )
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

T24gTW9uLCBNYXkgMTYsIDIwMjIgYXQgNjoyNSBBTSBTZXJnZXkgUnlhemFub3YgPHJ5YXphbm92
LnMuYUBnbWFpbC5jb20+IHdyb3RlOgo+IFdlIHVzZSBpZWVlODAyMTFfdHhfc3RhdHVzKCkgdG8g
cmVwb3J0IGVhY2ggY29tcGxldGVkIHR4IGZyYW1lLgo+IEludGVybmFsbHksIHRoaXMgZnVuY3Rp
b24gY2FsbHMgc3RhX2luZm9fZ2V0X2J5X2FkZHJzKCksIHdoYXQgaGFzIGEKPiBjb3VwbGUgb2Yg
ZHJhd2JhY2tzOgo+IDEuIGFkZGl0aW9uYWwgc3RhdGlvbiBsb29rdXAgY2F1c2VzIGEgcGVyZm9y
bWFuY2UgZGVncmFkYXRpb247Cj4gMi4gbWFjODAyMTEgY2FuIG5vdCBwcm9wZXJseSBhY2NvdW50
IEV0aGVybmV0IGVuY2Fwc3VsYXRlZCBmcmFtZXMgZHVlCj4gICAgdG8gdGhlIGluYWJpbGl0eSB0
byBwcm9wZXJseSBkZXRlcm1pbmUgdGhlIGRlc3RpbmF0aW9uIChzdGF0aW9uKSBNQUMKPiAgICBh
ZGRyZXNzIHNpbmNlIGllZWU4MDIxMV90eF9zdGF0dXMoKSBhc3N1bWVzIHRoZSBmcmFtZSBoYXMg
YSA4MDIuMTEKPiAgICBoZWFkZXIuCj4KPiBUaGUgbGF0dGVyIGlzIGVzcGVjaWFsbHkgZGVzdHJ1
Y3RpdmUgaWYgd2Ugd2FudCB0byB1c2UgaGFyZHdhcmUgZnJhbWVzCj4gZW5jYXBzdWxhdGlvbi4K
Pgo+IFRvIGZpeCBib3RoIG9mIHRoZXNlIGlzc3VlcywgcmVwbGFjZSBpZWVlODAyMTFfdHhfc3Rh
dHVzKCkgd2l0aAo+IGllZWU4MDIxMV90eF9zdGF0dXNfZXh0KCkgY2FsbCBhbmQgZmVlZCBpdCBz
dGF0aW9uIHBvaW50ZXIgZnJvbSB0aGUgdHgKPiBxdWV1ZSBhc3NvY2lhdGVkIHdpdGggdGhlIHRy
YW5zbWl0dGVkIGZyYW1lLgo+Cj4gVGVzdGVkLW9uOiBRQ0E5ODg4IGh3IDIuMCAxMC40LTMuOS4w
LjItMDAxMzEKPiBUZXN0ZWQtb246IFFDQTYxNzQgaHcgMy4yIFBDSSBXTEFOLlJNLjQuNC4xLTAw
MTU3LVFDQVJNU1dQWi0xCj4gU2lnbmVkLW9mZi1ieTogU2VyZ2V5IFJ5YXphbm92IDxyeWF6YW5v
di5zLmFAZ21haWwuY29tPgo+IFRlc3RlZC1ieTogT2xkxZlpY2ggSmVkbGnEjWthIDxvbGRpdW0u
cHJvQGdtYWlsLmNvbT4gIyBUUC1MaW5rIEFyY2hlciBDNyB2NCAmIHY1IChRQ0E5NTYzICsgUUNB
OTg4MCkKPiBUZXN0ZWQtYnk6IEVkd2FyZCBNYXRpamV2aWMgPG1vdG9sYXZAZ21haWwuY29tPiAj
IFRQLUxpbmsgQXJjaGVyIEMyNjAwIChJUFE4MDY0ICsgUUNBOTk4MCAxMC40LjEuMDAwMzAtMSkK
PiBUZXN0ZWQtYnk6IEVkd2FyZCBNYXRpamV2aWMgPG1vdG9sYXZAZ21haWwuY29tPiAjIFFDQTkz
NzcgUENJIGluIFN0YSBtb2RlCj4gVGVzdGVkLWJ5OiBaaGlqdW4gWW91IDxodWp5NjUyQGdtYWls
LmNvbT4gIyBORVRHRUFSIFI3ODAwIChRQ0E5OTg0IDEwLjQtMy45LjAuMi0wMDE1OSkKPiAtLS0K
Pgo+IENoYW5nZXMgc2luY2UgUkZDOgo+ICAqIG5ldyBUZXN0ZWQtb24gYW5kIFRlc3RlZC1ieSB0
YWdzCj4KPiAgZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway90eHJ4LmMgfCAxMiArKysr
KysrKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL3R4cngu
YyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvdHhyeC5jCj4gaW5kZXggMTAxMjM5
NzRjM2RhLi43MjU0MDQzNGM3NWIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9uZXQvd2lyZWxlc3Mv
YXRoL2F0aDEway90eHJ4LmMKPiArKysgYi9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBr
L3R4cnguYwo+IEBAIC00Myw2ICs0Myw3IEBAIHN0YXRpYyB2b2lkIGF0aDEwa19yZXBvcnRfb2Zm
Y2hhbl90eChzdHJ1Y3QgYXRoMTBrICphciwgc3RydWN0IHNrX2J1ZmYgKnNrYikKPiAgaW50IGF0
aDEwa190eHJ4X3R4X3VucmVmKHN0cnVjdCBhdGgxMGtfaHR0ICpodHQsCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBodHRfdHhfZG9uZSAqdHhfZG9uZSkKPiAgewo+ICsg
ICAgICAgc3RydWN0IGllZWU4MDIxMV90eF9zdGF0dXMgc3RhdHVzOwo+ICAgICAgICAgc3RydWN0
IGF0aDEwayAqYXIgPSBodHQtPmFyOwo+ICAgICAgICAgc3RydWN0IGRldmljZSAqZGV2ID0gYXIt
PmRldjsKPiAgICAgICAgIHN0cnVjdCBpZWVlODAyMTFfdHhfaW5mbyAqaW5mbzsKPiBAQCAtMTI4
LDcgKzEyOSwxNiBAQCBpbnQgYXRoMTBrX3R4cnhfdHhfdW5yZWYoc3RydWN0IGF0aDEwa19odHQg
Kmh0dCwKPiAgICAgICAgICAgICAgICAgaW5mby0+c3RhdHVzLmZsYWdzIHw9IElFRUU4MDIxMV9U
WF9TVEFUVVNfQUNLX1NJR05BTF9WQUxJRDsKPiAgICAgICAgIH0KPgo+IC0gICAgICAgaWVlZTgw
MjExX3R4X3N0YXR1cyhodHQtPmFyLT5odywgbXNkdSk7Cj4gKyAgICAgICBtZW1zZXQoJnN0YXR1
cywgMCwgc2l6ZW9mKHN0YXR1cykpOwo+ICsgICAgICAgc3RhdHVzLnNrYiA9IG1zZHU7Cj4gKyAg
ICAgICBzdGF0dXMuaW5mbyA9IGluZm87Cj4gKwo+ICsgICAgICAgcmN1X3JlYWRfbG9jaygpOwo+
ICsgICAgICAgaWYgKHR4cSAmJiB0eHEtPnN0YSkKPiArICAgICAgICAgICAgICAgc3RhdHVzLnN0
YSA9IHR4cS0+c3RhOwoKSnVzdCBub3RpY2VkIHRoYXQgc2luY2Ugd2UgZG8gbm90IGRlcmVmZXJl
bmNlIHRoZSB0eHEtPnN0YSBwb2ludGVyCmhlcmUsIHRoZSBhYm92ZSBjb2RlIGNhbiBiZSBzaW1w
bGlmaWVkIHRvOgoKaWYgKHR4cSkKICAgICAgICBzdGF0dXMuc3RhID0gdHhxLT5zdGE7CgpLYWxs
ZSwgc2hvdWxkIEkgc2VuZCBWMiBvciBjYW4geW91IGNoYW5nZSB0aGlzIGluIHlvdXIgdHJlZT8K
Cj4gKyAgICAgICBpZWVlODAyMTFfdHhfc3RhdHVzX2V4dChodHQtPmFyLT5odywgJnN0YXR1cyk7
Cj4gKyAgICAgICByY3VfcmVhZF91bmxvY2soKTsKPiArCj4gICAgICAgICAvKiB3ZSBkbyBub3Qg
b3duIHRoZSBtc2R1IGFueW1vcmUgKi8KPgo+ICAgICAgICAgcmV0dXJuIDA7CgotLSAKU2VyZ2V5
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsg
bWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
