Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F4CC2BB41
	for <ath10k@archiver.kernel.org>; Tue, 16 Aug 2022 18:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yEeb2f70ScHWx/8bGmTCOZSehXgtgVU/xaT0H7R4400=; b=mEJRugu5fo4jBJ
	s7cnFOZD+dOHkVlEezX6n0U0/uGq7fTnahNgukwUTFIkFyrnEoztGsMBUTy1ewDjly1fPsPy32QUN
	LBkOyzkzN+IJKvKDDuNnd7WJpoLf0TonJYEIdFxLldS09rKiweaO6P/0jzPuMod7QsxvLZde3Sjhj
	kwOVmBmMsZAH3wkCuWG2+u8GdEdy99XEfwAo33jfCsQgQdE/N4LLkuPQBTYT/urH/f0VlW+j9pJhi
	DGXLeTVwfP/UKbD+LLuNwRk95vKUn5vnQ8VfY2gc3GbfOvpBoL2V2j+nYxsvk3DrLplhz3XB8OFVs
	E9eaLMCrLzaZcqFCAD7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO1if-0063hD-Ok; Tue, 16 Aug 2022 18:55:17 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO1id-0063ZO-AF
	for ath10k@lists.infradead.org; Tue, 16 Aug 2022 18:55:16 +0000
Received: by mail-qv1-xf30.google.com with SMTP id p4so1447037qvr.5
        for <ath10k@lists.infradead.org>; Tue, 16 Aug 2022 11:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=protectli.com; s=google;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc;
        bh=6cP53sh8d/p/ob1kidT5h1VckZjIPJkmG/jjiclp3dI=;
        b=cTKxQWQDHXmV90AlRbag31pPw/VvI48D/js7ST9PfdXxM/E71K5fnMvlV9A5M6xoTQ
         +IJwtnijitgK8ts+PdnIiK5wv2Tv8wzjKUTrQEfly92KgMY44yWd2szuVR5jxjS/Xx5b
         VScK7HJmch4zyV9z7JM60rNK5X3Dw1TMTRL/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc;
        bh=6cP53sh8d/p/ob1kidT5h1VckZjIPJkmG/jjiclp3dI=;
        b=7CAaEL/STPUb1Ml/AFeoJ7MOHIcR2mOZmY5vKzyZ7Wd7AQnCDE0w22eUl27tZ6gTEd
         4Z7RGJsnF84BDwhShnnGQXra1PXIU8vajfOajtiv4+yW5L5ELYVhXyrYQ/E5b74mlgxX
         rgkDlToy2fIwQX7y8B+DykO0sWXS/VRleOZJz7C08X5+HXUNZa34MOAYimV+eMIx6H5U
         V4Ii8Xx1ZwEWQYqRDjK2b7Ym9o9/OeHy8Xr/bLUBMt0znaPcXEQiQFYCOhmXPZPsY5Hj
         N+fNJtoHWH0IgZzEaH7sdvtA0AUUcJtsOU0IKW7v6sPTUuHxDNPoy2/hdSpqZulF4kCm
         FWqQ==
X-Gm-Message-State: ACgBeo21aSgCRsVb7M1BzttZwdvTdKeKrQFH2Njt8nE7J/ZEwAPLGk1N
	0Fh2FyZ8XH4q8r0O1P0/IejPpUDihs5z3y4B
X-Google-Smtp-Source: AA6agR5jYWoS2Idt4+2hGnZbiaqsM+I1la+fRFyp5PebO/Ts1oD5OnTLCW7tBtxZ1j6wVqg74Jfj+Q==
X-Received: by 2002:a05:6214:2303:b0:473:2c6:8361 with SMTP id gc3-20020a056214230300b0047302c68361mr19436133qvb.70.1660676113086;
        Tue, 16 Aug 2022 11:55:13 -0700 (PDT)
Received: from lycia.zebraskunk.int ([199.168.73.145])
        by smtp.gmail.com with ESMTPSA id cb24-20020a05622a1f9800b0031ef6dd9700sm10870369qtb.55.2022.08.16.11.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 11:55:12 -0700 (PDT)
Date: Tue, 16 Aug 2022 14:55:10 -0400
From: Brett Mastbergen <brett.mastbergen@protectli.com>
To: Wonsup Yoon <pusnow@kaist.ac.kr>
Cc: ath10k@lists.infradead.org
Subject: Re: Re: Questions about QCA6174 firmwares
Message-ID: <20220816185510.GA17527@lycia.zebraskunk.int>
References: <pcoa2db959zn.pcoa2db781x3.g6@dooray.com>
 <20220815195952.GA7798@lycia.zebraskunk.int>
 <pdwmg9b8y9s0.pdwmg9b8zyhc.g6@dooray.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <pdwmg9b8y9s0.pdwmg9b8zyhc.g6@dooray.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_115515_414261_4AB327C2 
X-CRM114-Status: GOOD (  23.06  )
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

T24gVHVlLCBBdWcgMTYsIDIwMjIgYXQgMDI6NDE6NDNQTSArMDkwMCwgV29uc3VwIFlvb24gd3Jv
dGU6Cj4gSGksCj4gCj4gSSdtIGN1cnJlbnRseSB1c2luZyB0aGUgbGF0ZXN0ICJjMyIgdmVyc2lv
biwgYW5kIGl0IHdvcmtzIGZpbmUuCj4gRmlybXdhcmUgdmVyc2lvbjogV0xBTi5STS40LjQuMS5j
My0wMDIzMCAuCj4gCj4gQnV0IEknbSBzdGlsbCBjdXJpb3VzIHdoYXQgdGhlICJjIiB2ZXJzaW9u
IG1lYW5zLgoKWWVhLCBhbmQgaWYgdGhlICJjIiB2ZXJzaW9uIHdvdWxkIGV2ZXIgYmUgInByb21v
dGVkIiB0byBiZSB0aGUgUUNBNjE3NCBmaXJtd2FyZSB2ZXJzaW9uIGluIHRoZSBsaW51eC1maXJt
d2FyZSByZXBvIGFnYWluLiAgQmVjYXVzZSBhcyBpdCBpcyByaWdodCBub3csIEkgdGhpbmsgdGhl
cmUgaXMgYSBidW5jaCBvZiBRQ0E2MTc0IGhhcmR3YXJlIG91dCB0aGVyZSB0aGF0IGJyb2tlIHdo
ZW4gdGhlIFFDQTYxNzQgZmlybXdhcmUtNi5iaW4gaW4gbGludXgtZmlybXdhcmUgd2VudCB0byBX
TEFOLlJNLjQuNC4xLTAwMTQwLVFDQVJNU1dQWi0xIChhbmQgdXApLiAgQW5kIHNpbmNlIG1vc3Qg
ZGlzdHJvcyBwaWNrIHVwIHJlY2VudCBsaW51eC1maXJtd2FyZSwgbW9zdCBjdXJyZW50IGRpc3Ry
b3MgaGF2ZSB0aGUgYnJva2VuIHZlcnNpb24uCj4gCj4gQmVzdCByZWdhcmRzLAo+IFdvbnN1cCBZ
b29uCj4gCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiBGcm9tOiAgIkJyZXR0IE1hc3Ri
ZXJnZW4iIDxicmV0dC5tYXN0YmVyZ2VuQHByb3RlY3RsaS5jb20+Cj4gVG86ICAgICAiV29uc3Vw
IFlvb24iIDxwdXNub3dAa2Fpc3QuYWMua3I+OyAKPiBDYzogICAgICA8YXRoMTBrQGxpc3RzLmlu
ZnJhZGVhZC5vcmc+OyAKPiBTZW50OiAgMjAyMi0wOC0xNiAo7ZmUKSAwNDo1OTo1NyAoVVRDKzA5
OjAwKQo+IFN1YmplY3Q6IFJlOiBRdWVzdGlvbnMgYWJvdXQgUUNBNjE3NCBmaXJtd2FyZXMKPiAK
PiBPbiBXZWQsIEF1ZyAxMCwgMjAyMiBhdCAxMDo1NjozOEFNICswOTAwLCBXb25zdXAgWW9vbiB3
cm90ZToKPiA+IEhpLAo+ID4gCj4gPiBJZiB5b3UgZG9uJ3QgbWluZCwgSSdkIGxpa2UgYXNrIGEg
ZmV3IHF1ZXN0aW9ucyByZWdhcmRpbmcgUUNBNjE3NCBmaXJtd2FyZXMuCj4gPiAKPiA+IDEuIEkn
dmUgbm90aWNlIHRoYXQgUUNBNjE3NCBodzMuMCA0LjQuMSBmaXJtd2FyZXMgaGF2ZSA0IHZlcnNp
b25zIChub25lLCBjMSwgYzIsIGMzKS4gQXJlIHRoZXJlIGFueSBkaWZmZXJlbmNlcz8gV2hpY2gg
b25lIGlzIG5ld2VzdCBvciBjb3JyZWN0Pwo+ID4gCj4gPiAyLiBNeSBRQ0E2MTc0IHNlZW1zIHRv
IGhhdmUgYSBjb21wYXRpYmlsaXR5IGlzc3VlIHdpdGggYSByZWNlbnQgZmlybXdhcmUuIEkndmUg
dGVzdGVkIHRoZXNlcyBmaXJtd2FyZSB2ZXJzaW9ucywgYnV0IG9ubHkgdGhlIG9sZGVzdCBvbmUg
d29ya3MuCj4gPiAKPiAKPiBJIGhhdmUgb2JzZXJ2ZWQgdGhlIHNhbWUgZmlybXdhcmUgY3Jhc2hl
cyB3aXRoIHRob3NlIHZlcnNpb25zIHdpdGggbXkgUUNBNjE3NCBtb2R1bGUgKEpXVzYwNTEpLiAg
V291bGQgbG92ZSB0byBrbm93IGlmIFJNLjQuNC4xLmMyLTAwMDU3LVFDQVJNU1dQLTEgaXMgdGhl
IGNvcnJlY3QgdmVyc2lvbiB0byB1c2UsIG9yIGlmIHRoZXJlIGlzIGFub3RoZXIgbmV3ZXIgdmVy
c2lvbiB0aGF0IEkgc2hvdWxkIGJlIHVzaW5nLgo+IAo+IFRoYW5rcywKPiBicmV0dAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcg
bGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
