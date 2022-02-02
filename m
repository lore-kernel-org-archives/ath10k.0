Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF03C433F5
	for <ath10k@archiver.kernel.org>; Wed,  2 Feb 2022 18:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=snwrzTNvr5QnjQzJU3YVinOkNHwQnJQy9DnFLebVOX4=; b=Q3koVQFesCz/Hb
	35UcZpN/2mNXFA2X8EW7V7MUQ72xcwuaXeGcneFzusBR9dD0m/ZscEDn5Gvm4q/xZz5HoiL8lX6R8
	esOmRW4Lsgd7XdseN9HE5N4V1wD3eJ0GD+PD8vtF0/2BYjcVOSm0hEbWSitA08QnhVmRq/AtM/Mum
	FMNjA/wfanJTix93nbtpSH5lMzVvEgUd+KOxf7YhCV6ZF8FQcbPO+g5I3IqWKWcmBdHhoy+hXl3hG
	ZswaH5KBy4lBUi7C5bL6azyOXPv3nGIBCNzWWZwe87N/txPBkuRQJE0YMOVJSLkt4bloPeoaeufLW
	zZFEJaV5K2DcwOSSbsaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFKhb-00GeGs-HJ; Wed, 02 Feb 2022 18:49:59 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFKhY-00GeF0-E6
 for ath10k@lists.infradead.org; Wed, 02 Feb 2022 18:49:57 +0000
Received: by mail-qt1-x832.google.com with SMTP id h25so100183qtm.1
 for <ath10k@lists.infradead.org>; Wed, 02 Feb 2022 10:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VTOPnaRquWicISMRZD83cjOQfdkXCxYB8Ac7cHDsTWs=;
 b=HOGlJ2+27xL5/WqxZJdwbp7tuNHB36A0n0ah5gbe2JaqwLe6kVXWNbHx47yMO+j51x
 fPTa6ZTGRy8Dzk9PLpGA5X3sDbNQXspYP6nSzZqzzwtDSnZcwM9QXQQz3Ai6SwHowsdH
 mzplefphGpL2xJGlKs6rUevuGCVHhqLiEIfyuk4LQJ4kOPRAAuatau+gN4AYIK0kZ0l0
 HcpT2KMNmVvC+E39EiBvqtDTtq8xzKS74fTjw8B9MfN6+za7P4s8Vli16oJlQ628izLi
 juEG/Ot8g6dvQRKzO+8DCSD4CEgMJZuWhCvqIOF7AIojYxpI7IRHl8J6+iaCvWi7+H5a
 eJ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VTOPnaRquWicISMRZD83cjOQfdkXCxYB8Ac7cHDsTWs=;
 b=Uti0jv9ElHFF2qEcpQCIAJxgvLgVLjw5KR05TdFGzFm//S/l08Xft5f/vhXX/usSyI
 p8fKVmznAF4hio/x/OkCnBorxmy4lwVkD8WFTaOCVoxMHWs0d0m/U+MW711utNw1b0Cu
 p29vlXbaJDC4saL6k+Wnc/hNx2IFvecEDh8Qyvt4CG/iOO22W3CakYaNLVPRWX/cB/bo
 UJ4vIABpPWOGlf4EwLSwYRinYUwuSOQIncInogqxUaTFu2BjMaSeekfCy9XTVRqk3us8
 sBLY1lvcy+kX2jx2SpEV7gEcC1iVK6TKgMYOKxNudpvmQQg+DPxVb7u+qYpeOsTsAtEx
 bYhA==
X-Gm-Message-State: AOAM532F53pZT2Uiuop5v9Lb/UHAHLdCsct1YiGr2L+d2KW9Fj9RH4YC
 3dIi1TuXdOzx82lkE/xFu/GW+1ljpiAwTkewpWqEZvfc
X-Google-Smtp-Source: ABdhPJyNh4rrva9Cl9WwnJRevXEYp1kCMhFJpdL0zn7uL+gxD+3diJFsD4DsVeW3oAB+6T9DgGwsQ/BKN7HxE8V81WU=
X-Received: by 2002:ac8:5c49:: with SMTP id j9mr18334765qtj.297.1643827794431; 
 Wed, 02 Feb 2022 10:49:54 -0800 (PST)
MIME-Version: 1.0
References: <20211009221711.2315352-1-robimarko@gmail.com>
 <163890036783.24891.8718291787865192280.kvalo@kernel.org>
 <CAOX2RU5mqUfPRDsQNSpVPdiz6sE_68KN5Ae+2bC_t1cQzdzgTA@mail.gmail.com>
 <09a27912-9ea4-fe75-df72-41ba0fa5fd4e@gmail.com>
 <CAOX2RU6qaZ7NkeRe1bukgH6OxXOPvJS=z9PRp=UYAxMfzwD2oQ@mail.gmail.com>
 <EC2778B3-B957-4F3F-B299-CC18805F8381@slashdirt.org>
In-Reply-To: <EC2778B3-B957-4F3F-B299-CC18805F8381@slashdirt.org>
From: Robert Marko <robimarko@gmail.com>
Date: Wed, 2 Feb 2022 19:49:43 +0100
Message-ID: <CAOX2RU7FOdSuo2Jgo0i=8e-4bJwq7ahvQxLzQv_zNCz2HCTBwA@mail.gmail.com>
Subject: Re: [PATCH] ath10k: support bus and device specific API 1 BDF
 selection
To: Thibaut <hacks@slashdirt.org>
Cc: Christian Lamparter <chunkeey@gmail.com>, Kalle Valo <kvalo@kernel.org>,
 kvalo@codeaurora.org, 
 davem@davemloft.net, kuba@kernel.org, ath10k@lists.infradead.org, 
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org, 
 open list <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_104956_505457_BA88E988 
X-CRM114-Status: GOOD (  20.09  )
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

S2FsbGUsCgpXaGF0IGlzIHlvdXIgb3BpbmlvbiBvbiB0aGlzPwpJIHdvdWxkIHJlYWxseSBsb3Zl
IHRvIHNlZSB0aGlzIGdldCBtZXJnZWQgYXMgd2UgYXJlIGhhdmluZyBtb3JlIGFuZAptb3JlIGRl
dmljZXMgdGhhdCBhcmUgaW1wYWN0ZWQgd2l0aG91dCBpdC4KClJlZ2FyZHMsClJvYmVydAoKT24g
RnJpLCAxNyBEZWMgMjAyMSBhdCAxMzoyNSwgVGhpYmF1dCA8aGFja3NAc2xhc2hkaXJ0Lm9yZz4g
d3JvdGU6Cj4KPgo+Cj4gPiBMZSAxNyBkw6ljLiAyMDIxIMOgIDEzOjA2LCBSb2JlcnQgTWFya28g
PHJvYmltYXJrb0BnbWFpbC5jb20+IGEgw6ljcml0IDoKPiA+Cj4gPiBPbiBXZWQsIDggRGVjIDIw
MjEgYXQgMTU6MDcsIENocmlzdGlhbiBMYW1wYXJ0ZXIgPGNodW5rZWV5QGdtYWlsLmNvbT4gd3Jv
dGU6Cj4gPj4KPiA+PiBJc24ndCB0aGUgb25seSB1c2VyIG9mIHRoaXMgdGhlIG5vbi11cHN0cmVh
bWFibGUgcmJfaGFyZGNvbmZpZwo+ID4+IG1pa3JvdGlrIHBsYXRmb3JtIGRyaXZlcj8KPgo+IFRo
ZSBkcml2ZXIgY291bGQgYmUgdXBzdHJlYW1lZCBpZiBkZXNpcmFibGUuCj4gWWV0IEkgdGhpbmsg
aXTigJlzIHF1aXRlIG9ydGhvZ29uYWwgdG8gaGF2aW5nIHRoZSBwb3NzaWJpbGl0eSB0byBkeW5h
bWljYWxseSBsb2FkIGEgZGlmZmVyZW50IEJERiB2aWEgQVBJIDEgZm9yIGVhY2ggYXZhaWxhYmxl
IHJhZGlvLCB3aGljaCBiZWZvcmUgdGhpcyBwYXRjaCBjb3VsZG7igJl0IGJlIGRvbmUgYW5kIGlz
IG5lY2Vzc2FyeSBmb3IgdGhpcyBwYXJ0aWN1bGFyIGhhcmR3YXJlLgo+Cj4gPj4gU28sIGluIHlv
dXIgY2FzZSB0aGUgZGV2aWNlcyBpbiBxdWVzdGlvbgo+ID4+IG5lZWRzIHRvIHNldHVwIGEgZGV0
b3VyIHRocm91Z2ggdGhlIHVzZXJzcGFjZSBmaXJtd2FyZSAoaGVscGVyK3NjcmlwdHMpCj4gPj4g
dG8gcHVsbCBvbiB0aGUgc3lzZnMgb2YgdGhhdCBtaWtyb3RpayBwbGF0Zm9ybSBkcml2ZXI/IFdv
dWxkbid0IGl0Cj4gPj4gYmUgcG9zc2libGUgdG8gZG8gdGhpcyBtb3JlIGRpcmVjdGx5Pwo+ID4K
PiA+IFllcywgaXRzIHRoZSBzb2xlIGN1cnJlbnQgdXNlciBhcyBpdHMgdGhlIG9ubHkgdmVuZG9y
IHNoaXBwaW5nIHRoZSBCREYKPiA+IGFzIHBhcnQgb2YgdGhlCj4gPiBmYWN0b3J5IGRhdGEgYW5k
IG5vdCBsaWtlIGEgdXNlcnNwYWNlIGJsb2IuCj4gPgo+ID4gSSBkb24ndCBzZWUgaG93IGNhbiBp
dCBiZSBtb3JlIGRpcmVjdCwgaXRzIHRoZSBzYW1lIHNldHVwIGFzIHdoZW4KPiA+IGdldHRpbmcg
cHJlLWNhbAo+ID4gZGF0YSBmb3IgbW9zdCBkZXZpY2VzIGN1cnJlbnRseS4KPgo+IEluZGVlZCwg
bm90IHN1cmUgaG93IGl0IGNvdWxkIGJlIG1vcmUgZGlyZWN0IHRoYW4gaXQgYWxyZWFkeSBpcy4g
SeKAmW0gb3BlbiB0byBzdWdnZXN0aW9ucyB0aG91Z2guCj4KPiA+IEkgYW0gYWRkaW5nIFRoaWJh
dXQgd2hvIGlzIHRoZSBhdXRob3Igb2YgdGhlIHBsYXRmb3JtIGRyaXZlci4KPgo+IEJlc3QsCj4g
VGhpYmF1dAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
