Return-Path: <SRS0=M+pE=NT=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BDD2C432BE
	for <ath10k@archiver.kernel.org>; Sat, 28 Aug 2021 07:32:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC49A610A8
	for <ath10k@archiver.kernel.org>; Sat, 28 Aug 2021 07:32:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DC49A610A8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=wanadoo.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OFF564G9kYJRAw2i2Uwp3B/jJzD573B+Pn2uB1b0YeQ=; b=cpWLaIfOzVZfp8
	SWTJ9fO72Vk44TR0j3pRLSkyx01RO+3FNJAQC+kTLOR/m9/MZsIHcmR5uZZpOfVzyQW5jAL27zml3
	qRdygiZ5dmN2xsiiUOzSHvu1zCjg+mSYGSumU0Ev9POBIPY2AC1N2V9P8mkp/6ZGJR+iGfjlOYb4U
	rn5iI5aVxLmRGAygU2Nd2CRgbCWxCT3XkNhPZczsiYHU8UZ7eMLh56KJLH1IiO4mOTXjkQj1I+N67
	QR3XVrl+OBOC1/AntZ1ssvyr5AC0Wj8BaVXDcmRAXqq+35DPUERe44sSKdk/v1tZcNfzvWXoEEoNx
	0I0FYQb1I0JXpY4bnPPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJsoM-00DqbZ-HQ; Sat, 28 Aug 2021 07:31:30 +0000
Received: from mail-pl1-f174.google.com ([209.85.214.174])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJsoJ-00Dqb6-6q
 for ath10k@lists.infradead.org; Sat, 28 Aug 2021 07:31:29 +0000
Received: by mail-pl1-f174.google.com with SMTP id x16so3890751pll.2
 for <ath10k@lists.infradead.org>; Sat, 28 Aug 2021 00:31:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=72FGwkr2cgYiG2mCqnRFPrgyEIFWlTQT13Q2rpcWR6c=;
 b=D2aepReE/4TLWnsorp3IqQ8u9+sxIfxM1cP4NTYKD+F/cV4rNv7PHTzfTcUY3XbTP+
 xMDJTFbDltcgBZnR+tE+hzyXPfKf6OyJ42cyWO0/tDO6RKfkZnLXb4pUOPUmBQwWYfz6
 8JqCtHZhubUEy6BEtATlfTAbErkOt7Ai9MLSm+X08ANaI3yyKHeV844umPtnUO29ZZel
 9o33OjJMjqWeZTwsOxZW7ODIwnRO/yUcJlq08f5Q0JnQdflVn6ezaoBwfMF6T+MPJXLo
 2cF4PWAyEy2+UF3NFL6DMeCZg1ubrNFcwiqoIqtbmnrPnpRLU+BXO+YQvvRsq7fn8a5a
 f5lg==
X-Gm-Message-State: AOAM5310I2EgtqjxSJ90DnGC9+sZMGtLwMXAabgKM25WtjtQyMzXf5ci
 oItN06r4cPVjkCqSWvNI9k0W5l8IIFXrLQFGpo4=
X-Google-Smtp-Source: ABdhPJzVwiRr/iufrwRsD3iA1dLD0/75TS+nkg+Sq3eKriL7lOlxSYaVCBACpKhZsKqGUkHhvzxRECVhEBWX+9qFs7M=
X-Received: by 2002:a17:902:9b89:b0:12d:7f02:f6a5 with SMTP id
 y9-20020a1709029b8900b0012d7f02f6a5mr12373883plp.39.1630135885761; Sat, 28
 Aug 2021 00:31:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210826050458.1540622-1-keescook@chromium.org>
 <20210826050458.1540622-3-keescook@chromium.org>
 <20210826062452.jekmoo43f4xu5jxk@pengutronix.de>
 <202108270915.B4DD070AF@keescook>
In-Reply-To: <202108270915.B4DD070AF@keescook>
From: Vincent MAILHOL <mailhol.vincent@wanadoo.fr>
Date: Sat, 28 Aug 2021 16:31:14 +0900
Message-ID: <CAMZ6Rq+b1wy3miNvXyeM5Cbp16CH78RKRf2WxUSL4s4w5=+aYg@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] treewide: Replace open-coded flex arrays in unions
To: Kees Cook <keescook@chromium.org>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>,
 open list <linux-kernel@vger.kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Ayush Sawal <ayush.sawal@chelsio.com>,
 Vinay Kumar Yadav <vinay.yadav@chelsio.com>, 
 Rohit Maheshwari <rohitm@chelsio.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>, 
 Jakub Kicinski <kuba@kernel.org>, Stanislaw Gruszka <stf_xl@wp.pl>,
 Luca Coelho <luciano.coelho@intel.com>, 
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <kafai@fb.com>,
 Song Liu <songliubraving@fb.com>, 
 Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>,
 KP Singh <kpsingh@kernel.org>, Johannes Berg <johannes.berg@intel.com>, 
 Mordechay Goodstein <mordechay.goodstein@intel.com>,
 Lee Jones <lee.jones@linaro.org>, 
 Wolfgang Grandegger <wg@grandegger.com>, 
 Arunachalam Santhanam <arunachalam.santhanam@in.bosch.com>, 
 Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
 linux-crypto@vger.kernel.org, 
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, 
 netdev <netdev@vger.kernel.org>, linux-scsi@vger.kernel.org, 
 linux-can <linux-can@vger.kernel.org>, bpf@vger.kernel.org, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, Keith Packard <keithp@keithp.com>,
 Dan Williams <dan.j.williams@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 clang-built-linux@googlegroups.com, linux-hardening@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210828_003127_300110_D80B7615 
X-CRM114-Status: GOOD (  24.16  )
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

TGUgc2FtLiAyOCBhb8O7dCAyMDIxIMOgIDAxOjE3LCBLZWVzIENvb2sgPGtlZXNjb29rQGNocm9t
aXVtLm9yZz4gYSDDqWNyaXQgOgo+Cj4gT24gVGh1LCBBdWcgMjYsIDIwMjEgYXQgMDg6MjQ6NTJB
TSArMDIwMCwgTWFyYyBLbGVpbmUtQnVkZGUgd3JvdGU6Cj4gPiBbLi4uXQo+ID4gQlRXOiBJcyB0
aGVyZSBvcHBvcnR1bml0eSBmb3IgY29udmVyc2lvbiwgdG9vPwo+ID4KPiA+IHwgZHJpdmVycy9u
ZXQvY2FuL3BlYWtfY2FuZmQvcGVha19wY2llZmRfbWFpbi5jOjE0NjozMjogd2FybmluZzogYXJy
YXkgb2YgZmxleGlibGUgc3RydWN0dXJlcwo+Cj4gVW50ZXN0ZWQgcG90ZW50aWFsIHNvbHV0aW9u
Ogo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2Nhbi9wZWFrX2NhbmZkL3BlYWtfcGNpZWZk
X21haW4uYyBiL2RyaXZlcnMvbmV0L2Nhbi9wZWFrX2NhbmZkL3BlYWtfcGNpZWZkX21haW4uYwo+
IGluZGV4IDFkZjNjNGI1NGYwMy4uZWZhMmI1YTUyYmQ3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
bmV0L2Nhbi9wZWFrX2NhbmZkL3BlYWtfcGNpZWZkX21haW4uYwo+ICsrKyBiL2RyaXZlcnMvbmV0
L2Nhbi9wZWFrX2NhbmZkL3BlYWtfcGNpZWZkX21haW4uYwo+IEBAIC0xNDMsNyArMTQzLDExIEBA
IHN0cnVjdCBwY2llZmRfcnhfZG1hIHsKPiAgICAgICAgIF9fbGUzMiBpcnFfc3RhdHVzOwo+ICAg
ICAgICAgX19sZTMyIHN5c190aW1lX2xvdzsKPiAgICAgICAgIF9fbGUzMiBzeXNfdGltZV9oaWdo
Owo+IC0gICAgICAgc3RydWN0IHB1Y2FuX3J4X21zZyBtc2dbXTsKPiArICAgICAgIC8qCj4gKyAg
ICAgICAgKiB3aXRoICJtc2ciIGJlaW5nIHBjaWVmZF9pcnFfcnhfY250KHByaXYtPmlycV9zdGF0
dXMpLW1hbnkKPiArICAgICAgICAqIHZhcmlhYmxlLXNpemVkIHN0cnVjdCBwdWNhbl9yeF9tc2cg
Zm9sbG93aW5nLgo+ICsgICAgICAgICovCj4gKyAgICAgICBfX2xlMzIgbXNnW107CgpJc24ndCB1
OCBtc2dbXSBwcmVmZXJhYmxlIGhlcmU/Cgo+ICB9IF9fcGFja2VkIF9fYWxpZ25lZCg0KTsKPgo+
ICAvKiBUeCBMaW5rIHJlY29yZCAqLwo+IEBAIC0zMjcsNyArMzMxLDcgQEAgc3RhdGljIGlycXJl
dHVybl90IHBjaWVmZF9pcnFfaGFuZGxlcihpbnQgaXJxLCB2b2lkICphcmcpCj4KPiAgICAgICAg
IC8qIGhhbmRsZSByeCBtZXNzYWdlcyAoaWYgYW55KSAqLwo+ICAgICAgICAgcGVha19jYW5mZF9o
YW5kbGVfbXNnc19saXN0KCZwcml2LT51Y2FuLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHJ4X2RtYS0+bXNnLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIChzdHJ1Y3QgcHVjYW5fcnhfbXNnICopcnhfZG1hLT5tc2csCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcGNpZWZkX2lycV9yeF9jbnQocHJpdi0+aXJxX3N0YXR1cykp
Owo+Cj4gICAgICAgICAvKiBoYW5kbGUgdHggbGluayBpbnRlcnJ1cHQgKGlmIGFueSkgKi8KPgo+
Cj4gSXQncyBub3QgZ3JlYXQsIGJ1dCBpdCdzIGFsc28gbm90IHN0cmljdGx5IGEgZmxleCBhcnJh
eSwgaW4gdGhlIHNlbnNlCj4gdGhhdCBzaW5jZSBzdHJ1Y3QgcHVjYW5fcnhfbXNnIGlzIGEgdmFy
aWFibGUgc2l6ZSwgdGhlIGNvbXBpbGVyIGNhbm5vdAo+IHJlYXNvbiBhYm91dCB0aGUgc2l6ZSBv
ZiBzdHJ1Y3QgcGNpZWZkX3J4X2RtYSBiYXNlZCBvbmx5IG9uIHRoZQo+IGlycV9zdGF0dXMgZW5j
b2RpbmcuLi4KCkluIHRoZSBzYW1lIHNwaXJpdCwgaXQgaXMgYSBiaXQgY2xlYW5lciB0byBjaGFu
Z2UgdGhlIHByb3RvdHlwZSBvZgpoYW5kbGVfbXNnc19saXN0KCkuCgpMaWtlIHRoYXQ6CgoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2Nhbi9wZWFrX2NhbmZkL3BlYWtfY2FuZmQuYyBiL2RyaXZl
cnMvbmV0L2Nhbi9wZWFrX2NhbmYKZC9wZWFrX2NhbmZkLmMKaW5kZXggZDA4NzE4ZTk4ZTExLi44
MWE5ZmFhNjE5M2YgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbmV0L2Nhbi9wZWFrX2NhbmZkL3BlYWtf
Y2FuZmQuYworKysgYi9kcml2ZXJzL25ldC9jYW4vcGVha19jYW5mZC9wZWFrX2NhbmZkLmMKQEAg
LTQ4NCw5ICs0ODQsOCBAQCBpbnQgcGVha19jYW5mZF9oYW5kbGVfbXNnKHN0cnVjdCBwZWFrX2Nh
bmZkX3ByaXYgKnByaXYsCgogLyogaGFuZGxlIGEgbGlzdCBvZiByeF9jb3VudCBtZXNzYWdlcyBm
cm9tIHJ4X21zZyBtZW1vcnkgYWRkcmVzcyAqLwogaW50IHBlYWtfY2FuZmRfaGFuZGxlX21zZ3Nf
bGlzdChzdHJ1Y3QgcGVha19jYW5mZF9wcml2ICpwcml2LAotICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHN0cnVjdCBwdWNhbl9yeF9tc2cgKm1zZ19saXN0LCBpbnQgbXNnX2NvdW50KQor
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZvaWQgKm1zZ19wdHIsIGludCBtc2dfY291
bnQpCiB7Ci0gICAgICAgdm9pZCAqbXNnX3B0ciA9IG1zZ19saXN0OwogICAgICAgIGludCBpLCBt
c2dfc2l6ZSA9IDA7CgogICAgICAgIGZvciAoaSA9IDA7IGkgPCBtc2dfY291bnQ7IGkrKykgewpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvY2FuL3BlYWtfY2FuZmQvcGVha19jYW5mZF91c2VyLmgg
Yi9kcml2ZXJzL25ldC9jYW4vcGVhawpfY2FuZmQvcGVha19jYW5mZF91c2VyLmgKaW5kZXggYTcy
NzE5ZGMzYjc0Li5lZjkxZjkyZTcwYzMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbmV0L2Nhbi9wZWFr
X2NhbmZkL3BlYWtfY2FuZmRfdXNlci5oCisrKyBiL2RyaXZlcnMvbmV0L2Nhbi9wZWFrX2NhbmZk
L3BlYWtfY2FuZmRfdXNlci5oCkBAIC00Miw1ICs0Miw1IEBAIHN0cnVjdCBuZXRfZGV2aWNlICph
bGxvY19wZWFrX2NhbmZkX2RldihpbnQKc2l6ZW9mX3ByaXYsIGludCBpbmRleCwKIGludCBwZWFr
X2NhbmZkX2hhbmRsZV9tc2coc3RydWN0IHBlYWtfY2FuZmRfcHJpdiAqcHJpdiwKICAgICAgICAg
ICAgICAgICAgICAgICAgICBzdHJ1Y3QgcHVjYW5fcnhfbXNnICptc2cpOwogaW50IHBlYWtfY2Fu
ZmRfaGFuZGxlX21zZ3NfbGlzdChzdHJ1Y3QgcGVha19jYW5mZF9wcml2ICpwcml2LAotICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBwdWNhbl9yeF9tc2cgKnJ4X21zZywgaW50
IHJ4X2NvdW50KTsKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2b2lkICptc2dfcHRy
LCBpbnQgcnhfY291bnQpOwogI2VuZGlmCmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9jYW4vcGVh
a19jYW5mZC9wZWFrX3BjaWVmZF9tYWluLmMKYi9kcml2ZXJzL25ldC9jYW4vcGVha19jYW5mZC9w
ZWFrX3BjaWVmZF9tYWluLmMKaW5kZXggMWRmM2M0YjU0ZjAzLi5jMWRlMWUzZGM0YmMgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvbmV0L2Nhbi9wZWFrX2NhbmZkL3BlYWtfcGNpZWZkX21haW4uYworKysg
Yi9kcml2ZXJzL25ldC9jYW4vcGVha19jYW5mZC9wZWFrX3BjaWVmZF9tYWluLmMKQEAgLTE0Myw3
ICsxNDMsMTEgQEAgc3RydWN0IHBjaWVmZF9yeF9kbWEgewogICAgICAgIF9fbGUzMiBpcnFfc3Rh
dHVzOwogICAgICAgIF9fbGUzMiBzeXNfdGltZV9sb3c7CiAgICAgICAgX19sZTMyIHN5c190aW1l
X2hpZ2g7Ci0gICAgICAgc3RydWN0IHB1Y2FuX3J4X21zZyBtc2dbXTsKKyAgICAgICAvKgorICAg
ICAgICAqIHdpdGggIm1zZyIgYmVpbmcgcGNpZWZkX2lycV9yeF9jbnQocHJpdi0+aXJxX3N0YXR1
cyktbWFueQorICAgICAgICAqIHZhcmlhYmxlLXNpemVkIHN0cnVjdCBwdWNhbl9yeF9tc2cgZm9s
bG93aW5nLgorICAgICAgICAqLworICAgICAgIHU4IG1zZ1tdOwogfSBfX3BhY2tlZCBfX2FsaWdu
ZWQoNCk7CgogLyogVHggTGluayByZWNvcmQgKi8KCgpBbm90aGVyIHNvbHV0aW9uIHdvdWxkIGJl
IHRvIGRlY2xhcmUgYSBtYXhpbXVtIGxlbmd0aCBmb3Igc3RydWN0CnB1Y2FuX3J4X21zZzo6ZC4g
QmVjYXVzZSB0aGVzZSBhcmUgQ0FOIEZEIG1lc3NhZ2VzLCBJIHN1cHBvc2UKdGhhdCBtYXhpbXVt
IGxlbmd0aCB3b3VsZCBiZSBDQU5GRF9NQVhfRExFTi4gc3RydWN0IGNhbmZkX2ZyYW1lCmZyb20g
dGhlIFVBUEkgdXNlcyB0aGUgc2FtZSBwYXR0ZXJuLgoKTi5CLiBUaGlzIHNvbHV0aW9uIGlzIG5v
dCBleGNsdXNpdmUgZnJvbSB0aGUgYWJvdmUgb25lIChhY3R1YWxseSwKSSB0aGluayB0aGF0IHVz
aW5nIGJvdGggd291bGQgYmUgdGhlIGJlc3Qgc29sdXRpb24pLgoKZGlmZiAtLWdpdCBhL2luY2x1
ZGUvbGludXgvY2FuL2Rldi9wZWFrX2NhbmZkLmgKYi9pbmNsdWRlL2xpbnV4L2Nhbi9kZXYvcGVh
a19jYW5mZC5oCmluZGV4IGYzODc3MmZkMGMwNy4uYTA0ODM1OWRiNDMwIDEwMDY0NAotLS0gYS9p
bmNsdWRlL2xpbnV4L2Nhbi9kZXYvcGVha19jYW5mZC5oCisrKyBiL2luY2x1ZGUvbGludXgvY2Fu
L2Rldi9wZWFrX2NhbmZkLmgKQEAgLTE4OSw3ICsxODksNyBAQCBzdHJ1Y3QgX19wYWNrZWQgcHVj
YW5fcnhfbXNnIHsKICAgICAgICB1OCAgICAgIGNsaWVudDsKICAgICAgICBfX2xlMTYgIGZsYWdz
OwogICAgICAgIF9fbGUzMiAgY2FuX2lkOwotICAgICAgIHU4ICAgICAgZFtdOworICAgICAgIHU4
ICAgICAgZFtDQU5GRF9NQVhfRExFTl07CiB9OwoKIC8qIHVDQU4gZXJyb3IgdHlwZXMgKi8KCgoK
SSBvbmx5IHRlc3RlZCBmb3IgY29tcGlsYXRpb24uCgpZb3VycyBzaW5jZXJlbHksClZpbmNlbnQK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBt
YWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
