Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7960E81E1F
	for <ath10k@archiver.kernel.org>; Fri,  6 Oct 2023 18:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K6o6wwGovhSkivJn4rFDGYA2IEGlvcblBTiLcBwmOe4=; b=phBsEFju/6Ag5G
	dPQ0SHbfNG5h+N/9UrU7nZj97eH5dC9uNC2rW/I20S9LcisWCqrk7rg0Y1Ff3YoFMuv4zxIgRu6CP
	/UvcCtbLbCXnYN2Q8MvIVnkebVzq6uhOHqhOXT809ZoWTaZQBc/H8jyNnVlKsi15hmezePHUcvv5H
	ub/t68zoSUifvk15VMVfG8pCpcX9Cp/upJa3Eezfvv971pcG9plTuPIhMVCTipeDD9bJbWzfTi01H
	wXUOG+CesQK/LUa5siqCc/2nVrrWzdGUcP3xiKPHVw85chHzi48dfBwK1yYaQCWlrcCzFJ5rLgMAt
	E7IQSBb1P4zAdyRRDPxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qopwe-006LTF-2g;
	Fri, 06 Oct 2023 18:53:04 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qopwa-006LS0-28;
	Fri, 06 Oct 2023 18:53:01 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-31c5cac3ae2so2150602f8f.3;
        Fri, 06 Oct 2023 11:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696618378; x=1697223178; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X70lVOFCcfRrz5BPTne6oD5pXVKA4lkjxXDB0TaolDY=;
        b=ilp3xauz4z4JA/oWAzLfR144jusoFEAPERNpm0X+x7c3Q4dVHL00J1PWmm1oocl/pW
         Or6RemzFQzp2TO88eUH1HOomqRJXS8LApWDxOP6yit1NbqWsstorjGn2bq5ysYb9Eago
         zLW7+AfcvwmzhZa3qt1A33BngLlJUo6OpUTlw8Z5hcUBC2b5p9ohYLAKSrrY/eOw8sDu
         rTznDtGQ0M1VOZK+VCaIGgOgHMpOYxNQEGGxh4Acfq9i0mIaajZhqvvbnum2gdJhNKuT
         m78ylt8Jj38hEyFzL5FyersODkFC9xX9X926gzSLENbRmM+Akk1SAKiawDvyb6QBKzm8
         m6lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696618378; x=1697223178;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X70lVOFCcfRrz5BPTne6oD5pXVKA4lkjxXDB0TaolDY=;
        b=ItGkSp6uQ5aXe6X0j5pUR0I39pFvWUwRCmeyMG4IHCAb8Kya54wKrgi/b75jqq+orx
         oKeF0Krjk9MLIGOqGpyJbq92qsmUULFfqD9mGIqaeaDsFyDhyhsZ5OaXw99GSKaOb1Hd
         fSPAIK/lcbgNu2GJ3Sx/zDq/L51oYhTU1ELsHyvxuy1Uc/fjuEJfmN6ct1JoKjvfrBR+
         XaOHhjvmxTxUVrHv22wCxHC3M4ETGEuGb9PLEGlfY/f6P4vKXk50VPBCHaHGlDDt5lE9
         rxW8f+ZpG3nq5JgSKls/3MBcbgHWw+F0HzxldUM8DiHMudnZaT/3Z74lQytOdq/ranCv
         39Zw==
X-Gm-Message-State: AOJu0YxVQrQtAZZOPhP22Sua1415mdLx9AQHZ6GHhpfQHlXkN3FxKm8c
	9B1kab4ArrD/DxBZy01/tls=
X-Google-Smtp-Source: AGHT+IG8xdl5PYYzmkg371/9IVLxOcEUg0/AO4c3FMmCpHBI1rBYraaud13cZvVNCZmgDH81LCr6PA==
X-Received: by 2002:a5d:4d8e:0:b0:324:7bdd:678e with SMTP id b14-20020a5d4d8e000000b003247bdd678emr7728648wru.60.1696618377892;
        Fri, 06 Oct 2023 11:52:57 -0700 (PDT)
Received: from Ansuel-xps. (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.gmail.com with ESMTPSA id h9-20020a5d5489000000b003179d5aee67sm2231805wrv.94.2023.10.06.11.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 11:52:57 -0700 (PDT)
Message-ID: <65205789.5d0a0220.7e49b.ccb0@mx.google.com>
X-Google-Original-Message-ID: <ZSBXiecYhFuSdjkC@Ansuel-xps.>
Date: Fri, 6 Oct 2023 20:52:57 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>,
	Wolfgang Grandegger <wg@grandegger.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	"David S. Miller" <davem@davemloft.net>,
	Paolo Abeni <pabeni@redhat.com>,
	Chris Snook <chris.snook@gmail.com>,
	Raju Rangoju <rajur@chelsio.com>,
	Jeroen de Borst <jeroendb@google.com>,
	Praveen Kaligineedi <pkaligineedi@google.com>,
	Shailend Chand <shailend@google.com>,
	Douglas Miller <dougmill@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Nick Child <nnac123@linux.ibm.com>,
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
	Yuanjun Gong <ruc_gongyuanjun@163.com>,
	Simon Horman <horms@kernel.org>, Rob Herring <robh@kernel.org>,
	Ziwei Xiao <ziweixiao@google.com>,
	Rushil Gupta <rushilg@google.com>, Coco Li <lixiaoyan@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Junfeng Guo <junfeng.guo@intel.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Wei Fang <wei.fang@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Yuri Karpov <YKarpov@ispras.ru>,
	Zhengchao Shao <shaozhengchao@huawei.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Zheng Zengkai <zhengzengkai@huawei.com>, Lee Jones <lee@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Dawei Li <set_pte_at@outlook.com>,
	Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>,
	Benjamin Berg <benjamin.berg@intel.com>, linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-can@vger.kernel.org,
	netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: Re: [net-next PATCH v2 3/4] netdev: replace napi_reschedule with
 napi_schedule
References: <20231003145150.2498-1-ansuelsmth@gmail.com>
 <20231003145150.2498-3-ansuelsmth@gmail.com>
 <CANn89iK226C-pHUJm7HKMyEtMycGC=KCA2M6kw2KJaUj0cCT6w@mail.gmail.com>
 <20231005093253.2e25533a@kernel.org>
 <CANn89iJQ50AdXP2C1YB2pGjE02WCJ-QCsZqE1yGXtcGsfLA0Jw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANn89iJQ50AdXP2C1YB2pGjE02WCJ-QCsZqE1yGXtcGsfLA0Jw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_115300_704296_3BAC43E5 
X-CRM114-Status: GOOD (  17.37  )
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

T24gVGh1LCBPY3QgMDUsIDIwMjMgYXQgMDY6NDE6MDNQTSArMDIwMCwgRXJpYyBEdW1hemV0IHdy
b3RlOgo+IE9uIFRodSwgT2N0IDUsIDIwMjMgYXQgNjozMuKAr1BNIEpha3ViIEtpY2luc2tpIDxr
dWJhQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIFRodSwgNSBPY3QgMjAyMyAxODoxMTo1
NiArMDIwMCBFcmljIER1bWF6ZXQgd3JvdGU6Cj4gPiA+IE9LLCBidXQgSSBzdXNwZWN0IHNvbWUg
dXNlcnMgb2YgbmFwaV9yZXNjaGVkdWxlKCkgbWlnaHQgbm90IGJlIHJhY2UtZnJlZS4uLgo+ID4K
PiA+IFdoYXQncyB0aGUgcmFjZSB5b3UncmUgdGhpbmtpbmcgb2Y/Cj4gCj4gVGhpcyBzb3J0IG9m
IHRoaW5nLi4uIHRoZSByYWNlIGlzIGluIGZsX3N0YXJ2aW5nKCkgdGhvdWdoLi4uCj4gCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L2NoZWxzaW8vY3hnYjQvc2dlLmMKPiBiL2Ry
aXZlcnMvbmV0L2V0aGVybmV0L2NoZWxzaW8vY3hnYjQvc2dlLmMKPiBpbmRleCA5OGRkNzg1NTFk
ODkuLmI1ZmYyZTFhOTk3NSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9jaGVs
c2lvL2N4Z2I0L3NnZS5jCj4gKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvY2hlbHNpby9jeGdi
NC9zZ2UuYwo+IEBAIC00MjYxLDcgKzQyNjEsNyBAQCBzdGF0aWMgdm9pZCBzZ2VfcnhfdGltZXJf
Y2Ioc3RydWN0IHRpbWVyX2xpc3QgKnQpCj4gCj4gICAgICAgICAgICAgICAgICAgICAgICAgaWYg
KGZsX3N0YXJ2aW5nKGFkYXAsIGZsKSkgewo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcnhxID0gY29udGFpbmVyX29mKGZsLCBzdHJ1Y3Qgc2dlX2V0aF9yeHEsIGZsKTsKPiAtICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlmIChuYXBpX3Jlc2NoZWR1bGUoJnJ4cS0+cnNw
cS5uYXBpKSkKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlmIChuYXBpX3NjaGVk
dWxlKCZyeHEtPnJzcHEubmFwaSkpCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGZsLT5zdGFydmluZysrOwo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ZWxzZQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzZXRfYml0KGlk
LCBzLT5zdGFydmluZ19mbCk7CgpFaGhoIHByb2JsZW0gaXMgdGhhdCB0aGlzIGlzIGEgc2ltcGxl
IHJlbmFtZSBzbyBpZiBhbnkgcmFjZSBpcyBwcmVzZW50LAppdCdzIGFscmVhZHkgdGhlcmUgYW5k
IG5vdCBjYXVzZWQgYnkgdGhpcyByZW5hbWUgOigKCkRvbid0IGtub3cgbWF5YmUgdGhpcyBpcyBv
dXQgb2Ygc2NvcGUgYW5kIHNob3VsZCBiZSBpbnZlc3RpZ2F0ZWQgd2l0aCBhCmJ1ZyByZXBvcnQ/
CgpNYXliZSB0aGlzIHNob3VsZCBiZSBjaGFuZ2VkIHRvIHByZXAvX19zY2hlZHVsZSB0byBwcmV2
ZW50IGFueSBraW5kIG9mCnJhY2U/IEJ1dCBkb2luZyBzbyBkb2Vzbid0IHByZXZlbnQgYW55IGtp
bmQgb2YgIiJzdGFydmluZyIiPwoKLS0gCglBbnN1ZWwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hdGgxMGsK
