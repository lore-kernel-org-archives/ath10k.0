Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3799C4332F
	for <ath10k@archiver.kernel.org>; Thu, 10 Nov 2022 01:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fON4f6gbcjW7msD64ezyGjIDzRIKP98ps+hJHiIxPRk=; b=4Del5DNdhIbCI8DBgldPA0vJPf
	tnoVcVmU35G7C5tpp/neCbc9SsBgBohHTHTNyodmsR3tz7SXpNLJEixmfu0AJ09lQfJR+HESyH3nu
	hwVkKKTdVddyzfQk/sYFfbZKlUfj4WIgCxWvvTqW65oRVIHC1fGYw5sSKJ9fP6uz/2KhTVrkkkcN2
	Raue8/bsG/2leKz+dXYS+wvLbnhkOtyBGPLRI91xddanwGWlAyKeam673vWfH4gv+ePjoy4ndkiyf
	K8xiPZ8vtXp6gaKv2qhudHbrrwCEPFcR0xC4Cj7e34jKMJp0MFf3tLwmgjAAJP+Bh5xlJxxrFIAIn
	kgA0fDmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oswlj-001jYT-AL; Thu, 10 Nov 2022 01:54:15 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oswlf-001jXH-Ar
	for ath10k@lists.infradead.org; Thu, 10 Nov 2022 01:54:13 +0000
Received: from dggpeml500023.china.huawei.com (unknown [172.30.72.55])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4N74cw5wKgz15MW5;
	Thu, 10 Nov 2022 09:53:52 +0800 (CST)
Received: from [10.67.110.112] (10.67.110.112) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 10 Nov 2022 09:54:05 +0800
Subject: Re: [PATCH] wifi: ath10k: Fix resource leak in ath10k_pci_init()
To: Jeff Johnson <quic_jjohnson@quicinc.com>, <kvalo@kernel.org>,
	<davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <rmani@qti.qualcomm.com>
CC: <ath10k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20221108133858.53308-1-xiujianfeng@huawei.com>
 <4e81efea-23f1-e52c-b0b4-abf445ed5f15@quicinc.com>
From: xiujianfeng <xiujianfeng@huawei.com>
Message-ID: <cd3194f8-3cad-ce12-602f-8651e99365ab@huawei.com>
Date: Thu, 10 Nov 2022 09:54:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <4e81efea-23f1-e52c-b0b4-abf445ed5f15@quicinc.com>
X-Originating-IP: [10.67.110.112]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml500023.china.huawei.com (7.185.36.114)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_175411_741537_A8536AA6 
X-CRM114-Status: GOOD (  18.06  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

SGksCgrlnKggMjAyMi8xMS8xMCAwOjM0LCBKZWZmIEpvaG5zb24g5YaZ6YGTOgo+IE9uIDExLzgv
MjAyMiA1OjM4IEFNLCBYaXUgSmlhbmZlbmcgd3JvdGU6Cj4+IFdoZW4gYXRoMTBrX2FoYl9pbml0
KCkgZmFpbHMsIGl0IGRvZXMgbm90IHVucmVnaXN0ZXIgYXRoMTBrX3BjaV9kcml2ZXIsCj4+IHdo
aWNoIHdpbGwgY2F1c2UgYSByZXNvdXJjZSBsZWFrIGlzc3VlLCBjYWxsIHBjaV91bnJlZ2lzdGVy
X2RyaXZlcigpIGluCj4+IHRoZSBlcnJvciBwYXRoIHRvIGZpeCB0aGlzIGlzc3VlLgo+Pgo+PiBG
aXhlczogMGI1MjNjZWQ5YTNjICgiYXRoMTBrOiBhZGQgYmFzaWMgc2tlbGV0b24gdG8gc3VwcG9y
dCBhaGIiKQo+PiBTaWduZWQtb2ZmLWJ5OiBYaXUgSmlhbmZlbmcgPHhpdWppYW5mZW5nQGh1YXdl
aS5jb20+Cj4+IC0tLQo+PiDCoCBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL3BjaS5j
IHwgNCArKystCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsv
cGNpLmMgCj4+IGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9wY2kuYwo+PiBpbmRl
eCBlNTZjNmE2YjEzNzkuLjIyZjhmOGIyMDc2MiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9uZXQv
d2lyZWxlc3MvYXRoL2F0aDEway9wY2kuYwo+PiArKysgYi9kcml2ZXJzL25ldC93aXJlbGVzcy9h
dGgvYXRoMTBrL3BjaS5jCj4+IEBAIC0zODAwLDggKzM4MDAsMTAgQEAgc3RhdGljIGludCBfX2lu
aXQgYXRoMTBrX3BjaV9pbml0KHZvaWQpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHJldCk7Cj4+IMKgwqDCoMKgwqAgcmV0ID0gYXRoMTBrX2FoYl9pbml0KCk7Cj4+IC3CoMKg
wqAgaWYgKHJldCkKPj4gK8KgwqDCoCBpZiAocmV0KSB7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBw
cmludGsoS0VSTl9FUlIgImFoYiBpbml0IGZhaWxlZDogJWRcbiIsIHJldCk7Cj4+ICvCoMKgwqDC
oMKgwqDCoCBwY2lfdW5yZWdpc3Rlcl9kcml2ZXIoJmF0aDEwa19wY2lfZHJpdmVyKTsKPj4gK8Kg
wqDCoCB9Cj4+IMKgwqDCoMKgwqAgcmV0dXJuIHJldDsKPj4gwqAgfQo+IAo+IGltbyBuZWl0aGVy
IHRoZSBleGlzdGluZyBjb2RlIG5vciB0aGUgbW9kaWZpZWQgY29kZSBpcyBjb3JyZWN0Lgo+IAo+
IHRoZSBkcml2ZXIgaXMgYXR0ZW1wdGluZyB0byByZWdpc3RlciB0byBzdXBwb3J0IHR3byBkaWZm
ZXJlbnQgYnVzZXMuCj4gCj4gaWYgZWl0aGVyIG9mIHRoZXNlIGlzIHN1Y2Nlc3NmdWwgdGhlbiBh
dGgxMGtfcGNpX2luaXQoKSBzaG91bGQgcmV0dXJuIDAgCj4gc28gdGhhdCBoYXJkd2FyZSBhdHRh
Y2hlZCB0byB0aGUgc3VjY2Vzc2Z1bCBidXMgY2FuIGJlIHByb2JlZCBhbmQgCj4gc3VwcG9ydGVk
Lgo+IAo+IG9ubHkgaWYgYm90aCBvZiB0aGVzZSBhcmUgdW5zdWNjZXNzZnVsIHNob3VsZCBhdGgx
MGtfcGNpX2luaXQoKSByZXR1cm4gCj4gYW4gZXJybm8uCj4gCj4gc28gSSBzdWdnZXN0Cj4gIMKg
wqDCoMKgaW50IHJldDEsIHJldDI7Cj4gCj4gIMKgwqDCoMKgcmV0MSA9IHBjaV9yZWdpc3Rlcl9k
cml2ZXIoJmF0aDEwa19wY2lfZHJpdmVyKTsKPiAgwqDCoMKgwqBpZiAocmV0MSkKPiAgwqDCoMKg
wqDCoMKgwqAgcHJpbnRrKEtFUk5fRVJSICJmYWlsZWQgdG8gcmVnaXN0ZXIgYXRoMTBrIHBjaSBk
cml2ZXI6ICVkXG4iLAo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldDEpOwo+IAo+
ICDCoMKgwqDCoHJldDIgPSBhdGgxMGtfYWhiX2luaXQoKTsKPiAgwqDCoMKgwqBpZiAocmV0MikK
PiAgwqDCoMKgwqDCoMKgwqAgcHJpbnRrKEtFUk5fRVJSICJhaGIgaW5pdCBmYWlsZWQ6ICVkXG4i
LCByZXQyKTsKPiAKPiAgwqDCoMKgwqBpZiAocmV0MSAmJiByZXQyKQo+ICDCoMKgwqDCoMKgwqDC
oCByZXR1cm4gcmV0MTsKPiAKPiAgwqDCoMKgwqAvKiByZWdpc3RlcmVkIHRvIGF0IGxlYXN0IG9u
ZSBidXMgKi8KPiAgwqDCoMKgwqByZXR1cm4gMDsKPiB9CgpUaGFua3MsIHRoaXMgaXMgYmV0dGVy
LiBob3dldmVyLCBpZiBwY2lfcmVnaXN0ZXJfZHJpdmVyKCkgcmV0dXJucyAwCndoaWxlIGF0aDEw
a19haGJfaW5pdCgpIHJldHVybnMgZXJyb3IsIGl0J3MgYmV0dGVyIHRvIHVucmVnaXN0ZXIgdGhl
CmZpcnN0IGJ1cywgaGVyZSBpcyBteSBhbm90aGVyIHByb3Bvc2FsOgoKICAgICAgICAgaW50IHJl
dDsKCiAgICAgICAgIHJldCA9IHBjaV9yZWdpc3Rlcl9kcml2ZXIoJmF0aDEwa19wY2lfZHJpdmVy
KTsKICAgICAgICAgaWYgKHJldCkgewogICAgICAgICAgICAgICAgIHByaW50ayhLRVJOX0VSUiAi
ZmFpbGVkIHRvIHJlZ2lzdGVyIGF0aDEwayBwY2kgZHJpdmVyOiAKJWRcbiIsCiAgICAgICAgICAg
ICAgICAgICAgICAgIHJldCk7CiAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKICAgICAgICAg
fQoKICAgICAgICAgcmV0ID0gYXRoMTBrX2FoYl9pbml0KCk7CiAgICAgICAgIGlmIChyZXQpIHsK
ICAgICAgICAgICAgICAgICBwcmludGsoS0VSTl9FUlIgImFoYiBpbml0IGZhaWxlZDogJWRcbiIs
IHJldCk7CiAgICAgICAgICAgICAgICAgcGNpX3VucmVnaXN0ZXJfZHJpdmVyKCZhdGgxMGtfcGNp
X2RyaXZlcik7CiAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKICAgICAgICAgfQoKICAgICAg
ICAgcmV0dXJuIDA7CgpJZiB5b3UgYWdyZWUsIEkgd2lsbCBzZW5kIHYyIHdpdGggdGhpcy4KCj4g
Cj4gLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRo
MTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
