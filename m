Return-Path: <SRS0=ZwL9=F4=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51234C433E0
	for <ath10k@archiver.kernel.org>; Thu, 24 Dec 2020 17:08:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3E6622288
	for <ath10k@archiver.kernel.org>; Thu, 24 Dec 2020 17:08:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3E6622288
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=candelatech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:From:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HChvS8dWnjARwf17Br7YcC2CGKApf99+YpLgzpXC0cM=; b=s81tchcDC6d17IF1YtgJ4wI9b
	TunnX2063BBtHSR+HVZWAKI/F9pyx1JaCWpCYBTZm/lMBiPGZLxec1CItROXkWjng+9m98npgyUzK
	O20TjkbHlZ7tRgWogJ/k0DNWllzh4sQjLeQu9xKDZ5UpomnR9Sn0kVzT8VhRPt2bduzuQkQswlSye
	f5+XO4Gk8uxjXGbVn90xAP90Ls2BtJlporIBNcsnqd9ZFil/dH6+66Nr0y6ciNfoW72nBtJbZogcz
	M3THfvUYBKHlez5p9kxNwcLzBQdgXdPAWwDnjHXnVq5nWiSQvMXCgEsLn9W+QvP1OBvU/Am+BjO3j
	6YnkYpevA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ksU65-0003JZ-JF; Thu, 24 Dec 2020 17:08:17 +0000
Received: from mail2.candelatech.com ([208.74.158.173]
 helo=mail3.candelatech.com)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ksU63-0003J2-GR
 for ath10k@lists.infradead.org; Thu, 24 Dec 2020 17:08:16 +0000
Received: from [192.168.254.6] (unknown [50.46.158.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail3.candelatech.com (Postfix) with ESMTPSA id 7839313C2B0;
 Thu, 24 Dec 2020 09:08:13 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com 7839313C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
 s=default; t=1608829693;
 bh=oCowPKW6aP6ZhyDp64QY45cgY8fT8fWhW+s1yumAXc0=;
 h=Subject:From:To:References:Date:In-Reply-To:From;
 b=CZeIwiH0kGcdGDwwmLLGRSf5OVSRjWFxLZSX0sDgC8DvGTUX8xWhYICqF8RGXhX3Q
 9Q+DnHZSQhoKQ/dB70T073PIj085ZbDKOUAMAKXk1LPrBWq2+Py7LsbZDydYlC3dB/
 Y8To0BxNsg8Dn0vEz74tDJrbSXs2b+LKRB93x8U0=
Subject: Re: skb_cb corruption in ath10k
From: Ben Greear <greearb@candelatech.com>
To: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 ath10k <ath10k@lists.infradead.org>
References: <86170a90-da2f-3227-d7e5-fe9486156705@candelatech.com>
Organization: Candela Technologies
Message-ID: <c79bb1d2-3571-4f3f-12a8-bce6701a7241@candelatech.com>
Date: Thu, 24 Dec 2020 09:08:13 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <86170a90-da2f-3227-d7e5-fe9486156705@candelatech.com>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201224_120815_680848_4A2EA9C9 
X-CRM114-Status: GOOD (  21.57  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

T24gMTIvMjEvMjAgMzo1NSBQTSwgQmVuIEdyZWVhciB3cm90ZToKPiBIZWxsbywKPiAKPiBJJ20g
dHJ5aW5nIHRvIGZpZ3VyZSBvdXQgd2hhdCBjaGFuZ2VkIGluIHRoZSBsYXN0IGZldyBrZXJuZWxz
IHRoYXQgaXMgbWFraW5nOgo+IAo+IHN0cnVjdCBpZWVlODAyMTFfdHhfaW5mbyAqaW5mbyA9IElF
RUU4MDIxMV9TS0JfQ0Ioc2tiKTsKPiBpZiAoaW5mby0+Y29udHJvbC5mbGFncyAmIElFRUU4MDIx
MV9UWF9DVFJMX1JBVEVfSU5KRUNUKQo+ICDCoMKgwqDCoC8qIHdoeSBpcyBjb2RlIGhlcmUgYWxs
IG9mIGEgc3VkZGVuICovCj4gCj4gaW4gZGF0YSBmcmFtZXMgaW4gYXRoMTBrLAo+IHdoZW4sIHRv
IHRoZSBiZXN0IG9mIG15IGtub3dsZWRnZSwgbm90aGluZyBzaG91bGQgYmUgc2V0dGluZyB0aGF0
IHVwIGluIHRoZSBzdGFjay4KPiAKPiBNeSBndWVzcyBpcyB0aGF0IHNvbWV0aGluZyBpcyBzdGVw
cGluZyBvbiB0aGUgY2IgZmllbGQgc29tZXdoZXJlIGluIGF0aDEwaywKPiBidXQgSSBhbSBub3Qg
c3VyZSB3aGVyZSB0aGF0IG1pZ2h0IGJlIGF0IHRoaXMgcG9pbnQuCj4gCj4gQW5kIGl0IGFsc28g
YXBwZWFycyBtYWM4MDIxMSBvciBtYXliZSBzdXBwbGljYW50IGlzIHNldHRpbmcgdGhlIHJhdGUt
aW5qZWN0IGZsYWcgb24gc29tZSBtZ3QgZnJhbWVzLAo+IGJ1dCBJIHRoaW5rIHRoYXQgaXMgYSBz
ZXBhcmF0ZSBjb25jZXJuIGF0IHRoaXMgcG9pbnQuCj4gCj4gSWYgYW55b25lIGhhcyBhbnkgaWRl
YXMgb2YgbGlrZWx5IHBvaW50cywgcGxlYXNlIGxldCBtZSBrbm93LgoKVGhpcyBpc3N1ZSB3YXMg
bWUgYmVpbmcgY29uZnVzZWQgYWJvdXQgaG93IHRoZSBhdGgxMGsgc2tiX2NiIHNpdHMgaW4KdGhl
IHNhbWUgbWVtb3J5IGFzIHRoZSBpZWUgc2tiX2NiLiAgSSBqdXN0IG5lZWRlZCB0byByZW9yZGVy
IHRoZQphdGgxMGstc2tiLWNiIHN0cnVjdCBhIGJpdCB0byBub3QgY2xvYmJlciB0aGUgY29udHJv
bC5mbGFncyBhcmVhLgoKSSBhbHNvIHNlZSBubyByZWFzb24gbm90IHRvIG5hdHVhbGx5IHBhY2sg
dGhhdCBzdHVjdCBzbyB0aGF0IHRoZQpwb2ludGVycyBhcmUgOC1ieXRlIGFsaWduZWQuICBBbnkg
aWRlYSB3aHkgaXQgaXMgZm9yY2UtcGFja2VkCmN1cnJlbnRseSBpbnN0ZWFkIG9mIHVzaW5nIHBy
b3BlciBwYWRkaW5nPwoKVGhhbmtzLApCZW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0
aDEwawo=
