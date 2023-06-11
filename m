Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB2AAC7EE23
	for <ath10k@archiver.kernel.org>; Sun, 11 Jun 2023 19:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=onBopBDwk7HyU1GnlB+8E4qQFlRhRUje8Z9fYjvNF7I=; b=06iKqPQKYwGNfq
	EzW9JvavZ4Pp1Jn5EOX8YmkP9DlAv+Iz1ISfjil3ISFnjzrVdU8Kr1wvcm3UQtsGqqWFAqj1uZDvh
	7fWH6ucJ2s7iAZhEwbhNOEwLsGR9hqfiU+nw7rWM3/2Rh7DygdsJZLdzzI2WbsnZPYH68ib1hewxZ
	D5TOnfEa7R17gSKgier3aMUNb1dmX6EKZeuQ2eDlVsQWzziqKuxcs9bZXTmQ+mkptmDy10T/CCpdI
	fGhjiY/rM6fZt2PBu4vu/NhTrqag42zbZSSEwo2ieIx0+t+zAX05IuA3w0zulYoQrLrtqvgMIoKC5
	6wYVZKDEjAZMAyx5btTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8Qsq-001cPC-0F;
	Sun, 11 Jun 2023 19:37:52 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8Qsm-001cOE-28
	for ath10k@lists.infradead.org;
	Sun, 11 Jun 2023 19:37:50 +0000
Received: by mail-io1-xd35.google.com with SMTP id ca18e2360f4ac-77a1cad6532so232883339f.1
        for <ath10k@lists.infradead.org>; Sun, 11 Jun 2023 12:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686512263; x=1689104263;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YM7OM9iK+U+PV5SZtotWJ9eP4Pea45UXoIm4m6gjQgw=;
        b=fI/JS3uYbxcaUh8+namFMchJfNqzXabCbDqmSZUwXxXs72ORPtoJmidB4ksYDKPQjc
         wwR6C4Q78yzT9T/aIBKJiwUwOmgfvtCn7cYp0ueW+Zv95l5Ca2/f5dOloPLlDmfnlurf
         od85w+3THcorDk7r8x9UYM4OdxNapjiRMIGyE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686512263; x=1689104263;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YM7OM9iK+U+PV5SZtotWJ9eP4Pea45UXoIm4m6gjQgw=;
        b=GddBewfDrOIwh6tY2j9fYrEga7JJrAGdY945PYATqaTif5Rt5ardVF83NFCkg5JjXA
         r34fElR0nXpPziTCFs+/IkMHFURpjIfru32J75vrv93GIOLqHf9EfpMq/M5eq9YYHGLw
         lh+I1JHuXRzu4eAe3HITlv22zXeCbSVgZg+MqOMMY91ZXGsxUg4Y6sCF78Jjo7n4Gslq
         eE8HdKUIU18OfRzaYHlDiz8+2yXhjcxb6btxbH8tplm7TaRNE/zA5oDx6FzLxz8QG3W6
         gH6GF0i0DkspfeL2FG4s6VXClXFewUhOdXO+DH7E1hvGkvXC4j9Ndt1nLoL8ehA99TSh
         2gcA==
X-Gm-Message-State: AC+VfDw9M83txGSgSUADZVlwbUY4napT5LyK6TXnMf3HFbmbfjJFkrId
	EEQlf0BeWIh6LScA/hocWzEuax8q4g6cOblgrVpIuw==
X-Google-Smtp-Source: ACHHUZ7thqAggR7Av1USvcj3PSsn7/WY2NPYsKDUZC2xNkkpn0rPjeFsgAStZf3RB4OqK/j85lSN+TBvP7MsIU6Fz40=
X-Received: by 2002:a5e:9412:0:b0:779:89db:37b9 with SMTP id
 q18-20020a5e9412000000b0077989db37b9mr6981251ioj.9.1686512263254; Sun, 11 Jun
 2023 12:37:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230302095551.5510-1-quic_youghand@quicinc.com> <20230302095551.5510-2-quic_youghand@quicinc.com>
In-Reply-To: <20230302095551.5510-2-quic_youghand@quicinc.com>
From: Abhishek Kumar <kuabhs@chromium.org>
Date: Sun, 11 Jun 2023 12:37:32 -0700
Message-ID: <CACTWRwtz6HpszX4Dp2jJ5YmcZ2Mg2KxmyipfSQW4W-ELBkkCVw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] wifi: cfg80211: Add beacon hint notifier support
To: Youghandhar Chintala <quic_youghand@quicinc.com>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mpubbise@qti.qualcomm.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230611_123748_751170_32625FCC 
X-CRM114-Status: GOOD (  30.62  )
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

T24gVGh1LCBNYXIgMiwgMjAyMyBhdCAxOjU34oCvQU0gWW91Z2hhbmRoYXIgQ2hpbnRhbGEKPHF1
aWNfeW91Z2hhbmRAcXVpY2luYy5jb20+IHdyb3RlOgo+Cj4gVGhlcmUgYXJlIGNvbm5lY3Rpb24g
ZmFpbHVyZXMgaW4gaGlkZGVuIFNTSUQgY2FzZSB3aGVuIHRoZSBkZXZpY2UgaXMKPiB3aXRoIGRl
ZmF1bHQgcmVnIGRvbWFpbiBXVy4KPiBGb3IgV1cgcmVnIGRvbWFpbiBtb3N0IG9mIHRoZSA1IEdI
eiBjaGFubmVscyBhcmUgcGFzc2l2ZS4gV2hlbiBkZXZpY2UKPiBsaXN0ZW5zIHRvIHRoZSBiZWFj
b24gb24gdGhhdCBjaGFubmVsLCB0aGUgZHJpdmVyIGlzIHVwZGF0aW5nIGl0cwo+IGNoYW5uZWwg
ZmxhZyBidXQgZmlybXdhcmUgaXMgbm90IGF3YXJlIG9mIGl0IGFuZCBmaXJtd2FyZSBpcyBub3QK
PiBzZW5kaW5nIHByb2JlcyBvbiB0aGF0IGNoYW5uZWxzLgo+IER1ZSB0byB0aGlzLCB3ZSBhcmUg
c2VlaW5nIGNvbm5lY3Rpb24gZmFpbHVyZXMgd2hlbiB0aGUgZGV2aWNlIGlzIHRyeWluZwo+IHRv
IGNvbm5lY3Qgd2l0aCBoaWRkZW4gU1NJRCBBUC4KPgo+IEluIHRoZSBjYXNlIG9mIGRldmljZXMg
dXNpbmcgdGhlIGF0aDEwayBkcml2ZXIsIGl0IGlzIHJlcXVpcmVkIHRvIHVwZGF0ZQo+IHRoZSBj
aGFuZ2UgaW4gY2hhbm5lbCBmbGFncyB0byBmaXJtd2FyZSBhcyB3ZWxsLiBUaGVyZWZvcmUsIHdl
IG5lZWQgYQo+IG1lY2hhbmlzbSB0byBub3RpZnkgdGhlIGRyaXZlciBmcm9tIHRoZSByZWd1bGF0
b3J5IGNvcmUgcmVnYXJkaW5nIHRoZQo+IGNoYW5uZWwgZmxhZyBjaGFuZ2VzLgo+IEFkZGluZyBh
IGJlYWNvbiBoaW50IG5vdGlmaWVyIGxvZ2ljLCBzbyB0aGF0IGRyaXZlcnMgY2FuIHJlZ2lzdGVy
Cj4gY2FsbGJhY2tzIHRvIGdldCBub3RpZmllZCB3aGVuZXZlciB0aGVyZSBpcyBhIGNoYW5nZSBp
biBjaGFubmVsIGZsYWdzLgo+Cj4gU2lnbmVkLW9mZi1ieTogWW91Z2hhbmRoYXIgQ2hpbnRhbGEg
PHF1aWNfeW91Z2hhbmRAcXVpY2luYy5jb20+Cj4gLS0tCj4gIGluY2x1ZGUvbmV0L2NmZzgwMjEx
LmggfCA3ICsrKysrKysKPiAgbmV0L3dpcmVsZXNzL3JlZy5jICAgICB8IDUgKysrKy0KPiAgMiBm
aWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9uZXQvY2ZnODAyMTEuaCBiL2luY2x1ZGUvbmV0L2NmZzgwMjExLmgKPiBp
bmRleCAxMWEzNzBlNjQxNDMuLjdhMDBmNTMxN2UxZiAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL25l
dC9jZmc4MDIxMS5oCj4gKysrIGIvaW5jbHVkZS9uZXQvY2ZnODAyMTEuaAo+IEBAIC01MDk2LDYg
KzUwOTYsMTAgQEAgc3RydWN0IHdpcGh5X2lmdHlwZV9ha21fc3VpdGVzIHsKPiAgICogQHJlZ19u
b3RpZmllcjogdGhlIGRyaXZlcidzIHJlZ3VsYXRvcnkgbm90aWZpY2F0aW9uIGNhbGxiYWNrLAo+
ICAgKiAgICAgbm90ZSB0aGF0IGlmIHlvdXIgZHJpdmVyIHVzZXMgd2lwaHlfYXBwbHlfY3VzdG9t
X3JlZ3VsYXRvcnkoKQo+ICAgKiAgICAgdGhlIHJlZ19ub3RpZmllcidzIHJlcXVlc3QgY2FuIGJl
IHBhc3NlZCBhcyBOVUxMCj4gKyAqIEBiZWFjb25faGludF9ub3RpZmllcjogdGhlIGRyaXZlcidz
IGJlYWNvbiBoaW50IG5vdGlmaWNhdGlvbiBjYWxsYmFjaywKPiArICogICAgIHdoaWNoIHdpbGwg
dHJpZ2dlciB3aGVuIHRoZXJlIGlzIGNoYW5uZWwgZmxhZyB1cGRhdGVzIHNlZW4gaW4KPiArICog
ICAgIGJlYWNvbiBoaW50cy4gVGhlIGJlYWNvbl9oaW50X25vdGlmaWVyJ3MgcmVxdWVzdCBjYW4g
YmUgcGFzc2VkCj4gKyAqICAgICB3aXRoIGNoYW4gY29udGV4dC4KPiAgICogQHJlZ2Q6IHRoZSBk
cml2ZXIncyByZWd1bGF0b3J5IGRvbWFpbiwgaWYgb25lIHdhcyByZXF1ZXN0ZWQgdmlhCj4gICAq
ICAgICB0aGUgcmVndWxhdG9yeV9oaW50KCkgQVBJLiBUaGlzIGNhbiBiZSB1c2VkIGJ5IHRoZSBk
cml2ZXIKPiAgICogICAgIG9uIHRoZSByZWdfbm90aWZpZXIoKSBpZiBpdCBjaG9vc2VzIHRvIGln
bm9yZSBmdXR1cmUKPiBAQCAtNTM4Niw2ICs1MzkwLDkgQEAgc3RydWN0IHdpcGh5IHsKPiAgICAg
ICAgIHZvaWQgKCpyZWdfbm90aWZpZXIpKHN0cnVjdCB3aXBoeSAqd2lwaHksCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgcmVndWxhdG9yeV9yZXF1ZXN0ICpyZXF1ZXN0KTsK
Pgo+ICsgICAgICAgdm9pZCAoKmJlYWNvbl9oaW50X25vdGlmaWVyKShzdHJ1Y3Qgd2lwaHkgKndp
cGh5LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgaWVlZTgw
MjExX2NoYW5uZWwgKmNoYW4pOwpJcyB0aGUgc2Vjb25kIGFyZ3VtZW50IHJlcXVpcmVkLiBZb3Vy
IDIvMiBwYXRjaCBkb2VzIG5vdCB1c2UgdGhpcwphcmd1bWVudCBhbmQgdGh1cyB3aWxsIGNhdXNl
IGJ1aWxkIGZhaWx1cmUuIElmIGl0IGlzIG5vdCB1c2VkLCBJIHdvdWxkCnJlY29tbWVuZCB0byBk
cm9wIGl0Lgo+ICsKPiAgICAgICAgIC8qIGZpZWxkcyBiZWxvdyBhcmUgcmVhZC1vbmx5LCBhc3Np
Z25lZCBieSBjZmc4MDIxMSAqLwo+Cj4gICAgICAgICBjb25zdCBzdHJ1Y3QgaWVlZTgwMjExX3Jl
Z2RvbWFpbiBfX3JjdSAqcmVnZDsKPiBkaWZmIC0tZ2l0IGEvbmV0L3dpcmVsZXNzL3JlZy5jIGIv
bmV0L3dpcmVsZXNzL3JlZy5jCj4gaW5kZXggYzNkOTUwZDI5NDMyLi4yZGM2ODgwYTI4YzUgMTAw
NjQ0Cj4gLS0tIGEvbmV0L3dpcmVsZXNzL3JlZy5jCj4gKysrIGIvbmV0L3dpcmVsZXNzL3JlZy5j
Cj4gQEAgLTIyMTksOCArMjIxOSwxMSBAQCBzdGF0aWMgdm9pZCBoYW5kbGVfcmVnX2JlYWNvbihz
dHJ1Y3Qgd2lwaHkgKndpcGh5LCB1bnNpZ25lZCBpbnQgY2hhbl9pZHgsCj4gICAgICAgICAgICAg
ICAgIGNoYW5uZWxfY2hhbmdlZCA9IHRydWU7Cj4gICAgICAgICB9Cj4KPiAtICAgICAgIGlmIChj
aGFubmVsX2NoYW5nZWQpCj4gKyAgICAgICBpZiAoY2hhbm5lbF9jaGFuZ2VkKSB7Cj4gICAgICAg
ICAgICAgICAgIG5sODAyMTFfc2VuZF9iZWFjb25faGludF9ldmVudCh3aXBoeSwgJmNoYW5fYmVm
b3JlLCBjaGFuKTsKPiArICAgICAgICAgICAgICAgaWYgKHdpcGh5LT5iZWFjb25faGludF9ub3Rp
ZmllcikKPiArICAgICAgICAgICAgICAgICAgICAgICB3aXBoeS0+YmVhY29uX2hpbnRfbm90aWZp
ZXIod2lwaHksIGNoYW4pOwo+ICsgICAgICAgfQo+ICB9Cj4KPiAgLyoKPiAtLQo+IDIuMzguMAo+
CgpUaGFua3MKQWJoaXNoZWsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
