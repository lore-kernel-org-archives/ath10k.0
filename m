Return-Path: <SRS0=7Btt=NM=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C11E6C4338F
	for <ath10k@archiver.kernel.org>; Sat, 21 Aug 2021 06:51:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C28B61156
	for <ath10k@archiver.kernel.org>; Sat, 21 Aug 2021 06:51:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7C28B61156
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=holtmann.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pWgwe8FxS7dOnGpvENecom/hJL6LtlwyLBdt/JkU3J4=; b=sJut6IfRQqMjJC
	+mRWdkvHfeTcVXhA0Rfecxionf6Vtmofh2FjC1ICneY7UAJpIBWBk0c9c/ENR4wkkQXDPBv2PzRKa
	f8ct5aj9lpcYxMJ7RoJjt5wV+nk0uKQdNg2SKly/aR/9QGaFd0GmxGUzb4angwt4WiH5cDnuqn3o2
	At0nzKCdG3jsxjYKI5yiqIriwz8frZPeDQ4TVCRFr1oYbsdCFqHoBv5B2TfvV9CnwfezJ2mzkT5YP
	XQyyulim858dfiq2V65Xd3RvgHuMD1XqqgREghrD47yo+jl9LYD8pLmttGCTU7L6LKO4sVwJJ3qZI
	9zfguoaXP2VURO3nPGuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mHKqE-00CX8e-Dc; Sat, 21 Aug 2021 06:50:54 +0000
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mHKq9-00CX7L-6j
 for ath10k@lists.infradead.org; Sat, 21 Aug 2021 06:50:53 +0000
Received: from smtpclient.apple (p5b3d23f8.dip0.t-ipconnect.de [91.61.35.248])
 by mail.holtmann.org (Postfix) with ESMTPSA id D102DCED43;
 Sat, 21 Aug 2021 08:50:40 +0200 (CEST)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: Re: [RFC PATCH 00/15] create power sequencing subsystem
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <CAA8EJpoOxerwmwQozL3gp1nX-+oxLMFUFjVPvRy-MoVfPuvqrw@mail.gmail.com>
Date: Sat, 21 Aug 2021 08:50:40 +0200
Cc: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Stanimir Varbanov <svarbanov@mm-sol.com>,
 MSM <linux-arm-msm@vger.kernel.org>, linux-mmc@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>,
 "open list:BLUETOOTH SUBSYSTEM" <linux-bluetooth@vger.kernel.org>,
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org
Message-Id: <551758F2-0B00-4DEB-92C9-37472E46B75D@holtmann.org>
References: <20210817005507.1507580-1-dmitry.baryshkov@linaro.org>
 <1CA665D1-86F0-45A1-862D-17DAB3ABA974@holtmann.org>
 <CAA8EJpoOxerwmwQozL3gp1nX-+oxLMFUFjVPvRy-MoVfPuvqrw@mail.gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210820_235049_439425_6CB5EF11 
X-CRM114-Status: GOOD (  22.73  )
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

SGkgRG1pdHJ5LAoKPj4+IFRoaXMgaXMgYW4gUkZDIG9mIHRoZSBwcm9wb3NlZCBwb3dlciBzZXF1
ZW5jZXIgc3Vic3lzdGVtLiBUaGlzIGlzIGEKPj4+IGdlbmVyaWZpY2F0aW9uIG9mIHRoZSBNTUMg
cHdyc2VxIGNvZGUuIFRoZSBzdWJzeXN0ZW0gdHJpZXMgdG8gYWJzdHJhY3QKPj4+IHRoZSBpZGVh
IG9mIGNvbXBsZXggcG93ZXItdXAvcG93ZXItZG93bi9yZXNldCBvZiB0aGUgZGV2aWNlcy4KPj4+
IAo+Pj4gVGhlIHByaW1hcnkgc2V0IG9mIGRldmljZXMgdGhhdCBwcm9tdGVkIG1lIHRvIGNyZWF0
ZSB0aGlzIHBhdGNoc2V0IGlzCj4+PiB0aGUgUXVhbGNvbW0gQlQrV2lGaSBmYW1pbHkgb2YgY2hp
cHMuIFRoZXkgcmVzaWRlIG9uIHNlcmlhbCtwbGF0Zm9ybQo+Pj4gaW50ZXJmYWNlcyAob2xkZXIg
Z2VuZXJhdGlvbnMpIG9yIG9uIHNlcmlhbCtQQ0llIChuZXdlciBnZW5lcmF0aW9ucykuCj4+PiBU
aGV5IHJlcXVpcmUgYSBzZXQgb2YgZXh0ZXJuYWwgdm9sdGFnZSByZWd1bGF0b3JzIHRvIGJlIHBv
d2VyZWQgb24gYW5kCj4+PiAoc29tZSBvZiB0aGVtKSBoYXZlIHNlcGFyYXRlIFdpRmkgYW5kIEJs
dWV0b290aCBlbmFibGUgR1BJT3MuCj4+PiAKPj4+IFRoaXMgcGF0Y2hzZXQgYmVpbmcgYW4gUkZD
IHRyaWVzIHRvIGRlbW9uc3RyYXRlIHRoZSBhcHByb2FjaCwgZGVzaWduIGFuZAo+Pj4gdXNhZ2Ug
b2YgdGhlIHB3cnNlcSBzdWJzeXN0ZW0uIEZvbGxvd2luZyBpc3N1ZXMgYXJlIHByZXNlbnQgaW4g
dGhlIFJGQwo+Pj4gYXQgdGhpcyBtb21lbnQgYnV0IHdpbGwgYmUgZml4ZWQgbGF0ZXIgaWYgdGhl
IG92ZXJhbGwgYXBwcm9hY2ggd291bGQgYmUKPj4+IHZpZXdlZCBhcyBhY2NlcHRhYmxlOgo+Pj4g
Cj4+PiAtIE5vIGRvY3VtZW50YXRpb24KPj4+IFdoaWxlIHRoZSBjb2RlIHRyaWVzIHRvIGJlIHNl
bGYtZG9jdW1lbnRpbmcgcHJvcGVyIGRvY3VtZW50YXRpb24KPj4+IHdvdWxkIGJlIHJlcXVpcmVk
Lgo+Pj4gCj4+PiAtIE1pbmltYWwgZGV2aWNlIHRyZWUgYmluZGluZ3MgY2hhbmdlcwo+Pj4gVGhl
cmUgYXJlIG5vIHByb3BlciB1cGRhdGVzIGZvciB0aGUgRFQgYmluZGluZ3MgKHRodXMgbmVpdGhl
ciBSb2IKPj4+IEhlcnJpbmcgbm9yIGRldmljZXRyZWUgYXJlIGluY2x1ZGVkIGluIHRoZSBUby9D
YyBsaXN0cykuIFRoZSBkdAo+Pj4gc2NoZW1hIGNoYW5nZXMgd291bGQgYmUgYSBwYXJ0IG9mIHYx
Lgo+Pj4gCj4+PiAtIExhY2sgb2YgcHJvcGVyIFBDSWUgaW50ZWdyYXRpb24KPj4+IEF0IHRoaXMg
bW9tZW50IHN1cHBvcnQgZm9yIFBDSWUgaXMgaGFja2VkIHVwIHRvIGJlIGFibGUgdG8gdGVzdCB0
aGUKPj4+IFBDSWUgcGFydCBvZiBxY2E2MzkwLiBQcm9wZXIgUENJZSBzdXBwb3J0IHdvdWxkIHJl
cXVpcmUgYXV0b21hdGljYWxseQo+Pj4gcG93ZXJpbmcgdXAgdGhlIGRldmljZXMgYmVmb3JlIHRo
ZSBzY2FuIGJhc2luZyBvbiB0aGUgcHJvcGVyIGRldmljZQo+Pj4gc3RydWN0dXJlIGluIHRoZSBk
ZXZpY2UgdHJlZS4KPj4+IAo+Pj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+Pj4gRG1pdHJ5IEJhcnlzaGtvdiAoMTUpOgo+
Pj4gICAgcG93ZXI6IGFkZCBwb3dlciBzZXF1ZW5jZXIgc3Vic3lzdGVtCj4+PiAgICBwd3JzZXE6
IHBvcnQgTU1DJ3MgcHdyc2VxIGRyaXZlcnMgdG8gbmV3IHB3cnNlcSBzdWJzeXN0ZW0KPj4+ICAg
IG1tYzogY29yZTogc3dpdGNoIHRvIG5ldyBwd3JzZXEgc3Vic3lzdGVtCj4+PiAgICBhdGgxMGs6
IGFkZCBzdXBwb3J0IGZvciBwd3JzZXEgc2VxdWVuY2luZwo+Pj4gICAgQmx1ZXRvb3RoOiBoY2lf
cWNhOiBtZXJnZSBxY2FfcG93ZXIgaW50byBxY2Ffc2VyZGV2Cj4+PiAgICBCbHVldG9vdGg6IGhj
aV9xY2E6IG1lcmdlIGluaXQgcGF0aHMKPj4+ICAgIEJsdWV0b290aDogaGNpX3FjYTogbWVyZ2Ug
cWNhX3Bvd2VyX29uIHdpdGggcWNhX3JlZ3VsYXRvcnNfaW5pdAo+Pj4gICAgQmx1ZXRvb3RoOiBo
Y2lfcWNhOiBmdXRoZXIgcmV3b3JrIG9mIHBvd2VyIG9uL29mZiBoYW5kbGluZwo+Pj4gICAgQmx1
ZXRvb3RoOiBoY2lfcWNhOiBhZGQgc3VwcG9ydCBmb3IgcHdyc2VxCj4+IAo+PiBhbnkgY2hhbmNl
IHlvdSBjYW4gdHJ5IHRvIGFiYW5kb24gcGF0Y2hpbmcgaGNpX3FjYS4gVGhlIHNlcmRldiBzdXBw
b3J0IGluIGhjaV91YXJ0IGlzIHJhdGhlciBoYWNraW5nIGludG8gb2xkIGxpbmUgZGlzY2lwbGlu
ZSBjb2RlIGFuZCBpdCBpcyBub3QgYWdpbmcgd2VsbC4gSXQgaXMgcmVhbGx5IGJlY29taW5nIGEg
bWVzcy4KPiAKPiBJIHdhbnRlZCB0byBzdGF5IGF3YXkgZnJvbSByZXdyaXRpbmcgdGhlIEJUIGNv
ZGUuIEJ1dC4uLiBOZXcgZHJpdmVyCj4gd291bGQgaGF2ZSBhIGJvbnVzIHBvaW50IHRoYXQgSSBk
b24ndCBoYXZlIHRvIGJlIGNvbXBhdGlibGUgd2l0aCBvbGQKPiBiaW5kaW5ncy4gSW4gZmFjdCB3
ZSBjYW4gZXZlbiBtYWtlIGl0IHRoZSBvdGhlciB3YXkgYXJvdW5kOiBsZXQgdGhlCj4gb2xkIGRy
aXZlciBhbHdheXMgdXNlIHJlZ3VsYXRvcnMgYW5kIG1ha2UgdGhlIG5ldyBkcml2ZXIgc3VwcG9y
dCBvbmx5Cj4gdGhlIHB3cnNlcS4gVGhlbiBpdCBzaG91bGQgYmUgcG9zc2libGUgdG8gZHJvcCB0
aGUgb2xkIGhjaV9xY2EgZHJpdmVyCj4gdG9nZXRoZXIgd2l0aCBkcm9wcGluZyB0aGUgb2xkIGJp
bmRpbmdzLgo+IAo+PiBJIHdvdWxkIHNheSB0aGF0IHRoZSBRdWFsY29tbSBzZXJpYWwgZGV2aWNl
cyBjb3VsZCB1c2UgYSBzZXBhcmF0ZSBzdGFuZGFsb25lIHNlcmRldiBkcml2ZXIuIEEgd2hpbGUg
SSBzZW5kIGFuIFJGQyBmb3IgYSBuZXcgc2VyZGV2IGRyaXZlci4KPj4gCj4+IGh0dHBzOi8vd3d3
LnNwaW5pY3MubmV0L2xpc3RzL2xpbnV4LWJsdWV0b290aC9tc2c3NDkxOC5odG1sCj4gCj4gQW55
IHJlYXNvbiB3aHkgeW91ciBkcml2ZXIgc3RheWVkIGFzIGFuIFJGQyBhbmQgbmV2ZXIgbWFkZSBp
dCBpbnRvIHRoZQo+IGtlcm5lbD8gRG8geW91IHBsYW4gdG8gcmV2aXZlIHlvdXIgb2xkIFJGQ3Mg
b24gSDo0IGFuZCBIOjU/CgpJIHdhcyBtaXNzaW5nIGVub3VnaCBoYXJkd2FyZSB0byB0ZXN0IGl0
IG9uIGFuZCBmcmFua2x5IEkgaG9wZWQgdGhhdCBzb21lb25lIHdvdWxkIHBpY2sgdXAgdGhpcyB3
b3JrLiBUaGUgSENJIGxpbmUgZGlzY2lwbGluZSDigJxoYWNr4oCdIG5lZWRzIHRvIGJlIHJlbW92
ZWQgc29vbi4gSXQgaXMgY29tcGxpY2F0ZWQsIGN1bWJlcnNvbWUgYW5kIGhhcyBhIGJ1bmNoIG9m
IGlzc3VlcyB3aXRoIGxvY2tpbmcuIE1pbmQgeW91IHRoYXQgb3JpZ2luYXRlZCBpbiAyLjQuNiBr
ZXJuZWwgYW5kIGlzIGF0IGl0cyBjb3JlIGJpdC1yb3R0aW5nLgoKSWYgeW91IG1hbmFnZSB0byBw
dXQgUUNBIHN1cHBvcnQgaW50byBhIHNlcGFyYXRlIGJ0cWNhdWFydCBkcml2ZXIsIHRoYXQgd291
bGQgYmUgYXdlc29tZS4gVGhlIGJ0bXRrdWFydCBkcml2ZXIgaXMgYW5vdGhlciBleGFtcGxlIHdo
ZXJlIE1lZGlhdGVrIGdvdCBpdHMgb3duIHNlcmRldiBiYXNlZCBkcml2ZXIuCgpSZWdhcmRzCgpN
YXJjZWwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
dGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
