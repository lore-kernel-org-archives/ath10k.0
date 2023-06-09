Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 892CDC7EE25
	for <ath10k@archiver.kernel.org>; Fri,  9 Jun 2023 12:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HtrGVfcgR8jANk+hTzrU3ekXpqOpFHEF7aRyci9ANwc=; b=VFCjiB41adHIlf
	pRwUDK5NBPzElzstBKpdFVA2jPaBByeX6FG2Uqne/pHFrs5+4GF3lMtWh/kFubzFYAsCliyw25K3t
	X83zFvzXxsIsnBmXsOUDT8BX+fjVYzv+Qiz7hngZsntqFn72XM7I9ApYN+iIS7ruYI06MPOa38Szt
	KOdPUXqKmOWw79+RDKvglI0bkeySAvloolQQEQBjV101chUm3RzK6bTf7EKERCEYT2AI9icODchQ2
	w7N/a1uaWhzzsvdPhydgEUymGzgx6t9fM9Rdg2j8OwivSw1GTr6qMdsKDI+/XVvJBYfXHCGOihBgj
	yRSK9kN7XIvMBNPugFqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7bE6-00CzJn-1R;
	Fri, 09 Jun 2023 12:28:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7bE2-00CzJQ-2l
	for ath10k@lists.infradead.org;
	Fri, 09 Jun 2023 12:28:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5A9CA6104F;
	Fri,  9 Jun 2023 12:28:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2611C433EF;
	Fri,  9 Jun 2023 12:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686313695;
	bh=xmQbsGpjE1ohlx+uMchWdzhzKFcj0m+A3jS6YKTfnMc=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=FL6vxUbsONT2hmbK18cIHVPbawKYk8VAgSBj7WFBSxWl84GGO7zXCfzioco6I1PZJ
	 MN/Z6rw9uCQXfMbp1nk7tfPcNnZalT0T6gChLEBvoUlSJYyavNR6wGHxYXnuARdVit
	 AoMqqTiNPeI1MVVqEdP3a6VW6h/TT2lYUjp9MnHwoeJYAF+0NmOlBwSAz0NE6z827c
	 pK7zCS6feJV+Q4YfAtvrbXXTa+XfO98X7EdtRWZfcQpliA46HtsM4t5Gt8eh+xXFtj
	 T0m7H+YgSqvAUt3opAf31cVx8jyPV0GIlCjjxvMAJhbPo3lbLDZJMNGYD4VwWTHPoL
	 PtmdyD9WbIHaQ==
MIME-Version: 1.0
Subject: Re: [PATCH net-next 1/4] ath10k: Drop cleaning of driver data from
 probe
 error path and remove
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230601082556.2738446-2-u.kleine-koenig@pengutronix.de>
References: <20230601082556.2738446-2-u.kleine-koenig@pengutronix.de>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=  <u.kleine-koenig@pengutronix.de>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel@pengutronix.de
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <168631369188.10496.13768584046079083634.kvalo@kernel.org>
Date: Fri,  9 Jun 2023 12:28:13 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_052818_939529_6B199401 
X-CRM114-Status: UNSURE (   7.80  )
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

VXdlIEtsZWluZS1Lw7ZuaWcgIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+IHdyb3Rl
OgoKPiBUaGUgZHJpdmVyIGNvcmUgY2FyZXMgZm9yIHJlc2V0dGluZyBkcml2ZXIgZGF0YSBpZiBw
cm9iZSBmYWlscyBhbmQgYWZ0ZXIKPiByZW1vdmUuIFNvIGRyb3AgdGhlIGV4cGxpY2l0IGFuZCBk
dXBsaWNhdGUgY2xlYW51cCBpbiB0aGUgZHJpdmVyJ3MKPiBmdW5jdGlvbnMuCj4gCj4gU2lnbmVk
LW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5k
ZT4KPiBTaWduZWQtb2ZmLWJ5OiBLYWxsZSBWYWxvIDxxdWljX2t2YWxvQHF1aWNpbmMuY29tPgoK
NCBwYXRjaGVzIGFwcGxpZWQgdG8gYXRoLW5leHQgYnJhbmNoIG9mIGF0aC5naXQsIHRoYW5rcy4K
CmVjM2IxY2UyY2EzNCB3aWZpOiBhdGgxMGs6IERyb3AgY2xlYW5pbmcgb2YgZHJpdmVyIGRhdGEg
ZnJvbSBwcm9iZSBlcnJvciBwYXRoIGFuZCByZW1vdmUKZmFkNWFjODBkZmE1IHdpZmk6IGF0aDEw
azogRHJvcCBjaGVja3MgdGhhdCBhcmUgYWx3YXlzIGZhbHNlCmQ0NTdiZmYyNzYzMyB3aWZpOiBh
dGgxMGs6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lk
CjYzNThiMTAzNzE1NyB3aWZpOiBhdGsxMGs6IERvbid0IG9wZW5jb2RlIGF0aDEwa19wY2lfcHJp
digpIGluIGF0aDEwa19haGJfcHJpdigpCgotLSAKaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9y
Zy9wcm9qZWN0L2xpbnV4LXdpcmVsZXNzL3BhdGNoLzIwMjMwNjAxMDgyNTU2LjI3Mzg0NDYtMi11
LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGUvCgpodHRwczovL3dpcmVsZXNzLndpa2kua2Vy
bmVsLm9yZy9lbi9kZXZlbG9wZXJzL2RvY3VtZW50YXRpb24vc3VibWl0dGluZ3BhdGNoZXMKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFp
bGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
