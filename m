Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18139C433F5
	for <ath10k@archiver.kernel.org>; Sat, 27 Nov 2021 16:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:To:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0emWu1PLFUEeXIdgzC2JJUsMKoOViRKwG/MQY2Ls8Tg=; b=EYOcemXRKq5wVnRd68rDB4uyXL
	FDG1PIwo8AFsLgqlxfOQHSFl9BsfwsfW4Q1yqUUWDBQmmXKztX5/dadn8PAX/v6EpU8eWcW+NNjWL
	9Am6ViT6wl4gQUqn+V5gKwf5yNBn/hrpDPCCxIvGSIeZ5jTc7qpVpkt6xPPjy0fGOkaAXARRQFOZ0
	9qaR9f2ZM8K8fYjrMtmLSmfkYWhZoYl2WZoQvlwJY746YHH77/Xt9EKtVnkKJrb1gp5QkqPYaS+RB
	kIJDiHXCJ5mJ/zTK+pXL//DjYJExrZ21hYJNIlAwZ+hRB1qk5YPyr7n1jndoxc5bpqR8KgEDodb8h
	K3yDG6fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mr0gL-00E10H-8m; Sat, 27 Nov 2021 16:36:09 +0000
Received: from bda.space ([207.192.72.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mr0gG-00E0z9-DR
 for ath10k@lists.infradead.org; Sat, 27 Nov 2021 16:36:07 +0000
Message-ID: <7c093622-e798-3887-323e-781e2f70b0b8@bda.space>
Date: Sat, 27 Nov 2021 11:35:59 -0500
MIME-Version: 1.0
Content-Language: en-US
To: ath10k@lists.infradead.org
References: <1c160dfb-6ccc-b4d6-76f6-4364e0adb6dd@reox.at>
From: Bryce Allen <bryce@bda.space>
Subject: Re: Compex WLE200NX: regdomain sanitized regression
In-Reply-To: <1c160dfb-6ccc-b4d6-76f6-4364e0adb6dd@reox.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211127_083604_566392_770382AA 
X-CRM114-Status: GOOD (  21.37  )
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

SSBoYXZlIHRoaXMgaXNzdWUgb24gbXkgdHdvIHBjZW5naW5lcyBBUHMsIG9uZSBBTElYIGFuZCBv
bmUgQVBVMi4gSSAKY3JlYXRlZCBzb21lIGRrbXMgbW9kdWxlcyBmb3IgcGF0Y2hlZCBhdGg5ay8x
MGssIHNldHRpbmcgdGhlIHJlZ2RvbWFpbiAKdG8gQ1RSWV9ERUZBVUxUIHJhdGhlciB0aGFuIDB4
NjQuIEZvciBtZSB0aGlzIHJlc3VsdHMgaW4gVVMgcmVnaW9uLCBub3QgCnN1cmUgaWYgaXQgd2ls
bCBkbyB0aGUgcmlnaHQgdGhpbmcgaW4gb3RoZXIgcmVnaW9ucyBvciBub3QuIEJ1dCB5b3UgCmNv
dWxkIHVzZSB0aGlzIGFzIGEgc3RhcnRpbmcgcG9pbnQsIGFuZCB3YXkgYmV0dGVyIHRoYW4gcmVi
dWlsZGluZyAKa2VybmVsIGZyb20gc2NyYXRjaCBlYWNoIHRpbWU6CgpodHRwczovL2dpdGh1Yi5j
b20vYmQ0L2F0aHJlZ2QtZGttcwoKSSBjcmVhdGVkIHRyZWVzIGZvciA1LjEwIGZyb20gRGViaWFu
IEJ1bGxzZXllIGFuZCBmb3IgVWJ1bnR1IEhXRSA1LjExIAprZXJuZWwuIFRoaXMgaXMgYmFzZWQg
b24gdGlwcyBhbmQgREtNUyBjb25maWcgZnJvbSBzcGFya3M3MS4gQXQgb25lIApwb2ludCBJIHRy
aWVkIGEgcGF0Y2ggdGhhdCBhZGRlZCBhIHJlZ2lvbiBtb2R1bGUgcGFyYW1ldGVyLCBidXQgSSBn
b3QgCmtlcm5lbCBmYXVsdHMgYW5kIG5ldmVyIGdvdCBpdCB0byB3b3JrIC0gdGhlIENUUllfREVG
QVVMVCBmaXggd2FzIApzaW1wbGVyIGZvciBtZS4gWW91IGNhbiBzZWUgdGhlIHBhdGNoIGhlcmU6
CgpodHRwczovL2dpdGh1Yi5jb20vYmQ0L2F0aHJlZ2QtZGttcy9ibG9iL21haW4vcGF0Y2gtYXRo
LXNhbml0aXplLWRlZmF1bHQuZGlmZgoKLUJyeWNlCgpPbiAxMS8yNy8yMSAwMzoxNywgU2ViYXN0
aWFuIEJhY2htYW5uIHdyb3RlOgo+IEhlbGxvLAo+Cj4gSSByZWNlbnRseSB1cGdyYWRlZCBteSBE
ZWJpYW4gYmFzZWQgQVAgZnJvbSBidXN0ZXIgdG8gYnVsbHNleWUsIGp1c3QgCj4gdG8gZmluZCBv
dXQgdGhhdCBob3N0YXBkIGRvZXMgbm90IHdvcmsgYW55IG1vcmUsIGJlY2F1c2UgYWxsIDVHSHog
Cj4gY2hhbm5lbHMgYXJlIG1hcmtlZCBhcyBOby1JUi4gVGhpcyByZWdyZXNzaW9uIHdhcyBhbHJl
YWR5IGRpc2N1c3NlZCBvbiAKPiB0aGlzIE1MIGhlcmU6IAo+IGh0dHBzOi8vd3d3Lm1haWwtYXJj
aGl2ZS5jb20vYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcvbXNnMTIwMTguaHRtbAo+IGFuZCB0
aGVyZSBpcyBhbHNvIGFuIGVudHJ5IGluIERlYmlhbidzIGJ1ZyB0cmFja2VyIGZvciB0aGUgc2Ft
ZSBpc3N1ZTogCj4gaHR0cHM6Ly9idWdzLmRlYmlhbi5vcmcvOTU5ODIxCj4KPiBJIGhhdmUgYSBz
bGlnaHRseSBkaWZmZXJlbnQgY2FyZCAoYnJhbmRlZCBDb21wZXggV0xFMjAwTlgpOgo+IDA0OjAw
LjAgTmV0d29yayBjb250cm9sbGVyOiBRdWFsY29tbSBBdGhlcm9zIEFSOTI4WCBXaXJlbGVzcyBO
ZXR3b3JrIAo+IEFkYXB0ZXIgKFBDSS1FeHByZXNzKSAocmV2IDAxKQo+IMKgwqDCoMKgwqDCoMKg
IFN1YnN5c3RlbTogUXVhbGNvbW0gQXRoZXJvcyBBUjkyOFggV2lyZWxlc3MgTmV0d29yayBBZGFw
dGVyIAo+IChQQ0ktRXhwcmVzcykKPiDCoMKgwqDCoMKgwqDCoCBLZXJuZWwgZHJpdmVyIGluIHVz
ZTogYXRoOWsKPiDCoMKgwqDCoMKgwqDCoCBLZXJuZWwgbW9kdWxlczogYXRoOWsKPgo+IEJ1dCBh
cyB5b3UgY2FuIHNlZSwgYWxzbyB0aGUgRUVQUk9NIGdldHMgc2FuaXRpemVkOgo+IFvCoMKgIDE1
LjQ2MTc1NV0gYXRoOWsgMDAwMDowNDowMC4wOiBlbmFibGluZyBkZXZpY2UgKDAwMDAgLT4gMDAw
MikKPiBbwqDCoCAxNS45MTE2MDBdIGF0aDogRUVQUk9NIHJlZ2RvbWFpbiBzYW5pdGl6ZWQKPiBb
wqDCoCAxNS45MTE2MTJdIGF0aDogRUVQUk9NIHJlZ2RvbWFpbjogMHg2NAo+IFvCoMKgIDE1Ljkx
MTYxNV0gYXRoOiBFRVBST00gaW5kaWNhdGVzIHdlIHNob3VsZCBleHBlY3QgYSBkaXJlY3QgcmVn
cGFpciAKPiBtYXAKPiBbwqDCoCAxNS45MTE2MjVdIGF0aDogQ291bnRyeSBhbHBoYTIgYmVpbmcg
dXNlZDogMDAKPiBbwqDCoCAxNS45MTE2MjhdIGF0aDogUmVncGFpciB1c2VkOiAweDY0Cj4KPiBJ
IHJlYWQgaW4gdGhlIG90aGVyIHRocmVhZCwgdGhhdCB0aGlzIGlzIGEgcmVncmVzc2lvbiwgYnV0
IHRoZSBhY3R1YWwgCj4gY29tbWl0IGNhdXNpbmcgaXQgd2FzIG5ldmVyIHJldmVydGVkLgo+IEkg
dHJpZWQgdG8gc2VhcmNoIGZvciBuZXdlciBtZXNzYWdlcyBleHBsYWluaW5nIHRoZSBpc3N1ZSwg
aG93ZXZlciBhcyAKPiBmYXIgYXMgSSBjYW4gdGVsbCwgdGhlIHRocmVhZCBlbmRzIGluIEp1bmUg
MjAyMCB3aXRoIG5vIHNvbHV0aW9uIAo+IGF2YWlsYWJsZS4KPgo+IFRoZXJlZm9yZSwgSSBraW5k
bHkgd2FudCB0byBhc2sgaWYgdGhlcmUgaXMgYW55IHdvcmthcm91bmQgYXZhaWxhYmxlIAo+IHRv
IHJlLWVuYWJsZSA1R0h6IGNoYW5uZWxzIGluIEFQIG1vZGUgZm9yIG15IGNhcmQ/IChleHBlY3Qg
c3RpY2tpbmcgdG8gCj4gYSBwcmUtNS42IGtlcm5lbCBvciBtYW51YWxseSBwYXRjaGluZyBhbmQg
cmVjb21waWxpbmcgYXRoKQo+Cj4gQmVzdCwKPiBTZWJhc3RpYW4KPgo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYXRoMTBrIG1haWxpbmcgbGlzdAo+
IGF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hdGgxMGsKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBr
Cg==
