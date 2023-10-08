Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C49D2E95A82
	for <ath10k@archiver.kernel.org>; Sun,  8 Oct 2023 07:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3fj57274QBwvJ4Nz6Q7b+mO+fsN37FDGKkEcK6F/Rm8=; b=vZImtQGrN3dSEo
	zLQSUiney5lpa/xsQaY0+hfXcQ027iFgmdDn+6vBgz2Y5+bnRW7BW/DCulNY9xagsvoi0YO4NKpLd
	Ge+Vqp0/rP92bQ7OVUeUYrb3UX81q9vjjXb20Z6+ekuibCO/WeXoXfsWK2fyZzoxzf0Dolzu3sPvv
	RZQa8LhwgS1Bd5faaYrvVPhPIniKaM9fqH6GGIC15y0fn+aTbOTi+VzjhGdirgpIthGWCqPGrIIpQ
	xKJp9+7zXdCG7f0iZ5R2Q3JsjLmH8IGejZHgl2ex3CdvMtqCU6Yh6it8T9D1jwA8rw2dl5sNjpcCk
	8qt4hnuRz6AuUYH428+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpNmU-008R71-2Y;
	Sun, 08 Oct 2023 07:00:50 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpNmQ-008R67-0Q
	for ath10k@lists.infradead.org;
	Sun, 08 Oct 2023 07:00:47 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-51e24210395so8099a12.0
        for <ath10k@lists.infradead.org>; Sun, 08 Oct 2023 00:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696748442; x=1697353242; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mH8rgsD0Hcv//mdO9CGjCjg749l4skH04u5NpNfXSJo=;
        b=NSv8uppJHh+SRDgZmlDhnMEy/mM04NKzJkbdXsuclbLm0c6WbxkxgJ3dXY5mofeA7Y
         te5TMIkBHChK/z0Zl/YpDZA05iNMJr+ppviLCp94CKnWo2JFwk5iEBr8V9H1Sji+9tn5
         2rCiKqryRO4P8WQehdBqO/aXmwXYWDMcwmTKX4TKYksCaWgMS8Q0zF8UKrMSlaJbtcC1
         c0kLTZ6wxtlR0amuQ9ABt31vmlrfPiK3NiboYDVKIBiI8c3gI/7010HJHCYYa8MMdBCU
         0Csj4WcKgwQojieP0qBXOiIdb+iXSg5ziqTQMMGXKY8doOOVC+5C/JUDTUCMo/yuJ4Si
         HLAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696748442; x=1697353242;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mH8rgsD0Hcv//mdO9CGjCjg749l4skH04u5NpNfXSJo=;
        b=gqTUTJ697ddLGvPw6AFKmTs/1zK+iLXe69doV/EhxWbR2mEoZ2o3hB5/FFdkscRFbx
         5fz8iuBbzHwg4W0Qy/lIfRtB7RkqGai6TiWYKSRhJ90q4mxm9a142zYDZqHA0Xs6nG/4
         FTkilIu/gVTgWPO8IE7OkUXAfKaX63LnOn+a3zaDPMAC0weuzysk9L3j719ZoP1S9RCd
         5lADE9M98JvHMxIlcyMP0BCKaP+JVr74tzuEWRO095R3ADdUJOcqlH6bXuKsNpPdMbrH
         fb0jCm90tzsp3J5Q9imedhVkUT4Pv3veiIi78bBrUhDz0MvMLirN9LpSkDlcIwzQgOoe
         lL5Q==
X-Gm-Message-State: AOJu0YwH1XkeKNzSZzepmtvWe+48wbifCoo+XV24SISh7VEnGxeD/z54
	unIkEE717DJkmWKwVwNublRG3IZe+Zah5SqbiDBl3g==
X-Google-Smtp-Source: AGHT+IEsm3Yaeezo31ko5A6vpc3J66AXEC7Qr6Rm72BDJiSgp93BqqzS34935wa+NNU03Xl/ZB6KCTMLkH8SD9/RjuM=
X-Received: by 2002:a50:9fa4:0:b0:538:5f9e:f0fc with SMTP id
 c33-20020a509fa4000000b005385f9ef0fcmr307070edf.0.1696748442128; Sun, 08 Oct
 2023 00:00:42 -0700 (PDT)
MIME-Version: 1.0
References: <20231003145150.2498-1-ansuelsmth@gmail.com> <20231003145150.2498-3-ansuelsmth@gmail.com>
 <CANn89iK226C-pHUJm7HKMyEtMycGC=KCA2M6kw2KJaUj0cCT6w@mail.gmail.com>
 <20231005093253.2e25533a@kernel.org> <CANn89iJQ50AdXP2C1YB2pGjE02WCJ-QCsZqE1yGXtcGsfLA0Jw@mail.gmail.com>
 <65205789.5d0a0220.7e49b.ccb0@mx.google.com>
In-Reply-To: <65205789.5d0a0220.7e49b.ccb0@mx.google.com>
From: Eric Dumazet <edumazet@google.com>
Date: Sun, 8 Oct 2023 09:00:29 +0200
Message-ID: <CANn89i+ntByi2709y10PN6cgri-b0EWxPSNXdu_Nf2nOvJ45FQ@mail.gmail.com>
Subject: Re: [net-next PATCH v2 3/4] netdev: replace napi_reschedule with napi_schedule
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, 
	Wolfgang Grandegger <wg@grandegger.com>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	"David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, 
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
X-CRM114-CacheID: sfid-20231008_000046_193288_E8FBFF2C 
X-CRM114-Status: GOOD (  20.62  )
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

T24gRnJpLCBPY3QgNiwgMjAyMyBhdCA4OjUy4oCvUE0gQ2hyaXN0aWFuIE1hcmFuZ2kgPGFuc3Vl
bHNtdGhAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIFRodSwgT2N0IDA1LCAyMDIzIGF0IDA2OjQx
OjAzUE0gKzAyMDAsIEVyaWMgRHVtYXpldCB3cm90ZToKPiA+IE9uIFRodSwgT2N0IDUsIDIwMjMg
YXQgNjozMuKAr1BNIEpha3ViIEtpY2luc2tpIDxrdWJhQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4g
Pgo+ID4gPiBPbiBUaHUsIDUgT2N0IDIwMjMgMTg6MTE6NTYgKzAyMDAgRXJpYyBEdW1hemV0IHdy
b3RlOgo+ID4gPiA+IE9LLCBidXQgSSBzdXNwZWN0IHNvbWUgdXNlcnMgb2YgbmFwaV9yZXNjaGVk
dWxlKCkgbWlnaHQgbm90IGJlIHJhY2UtZnJlZS4uLgo+ID4gPgo+ID4gPiBXaGF0J3MgdGhlIHJh
Y2UgeW91J3JlIHRoaW5raW5nIG9mPwo+ID4KPiA+IFRoaXMgc29ydCBvZiB0aGluZy4uLiB0aGUg
cmFjZSBpcyBpbiBmbF9zdGFydmluZygpIHRob3VnaC4uLgo+ID4KPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL25ldC9ldGhlcm5ldC9jaGVsc2lvL2N4Z2I0L3NnZS5jCj4gPiBiL2RyaXZlcnMvbmV0
L2V0aGVybmV0L2NoZWxzaW8vY3hnYjQvc2dlLmMKPiA+IGluZGV4IDk4ZGQ3ODU1MWQ4OS4uYjVm
ZjJlMWE5OTc1IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvY2hlbHNpby9j
eGdiNC9zZ2UuYwo+ID4gKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvY2hlbHNpby9jeGdiNC9z
Z2UuYwo+ID4gQEAgLTQyNjEsNyArNDI2MSw3IEBAIHN0YXRpYyB2b2lkIHNnZV9yeF90aW1lcl9j
YihzdHJ1Y3QgdGltZXJfbGlzdCAqdCkKPiA+Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICBp
ZiAoZmxfc3RhcnZpbmcoYWRhcCwgZmwpKSB7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHJ4cSA9IGNvbnRhaW5lcl9vZihmbCwgc3RydWN0IHNnZV9ldGhfcnhxLCBmbCk7Cj4g
PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlmIChuYXBpX3Jlc2NoZWR1bGUoJnJ4
cS0+cnNwcS5uYXBpKSkKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaWYgKG5h
cGlfc2NoZWR1bGUoJnJ4cS0+cnNwcS5uYXBpKSkKPiA+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBmbC0+c3RhcnZpbmcrKzsKPiA+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgZWxzZQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHNldF9iaXQoaWQsIHMtPnN0YXJ2aW5nX2ZsKTsKPgo+IEVoaGggcHJvYmxlbSBpcyB0aGF0
IHRoaXMgaXMgYSBzaW1wbGUgcmVuYW1lIHNvIGlmIGFueSByYWNlIGlzIHByZXNlbnQsCj4gaXQn
cyBhbHJlYWR5IHRoZXJlIGFuZCBub3QgY2F1c2VkIGJ5IHRoaXMgcmVuYW1lIDooCj4KPiBEb24n
dCBrbm93IG1heWJlIHRoaXMgaXMgb3V0IG9mIHNjb3BlIGFuZCBzaG91bGQgYmUgaW52ZXN0aWdh
dGVkIHdpdGggYQo+IGJ1ZyByZXBvcnQ/Cj4KPiBNYXliZSB0aGlzIHNob3VsZCBiZSBjaGFuZ2Vk
IHRvIHByZXAvX19zY2hlZHVsZSB0byBwcmV2ZW50IGFueSBraW5kIG9mCj4gcmFjZT8gQnV0IGRv
aW5nIHNvIGRvZXNuJ3QgcHJldmVudCBhbnkga2luZCBvZiAiInN0YXJ2aW5nIiI/Cj4KCkkgZ2F2
ZSBhICJSZXZpZXdlZC1ieTogRXJpYyBEdW1hemV0IDxlZHVtYXpldEBnb29nbGUuY29tPiIsIG1l
YW5pbmcKeW91ciBwYXRjaCB3YXMgb2sgZm9yIG1lLgoKTXkgcmVtYXJrIHdhcyBvcnRob2dvbmFs
LCBJIGFtIG5vdCBhc2tpbmcgeW91IHRvIGFjdCBvbiBpdCA7KQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2F0aDEwawo=
