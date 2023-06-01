Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E537FC7EE23
	for <ath10k@archiver.kernel.org>; Thu,  1 Jun 2023 09:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cd0ZoZGNXUkblaI4J/Hsn3jJFrXNWcQIlNhlKQfi5lk=; b=F8FyDEIwxrnAE/
	E+bcdQr+2+175lwOwyHaiZ3eN2PL7Yiw+pbxrXmDQS/h9f5TH4gvZLbC5APpQzdS3AitWuCaLCgR3
	6ynxOt5oJq74pA2cIT9RTLiylMjkTrVGnTdQUP+kA8Yh0mq7Nmb6rkrWi5nZLOOfq0Y5EuTK0ds4c
	XPM3hjhKW63yzb+5BgrP1NxyR3bmzBhFcehmv4d4kvzWqe/z13D2hBypotrcHR6cGLpf12xzE9Rts
	EqrVzJIrF4MEEzFRn7/qtC65gteEKPasJZcv+FS77Og+StsuDQvjXPQ/VkXRqRUP2HuV130+292yd
	WtZuIYPTOhsUH/MNp+nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4eRO-002hf0-1G;
	Thu, 01 Jun 2023 09:17:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4eRL-002hdx-0o
	for ath10k@lists.infradead.org;
	Thu, 01 Jun 2023 09:17:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 39D0F615A9;
	Thu,  1 Jun 2023 09:17:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B02B0C433D2;
	Thu,  1 Jun 2023 09:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685611069;
	bh=q0CJdSwXOIJZvPvJU/z1sdvR3U3gXtkEs4k/nknZCKE=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Pu4TajYAxmVtPK8l64pTxUbVC50dU99ybV9kjG4vUZuzP1MTiXLq4ebRN9JEswJPC
	 9gqrdWezwjMfxd3n8dW2tpct1bHWQ4u/93au/v8Ux9Tn2lMsGg9DtedCWXQrl0L6Dy
	 70unoZ4Q5hx+1uCP5TK8MUelatzwOkP2LxASzUrk8EcPyukgPdwemfpC9dCCW9NZ+Z
	 7BXfENmmF9ewBz4RvAlGyhE6Gzqcy9lX8vR7qfkUcC/Fx3WeoO9RGi2Op2l7NOyd09
	 evmmFrp0BeDKZlLbqrbIBAgIRIK5LA9G73XQTjOEdbjz5+P4Vl+3A7uUQn4xvZbxrO
	 uzmTG7QxQxGsQ==
From: Kalle Valo <kvalo@kernel.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: "David S. Miller" <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  ath10k@lists.infradead.org,  linux-wireless@vger.kernel.org,  netdev@vger.kernel.org,  kernel@pengutronix.de
Subject: Re: [PATCH net-next 0/4] Convert to platform remove callback returning void
References: <20230601082556.2738446-1-u.kleine-koenig@pengutronix.de>
Date: Thu, 01 Jun 2023 12:17:44 +0300
In-Reply-To: <20230601082556.2738446-1-u.kleine-koenig@pengutronix.de> ("Uwe
	\=\?utf-8\?Q\?Kleine-K\=C3\=B6nig\=22's\?\= message of "Thu, 1 Jun 2023 10:25:52
 +0200")
Message-ID: <87h6rrk0cn.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_021751_349223_E12A7D8E 
X-CRM114-Status: GOOD (  13.45  )
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

VXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4gd3JpdGVz
OgoKPiB0aGUgbW90aXZhdGlvbiBmb3IgdGhpcyBzZXJpZXMgaXMgcGF0Y2ggIzMsIHBhdGNoICMy
IGlzIGEgcHJlcGFyYXRpb24gZm9yIGl0Cj4gYW5kIHBhdGNoZXMgIzEgYW5kICM0IGFyZSBqdXN0
IGNsZWFudXBzIHRoYXQgSSBub3RpY2VkIGVuIHBhc3NhbnQuCj4KPiBCZXN0IHJlZ2FyZHMKPiBV
d2UKPgo+IFV3ZSBLbGVpbmUtS8O2bmlnICg0KToKPiAgIGF0aDEwazogRHJvcCBjbGVhbmluZyBv
ZiBkcml2ZXIgZGF0YSBmcm9tIHByb2JlIGVycm9yIHBhdGggYW5kIHJlbW92ZQo+ICAgYXRoMTBr
OiBEcm9wIGNoZWNrcyB0aGF0IGFyZSBhbHdheXMgZmFsc2UKPiAgIGF0aDEwazogQ29udmVydCB0
byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKPiAgIGF0azEwazogRG9u
J3Qgb3BlbmNvZGUgYXRoMTBrX3BjaV9wcml2KCkgaW4gYXRoMTBrX2FoYl9wcml2KCkKPgo+ICBk
cml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL2FoYi5jICB8IDIwICsrKy0tLS0tLS0tLS0t
LS0tLS0tCj4gIGRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvc25vYy5jIHwgIDggKysr
LS0tLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDIyIGRlbGV0aW9ucygt
KQoKYXRoMTBrIHBhdGNoZXMgZ28gdG8gbXkgYXRoLmdpdCB0cmVlLCBub3QgbmV0LW5leHQuIEFs
c28gIndpZmk6IiBpcwptaXNzaW5nIGZyb20gdGhlIHRpdGxlIGJ1dCBJIGNhbiBhZGQgdGhhdC4K
Ck5vIG5lZWQgdG8gcmVzZW5kIGJlY2F1c2Ugb2YgdGhlc2UuCgotLSAKaHR0cHM6Ly9wYXRjaHdv
cmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXdpcmVsZXNzL2xpc3QvCgpodHRwczovL3dpcmVs
ZXNzLndpa2kua2VybmVsLm9yZy9lbi9kZXZlbG9wZXJzL2RvY3VtZW50YXRpb24vc3VibWl0dGlu
Z3BhdGNoZXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
