Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55C4BC77B7A
	for <ath10k@archiver.kernel.org>; Mon, 29 May 2023 19:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=NRauOFKJEUt1D7dSFZvRDBWJbKNW33mLvm5CKvdM0Kc=; b=1xz
	9R7xi/L4r+1oSPlj9ybQjeZ7GznSBuL3e6Ln61nLVE/4UN3Ph3rOI7eyTCFiWIOJ2lCkUcpTaBkqV
	g6QI26CvFmyXeD1yVvJLdO3M3X/JMTDIGJ+ij1wlrhm2PB5CWOv6j5mEGg239yvFl1vRLKoEUVs+o
	2dl78K4eATYO2utLRDDUBKUeJ3ZwpagFcM8vXeABSCefrancY4cT8vHKLfsh3C1qyDSuzQ0lISWwS
	fOKFI1VhJhdvlhXzaQ0e2sPBhAE8SI2r2V96EI4e3jkMBUkn5Po1zdChau7x0vK5I8ewrEurNwR92
	hm12cDGbX4ytJ59xttgyqzAPXkd34FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3iBY-00BTYG-1F;
	Mon, 29 May 2023 19:05:40 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3iBV-00BTXA-1D
	for ath10k@lists.infradead.org;
	Mon, 29 May 2023 19:05:38 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-25673e8c464so949995a91.3
        for <ath10k@lists.infradead.org>; Mon, 29 May 2023 12:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685387134; x=1687979134;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7QFIUWZBeoL7aG9Csr0IkuGxae4B6Hsd+OiWuyr7BuI=;
        b=Pep042EQ52cfHkee5giJnCQZS/BxA9eHTUmi4BlyTYDIv5MJz4JG+pjQDgJQ/ZYN/5
         yVppJRRCmJmRJsB8ylvBu2VL8TBQjT36DDuSvC8WtME/hsPCL6fqUQHiqXcW2WRIM12H
         yTy5k1rZDyjKGOdW4YacRu+ZbNhmr+HoY2DA0jmLXcsR7Ht4Hd2yF+9SdOcB0cHY2Cz9
         LSNmg9mryGLyCkq+uhuepDOdlmwfWXhdxMkOJyNwfnsE3yYAXpZ5E7PW6d4G1s23s4sA
         /+kmn+Gly6g1ZhjVH5FlIM/eNwP2Z8c5NI0bFU67/h6f9BpDOMVJ+iZbrW5fS32/abUU
         7KNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685387134; x=1687979134;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7QFIUWZBeoL7aG9Csr0IkuGxae4B6Hsd+OiWuyr7BuI=;
        b=K0NeG/8l0hYSBJu93ePZ6Pg1btzSsKMxPxbbATrg/U3QRzjsOsNwTtb2f0qNwiH1ZE
         WS5CfJjZ3Yl/P4xmittOuJiMGDPKGXqvfZsvU9LUuct4qoDkEkG8KCWORO/s+zdmEQ01
         87JK7bMH0vWX/GdleQ9LhRiGfOeTKodg1nLp83hBQF7De0lLtC9FbgbO7hE3e3g+m0QK
         D/Z3mMR5Ua9IqONCRJWGa2A4xT+FiVckPo+g94sIAXL5CPE7EI3i1uBqDETkjDe6qMXE
         nVpDDOAuZjwVMonMJhmNBhMMmdZeasEClfV7DGVh4p8U24aqbhdIj9qYtPkaLbI+RgN7
         bLxw==
X-Gm-Message-State: AC+VfDxQciXFe3q9x3tTfGa3VkSDhWhdRCDY8Le4QcefqPFTW/tv49KR
	jsvIj52zOCFgQMqX8mIJ0IN1mkh3K+KLQ55GK7FB4QPB/6iTmw==
X-Google-Smtp-Source: ACHHUZ6SSWrxc8C2HhmUQhdJXtHK00avVWskUSEBFI7FDenZnVEO587nYJoC+oTkSx23e+g/EtgKzarcIvQxCJR7Uzc=
X-Received: by 2002:a17:903:2805:b0:1b0:4c20:2409 with SMTP id
 kp5-20020a170903280500b001b04c202409mr148609plb.4.1685387134384; Mon, 29 May
 2023 12:05:34 -0700 (PDT)
MIME-Version: 1.0
From: Ednessto <dania6789@gmail.com>
Date: Mon, 29 May 2023 23:05:26 +0400
Message-ID: <CABCbKmupRxLtF6hjzPKh8TAVDDQ_pjid1=y9r0n3Ky8qPAOQ+w@mail.gmail.com>
Subject: Ath10k Issues - Shifting "max_magnitude" Range, Mesh Current Channel
 Scan, Caching
To: ath10k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_120537_418681_50E3B865 
X-CRM114-Status: GOOD (  18.16  )
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

SGVsbG8hCgpJIGhhdmUgYmVlbiB1c2luZyB0aGUgYXRoMTBrIGRyaXZlciBvdmVyIHRoZSBwYXN0
IGZldyBtb250aHMgdG8KaW1wbGVtZW50IGEgc3BlY3RyYWwgc2Nhbm5lciBvbiBhIENvbXB1dGUg
TW9kdWxlIDQuIFRoZSBpbnRlcmZhY2UgdXNlZAp0byBwZXJmb3JtIHRoZSBzY2FuIGlzIGEgbWVz
aC10eXBlIGludGVyZmFjZS4gVGhlIHNwZWN0cmFsIHNjYW4gaXMKcGVyZm9ybWVkIGFzIHBlciB0
aGUgc3RlcHMgZG9jdW1lbnRlZCBvbiB0aGUgYXRoMTBrIHdpa2kgcGFnZS4gVGhlcmUKYXJlIGEg
ZmV3IGJlaGF2aW9ycyBJJ3ZlIG9ic2VydmVkIHRoYXQgSSBjb3VsZCBub3Qgc2VlbSB0byByZXNv
bHZlIGFuZApzdXNwZWN0IHRoZXkgbWF5IGJlIGJ1Z3MuIEkgd291bGQgZ3JlYXRseSBhcHByZWNp
YXRlIHlvdXIgaW5wdXQgb3IKc3VnZ2VzdGlvbnMhCgpJc3N1ZSAxOiBWYXJ5aW5nIOKAnG1heF9t
YWduaXR1ZGXigJ0gcmFuZ2Ugb2YgdmFsdWVzIGZvciA1IEdIeiBDaGFubmVscwpOb3RlOiBUaGlz
IGlzc3VlIGNvbmNlcm5zIHRoZSByYW5nZSBvZiBtYXhfbWFnbml0dWRlIHZhbHVlcyBmb3IKY2hh
bm5lbHMgaW4gdGhlIDUgR0h6IGJhbmQgb25seSwgdGhpcyBpc3N1ZSBpcyBub3Qgc2VlbiBmb3Ig
dGhlIDIuNEdIegpjaGFubmVscy4KV2hlbiBydW5uaW5nIHRoZSBzcGVjdHJhbCBzY2FubmVyLCBp
ZiB0aGUgaXcgc2NhbiBjb21tYW5kLCBpdyBkZXYKe2ludGVyZmFjZX0gc2NhbiBmcmVxIHtmcmVx
fSwgaXMgZXhlY3V0ZWQgYnkgcGFzc2luZyB0byBpdCBhIGxpc3Qgb2YKMi40IGFuZCA1IEdIeiBi
YW5kcywgdGhlbiB0aGUgYXZlcmFnZSB2YWx1ZSBvZiB0aGUgIm1heF9tYWduaXR1ZGUiIGZvcgp0
aGUgNUdIeiBjaGFubmVscyBpcyBhcm91bmQgODAwLiBJZiB0aGUgc3BlY3RyYWwgc2Nhbm5lciBp
cyBydW4gd2l0aCBhCnN1YnNldCBvZiBmcmVxdWVuY2llcywgZm9yIGluc3RhbmNlIGJ5IHBhc3Np
bmcgc29tZSAyLjQgZnJlcXVlbmNpZXMKYW5kIHRoZW4gNUdIeiBjaGFubmVscywgb3Igb25seSBw
YXNzaW5nIGZyZXF1ZW5jaWVzIGZyb20gdGhlIDIuNCBiYW5kLAp0aGVuIHRoZSByYW5nZSBvZiBt
YXhfbWFnbml0dWRlIHZhbHVlcyBpcyB+IDUwLgoKVGVzdHMgcGVyZm9ybWVkIHBhc3NpbmcgdGhl
IGZvbGxvd2luZyBmcmVxdWVuY2llcyB0byB0aGUgc2NhbiBjb21tYW5kOgotIEFsbCAyLjQgR0h6
IGFuZCBhbGwgNSBHSHog4oaSIGF2ZXJhZ2UgbWF4IG1hZyA4MDAKLSBBbGwgNSBHSHogYW5kIGFs
bCAyLjRHSHog4oaSIHNjYW5uZXIgc2NhbnMgMi40IGJhbmQgdGhlbiA1IHJlZ2FyZGxlc3MsIGF2
ZyA4MDAKLSBTdWJzZXQgb2YgMi40R0h6IGFuZCBhbGwgNUdIeiDihpIgYXZnIDgwMAotIEFsbCAy
LjQgR0h6IGFuZCBzdWJzZXQgb2YgNUdIeiDihpIgYXZnIDgwMAotIFN1YnNldCBvZiAyLjRHSHog
YW5kIHN1YnNldCBvZiA1R0h6IChwYXNzZWQgZmV3IG9mIGVhY2gvIG9uZSBvZgplYWNoKSDihpIg
YXZnIDgwMAotICghKSBBbGwgb3Igc3Vic2V0IG9mIDUgR0h6IOKGkiBhdmcgNDAKLSBEbyBub3Qg
cGFzcyBhbnkgZnJlcXVlbmN5LCBsZXQgc2NhbiBwZXJmb3JtIGRlZmF1bHQgc2NhbiDihpIgYXZn
IDgwMAoKV2hhdCBpcyB0aGUgZXhwZWN0ZWQgIm1heF9tYWduaXR1ZGUiIHZhbHVlIHJhbmdlLyB3
aGljaCBvZiB0aGUgNDAgb3IKODAwIHZhbHVlcyBpcyB3aGF0IGlzIGV4cGVjdGVkIHRvIHNlZT8g
V2h5IGlzIGl0IHRoYXQgd2hlbiBwYXNzaW5nCmp1c3QgdGhlIDVHSHogY2hhbm5lbHMgdGhlIGF2
ZXJhZ2UgIm1heF9tYWduaXR1ZGUiIHZhbHVlcyBkcm9wIHRvIDQwPwpBbnkgc3VnZ2VzdGlvbnMv
d29ya2Fyb3VuZHMgb24gd2hhdCB0byBkbz8KCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0KSXNzdWUgMjogQ2Fubm90IHNjYW4gY3VycmVudCBjaGFubmVsIG1l
c2ggaXMgcGFya2VkCkEgbG93IGxhdGVuY3kgc3BlY3RyYWwgc2NhbiBjYW5ub3QgYmUgcGVyZm9y
bWVkIG9uIHRoZSBjaGFubmVsIHRoYXQgYQptZXNoIGludGVyZmFjZSBpcyBwYXJrZWQgb24sIGku
ZS4sIHRyeWluZyB0byBzY2FuIHRoZSBjdXJyZW50IGNoYW5uZWwKb2YgdGhlIG1lc2ggcmV0dXJu
cyBub3RoaW5nLgpOb3RlOiB0aGlzIGlzc3VlIGlzIG5vdCBzZWVuIGluIGEgbm9uLW1lc2ggZW52
aXJvbm1lbnQgc3VjaCBhcyB1c2luZwp0eXBlIEFQIGludGVyZmFjZSB3aXRoIHRoZSBhdGgxMGsg
ZHJpdmVyLgoKRm9yIHRoZSBtZXNoIHR5cGUgaW50ZXJmYWNlLCBJIHRlc3RlZCBwZXJmb3JtaW5n
IGEgc3BlY3RyYWwgc2NhbiBieQpzZXR0aW5nIHRoZSB7ZnJlcX0gcGFyYW1ldGVyIGluIHRoZSBp
dyBzY2FuIGNvbW1hbmQgdG8gdGhlIGZyZXF1ZW5jeQp0aGUgbWVzaCBpcyBwYXJrZWQgYXQsIHRo
ZSBzcGVjdHJhbCBzY2FuIHRoZW4gcmV0dXJucyBubyBvdXRwdXQgb24gYWxsCnN1YnNlcXVlbnQg
c2NhbnMuIFNpbWlsYXJseSwgaWYgd2UgcGFzcyBhbGwgMi40R0h6IGFuZCA1R0h6IGJhbmRzLCBp
Zgp0aGUgbWVzaCBpcyBzZXQgdG8gY2hhbm5lbCAzNiBmcmVxdWVuY3kgNTE4MCwgaXQgd2lsbCBz
Y2FuIGFsbCB0aGUKYXZhaWxhYmxlIGNoYW5uZWxzIHRvIHNjYW4sIGlkZW50aWZpZWQgdXNpbmcg
aXdsaXN0IHtpbnRlcmZhY2V9CmNoYW5uZWwsIGV4Y2VwdCBmb3IgY2hhbm5lbCAzNiwgdGhlIGNo
YW5uZWwgdGhlIG1lc2ggaXMgb24uCgpJcyB0aGVyZSBhbnl0aGluZyBJJ20gbWlzc2luZyB3aXRo
IHJlZ2FyZCB0byB0aGlzPyBBbmQgd2hhdCBjYW4gYmUKZG9uZSBhYm91dCB0aGlzIGlzc3VlPwoK
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpJc3N1ZSAzOiBD
YWNoaW5nCldoZW4gY29uZHVjdGluZyBhIHNwZWN0cmFsIHNjYW4sIHRoZXJlIGFyZSBhIGZldyBj
YXNlcyB3aGVyZSB0aGUKc3BlY3RyYWwgc2Nhbm5lciByZXR1cm5zIHR3byBzY2FuIG91dHB1dHMs
IGUuZyBzY2FuIHJlc3VsdHMgZm9yIDIuNApHSHogY2hhbm5lbHMsIDUsIDIuNCwgYW5kIDUsIGV2
ZW4gdGhvdWdoIG9ubHkgb25lIHR3byBiYW5kcyB3ZXJlCnBhc3NlZCAoMi40R0h6IGFuZCA1R0h6
KS4KVGhpcyBoYXBwZW5zIG1vc3RseSB1cG9uIGZpcnN0IHJ1bm5pbmcgdGhlIHNwZWN0cmFsIHNj
YW5uZXIgb3IgaWYgdGhlCnNjYW5uZXIgZmFpbHM6CnJlc291cmNlIGlzIGJ1c3kgaWYgdGhlIHNj
YW4gaW50ZXJmYWNlIGlzIGluIHVzZSBvciBvbmUgb2YgdGhlIGZmdApzcGVjdHJhbF8qIGZpbGVz
IChtb3N0bHkgc3BlY3RyYWxfc2Nhbl9jdGwpIGZhaWxzIHJldHVybmluZzoKZXJyb3I6IC9iaW4v
c2g6IGxpbmUgMTogZWNobzogd3JpdGUgZXJyb3I6IE5vIHN1Y2ggZGV2aWNlCmVycm9yOiAvYmlu
L3NoOiBsaW5lIDE6IGVjaG86IHdyaXRlIGVycm9yOiBJbnZhbGlkIGFyZ3VtZW50KQoKSSdtIGFz
c3VtaW5nIHRoaXMgbWF5IGJlIGEgY2FjaGluZyBpc3N1ZT8gSSBoYXZlIHRyaWVkIGFkZGluZyB0
aGUKImZsdXNoIiBwYXJhbWV0ZXIgdG8gdGhlIHNjYW4gY29tbWFuZCwgaG93ZXZlciwgaXQgZGlk
IG5vdCBoZWxwLgoKQW55IGlucHV0IG9uIHRoaXMgYmVoYXZpb3IsIGFuZCBhbHNvIG9uIHRoZSB0
d28gZXJyb3JzIG9mdGVuIHJldHVybmVkCndoZW4gcnVubmluZyB0aGUgc3BlY3RyYWwgc2Nhbj8K
CkxldCBtZSBrbm93IGlmIHlvdSB3b3VsZCBsaWtlIG1lIHRvIGNsYXJpZnkgYW55dGhpbmcuCgpS
ZWdhcmRzLApEYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
