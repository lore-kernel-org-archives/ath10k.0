Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73439C25B48
	for <ath10k@archiver.kernel.org>; Wed, 25 Oct 2023 01:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mk6idMRK4nbubEUTp08D5WryVGchsRqtGxJ74inL/Js=; b=OGwToZFHW0F/+S
	x83r2bEUD4bMkk+PlUM2ekCJUFd6KvxovZinnHFA/E8OkkJXVsojrGLswkpZkHdfPwUpHeMj32gVT
	XI/1rY+MXBE37XcMLLPclanX4KZXhcO84U+BFpyje+fQEV2LVaoHlAhVOj6aGKjzH7gl0sqNUnXBy
	E1PNA17/KMfpmePQGEsly0NIaH/fHpCGSgKj4SmNkO7EgCvUpiwLs5bX5F0asp+lBG5QqvgRQu9uA
	dfogK8cV8g5M8ujPcHmON+QPFXAtJ3wceNVJ7as2GzBaBxjzEGOngbP+H1dhiIANeZzGOtV5FOxY3
	GL2TZbKF7a3d7fLA4OeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvSMU-00B76L-2D;
	Wed, 25 Oct 2023 01:07:06 +0000
Received: from omta040.useast.a.cloudfilter.net ([44.202.169.39])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvSMS-00B75r-1L
	for ath10k@lists.infradead.org;
	Wed, 25 Oct 2023 01:07:06 +0000
Received: from eig-obgw-5007a.ext.cloudfilter.net ([10.0.29.141])
	by cmsmtp with ESMTPS
	id vLkHqpfrd6nOZvSMPqLT8Q; Wed, 25 Oct 2023 01:07:01 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id vSMOqGbL56uHPvSMPqkV4n; Wed, 25 Oct 2023 01:07:01 +0000
X-Authority-Analysis: v=2.4 cv=TuH1ORbh c=1 sm=1 tr=0 ts=65386a35
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=WzbPXH4gqzPVN0x6HrNMNA==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=_mNlVl-r0hj7kTaC:21 a=IkcTkHD0fZMA:10 a=bhdUkHdE2iEA:10 a=wYkD_t78qR0A:10
 a=VwQbUJbxAAAA:8 a=stkexhm8AAAA:8 a=_Wotqz80AAAA:8 a=jR2mby-O1imw8BYHV3QA:9
 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22 a=pIW3pCRaVxJDc-hWtpF8:22
 a=buJP51TR1BpY-zbLSsyS:22 a=N_l3Vs37sht3-TxgB6J7:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jgueludWkZgknBALxo52tKnH1XcORBXqsInq+hMs+AA=; b=cVl4Aqq/QtjRsb9reVAKMjUA4b
	JxcileGUcoYCD5yZH1ZltbFYWLZHYo+EiooYvbdsktidvQqdNwWQxu9GLFzQd2VSKbGU5AO3TmHSa
	0OMAd7+7NRrRfcS+bDX/+jUSSb/MwVrTH7jQNRZCKEa/SXldSeJ1/H0BLtvEgyR7JGGVQ4YWnCWCJ
	klr2NqBRUoy6vu/GSdrXewRjfTA4ifuHKV8sCelFrzmJateexgzbTw2y8/NTSAg+RwXQbR7Hynmpl
	CyeTj6OFXGqO0PAeDC74NNODEmtLVuOiCgW7m4vZ6BeLDuPKEO6AxLmQ4HiVIRSFEreVNdZ2UUsiW
	zXMsqVgg==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:48400 helo=[192.168.15.10])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <gustavo@embeddedor.com>)
	id 1qvSMO-001oyw-0H;
	Tue, 24 Oct 2023 20:07:00 -0500
Message-ID: <e19b9dcc-99d0-414d-95ef-69149daedaa9@embeddedor.com>
Date: Tue, 24 Oct 2023 19:06:58 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC - is this a bug?] wifi: ath10k: Asking for some light on
 this, please :)
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>,
 Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-hardening@vger.kernel.org
References: <626ae2e7-66f8-423b-b17f-e75c1a6d29b3@embeddedor.com>
In-Reply-To: <626ae2e7-66f8-423b-b17f-e75c1a6d29b3@embeddedor.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.21.192
X-Source-L: No
X-Exim-ID: 1qvSMO-001oyw-0H
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.10]) [187.162.21.192]:48400
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 5
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfEAboCTIzWzRSE4Wv2OmChVekYAj1hWZk7Oc6xVO6X30CTuM8iiFxvVY1yoozol6UlcCxtsc/6m1z7FzKnCR7s/b1Crx3WPT1ybCESBbzxh/tHhOp7EY
 Jda5FTaGKwL58VCn+IqQ/1/4TIbju5PbLyxqJUnEaOWk+6U0jOTIKBipd5zHvajWdiLldaVJCmdfgJw+8Mk3kNpz45zEV2haMdlf1PHi054xVGDJH6fHF+tn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_180704_577509_76A6CE75 
X-CRM114-Status: GOOD (  11.49  )
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

WytDQyBNYW5pa2FudGEgUHViYmlzZXR0eSBdCgpBcyBKb2hhbm5lc1sxXSBwb2ludGVkIG91dCwg
dGhpcyBgbWVtc2V0KClgIGlzIHByb2JhYmx5IHVubmVjZXNzYXJ5OgoKLi9kcml2ZXJzL25ldC93
aXJlbGVzcy9hdGgvYXRoMTBrL3dtaS5jOgo4OTIwICAgICAgICAgbWVtc2V0KHNrYi0+ZGF0YSwg
MCwgc2l6ZW9mKCpjbWQpKTsKCkhvd2V2ZXIsIHRoZSBzYW1lIGV4YWN0IGlzc3VlWzJdIGlzIHBy
ZXNlbnQgYXQgdGhlIGxpbmUgYmVsb3cgaW5zaWRlCmZ1bmN0aW9uIGBhdGgxMGtfd21pX2FsbG9j
X3NrYigpYDoKCmRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvd21pLmM6CjE3OTkgICAg
ICAgICBtZW1zZXQoc2tiLT5kYXRhLCAwLCByb3VuZF9sZW4pOwoKClRoYW5rcwotLQpHdXN0YXZv
CgpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtaGFyZGVuaW5nLzI2YjE1ZjQ3MDJj
ZWYxN2ZlNzBiNDk2YTYyZjAzNzM1ODc0YmQxNmEuY2FtZWxAc2lwc29sdXRpb25zLm5ldC8KWzJd
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWhhcmRlbmluZy8wN2U5YmIwNC1mOWZjLTQ2
ZDUtYmZiOS1hMDBhNjNhNzA3YzBAZW1iZWRkZWRvci5jb20vCgpPbiAxMC8yNC8yMyAxMzo1MCwg
R3VzdGF2byBBLiBSLiBTaWx2YSB3cm90ZToKPiBIaSBhbGwsCj4gCj4gV2hpbGUgd29ya2luZyBv
biB0cmFuZm9ybWluZyBvbmUtZWxlbWVudCBhcnJheSBgcGVlcl9jaGFuX2xpc3RgIGluCj4gYHN0
cnVjdCB3bWlfdGRsc19wZWVyX2NhcGFiaWxpdGllc2AgaW50byBhIGZsZXgtYXJyYXkgbWVtYmVy
Cj4gCj4gNzE4NyBzdHJ1Y3Qgd21pX3RkbHNfcGVlcl9jYXBhYmlsaXRpZXMgewo+IC4uLgo+IDcx
OTnCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCB3bWlfY2hhbm5lbCBwZWVyX2NoYW5fbGlzdFsxXTsK
PiA3MjAwIH0gX19wYWNrZWQ7Cj4gCj4gdGhlIGZvbGxvd2luZyBsaW5lIGNhdWdodCBteSBhdHRl
bnRpb246Cj4gCj4gLi9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL3dtaS5jOgo+IDg5
MjDCoMKgwqDCoMKgwqDCoMKgIG1lbXNldChza2ItPmRhdGEsIDAsIHNpemVvZigqY21kKSk7Cj4g
Cj4gTm90aWNlIHRoYXQgYmVmb3JlIHRoZSBmbGV4LWFycmF5IHRyYW5zZm9ybWF0aW9uLCB3ZSBh
cmUgemVyb2luZyAxMjgKPiBieXRlcyBpbiBgc2tiLT5kYXRhYCBiZWNhdXNlIGBzaXplb2YoKmNt
ZCkgPT0gMTI4YCwgc2VlIGJlbG93Ogo+IAo+ICQgcGFob2xlIC1DIHdtaV8xMF80X3RkbHNfcGVl
cl91cGRhdGVfY21kIGRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvd21pLm8KPiBzdHJ1
Y3Qgd21pXzEwXzRfdGRsc19wZWVyX3VwZGF0ZV9jbWQgewo+ICDCoMKgwqDCoF9fbGUzMsKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdmRldl9pZDvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAvKsKgwqDCoMKgIDDCoMKgwqDCoCA0ICovCj4gIMKgwqDCoMKgc3RydWN0
IHdtaV9tYWNfYWRkcsKgwqDCoMKgwqDCoMKgIHBlZXJfbWFjYWRkcjvCoMKgwqDCoMKgwqDCoMKg
IC8qwqDCoMKgwqAgNMKgwqDCoMKgIDggKi8KPiAgwqDCoMKgwqBfX2xlMzLCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBlZXJfc3RhdGU7wqDCoMKgwqDCoMKgwqDCoMKg
wqAgLyrCoMKgwqAgMTLCoMKgwqDCoCA0ICovCj4gIMKgwqDCoMKgX19sZTMywqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXNlcnZlZFs0XTvCoMKgwqDCoMKgwqDCoMKg
wqAgLyrCoMKgwqAgMTbCoMKgwqAgMTYgKi8KPiAgwqDCoMKgwqBzdHJ1Y3Qgd21pX3RkbHNfcGVl
cl9jYXBhYmlsaXRpZXMgcGVlcl9jYXBhYjvCoMKgwqAgLyrCoMKgwqAgMzLCoMKgwqAgOTYgKi8K
PiAKPiAgwqDCoMKgwqAvKiBzaXplOiAxMjgsIGNhY2hlbGluZXM6IDIsIG1lbWJlcnM6IDUgKi8K
PiB9Owo+IAo+IFNvLCBhZnRlciB0aGUgZmxleC1hcnJheSB0cmFuc2Zvcm1hdGlvbiAoYW5kIHRo
ZSBuZWNlc3NhcnkgYWRqdXN0bWVudHMKPiB0byBhIGZldyBvdGhlciBsaW5lcyBvZiBjb2RlKSB3
ZSB3b3VsZCBiZSB6ZXJvaW5nIDEwNCBieXRlcyBpbgo+IGBza2ItPmRhdGFgIGJlY2F1c2UgYHNp
emVvZigqY21kKSA9PSAxMDRgLCBzZWUgYmVsb3c6Cj4gCj4gJCBwYWhvbGUgLUMgd21pXzEwXzRf
dGRsc19wZWVyX3VwZGF0ZV9jbWQgZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway93bWku
bwo+IHN0cnVjdCB3bWlfMTBfNF90ZGxzX3BlZXJfdXBkYXRlX2NtZCB7Cj4gIMKgwqDCoMKgX19s
ZTMywqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2ZGV2X2lkO8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qwqDCoMKgwqAgMMKgwqDCoMKgIDQgKi8KPiAgwqDCoMKg
wqBzdHJ1Y3Qgd21pX21hY19hZGRywqDCoMKgwqDCoMKgwqAgcGVlcl9tYWNhZGRyO8KgwqDCoMKg
wqDCoMKgwqAgLyrCoMKgwqDCoCA0wqDCoMKgwqAgOCAqLwo+ICDCoMKgwqDCoF9fbGUzMsKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGVlcl9zdGF0ZTvCoMKgwqDCoMKg
wqDCoMKgwqDCoCAvKsKgwqDCoCAxMsKgwqDCoMKgIDQgKi8KPiAgwqDCoMKgwqBfX2xlMzLCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlc2VydmVkWzRdO8KgwqDCoMKg
wqDCoMKgwqDCoCAvKsKgwqDCoCAxNsKgwqDCoCAxNiAqLwo+ICDCoMKgwqDCoHN0cnVjdCB3bWlf
dGRsc19wZWVyX2NhcGFiaWxpdGllcyBwZWVyX2NhcGFiO8KgwqDCoCAvKsKgwqDCoCAzMsKgwqDC
oCA3MiAqLwo+IAo+ICDCoMKgwqDCoC8qIHNpemU6IDEwNCwgY2FjaGVsaW5lczogMiwgbWVtYmVy
czogNSAqLwo+ICDCoMKgwqDCoC8qIGxhc3QgY2FjaGVsaW5lOiA0MCBieXRlcyAqLwo+IH07Cj4g
Cj4gVGhpcyBkaWZmZXJlbmNlIGFyaXNlcyBiZWNhdXNlIHRoZSBzaXplIG9mIHRoZSBlbGVtZW50
IHR5cGUgZm9yIHRoZQo+IGBwZWVyX2NoYW5fbGlzdGAgYXJyYXksIHdoaWNoIGlzIGBzaXplb2Yo
c3RydWN0IHdtaV9jaGFubmVsKSA9PSAyNCBgCj4gCj4gJCBwYWhvbGUgLUMgd21pX2NoYW5uZWwg
ZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway93bWkubwo+IHN0cnVjdCB3bWlfY2hhbm5l
bCB7Cj4gIMKgwqDCoMKgX19sZTMywqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBtaHo7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKsKgwqDCoMKgIDDC
oMKgwqDCoCA0ICovCj4gIMKgwqDCoMKgX19sZTMywqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBiYW5kX2NlbnRlcl9mcmVxMTvCoMKgwqAgLyrCoMKgwqDCoCA0wqDCoMKg
wqAgNCAqLwo+ICDCoMKgwqDCoF9fbGUzMsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgYmFuZF9jZW50ZXJfZnJlcTI7wqDCoMKgIC8qwqDCoMKgwqAgOMKgwqDCoMKgIDQg
Ki8KPiAKPiBbLi5dCj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qwqDC
oMKgIDIwwqDCoMKgwqAgNCAqLwo+IAo+ICDCoMKgwqDCoC8qIHNpemU6IDI0LCBjYWNoZWxpbmVz
OiAxLCBtZW1iZXJzOiA2ICovCj4gIMKgwqDCoMKgLyogbGFzdCBjYWNoZWxpbmU6IDI0IGJ5dGVz
ICovCj4gfTsKPiAKPiBpcyBpbmNsdWRlZCBpbiBgc2l6ZW9mKCpjbWQpYCBiZWZvcmUgdGhlIHRy
YW5zZm9ybWF0aW9uLgo+IAo+IFNvLCBteSBxdWVzdGlvbiBpczogZG8gd2UgcmVhbGx5IG5lZWQg
dG8gemVybyBvdXQgdGhvc2UgZXh0cmEgMjQgYnl0ZXMgaW4KPiBgc2tiLT5kYXRhYD8gb3IgaXMg
aXQgcmF0aGVyIGEgYnVnIGluIHRoZSBvcmlnaW5hbCBjb2RlPwo+IAo+IFRoYW5rcyEKPiAtLSAK
PiBHdXN0YXZvCj4gCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
