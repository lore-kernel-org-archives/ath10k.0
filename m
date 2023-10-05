Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E52FFE71D4F
	for <ath10k@archiver.kernel.org>; Thu,  5 Oct 2023 16:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P/Q8xavRlccCOEzkagRbVdBIAY6aFn9+M31N3xrnet0=; b=ep/DFT2nQ23Cjr
	XBST1M1/6+4Di2CZxDKLtbvFtO55IAml0SdXHYbBTUu6HfusfUD/DlvpxzWzGW3y0f+0yLFAKEuPR
	RhRywlKgNildGvDufL2Zi+4MmVsi0kBl0sCb+QQspIvuADYyjuvnrU4z1uDe30JP/4ebsr3WC5pYc
	jN/XVFpMgDNxhug90rvQVtebZIeYxtpDu6LiJ+NHh23++zBUrU3IRLvOpRM/B6Fa/oD5P2ryogDHJ
	JmoCZhjrfIN7s2vHm+p7dCjtj51Zwx8y5kvAVJ8CjJN5UH6HJ+U+nvqtAF++JbQYdaBkLWIbw75hq
	V1aRPOxeAZgAZ7YLKPRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoR1o-0042J7-2g;
	Thu, 05 Oct 2023 16:16:44 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoR1k-0042H3-06
	for ath10k@lists.infradead.org;
	Thu, 05 Oct 2023 16:16:43 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-534694a9f26so12942a12.1
        for <ath10k@lists.infradead.org>; Thu, 05 Oct 2023 09:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696522598; x=1697127398; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LaaqTDoZqbafDQ3l5zFKWxmU6cOLxM0ZIJSzVNTzttI=;
        b=4ANKKnXmK6lE9GNCGgLLv2sOwqOsLoZkOXpF0TLY2MrW+MEF091jbjeWbTbulJPV9t
         ej5MfNeceQkE+ruBuE6ByaG7Vn86Ep0e3+sQTskggVZgQzzThUgnA4ukyD8YaEOqrEJD
         mwNzDwlGFHlnfWVRSuhYY/7F2gyRbcNnDUR+K5ktGPw/ZEJXH7HOtgvuPLMmSiOfm4P8
         DKCgaMHID576EJ36Bt41NnrG37lff2imQyOlr9/0LP7biC0fRPXj3SlHDqD1cX8F0qLZ
         zzfAalfsu6ASyEi9d52aCzvLBPYn2bkCvIIkbfOMzeSOrzpJPPfRpUc9APzbhXdtdgE3
         fVIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696522598; x=1697127398;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LaaqTDoZqbafDQ3l5zFKWxmU6cOLxM0ZIJSzVNTzttI=;
        b=b60wyAmAQW/S1uML2+OiXI6VYan7rP1jAX7eZDmJGBJjbjOJfXdzXUTv+8wZPnZo9l
         ReYHF3/ph5OJHQQApt+t0Ls0HZbWBlV51qla8/kfXWWTf5piu4i4x/VNv+uySVqnb8fm
         kc5iWnKdDao+2NWOAC4CbIqx4+Y93Hl22efrwM8i0zMX0LJxm8I33Hnb5tL03oe+p3RV
         Ob0G+NxFQqkgILT5HPrUYdJt0/KnCfb9Y0Ym8VwtH1l3BdWVZxPvY32dVZsdxjqGAQdx
         WYXwo6YhuLR6HIEuIrCo/Ojg4Eu2SpZbXM8C7hEW6tD5qknskpPOaEQl6xOptEnSU8An
         Jeeg==
X-Gm-Message-State: AOJu0YxKs27UTsBpGGa9voGoT7F6lJGVrJrbJkjMznlETONg4eVfl6Rp
	Wb7dO+AtE8OoeCwcZhb6SteHhI5G3QMy0nxADDbhlA==
X-Google-Smtp-Source: AGHT+IF0jOJDhaZhmEhxxLATvP2gGYnCETDcm8l2Y4huhZvHpOvz7u8otUILcV3a8DA5O+J6BhBCfMIuLNxeTSP/Dy0=
X-Received: by 2002:a50:8d5a:0:b0:538:2941:ad10 with SMTP id
 t26-20020a508d5a000000b005382941ad10mr73466edt.5.1696522598066; Thu, 05 Oct
 2023 09:16:38 -0700 (PDT)
MIME-Version: 1.0
References: <20231003145150.2498-1-ansuelsmth@gmail.com> <20231003145150.2498-4-ansuelsmth@gmail.com>
In-Reply-To: <20231003145150.2498-4-ansuelsmth@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 5 Oct 2023 18:16:26 +0200
Message-ID: <CANn89iLtYZJPOQE7OkAbEdmhT8qjzAJ+27poa__3c8Nf0M6u_w@mail.gmail.com>
Subject: Re: [net-next PATCH v2 4/4] netdev: use napi_schedule bool instead of napi_schedule_prep/__napi_schedule
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
X-CRM114-CacheID: sfid-20231005_091640_124853_8D71304B 
X-CRM114-Status: GOOD (  21.76  )
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
bHNtdGhAZ21haWwuY29tPiB3cm90ZToKPgo+IFJlcGxhY2UgaWYgY29uZGl0aW9uIG9mIG5hcGlf
c2NoZWR1bGVfcHJlcC9fX25hcGlfc2NoZWR1bGUgYW5kIHVzZSBib29sCj4gZnJvbSBuYXBpX3Nj
aGVkdWxlIGRpcmVjdGx5IHdoZXJlIHBvc3NpYmxlLgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0
aWFuIE1hcmFuZ2kgPGFuc3VlbHNtdGhAZ21haWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL25ldC9l
dGhlcm5ldC9hdGhlcm9zL2F0bHgvYXRsMS5jICAgICB8IDQgKy0tLQo+ICBkcml2ZXJzL25ldC9l
dGhlcm5ldC90b3NoaWJhL3RjMzU4MTUuYyAgICAgICB8IDQgKy0tLQo+ICBkcml2ZXJzL25ldC93
aXJlbGVzcy9pbnRlbC9pd2x3aWZpL3BjaWUvcnguYyB8IDQgKy0tLQo+ICAzIGZpbGVzIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL25ldC9ldGhlcm5ldC9hdGhlcm9zL2F0bHgvYXRsMS5jIGIvZHJpdmVycy9uZXQvZXRoZXJu
ZXQvYXRoZXJvcy9hdGx4L2F0bDEuYwo+IGluZGV4IDAyYWE2ZmQ4ZWJjMi4uYTkwMTRkNzkzMmRi
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L2F0aGVyb3MvYXRseC9hdGwxLmMK
PiArKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9hdGhlcm9zL2F0bHgvYXRsMS5jCj4gQEAgLTI0
NDYsNyArMjQ0Niw3IEBAIHN0YXRpYyBpbnQgYXRsMV9yaW5nc19jbGVhbihzdHJ1Y3QgbmFwaV9z
dHJ1Y3QgKm5hcGksIGludCBidWRnZXQpCj4KPiAgc3RhdGljIGlubGluZSBpbnQgYXRsMV9zY2hl
ZF9yaW5nc19jbGVhbihzdHJ1Y3QgYXRsMV9hZGFwdGVyKiBhZGFwdGVyKQo+ICB7Cj4gLSAgICAg
ICBpZiAoIW5hcGlfc2NoZWR1bGVfcHJlcCgmYWRhcHRlci0+bmFwaSkpCj4gKyAgICAgICBpZiAo
IW5hcGlfc2NoZWR1bGUoJmFkYXB0ZXItPm5hcGkpKQo+ICAgICAgICAgICAgICAgICAvKiBJdCBp
cyBwb3NzaWJsZSBpbiBjYXNlIGV2ZW4gdGhlIFJYL1RYIGludHMgYXJlIGRpc2FibGVkIHZpYSBJ
TVIKPiAgICAgICAgICAgICAgICAgICogcmVnaXN0ZXIgdGhlIElTUiBiaXRzIGFyZSBzZXQgYW55
d2F5IChidXQgZG8gbm90IHByb2R1Y2UgSVJRKS4KPiAgICAgICAgICAgICAgICAgICogVG8gaGFu
ZGxlIHN1Y2ggc2l0dWF0aW9uIHRoZSBuYXBpIGZ1bmN0aW9ucyB1c2VkIHRvIGNoZWNrIGlzCj4g
QEAgLTI0NTQsOCArMjQ1NCw2IEBAIHN0YXRpYyBpbmxpbmUgaW50IGF0bDFfc2NoZWRfcmluZ3Nf
Y2xlYW4oc3RydWN0IGF0bDFfYWRhcHRlciogYWRhcHRlcikKPiAgICAgICAgICAgICAgICAgICov
Cj4gICAgICAgICAgICAgICAgIHJldHVybiAwOwo+Cj4gLSAgICAgICBfX25hcGlfc2NoZWR1bGUo
JmFkYXB0ZXItPm5hcGkpOwo+IC0KPiAgICAgICAgIC8qCj4gICAgICAgICAgKiBEaXNhYmxlIFJY
L1RYIGludHMgdmlhIElNUiByZWdpc3RlciBpZiBpdCBpcwo+ICAgICAgICAgICogYWxsb3dlZC4g
TkFQSSBoYW5kbGVyIG11c3QgcmVlbmFibGUgdGhlbSBpbiBzYW1lCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbmV0L2V0aGVybmV0L3Rvc2hpYmEvdGMzNTgxNS5jIGIvZHJpdmVycy9uZXQvZXRoZXJu
ZXQvdG9zaGliYS90YzM1ODE1LmMKPiBpbmRleCAxNGNmNmVjZjZkMGQuLmE4YjhhMGUxM2Y5YSAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC90b3NoaWJhL3RjMzU4MTUuYwo+ICsr
KyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3Rvc2hpYmEvdGMzNTgxNS5jCj4gQEAgLTE0MzYsOSAr
MTQzNiw3IEBAIHN0YXRpYyBpcnFyZXR1cm5fdCB0YzM1ODE1X2ludGVycnVwdChpbnQgaXJxLCB2
b2lkICpkZXZfaWQpCj4gICAgICAgICBpZiAoIShkbWFjdGwgJiBETUFfSW50TWFzaykpIHsKPiAg
ICAgICAgICAgICAgICAgLyogZGlzYWJsZSBpbnRlcnJ1cHRzICovCj4gICAgICAgICAgICAgICAg
IHRjX3dyaXRlbChkbWFjdGwgfCBETUFfSW50TWFzaywgJnRyLT5ETUFfQ3RsKTsKPiAtICAgICAg
ICAgICAgICAgaWYgKG5hcGlfc2NoZWR1bGVfcHJlcCgmbHAtPm5hcGkpKQo+IC0gICAgICAgICAg
ICAgICAgICAgICAgIF9fbmFwaV9zY2hlZHVsZSgmbHAtPm5hcGkpOwo+IC0gICAgICAgICAgICAg
ICBlbHNlIHsKPiArICAgICAgICAgICAgICAgaWYgKCFuYXBpX3NjaGVkdWxlKCZscC0+bmFwaSkp
IHsKPiAgICAgICAgICAgICAgICAgICAgICAgICBwcmludGsoS0VSTl9FUlIgIiVzOiBpbnRlcnJ1
cHQgdGFrZW4gaW4gcG9sbFxuIiwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZGV2
LT5uYW1lKTsKPiAgICAgICAgICAgICAgICAgICAgICAgICBCVUcoKTsKCkhtbW0uLi4gY291bGQg
eW91IGFsc28gcmVtb3ZlIHRoaXMgQlVHKCkgPyBJIHRoaW5rIHRoaXMgY29kZSBwYXRoIGNhbiBi
ZSB0YWtlbgppZiBzb21lIGFwcGxpY2F0aW9ucyBhcmUgdXNpbmcgYnVzeSBwb2xsaW5nLgoKT3Ig
c2ltcGx5IHJld3JpdGUgdGhpcyB3aXRoIHRoZSB0cmFkaXRpb25hbAoKaWYgKG5hcGlfc2NoZWR1
bGVfcHJlcCgmbHAtPm5hcGkpKSB7CiAgIC8qIGRpc2FibGUgaW50ZXJydXB0cyAqLwogICB0Y193
cml0ZWwoZG1hY3RsIHwgRE1BX0ludE1hc2ssICZ0ci0+RE1BX0N0bCk7CiAgICBfX25hcGlfc2No
ZWR1bGUoJmxwLT5uYXBpKTsKfQoKCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC93aXJlbGVz
cy9pbnRlbC9pd2x3aWZpL3BjaWUvcnguYyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2ludGVsL2l3
bHdpZmkvcGNpZS9yeC5jCj4gaW5kZXggMjNiNWEwYWRjYmQ2Li4xNDZiYzdiZDE0ZmIgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvaW50ZWwvaXdsd2lmaS9wY2llL3J4LmMKPiAr
KysgYi9kcml2ZXJzL25ldC93aXJlbGVzcy9pbnRlbC9pd2x3aWZpL3BjaWUvcnguYwo+IEBAIC0x
NjYwLDkgKzE2NjAsNyBAQCBpcnFyZXR1cm5fdCBpd2xfcGNpZV9pcnFfcnhfbXNpeF9oYW5kbGVy
KGludCBpcnEsIHZvaWQgKmRldl9pZCkKPiAgICAgICAgIElXTF9ERUJVR19JU1IodHJhbnMsICJb
JWRdIEdvdCBpbnRlcnJ1cHRcbiIsIGVudHJ5LT5lbnRyeSk7Cj4KPiAgICAgICAgIGxvY2FsX2Jo
X2Rpc2FibGUoKTsKPiAtICAgICAgIGlmIChuYXBpX3NjaGVkdWxlX3ByZXAoJnJ4cS0+bmFwaSkp
Cj4gLSAgICAgICAgICAgICAgIF9fbmFwaV9zY2hlZHVsZSgmcnhxLT5uYXBpKTsKPiAtICAgICAg
IGVsc2UKPiArICAgICAgIGlmICghbmFwaV9zY2hlZHVsZSgmcnhxLT5uYXBpKSkKPiAgICAgICAg
ICAgICAgICAgaXdsX3BjaWVfY2xlYXJfaXJxKHRyYW5zLCBlbnRyeS0+ZW50cnkpOwoKU2FtZSBy
ZW1hcmsgaGVyZSBhYm91dCB0d2lzdGVkIGxvZ2ljLgoKPiAgICAgICAgIGxvY2FsX2JoX2VuYWJs
ZSgpOwo+Cj4gLS0KPiAyLjQwLjEKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
