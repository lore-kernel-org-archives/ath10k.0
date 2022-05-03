Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81ECAC433EF
	for <ath10k@archiver.kernel.org>; Tue,  3 May 2022 15:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=73cEupzw0NskykVeZBIRPEK73a6kNkpC3ak5i9mf7LU=; b=NHWfuo82cPRKWU
	I5sSoDurVxt2mF/2ygh0GJfgQUZ2bjlKQHOmaOBmIWf68ScHb2o9XnWTehvrrgN1HUFYD6+Enw9rK
	S4eA2vxHaBaxeCALmVR9L8J0XVGwN1To/rlnEof2WjURDUGBu2qNQQTv7FNoLVxMMRGBt6oaD8s2h
	5Q9i5Y+5AKbxP9Up4fpU/uFDecfXRN8EOtzrfRhq8tKMwt3cMCWAUlKxIy0lfwm6Bx5Msig/btaNW
	HWWteSQHe3I6JWeVMEzF5wcPL4GCjrxaOyVq/+343KlxYnB1v8w1pgNGBGBcu7f6rUmwiJkquCv76
	z7qPBgS20L8jhiENVKbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nluuq-006d3S-Gb; Tue, 03 May 2022 15:58:20 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nluun-006d1o-Jl
 for ath10k@lists.infradead.org; Tue, 03 May 2022 15:58:19 +0000
Received: by mail-qt1-x829.google.com with SMTP id o11so13715536qtp.13
 for <ath10k@lists.infradead.org>; Tue, 03 May 2022 08:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=66qLlJx7nKrNSsQ33ieGox6v7vdk5wYAsgHq0JYbR7U=;
 b=GU7ZZ/4jdmm749iUiJVRCIcPeLZcuoc09ThrWS55XaIe0iWJcOrq3NCgG1FOka+F3C
 ZmkSJ4HFoVOyzzf3+xlOWOJxi8mU+ckUhZbyIJXEeYec1x43FV5KAfgJOvN439PiZtkm
 NlUdvMEqaNQt2RyjERWTx84VUQGo6QHDQjHxe+/Gp4FLE1v87lDZ3a91JQAS5D7IBdA8
 gguUf+C8ZN4inU2sk1Gx5IZtDWh99fsY8eiH8tumQCfFSYWNMJ0QeahN1MKGK0GsZPBl
 XbmlDVpzpFHBnLSaGQxOQotypnLnwC9WJzN3nj7AUNPbERXgPqM/nwm7NPRA5tG+BqCB
 k2sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=66qLlJx7nKrNSsQ33ieGox6v7vdk5wYAsgHq0JYbR7U=;
 b=cIZJn1C6j54Cp9JEwQWyD91AFLF8WXriBuFyEQBUxZQdiJaLCPn7rdaGsPSI3tBghu
 b7ut0bICx+sESFwlQMjTvYKs31ATMPJmipJXIBeACP5j6N9f/2b9P/AZkMDPMv4uqO0d
 TeGwFrZJLWy0afVOX8pJAGiHp7myl5HxLA395Rs3r8okDeF43pmwLdljxpRzgNd5Dpj0
 3XUeBavDzsY/R/lCubUdVVOtgU+FWxU/L2dMYtHCRT67iDRftgLKHFDHX6hUjlnL3YJC
 wWKBcuN7vjRR9AfDGqrKB3IjC8VC7mFexHeZqeouiUeZBqYQvYg1FKqntxQ8o9/ocKJv
 Kh2g==
X-Gm-Message-State: AOAM533Hy+kb08QBfZyDQUtLhsQciMxtpdg26SFVTJxx2vu7KLIQUtbP
 Mafu6CB/IHJWLJlfpMt/2T5Inp26mQRwXhJbfJ4=
X-Google-Smtp-Source: ABdhPJwSVdBAXX6iPX6P1vVEDTK43ohrO2wPIvLWaEqfD4QNwUWnOiDyLgYzKn27UDN3LLuxuLcLlcHI870+g4wbN44=
X-Received: by 2002:a05:622a:155:b0:2f3:9484:c38e with SMTP id
 v21-20020a05622a015500b002f39484c38emr15379813qtw.494.1651593494861; Tue, 03
 May 2022 08:58:14 -0700 (PDT)
MIME-Version: 1.0
References: <20211009221711.2315352-1-robimarko@gmail.com>
 <163890036783.24891.8718291787865192280.kvalo@kernel.org>
 <CAOX2RU5mqUfPRDsQNSpVPdiz6sE_68KN5Ae+2bC_t1cQzdzgTA@mail.gmail.com>
 <09a27912-9ea4-fe75-df72-41ba0fa5fd4e@gmail.com>
 <CAOX2RU6qaZ7NkeRe1bukgH6OxXOPvJS=z9PRp=UYAxMfzwD2oQ@mail.gmail.com>
 <EC2778B3-B957-4F3F-B299-CC18805F8381@slashdirt.org>
 <CAOX2RU7FOdSuo2Jgo0i=8e-4bJwq7ahvQxLzQv_zNCz2HCTBwA@mail.gmail.com>
 <CAOX2RU7d9amMseczgp-PRzdOvrgBO4ZFM_+hTRSevCU85qT=kA@mail.gmail.com>
 <70a8dd7a-851d-686b-3134-50f21af0450c@gmail.com>
 <7DCB1B9A-D08E-4837-B2FE-6DA476B54B0D@slashdirt.org>
In-Reply-To: <7DCB1B9A-D08E-4837-B2FE-6DA476B54B0D@slashdirt.org>
From: Robert Marko <robimarko@gmail.com>
Date: Tue, 3 May 2022 17:58:03 +0200
Message-ID: <CAOX2RU7kF8Da8p_tHwuE-8YMXr5ZtWU2iL6ZY+UR+1OvGcyn+w@mail.gmail.com>
Subject: Re: [PATCH] ath10k: support bus and device specific API 1 BDF
 selection
To: Thibaut <hacks@slashdirt.org>
Cc: Christian Lamparter <chunkeey@gmail.com>, Kalle Valo <kvalo@kernel.org>,
 kvalo@codeaurora.org, 
 davem@davemloft.net, kuba@kernel.org, ath10k@lists.infradead.org, 
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org, 
 open list <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_085817_704623_D041061A 
X-CRM114-Status: GOOD (  17.63  )
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

T24gV2VkLCAxNiBGZWIgMjAyMiBhdCAyMjo1NSwgVGhpYmF1dCA8aGFja3NAc2xhc2hkaXJ0Lm9y
Zz4gd3JvdGU6Cj4KPiBIaSwKPgo+ID4gTGUgMTYgZsOpdnIuIDIwMjIgw6AgMjI6MTksIENocmlz
dGlhbiBMYW1wYXJ0ZXIgPGNodW5rZWV5QGdtYWlsLmNvbT4gYSDDqWNyaXQgOgo+ID4KPiA+IEhp
LAo+ID4KPiA+IE9uIDE2LzAyLzIwMjIgMTQ6MzgsIFJvYmVydCBNYXJrbyB3cm90ZToKPiA+PiBT
aWxlbnQgcGluZywKPiA+PiBEb2VzIGFueWJvZHkgaGF2ZSBhbiBvcGluaW9uIG9uIHRoaXM/Cj4g
Pgo+ID4gQXMgYSBmYWxsYmFjaywgSSd2ZSBjb2JibGVkIHRvZ2V0aGVyIGZyb20gdGhlIG9sZCBz
Y3JpcHRzIHRoYXQKPiA+ICJjb25jYXQgYm9hcmQuYmluIGludG8gYSBib2FyZC0yLmJpbi4gRG8g
dGhpcyBvbiB0aGUgZGV2aWNlCj4gPiBpbiB1c2Vyc3BhY2Ugb24gdGhlIGZseSIgaWRlYS4gVGhp
cyB3YXMgc3VjY2Vzc2Z1bGx5IHRlc3RlZAo+ID4gb24gb25lIG9mIHRoZSBhZmZlY3RlZCBkZXZp
Y2VzIChNaWtyb1RpayBTWFRzcSA1IGFjIChSQlNYVHNxRy01YWNEKSkKPiA+IGFuZCBzaG91bGQg
d29yayBmb3IgYWxsIE1pa3JvVGlrLgo+ID4KPiA+ICJpcHE0MHh4OiBkeW5hbWljYWxseSBidWls
ZCBib2FyZC0yLmJpbiBmb3IgTWlrcm90aWsiCj4gPiA8aHR0cHM6Ly9naXQub3BlbndydC5vcmcv
P3A9b3BlbndydC9zdGFnaW5nL2NodW5rZWV5LmdpdDthPWNvbW1pdDtoPTUyZjM0MDdkOTRkYTYy
Yjk5YmE2YzA5ZjM2NjM0NjRjY2NkMjliNGY+Cj4gPiAodGhvdWdoIEkgZG9uJ3QgdGhpbmsgdGhp
cyBsaW5rIHdpbGwgc3RheSBhY3RpdmUgZm9yCj4gPiB0b28gbG9uZy4pCj4KPiBJTUhPIFJvYmVy
dOKAmXMgcGF0Y2ggYWRkcmVzc2VzIGFuIGFjdHVhbCBidWcgaW4gYXRoMTBrIHdoZXJlYnkgdGhl
IGRyaXZlciBzZW5kcyB0aGUgc2FtZSBkZXZwYXRoIGZvciB0d28gZGlmZmVyZW50IGRldmljZXMg
d2hlbiByZXF1ZXN0aW5nIGJvYXJkLTEgQkRGLCB3aGljaCBkb2VzbuKAmXQgc2VlbSByaWdodC4K
Pgo+IFlvdXIgcHJvcG9zYWwgaXMgbGVzcyBzdHJhaWdodGZvcndhcmQgdGhhbiB1c2luZyB1bm1v
ZGlmaWVkIGJvYXJkLTEgZGF0YSAoYXMgY291bGQgYmUgZG9uZSBpZiB0aGUgYWJvdmUgYnVnIGRp
ZCBub3Qgb2NjdXIpIGFuZCBuZWdhdGVzIHRoZSBwcmV2aW91cyBlZmZvcnRzIG5vdCB0byBzdG9y
ZSB0aGlzIGRhdGEgb24gZmxhc2ggKHVzaW5nIGluc3RlYWQgdGhlIGtlcm5lbOKAmXMgZG9jdW1l
bnRlZCBmaXJtd2FyZSBzeXNmcyBsb2FkaW5nIGZhY2lsaXR5IC0gYWdhaW4gcG9zc2libGUgd2l0
aG91dCB0aGUgYWJvdmUgaXNzdWUpLgo+Cj4gSFRICj4gVC1Cb25lCgpLYWxsZSwgYW55IGNoYW5j
ZSBvZiByZXZpZXdpbmcgdGhpcz8KSXQganVzdCBicmluZ3MgdGhlIGJvYXJkIGRhdGEgaW4gbGlu
ZSB3aXRoIGNhbGRhdGEgYXMgZmFyIGFzIG5hbWluZyBnb2VzLgoKUmVnYXJkcywKUm9iZXJ0Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFp
bGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
