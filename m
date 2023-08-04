Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C72D0C001DF
	for <ath10k@archiver.kernel.org>; Fri,  4 Aug 2023 10:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7n/9en48IPi0nKb1TPE51m8feUBkyWWoyc00SS6tsm4=; b=c9+ZBlmxrNNTq1
	0gsqviW5LGn26rJxtGQyAeDAXy8AIfdcaUrTcAyY1YETxsGvAFvckzY3d/fqM/71nAIEy9Abr4RxW
	C9euaDYIf+7It7Oz9U7I9HkQWv0Yc5hO8146MFX9bFNVunC2A2LPiSy9JEhBUpohrmCOUYZ8bAXA8
	ynxXDAw0trRQlNBFiGapHuiEZS3C6b24HRUtzAbtVYe+nN+Smu2x6LM+zL6N+m9n+uMJQVbiMI6fE
	yw6RK6M3pDEFKC1YBIwqPnHCm4xzGLkacBX8rJlX/TRB3XQeqIQeb5GnBp9WqZnhe3NAOy206NGZq
	FdSt0iSjSi2YIA3JmxAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRsFz-00CDi1-0M;
	Fri, 04 Aug 2023 10:42:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRsFw-00CDfb-1X
	for ath10k@lists.infradead.org;
	Fri, 04 Aug 2023 10:42:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A369961F8F;
	Fri,  4 Aug 2023 10:42:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82D32C433C8;
	Fri,  4 Aug 2023 10:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1691145723;
	bh=59hgmRJD8zAuTk3rh1tJHpF7TPUjRvw1kVL7rArnwGQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ib/jpO1V7eA3W0EcATFyIw5XWVOQES+fu5HayAcWEThHr4QaMwvffcSMQWS9Xknl0
	 kRMIRlN/gV4bS1CR9W6ZGVYksBb0tffEcSpQ6Mef0oDHQQ9z/W645gG9802NA2wqax
	 Vke1W5cmN410suItALn8vbFgiBqW6QTsnauQhsgc=
Date: Fri, 4 Aug 2023 12:42:00 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ashwin Dayanand Kamat <kashwindayan@vmware.com>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Wen Gong <wgong@codeaurora.org>,
	Jouni Malinen <jouni@codeaurora.org>,
	Johannes Berg <johannes.berg@intel.com>, davem@davemloft.net,
	ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org, akaher@vmware.com, vsirnapalli@vmware.com,
	tkundu@vmware.com, namit@vmware.com
Subject: Re: [PATCH v4.19.y] ath10k: Fix TKIP Michael MIC verification for
 PCIe
Message-ID: <2023080431-cobweb-fidgeting-e4de@gregkh>
References: <1690971733-22270-1-git-send-email-kashwindayan@vmware.com>
 <2023080408-squad-pony-2638@gregkh>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2023080408-squad-pony-2638@gregkh>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_034204_567587_D0A7313E 
X-CRM114-Status: GOOD (  15.88  )
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

T24gRnJpLCBBdWcgMDQsIDIwMjMgYXQgMTI6Mjg6MThQTSArMDIwMCwgR3JlZyBLcm9haC1IYXJ0
bWFuIHdyb3RlOgo+IE9uIFdlZCwgQXVnIDAyLCAyMDIzIGF0IDAzOjUyOjEzUE0gKzA1MzAsIEFz
aHdpbiBEYXlhbmFuZCBLYW1hdCB3cm90ZToKPiA+IEZyb206IFdlbiBHb25nIDx3Z29uZ0Bjb2Rl
YXVyb3JhLm9yZz4KPiA+IAo+ID4gY29tbWl0IDBkYzI2N2IxM2YzYTdlODQyNGE4OTg4MTVkZDM1
NzIxMWI3MzczMzAgdXBzdHJlYW0uCj4gPiAKPiA+IFRLSVAgTWljaGFlbCBNSUMgd2FzIG5vdCB2
ZXJpZmllZCBwcm9wZXJseSBmb3IgUENJZSBjYXNlcyBzaW5jZSB0aGUKPiA+IHZhbGlkYXRpb24g
c3RlcHMgaW4gaWVlZTgwMjExX3J4X2hfbWljaGFlbF9taWNfdmVyaWZ5KCkgaW4gbWFjODAyMTEg
ZGlkCj4gPiBub3QgZ2V0IGZ1bGx5IGV4ZWN1dGVkIGR1ZSB0byB1bmV4cGVjdGVkIGZsYWcgdmFs
dWVzIGluCj4gPiBpZWVlODAyMTFfcnhfc3RhdHVzLgo+ID4gCj4gPiBGaXggdGhpcyBieSBzZXR0
aW5nIHRoZSBmbGFncyBwcm9wZXJ0eSB0byBtZWV0IG1hYzgwMjExIGV4cGVjdGF0aW9ucyBmb3IK
PiA+IHBlcmZvcm1pbmcgTWljaGFlbCBNSUMgdmFsaWRhdGlvbiB0aGVyZS4gVGhpcyBmaXhlcyBD
VkUtMjAyMC0yNjE0MS4gSXQKPiA+IGRvZXMgdGhlIHNhbWUgYXMgYXRoMTBrX2h0dF9yeF9wcm9j
X3J4X2luZF9obCgpIGZvciBTRElPIHdoaWNoIHBhc3NlZAo+ID4gTUlDIHZlcmlmaWNhdGlvbiBj
YXNlLiBUaGlzIGFwcGxpZXMgb25seSB0byBRQ0E2MTc0L1FDQTkzNzcgUENJZS4KPiA+IAo+ID4g
VGVzdGVkLW9uOiBRQ0E2MTc0IGh3My4yIFBDSSBXTEFOLlJNLjQuNC4xLTAwMTEwLVFDQVJNU1dQ
LTEKPiA+IAo+ID4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiA+IFNpZ25lZC1vZmYtYnk6
IFdlbiBHb25nIDx3Z29uZ0Bjb2RlYXVyb3JhLm9yZz4KPiA+IFNpZ25lZC1vZmYtYnk6IEpvdW5p
IE1hbGluZW4gPGpvdW5pQGNvZGVhdXJvcmEub3JnPgo+ID4gTGluazogaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvci8yMDIxMDUxMTIwMDExMC5jM2YxZDQyYzY3NDYuSTc5NTU5M2ZjYWFlOTQxYzQ3
MTQyNWI4YzdkNWY3YmIxODVkMjkxNDJAY2hhbmdlaWQKPiA+IFNpZ25lZC1vZmYtYnk6IEpvaGFu
bmVzIEJlcmcgPGpvaGFubmVzLmJlcmdAaW50ZWwuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogQXNo
d2luIERheWFuYW5kIEthbWF0IDxrYXNod2luZGF5YW5Adm13YXJlLmNvbT4KPiA+IC0tLQo+ID4g
IGRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvaHR0X3J4LmMgfCAxMCArKysrKysrKysr
Cj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykKPiA+IAo+IAo+IE5vdyBxdWV1
ZWQgdXAsIHRoYW5rcy4KCk5vcGUsIGJyZWFrcyB0aGUgYnVpbGQsIGhvdyBkaWQgeW91IHRlc3Qg
dGhpczoKCiAgQ0MgW01dICBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL2h0dF9yeC5v
CmRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvaHR0X3J4LmM6IEluIGZ1bmN0aW9uIOKA
mGF0aDEwa19odHRfcnhfaF9tcGR14oCZOgpkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBr
L2h0dF9yeC5jOjE2NDk6MjE6IGVycm9yOiDigJhmcmFn4oCZIHVuZGVjbGFyZWQgKGZpcnN0IHVz
ZSBpbiB0aGlzIGZ1bmN0aW9uKQogMTY0OSB8ICAgICAgICAgICAgICAgICBpZiAoZnJhZyAmJiAh
ZmlsbF9jcnlwdF9oZWFkZXIgJiYKICAgICAgfCAgICAgICAgICAgICAgICAgICAgIF5+fn4KCj4g
Cj4gZ3JlZyBrLWgKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
