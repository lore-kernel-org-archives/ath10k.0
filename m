Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAAADE95A67
	for <ath10k@archiver.kernel.org>; Sun,  8 Oct 2023 18:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ms+MSTd5TEoE794wQkbvfcM9afdvJsGCvnyAd3m81LE=; b=d0p1tige6dG8J4
	TMZoRDoztyLq06Fc3AMzKSGf3ZgV6aMtDJpZ77cf5pjL/JC+JbpXn0pogh3n6//JZFzAHB07J7o60
	Zt7AtqIluqXLi8TYYDAth8FkELdxK32Jc0/I7GB12pAcOrVsTFsVUjkAiD6D8h6x1cFcMc2kFo4qQ
	lFJ1DXSD+i1z6Jd9+m7jsePehivBw8x9aAXDEWK2nH2R6/IadoNZt33tNwUUdP16ia8aerrHj1ino
	pDz3lFVSiXdku+s1FxH+K3SOTj69gO1CzmKLgo5WDkLPsGG8Dy/76F2AXl08Gr193+H5TGu0KAtu9
	2yO89xTDMMcb3NSEyn6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpYVC-00973u-2N;
	Sun, 08 Oct 2023 18:27:42 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpYV7-00973R-2c;
	Sun, 08 Oct 2023 18:27:39 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-32615eaa312so3499022f8f.2;
        Sun, 08 Oct 2023 11:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696789654; x=1697394454; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UYhUlM0v/kiBnSA7qqkERNTe3ha0hd9wd9BeXsJuFRo=;
        b=d0tpI4p66kOFPpuzsqtCm3JNd71xtYI5aOjOSAQ5ODrgNhW1uVy7FjWvexnE/Dn9Br
         xgm4yqNUQxJwrI2EEBLSPW/0W9ru2P6NNQYGpibLbDilYC/DYeDGdXzFdpgRwPEgd1PS
         utATvCRbazCoqqeZxH27G+iaJGNGrVuj5IvE4qPsXdZuMEKXXkfVNaGRxhl4J0RpdQ6m
         Q3oai4hxdsZctQtKmauOTyZ0+8uM61C1WSLBXYW4znfNu5Jn6+9tzWSRnnyhnN7li0mF
         H3mSVLMFB2vXEPATzxfKsxax2tj036oBTgcpILNRm+lJMnhl1pz8yF+kuWrwnlFqTPUa
         2CaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696789654; x=1697394454;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UYhUlM0v/kiBnSA7qqkERNTe3ha0hd9wd9BeXsJuFRo=;
        b=OyL3p6b0fErJx+T3RA2xA2x/tveIJtLMDpECC30T3GR1DWVW6LFI+27Es1lQ5bDfo7
         HY01Z6U0zQKPLVykMDYb54oJ8k9i7ek8RJ/WU4bXYFxCzWYCAmisfSMRJMpjKJy4FyCO
         ejcHEC+9F8T8Ncl816qiwAF5gJ4qDOcnpUloZMhDP7ZAWe2dELSBo9guF096CSe9e2zG
         P5bJBUoWfZ9T6M7g1HHHpR3fTR/aO8+FC9APN8c2I+Ra5bKOk0szGoCuD4S3w/+2MhLU
         /QxsxWc16C7fFFZZhJ+QceBQq+LAx2+Csp1a9/TeX1XGMXBmmQzJjiWcH3v1lugC3EUE
         4zGQ==
X-Gm-Message-State: AOJu0Yw1x6lE7bJD5rpy3ryl6ONzou/EZ2sFdFIc2LXkQeDztRZNtX08
	iV3WAcrN9q6HLadmzJM6Xlc=
X-Google-Smtp-Source: AGHT+IG1Z2UQG/8uimtzwOsX0SSnSzQeAnFClPvayUdx2bESkKFHKQw9/TSlsvhrREuwaEcXQ8SiYA==
X-Received: by 2002:a5d:50c8:0:b0:316:f24b:597a with SMTP id f8-20020a5d50c8000000b00316f24b597amr11755917wrt.46.1696789653876;
        Sun, 08 Oct 2023 11:27:33 -0700 (PDT)
Received: from Ansuel-xps. (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.gmail.com with ESMTPSA id j14-20020adff54e000000b003233a31a467sm7413627wrp.34.2023.10.08.11.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Oct 2023 11:27:33 -0700 (PDT)
Message-ID: <6522f495.df0a0220.326ed.de6c@mx.google.com>
X-Google-Original-Message-ID: <ZSL0kLgKGmK2HJ9x@Ansuel-xps.>
Date: Sun, 8 Oct 2023 20:27:28 +0200
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
Subject: Re: [net-next PATCH v2 4/4] netdev: use napi_schedule bool instead
 of napi_schedule_prep/__napi_schedule
References: <20231003145150.2498-1-ansuelsmth@gmail.com>
 <20231003145150.2498-4-ansuelsmth@gmail.com>
 <CANn89iLtYZJPOQE7OkAbEdmhT8qjzAJ+27poa__3c8Nf0M6u_w@mail.gmail.com>
 <652056c5.5d0a0220.2b60d.c5dc@mx.google.com>
 <CANn89i+Cie+oE_hTWkyJWutTG9CnPy+dbW+-A97Q+E9Rq-f9rQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANn89i+Cie+oE_hTWkyJWutTG9CnPy+dbW+-A97Q+E9Rq-f9rQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231008_112737_876133_1177BD68 
X-CRM114-Status: GOOD (  36.63  )
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

T24gU3VuLCBPY3QgMDgsIDIwMjMgYXQgMDk6MDg6NDFBTSArMDIwMCwgRXJpYyBEdW1hemV0IHdy
b3RlOgo+IE9uIEZyaSwgT2N0IDYsIDIwMjMgYXQgODo0OeKAr1BNIENocmlzdGlhbiBNYXJhbmdp
IDxhbnN1ZWxzbXRoQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gVGh1LCBPY3QgMDUsIDIw
MjMgYXQgMDY6MTY6MjZQTSArMDIwMCwgRXJpYyBEdW1hemV0IHdyb3RlOgo+ID4gPiBPbiBUdWUs
IE9jdCAzLCAyMDIzIGF0IDg6MzbigK9QTSBDaHJpc3RpYW4gTWFyYW5naSA8YW5zdWVsc210aEBn
bWFpbC5jb20+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gUmVwbGFjZSBpZiBjb25kaXRpb24gb2Yg
bmFwaV9zY2hlZHVsZV9wcmVwL19fbmFwaV9zY2hlZHVsZSBhbmQgdXNlIGJvb2wKPiA+ID4gPiBm
cm9tIG5hcGlfc2NoZWR1bGUgZGlyZWN0bHkgd2hlcmUgcG9zc2libGUuCj4gPiA+ID4KPiA+ID4g
PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gTWFyYW5naSA8YW5zdWVsc210aEBnbWFpbC5jb20+
Cj4gPiA+ID4gLS0tCj4gPiA+ID4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L2F0aGVyb3MvYXRseC9h
dGwxLmMgICAgIHwgNCArLS0tCj4gPiA+ID4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L3Rvc2hpYmEv
dGMzNTgxNS5jICAgICAgIHwgNCArLS0tCj4gPiA+ID4gIGRyaXZlcnMvbmV0L3dpcmVsZXNzL2lu
dGVsL2l3bHdpZmkvcGNpZS9yeC5jIHwgNCArLS0tCj4gPiA+ID4gIDMgZmlsZXMgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQo+ID4gPiA+Cj4gPiA+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L2F0aGVyb3MvYXRseC9hdGwxLmMgYi9kcml2ZXJzL25l
dC9ldGhlcm5ldC9hdGhlcm9zL2F0bHgvYXRsMS5jCj4gPiA+ID4gaW5kZXggMDJhYTZmZDhlYmMy
Li5hOTAxNGQ3OTMyZGIgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQv
YXRoZXJvcy9hdGx4L2F0bDEuYwo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L2F0
aGVyb3MvYXRseC9hdGwxLmMKPiA+ID4gPiBAQCAtMjQ0Niw3ICsyNDQ2LDcgQEAgc3RhdGljIGlu
dCBhdGwxX3JpbmdzX2NsZWFuKHN0cnVjdCBuYXBpX3N0cnVjdCAqbmFwaSwgaW50IGJ1ZGdldCkK
PiA+ID4gPgo+ID4gPiA+ICBzdGF0aWMgaW5saW5lIGludCBhdGwxX3NjaGVkX3JpbmdzX2NsZWFu
KHN0cnVjdCBhdGwxX2FkYXB0ZXIqIGFkYXB0ZXIpCj4gPiA+ID4gIHsKPiA+ID4gPiAtICAgICAg
IGlmICghbmFwaV9zY2hlZHVsZV9wcmVwKCZhZGFwdGVyLT5uYXBpKSkKPiA+ID4gPiArICAgICAg
IGlmICghbmFwaV9zY2hlZHVsZSgmYWRhcHRlci0+bmFwaSkpCj4gPiA+ID4gICAgICAgICAgICAg
ICAgIC8qIEl0IGlzIHBvc3NpYmxlIGluIGNhc2UgZXZlbiB0aGUgUlgvVFggaW50cyBhcmUgZGlz
YWJsZWQgdmlhIElNUgo+ID4gPiA+ICAgICAgICAgICAgICAgICAgKiByZWdpc3RlciB0aGUgSVNS
IGJpdHMgYXJlIHNldCBhbnl3YXkgKGJ1dCBkbyBub3QgcHJvZHVjZSBJUlEpLgo+ID4gPiA+ICAg
ICAgICAgICAgICAgICAgKiBUbyBoYW5kbGUgc3VjaCBzaXR1YXRpb24gdGhlIG5hcGkgZnVuY3Rp
b25zIHVzZWQgdG8gY2hlY2sgaXMKPiA+ID4gPiBAQCAtMjQ1NCw4ICsyNDU0LDYgQEAgc3RhdGlj
IGlubGluZSBpbnQgYXRsMV9zY2hlZF9yaW5nc19jbGVhbihzdHJ1Y3QgYXRsMV9hZGFwdGVyKiBh
ZGFwdGVyKQo+ID4gPiA+ICAgICAgICAgICAgICAgICAgKi8KPiA+ID4gPiAgICAgICAgICAgICAg
ICAgcmV0dXJuIDA7Cj4gPiA+ID4KPiA+ID4gPiAtICAgICAgIF9fbmFwaV9zY2hlZHVsZSgmYWRh
cHRlci0+bmFwaSk7Cj4gPiA+ID4gLQo+ID4gPiA+ICAgICAgICAgLyoKPiA+ID4gPiAgICAgICAg
ICAqIERpc2FibGUgUlgvVFggaW50cyB2aWEgSU1SIHJlZ2lzdGVyIGlmIGl0IGlzCj4gPiA+ID4g
ICAgICAgICAgKiBhbGxvd2VkLiBOQVBJIGhhbmRsZXIgbXVzdCByZWVuYWJsZSB0aGVtIGluIHNh
bWUKPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvdG9zaGliYS90YzM1
ODE1LmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC90b3NoaWJhL3RjMzU4MTUuYwo+ID4gPiA+IGlu
ZGV4IDE0Y2Y2ZWNmNmQwZC4uYThiOGEwZTEzZjlhIDEwMDY0NAo+ID4gPiA+IC0tLSBhL2RyaXZl
cnMvbmV0L2V0aGVybmV0L3Rvc2hpYmEvdGMzNTgxNS5jCj4gPiA+ID4gKysrIGIvZHJpdmVycy9u
ZXQvZXRoZXJuZXQvdG9zaGliYS90YzM1ODE1LmMKPiA+ID4gPiBAQCAtMTQzNiw5ICsxNDM2LDcg
QEAgc3RhdGljIGlycXJldHVybl90IHRjMzU4MTVfaW50ZXJydXB0KGludCBpcnEsIHZvaWQgKmRl
dl9pZCkKPiA+ID4gPiAgICAgICAgIGlmICghKGRtYWN0bCAmIERNQV9JbnRNYXNrKSkgewo+ID4g
PiA+ICAgICAgICAgICAgICAgICAvKiBkaXNhYmxlIGludGVycnVwdHMgKi8KPiA+ID4gPiAgICAg
ICAgICAgICAgICAgdGNfd3JpdGVsKGRtYWN0bCB8IERNQV9JbnRNYXNrLCAmdHItPkRNQV9DdGwp
Owo+ID4gPiA+IC0gICAgICAgICAgICAgICBpZiAobmFwaV9zY2hlZHVsZV9wcmVwKCZscC0+bmFw
aSkpCj4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgX19uYXBpX3NjaGVkdWxlKCZscC0+
bmFwaSk7Cj4gPiA+ID4gLSAgICAgICAgICAgICAgIGVsc2Ugewo+ID4gPiA+ICsgICAgICAgICAg
ICAgICBpZiAoIW5hcGlfc2NoZWR1bGUoJmxwLT5uYXBpKSkgewo+ID4gPiA+ICAgICAgICAgICAg
ICAgICAgICAgICAgIHByaW50ayhLRVJOX0VSUiAiJXM6IGludGVycnVwdCB0YWtlbiBpbiBwb2xs
XG4iLAo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkZXYtPm5hbWUpOwo+
ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIEJVRygpOwo+ID4gPgo+ID4gPiBIbW1tLi4u
IGNvdWxkIHlvdSBhbHNvIHJlbW92ZSB0aGlzIEJVRygpID8gSSB0aGluayB0aGlzIGNvZGUgcGF0
aCBjYW4gYmUgdGFrZW4KPiA+ID4gaWYgc29tZSBhcHBsaWNhdGlvbnMgYXJlIHVzaW5nIGJ1c3kg
cG9sbGluZy4KPiA+ID4KPiA+ID4gT3Igc2ltcGx5IHJld3JpdGUgdGhpcyB3aXRoIHRoZSB0cmFk
aXRpb25hbAo+ID4gPgo+ID4gPiBpZiAobmFwaV9zY2hlZHVsZV9wcmVwKCZscC0+bmFwaSkpIHsK
PiA+ID4gICAgLyogZGlzYWJsZSBpbnRlcnJ1cHRzICovCj4gPiA+ICAgIHRjX3dyaXRlbChkbWFj
dGwgfCBETUFfSW50TWFzaywgJnRyLT5ETUFfQ3RsKTsKPiA+ID4gICAgIF9fbmFwaV9zY2hlZHVs
ZSgmbHAtPm5hcGkpOwo+ID4gPiB9Cj4gPiA+Cj4gPiA+Cj4gPgo+ID4gTWhoaCBpcyBpdCBzYWZl
IHRvIGRvIHNvPyBJIG1lYW4gaXQgc2VlbXMgdmVyeSB3cm9uZyB0byBwcmludCBhIHdhcm5pbmcK
PiA+IGFuZCBCVUcoKSBpbnN0ZWFkIG9mIGRpc2FibGluZyB0aGUgaW50ZXJydXB0IG9ubHkgaWYg
bmFwaSBjYW4gYmUKPiA+IHNjaGVkdWxlZC4uLiBNYXliZSBpcyB2ZXJ5IG9sZCBjb2RlPyBUaGUg
bW9yZSBJIHNlZSB0aGlzIHRoZSBtb3JlIEkgc2VlCj4gPiBwcm9ibGVtLi4uIChyYW5kb21seSBk
aXNhYmxpbmcgdGhlIGludGVycnVwdCBhbmQgdGhlbiBtYWtlIHRoZSBrZXJuZWwKPiA+IGRpZSkK
PiAKPiBJIGFtIHByZXR0eSBzdXJlIHRoaXMgQlVHKCkgY2FuIGJlIGhpdCB0aGVzZSBkYXlzIHdp
dGggYnVzeSBwb2xsaW5nIG9yCj4gc2V0dGluZyBncm9fZmx1c2hfdGltZW91dC4KPiAKPiBJIHdp
c2ggd2UgY291bGQgcmVtb3ZlIHRoZXNlIGJ1Z3MgYmVmb3JlIHNvbWVvbmUgY29weS1wYXN0ZSB0
aGVtLgo+IAo+IEFnYWluLCB0aGlzIGlzIG9ydGhvZ29uYWwsIEkgbWlnaHQgc2ltcGx5IHN0b3Ag
ZG9pbmcgcmV2aWV3cyBpZiB0aGlzCj4gaXMgbm90IHVzZWZ1bC4KClRoZXkgYXJlIHZlcnkgdXNl
ZnVsIGFuZCB0aGFua3MgYSBsb3QgZm9yIHRoZW0hIEknbSBhc2tpbmcgdGhlc2UgYXMgdG8KdW5k
ZXJzdGFuZCBob3cgdG8gcHJvY2VlZC4gSSBoYXZlIGluIHF1ZXVlIDIgb3RoZXIgc2VyaWVzIHRo
YXQgZGVwZW5kcwpvbiB0aGlzIGFuZCBJJ20ganVzdCBhc2tpbmcgaW5mbyBvbiBob3cgdG8gc3Bl
ZWR1cCB0aGUgcHJvZ3Jlc3Mgb24gdGhpcyEKClNvbyB0aGluayBJIGhhdmUgdG8gc2VuZCB2MyB3
aXRoIHRoZSBzdWdnZXN0ZWQgY2hhbmdlIGFuZCBCVUcoKSBkcm9wcGVkPwpIYXBweSB0byBkbyBl
dmVyeXRoaW5nIHRvIGZpeCBhbmQgaW1wcm92ZSB0aGlzIHNlcmllcyEKCi0tIAoJQW5zdWVsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFp
bGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
