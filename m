Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA20CC7EE23
	for <ath10k@archiver.kernel.org>; Tue, 23 May 2023 17:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=NRauOFKJEUt1D7dSFZvRDBWJbKNW33mLvm5CKvdM0Kc=; b=wjy
	Uqy/uCJeWJ9VWMBNKZaIAtNrVVMOZGktdYXLM2Gw7P4tGmLCIReR7luQIp7d2InF9U9W+uDLDGHZP
	hyvJIFtz17gIG6SIpaSHkpYN5gPchifZ3pLc/tL6kiO1brggmHlDl9pNrIsyIJJ1ovp8eRIcv5ZHK
	si8K2HzX00p3yrEbMBRFMOeCFJWQC3OPyp6efX1FQ3y5D1CSNXA+YHNzzqm6u4o2uV2Y+tAhwY9Q9
	qxkOhqib0TLkF4grfy/iZ9gm7OcCQ4AP/o7DvR2q9EAFurj/RAlP4WkScS3N3AzBhKDnqE8DpvjIG
	qmW28Hi0XjHfTmunTR0EE8qWiNuR7ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Vz3-00B04s-00;
	Tue, 23 May 2023 17:39:41 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Vyx-00B02L-2s
	for ath10k@lists.infradead.org;
	Tue, 23 May 2023 17:39:37 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-64d4e45971bso22453b3a.2
        for <ath10k@lists.infradead.org>; Tue, 23 May 2023 10:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684863566; x=1687455566;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7QFIUWZBeoL7aG9Csr0IkuGxae4B6Hsd+OiWuyr7BuI=;
        b=cD53I9BFuU69wt84GDUP3zwJYknzK7zO6K7/pTxaJkIIDRcGl4lR1fMRhSKCmZXqah
         0YRMliVG6Zu+KCh/Z3EsYZnVBYEe3csxLcpMOq1AMrP3c6eCkb+PGvE14NKlhBTpt4jq
         L/5bDkX7fcFc5b+ARNlt6rfZhPr9ojCgTU0jshcMWgJQggANOcJYPx/SetH9jXAey+oB
         A0NxTiZQIDj8RBF+rDM18CHJDQ06q5AD7+9uh9KBwWSOk+BDcXTCNfunFUErKfT9IaB0
         jNwhsGYOZiaPGQ2es2hjhmduo0RIV0wwXf0E1xS52FKtUmI6SgamuoL4ZPO6mEI+cqtN
         pEhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684863566; x=1687455566;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7QFIUWZBeoL7aG9Csr0IkuGxae4B6Hsd+OiWuyr7BuI=;
        b=FWqifyhwp/uJ6VWEZ8tCZSAaeaMG1vNNyrDBR/+F7aIgqIuuxjqsr7Lf4TpR4PDWEe
         8WIezL8M0EE3Zer0eiZaZbHxKBTLPByvcxepk/jZHtW3uAEPLJ6NMpa0kQbHPbpayEIE
         bLQVg7zJbETIrWDkx09MCagu7XkeoEfalx+IYZVHQKnaga6vLy5xEo6JAujE/1giEHz3
         +juYgAvRZg8B1wgTd0TghsWTpoFvAhD+jzgpyMsmf3InbXylwZL+3f9w7Q9I4aSqNXtd
         /ldjjsVenT8+sQNt48K8RUnN1DNtdX26Jo1YP0II2Y9mikV5B4wn91MCyt4+t//r2lZf
         IhWw==
X-Gm-Message-State: AC+VfDxzLO/YfU5DhjJGW9vUCwuUKEDa6I3tuGqGSYBVGimVDrNBLsSb
	6g4tmn6gLk9Jq0bIMNXXjCPXpbDKE7QlIvz5fY8POrOJpkHNiw==
X-Google-Smtp-Source: ACHHUZ4H3kUnmYVF/UmiLUj4+ynkaUQyB0kDqeMja/PTouLEwCJlRxahExyDSapXjpP25DZiVwIFQiIKw4riBNXyeto=
X-Received: by 2002:a17:90a:cb05:b0:253:4e54:6761 with SMTP id
 z5-20020a17090acb0500b002534e546761mr14078296pjt.34.1684863566278; Tue, 23
 May 2023 10:39:26 -0700 (PDT)
MIME-Version: 1.0
From: Ednessto <dania6789@gmail.com>
Date: Tue, 23 May 2023 21:39:16 +0400
Message-ID: <CABCbKmtZErjQuEgMKnSnwMQJ9MnAijwHFKePc0+SAUj-fwrY+w@mail.gmail.com>
Subject: Ath10k Issues - Shifting "max_magnitude" Range, Mesh Current Channel
 Scan, Caching
To: ath10k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_103935_928186_240ECFFD 
X-CRM114-Status: GOOD (  17.94  )
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
