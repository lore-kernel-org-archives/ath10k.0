Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F545C433EF
	for <ath10k@archiver.kernel.org>; Thu, 21 Jul 2022 14:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EWTjYNfJUSlEqv4ND7Lycg4R6bGCySC/dTfWty2Ln9U=; b=o/yl2bovaZz0xu
	fVgHjNbyj3lt6hTVZrFGBR8BDSFn+q15N0LCCCv7qK5ayXt+cYMhUrqDOOrZnGcxV1n8aY5QbPgRW
	ZpphGYgXz+FKVe3gTkzsoAXIrbLSQgVvRpzlA+2+FJDDZnZ8rAnXDTM2Gvfoy6u+iEiPrFF1oyfsA
	R3zhu7P6Oa/ojOBvK/a5Xr6GBCOj3e2E9MCSjm/kS8SRyZc+QpXDVqBDdv+HTg9h6ybTVi5iVrkYC
	pQuktyrMnJHRXYW9sDJiVj2QOVS4D2Y37+h8/XMD8y0TGn/WIJt1PXe3BM0qy99pgrFe6LRXlOWzz
	Is9Kuq5qnTTRe4QGbRZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEXPN-008DIm-RF; Thu, 21 Jul 2022 14:44:09 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEXPL-008DAF-7q
	for ath10k@lists.infradead.org; Thu, 21 Jul 2022 14:44:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=VgD+JbbwS6XVssBVKi+pnkYIiuY6lXE5LgvAjAlwrmI=;
	t=1658414644; x=1659624244; b=D8zQfzmmnrYwHLqzxIzTypVDLYfyEY6oxkj9IGvCJ91vtJK
	i3bMDQYyBR1ZIfkLoYSZUpMFs2P731o1PCivChoNDRVnUhgXo+v3SCeveZlLCc6X60HmAX+RcWpxk
	7gSXKFKQZWMDfngkyb2ukwX8z844VcUx97LBDlrjyfRwmJJ5V1rxI+gnu3fq3IMJODROZQW95aR/z
	F7kcC8kAGHiAu9LpZq1+NDkfEkaJrK1Ma3K+yzGN8rJWajgcPfgvN7txRaChmMYOZMFntLWL6hsHI
	0w7/jsYY2lIuSadc+vsKJfcC236toA8TzPyPEsOAdL6J3aTm9YDIvlosPU43ZbRw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1oEXP1-004N5l-37;
	Thu, 21 Jul 2022 16:43:48 +0200
Message-ID: <76e53d3ef853fc963e7243194d7538d34a224a3a.camel@sipsolutions.net>
Subject: Re: [PATCH] mac80211: Fix wrong channel bandwidths reported for
 aggregates
From: Johannes Berg <johannes@sipsolutions.net>
To: Linus =?ISO-8859-1?Q?L=FCssing?= <linus.luessing@c0d3.blue>
Cc: "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Toke =?ISO-8859-1?Q?H=F8iland-J=F8rgensen?=
 <toke@toke.dk>, Kalle Valo <kvalo@kernel.org>, Felix Fietkau
 <nbd@nbd.name>,  Simon Wunderlich <sw@simonwunderlich.de>, Sven Eckelmann
 <sven@narfation.org>, ath10k@lists.infradead.org, 
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Linus =?ISO-8859-1?Q?L=FCssing?=
 <ll@simonwunderlich.de>
Date: Thu, 21 Jul 2022 16:43:46 +0200
In-Reply-To: <20220718222804.21708-1-linus.luessing@c0d3.blue>
References: <20220718222804.21708-1-linus.luessing@c0d3.blue>
User-Agent: Evolution 3.44.3 (3.44.3-1.fc36) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_074407_303004_5F935CE7 
X-CRM114-Status: UNSURE (   7.54  )
X-CRM114-Notice: Please train this message.
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

T24gVHVlLCAyMDIyLTA3LTE5IGF0IDAwOjI4ICswMjAwLCBMaW51cyBMw7xzc2luZyB3cm90ZToK
PiAKPiBUaGVyZWZvcmUgZml4aW5nIHRoaXMgd2l0aGluIG1hYzgwMjExOiBGb3IgYW4gYWdnZXJn
YXRlZCBBTVBEVSBvbmx5Cj4gdXBkYXRlIHRoZSBSWCAibGFzdF9yYXRlIiB2YXJpYWJsZSBmcm9t
IHRoZSBsYXN0IHN1Yi1mcmFtZSBvZiBhbgo+IGFnZ3JlZ2F0ZS4gSW4gdGhlb3J5LCB3aXRob3V0
IGhhcmR3YXJlIGJ1Z3MsIHJhdGUvYmFuZHdpZHRoIGluZm8KPiBzaG91bGQgYmUgdGhlIHNhbWUg
Zm9yIGFsbCBzdWItZnJhbWVzIG9mIGFuIGFnZ3JlZ2F0ZSBhbnl3YXkuCj4gCgpXaGF0IGlmIG90
aGVyIGRyaXZlcnMgZG8gaXQgb25seSBvbiB0aGUgZmlyc3Q/IDopCgpJJ2QgYmUgbW9yZSBpbmNs
aW5lZCB0byBzcXVlZXplIGluIGEgIlJBVEVfSU5WQUxJRCIgZmxhZyBvciBzbyBzb21ld2hlcmUK
dGhlcmUgaW4gdGhlIHJ4IHN0YXR1cywgYW5kIG1ha2UgaXQgZGVwZW5kIG9uIHRoYXQuCgpqb2hh
bm5lcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRo
MTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
