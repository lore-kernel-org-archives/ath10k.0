Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0918E95A96
	for <ath10k@archiver.kernel.org>; Mon,  9 Oct 2023 08:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0ZwzXQ997djNoyukdf4cLWDSQ6w5DP4KPPGPzat/SuY=; b=mFkxVRKdWXP/Xw
	k6h82Eca2Sgsh+rAY0yVobXEzuHTZyjpfl+GEYemh/AsEzp3nYn7AXwpGukIkcU2VEdYiWOn1649s
	GMiUe77UhmcPXxhZKKRuFv//8hk4nElaVnvIjltl6yP6ptxcgSwe2BL/ShuKPWcl2KPgZjJkHPi78
	L0Lgcl0iYlZVc5yAOQNf9o1dB0qNmMZaxvl/EziDBD43hzNoZgutj9KectqNV9J8++T/uCzsAcm9l
	4bbKGgOPzG2xZT1MZnRsqNX+eTy4ZSNxPCvl+4Xn+C0T1wTaRBUW5UWKIdncj7ft+9DHFkiLrT2qs
	4W+ZGJNTtiLe3g/6QJUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qplcE-009yNe-1t;
	Mon, 09 Oct 2023 08:27:50 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qplcA-009yMf-2f
	for ath10k@lists.infradead.org;
	Mon, 09 Oct 2023 08:27:48 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-534694a9f26so9679a12.1
        for <ath10k@lists.infradead.org>; Mon, 09 Oct 2023 01:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696840064; x=1697444864; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U/6BMjrzXld+2G2niRt8GwZnrjwExfOE5RsZF3IWDsg=;
        b=rUVCPFmy1MqZl7fcST7lRus90tfkq2lnQxP8LzFSNpEwvly8g2IW/S3SyJBPtWMsDF
         KGqTElwPRkF1GnW09MLOgD3dyRdnWwKkSdogbF1qHoUZzyryK+AAjYYyr4L3deCWwqVa
         FkLluaIr7dBfiuO0MRM7bnN0QOhCB2WbXYKcJ7A0kglLo4Rv+UNDc2zbPKlx/1mBeGGY
         kHk5N6Fp3RhAFDUZdmcAaVehWLbInunwaSkADvKMXFfg4aluiSAN0AftrP2knHwyr1vU
         2BPhWWCBQE9/nEyYVo42rhG+jyBhy3wqD76vKqaII2CNcSwFOukqFVkHPuN/jiLt8V1c
         Ny7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696840064; x=1697444864;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U/6BMjrzXld+2G2niRt8GwZnrjwExfOE5RsZF3IWDsg=;
        b=Dyu2Y/koi4pD3R1ESkDb1mGsAdmIL4JosW/siG5eSBs4QDi8ggzbLOu5wkcteLej6q
         kCgMtysCV8cCZVPcFAWYIvHA6JQFChb3YkWWGjULSUk8GJxNPwtJ92JbOUe4/HfY3ukn
         byq0OgsBDTgvjBsAsllX8WNHvCNzlYzqNtMoYdmIve27Njh9SBDe5u2LAvtQPwwFgQav
         mGDDlkhRUQZPHnoA4a1pHpEod+YLMyA2sForI0lCQ7fqr9FsrJR+6BiNMLNCDa2FzOMO
         JUUzXq1QIcjGGYUa3DqXZFLs561In+GK4HaCUcCude5sQ+EbY2rPzyF8l1sQZWfKnMC5
         dGPw==
X-Gm-Message-State: AOJu0YzO5whkGrSq50X7xqOAb1ZNdEQVj+ytvJYyP+LHxcsKAt2KIToO
	lgWT5o+MvaP2LfVPwyQ125SWvza91O7kJGtYMmY+CQ==
X-Google-Smtp-Source: AGHT+IHwFKC+Y1e+xZpwgUIz2ef+3S7gZvKInf35YDgwedW3l6WDYZ0JQtR1RAcQrjw2Yv9CI2XyHOq3oVUBlcAavLI=
X-Received: by 2002:a50:9fa4:0:b0:538:5f9e:f0fc with SMTP id
 c33-20020a509fa4000000b005385f9ef0fcmr350450edf.0.1696840063815; Mon, 09 Oct
 2023 01:27:43 -0700 (PDT)
MIME-Version: 1.0
References: <20231003145150.2498-1-ansuelsmth@gmail.com> <20231003145150.2498-4-ansuelsmth@gmail.com>
 <CANn89iLtYZJPOQE7OkAbEdmhT8qjzAJ+27poa__3c8Nf0M6u_w@mail.gmail.com>
 <652056c5.5d0a0220.2b60d.c5dc@mx.google.com> <CANn89i+Cie+oE_hTWkyJWutTG9CnPy+dbW+-A97Q+E9Rq-f9rQ@mail.gmail.com>
 <6522f495.df0a0220.326ed.de6c@mx.google.com>
In-Reply-To: <6522f495.df0a0220.326ed.de6c@mx.google.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 9 Oct 2023 10:27:32 +0200
Message-ID: <CANn89iLLsM8=fqoa_7O8iYyCzT2ebNs_jpY+e-RW+xCc7UnSDg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20231009_012746_886657_A2B2F35E 
X-CRM114-Status: GOOD (  38.80  )
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

T24gU3VuLCBPY3QgOCwgMjAyMyBhdCA4OjI34oCvUE0gQ2hyaXN0aWFuIE1hcmFuZ2kgPGFuc3Vl
bHNtdGhAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIFN1biwgT2N0IDA4LCAyMDIzIGF0IDA5OjA4
OjQxQU0gKzAyMDAsIEVyaWMgRHVtYXpldCB3cm90ZToKPiA+IE9uIEZyaSwgT2N0IDYsIDIwMjMg
YXQgODo0OeKAr1BNIENocmlzdGlhbiBNYXJhbmdpIDxhbnN1ZWxzbXRoQGdtYWlsLmNvbT4gd3Jv
dGU6Cj4gPiA+Cj4gPiA+IE9uIFRodSwgT2N0IDA1LCAyMDIzIGF0IDA2OjE2OjI2UE0gKzAyMDAs
IEVyaWMgRHVtYXpldCB3cm90ZToKPiA+ID4gPiBPbiBUdWUsIE9jdCAzLCAyMDIzIGF0IDg6Mzbi
gK9QTSBDaHJpc3RpYW4gTWFyYW5naSA8YW5zdWVsc210aEBnbWFpbC5jb20+IHdyb3RlOgo+ID4g
PiA+ID4KPiA+ID4gPiA+IFJlcGxhY2UgaWYgY29uZGl0aW9uIG9mIG5hcGlfc2NoZWR1bGVfcHJl
cC9fX25hcGlfc2NoZWR1bGUgYW5kIHVzZSBib29sCj4gPiA+ID4gPiBmcm9tIG5hcGlfc2NoZWR1
bGUgZGlyZWN0bHkgd2hlcmUgcG9zc2libGUuCj4gPiA+ID4gPgo+ID4gPiA+ID4gU2lnbmVkLW9m
Zi1ieTogQ2hyaXN0aWFuIE1hcmFuZ2kgPGFuc3VlbHNtdGhAZ21haWwuY29tPgo+ID4gPiA+ID4g
LS0tCj4gPiA+ID4gPiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvYXRoZXJvcy9hdGx4L2F0bDEuYyAg
ICAgfCA0ICstLS0KPiA+ID4gPiA+ICBkcml2ZXJzL25ldC9ldGhlcm5ldC90b3NoaWJhL3RjMzU4
MTUuYyAgICAgICB8IDQgKy0tLQo+ID4gPiA+ID4gIGRyaXZlcnMvbmV0L3dpcmVsZXNzL2ludGVs
L2l3bHdpZmkvcGNpZS9yeC5jIHwgNCArLS0tCj4gPiA+ID4gPiAgMyBmaWxlcyBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCj4gPiA+ID4gPgo+ID4gPiA+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L2F0aGVyb3MvYXRseC9hdGwxLmMgYi9kcml2ZXJz
L25ldC9ldGhlcm5ldC9hdGhlcm9zL2F0bHgvYXRsMS5jCj4gPiA+ID4gPiBpbmRleCAwMmFhNmZk
OGViYzIuLmE5MDE0ZDc5MzJkYiAxMDA2NDQKPiA+ID4gPiA+IC0tLSBhL2RyaXZlcnMvbmV0L2V0
aGVybmV0L2F0aGVyb3MvYXRseC9hdGwxLmMKPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMvbmV0L2V0
aGVybmV0L2F0aGVyb3MvYXRseC9hdGwxLmMKPiA+ID4gPiA+IEBAIC0yNDQ2LDcgKzI0NDYsNyBA
QCBzdGF0aWMgaW50IGF0bDFfcmluZ3NfY2xlYW4oc3RydWN0IG5hcGlfc3RydWN0ICpuYXBpLCBp
bnQgYnVkZ2V0KQo+ID4gPiA+ID4KPiA+ID4gPiA+ICBzdGF0aWMgaW5saW5lIGludCBhdGwxX3Nj
aGVkX3JpbmdzX2NsZWFuKHN0cnVjdCBhdGwxX2FkYXB0ZXIqIGFkYXB0ZXIpCj4gPiA+ID4gPiAg
ewo+ID4gPiA+ID4gLSAgICAgICBpZiAoIW5hcGlfc2NoZWR1bGVfcHJlcCgmYWRhcHRlci0+bmFw
aSkpCj4gPiA+ID4gPiArICAgICAgIGlmICghbmFwaV9zY2hlZHVsZSgmYWRhcHRlci0+bmFwaSkp
Cj4gPiA+ID4gPiAgICAgICAgICAgICAgICAgLyogSXQgaXMgcG9zc2libGUgaW4gY2FzZSBldmVu
IHRoZSBSWC9UWCBpbnRzIGFyZSBkaXNhYmxlZCB2aWEgSU1SCj4gPiA+ID4gPiAgICAgICAgICAg
ICAgICAgICogcmVnaXN0ZXIgdGhlIElTUiBiaXRzIGFyZSBzZXQgYW55d2F5IChidXQgZG8gbm90
IHByb2R1Y2UgSVJRKS4KPiA+ID4gPiA+ICAgICAgICAgICAgICAgICAgKiBUbyBoYW5kbGUgc3Vj
aCBzaXR1YXRpb24gdGhlIG5hcGkgZnVuY3Rpb25zIHVzZWQgdG8gY2hlY2sgaXMKPiA+ID4gPiA+
IEBAIC0yNDU0LDggKzI0NTQsNiBAQCBzdGF0aWMgaW5saW5lIGludCBhdGwxX3NjaGVkX3Jpbmdz
X2NsZWFuKHN0cnVjdCBhdGwxX2FkYXB0ZXIqIGFkYXB0ZXIpCj4gPiA+ID4gPiAgICAgICAgICAg
ICAgICAgICovCj4gPiA+ID4gPiAgICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4gPiA+ID4gPgo+
ID4gPiA+ID4gLSAgICAgICBfX25hcGlfc2NoZWR1bGUoJmFkYXB0ZXItPm5hcGkpOwo+ID4gPiA+
ID4gLQo+ID4gPiA+ID4gICAgICAgICAvKgo+ID4gPiA+ID4gICAgICAgICAgKiBEaXNhYmxlIFJY
L1RYIGludHMgdmlhIElNUiByZWdpc3RlciBpZiBpdCBpcwo+ID4gPiA+ID4gICAgICAgICAgKiBh
bGxvd2VkLiBOQVBJIGhhbmRsZXIgbXVzdCByZWVuYWJsZSB0aGVtIGluIHNhbWUKPiA+ID4gPiA+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC90b3NoaWJhL3RjMzU4MTUuYyBiL2Ry
aXZlcnMvbmV0L2V0aGVybmV0L3Rvc2hpYmEvdGMzNTgxNS5jCj4gPiA+ID4gPiBpbmRleCAxNGNm
NmVjZjZkMGQuLmE4YjhhMGUxM2Y5YSAxMDA2NDQKPiA+ID4gPiA+IC0tLSBhL2RyaXZlcnMvbmV0
L2V0aGVybmV0L3Rvc2hpYmEvdGMzNTgxNS5jCj4gPiA+ID4gPiArKysgYi9kcml2ZXJzL25ldC9l
dGhlcm5ldC90b3NoaWJhL3RjMzU4MTUuYwo+ID4gPiA+ID4gQEAgLTE0MzYsOSArMTQzNiw3IEBA
IHN0YXRpYyBpcnFyZXR1cm5fdCB0YzM1ODE1X2ludGVycnVwdChpbnQgaXJxLCB2b2lkICpkZXZf
aWQpCj4gPiA+ID4gPiAgICAgICAgIGlmICghKGRtYWN0bCAmIERNQV9JbnRNYXNrKSkgewo+ID4g
PiA+ID4gICAgICAgICAgICAgICAgIC8qIGRpc2FibGUgaW50ZXJydXB0cyAqLwo+ID4gPiA+ID4g
ICAgICAgICAgICAgICAgIHRjX3dyaXRlbChkbWFjdGwgfCBETUFfSW50TWFzaywgJnRyLT5ETUFf
Q3RsKTsKPiA+ID4gPiA+IC0gICAgICAgICAgICAgICBpZiAobmFwaV9zY2hlZHVsZV9wcmVwKCZs
cC0+bmFwaSkpCj4gPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICBfX25hcGlfc2NoZWR1
bGUoJmxwLT5uYXBpKTsKPiA+ID4gPiA+IC0gICAgICAgICAgICAgICBlbHNlIHsKPiA+ID4gPiA+
ICsgICAgICAgICAgICAgICBpZiAoIW5hcGlfc2NoZWR1bGUoJmxwLT5uYXBpKSkgewo+ID4gPiA+
ID4gICAgICAgICAgICAgICAgICAgICAgICAgcHJpbnRrKEtFUk5fRVJSICIlczogaW50ZXJydXB0
IHRha2VuIGluIHBvbGxcbiIsCj4gPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgZGV2LT5uYW1lKTsKPiA+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIEJVRygpOwo+
ID4gPiA+Cj4gPiA+ID4gSG1tbS4uLiBjb3VsZCB5b3UgYWxzbyByZW1vdmUgdGhpcyBCVUcoKSA/
IEkgdGhpbmsgdGhpcyBjb2RlIHBhdGggY2FuIGJlIHRha2VuCj4gPiA+ID4gaWYgc29tZSBhcHBs
aWNhdGlvbnMgYXJlIHVzaW5nIGJ1c3kgcG9sbGluZy4KPiA+ID4gPgo+ID4gPiA+IE9yIHNpbXBs
eSByZXdyaXRlIHRoaXMgd2l0aCB0aGUgdHJhZGl0aW9uYWwKPiA+ID4gPgo+ID4gPiA+IGlmIChu
YXBpX3NjaGVkdWxlX3ByZXAoJmxwLT5uYXBpKSkgewo+ID4gPiA+ICAgIC8qIGRpc2FibGUgaW50
ZXJydXB0cyAqLwo+ID4gPiA+ICAgIHRjX3dyaXRlbChkbWFjdGwgfCBETUFfSW50TWFzaywgJnRy
LT5ETUFfQ3RsKTsKPiA+ID4gPiAgICAgX19uYXBpX3NjaGVkdWxlKCZscC0+bmFwaSk7Cj4gPiA+
ID4gfQo+ID4gPiA+Cj4gPiA+ID4KPiA+ID4KPiA+ID4gTWhoaCBpcyBpdCBzYWZlIHRvIGRvIHNv
PyBJIG1lYW4gaXQgc2VlbXMgdmVyeSB3cm9uZyB0byBwcmludCBhIHdhcm5pbmcKPiA+ID4gYW5k
IEJVRygpIGluc3RlYWQgb2YgZGlzYWJsaW5nIHRoZSBpbnRlcnJ1cHQgb25seSBpZiBuYXBpIGNh
biBiZQo+ID4gPiBzY2hlZHVsZWQuLi4gTWF5YmUgaXMgdmVyeSBvbGQgY29kZT8gVGhlIG1vcmUg
SSBzZWUgdGhpcyB0aGUgbW9yZSBJIHNlZQo+ID4gPiBwcm9ibGVtLi4uIChyYW5kb21seSBkaXNh
YmxpbmcgdGhlIGludGVycnVwdCBhbmQgdGhlbiBtYWtlIHRoZSBrZXJuZWwKPiA+ID4gZGllKQo+
ID4KPiA+IEkgYW0gcHJldHR5IHN1cmUgdGhpcyBCVUcoKSBjYW4gYmUgaGl0IHRoZXNlIGRheXMg
d2l0aCBidXN5IHBvbGxpbmcgb3IKPiA+IHNldHRpbmcgZ3JvX2ZsdXNoX3RpbWVvdXQuCj4gPgo+
ID4gSSB3aXNoIHdlIGNvdWxkIHJlbW92ZSB0aGVzZSBidWdzIGJlZm9yZSBzb21lb25lIGNvcHkt
cGFzdGUgdGhlbS4KPiA+Cj4gPiBBZ2FpbiwgdGhpcyBpcyBvcnRob2dvbmFsLCBJIG1pZ2h0IHNp
bXBseSBzdG9wIGRvaW5nIHJldmlld3MgaWYgdGhpcwo+ID4gaXMgbm90IHVzZWZ1bC4KPgo+IFRo
ZXkgYXJlIHZlcnkgdXNlZnVsIGFuZCB0aGFua3MgYSBsb3QgZm9yIHRoZW0hIEknbSBhc2tpbmcg
dGhlc2UgYXMgdG8KPiB1bmRlcnN0YW5kIGhvdyB0byBwcm9jZWVkLiBJIGhhdmUgaW4gcXVldWUg
MiBvdGhlciBzZXJpZXMgdGhhdCBkZXBlbmRzCj4gb24gdGhpcyBhbmQgSSdtIGp1c3QgYXNraW5n
IGluZm8gb24gaG93IHRvIHNwZWVkdXAgdGhlIHByb2dyZXNzIG9uIHRoaXMhCj4KPiBTb28gdGhp
bmsgSSBoYXZlIHRvIHNlbmQgdjMgd2l0aCB0aGUgc3VnZ2VzdGVkIGNoYW5nZSBhbmQgQlVHKCkg
ZHJvcHBlZD8KPiBIYXBweSB0byBkbyBldmVyeXRoaW5nIHRvIGZpeCBhbmQgaW1wcm92ZSB0aGlz
IHNlcmllcyEKCkkgdGhpbmsgdGhhdCB5b3VyIHBhdGNoIHNlcmllcyBpcyBhbGwgYWJvdXQgZG9p
bmcgY2xlYW51cHMsCnNvIEkgc3VnZ2VzdGVkIGFkZGluZyBhbm90aGVyIGNsZWFudXAvZml4LAph
bmQgdGhpcyBjYW4gYmUgZG9uZSBpbmRlcGVuZGVudGx5LgoKSSBkb3VidCB0aGlzIG1hdHRlcnMs
IHRoaXMgY29kZSBoYXMgcHJvYmFibHkgbm90IGJlZW4gdXNlZCBmb3IgcXVpdGUgYQpsb25nIHRp
bWUuLi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0
aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
