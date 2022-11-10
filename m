Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EDB4C4332F
	for <ath10k@archiver.kernel.org>; Thu, 10 Nov 2022 02:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	CC:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4okY5GgA6MsvzXaB0oHl7kncrlN0mCbxrsYGbitRrvo=; b=Epfs8Pw0xkHl/nhPySHrhRXcCj
	MBa+BtR2Y56apCsAXduH9oBo6z2RFnBwvTyFV7ZaDKBUbHWK1VkxJ5YHMyWViXywmlLd/pe1x1tNE
	zhFC96GQ679aCGEfN1d9qoSo+fhb+VEpUzzi9sFe2GCimLuLoJuil63Lj/CPuFs7jiGWEe/dKcojM
	mNWb9N/3k+FYFpMoAgSK8lGpvI9Hff/Fwoj3kFKSJfiB3uMW+D5cePYigc+Rtzs0yVUfqn4Ko/K0F
	FvjYW5IR3fs2V1Z9zrjpieLIkjxtwYIwF85Dox8UBnwajjw7C0KkbdvnPi8il6nKvHd2/GUmWmISR
	UI1yMXkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osxhn-0027Zh-4q; Thu, 10 Nov 2022 02:54:15 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osxhk-0027ZB-Oc
	for ath10k@lists.infradead.org; Thu, 10 Nov 2022 02:54:14 +0000
Received: from dggpeml500023.china.huawei.com (unknown [172.30.72.55])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4N75yF3pdSz15MS4;
	Thu, 10 Nov 2022 10:53:57 +0800 (CST)
Received: from [10.67.110.112] (10.67.110.112) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 10 Nov 2022 10:54:10 +0800
Subject: Re: [PATCH] wifi: ath10k: Fix resource leak in ath10k_pci_init()
From: xiujianfeng <xiujianfeng@huawei.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>, <kvalo@kernel.org>,
	<davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <rmani@qti.qualcomm.com>
CC: <ath10k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20221108133858.53308-1-xiujianfeng@huawei.com>
 <4e81efea-23f1-e52c-b0b4-abf445ed5f15@quicinc.com>
 <cd3194f8-3cad-ce12-602f-8651e99365ab@huawei.com>
Message-ID: <fc6076c9-d61d-f404-61c1-d8df01ab93b9@huawei.com>
Date: Thu, 10 Nov 2022 10:54:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <cd3194f8-3cad-ce12-602f-8651e99365ab@huawei.com>
X-Originating-IP: [10.67.110.112]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpeml500023.china.huawei.com (7.185.36.114)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_185413_154178_748152ED 
X-CRM114-Status: GOOD (  16.96  )
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

SGksCgrlnKggMjAyMi8xMS8xMCA5OjU0LCB4aXVqaWFuZmVuZyDlhpnpgZM6Cj4gSGksCj4gCj4g
5ZyoIDIwMjIvMTEvMTAgMDozNCwgSmVmZiBKb2huc29uIOWGmemBkzoKPj4gT24gMTEvOC8yMDIy
IDU6MzggQU0sIFhpdSBKaWFuZmVuZyB3cm90ZToKPj4+IFdoZW4gYXRoMTBrX2FoYl9pbml0KCkg
ZmFpbHMsIGl0IGRvZXMgbm90IHVucmVnaXN0ZXIgYXRoMTBrX3BjaV9kcml2ZXIsCj4+PiB3aGlj
aCB3aWxsIGNhdXNlIGEgcmVzb3VyY2UgbGVhayBpc3N1ZSwgY2FsbCBwY2lfdW5yZWdpc3Rlcl9k
cml2ZXIoKSBpbgo+Pj4gdGhlIGVycm9yIHBhdGggdG8gZml4IHRoaXMgaXNzdWUuCj4+Pgo+Pj4g
Rml4ZXM6IDBiNTIzY2VkOWEzYyAoImF0aDEwazogYWRkIGJhc2ljIHNrZWxldG9uIHRvIHN1cHBv
cnQgYWhiIikKPj4+IFNpZ25lZC1vZmYtYnk6IFhpdSBKaWFuZmVuZyA8eGl1amlhbmZlbmdAaHVh
d2VpLmNvbT4KPj4+IC0tLQo+Pj4gwqAgZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9w
Y2kuYyB8IDQgKysrLQo+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgv
YXRoMTBrL3BjaS5jIAo+Pj4gYi9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL3BjaS5j
Cj4+PiBpbmRleCBlNTZjNmE2YjEzNzkuLjIyZjhmOGIyMDc2MiAxMDA2NDQKPj4+IC0tLSBhL2Ry
aXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvcGNpLmMKPj4+ICsrKyBiL2RyaXZlcnMvbmV0
L3dpcmVsZXNzL2F0aC9hdGgxMGsvcGNpLmMKPj4+IEBAIC0zODAwLDggKzM4MDAsMTAgQEAgc3Rh
dGljIGludCBfX2luaXQgYXRoMTBrX3BjaV9pbml0KHZvaWQpCj4+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCByZXQpOwo+Pj4gwqDCoMKgwqDCoCByZXQgPSBhdGgxMGtfYWhiX2lu
aXQoKTsKPj4+IC3CoMKgwqAgaWYgKHJldCkKPj4+ICvCoMKgwqAgaWYgKHJldCkgewo+Pj4gwqDC
oMKgwqDCoMKgwqDCoMKgIHByaW50ayhLRVJOX0VSUiAiYWhiIGluaXQgZmFpbGVkOiAlZFxuIiwg
cmV0KTsKPj4+ICvCoMKgwqDCoMKgwqDCoCBwY2lfdW5yZWdpc3Rlcl9kcml2ZXIoJmF0aDEwa19w
Y2lfZHJpdmVyKTsKPj4+ICvCoMKgwqAgfQo+Pj4gwqDCoMKgwqDCoCByZXR1cm4gcmV0Owo+Pj4g
wqAgfQo+Pgo+PiBpbW8gbmVpdGhlciB0aGUgZXhpc3RpbmcgY29kZSBub3IgdGhlIG1vZGlmaWVk
IGNvZGUgaXMgY29ycmVjdC4KPj4KPj4gdGhlIGRyaXZlciBpcyBhdHRlbXB0aW5nIHRvIHJlZ2lz
dGVyIHRvIHN1cHBvcnQgdHdvIGRpZmZlcmVudCBidXNlcy4KPj4KPj4gaWYgZWl0aGVyIG9mIHRo
ZXNlIGlzIHN1Y2Nlc3NmdWwgdGhlbiBhdGgxMGtfcGNpX2luaXQoKSBzaG91bGQgcmV0dXJuIAo+
PiAwIHNvIHRoYXQgaGFyZHdhcmUgYXR0YWNoZWQgdG8gdGhlIHN1Y2Nlc3NmdWwgYnVzIGNhbiBi
ZSBwcm9iZWQgYW5kIAo+PiBzdXBwb3J0ZWQuCj4+Cj4+IG9ubHkgaWYgYm90aCBvZiB0aGVzZSBh
cmUgdW5zdWNjZXNzZnVsIHNob3VsZCBhdGgxMGtfcGNpX2luaXQoKSByZXR1cm4gCj4+IGFuIGVy
cm5vLgo+Pgo+PiBzbyBJIHN1Z2dlc3QKPj4gwqDCoMKgwqDCoGludCByZXQxLCByZXQyOwo+Pgo+
PiDCoMKgwqDCoMKgcmV0MSA9IHBjaV9yZWdpc3Rlcl9kcml2ZXIoJmF0aDEwa19wY2lfZHJpdmVy
KTsKPj4gwqDCoMKgwqDCoGlmIChyZXQxKQo+PiDCoMKgwqDCoMKgwqDCoMKgIHByaW50ayhLRVJO
X0VSUiAiZmFpbGVkIHRvIHJlZ2lzdGVyIGF0aDEwayBwY2kgZHJpdmVyOiAlZFxuIiwKPj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldDEpOwo+Pgo+PiDCoMKgwqDCoMKgcmV0MiA9
IGF0aDEwa19haGJfaW5pdCgpOwo+PiDCoMKgwqDCoMKgaWYgKHJldDIpCj4+IMKgwqDCoMKgwqDC
oMKgwqAgcHJpbnRrKEtFUk5fRVJSICJhaGIgaW5pdCBmYWlsZWQ6ICVkXG4iLCByZXQyKTsKPj4K
Pj4gwqDCoMKgwqDCoGlmIChyZXQxICYmIHJldDIpCj4+IMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJu
IHJldDE7Cj4+Cj4+IMKgwqDCoMKgwqAvKiByZWdpc3RlcmVkIHRvIGF0IGxlYXN0IG9uZSBidXMg
Ki8KPj4gwqDCoMKgwqDCoHJldHVybiAwOwo+PiB9Cj4gCj4gVGhhbmtzLCB0aGlzIGlzIGJldHRl
ci4gaG93ZXZlciwgaWYgcGNpX3JlZ2lzdGVyX2RyaXZlcigpIHJldHVybnMgMAo+IHdoaWxlIGF0
aDEwa19haGJfaW5pdCgpIHJldHVybnMgZXJyb3IsIGl0J3MgYmV0dGVyIHRvIHVucmVnaXN0ZXIg
dGhlCj4gZmlyc3QgYnVzLCBoZXJlIGlzIG15IGFub3RoZXIgcHJvcG9zYWw6Cj4gCj4gIMKgwqDC
oMKgwqDCoCBpbnQgcmV0Owo+IAo+ICDCoMKgwqDCoMKgwqAgcmV0ID0gcGNpX3JlZ2lzdGVyX2Ry
aXZlcigmYXRoMTBrX3BjaV9kcml2ZXIpOwo+ICDCoMKgwqDCoMKgwqAgaWYgKHJldCkgewo+ICDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHByaW50ayhLRVJOX0VSUiAiZmFpbGVkIHRvIHJl
Z2lzdGVyIGF0aDEwayBwY2kgZHJpdmVyOiAKPiAlZFxuIiwKPiAgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldCk7Cj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgcmV0dXJuIHJldDsKPiAgwqDCoMKgwqDCoMKgIH0KPiAKPiAgwqDCoMKgwqDCoMKgIHJl
dCA9IGF0aDEwa19haGJfaW5pdCgpOwo+ICDCoMKgwqDCoMKgwqAgaWYgKHJldCkgewo+ICDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHByaW50ayhLRVJOX0VSUiAiYWhiIGluaXQgZmFpbGVk
OiAlZFxuIiwgcmV0KTsKPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwY2lfdW5yZWdp
c3Rlcl9kcml2ZXIoJmF0aDEwa19wY2lfZHJpdmVyKTsKPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCByZXR1cm4gcmV0Owo+ICDCoMKgwqDCoMKgwqAgfQo+IAo+ICDCoMKgwqDCoMKgwqAg
cmV0dXJuIDA7Cj4gCj4gSWYgeW91IGFncmVlLCBJIHdpbGwgc2VuZCB2MiB3aXRoIHRoaXMuCj4g
CgpTb3JyeSwgSSBtaXN1bmRlcnN0b29kLCBJIHdpbGwgc2VuZCB2MiBhY2NvcmRpbmcgdG8geW91
ciBzdWdnZXN0aW9uLgoKPj4KPj4gLgo+IAo+IC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
dGgxMGsK
