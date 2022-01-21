Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49FE2C433F5
	for <ath10k@archiver.kernel.org>; Fri, 21 Jan 2022 22:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t/vD3P19JITgpQr/XoC6Ow2qQBsEbE2a3it07DaFSi0=; b=0lbm5Whnau9/Ly
	Zha+C7ZtNxjmTOgTfSgFV1Jid9EDgwAusnAvzebTxbL4FGYySMRPTv+0a9t1CiI5pIfiprXDbmOLy
	l3rHtE5d3SGmzlNDoTku35ZV7FzX/D7g1nhdhjG6ijFKEL4KCHQKdpez9csOYIiOtCEjqru/axK2+
	OB/Yg4Cst21k0OJEhgOaC0qacPzqLAEPyd6dTz8CWHcfdO8hiMuA7Nj4ERMnGGjNRCx/DZA6ic7ZH
	36a85I1CV70z2DIPY7mfBHKLdvhAEXpRSThPJqz/HsegQayx5509KzKG0sbULtpsmxajhWtp4WwY4
	FllsRGffV8GyOMk4uFSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nB2c3-00GCEC-1Y; Fri, 21 Jan 2022 22:42:31 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nB2c0-00GCDK-2C
 for ath10k@lists.infradead.org; Fri, 21 Jan 2022 22:42:29 +0000
Received: by mail-io1-xd32.google.com with SMTP id y22so12493429iof.7
 for <ath10k@lists.infradead.org>; Fri, 21 Jan 2022 14:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kSZGvQ/PhqOAa5UV8ZigO6yQNjGC7UfSjALFxNrTjuA=;
 b=YzO6G0ZVqVWf3w1A5HcCIlHDpYyK+WH6nCTbJCOQv9NU71+MiUx6wuo4wXdAep8b6Q
 EhO8NxIMn2z31HKpOqfDBW6NmyfJ8J+7OIYpy8lyAF9wsGREo/3NE40TuO2uhR17jvA4
 jtYSliwVEhP6HDzXz7YWq/CoI5MYMOzs8fqwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kSZGvQ/PhqOAa5UV8ZigO6yQNjGC7UfSjALFxNrTjuA=;
 b=k6ebhBZqCKQy6mnafKFEOc9m00YpFp+6cUEfQsZ+bytxvGsGdsDqyqo8i44ULzos+b
 Vk2UZCjJDW28/xklwTIs0QszUWhbRKQDpuey+9C/lIOkdQIwSiwP4b1dBYc0ohu1axuP
 rgqYBGK9oRvDVFN4xgEyQ02wkHeTB6F9Kdnu5eobSXOjPCCfTDPVItkUZrw/ZuPc3T5r
 JlxjcoIApM2hWy/9B0S83gqZtftR/PdJKMRsncMgqFxhQTI6Y7WoZO9hbGkY1CI4fdIg
 iVpZhTBHJcEapGYrQgC7p+6osEHE8+khhimveCptBtkAjCjFz82MxCj4RZ79wDdOvJmL
 2b+Q==
X-Gm-Message-State: AOAM5336ZZpYpqa1UQ4I3bsX05ysVdRH+DDKeU4zc4B56Mp5d/UnjfeE
 3cqNovH/EB9caOkKnEHrvRQt2SEeZ2fN5g==
X-Google-Smtp-Source: ABdhPJxsxDpi9jkd/Xhgs7uT5GiGxErtTlzVPAn+QtSgVkydx/X00ayxxf46c5Ygjjl0knDVnSADKQ==
X-Received: by 2002:a05:6602:334d:: with SMTP id
 c13mr3244033ioz.113.1642804944246; 
 Fri, 21 Jan 2022 14:42:24 -0800 (PST)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com.
 [209.85.166.170])
 by smtp.gmail.com with ESMTPSA id h3sm3686573ild.11.2022.01.21.14.42.23
 for <ath10k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Jan 2022 14:42:23 -0800 (PST)
Received: by mail-il1-f170.google.com with SMTP id d3so8819498ilr.10
 for <ath10k@lists.infradead.org>; Fri, 21 Jan 2022 14:42:23 -0800 (PST)
X-Received: by 2002:a05:6e02:180c:: with SMTP id
 a12mr3372919ilv.142.1642804943188; 
 Fri, 21 Jan 2022 14:42:23 -0800 (PST)
MIME-Version: 1.0
References: <20220121064427.32059-1-quic_youghand@quicinc.com>
In-Reply-To: <20220121064427.32059-1-quic_youghand@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 21 Jan 2022 14:42:11 -0800
X-Gmail-Original-Message-ID: <CAD=FV=X30mRSFcMeOav87g5qzco_J=-rag3rqyCAYOw0D_Ao0A@mail.gmail.com>
Message-ID: <CAD=FV=X30mRSFcMeOav87g5qzco_J=-rag3rqyCAYOw0D_Ao0A@mail.gmail.com>
Subject: Re: [RFC 0/2] ath10k:set tx credit to one and delay the unmaping
To: Youghandhar Chintala <quic_youghand@quicinc.com>
Cc: ath10k <ath10k@lists.infradead.org>, 
 linux-wireless <linux-wireless@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 quic_pillair@quicinc.com, Abhishek Kumar <kuabhs@chromium.org>, 
 Brian Norris <briannorris@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_144228_165677_7DE36D9D 
X-CRM114-Status: GOOD (  18.47  )
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

SGksCgpPbiBUaHUsIEphbiAyMCwgMjAyMiBhdCAxMDo0NCBQTSBZb3VnaGFuZGhhciBDaGludGFs
YQo8cXVpY195b3VnaGFuZEBxdWljaW5jLmNvbT4gd3JvdGU6Cj4KPiBDdXJyZW50bHkgZm9yIFdD
TjM5OTAsIHRoZSBob3N0IGRyaXZlciBjYW4gc2VuZCB0d28gd21pIGNvbW1hbmRzIGF0IG9uY2Us
Cj4gbm93IGl0IGlzIGxpbWl0aW5nIHRvIG9uZSBiZWNhdXNlIGlmIEhPU1Qgd2FudHMgdG8gaW5p
dGlhdGUgMiBETUEgdHJhbnNmZXJzLAo+IGl0IGlzIHBvc3NpYmxlIHdoZW4gY29weSBjb21wbGV0
ZSBpbnRlcnJ1cHQgZm9yIGZpcnN0IERNQSByZWFjaGVzIEhPU1QsCj4gQ0UgaGFzIGFscmVhZHkg
dXBkYXRlZCBTUlJJIGZvciBib3RoIERNQSB0cmFuc2ZlcnMgYW5kIGlzIGluIHRoZSBtaWRkbGUK
PiBvZiAybmQgRE1BLiBIT1NUIHVzZXMgU1JSSSB0byBpbnRlcnByZXQgaG93IG1hbnkgRE1B4oCZ
cyBoYXZlIGJlZW4gY29tcGxldGVkCj4gYW5kIHRyaWVzIHRvIHVubWFwL2ZyZWUgYm90aCB0aGUg
RE1BIGVudHJpZXMsIGJ1dCBDRSBpcyBzdGlsbCBpbiB0aGUgbWlkZGxlCj4gb2YgMm5kIERNQSB3
aGljaCBjYW4gY2F1c2UgU01NVSBpc3N1ZXMgb3IgY29ycnVwdGlvbi4KPgo+IFdlIGFyZSBzZWVp
bmcgYSBjb3JuZXIgY2FzZSBzbW11IGZhdWx0IGlzc3VlIHdoZXJlIGNvcHkgZW5naW5lIGlzIHN0
aWxsIGFjY2Vzc2luZwo+IHRoZSBtZW1vcnkgdGhvdWdoIGhvc3QgdW5tYXBzIGl0IGhlbmNlIGFz
IHdvcmsgYXJvdW5kIHdlIGFyZSBkZWxheWluZyB0aGUKPiB1bm1hcHBpbmcgdGhlIG1lbW9yeSBh
bmQgdHggY3JlZGl0IHRvIG9uZS4KPgo+IFlvdWdoYW5kaGFyIENoaW50YWxhICgyKToKPiAgIGF0
aDEwazogU2V0IHR4IGNyZWRpdCB0byBvbmUgZm9yIHdjbjM5OTAgc25vYyBiYXNlZCBkZXZpY2Vz
Cj4gICBhdGgxMGs6IERlbGF5IHRoZSB1bm1hcHBpbmcgb2YgdGhlIGJ1ZmZlcgo+Cj4gIGRyaXZl
cnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvY29yZS5jIHwgMzAgKysrKysrKysrKysrKysrKysr
KysrKysrKysKPiAgZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9odGMuYyAgfCAxOCAr
KysrKysrKysrKysrLS0tCj4gIGRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvaHRjLmgg
IHwgIDEgKwo+ICBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL2h3LmggICB8ICA2ICsr
KysrKwo+ICA0IGZpbGVzIGNoYW5nZWQsIDUyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
CgpJIGRvbid0IHVuZGVyc3RhbmQgdGhlIHJvb3QgY2F1c2UgaGVyZSBteXNlbGYuIEkgYWxzbyBk
b24ndCBoYXZlCmVub3VnaCBza2luIGluIHRoZSBnYW1lIHRvIHNheSB3aGV0aGVyIHRoaXMgaXMg
dGhlIGJlc3QvY2xlYW5lc3Qgd2F5CnRvIHdvcmsgYXJvdW5kIHRoZSBwcm9ibGVtLiBUaHVzIEkn
bGwgcmVmcmFpbiBmcm9tIGEgUmV2aWV3ZWQtYnkgdGFnLgpUaGF0IGJlaW5nIHNhaWQsIEkgZGlk
IGEgYnVuY2ggb2YgdGVzdGluZyBvZiB0aGlzIHNvbHV0aW9uIGFuZCBJIGFsc28KYW0gYXdhcmUg
b2Ygb3RoZXJzIHRoYXQgaGF2ZSB0ZXN0ZWQgaXQuIFRodXMgSSdtIGNvbnZpbmNlZCB0aGF0IGl0
IGF0CmxlYXN0IHdvcmtzIGFyb3VuZCB0aGUgcHJvYmxlbSB0aGF0IGhhcyBiZWVuIG9ic2VydmVk
LiBIZW5jZToKClRlc3RlZC1ieTogRG91Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0u
b3JnPgoKSW4gbXkgY2FzZSBJIHdhcyBvbiB0aGUgc2FtZSAob3IgbmVhcmx5IHRoZSBzYW1lKSBo
YXJkd2FyZSBhcwpZb3VnaGFuZGhhciwgdGhvdWdoIEkgaGFkIGEgc2xpZ2h0bHkgb2xkZXIgYnVp
bGQuIEZXSVc6CgpUZXN0ZWQtb246IFdMQU4uSEwuMy4yLjIuYzEwLTAwNzU0LVFDQUhMU1dNVFBM
LTEKCi1Eb3VnCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
