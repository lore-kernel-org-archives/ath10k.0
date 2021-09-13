Return-Path: <SRS0=Js5E=OD=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AF25C433EF
	for <ath10k@archiver.kernel.org>; Mon, 13 Sep 2021 23:40:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 203E360FC0
	for <ath10k@archiver.kernel.org>; Mon, 13 Sep 2021 23:40:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 203E360FC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kali.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=TqL6AMVNbXQQBLXL9kzAqKFKhO6pzrW6tz7cl/sFHHE=; b=TEtNcXH8CGuxKZ+iqMsSLjdJmd
	OX61agB1Z/n436r+0MjaVhcWAZ1jSa8+7viDD8zqPVGSe0OvDlalk9sPI2iIeFfykyDvT/j1wpu0W
	vdnXipXvfD4KD0hH/Q9+WQjAQUEHsV4CsIvXWsWJ2odBpeGm9Smrv3M2AubP2zwBG2xcHrHOeSVQ7
	kVjWsgk/3NRe09+ShN5dKQSDs7ecyoVNw5FHISq915PQhHMDj4fon2Tg2Kao7ISHF2HuTezO5f1X2
	FXfD0tBvxdZjuczFIBG4GDhf0/sKPLx0BvMbsuN0Crhnr3mbNphOJAYpJ4IXJRRLst6YYPkgQoxdv
	9+QqlYCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPvYS-003fIT-9j; Mon, 13 Sep 2021 23:40:04 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPvYO-003fHe-Hc
 for ath10k@lists.infradead.org; Mon, 13 Sep 2021 23:40:02 +0000
Received: by mail-oi1-x22d.google.com with SMTP id v2so16379622oie.6
 for <ath10k@lists.infradead.org>; Mon, 13 Sep 2021 16:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kali.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=ihysQIdGR8w+AiS+ReWp8DK2aVapwmF1UvOCNcDhHKc=;
 b=IRIIEViIbrzd5kpmoPo6R+Oy3FbupEZKJ6mcTM8r782MvEpzOb2C7MJtR4EBx3lXie
 CHl/9FYY3aeP6vQqOWBveC/ddBGSnwPWxnSDNX+l8j/LyDSs0YyJA0V5kzPVq7OqGLUj
 AEtm0/7Jp51ctNjxsGlrTzmlPOU5/8x2CSs0IpWDN90SvGP5TfTkt/g/hzR+tufLr6UW
 yuDGmsKRIR8E1QzgPqi5oDRRANvSTE9+mxDwDs94C0lx6P9LsTFRwoTL9CrjQGlmDaN4
 HDVImDXi1v0SNfnC3VTDuj2dkOAwgst8eQllcU1qKkyr+yCz3r7Jo2YSvd1sJU/nVriu
 D+9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=ihysQIdGR8w+AiS+ReWp8DK2aVapwmF1UvOCNcDhHKc=;
 b=f+xrhOOfD88eFzq8IghsUbpav6iaKVIjqHlVz6MNAu1Nt5C+/LcnLt5CUQREqaNAQV
 1Qxyp3Yekg1eTwGe6aVHYA4RocdpTQif1eWyrZTB2UqakMIsqprrbrAW/gp/FXkErqlp
 3OKDLPaIwbYIzY/e3ZpPyi8avxR12XRxTRRQTW5bImpCb+6VnaLKSgiOmQDV4mwrMJAe
 j4GzokYdbyR1uPHj3u+7hDlnGaY0wEhKGYTUrhB1RwdlxtvnyReiVNLa70mj8juLGiDY
 u6BftYe3EgKsM9AEMrlwXQFemBaFS/RQdNbbTdRfta16VuzAonwcNrabt9YXkO/yxE55
 ufyw==
X-Gm-Message-State: AOAM533Xu7cykzIgKmYwZm7eMmqyHRqVEMip9EdSlCtGAdPUKUINJc9L
 /HTOytLYtpwPjPxWBs1f3ldClg==
X-Google-Smtp-Source: ABdhPJwV6GzMZQ+mNOpdRRBX3HLArICooddBup3dlenG8aQ6qcgGviIlOFg9Jtdit/VWiu2IZB/GZw==
X-Received: by 2002:aca:914:: with SMTP id 20mr9750235oij.9.1631576397694;
 Mon, 13 Sep 2021 16:39:57 -0700 (PDT)
Received: from MacBook-Pro.hackershack.net
 (cpe-173-173-107-246.satx.res.rr.com. [173.173.107.246])
 by smtp.gmail.com with ESMTPSA id u15sm2208500oor.34.2021.09.13.16.39.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 16:39:57 -0700 (PDT)
Subject: Re: [RFC v2 00/13] create power sequencing subsystem
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Stanimir Varbanov <svarbanov@mm-sol.com>
Cc: linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org
References: <20210829131305.534417-1-dmitry.baryshkov@linaro.org>
From: Steev Klimaszewski <steev@kali.org>
Message-ID: <4a508fc1-6253-9c11-67fb-f84f17fd2719@kali.org>
Date: Mon, 13 Sep 2021 18:39:55 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210829131305.534417-1-dmitry.baryshkov@linaro.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210913_164000_640425_472AAF37 
X-CRM114-Status: GOOD (  32.16  )
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

Ck9uIDgvMjkvMjEgODoxMiBBTSwgRG1pdHJ5IEJhcnlzaGtvdiB3cm90ZToKPiBUaGlzIGlzIHRo
ZSBzZWNvbmQgUkZDIG9uIHRoZSBwcm9wb3NlZCBwb3dlciBzZXF1ZW5jZXIgc3Vic3lzdGVtLiBU
aGlzCj4gaXMgYSBnZW5lcmlmaWNhdGlvbiBvZiB0aGUgTU1DIHB3cnNlcSBjb2RlLiBUaGUgc3Vi
c3lzdGVtIHRyaWVzIHRvCj4gYWJzdHJhY3QgdGhlIGlkZWEgb2YgY29tcGxleCBwb3dlci11cC9w
b3dlci1kb3duL3Jlc2V0IG9mIHRoZSBkZXZpY2VzLgo+Cj4gVG8gZWFzZSBtaWdyYXRpb24gdG8g
cHdyc2VxIGFuZCB0byBwcm92aWRlIGNvbXBhdGliaWxpdHkgd2l0aCBvbGRlcgo+IGRldmljZSB0
cmVlcywgd2hpbGUga2VlcGluZyBkcml2ZXJzIHNpbXBsZSwgdGhpcyBpdGVyYXRpb24gb2YgUkZD
Cj4gaW50cm9kdWNlcyBwd3JzZXEgZmFsbGJhY2sgc3VwcG9ydDogcHdyc2VxIGRyaXZlciBjYW4g
cmVnaXN0ZXIgZmFsbGJhY2sKPiBwcm92aWRlcnMuIElmIGFub3RoZXIgZGV2aWNlIGRyaXZlciBy
ZXF1ZXN0cyBwd3JzZXEgaW5zdGFuY2UgYW5kIG5vbmUKPiB3YXMgZGVjbGFyZWQsIHRoZSBwd3Jz
ZXEgZmFsbGJhY2sgY29kZSB3b3VsZCBnbyB0aHJvdWdoIHRoZSBsaXN0IG9mCj4gZmFsbGJhY2sg
cHJvdmlkZXJzIGFuZCBpZiB0aGUgbWF0Y2ggaXMgZm91bmQsIGRyaXZlciB3b3VsZCByZXR1cm4g
YQo+IGNyYWZ0ZWQgcHdyc2VxIGluc3RhbmNlLiBGb3Igbm93IHRoaXMgbWVjaGFuaXNtIGlzIGxp
bWl0ZWQgdG8gdGhlIE9GCj4gZGV2aWNlIG1hdGNoaW5nLCBidXQgaXQgY2FuIGJlIGV4dGVuZGVk
IGZ1cnRoZXIgdG8gdXNlIGFueSBjb21iaW5hdGlvbgo+IG9mIGRldmljZSBJRHMuCj4KPiBUaGUg
cHJpbWFyeSBzZXQgb2YgZGV2aWNlcyB0aGF0IHByb210ZWQgbWUgdG8gY3JlYXRlIHRoaXMgcGF0
Y2hzZXQgaXMKPiB0aGUgUXVhbGNvbW0gQlQrV2lGaSBmYW1pbHkgb2YgY2hpcHMuIFRoZXkgcmVz
aWRlIG9uIHNlcmlhbCtwbGF0Zm9ybSBvcgo+IHNlcmlhbCArIFNESU8gaW50ZXJmYWNlcyAob2xk
ZXIgZ2VuZXJhdGlvbnMpIG9yIG9uIHNlcmlhbCtQQ0llIChuZXdlcgo+IGdlbmVyYXRpb25zKS4g
IFRoZXkgcmVxdWlyZSBhIHNldCBvZiBleHRlcm5hbCB2b2x0YWdlIHJlZ3VsYXRvcnMgdG8gYmUK
PiBwb3dlcmVkIG9uIGFuZCAoc29tZSBvZiB0aGVtKSBoYXZlIHNlcGFyYXRlIFdpRmkgYW5kIEJs
dWV0b290aCBlbmFibGUKPiBHUElPcy4KPgo+IFRoaXMgcGF0Y2hzZXQgYmVpbmcgYW4gUkZDIHRy
aWVzIHRvIGRlbW9uc3RyYXRlIHRoZSBhcHByb2FjaCwgZGVzaWduIGFuZAo+IHVzYWdlIG9mIHRo
ZSBwd3JzZXEgc3Vic3lzdGVtLiBGb2xsb3dpbmcgaXNzdWVzIGFyZSBwcmVzZW50IGluIHRoZSBS
RkMKPiBhdCB0aGlzIG1vbWVudCBidXQgd2lsbCBiZSBmaXhlZCBsYXRlciBpZiB0aGUgb3ZlcmFs
bCBhcHByb2FjaCB3b3VsZCBiZQo+IHZpZXdlZCBhcyBhY2NlcHRhYmxlOgo+Cj4gIC0gTm8gZG9j
dW1lbnRhdGlvbgo+ICAgIFdoaWxlIHRoZSBjb2RlIHRyaWVzIHRvIGJlIHNlbGYtZG9jdW1lbnRp
bmcgcHJvcGVyIGRvY3VtZW50YXRpb24KPiAgICB3b3VsZCBiZSByZXF1aXJlZC4KPgo+ICAtIE1p
bmltYWwgZGV2aWNlIHRyZWUgYmluZGluZ3MgY2hhbmdlcwo+ICAgIFRoZXJlIGFyZSBubyBwcm9w
ZXIgdXBkYXRlcyBmb3IgdGhlIERUIGJpbmRpbmdzICh0aHVzIG5laXRoZXIgUm9iCj4gICAgSGVy
cmluZyBub3IgZGV2aWNldHJlZSBhcmUgaW5jbHVkZWQgaW4gdGhlIFRvL0NjIGxpc3RzKS4gVGhl
IGR0Cj4gICAgc2NoZW1hIGNoYW5nZXMgd291bGQgYmUgYSBwYXJ0IG9mIHYxLgo+Cj4gIC0gTGFj
ayBvZiBwcm9wZXIgUENJZSBpbnRlZ3JhdGlvbgo+ICAgIEF0IHRoaXMgbW9tZW50IHN1cHBvcnQg
Zm9yIFBDSWUgaXMgaGFja2VkIHVwIHRvIGJlIGFibGUgdG8gdGVzdCB0aGUKPiAgICBQQ0llIHBh
cnQgb2YgcWNhNjM5MC4gUHJvcGVyIFBDSWUgc3VwcG9ydCB3b3VsZCByZXF1aXJlIGF1dG9tYXRp
Y2FsbHkKPiAgICBwb3dlcmluZyB1cCB0aGUgZGV2aWNlcyBiZWZvcmUgdGhlIGJ1cyBzY2FuIGRl
cGVuZGluZyBvbiB0aGUgcHJvcGVyCj4gICAgZGV2aWNlIHN0cnVjdHVyZSBpbiB0aGUgZGV2aWNl
IHRyZWUuCj4KPiBDaGFuZ2VzIHNpbmNlIFJGQyB2MToKPiAgLSBQcm92aWRlciBwd3JzZXEgZmFs
bGJhY2sgc3VwcG9ydAo+ICAtIEltcGxlbWVudCBmYWxsYmFjayBzdXBwb3J0IGluIHB3cnNlcV9x
Y2EuCj4gIC0gTW1vdmUgc3VzY2xrIGhhbmRsaW5nIHRvIHB3cnNlcV9xY2EuCj4gIC0gU2lnbmlm
aWNhbnRseSBzaW1wbGlmeSBoY2lfcWNhLmMgY2hhbmdlcywgYnkgZHJvcHBpbmcgYWxsIGxlZ2Fj
eQo+ICAgIGNvZGUuIE5vdyBoY2lfcWNhIHVzZXMgb25seSBwd3JzZXEgY2FsbHMgdG8gcG93ZXIg
dXAvZG93biBibHVldG9vdGgKPiAgICBwYXJ0cyBvZiB0aGUgY2hpcC4KPgpJIHRlc3RlZCB0aGlz
IGhlcmUsIG9uIHRoZSBMZW5vdm8gWW9nYSBDNjMwLCBhZnRlciBjcmVhdGluZyBhIHBhdGNoIHRv
CmRvIGJhc2ljYWxseSB0aGUgc2FtZSB0aGluZyBhcyB0aGUgZGI4NDVjIGRvZXMuwqAgT25lIHRo
aW5nIEkgbm90aWNlZCwgaWYKUFdSU0VRPXkgYW5kIHRoZSByZXN0IGFyZSA9bSwgdGhlcmUgaXMg
YSBidWlsZCBlcnJvci7CoCBJIHN1cHBvc2Ugb25jZQp0aGUgZnVsbCBzZXQgaXMgcG9zdGVkIGFu
ZCBub3QgUkZDLCBJIGNhbiBzZW5kIHRoZSBwYXRjaCBmb3IgdGhhdC7CoAoKT25lIHF1ZXN0aW9u
IEkgaGF2ZSwgaWYgeW91IGRvbid0IG1pbmQsIGluIHBhdGNoIDExLCB5b3UgYWRkIGEgc2Vjb25k
CmNoYW5uZWwgdG8gcWNhIHBvd2VyIHNlcXVlbmNlci7CoCBJJ3ZlIGFkZGVkIHRoYXQgaGVyZSwg
YnV0IGluIHRoZSBjNjMwJ3MKZHRzLCAidnJlZ19sMjNhXzNwMzogbGRvMjMiIGlzIGVtcHR5LCBz
byBJIGFkZGVkIHRoZSBzYW1lIG51bWJlcnMgaW4gZm9yCnRoZSByZWd1bGF0b3IsIGFuZCBJJ20g
d29uZGVyaW5nIGhvdyB0byB0ZXN0IHRoYXQgaXQncyBhY3R1YWxseSB3b3JraW5nCmNvcnJlY3Rs
eT8KCi0tIHN0ZWV2CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
