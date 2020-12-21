Return-Path: <SRS0=1k1S=FZ=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CF71C433E0
	for <ath10k@archiver.kernel.org>; Mon, 21 Dec 2020 19:32:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22CA122B43
	for <ath10k@archiver.kernel.org>; Mon, 21 Dec 2020 19:32:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22CA122B43
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8qGMofchw/Mg7jq2DslC++GNHexu01bCyEp8MHFuw6Q=; b=l4I8rmfV2R58ZrZbQm/y68wNZ
	3lnK2IHlcgjkbMgRaqo39j6qPFcYJycE3dIu/PkLl1OvK2oeJ459GaEbL8Ps2OlL4ARqXEEX3p5hz
	gaxdnxFbO+zCE5Olf7ypsLSEkbFINCynSK7HPR/fUh4F4+RIQuwkYyzQEIdvWLq+2Tqgf4REkTjj4
	yy7O9D88x8MfGptmHG0gC9QWx2ydxK21NEXEIrwYAVRYR+PF1LMSmWVrUYYKRtXP45yBYyyXKzpcj
	NFnnEbWKs9MsRAjuWFKzGNrEkRDwzWJ6/OFQvfCFwWlpQouw1bE1daG67bwufAhh0QZFBzDkXV23D
	t9Tun3Nlg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krQuV-0003Au-US; Mon, 21 Dec 2020 19:32:00 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krQuT-0003AQ-HQ
 for ath10k@lists.infradead.org; Mon, 21 Dec 2020 19:31:58 +0000
Received: by mail-ot1-x330.google.com with SMTP id 11so9800565oty.9
 for <ath10k@lists.infradead.org>; Mon, 21 Dec 2020 11:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=N5yF8MX27ibe8pYaUNX9jkjz98WF9cXm94+NVHlwyyc=;
 b=GrhC+e8EhcqI7uTngJIjhv7kKLDWW5kVVFQXdUvjlcvZ74knhY4R1EZpQiii79P0ds
 eKRLxsKJ3wA8dQAS5ypOvr+nhykt2QxF4/2EWKBD2ITGhHwNGWpJ4VebS7uUL0+WaPys
 KjDhC7ncbVv1SUcX2cz4GX99kfQ99IzB0GBx0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=N5yF8MX27ibe8pYaUNX9jkjz98WF9cXm94+NVHlwyyc=;
 b=m+tSAvxw21OmFtO+FYTulLI+rHKoGaqS+jWYcHcZE3IsLh9+wJMnuoYQQxjmNDRIfN
 zDLHwgL6ASNoaTSUMBc6VvG08qVXiJ5LizjnSLpUuelAMINAeeHGSLKz4EQ8qqSYsmS+
 ZxmXOU+Yh+W4Jj3101f1s3LbYwpAqKZdOkOcq0hgKqdQXuqQFCSHu4kEI1cgUj4PTWS5
 Klefe0Nd7R1p/mvLtXBm0ozk1JinekWc1RdGmZ89YwchlSHyXDFFSdHgP8jfOXAU7j9c
 iE38zmPOHFs7geRgO1NoUtBcdxa7ZM9EcpVC3l1oVXYvZHMwc0B/LnzNXoUcbO9z5RDu
 Jpng==
X-Gm-Message-State: AOAM531jyL6/cuHkD9vt3xZugUPvAqUrnJtMa5f9HscmlBC8kSWp2wrs
 Oj4E4d2vZQPS4BvKKEWP0OjHp9f8joTSpg==
X-Google-Smtp-Source: ABdhPJzMzWhBYN++r+Wl009DWbveasK/dtY4Jqt3SlcxNL4R5noVk12WSehNuJt+pbvKVZaRpQ6r3A==
X-Received: by 2002:a9d:4b03:: with SMTP id q3mr13087695otf.88.1608579114679; 
 Mon, 21 Dec 2020 11:31:54 -0800 (PST)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com.
 [209.85.167.175])
 by smtp.gmail.com with ESMTPSA id d10sm344541ooh.32.2020.12.21.11.31.53
 for <ath10k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Dec 2020 11:31:53 -0800 (PST)
Received: by mail-oi1-f175.google.com with SMTP id x13so12401227oic.5
 for <ath10k@lists.infradead.org>; Mon, 21 Dec 2020 11:31:53 -0800 (PST)
X-Received: by 2002:aca:af4d:: with SMTP id y74mr11678757oie.105.1608579112704; 
 Mon, 21 Dec 2020 11:31:52 -0800 (PST)
MIME-Version: 1.0
References: <1608515579-1066-1-git-send-email-miaoqing@codeaurora.org>
In-Reply-To: <1608515579-1066-1-git-send-email-miaoqing@codeaurora.org>
From: Brian Norris <briannorris@chromium.org>
Date: Mon, 21 Dec 2020 11:31:40 -0800
X-Gmail-Original-Message-ID: <CA+ASDXP8LotnQZNvXYZqfYH8za6rx1DaZmnH21TsO2NmzX+OZA@mail.gmail.com>
Message-ID: <CA+ASDXP8LotnQZNvXYZqfYH8za6rx1DaZmnH21TsO2NmzX+OZA@mail.gmail.com>
Subject: Re: [PATCH] ath10k: fix wmi mgmt tx queue full due to race condition
To: Miaoqing Pan <miaoqing@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201221_143157_611938_B8142B0D 
X-CRM114-Status: GOOD (  13.66  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
 ath10k <ath10k@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

SGksCgpPbiBTdW4sIERlYyAyMCwgMjAyMCBhdCA1OjUzIFBNIE1pYW9xaW5nIFBhbiA8bWlhb3Fp
bmdAY29kZWF1cm9yYS5vcmc+IHdyb3RlOgo+Cj4gRmFpbGVkIHRvIHRyYW5zbWl0IHdtaSBtYW5h
Z2VtZW50IGZyYW1lczoKPgo+IFs4NDk3Ny44NDA4OTRdIGF0aDEwa19zbm9jIGEwMDAwMDAud2lm
aTogd21pIG1nbXQgdHggcXVldWUgaXMgZnVsbAo+IFs4NDk3Ny44NDA5MTNdIGF0aDEwa19zbm9j
IGEwMDAwMDAud2lmaTogZmFpbGVkIHRvIHRyYW5zbWl0IHBhY2tldCwgZHJvcHBpbmc6IC0yOAo+
IFs4NDk3Ny44NDA5MjRdIGF0aDEwa19zbm9jIGEwMDAwMDAud2lmaTogZmFpbGVkIHRvIHN1Ym1p
dCBmcmFtZTogLTI4Cj4gWzg0OTc3Ljg0MDkzMl0gYXRoMTBrX3Nub2MgYTAwMDAwMC53aWZpOiBm
YWlsZWQgdG8gdHJhbnNtaXQgZnJhbWU6IC0yOAo+Cj4gVGhpcyBpc3N1ZSBpcyBjYXVzZWQgYnkg
cmFjZSBjb25kaXRpb24gYmV0d2VlbiBza2JfZGVxdWV1ZSBhbmQKPiBfX3NrYl9xdWV1ZV90YWls
LiBUaGUgcXVldWUgb2Yg4oCYd21pX21nbXRfdHhfcXVldWXigJkgaXMgcHJvdGVjdGVkIGJ5IGEK
PiBkaWZmZXJlbnQgbG9jazogYXItPmRhdGFfbG9jayB2cyBsaXN0LT5sb2NrLCB0aGUgcmVzdWx0
IGlzIG5vIHByb3RlY3Rpb24uCgpOaWNlIGNhdGNoIQoKPiAtLS0gYS9kcml2ZXJzL25ldC93aXJl
bGVzcy9hdGgvYXRoMTBrL21hYy5jCj4gKysrIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0
aDEway9tYWMuYwo+IEBAIC0zNzYzLDIzICszNzYzLDE2IEBAIGJvb2wgYXRoMTBrX21hY190eF9m
cm1faGFzX2ZyZXEoc3RydWN0IGF0aDEwayAqYXIpCj4gIHN0YXRpYyBpbnQgYXRoMTBrX21hY190
eF93bWlfbWdtdChzdHJ1Y3QgYXRoMTBrICphciwgc3RydWN0IHNrX2J1ZmYgKnNrYikKPiAgewo+
ICAgICAgICAgc3RydWN0IHNrX2J1ZmZfaGVhZCAqcSA9ICZhci0+d21pX21nbXRfdHhfcXVldWU7
Cj4gLSAgICAgICBpbnQgcmV0ID0gMDsKPiAtCj4gLSAgICAgICBzcGluX2xvY2tfYmgoJmFyLT5k
YXRhX2xvY2spOwo+Cj4gICAgICAgICBpZiAoc2tiX3F1ZXVlX2xlbihxKSA9PSBBVEgxMEtfTUFY
X05VTV9NR01UX1BFTkRJTkcpIHsKCkkgYmVsaWV2ZSB5b3Ugc2hvdWxkIGJlIHN3aXRjaGluZyB0
aGlzIHRvIHVzZSBza2JfcXVldWVfbGVuX2xvY2tsZXNzKCkKdG9vLiBBbmQgdGhpcyBzdGlsbCBw
cm9iYWJseSBsZWF2ZXMgYSBUT0NUT1UgcmFjZTsgbWF5YmUgd2Ugc2hvdWxkIHVzZQoiPj0iIGhl
cmUsIGluIGNhc2Ugd2UgcXVldWUgYSBmZXcgU0tCcyBzaW11bHRhbmVvdXNseT8gSXQgZG9lc24n
dCBzZWVtCmxpa2Ugd2UgYWN0dWFsbHkgaGF2ZSBhIGhhcmQgbGltaXQgaGVyZSwgYnV0IGl0IHN0
aWxsIHNlZW1zIGxpa2Ugd2UKc2hvdWxkbid0IGxlYXZlIHRoaXMgcG90ZW50aWFsIGluY29uc2lz
dGVuY3kuCgpCcmlhbgoKPiAgICAgICAgICAgICAgICAgYXRoMTBrX3dhcm4oYXIsICJ3bWkgbWdt
dCB0eCBxdWV1ZSBpcyBmdWxsXG4iKTsKPiAtICAgICAgICAgICAgICAgcmV0ID0gLUVOT1NQQzsK
PiAtICAgICAgICAgICAgICAgZ290byB1bmxvY2s7Cj4gKyAgICAgICAgICAgICAgIHJldHVybiAt
RU5PU1BDOwo+ICAgICAgICAgfQo+Cj4gLSAgICAgICBfX3NrYl9xdWV1ZV90YWlsKHEsIHNrYik7
Cj4gKyAgICAgICBza2JfcXVldWVfdGFpbChxLCBza2IpOwo+ICAgICAgICAgaWVlZTgwMjExX3F1
ZXVlX3dvcmsoYXItPmh3LCAmYXItPndtaV9tZ210X3R4X3dvcmspOwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgx
MGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2F0aDEwawo=
