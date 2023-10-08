Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB06CE95A82
	for <ath10k@archiver.kernel.org>; Sun,  8 Oct 2023 07:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+SieJvXAGMLqIdx49rZXSyMEBF9YoN+rjkIiFGY0aEg=; b=Q+kK3KKpjQi2n9
	FFMVpDcCnRpccxDKabPTCEA3Zv93MlPuFsc0QJzCWHRma+E3Q9LT1peUv7WXiSNfsw1EDomHiJsTA
	Z3ya6JnJ+NnacA9LnWAapKkV8Xja3OWUjt2ju12I4cMTsl/www7UqlPaP/wEpht0RuSWL7OxLetdn
	Elty//FlHUOipIz+VQRhB7RPF2xKpS5FYex6pibJEdstAbTa3VD0DmZspT5+c6VdN1R+KKKkA4OMh
	bFc3w2A5V3ObZMBfbnwSX/46UNfFsz/+4G44PYSAQ7V2wJuCfMmivQ7JfNZFFkUuYjOmff7gBX49T
	PpudHq86osLl/Q1lCWeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpNuP-008SDK-1w;
	Sun, 08 Oct 2023 07:09:01 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpNuM-008SBO-05
	for ath10k@lists.infradead.org;
	Sun, 08 Oct 2023 07:08:59 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-51e24210395so8140a12.0
        for <ath10k@lists.infradead.org>; Sun, 08 Oct 2023 00:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696748935; x=1697353735; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6boweBsbEPYLh1haUGvUFhb+7tfvWfkGzP1aLPKTUnI=;
        b=q/lNxCcLZ3IShEfIYG2n5SpZxpfeNwWrEdU7k9KAclv721TpcaafkF9jHFXU6Eiq7v
         vVz/hW+dFh3vxEd/XOCOY1xzw1NidI5bMf5GqzsbW7FLyOeTKCcW2sMJHX86A/nhllgl
         mZyUdV20hrlrfZU3DTYrY8Bqs5YhVpOp4Buqj1YBhOyncTrQE9k6MxKSVSQi+kGflV0/
         9WiWa+bhl5khwB/VmdJY7PhUu8dIFMV3h3pXdZXm5bRtd/u+NqD75+7wA7O4DhShKsLS
         o6lv9SIIaIDu5SjI0oawBCkoOYcc8p4dMhQqCJwCU9IgMmHCRg5F0vTKLpx+djo4fS33
         aN3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696748935; x=1697353735;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6boweBsbEPYLh1haUGvUFhb+7tfvWfkGzP1aLPKTUnI=;
        b=L8p3b9oTMK6Setzh6gRvssAmougqaQWYdD6g2nToJtRHJPH99zIAJAIFhiUwOQvD2+
         vVQHJB9kneMAMSrImrj7P92vyxgzdraZKO+bsYhOFJjgHhwOEsUHVTBvdKY2dzIRaoEd
         /dXG5rX3vmSh3U1Tzir7vqUl7jZau4rWQRSvi7oS8lHjSsFGAhhUikHy6JpADBmOlRJd
         C3ZdzFeddsMyKehMUe8ug+NVZO20kEhhwejajywzbvqGxBaK+9T2iBQ/COBJ3UkfFl/k
         +vyzoLviijBeMboxyr860WvvxUuUpsvrmI8j6dJkmYJb7BmOjWx22cCAVI+UFTjTdDDn
         WCcw==
X-Gm-Message-State: AOJu0YxUbwNbUiu54xhelyDLNr2fcIys/9m6G8vMFSAnor6bc5iyIg85
	g6hCSwh3VFA17m6r4gcvSaoaTbml8EbCmpZgm7Ew2A==
X-Google-Smtp-Source: AGHT+IEVhxr/hi+K678k9mZTv6OusdxrCYSsJHysJnZbWTvXJuhiZ+72RbS/nL58DWxeXDrsThbghNBmT+06iJCcOf8=
X-Received: by 2002:a50:9f6c:0:b0:52e:f99a:b5f8 with SMTP id
 b99-20020a509f6c000000b0052ef99ab5f8mr308559edf.7.1696748935193; Sun, 08 Oct
 2023 00:08:55 -0700 (PDT)
MIME-Version: 1.0
References: <20231003145150.2498-1-ansuelsmth@gmail.com> <20231003145150.2498-4-ansuelsmth@gmail.com>
 <CANn89iLtYZJPOQE7OkAbEdmhT8qjzAJ+27poa__3c8Nf0M6u_w@mail.gmail.com> <652056c5.5d0a0220.2b60d.c5dc@mx.google.com>
In-Reply-To: <652056c5.5d0a0220.2b60d.c5dc@mx.google.com>
From: Eric Dumazet <edumazet@google.com>
Date: Sun, 8 Oct 2023 09:08:41 +0200
Message-ID: <CANn89i+Cie+oE_hTWkyJWutTG9CnPy+dbW+-A97Q+E9Rq-f9rQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20231008_000858_071792_4F1BFFB2 
X-CRM114-Status: GOOD (  29.30  )
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

T24gRnJpLCBPY3QgNiwgMjAyMyBhdCA4OjQ54oCvUE0gQ2hyaXN0aWFuIE1hcmFuZ2kgPGFuc3Vl
bHNtdGhAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIFRodSwgT2N0IDA1LCAyMDIzIGF0IDA2OjE2
OjI2UE0gKzAyMDAsIEVyaWMgRHVtYXpldCB3cm90ZToKPiA+IE9uIFR1ZSwgT2N0IDMsIDIwMjMg
YXQgODozNuKAr1BNIENocmlzdGlhbiBNYXJhbmdpIDxhbnN1ZWxzbXRoQGdtYWlsLmNvbT4gd3Jv
dGU6Cj4gPiA+Cj4gPiA+IFJlcGxhY2UgaWYgY29uZGl0aW9uIG9mIG5hcGlfc2NoZWR1bGVfcHJl
cC9fX25hcGlfc2NoZWR1bGUgYW5kIHVzZSBib29sCj4gPiA+IGZyb20gbmFwaV9zY2hlZHVsZSBk
aXJlY3RseSB3aGVyZSBwb3NzaWJsZS4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0
aWFuIE1hcmFuZ2kgPGFuc3VlbHNtdGhAZ21haWwuY29tPgo+ID4gPiAtLS0KPiA+ID4gIGRyaXZl
cnMvbmV0L2V0aGVybmV0L2F0aGVyb3MvYXRseC9hdGwxLmMgICAgIHwgNCArLS0tCj4gPiA+ICBk
cml2ZXJzL25ldC9ldGhlcm5ldC90b3NoaWJhL3RjMzU4MTUuYyAgICAgICB8IDQgKy0tLQo+ID4g
PiAgZHJpdmVycy9uZXQvd2lyZWxlc3MvaW50ZWwvaXdsd2lmaS9wY2llL3J4LmMgfCA0ICstLS0K
PiA+ID4gIDMgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQo+
ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvYXRoZXJvcy9hdGx4
L2F0bDEuYyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L2F0aGVyb3MvYXRseC9hdGwxLmMKPiA+ID4g
aW5kZXggMDJhYTZmZDhlYmMyLi5hOTAxNGQ3OTMyZGIgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZl
cnMvbmV0L2V0aGVybmV0L2F0aGVyb3MvYXRseC9hdGwxLmMKPiA+ID4gKysrIGIvZHJpdmVycy9u
ZXQvZXRoZXJuZXQvYXRoZXJvcy9hdGx4L2F0bDEuYwo+ID4gPiBAQCAtMjQ0Niw3ICsyNDQ2LDcg
QEAgc3RhdGljIGludCBhdGwxX3JpbmdzX2NsZWFuKHN0cnVjdCBuYXBpX3N0cnVjdCAqbmFwaSwg
aW50IGJ1ZGdldCkKPiA+ID4KPiA+ID4gIHN0YXRpYyBpbmxpbmUgaW50IGF0bDFfc2NoZWRfcmlu
Z3NfY2xlYW4oc3RydWN0IGF0bDFfYWRhcHRlciogYWRhcHRlcikKPiA+ID4gIHsKPiA+ID4gLSAg
ICAgICBpZiAoIW5hcGlfc2NoZWR1bGVfcHJlcCgmYWRhcHRlci0+bmFwaSkpCj4gPiA+ICsgICAg
ICAgaWYgKCFuYXBpX3NjaGVkdWxlKCZhZGFwdGVyLT5uYXBpKSkKPiA+ID4gICAgICAgICAgICAg
ICAgIC8qIEl0IGlzIHBvc3NpYmxlIGluIGNhc2UgZXZlbiB0aGUgUlgvVFggaW50cyBhcmUgZGlz
YWJsZWQgdmlhIElNUgo+ID4gPiAgICAgICAgICAgICAgICAgICogcmVnaXN0ZXIgdGhlIElTUiBi
aXRzIGFyZSBzZXQgYW55d2F5IChidXQgZG8gbm90IHByb2R1Y2UgSVJRKS4KPiA+ID4gICAgICAg
ICAgICAgICAgICAqIFRvIGhhbmRsZSBzdWNoIHNpdHVhdGlvbiB0aGUgbmFwaSBmdW5jdGlvbnMg
dXNlZCB0byBjaGVjayBpcwo+ID4gPiBAQCAtMjQ1NCw4ICsyNDU0LDYgQEAgc3RhdGljIGlubGlu
ZSBpbnQgYXRsMV9zY2hlZF9yaW5nc19jbGVhbihzdHJ1Y3QgYXRsMV9hZGFwdGVyKiBhZGFwdGVy
KQo+ID4gPiAgICAgICAgICAgICAgICAgICovCj4gPiA+ICAgICAgICAgICAgICAgICByZXR1cm4g
MDsKPiA+ID4KPiA+ID4gLSAgICAgICBfX25hcGlfc2NoZWR1bGUoJmFkYXB0ZXItPm5hcGkpOwo+
ID4gPiAtCj4gPiA+ICAgICAgICAgLyoKPiA+ID4gICAgICAgICAgKiBEaXNhYmxlIFJYL1RYIGlu
dHMgdmlhIElNUiByZWdpc3RlciBpZiBpdCBpcwo+ID4gPiAgICAgICAgICAqIGFsbG93ZWQuIE5B
UEkgaGFuZGxlciBtdXN0IHJlZW5hYmxlIHRoZW0gaW4gc2FtZQo+ID4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9uZXQvZXRoZXJuZXQvdG9zaGliYS90YzM1ODE1LmMgYi9kcml2ZXJzL25ldC9ldGhl
cm5ldC90b3NoaWJhL3RjMzU4MTUuYwo+ID4gPiBpbmRleCAxNGNmNmVjZjZkMGQuLmE4YjhhMGUx
M2Y5YSAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvdG9zaGliYS90YzM1
ODE1LmMKPiA+ID4gKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvdG9zaGliYS90YzM1ODE1LmMK
PiA+ID4gQEAgLTE0MzYsOSArMTQzNiw3IEBAIHN0YXRpYyBpcnFyZXR1cm5fdCB0YzM1ODE1X2lu
dGVycnVwdChpbnQgaXJxLCB2b2lkICpkZXZfaWQpCj4gPiA+ICAgICAgICAgaWYgKCEoZG1hY3Rs
ICYgRE1BX0ludE1hc2spKSB7Cj4gPiA+ICAgICAgICAgICAgICAgICAvKiBkaXNhYmxlIGludGVy
cnVwdHMgKi8KPiA+ID4gICAgICAgICAgICAgICAgIHRjX3dyaXRlbChkbWFjdGwgfCBETUFfSW50
TWFzaywgJnRyLT5ETUFfQ3RsKTsKPiA+ID4gLSAgICAgICAgICAgICAgIGlmIChuYXBpX3NjaGVk
dWxlX3ByZXAoJmxwLT5uYXBpKSkKPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgX19uYXBp
X3NjaGVkdWxlKCZscC0+bmFwaSk7Cj4gPiA+IC0gICAgICAgICAgICAgICBlbHNlIHsKPiA+ID4g
KyAgICAgICAgICAgICAgIGlmICghbmFwaV9zY2hlZHVsZSgmbHAtPm5hcGkpKSB7Cj4gPiA+ICAg
ICAgICAgICAgICAgICAgICAgICAgIHByaW50ayhLRVJOX0VSUiAiJXM6IGludGVycnVwdCB0YWtl
biBpbiBwb2xsXG4iLAo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZGV2LT5u
YW1lKTsKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgQlVHKCk7Cj4gPgo+ID4gSG1tbS4u
LiBjb3VsZCB5b3UgYWxzbyByZW1vdmUgdGhpcyBCVUcoKSA/IEkgdGhpbmsgdGhpcyBjb2RlIHBh
dGggY2FuIGJlIHRha2VuCj4gPiBpZiBzb21lIGFwcGxpY2F0aW9ucyBhcmUgdXNpbmcgYnVzeSBw
b2xsaW5nLgo+ID4KPiA+IE9yIHNpbXBseSByZXdyaXRlIHRoaXMgd2l0aCB0aGUgdHJhZGl0aW9u
YWwKPiA+Cj4gPiBpZiAobmFwaV9zY2hlZHVsZV9wcmVwKCZscC0+bmFwaSkpIHsKPiA+ICAgIC8q
IGRpc2FibGUgaW50ZXJydXB0cyAqLwo+ID4gICAgdGNfd3JpdGVsKGRtYWN0bCB8IERNQV9JbnRN
YXNrLCAmdHItPkRNQV9DdGwpOwo+ID4gICAgIF9fbmFwaV9zY2hlZHVsZSgmbHAtPm5hcGkpOwo+
ID4gfQo+ID4KPiA+Cj4KPiBNaGhoIGlzIGl0IHNhZmUgdG8gZG8gc28/IEkgbWVhbiBpdCBzZWVt
cyB2ZXJ5IHdyb25nIHRvIHByaW50IGEgd2FybmluZwo+IGFuZCBCVUcoKSBpbnN0ZWFkIG9mIGRp
c2FibGluZyB0aGUgaW50ZXJydXB0IG9ubHkgaWYgbmFwaSBjYW4gYmUKPiBzY2hlZHVsZWQuLi4g
TWF5YmUgaXMgdmVyeSBvbGQgY29kZT8gVGhlIG1vcmUgSSBzZWUgdGhpcyB0aGUgbW9yZSBJIHNl
ZQo+IHByb2JsZW0uLi4gKHJhbmRvbWx5IGRpc2FibGluZyB0aGUgaW50ZXJydXB0IGFuZCB0aGVu
IG1ha2UgdGhlIGtlcm5lbAo+IGRpZSkKCkkgYW0gcHJldHR5IHN1cmUgdGhpcyBCVUcoKSBjYW4g
YmUgaGl0IHRoZXNlIGRheXMgd2l0aCBidXN5IHBvbGxpbmcgb3IKc2V0dGluZyBncm9fZmx1c2hf
dGltZW91dC4KCkkgd2lzaCB3ZSBjb3VsZCByZW1vdmUgdGhlc2UgYnVncyBiZWZvcmUgc29tZW9u
ZSBjb3B5LXBhc3RlIHRoZW0uCgpBZ2FpbiwgdGhpcyBpcyBvcnRob2dvbmFsLCBJIG1pZ2h0IHNp
bXBseSBzdG9wIGRvaW5nIHJldmlld3MgaWYgdGhpcwppcyBub3QgdXNlZnVsLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlz
dAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
