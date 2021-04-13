Return-Path: <SRS0=sufp=JK=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8459FC433B4
	for <ath10k@archiver.kernel.org>; Tue, 13 Apr 2021 16:28:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2E7861369
	for <ath10k@archiver.kernel.org>; Tue, 13 Apr 2021 16:28:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2E7861369
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:MIME-Version:References:In-Reply-To:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QcU9Yd3iqQzsgTIWqGGat5fl0QpTAM6jRKj98DcD7I8=; b=aGxkIdF704oBB6cxc5HyjIHoF
	K9ujxOXbPmwHnAPWiSBbwbloQq6U2LC6n9liVy9ZZnODhmYd8BGa2SKft5gkSgJJR7IoNRxlyvAuo
	4EyLHrbN/M4Ll+lKHljgzG3xuZvewg5RnD67+9zQurrWxmuwpKxgZTuj77iVyrSgP+xYWasRLKxEi
	jd7bE8bZ4o0qHdHeJHcqFyCJBO50n0WIbhknwSCfHsrBl/6pnVgZSCGIeZ+hSR237jMiLAN3OB8Nq
	qdiCfJcucSJMQwHW2c5ax+vCy50J8StK2v+iqJkNZIpNBy9AWeGfsXthJXZoJYl7V809dzXi8eYdB
	DCIOZvnxw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWLsN-009nFN-1e; Tue, 13 Apr 2021 16:26:55 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWLoV-009mSL-Vy
 for ath10k@desiato.infradead.org; Tue, 13 Apr 2021 16:22:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-ID:MIME-Version:Content-Type:
 Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=BTjoYo/VFKc2bkEAtgeeg5EXHOeO9uSwVGzBwDjufjw=; b=GMwhQIoadGv9ZSo1/l97A9lkpg
 TAE1+tc2u72aXtN16yjlSbjgQR9W2/zZYkzEcaWiCtT+/Is/y4DS6YHk8NHyau599WSCBZqDqGQN5
 Oa8LDtA5pe6X7wz80R7aC3w7gHaZzLJxL+uK416PPqzZRsZ7u62YWGF2lJANXzzkmRYeNqgl2Ycpi
 zNQF8E/hFF5i29i7YRmeahDzHUSmzFkhgQ2EVNB4Mik/R3sxpMuJ+TiP+3DhNvq31KxLaCYAMs49k
 TFgJTf6XKFTNVkOj5xp4MX2A78O23L9ppDdyYRTjTV15+GSGeJ4stpUYRxYOc1AL+TrKu1Dh8rcR5
 1Jyr2mrQ==;
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lWLoP-007Ayn-EJ
 for ath10k@lists.infradead.org; Tue, 13 Apr 2021 16:22:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 In-Reply-To:References:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-ID; bh=25jLgPOi6AVJ23kd4QoHmeCJteCastNfRFqW
 HT87oho=; b=p/cuANaoRaCnxa7JAM4E8fgQv7xt/TNh1dcFceU+x15XvkBP1ajY
 ijSXXAzi9oQicTR9mS6igb96HkZTKPm9hRcfdYV0MVfgvBSX7unzfLGTcnZ39aMu
 QGC4ck/Uc21gCx/jus9jHjtYrgBm0Svszu9XZHjspN7gwL0kaThPB2g=
Received: by ajax-webmail-newmailweb.ustc.edu.cn (Coremail) ; Wed, 14 Apr
 2021 00:15:36 +0800 (GMT+08:00)
X-Originating-IP: [202.38.69.14]
Date: Wed, 14 Apr 2021 00:15:36 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: lyl2019@mail.ustc.edu.cn
To: "Lv Yunlong" <lyl2019@mail.ustc.edu.cn>
Cc: kvalo@codeaurora.org, davem@davemloft.net, kuba@kernel.org, 
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] wireless: ath10k: Fix a use after free in
 ath10k_htc_send_bundle
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT3.0.8 dev build
 20190610(cb3344cf) Copyright (c) 2002-2021 www.mailtech.cn ustc-xl
In-Reply-To: <20210329120154.8963-1-lyl2019@mail.ustc.edu.cn>
References: <20210329120154.8963-1-lyl2019@mail.ustc.edu.cn>
X-SendMailWithSms: false
MIME-Version: 1.0
Message-ID: <5e01cb1.42c8e.178cc044bed.Coremail.lyl2019@mail.ustc.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: LkAmygCnsqyow3VgdpPSAA--.0W
X-CM-SenderInfo: ho1ojiyrz6zt1loo32lwfovvfxof0/1tbiAQoKBlQhn5-yvQACs-
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
 CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
 daVFxhVjvjDU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_092249_920606_DCF9CABA 
X-CRM114-Status: UNSURE (   9.85  )
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

DQpIaSwgbWFpbnRhaW5lcnMgb2Yga2VyZW5sLg0KDQogICAgSSBzdWJtaXR0ZWQgdGhpcyBwYXRj
aCB0d28gd2Vla3MgYWdvLCBidXQgaXQgc3RpbGwgaGFzbid0IGJlZW4gcmV2aWV3ZWQuDQogICAg
Q291bGQgeW91IGhlbHAgdG8gcmV2aWV3IHRoaXMgcGF0Y2g/IEl0IHdpbGwgbm90IHRha2UgeW91
IG11Y2ggdGltZS4NCg0KVGhhbmsgeW91IHZlcnkgbXVjaC4NCg0KPiAtLS0tLeWOn+Wni+mCruS7
ti0tLS0tDQo+IOWPkeS7tuS6ujogIkx2IFl1bmxvbmciIDxseWwyMDE5QG1haWwudXN0Yy5lZHUu
Y24+DQo+IOWPkemAgeaXtumXtDogMjAyMS0wMy0yOSAyMDowMTo1NCAo5pif5pyf5LiAKQ0KPiDm
lLbku7bkuro6IGt2YWxvQGNvZGVhdXJvcmEub3JnLCBkYXZlbUBkYXZlbWxvZnQubmV0LCBrdWJh
QGtlcm5lbC5vcmcNCj4g5oqE6YCBOiBhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZywgbGludXgt
d2lyZWxlc3NAdmdlci5rZXJuZWwub3JnLCBuZXRkZXZAdmdlci5rZXJuZWwub3JnLCBsaW51eC1r
ZXJuZWxAdmdlci5rZXJuZWwub3JnLCAiTHYgWXVubG9uZyIgPGx5bDIwMTlAbWFpbC51c3RjLmVk
dS5jbj4NCj4g5Li76aKYOiBbUEFUQ0hdIHdpcmVsZXNzOiBhdGgxMGs6IEZpeCBhIHVzZSBhZnRl
ciBmcmVlIGluIGF0aDEwa19odGNfc2VuZF9idW5kbGUNCj4gDQo+IEluIGF0aDEwa19odGNfc2Vu
ZF9idW5kbGUsIHRoZSBidW5kbGVfc2tiIGNvdWxkIGJlIGZyZWVkIGJ5DQo+IGRldl9rZnJlZV9z
a2JfYW55KGJ1bmRsZV9za2IpLiBCdXQgdGhlIGJ1bmRsZV9za2IgaXMgdXNlZCBsYXRlcg0KPiBi
eSBidW5kbGVfc2tiLT5sZW4uDQo+IA0KPiBBcyBza2JfbGVuID0gYnVuZGxlX3NrYi0+bGVuLCBt
eSBwYXRjaCByZXBsYWNlcyBidW5kbGVfc2tiLT5sZW4gdG8NCj4gc2tiX2xlbiBhZnRlciB0aGUg
YnVuZGxlX3NrYiB3YXMgZnJlZWQuDQo+IA0KPiBGaXhlczogYzgzMzQ1MTJmM2RkMSAoImF0aDEw
azogYWRkIGh0dCBUWCBidW5kbGUgZm9yIHNkaW8iKQ0KPiBTaWduZWQtb2ZmLWJ5OiBMdiBZdW5s
b25nIDxseWwyMDE5QG1haWwudXN0Yy5lZHUuY24+DQo+IC0tLQ0KPiAgZHJpdmVycy9uZXQvd2ly
ZWxlc3MvYXRoL2F0aDEway9odGMuYyB8IDIgKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3dp
cmVsZXNzL2F0aC9hdGgxMGsvaHRjLmMgYi9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBr
L2h0Yy5jDQo+IGluZGV4IDBhMzdiZTZhN2QzMy4uZmFiMzk4MDQ2YTNmIDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL2h0Yy5jDQo+ICsrKyBiL2RyaXZlcnMv
bmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvaHRjLmMNCj4gQEAgLTY2OSw3ICs2NjksNyBAQCBzdGF0
aWMgaW50IGF0aDEwa19odGNfc2VuZF9idW5kbGUoc3RydWN0IGF0aDEwa19odGNfZXAgKmVwLA0K
PiAgDQo+ICAJYXRoMTBrX2RiZyhhciwgQVRIMTBLX0RCR19IVEMsDQo+ICAJCSAgICJidW5kbGUg
dHggc3RhdHVzICVkIGVpZCAlZCByZXEgY291bnQgJWQgY291bnQgJWQgbGVuICVkXG4iLA0KPiAt
CQkgICByZXQsIGVwLT5laWQsIHNrYl9xdWV1ZV9sZW4oJmVwLT50eF9yZXFfaGVhZCksIGNuLCBi
dW5kbGVfc2tiLT5sZW4pOw0KPiArCQkgICByZXQsIGVwLT5laWQsIHNrYl9xdWV1ZV9sZW4oJmVw
LT50eF9yZXFfaGVhZCksIGNuLCBza2JfbGVuKTsNCj4gIAlyZXR1cm4gcmV0Ow0KPiAgfQ0KPiAg
DQo+IC0tIA0KPiAyLjI1LjENCj4gDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
