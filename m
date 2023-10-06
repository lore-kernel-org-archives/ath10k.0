Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB11E81E1F
	for <ath10k@archiver.kernel.org>; Fri,  6 Oct 2023 18:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UgvC2mt1F/w53SmkdPGORyUreTWMt3AVvZvJxZHDRL0=; b=FrloyDg6mm04Fp
	ClTSkcVvJG1nN2iJSD12V1eiNnHD0NoZ7oXtovTE1UADoVnYAVh454v4c+Fo9yxlvNcE/MJwwEP3r
	F4wXz5l7QTqNs8nFh+l7Kfsb7ag6FWM9rP+53BBaCjFa6AMcNItLvNO4Sq6+OsOBagH96dBnPYuPv
	UcY9Fr5GUFzuJIum3Tmg7sbcaSV7VfzUxdm9EXyoPBH9ro9ATSo+1MdsH9wzjH2Syfe2D+yeFO1dd
	YiwOXjDKtpDmKyFfLKAo+39qbwOXK5gLgRoaxRpsUeixZJrEdqSfwAF3m0+gXVsYVJqVFOk6vVQp0
	YCAToaCZIAdEPEKILZWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoptX-006L5E-2E;
	Fri, 06 Oct 2023 18:49:51 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoptT-006L4D-11;
	Fri, 06 Oct 2023 18:49:48 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-405361bb94eso23819055e9.0;
        Fri, 06 Oct 2023 11:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696618183; x=1697222983; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J8TnZukIluCCYT6M1BV1r+HvisyoMBi+KKDF01G+Mhg=;
        b=DUHiT/qMDDbFqIoru6Z33ILpOqWAf2n6eyNww/ILMc2qGhPH1JmMc+6aXW5Z01CJff
         usuw78kXTthN5eO8u06P57EaDAR6lblgzOcENEkCLTdF91iSK/9SKM9ETulBAzO/PQds
         IvOQe7N3M5OPU7UmkLUKInFH1wwnMjOHXT5aneZWgtGdSdUyBbfqKwh/AUPuk43CpVWW
         qZvmGLM1WH4Rqllmtc7rHJHJerT2W7OBqbx0LObqrlYu7Dk28IZmhIMtScoaXHFSiCLO
         kyLES+yH1TMYnOpk6/KONPrbvg2oVPPfuJ3N3HnsiIXMFEwyBYB9J5e4q/Y3vXz1BZEV
         RDOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696618183; x=1697222983;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J8TnZukIluCCYT6M1BV1r+HvisyoMBi+KKDF01G+Mhg=;
        b=JiMQCocpexreftnmsUPyRPSroLRFg3NQnt31Z2YLkumZD9hWZIM1Ajzuv6UK3A3Ob7
         gnJdbIVR6182YGEu654hW6L9foDp+rGbEryKEj2FDvhMfeEVmPbJC4JFUdF4SmcZAQXp
         C+bUirZk1zslTepIXW6GEx0ADcaUQtd+xOGTI6shEACUdFQ473bpcF2K05sIZDsRg4D4
         y5YJY52ea55WEwFZS5rH1LoFf3QN4p0TbobByP8eJkWijhaZF9+UAtTcPfQWZ3oIdkTf
         u2vxghrrlNclIzwEo+fVBi2TSmHIlywYjfAhG3kRWOXzArK94fVt8G1xpEiC6Nplxp0t
         oupg==
X-Gm-Message-State: AOJu0Yy+uPQwO+2SoZucCgQY0+x8wrjhsr9OI1Xsw7c+XzLW5j1Vb6N5
	Fk3scPDEo0RtxtKRKqxjay8=
X-Google-Smtp-Source: AGHT+IGnyXDNMYk8HFRpUEcTSZlI2oSIFcmKPz3Tef9zJ6V0zvxO56KtfzCWQ2oyr2OO4KuUJibc4g==
X-Received: by 2002:a05:6000:48:b0:31f:f8a5:15db with SMTP id k8-20020a056000004800b0031ff8a515dbmr8155280wrx.48.1696618182580;
        Fri, 06 Oct 2023 11:49:42 -0700 (PDT)
Received: from Ansuel-xps. (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.gmail.com with ESMTPSA id p4-20020a5d68c4000000b003232f167df5sm2217218wrw.108.2023.10.06.11.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 11:49:41 -0700 (PDT)
Message-ID: <652056c5.5d0a0220.2b60d.c5dc@mx.google.com>
X-Google-Original-Message-ID: <ZSBWxW8ba8P0szfD@Ansuel-xps.>
Date: Fri, 6 Oct 2023 20:49:41 +0200
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
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANn89iLtYZJPOQE7OkAbEdmhT8qjzAJ+27poa__3c8Nf0M6u_w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_114947_356432_C31F8B8A 
X-CRM114-Status: GOOD (  34.91  )
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

T24gVGh1LCBPY3QgMDUsIDIwMjMgYXQgMDY6MTY6MjZQTSArMDIwMCwgRXJpYyBEdW1hemV0IHdy
b3RlOgo+IE9uIFR1ZSwgT2N0IDMsIDIwMjMgYXQgODozNuKAr1BNIENocmlzdGlhbiBNYXJhbmdp
IDxhbnN1ZWxzbXRoQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gUmVwbGFjZSBpZiBjb25kaXRp
b24gb2YgbmFwaV9zY2hlZHVsZV9wcmVwL19fbmFwaV9zY2hlZHVsZSBhbmQgdXNlIGJvb2wKPiA+
IGZyb20gbmFwaV9zY2hlZHVsZSBkaXJlY3RseSB3aGVyZSBwb3NzaWJsZS4KPiA+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gTWFyYW5naSA8YW5zdWVsc210aEBnbWFpbC5jb20+Cj4gPiAt
LS0KPiA+ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9hdGhlcm9zL2F0bHgvYXRsMS5jICAgICB8IDQg
Ky0tLQo+ID4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L3Rvc2hpYmEvdGMzNTgxNS5jICAgICAgIHwg
NCArLS0tCj4gPiAgZHJpdmVycy9uZXQvd2lyZWxlc3MvaW50ZWwvaXdsd2lmaS9wY2llL3J4LmMg
fCA0ICstLS0KPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlv
bnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvYXRoZXJvcy9h
dGx4L2F0bDEuYyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L2F0aGVyb3MvYXRseC9hdGwxLmMKPiA+
IGluZGV4IDAyYWE2ZmQ4ZWJjMi4uYTkwMTRkNzkzMmRiIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVy
cy9uZXQvZXRoZXJuZXQvYXRoZXJvcy9hdGx4L2F0bDEuYwo+ID4gKysrIGIvZHJpdmVycy9uZXQv
ZXRoZXJuZXQvYXRoZXJvcy9hdGx4L2F0bDEuYwo+ID4gQEAgLTI0NDYsNyArMjQ0Niw3IEBAIHN0
YXRpYyBpbnQgYXRsMV9yaW5nc19jbGVhbihzdHJ1Y3QgbmFwaV9zdHJ1Y3QgKm5hcGksIGludCBi
dWRnZXQpCj4gPgo+ID4gIHN0YXRpYyBpbmxpbmUgaW50IGF0bDFfc2NoZWRfcmluZ3NfY2xlYW4o
c3RydWN0IGF0bDFfYWRhcHRlciogYWRhcHRlcikKPiA+ICB7Cj4gPiAtICAgICAgIGlmICghbmFw
aV9zY2hlZHVsZV9wcmVwKCZhZGFwdGVyLT5uYXBpKSkKPiA+ICsgICAgICAgaWYgKCFuYXBpX3Nj
aGVkdWxlKCZhZGFwdGVyLT5uYXBpKSkKPiA+ICAgICAgICAgICAgICAgICAvKiBJdCBpcyBwb3Nz
aWJsZSBpbiBjYXNlIGV2ZW4gdGhlIFJYL1RYIGludHMgYXJlIGRpc2FibGVkIHZpYSBJTVIKPiA+
ICAgICAgICAgICAgICAgICAgKiByZWdpc3RlciB0aGUgSVNSIGJpdHMgYXJlIHNldCBhbnl3YXkg
KGJ1dCBkbyBub3QgcHJvZHVjZSBJUlEpLgo+ID4gICAgICAgICAgICAgICAgICAqIFRvIGhhbmRs
ZSBzdWNoIHNpdHVhdGlvbiB0aGUgbmFwaSBmdW5jdGlvbnMgdXNlZCB0byBjaGVjayBpcwo+ID4g
QEAgLTI0NTQsOCArMjQ1NCw2IEBAIHN0YXRpYyBpbmxpbmUgaW50IGF0bDFfc2NoZWRfcmluZ3Nf
Y2xlYW4oc3RydWN0IGF0bDFfYWRhcHRlciogYWRhcHRlcikKPiA+ICAgICAgICAgICAgICAgICAg
Ki8KPiA+ICAgICAgICAgICAgICAgICByZXR1cm4gMDsKPiA+Cj4gPiAtICAgICAgIF9fbmFwaV9z
Y2hlZHVsZSgmYWRhcHRlci0+bmFwaSk7Cj4gPiAtCj4gPiAgICAgICAgIC8qCj4gPiAgICAgICAg
ICAqIERpc2FibGUgUlgvVFggaW50cyB2aWEgSU1SIHJlZ2lzdGVyIGlmIGl0IGlzCj4gPiAgICAg
ICAgICAqIGFsbG93ZWQuIE5BUEkgaGFuZGxlciBtdXN0IHJlZW5hYmxlIHRoZW0gaW4gc2FtZQo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3Rvc2hpYmEvdGMzNTgxNS5jIGIv
ZHJpdmVycy9uZXQvZXRoZXJuZXQvdG9zaGliYS90YzM1ODE1LmMKPiA+IGluZGV4IDE0Y2Y2ZWNm
NmQwZC4uYThiOGEwZTEzZjlhIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQv
dG9zaGliYS90YzM1ODE1LmMKPiA+ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3Rvc2hpYmEv
dGMzNTgxNS5jCj4gPiBAQCAtMTQzNiw5ICsxNDM2LDcgQEAgc3RhdGljIGlycXJldHVybl90IHRj
MzU4MTVfaW50ZXJydXB0KGludCBpcnEsIHZvaWQgKmRldl9pZCkKPiA+ICAgICAgICAgaWYgKCEo
ZG1hY3RsICYgRE1BX0ludE1hc2spKSB7Cj4gPiAgICAgICAgICAgICAgICAgLyogZGlzYWJsZSBp
bnRlcnJ1cHRzICovCj4gPiAgICAgICAgICAgICAgICAgdGNfd3JpdGVsKGRtYWN0bCB8IERNQV9J
bnRNYXNrLCAmdHItPkRNQV9DdGwpOwo+ID4gLSAgICAgICAgICAgICAgIGlmIChuYXBpX3NjaGVk
dWxlX3ByZXAoJmxwLT5uYXBpKSkKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIF9fbmFwaV9z
Y2hlZHVsZSgmbHAtPm5hcGkpOwo+ID4gLSAgICAgICAgICAgICAgIGVsc2Ugewo+ID4gKyAgICAg
ICAgICAgICAgIGlmICghbmFwaV9zY2hlZHVsZSgmbHAtPm5hcGkpKSB7Cj4gPiAgICAgICAgICAg
ICAgICAgICAgICAgICBwcmludGsoS0VSTl9FUlIgIiVzOiBpbnRlcnJ1cHQgdGFrZW4gaW4gcG9s
bFxuIiwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkZXYtPm5hbWUpOwo+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgQlVHKCk7Cj4gCj4gSG1tbS4uLiBjb3VsZCB5b3UgYWxz
byByZW1vdmUgdGhpcyBCVUcoKSA/IEkgdGhpbmsgdGhpcyBjb2RlIHBhdGggY2FuIGJlIHRha2Vu
Cj4gaWYgc29tZSBhcHBsaWNhdGlvbnMgYXJlIHVzaW5nIGJ1c3kgcG9sbGluZy4KPiAKPiBPciBz
aW1wbHkgcmV3cml0ZSB0aGlzIHdpdGggdGhlIHRyYWRpdGlvbmFsCj4gCj4gaWYgKG5hcGlfc2No
ZWR1bGVfcHJlcCgmbHAtPm5hcGkpKSB7Cj4gICAgLyogZGlzYWJsZSBpbnRlcnJ1cHRzICovCj4g
ICAgdGNfd3JpdGVsKGRtYWN0bCB8IERNQV9JbnRNYXNrLCAmdHItPkRNQV9DdGwpOwo+ICAgICBf
X25hcGlfc2NoZWR1bGUoJmxwLT5uYXBpKTsKPiB9Cj4gCj4KCk1oaGggaXMgaXQgc2FmZSB0byBk
byBzbz8gSSBtZWFuIGl0IHNlZW1zIHZlcnkgd3JvbmcgdG8gcHJpbnQgYSB3YXJuaW5nCmFuZCBC
VUcoKSBpbnN0ZWFkIG9mIGRpc2FibGluZyB0aGUgaW50ZXJydXB0IG9ubHkgaWYgbmFwaSBjYW4g
YmUKc2NoZWR1bGVkLi4uIE1heWJlIGlzIHZlcnkgb2xkIGNvZGU/IFRoZSBtb3JlIEkgc2VlIHRo
aXMgdGhlIG1vcmUgSSBzZWUKcHJvYmxlbS4uLiAocmFuZG9tbHkgZGlzYWJsaW5nIHRoZSBpbnRl
cnJ1cHQgYW5kIHRoZW4gbWFrZSB0aGUga2VybmVsCmRpZSkKCj4gCj4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9uZXQvd2lyZWxlc3MvaW50ZWwvaXdsd2lmaS9wY2llL3J4LmMgYi9kcml2ZXJzL25l
dC93aXJlbGVzcy9pbnRlbC9pd2x3aWZpL3BjaWUvcnguYwo+ID4gaW5kZXggMjNiNWEwYWRjYmQ2
Li4xNDZiYzdiZDE0ZmIgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL25ldC93aXJlbGVzcy9pbnRl
bC9pd2x3aWZpL3BjaWUvcnguYwo+ID4gKysrIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvaW50ZWwv
aXdsd2lmaS9wY2llL3J4LmMKPiA+IEBAIC0xNjYwLDkgKzE2NjAsNyBAQCBpcnFyZXR1cm5fdCBp
d2xfcGNpZV9pcnFfcnhfbXNpeF9oYW5kbGVyKGludCBpcnEsIHZvaWQgKmRldl9pZCkKPiA+ICAg
ICAgICAgSVdMX0RFQlVHX0lTUih0cmFucywgIlslZF0gR290IGludGVycnVwdFxuIiwgZW50cnkt
PmVudHJ5KTsKPiA+Cj4gPiAgICAgICAgIGxvY2FsX2JoX2Rpc2FibGUoKTsKPiA+IC0gICAgICAg
aWYgKG5hcGlfc2NoZWR1bGVfcHJlcCgmcnhxLT5uYXBpKSkKPiA+IC0gICAgICAgICAgICAgICBf
X25hcGlfc2NoZWR1bGUoJnJ4cS0+bmFwaSk7Cj4gPiAtICAgICAgIGVsc2UKPiA+ICsgICAgICAg
aWYgKCFuYXBpX3NjaGVkdWxlKCZyeHEtPm5hcGkpKQo+ID4gICAgICAgICAgICAgICAgIGl3bF9w
Y2llX2NsZWFyX2lycSh0cmFucywgZW50cnktPmVudHJ5KTsKPiAKPiBTYW1lIHJlbWFyayBoZXJl
IGFib3V0IHR3aXN0ZWQgbG9naWMuCj4gCgpFaGhoIGhlcmUgd2UgbmVlZCB0byBiZSBjYXJlZnVs
Li4uIFdlIGNhbiBkbyB0aGUgdXN1YWwgcHJlcC9fX3NjaGVkdWxlCndpdGggdGhlIERNQSBkaXNh
YmxlIGluIGJldHdlZW4uLi4KCkZyb20gdGhlIGNvbW1lbnRzIG9mIGl3bF9wY2llX2NsZWFyX2ly
cS4KCgkvKgoJICogQmVmb3JlIHNlbmRpbmcgdGhlIGludGVycnVwdCB0aGUgSFcgZGlzYWJsZXMg
aXQgdG8gcHJldmVudAoJICogYSBuZXN0ZWQgaW50ZXJydXB0LiBUaGlzIGlzIGRvbmUgYnkgd3Jp
dGluZyAxIHRvIHRoZSBjb3JyZXNwb25kaW5nCgkgKiBiaXQgaW4gdGhlIG1hc2sgcmVnaXN0ZXIu
IEFmdGVyIGhhbmRsaW5nIHRoZSBpbnRlcnJ1cHQsIGl0IHNob3VsZCBiZQoJICogcmUtZW5hYmxl
ZCBieSBjbGVhcmluZyB0aGlzIGJpdC4gVGhpcyByZWdpc3RlciBpcyBkZWZpbmVkIGFzCgkgKiB3
cml0ZSAxIGNsZWFyIChXMUMpIHJlZ2lzdGVyLCBtZWFuaW5nIHRoYXQgaXQncyBiZWluZyBjbGVh
cgoJICogYnkgd3JpdGluZyAxIHRvIHRoZSBiaXQuCgkgKi8KClNvIHRoZSBkZXZpY2UgZGlzYWJs
ZSB0aGUgaW50ZXJydXB0IGFmdGVyIGJlaW5nIGZpcmVkIGFuZCB0aGUgYml0IG5lZWRzCnRvIHNl
dCBhZ2FpbiBmb3IgdGhlIGludGVycnVwdCB0byBiZSByZWVuYWJsZWQuIFNvIHRoZSBmdW5jdGlv
bgpjb3JyZWN0bHkgcmVlbmFibGUgdGhlIGlycSBpZiBhIG5hcGkgY2FuJ3QgYmUgc2NoZWR1bGVk
Li4uIFRoaW5rIHRoZXJlCmlzbid0IGFub3RoZXIgd2F5IHRvIGhhbmRsZSB0aGlzLgoKPiA+ICAg
ICAgICAgbG9jYWxfYmhfZW5hYmxlKCk7Cj4gPgo+ID4gLS0KPiA+IDIuNDAuMQo+ID4KCi0tIAoJ
QW5zdWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
dGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
