Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A784C433F5
	for <ath10k@archiver.kernel.org>; Wed, 13 Apr 2022 09:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xeZpFznrnFtOFliKraGzRCWmWbbVy0WPm9cx4Fow7lE=; b=LVuhl75cdIvizt
	Ssi4lX5j50oD88EwDgJVgjZ4Mud+lQJgoGZ6kFciH+GpBSNw8ugCO7FUmAO7Uynv2a7jw60IQqlJM
	CjhYvXZ9TUiqfBQDvpwAm6I2iIR8L/+UDCeR6J1eVbA04GHqDJZPqnT7vqY/W7xh2z+r5+KWypAM+
	VqldgaVwwwoPiXyYIKWKpFBVp9n4BeBlqcLbzxvcjh+pLH3TvHmltkG18MHh17kFHMp/f6Or0I85r
	PIddpWyW+f+XP9UOLWQZL9q5iQDH3w7IQhPJoB9xUMzQFxJi5ins7jine7fDBq6FH9RkJzOul7SH8
	QWmWfvwfoGvR/y9YxdtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neYyY-000E85-Ad; Wed, 13 Apr 2022 09:07:46 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neYyV-000E60-7m
 for ath10k@lists.infradead.org; Wed, 13 Apr 2022 09:07:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 45DE3CE2173;
 Wed, 13 Apr 2022 09:07:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26F5FC385A4;
 Wed, 13 Apr 2022 09:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649840859;
 bh=NsZoGz9/GK/G2zkVehN+GMfqRegkv3i1jsQkqomRUcA=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=lyTmhu7CIda51IagfyelhGJJc4KZ73nbxa6vHd46euouIk7d682ZHvB99haqmLggW
 P9MEWSdPEM/r990qr136ugfuO6e8R1mRFCUoRkfz/moOax4rT0GKUJ48vrkFDKbBgc
 HuwPYi9wm6P5GsmjHxGYni9/iAuDsjZ2Dq67ATgxL90fdhosJ2zuqlP5xZy+yyHTfF
 kl37IQzBnDvd40KIUXTPHeY0uR0+pM412S6mMgNDZHTIBzDrWrABGQxXTNAwgSiF6g
 Uw21wS7ZRK3qPa5Au6hPzUh4Z/lRSmCPHWaaSqTZyok4OZqh6Y4jNZqYK1Bi6s8KHA
 mfD86aRVMMbgQ==
From: Kalle Valo <kvalo@kernel.org>
To: =?utf-8?B?5byg6bmP?= <1805692831@qq.com>
Cc: "ath10k" <ath10k@lists.infradead.org>
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Update Qxwlan E2600AC c1 specific
 BDFs
References: <tencent_173A7F4C8857CF1AE5F3E5065A21C2161B08@qq.com>
Date: Wed, 13 Apr 2022 12:07:34 +0300
In-Reply-To: <tencent_173A7F4C8857CF1AE5F3E5065A21C2161B08@qq.com>
 (=?utf-8?B?IuW8oOm5jyIncw==?=
 message of "Fri, 25 Mar 2022 18:03:03 +0800")
Message-ID: <87mtgpl5bd.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_020743_531101_57DD706E 
X-CRM114-Status: GOOD (  15.70  )
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

IuW8oOm5jyIgPDE4MDU2OTI4MzFAcXEuY29tPiB3cml0ZXM6Cgo+IEhpLAo+ICZuYnNwOyAmbmJz
cDsgTW9kaWZpZWQgdGhlIHJhZGlvIGZyZXF1ZW5jeSBoYXJkd2FyZSBwYXJ0IG9mIGUyNjAwYWMg
YzEsCj4gbmVlZCB0byBjb29wZXJhdGUgd2l0aCB0aGUgbW9kaWZpZWQgYm9hcmQuYmluIGZpbGUs
IHRoZSBkZXZpY2UKPiBjYW4gd29yayBub3JtYWxseS4KPgo+Cj4KPiBGb3IgdGhlIHF1ZXN0aW9u
cyBmcm9tIHRoZSB3aWtpIHBhZ2U6Cj4KPiAqIGRlc2NyaXB0aW9uIGZvciB3aGF0IGhhcmR3YXJl
IHRoaXMgaXM6Cj4KPiAmbmJzcDsgLSBpdCBpcyBhIElQUTQwMTkgYmFzZWQgYm9hcmQgKEFQLURL
MDQpCj4gJm5ic3A7IC0gb25lIFFDQTQweHggcmFkaW8gaXMgdXNlZCBhcyAyLjQgR0h6IHJhZGlv
Cj4gJm5ic3A7IC0gb25lIFFDQTQweHggcmFkaW8gaXMgdXNlZCBhcyA1IEdIeiByYWRpbwo+Cj4g
KiBvcmlnaW4gb2YgdGhlIGJvYXJkIGZpbGUgKGRpZCB5b3UgY3JlYXRlIGl0IHlvdXJzZWxmIG9y
IHdoZXJlIHlvdQo+ICZuYnNwOyBkb3dubG9hZGVkKQo+Cj4gJm5ic3A7IC0gVGhlIGJvYXJkIGZp
bGUocykgd2hlcmUgZXh0cmFjdGVkIGZyb20gdGhlIFF4d2xhbiBmaXJtd2FyZS4gCj4gJm5ic3A7
IC0gVGhlIGZpbGVzIGluIHRoaXMgZW1haWwgYXJlOgo+ICZuYnNwOyAmbmJzcDsgKiBib2FyZF93
aWZpMF8yZy5iaW4KPiAmbmJzcDsgJm5ic3A7ICogYm9hcmRfd2lmaTFfNWcuYmluCj4KPiAqIGlk
cyB0byBiZSB1c2VkIHdpdGggdGhlIGJvYXJkIGZpbGUgKEFUSDEwS19CRF9JRV9CT0FSRF9OQU1F
IGluIGF0aDEwaykKPgo+ICZuYnNwOyAtIFFDQTQwMTkgaHcxLjAKPgo+ICZuYnNwOyAmbmJzcDsg
KyBidXM9YWhiLGJtaS1jaGlwLWlkPTAsYm1pLWJvYXJkLWlkPTIwLHZhcmlhbnQ9UXh3bGFuLUUy
NjAwQUMtQzFiaW4KPiAmbmJzcDsmbmJzcDsmbmJzcDsgJm5ic3A7IHNoYTI1NnN1bToKPiAmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsKPiBhM2IzNjg3YzFkODBkYzkyYjVkNzhiMWFhMjA1
ZjE0NjNiZDExZjRlZmMyOWY3MzExYmRhYWJjMjhjMWQzZWIyCj4gJm5ic3A7ICZuYnNwOyArYnVz
PWFoYixibWktY2hpcC1pZD0wLGJtaS1ib2FyZC1pZD0yMSx2YXJpYW50PVF4d2xhbi1FMjYwMEFD
LUMxYmluCj4gJm5ic3A7Jm5ic3A7Jm5ic3A7ICZuYnNwOyBzaGEyNTZzdW06Cj4gJm5ic3A7Jm5i
c3A7Jm5ic3A7ICZuYnNwOwo+IDQ0ZjNmMmU4ZDlmZjkzOTZkM2FiNzNkYjNkZmViODY0Y2VmMjBk
N2U0MzAzMmExMzNmYThhN2M3NGU1ZDdhZDQKPgo+Cj4gKiBhdHRhY2ggdGhlIGFjdHVhbCBib2Fy
ZCBmaWxlIChib2FyZC5iaW4pCj4KPiAmbmJzcDsgLSBUaGUgbmFtZSBvZiB0aGUgZmlsZXMgYXJl
IGVxdWFsIHRvIHRoZSBpZCBzdHJpbmcgaW4gdGhlIGJvYXJkLTIuYmluCj4gJm5ic3A7ICZuYnNw
OyAobWludXMgdGhlICIuYmluIikKClRoZSBmaWxlbmFtZXMgYXJlIG5vdCBpbiBjb3JyZWN0IGZv
cm1hdCBzbyBteSBzY3JpcHQgZmFpbHM6CgpbMi4gYXBwbGljYXRpb24vb2N0ZXQtc3RyZWFtOyBi
b2FyZF93aWZpMF8yZy5iaW5dLi4uCgpbMy4gYXBwbGljYXRpb24vb2N0ZXQtc3RyZWFtOyBib2Fy
ZF93aWZpMV81Zy5iaW5dLi4uCgpQbGVhc2UgcmVhZCB0aGUgZG9jdW1lbnRhdGlvbjoKCmh0dHBz
Oi8vd2lyZWxlc3Mud2lraS5rZXJuZWwub3JnL2VuL3VzZXJzL2RyaXZlcnMvYXRoMTBrL2JvYXJk
ZmlsZXMKCi0tIApodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtd2ly
ZWxlc3MvbGlzdC8KCmh0dHBzOi8vd2lyZWxlc3Mud2lraS5rZXJuZWwub3JnL2VuL2RldmVsb3Bl
cnMvZG9jdW1lbnRhdGlvbi9zdWJtaXR0aW5ncGF0Y2hlcwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2F0aDEwawo=
