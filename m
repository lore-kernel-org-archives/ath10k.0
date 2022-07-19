Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B87FEC433EF
	for <ath10k@archiver.kernel.org>; Tue, 19 Jul 2022 15:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KD3mYyepU/s2h/y6CitnuIKd7/snwq5GWZzc5guvqPo=; b=OKwjX9w4TMlSZh
	YzMiPphGhwqZN+i6XoO53dAbgzdFJ2sLzYHGOv9FZSPFbx6ML/o1HCcKGLhoH9sA0OCgm+xGtc5It
	dT9aQTDUO9VivTLA3TwX+H2xqJ2ViEEP6hlc56TxuyS/+k7kY7Dmca/mO61ti4P+Xf46YNT0owTRm
	Bvwt/VqxWNYIqe0Xuq6Vrki8q26HMwYu2TtRy15yF3O1B2dab272/UTipwwSy3Qb0bKm17iP/LrFX
	ovgeLvXLtIiRRB4DWtPoBon7wchogGjDwiNYqchLZe795U0FagEmwhN18ujzyJXnq4CQ9V4gha//0
	elQq8pFaEPabo0sS3fww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDolB-009tn5-8R; Tue, 19 Jul 2022 15:03:41 +0000
Received: from mail-lf1-f50.google.com ([209.85.167.50])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDol8-009tm3-5z
	for ath10k@lists.infradead.org; Tue, 19 Jul 2022 15:03:39 +0000
Received: by mail-lf1-f50.google.com with SMTP id o7so25268173lfq.9
        for <ath10k@lists.infradead.org>; Tue, 19 Jul 2022 08:03:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=pHD6gf+jnhFiSPhKk1/yH2ypoHYFArDGaWOsXiwhDEU=;
        b=updhTUUaY8K6ZyczZ+BwwlGC+8JcmeUhB9nW3QxAk36WftErWz5lsZD8NplOf3ciJX
         cMAOkyFFDpcgEmawrWvvHgum5l0+QQby9qz5JED2+AcMs+oZUzJ9HFEbciOvDJZuYyjJ
         0he7kfJBoBDYXlTprrAjgtdkLqxLMLfICiLHJoIlbSk6FEY0PZdRubUww8CvBpfq/IoF
         R993vbAQIBZCvi75Xaru1q5NQ39UbUDiPxZOvl8MPLYV4N7qrp5sjYaqbT/zftSIcY3M
         QtyukcQ2J8ohtHNuiC+aRgTy6i+8QPcaHV+r9zN/e3YGwOWm8R5wjP+jlPLKeu1JanEH
         z53Q==
X-Gm-Message-State: AJIora87G/sS4IBXxcTBxkVDqD8FtXxAuM3qY+WEUcizVUHCZ37YuLQ4
	a5X58IGO3YkZIdLJAfc4NZO/kKaSrx8kXI8Vrjk=
X-Google-Smtp-Source: AGRyM1t+hsN65LgMItp1WDi3LIhUAr+34DRwVzbVxuawLzw9XnqW13m/odTrGhdk1cB0YVvOTDKAfLoKo9aaXYCHjyY=
X-Received: by 2002:a05:6512:1312:b0:47f:7bd3:1427 with SMTP id
 x18-20020a056512131200b0047f7bd31427mr16437493lfu.128.1658243014235; Tue, 19
 Jul 2022 08:03:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220718222804.21708-1-linus.luessing@c0d3.blue>
In-Reply-To: <20220718222804.21708-1-linus.luessing@c0d3.blue>
From: Adrian Chadd <adrian@freebsd.org>
Date: Tue, 19 Jul 2022 08:03:21 -0700
Message-ID: <CAJ-VmomaQ-ai7n5i8-8sXsgaih4vjjHXyw+JQESGMERgC8Qqdw@mail.gmail.com>
Subject: Re: [PATCH] mac80211: Fix wrong channel bandwidths reported for aggregates
To: =?UTF-8?Q?Linus_L=C3=BCssing?= <linus.luessing@c0d3.blue>
Cc: Johannes Berg <johannes.berg@intel.com>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	=?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>, 
	Kalle Valo <kvalo@kernel.org>, Felix Fietkau <nbd@nbd.name>, 
	Simon Wunderlich <sw@simonwunderlich.de>, Sven Eckelmann <sven@narfation.org>, 
	ath10k <ath10k@lists.infradead.org>, 
	linux-wireless <linux-wireless@vger.kernel.org>, netdev <netdev@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Linus_L=C3=BCssing?= <ll@simonwunderlich.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_080338_236161_DAC09342 
X-CRM114-Status: UNSURE (   8.02  )
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

T24gTW9uLCAxOCBKdWwgMjAyMiBhdCAxNToyOCwgTGludXMgTMO8c3NpbmcgPGxpbnVzLmx1ZXNz
aW5nQGMwZDMuYmx1ZT4gd3JvdGU6Cj4KPiBGcm9tOiBMaW51cyBMw7xzc2luZyA8bGxAc2ltb253
dW5kZXJsaWNoLmRlPgo+Cj4gQVI5MDAzIGJhc2VkIHdpZmkgY2hpcHMgaGF2ZSBhIGhhcmR3YXJl
IGJ1ZywgdGhleSBhbHdheXMgcmVwb3J0IGEKPiBjaGFubmVsIGJhbmR3aWR0aCBvZiBIVDQwIGZv
ciBhbnkgc3ViLWZyYW1lIG9mIGFuIGFnZ3JlZ2F0ZSB3aGljaCBpcwo+IG5vdCB0aGUgbGFzdCBv
bmUuIE9ubHkgdGhlIGxhc3Qgc3ViLWZyYW1lIGhhcyBjb3JyZWN0IGNoYW5uZWwgYmFuZHdpZHRo
Cj4gaW5mb3JtYXRpb24uCgpIaSEKCkl0J3Mgbm90IGEgaGFyZHdhcmUgYnVnLiBEYXRpbmcgYmFj
ayB0byB0aGUgb3JpZ2luYWwgQVI1NDE2IDExbiBjaGlwLAptb3N0IGZsYWdzIGFyZW4ndCB2YWxp
ZCBmb3Igc3ViZnJhbWVzIGluIGFuIGFnZ3JlZ2F0ZS4gT25seSB0aGUgZmluYWwKZnJhbWUgaGFz
IHZhbGlkIGZsYWdzLiBUaGlzIHdhcyBleHBsaWNpdGx5IGNvdmVyZWQgaW50ZXJuYWxseSB3YXkg
YmFjawp3aGVuLgoKCgoKLWFkcmlhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
