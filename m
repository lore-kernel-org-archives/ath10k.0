Return-Path: <SRS0=svwy=P4=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EA7DC433F5
	for <ath10k@archiver.kernel.org>; Tue,  9 Nov 2021 08:53:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 432D56117A
	for <ath10k@archiver.kernel.org>; Tue,  9 Nov 2021 08:53:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 432D56117A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xBrmDyfGCJhQPwi5zsvIZjYc8d8shPq3nGqSJrcYLzE=; b=PCTd7rioU+5FJY
	mwTT5BTr0En34aU0WtgiUYxNBaV9ifa1zCp8B0+pRGB/tVN8kydYpg4+4b1ZIGGKN0PY+SHhV/YRi
	5SWLVStdKUSvv0tKBic8/CKJZPXU4GaSkOar3TKGRd5w5llWLaT4gWuBYE4zb9/YY3SLWnlUrBcvx
	cGlI+eRyPbYfzJ2lwelAiMMGC/+Uw4gMkL/lldVRHZvhwRXB2ywZnmwVAZ06Qq5xi10/oVkE2YoHU
	derTpP781KVZgJrBzyOXUpLTQY+j9ra2jpJQyAP9YeenaoNXZGWy7nNvmRmEBTR4F4rAxlkMrW2eA
	4/EjhyM7/R8S9iwQLl2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkMse-0016WS-A1; Tue, 09 Nov 2021 08:53:24 +0000
Received: from wp530.webpack.hosteurope.de ([2a01:488:42:1000:50ed:8234::])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkMsY-0016V7-Vm
 for ath10k@lists.infradead.org; Tue, 09 Nov 2021 08:53:22 +0000
Received: from ip4d173d4a.dynamic.kabel-deutschland.de ([77.23.61.74]
 helo=[192.168.66.200]); authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1mkMsU-0004Q1-88; Tue, 09 Nov 2021 09:53:14 +0100
Message-ID: <27297ff6-d970-7b9a-01f0-d5261d553e6b@leemhuis.info>
Date: Tue, 9 Nov 2021 09:53:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: [PATCH] ath10k: abstract htt_rx_desc structure
To: Francesco Magliocca <franciman12@gmail.com>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, enrico@fracta.dev
References: <CAH4F6us6kLs4WZVKVNQV69wZ=BA2AzOyacyKLB3RfVme=9uKvA@mail.gmail.com>
Content-Language: en-BW
In-Reply-To: <CAH4F6us6kLs4WZVKVNQV69wZ=BA2AzOyacyKLB3RfVme=9uKvA@mail.gmail.com>
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1636447999;
 4d9990b3; 
X-HE-SMSGID: 1mkMsU-0004Q1-88
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_005319_233353_600D1DE5 
X-CRM114-Status: GOOD (  20.40  )
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

T24gMDguMTEuMjEgMTc6MjUsIEZyYW5jZXNjbyBNYWdsaW9jY2Egd3JvdGU6Cj4gUUNBNjE3NCBj
YXJkIG9mdGVuIGhhbmdzIHdpdGggdGhlIGN1cnJlbnQgaHR0X3J4X2Rlc2MKPiBtZW1vcnkgbGF5
b3V0IGluIHNvbWUgY2lyY3Vtc3RhbmNlcywgYmVjYXVzZSBpdHMgZmlybXdhcmUKPiBmYWlscyB0
byBoYW5kbGUgbGVuZ3RoIGRpZmZlcmVuY2VzLgo+IFRoZXJlZm9yZSB3ZSBtdXN0IGFic3RyYWN0
IHRoZSBodHRfcnhfZGVzYyBzdHJ1Y3R1cmUKPiBhbmQgb3BlcmF0aW9ucyBvbiBpdCwgdG8gYWxs
b3cgZGlmZmVyZW50IHdpcmVsZXNzIGNhcmRzCj4gdG8gdXNlIGRpZmZlcmVudCwgdW5yZWxhdGVk
IHJ4IGRlc2NyaXB0b3Igc3RydWN0dXJlcy4KPiAKPiBEZWZpbmUgYSBiYXNlIGh0dF9yeF9kZXNj
IHN0cnVjdHVyZSBhbmQgaHR0X3J4X2Rlc2NfcWNhX29sZAo+IGZvciB1c2Ugd2l0aCB0aGUgUUNB
IGZhbWlseSBvZiBhdGgxMGsgc3VwcG9ydGVkIGNhcmRzCj4gYW5kIGh0dF9yeF9kZXNjX25ldyBm
b3IgdXNlIHdpdGggdGhlIFdDTjM5OTAgY2FyZC4KPiAKPiBEZWZpbmUgaHR0X3J4X2Rlc2Nfb3Bz
IHdoaWNoIGNvbnRhaW5zIHRoZSBhYnN0cmFjdCBvcGVyYXRpb25zCj4gdG8gYWNjZXNzIHRoZSBn
ZW5lcmljIGh0dF9yeF9kZXNjLCBnaXZlIGltcGxlbWVudGF0aW9ucwo+IGZvciBlYWNoIGNhcmQg
YW5kIHVwZGF0ZSBodHRfcnguYyB0byB1c2UgdGhlIGRlZmluZWQKPiBhYnN0cmFjdCBpbnRlcmZh
Y2UgdG8gcnggZGVzY3JpcHRvcnMuCj4gCj4gRml4ZXM6IGUzZGVmNmY3ICgiYXRoMTBrOiBVcGRh
dGUgcnggZGVzY3JpcHRvciBmb3IgV0NOMzk5MCB0YXJnZXQiKQo+IAo+IFRlc3RlZC1vbjogUUNB
NjE3NCBodzMuMiBQQ0kgV0xBTi5STS40LjQuMS0wMDE1Ny1RQ0FSTVNXUFotMQo+IAo+IENvLWRl
dmVsb3BlZC1ieTogRW5yaWNvIEx1bWV0dGkgPGVucmljb0BmcmFjdGEuZGV2Pgo+IFNpZ25lZC1v
ZmYtYnk6IEVucmljbyBMdW1ldHRpIDxlbnJpY29AZnJhY3RhLmRldj4KPiBTaWduZWQtb2ZmLWJ5
OiBGcmFuY2VzY28gTWFnbGlvY2NhIDxmcmFuY2ltYW4xMkBnbWFpbC5jb20+CgpBcyBhIExpbnV4
IGtlcm5lbCByZWdyZXNzaW9uIHRyYWNrZXIgbGV0IG1lIHVzZSB0aGlzIG9wcG9ydHVuaXR5IGFu
ZApzYXk6IFRoYW5rcyBmb3Igd29ya2luZyBvbiBhIGZpeCBmb3IgdGhpcyByZWdyZXNzaW9uLgoK
VGhlcmUgaXMgb25lIHNtYWxsIGRldGFpbCB0aGF0IGNvdWxkIGJlIGltcHJvdmVkOiB0aGUgY29t
bWl0IG1lc3NhZ2UKd291bGQgYmVuZWZpdCBmcm9tIGEgbGluayB0byB0aGUgcmVncmVzc2lvbiBy
ZXBvcnQuIFRoaXMgaXMgZXhwbGFpbmVkIGluCkRvY3VtZW50YXRpb24vcHJvY2Vzcy9zdWJtaXR0
aW5nLXBhdGNoZXMucnN0LCB3aGljaCByZWNlbnRseSB3YXMgY2hhbmdlZApzbGlnaHRseSB0byBt
YWtlIHRoaXMgYXNwZWN0IGNsZWFyZXI6Cmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvbGludXMvMWY1
N2JkNDJiNzdjCgpFLmcuIGFkZCBzb21ldGhpbmcgbGlrZSB0aGlzLCBqdXN0ICp3aXRob3V0KiB0
aGUgbGVhZGluZyBjYXJldCjCuSk6CgpeTGluazoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYXRo
MTBrL0NBSDRGNnVzRnU4LUE2azVaN3JVOV9faUVOY1NDNlpyLU50UmhoX2F5cFI3NFV2TjF1UUBt
YWlsLmdtYWlsLmNvbS8KCkZyYW5jZXNjbywgY291bGQgeW91IHBsZWFzZSBkbyB0aGlzIGluIGNh
c2UgeW91IG5lZWQgdG8gc2VudCBhbiBpbXByb3ZlZAp2ZXJzaW9uIGZvciBvdGhlciByZWFzb25z
PyBBbmQgaWYgdGhlIHBhdGNoIGlzIGFscmVhZHkgZ29vZCB0byBnbzogY291bGQKdGhlIHN1YnN5
c3RlbSBtYWludGFpbmVyIHBsZWFzZSBhZGQgaXQgd2hlbiBhcHBseWluZz8KClRoYW5rcyBpbiBh
ZHZhbmNlLgoKTGV0IG1lIHVzZSB0aGlzIG9wcG9ydHVuaXR5IHRvIGV4cGxhaW4gd2h5IEknbSBh
c2tpbmcgZm9yIHRoaXMuIFllcywKdGhhdCBsaW5rIGlzIG5vdCByZWFsbHkgY3J1Y2lhbDsgYnV0
IGl0J3MgZ29vZCB0byBoYXZlIGlmIHNvbWVvbmUgbmVlZHMKdG8gbG9vayBpbnRvIHRoZSBiYWNr
c3Rvcnkgb2YgdGhpcyBjaGFuZ2Ugc29tZXRpbWUgaW4gdGhlIGZ1dHVyZS4gQnV0IEkKY2FyZSBm
b3IgYSBkaWZmZXJlbnQgcmVhc29uLiBJJ20gdHJhY2tpbmcgdGhpcyByZWdyZXNzaW9uIChhbmQg
b3RoZXJzKQp3aXRoIHJlZ3pib3QsIG15IExpbnV4IGtlcm5lbCByZWdyZXNzaW9uIHRyYWNraW5n
IGJvdC4gVGhpcyBib3Qgd2lsbApub3RpY2UgaWYgYSBwYXRjaCB3aXRoIGEgTGluazogdGFnIHRv
IGEgdHJhY2tlZCByZWdyZXNzaW9uIGdldHMgcG9zdGVkCmFuZCByZWNvcmQgdGhhdCwgd2hpY2gg
YWxsb3dlZCBhbnlvbmUgbG9va2luZyBpbnRvIGEgcmVncmVzc2lvbiB0bwpxdWlja2x5IGdhc3Ag
dGhlIGN1cnJlbnQgc3RhdHVzIGZyb20gdGhlIHJlZ3pib3Qgd2VidWkowrIpIG9yIGl0cwpyZXBv
cnRzLiBUaGUgYm90IHdpbGwgYWxzbyBub3RpY2UgaWYgYSBjb21taXQgd2l0aCBhIExpbms6IHRh
ZyB0byBhCnJlZ3Jlc3Npb24gcmVwb3J0IGlzIGFwcGxpZWQgYnkgTGludXMgYW5kIHRoZW4gYXV0
b21hdGljYWxseSBtYXJrIHRoZQpyZWdyZXNzaW9uIGFzIHJlc29sdmVkIHRoZW4uCgpJT1c6IHRo
aXMgdGFnIG1ha2VzIG15IGxpZmUgZWFzaWVyLCBhcyBJIG90aGVyd2lzZSBoYXZlIHRvIHRlbGwg
cmVnemJvdAptYW51YWxseSBhYm91dCB0aGUgZml4LiA7LSkKCkJUVzogZmVlbCBmcmVlIHRvIGRy
b3AgbWUgZnJvbSB0aGUgQ0MgbGlzdCBhZnRlciBwbGFjaW5nIHRoZSBMaW5rIHRhZywKYXMgSSBo
YXZlIG5vIHJlYWwgaW50ZXJlc3QgaW4gdGhpcy4KCkNpYW8sIFRob3JzdGVuCgoowrkpIEkgdXNl
ZCBjYXJldCAodGhlICJeIikgYmVmb3JlIHRoZSAiTGluazoiIGFib3ZlLCBhcyB0aGF0IHdpbGwg
bWFrZQpyZWd6Ym90IGhhbmRsZSB0aGUgcGFyZW50IG1haWwgYXMgaWYgaXQgaGFkIGNvbnRhaW5l
ZCBhIGxpbmsgdG8gdGhpcwpyZWdyZXNzaW9uIGFuZCBzdGFydCB0byBtb25pdG9yIHRoaXMgdGhy
ZWFkLiBBdCBsZWFzdCBJIGhvcGUgc28sIGFzIEkKanVzdCBhZGRlZCB0aGlzIGZ1bmN0aW9uYWxs
eSB0byByZWd6Ym90LCBzbyB0aGlzIGlzIHRoZSBmaXJzdCB0ZXN0IGluCnRoZSBmaWVsZC4KCijC
sikKaHR0cHM6Ly9saW51eC1yZWd0cmFja2luZy5sZWVtaHVpcy5pbmZvL3JlZ3pib3QvcmVncmVz
c2lvbi9DQUg0RjZ1c0Z1OC1BNms1WjdyVTlfX2lFTmNTQzZaci1OdFJoaF9heXBSNzRVdk4xdVFA
bWFpbC5nbWFpbC5jb20vCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
