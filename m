Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFE87C77B75
	for <ath10k@archiver.kernel.org>; Wed, 17 May 2023 11:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AkNgtDV+IqH4IIOKZniHmDwTohclK8w9uHLqIcO4EwM=; b=LRH3BHyMRevf5k
	rRSoyEQiUx4YQpLJTAeCyHHngkbJcEca1CAzIxDt9K8n4jzCmMx0H2q054MF4N2BwZZ0RHgNOqGz1
	iElBZmicWoMGPb81bSjbmK6beRKXi8v2ZrOJjdmIA24qvAk618ZKTcmyBy+kRV1ktone7nijT+gTl
	RCAs2FOPqzD6icAiC/j3JA/N/PZZTsqtHAsBexondNf3ntusEAYw37nyb+WOpHjZoDZJlUcndEIj0
	rP9VV/iq5QPaseq2wzbnJxlU+CNwOYxIDUD/5G2u7FRpek4xb/Sie1Z6QiDywpLwUpoZQ5hx3xRdC
	TtGY/+YYM8Z4YtRhsPoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzEyV-009XCd-24;
	Wed, 17 May 2023 11:05:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzEyT-009XB2-04
	for ath10k@lists.infradead.org;
	Wed, 17 May 2023 11:05:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8AFB76456C;
	Wed, 17 May 2023 11:05:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25507C4339C;
	Wed, 17 May 2023 11:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684321540;
	bh=Q72kVKGAqEzTgRn6ZNEGuvKnBS2ZxckUN41TA3GqR84=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=FmP3GEO7SWi+Pb2HwSw3Wz2raaGTlyrfSH8A+80cKRGdWYw8WYLO309ufoiUT38tQ
	 /SpSlpmEcAerb0UVvwmmi72UnBVO+Bi+u7H2rVQRl9D1Ourxu7gj/YLsSu8KtCy+YM
	 kezchvkccrzPk0lUlDFHtotlzRuxOqYcNRQymdJlL6WodoLvz34fLJuCzuEdmedMh6
	 NneC3fSVpvXBVlrFwCdlP7uAR8PMfNr6RWwYEOVz+CT8gg0Ws1dAihLyQ8zLRavbta
	 +42Cse/M6+Xfb1KigOW65c4jcsHk1+qEJrd47jAJIyVQxX5+DrHbuVzu5yHGK4Micy
	 VG8eZZ0piI9PA==
From: Kalle Valo <kvalo@kernel.org>
To: Ilpo =?utf-8?Q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-pci@vger.kernel.org,  Bjorn Helgaas <bhelgaas@google.com>,
  Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,  Rob Herring
 <robh@kernel.org>,  Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
  Emmanuel Grumbach <emmanuel.grumbach@intel.com>,  "Rafael J . Wysocki"
 <rafael@kernel.org>,  Heiner Kallweit <hkallweit1@gmail.com>,  Lukas
 Wunner <lukas@wunner.de>,  "David S. Miller" <davem@davemloft.net>,  Eric
 Dumazet <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>,  Paolo
 Abeni <pabeni@redhat.com>,  Michal Kazior <michal.kazior@tieto.com>,
  Janusz Dziedzic <janusz.dziedzic@tieto.com>,  ath10k@lists.infradead.org,
  linux-wireless@vger.kernel.org,  netdev@vger.kernel.org,
  linux-kernel@vger.kernel.org,  Dean Luick
 <dean.luick@cornelisnetworks.com>,  Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>,  stable@vger.kernel.org
Subject: Re: [PATCH v2 9/9] wifi: ath10k: Use RMW accessors for changing LNKCTL
References: <20230517105235.29176-1-ilpo.jarvinen@linux.intel.com>
	<20230517105235.29176-10-ilpo.jarvinen@linux.intel.com>
Date: Wed, 17 May 2023 14:05:33 +0300
In-Reply-To: <20230517105235.29176-10-ilpo.jarvinen@linux.intel.com> ("Ilpo
	\=\?utf-8\?Q\?J\=C3\=A4rvinen\=22's\?\= message of "Wed, 17 May 2023 13:52:35
 +0300")
Message-ID: <87sfbvkyki.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_040541_097144_DEB21986 
X-CRM114-Status: GOOD (  10.44  )
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

SWxwbyBKw6RydmluZW4gPGlscG8uamFydmluZW5AbGludXguaW50ZWwuY29tPiB3cml0ZXM6Cgo+
IERvbid0IGFzc3VtZSB0aGF0IG9ubHkgdGhlIGRyaXZlciB3b3VsZCBiZSBhY2Nlc3NpbmcgTE5L
Q1RMLiBBU1BNCj4gcG9saWN5IGNoYW5nZXMgY2FuIHRyaWdnZXIgd3JpdGUgdG8gTE5LQ1RMIG91
dHNpZGUgb2YgZHJpdmVyJ3MgY29udHJvbC4KPgo+IFVzZSBSTVcgY2FwYWJpbGl0eSBhY2Nlc3Nv
cnMgd2hpY2ggZG9lcyBwcm9wZXIgbG9ja2luZyB0byBhdm9pZCBsb3NpbmcKPiBjb25jdXJyZW50
IHVwZGF0ZXMgdG8gdGhlIHJlZ2lzdGVyIHZhbHVlLiBPbiByZXN0b3JlLCBjbGVhciB0aGUgQVNQ
TUMKPiBmaWVsZCBwcm9wZXJseS4KPgo+IEZpeGVzOiA3NmQ4NzBlZDA5YWIgKCJhdGgxMGs6IGVu
YWJsZSBBU1BNIikKPiBTdWdnZXN0ZWQtYnk6IEx1a2FzIFd1bm5lciA8bHVrYXNAd3VubmVyLmRl
Pgo+IFNpZ25lZC1vZmYtYnk6IElscG8gSsOkcnZpbmVuIDxpbHBvLmphcnZpbmVuQGxpbnV4Lmlu
dGVsLmNvbT4KPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwoKQWNrZWQtYnk6IEthbGxlIFZh
bG8gPGt2YWxvQGtlcm5lbC5vcmc+CgotLSAKaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9w
cm9qZWN0L2xpbnV4LXdpcmVsZXNzL2xpc3QvCgpodHRwczovL3dpcmVsZXNzLndpa2kua2VybmVs
Lm9yZy9lbi9kZXZlbG9wZXJzL2RvY3VtZW50YXRpb24vc3VibWl0dGluZ3BhdGNoZXMKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5n
IGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
