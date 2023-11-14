Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB54FC4167B
	for <ath10k@archiver.kernel.org>; Tue, 14 Nov 2023 20:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cZ0PmbHKy8W6x6QbLYB3v1uGenM61nPA7okQXwTD3bU=; b=R4YTNkSqhMQS8C
	AqY4OHVX8WO8Emd4Nns/cRBX0ExWoXj7Wj0yLnIJZwYTVMQo+Z3+MKsDfnZ3GomIZN+5ryOAM+1Uh
	H2F6zak1g500RpU8sxYv+p5PhDe2tGLNAtnh+miukqbxMpnCj1aGlNfOXJJZhHD0jIDsuTB/U2R8A
	zx7C5+g6VTRYUK0bJ0p3tb614Y118nm/kJdX4b/Xb+M4OaBBXNX0sDqdIllsJwDfzNJdIxC4lhWpa
	QlAMBEtLC3JX3W+VUm0897rsq9x0EQh2LOm8djhlp1GpNNlzwnIsVt+rI5oXZV59QdXP2/3/GtV+q
	S+nUW8pW13OtZCqrN3IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2za1-00Gev9-1J;
	Tue, 14 Nov 2023 20:00:13 +0000
Received: from mx3.molgen.mpg.de ([141.14.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2zZt-00GenS-0c
	for ath10k@lists.infradead.org;
	Tue, 14 Nov 2023 20:00:08 +0000
Received: from [192.168.0.183] (unknown [95.90.240.101])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 860CA61E5FE05;
	Tue, 14 Nov 2023 20:58:59 +0100 (CET)
Message-ID: <58d017a1-cae6-46d8-9cee-515dbf607051@molgen.mpg.de>
Date: Tue, 14 Nov 2023 20:58:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath10k_pci logs errors about missing pre-cal and cal firmware on
 a laptop
To: Jeff Johnson <quic_jjohnson@quicinc.com>, debian-kernel@lists.debian.org
Cc: Kalle Valo <kvalo@kernel.org>, linux-wireless@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, ath10k@lists.infradead.org,
 Ben Hutchings <ben@decadent.org.uk>
References: <7158e5e9-8bdc-4660-ac5d-5e3f81cf6158@molgen.mpg.de>
 <b70d8041-901c-48f6-8790-35e354c30865@quicinc.com>
 <2e4be606-68a9-455b-a43d-20b8375efc49@quicinc.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <2e4be606-68a9-455b-a43d-20b8375efc49@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_120005_399264_D3AF023F 
X-CRM114-Status: GOOD (  18.86  )
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

W1RvOiArZGViaWFuLWtlcm5lbEBsaXN0cy5kZWJpYW4ub3JnXQoKRGVhciBKZWZmLCBkZWFyIERl
YmlhbiBMaW51eCBrZXJuZWwgdGVhbSwKCgpBbSAxNC4xMS4yMyB1bSAxOToxOSBzY2hyaWViIEpl
ZmYgSm9obnNvbjoKPiBPbiAxMS8xNC8yMDIzIDk6MzIgQU0sIEplZmYgSm9obnNvbiB3cm90ZToK
Pj4gT24gMTEvMTIvMjAyMyA0OjEzIEFNLCBQYXVsIE1lbnplbCB3cm90ZToKCj4+PiBPbiB0aGUg
RGVsbCBYUFMgMTMgOTM2MCB3aXRoIERlYmlhbiBzaWQvdW5zdGFibGUsIExpbnV4IDYuNS4xMCBs
b2dzIHRoZQo+Pj4gZXJyb3IgYmVsb3c6Cj4+Pgo+Pj4gICAgICAgJCBzdWRvIGRtZXNnIHwgZ3Jl
cCAtZSAiRE1JOiIgLWUgIkxpbnV4IHZlcnNpb24iIC1lIG1pY3JvY29kZQo+Pj4gICAgICAgWyAg
ICAwLjAwMDAwMF0gbWljcm9jb2RlOiB1cGRhdGVkIGVhcmx5OiAweGYwIC0+IDB4ZjQsIGRhdGUg
PSAyMDIzLTAyLTIyCj4+PiAgICAgICBbICAgIDAuMDAwMDAwXSBMaW51eCB2ZXJzaW9uIDYuNS4w
LTQtYW1kNjQgKGRlYmlhbi1rZXJuZWxAbGlzdHMuZGViaWFuLm9yZykgKGdjYy0xMyAoRGViaWFu
IDEzLjIuMC02KSAxMy4yLjAsIEdOVSBsZCAoR05VIEJpbnV0aWxzIGZvciBEZWJpYW4pIDIuNDEp
ICMxIFNNUCBQUkVFTVBUX0RZTkFNSUMgRGViaWFuIDYuNS4xMC0xICgyMDIzLTExLTAzKQo+Pj4g
ICAgICAgWyAgICAwLjAwMDAwMF0gRE1JOiBEZWxsIEluYy4gWFBTIDEzIDkzNjAvMDU5NktGLCBC
SU9TIDIuMjEuMCAwNi8wMi8yMDIyCj4+PiAgICAgICBbICAgIDAuNTgwNjg5XSBtaWNyb2NvZGU6
IE1pY3JvY29kZSBVcGRhdGUgRHJpdmVyOiB2Mi4yLgo+Pj4KPj4+ICAgICAgICQgc3VkbyBkbWVz
ZyAtLWxldmVsIGFsZXJ0LGNyaXQsZXJyCj4+PiAgICAgICBbICAgIDAuMDUzNTY2XSB4ODYvY3B1
OiBTR1ggZGlzYWJsZWQgYnkgQklPUy4KPj4+ICAgICAgIFsgICAgMS45NDIxODNdIHBzbW91c2Ug
c2VyaW8xOiBzeW5hcHRpY3M6IFVuYWJsZSB0byBxdWVyeSBkZXZpY2U6IC01Cj4+PiAgICAgICBb
ICAgMTQuNDAxMTEyXSBhdGgxMGtfcGNpIDAwMDA6M2E6MDAuMDogZmlybXdhcmU6IGZhaWxlZCB0
byBsb2FkIGF0aDEway9wcmUtY2FsLXBjaS0wMDAwOjNhOjAwLjAuYmluICgtMikKPj4+ICAgICAg
IFsgICAxNC40MDExNDNdIGZpcm13YXJlX2NsYXNzOiBTZWUgaHR0cHM6Ly93aWtpLmRlYmlhbi5v
cmcvRmlybXdhcmUgZm9yIGluZm9ybWF0aW9uIGFib3V0IG1pc3NpbmcgZmlybXdhcmUKPj4+ICAg
ICAgIFsgICAxNC40MDExODVdIGF0aDEwa19wY2kgMDAwMDozYTowMC4wOiBmaXJtd2FyZTogZmFp
bGVkIHRvIGxvYWQgYXRoMTBrL3ByZS1jYWwtcGNpLTAwMDA6M2E6MDAuMC5iaW4gKC0yKQo+Pj4g
ICAgICAgWyAgIDE0LjQwMTIzM10gYXRoMTBrX3BjaSAwMDAwOjNhOjAwLjA6IGZpcm13YXJlOiBm
YWlsZWQgdG8gbG9hZCBhdGgxMGsvY2FsLXBjaS0wMDAwOjNhOjAwLjAuYmluICgtMikKPj4+ICAg
ICAgIFsgICAxNC40MDEyNzNdIGF0aDEwa19wY2kgMDAwMDozYTowMC4wOiBmaXJtd2FyZTogZmFp
bGVkIHRvIGxvYWQgYXRoMTBrL2NhbC1wY2ktMDAwMDozYTowMC4wLmJpbiAoLTIpCj4+Pgo+Pj4g
QXMgaXTigJlzIGxvZ2dlZCB3aXRoIGVycm9yIGxldmVsLCBJ4oCZZCBsaWtlIHRvIGFkZHJlc3Mg
dGhlIGF0aDEwa19wY2kKPj4+IGVycm9ycywgYnV0IEkgYW0gdW5hYmxlIHRvIGZpbmQgdGhlIGZp
cm13YXJlIGluIHRoZSBMaW51eCBmaXJtd2FyZQo+Pj4gYXJjaGl2ZSBbMV0uCj4+Pgo+Pj4gV2hh
dCBjYW4gSSBkbyBhYm91dCB0aGlzPwoKPj4+IFsxXTogaHR0cHM6Ly9naXQua2VybmVsLm9yZy9w
dWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvZmlybXdhcmUvbGludXgtZmlybXdhcmUuZ2l0Lwo+Pgo+
PiBBZGRpbmcgdGhlIGF0aDEwayBsaXN0IHNvIHRoaXMgaXNuJ3QgbG9zdCBpbiB0aGUgbm9pc2UK
PiAKPiBUaGUgY2FsaWJyYXRpb24gZmlsZXMgYXJlIG9wdGlvbmFsIGFuZCB5b3Ugc2hvdWxkIG5v
dCBzZWUgYW55IHdhcm5pbmdzCj4gaWYgdGhleSBhcmUgbm90IHByZXNlbnQuCj4gCj4gTm90ZSBh
dGgxMGsgZXhwbGljaXRseSBjYWxscyBmaXJtd2FyZV9yZXF1ZXN0X25vd2FybigpIHdoZW4gaXQg
bG9hZHMgdGhlCj4gZmlsZXMgc2luY2UgaXQgZG9lc24ndCB3YW50IGFueSB3YXJuaW5ncyBmcm9t
IHRoZSBmaXJtd2FyZSBsb2FkZXIgaWYgdGhlCj4gZmlsZXMgYXJlbid0IHByZXNlbnQuCj4gPGh0
dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjUuMTAvc291cmNlL2RyaXZlcnMvbmV0
L3dpcmVsZXNzL2F0aC9hdGgxMGsvY29yZS5jI0w5Mjk+Cj4gCj4gQW5kIGF0aDEwayBpdHNlbGYg
ZXhwbGljaXRseSBkb2Vzbid0IHdhcm46Cj4gPGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xp
bnV4L3Y2LjUuMTAvc291cmNlL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvY29yZS5j
I0wxMjU5Pgo+IAo+IFNvIEknbSBjb25mdXNlZCB3aGVyZSB0aGVzZSB3YXJuaW5ncyBvcmlnaW5h
dGUuCj4gCj4gQmFzZWQgdXBvbiB0aGUgbWVzc2FnZToKPiBbICAgMTQuNDAxMTQzXSBmaXJtd2Fy
ZV9jbGFzczogU2VlIGh0dHBzOi8vd2lraS5kZWJpYW4ub3JnL0Zpcm13YXJlCj4gZm9yIGluZm9y
bWF0aW9uIGFib3V0IG1pc3NpbmcgZmlybXdhcmUKPiAKPiBpdCBzZWVtcyB5b3UgYXJlIG5vdCBy
dW5uaW5nIGEgc3RvY2sga2VybmVsLiBTbyBwZXJoYXBzIERlYmlhbiBoYXMKPiBtb2RpZmllZCB0
aGUgZmlybXdhcmUgbG9hZGluZyBzdWNoIHRoYXQgaXQgaWdub3JlcyB0aGUgRldfT1BUX05PX1dB
Uk4KPiBmbGFnIGFuZCB3YXJucyBldmVuIHdoZW4gdG9sZCBub3QgdG8gZG8gc28/IFRoaXMgZG9l
cyBub3QgYXBwZWFyIHRvIGJlCj4gYW4gdXBzdHJlYW0ga2VybmVsIGlzc3VlLgoKVGhhbmsgeW91
IHZlcnkgbXVjaCBmb3IgdGhlIGFuYWx5c2lzLiBJdCBzZWVtcyB0byBiZSBpbmRlZWQgYSBEZWJp
YW4gCnNwZWNpZmljIHBhdGNoIFsxXS4KCkRlYXIgRGViaWFuIExpbnV4IGtlcm5lbCB0ZWFtLCBp
cyBteSBvYnNlcnZhdGlvbiBhYm91dCB0aGUgZXJyb3IgbG9nIGEgCnJlc3VsdCBvZiB0aGUgcGF0
Y2ggYW5kIGludGVuZGVkPwoKCktpbmQgcmVnYXJkcywKClBhdWwKCgpbMV06IApkZWJpYW4vcGF0
Y2hlcy9kZWJpYW4vZmlybXdhcmVfY2xhc3MtcmVmZXItdG8tZGViaWFuLXdpa2ktZmlybXdhcmUt
cGFnZS5wYXRjaAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
