Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0274E75447
	for <ath10k@archiver.kernel.org>; Tue,  3 Oct 2023 10:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=14GTuLvDzi9a5wzcytPwdRaRJhnIOg2M/ZHPnVHPP6w=; b=oIJsNi63DeYXfT
	x+0PA2/YD3Zp+HScas60ciCiHH/iQeoa0Y+ddD3rjqSuYtSPknBE8FqiLRRIMd+2xbK+lT3y3XvAr
	GZ0Ib4LCRD6x3BRbFLMRgcmBo15qtzdIyjRjxdqR/0D742il+aQcG+r7sxESohPSMq8MQdy5PEaWO
	zVkXjQ3dyaCcj8BTpMcvcJIbFFKxHGiF8itBkZZaXO0+MldL1TOWlp38UkubuGeMmUj3TyVNOIewA
	mXHjkJIk3phkPTfODoYgHlx3QvoQ9XA6XdDMrzO9LMq9t+qp703Tb015sFLNqs2PHCriJRI4Kw9C4
	RkjiGmTaX8V3xqYqg+Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qncbH-00EIcr-2h;
	Tue, 03 Oct 2023 10:25:59 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qncbD-00EIcC-1V;
	Tue, 03 Oct 2023 10:25:56 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-40535597f01so6933895e9.3;
        Tue, 03 Oct 2023 03:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696328752; x=1696933552; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UJbPLQ2sJq+JdJneKcIjpXN6+YXEeaAlp1ihUjhH9nY=;
        b=eWdNo2SAo02hEzEEleF2OSDp3LLlSIBLfhAA/iH8Z8rmN6yC57PFV6hHPNyygctOdA
         OwmDKDj1Cc3nDIX6TGqEqqU58HUee3sZirV/Wir35td1HaYcVuB8mpm4w8fBSEuLoLOG
         k/QRD58Y4xt3SmPSv9hReewIi0fxF6B1ctAio1sqY+gUopECURWfeBNeNY1QhhII10IJ
         l7XFaCsWAwylv9FLL0ZQBJdKt2/6F49XgiBmyCKe8NsHnkIfpGKBkmGT2Qn/nRqxA78T
         HK5meMVMhxqoWvNmpDKLxwojYDbVmJ7tmbyfKhIrha/Tq/rGUwlLkXUF1YJT2KDuthSX
         CCVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696328752; x=1696933552;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UJbPLQ2sJq+JdJneKcIjpXN6+YXEeaAlp1ihUjhH9nY=;
        b=mUWSNQ+4y29QP8doFOKXLR24MqAY5mrlRBkw7CTH+YPze0LsasI35iIChoRzByZ9OY
         ZnJ7nyqRgbx0wi1zVu0+sWGz54sn5Jasb1pTgKJU2nZoucIZo90lM7hzMmpF6+hc/nqf
         /kYAVTwc0wkQ/XEK9O8EBoBqoY0CK28Q6iZ1GJFmPsLBuVXcqg0KYsVcvpl1Qcd/gCvI
         sVW2EP56wIIt5n5wnNjawWqWCFY7uAXksQwLf0qSfRkwzLp94j11YTUwaI9fGwZfqG9P
         ToNx/evvQLwsp68HuJcvXlGjjU+tb4mwLWCUBXxIcQUjsWnaTGwuxD+mw95x6t2dMnN4
         XtFg==
X-Gm-Message-State: AOJu0YygSri23e1ijuOTi5x7g6DkKoadlERlhmdJr4As/VQ2Fr2foaj7
	zUdlL8I2LQeMbu+Cn+LftMg=
X-Google-Smtp-Source: AGHT+IH4PtfHldj0VvMZI/On+6s7VpV7CIQtUMLRVRfnUnG2AW04zeibvBdNxyG/QoznL6yrZAPK7w==
X-Received: by 2002:a1c:7c0b:0:b0:405:3885:490a with SMTP id x11-20020a1c7c0b000000b004053885490amr12474883wmc.0.1696328751231;
        Tue, 03 Oct 2023 03:25:51 -0700 (PDT)
Received: from Ansuel-xps. (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c021100b004063cced50bsm945150wmi.23.2023.10.03.03.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 03:25:50 -0700 (PDT)
Message-ID: <651bec2e.050a0220.f5ddb.3810@mx.google.com>
X-Google-Original-Message-ID: <ZRvsKwrdSOI43YWZ@Ansuel-xps.>
Date: Tue, 3 Oct 2023 12:25:47 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Eric Dumazet <edumazet@google.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
	Wolfgang Grandegger <wg@grandegger.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Chris Snook <chris.snook@gmail.com>,
	Raju Rangoju <rajur@chelsio.com>,
	Jeroen de Borst <jeroendb@google.com>,
	Praveen Kaligineedi <pkaligineedi@google.com>,
	Shailend Chand <shailend@google.com>,
	Douglas Miller <dougmill@linux.ibm.com>,
	Nick Child <nnac123@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Haren Myneni <haren@linux.ibm.com>,
	Rick Lindsley <ricklind@linux.ibm.com>,
	Dany Madden <danymadden@us.ibm.com>,
	Thomas Falcon <tlfalcon@linux.ibm.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Krzysztof Halasa <khalasa@piap.pl>, Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Gregory Greenman <gregory.greenman@intel.com>,
	Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>,
	Intel Corporation <linuxwwan@intel.com>,
	Chiranjeevi Rapolu <chiranjeevi.rapolu@linux.intel.com>,
	Liu Haijun <haijun.liu@mediatek.com>,
	M Chetan Kumar <m.chetan.kumar@linux.intel.com>,
	Ricardo Martinez <ricardo.martinez@linux.intel.com>,
	Loic Poulain <loic.poulain@linaro.org>,
	Sergey Ryazanov <ryazanov.s.a@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Yuanjun Gong <ruc_gongyuanjun@163.com>, Wei Fang <wei.fang@nxp.com>,
	Alex Elder <elder@linaro.org>, Simon Horman <horms@kernel.org>,
	Rob Herring <robh@kernel.org>, Bailey Forrest <bcf@google.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Junfeng Guo <junfeng.guo@intel.com>,
	Ziwei Xiao <ziweixiao@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rushil Gupta <rushilg@google.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Yuri Karpov <YKarpov@ispras.ru>,
	Zhengchao Shao <shaozhengchao@huawei.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Zheng Zengkai <zhengzengkai@huawei.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Lee Jones <lee@kernel.org>, Dawei Li <set_pte_at@outlook.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Benjamin Berg <benjamin.berg@intel.com>,
	Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>,
	linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-can@vger.kernel.org, netdev@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: Re: [net-next PATCH 2/4] netdev: make napi_schedule return bool on
 NAPI successful schedule
References: <20231002151023.4054-1-ansuelsmth@gmail.com>
 <20231002151023.4054-2-ansuelsmth@gmail.com>
 <CANn89i+eSWYuE=wE1TPJFtAS1OCfFYytC_nAjDWkizxmR9e6JQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANn89i+eSWYuE=wE1TPJFtAS1OCfFYytC_nAjDWkizxmR9e6JQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_032555_504194_36941559 
X-CRM114-Status: GOOD (  14.63  )
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

T24gVHVlLCBPY3QgMDMsIDIwMjMgYXQgMDc6MjE6NDZBTSArMDIwMCwgRXJpYyBEdW1hemV0IHdy
b3RlOgo+IE9uIE1vbiwgT2N0IDIsIDIwMjMgYXQgNToxMOKAr1BNIENocmlzdGlhbiBNYXJhbmdp
IDxhbnN1ZWxzbXRoQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gQ2hhbmdlIG5hcGlfc2NoZWR1
bGUgdG8gcmV0dXJuIGEgYm9vbCBvbiBOQVBJIHN1Y2Nlc3NmdWwgc2NoZWR1bGUuIFRoaXMKPiA+
IG1pZ2h0IGJlIHVzZWZ1bCBmb3Igc29tZSBkcml2ZXIgdG8gZG8gYWRkaXRpb25hbCBzdGVwIGFm
dGVyIGEgTkFQSSBhaHMKPiAKPiBUaGlzIG1pZ2h0IGJlIHVzZWZ1bCBmb3Igc29tZSBkcml2ZXJz
IHRvIGRvIGFkZGl0aW9uYWwgc3RlcHMgYWZ0ZXIgYQo+IE5BUEkgaGFzIGJlZW4gc2NoZWR1bGVk
Lgo+IAo+ID4gYmVlbiBzY2hlZHVsZWQuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFu
IE1hcmFuZ2kgPGFuc3VlbHNtdGhAZ21haWwuY29tPgo+IAo+IFllYWgsIEkgZ3Vlc3MgeW91IGZv
cmdvdCB0byBtZW50aW9uIEkgc3VnZ2VzdGVkIHRoaXMgcGF0Y2ggLi4uCj4gCj4gUmV2aWV3ZWQt
Ynk6IEVyaWMgRHVtYXpldCA8ZWR1bWF6ZXRAZ29vZ2xlLmNvbT4KClllcyBzb3JyeSwgdG90YWxs
eSBmb3Jnb3QgdG8gYWRkIHRoaXMgaGVyZS4gSSBhbHJlYWR5IGhhdmUgdGhlIHBhdGNoIGZvciB0
aGUKb3RoZXIgZHJpdmVyIChidXQgaXQncyBkZXBlbmRhbnQgb24gdGhpcyBzbyBJJ20gd2FpdGlu
ZykgYW5kIEkgZm9yZ290IHRvCmFkZCB0aGUgdGFnIGFsc28gZm9yIHRoaXMgcGllY2UuCgotLSAK
CUFuc3VlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
