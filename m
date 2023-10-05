Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3805CE772A1
	for <ath10k@archiver.kernel.org>; Thu,  5 Oct 2023 16:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sVOf4YtxV3oD1+3pxkSEUwX5O4nt8dumbmj55cX99S8=; b=hMldSw8RtQGLG7
	5//qjLI20LsnOuGzOm/y6dfI2KOSEvC8ATIxUH/RTxNDqLD/oXouPr4czy7SDOf2Ur0GiL384QU82
	jCA7EmDNDwZCWi9Dvw7bO93V57WWQD/8lZgoNNIOshCDLwcRkI3W73++nAJIGNO8hBmmouUG1pk1c
	7PLT3XIe9aV3XRBD1dVVewFlkypNNVSbcZNVJ2QHfx02fydQdyM8Y37UW7STpw38MnrTlKN6NrIc+
	XPzGtf3gOAoKSUIW4E4Ctn+EOZ41YqLGCQVmLslSzast6POf3a/UOapcGmfJ3iM8HqCVfvqg0c88C
	8emHgigM5sTR6EIxp9ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoQvR-0040V1-12;
	Thu, 05 Oct 2023 16:10:09 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoQvO-0040TS-0g
	for ath10k@lists.infradead.org;
	Thu, 05 Oct 2023 16:10:08 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-537f07dfe8eso12328a12.1
        for <ath10k@lists.infradead.org>; Thu, 05 Oct 2023 09:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696522200; x=1697127000; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wRCO/tDP4lRLu2OPV/gEOu9clmIfNVaCcbX9ayRgMZQ=;
        b=U1q+LJ+eDjfjhbplayJ7Gya5Jp9YJYquelYWLk8RWEjnRh3e3yxzqcJj+W3N+5zUxu
         rXUqm0DMAJLNPV1T7y2Ef7WoBWxn0nxsAh1fz+6J30G8p3ZZ/CEloNNOFwBv6pGKJ/GM
         G+Bghlcy5GEDbv1ZBhCc4u+mQ+v4GCwnHExD8PEToUHwbDj025kkGss02m3oPXq1xZVu
         ZZJo+Ny2CqO0XXTnAVqvdGVNDvXdWoWBSeNX/8BDbLcnCLh1ZQxrLZxmqlwv8J8X6Uey
         PmMCOWIa5yVWfOzZx/LiYhx49ARlC6/z8Ya4sGN/rzotSd+VjRaFvN2AAZbnZUESWzDB
         QN2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696522200; x=1697127000;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wRCO/tDP4lRLu2OPV/gEOu9clmIfNVaCcbX9ayRgMZQ=;
        b=IQqEHmZl7p0cMm2fPK+olikVy7d2vCOsBWEXArQj4goUqWk9PP3R0d0TURByNhZJoQ
         J7YwbIoLPYz5CcLQUwKSYq3Ezn4e3RD23QG3m/ouxOMVZNlFA3YuDSSehRhYU9KtPp0j
         d6EiCWxwGp1QZVBfk5jm5Cb8Hc/9S9RxJe50SpWzmNf0WTIZQcyNrTZ+2i1suYVrCTI6
         4p7iszmUsHaHU4HXntI1E22ipVaQc/dyOSSO8pMxQHx5NBv3PkThvGNXXr5oSDs1xe6A
         WPu+hVj+cKoze4rMQYGyorUhxtenSKCEGtE0h4GsjGAN+U3CVWbk5hTe1LtSLR0EIBls
         +3Ag==
X-Gm-Message-State: AOJu0Ywt9DQ025im9ZgIoq1cdEUT2Pga+POlhgnI/FlXwU5fSZKvcs39
	zuYYkWWNLun/5dKVf4wRCbcVNvEzjC2jeBM2Y4e1ag==
X-Google-Smtp-Source: AGHT+IFzYlK6nOXqFn3XTRyZ9yDEZC9Bs5FeKRJ0Zfr3978r7XwjxquujorP05hjLrjSFu1gUI2ea386eAkHyH3Ha+s=
X-Received: by 2002:a50:8d0f:0:b0:538:50e4:5446 with SMTP id
 s15-20020a508d0f000000b0053850e45446mr71813eds.5.1696522199600; Thu, 05 Oct
 2023 09:09:59 -0700 (PDT)
MIME-Version: 1.0
References: <20231003145150.2498-1-ansuelsmth@gmail.com>
In-Reply-To: <20231003145150.2498-1-ansuelsmth@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 5 Oct 2023 18:09:42 +0200
Message-ID: <CANn89iK5E=SFJoNNTd3SNdT0oPR503dEf_gNfP=Ls3AKS_4F_g@mail.gmail.com>
Subject: Re: [net-next PATCH v2 1/4] netdev: replace simple
 napi_schedule_prep/__napi_schedule to napi_schedule
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, 
	Wolfgang Grandegger <wg@grandegger.com>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Chris Snook <chris.snook@gmail.com>, Raju Rangoju <rajur@chelsio.com>, 
	Jeroen de Borst <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>, 
	Shailend Chand <shailend@google.com>, Douglas Miller <dougmill@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Nick Child <nnac123@linux.ibm.com>, 
	Haren Myneni <haren@linux.ibm.com>, Rick Lindsley <ricklind@linux.ibm.com>, 
	Dany Madden <danymadden@us.ibm.com>, Thomas Falcon <tlfalcon@linux.ibm.com>, 
	Tariq Toukan <tariqt@nvidia.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Krzysztof Halasa <khalasa@piap.pl>, Kalle Valo <kvalo@kernel.org>, 
	Jeff Johnson <quic_jjohnson@quicinc.com>, Gregory Greenman <gregory.greenman@intel.com>, 
	Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>, Intel Corporation <linuxwwan@intel.com>, 
	Chiranjeevi Rapolu <chiranjeevi.rapolu@linux.intel.com>, Liu Haijun <haijun.liu@mediatek.com>, 
	M Chetan Kumar <m.chetan.kumar@linux.intel.com>, 
	Ricardo Martinez <ricardo.martinez@linux.intel.com>, Loic Poulain <loic.poulain@linaro.org>, 
	Sergey Ryazanov <ryazanov.s.a@gmail.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Yuanjun Gong <ruc_gongyuanjun@163.com>, Simon Horman <horms@kernel.org>, 
	Rob Herring <robh@kernel.org>, Ziwei Xiao <ziweixiao@google.com>, 
	Rushil Gupta <rushilg@google.com>, Coco Li <lixiaoyan@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Junfeng Guo <junfeng.guo@intel.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Wei Fang <wei.fang@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Yuri Karpov <YKarpov@ispras.ru>, Zhengchao Shao <shaozhengchao@huawei.com>, 
	Andrew Lunn <andrew@lunn.ch>, Zheng Zengkai <zhengzengkai@huawei.com>, Lee Jones <lee@kernel.org>, 
	Maximilian Luz <luzmaximilian@gmail.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
	Dawei Li <set_pte_at@outlook.com>, Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>, 
	Benjamin Berg <benjamin.berg@intel.com>, linux-rdma@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-can@vger.kernel.org, 
	netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, ath10k@lists.infradead.org, 
	linux-wireless@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231005_091006_275466_CF4334D9 
X-CRM114-Status: UNSURE (   7.79  )
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

T24gVHVlLCBPY3QgMywgMjAyMyBhdCA4OjM24oCvUE0gQ2hyaXN0aWFuIE1hcmFuZ2kgPGFuc3Vl
bHNtdGhAZ21haWwuY29tPiB3cm90ZToKPgo+IFJlcGxhY2UgZHJpdmVycyB0aGF0IHN0aWxsIHVz
ZSBuYXBpX3NjaGVkdWxlX3ByZXAvX19uYXBpX3NjaGVkdWxlCj4gd2l0aCBuYXBpX3NjaGVkdWxl
IGhlbHBlciBhcyBpdCBkb2VzIHRoZSBzYW1lIGV4YWN0IGNoZWNrIGFuZCBjYWxsLgo+Cj4gU2ln
bmVkLW9mZi1ieTogQ2hyaXN0aWFuIE1hcmFuZ2kgPGFuc3VlbHNtdGhAZ21haWwuY29tPgoKUmV2
aWV3ZWQtYnk6IEVyaWMgRHVtYXpldCA8ZWR1bWF6ZXRAZ29vZ2xlLmNvbT4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QK
YXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hdGgxMGsK
