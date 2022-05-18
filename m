Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8074FC433F5
	for <ath10k@archiver.kernel.org>; Wed, 18 May 2022 07:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ki1qDOC6os/+Xb3TT+9y5UKayy7N7ialBx8xGb+g+68=; b=N8fAY508zpgNT9
	UnHiYaPswGO1zkZ9WmAnzouVBKMvmPwVLjn05FQzB/pHe0m42/Ar+CHPDpfRRGVvRuT4LMWISwBUm
	Lvr+PhLjjI0gcrAKWgRQoaRJpi8bRQEgWL5KSEUAd8n2JpkV+d4GnM5Cuh53MgIBlP/SW91V6rVgF
	3b3vjl9mzkSXhY5esXD+P3MSwooLR1lNlwhT+xWNv4wtnTjze4l6kSkmeIetVlvf3Vezd/YifAcCy
	iri12dP4JSfOexOXogEpKgZrh3EKIHfD/wI5dsQIgvgQ+sLzb+7AG23/K6JTyNadKW2e+QBNxYmhl
	oBbBEuOvkzdmgycV2nsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrDxX-0002D2-VN; Wed, 18 May 2022 07:19:03 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrDxU-0002BG-V1
 for ath10k@lists.infradead.org; Wed, 18 May 2022 07:19:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 66C51B81E74;
 Wed, 18 May 2022 07:18:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E2C3C385AA;
 Wed, 18 May 2022 07:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652858338;
 bh=7fYgeoge+NXi6dIVbh7wEGd2VdZVCmjEuo2jZ0QyhPk=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=Zr5BFiQFHSiY5gMplt9DVm9vQpCNg96qbRU7BZeSi2TKAFRMljjkNYtE1U60Q7Eim
 UAHl/LpsCPB0gpr6Mwd6rdTaR4mJPFLnSEN1tmnGaZD8WHTYgZ6MsRn+kBO3EMkW5/
 zeVci2LanmdcQEBwEc966Si1IfPBIMhOO27RozE+TkPkZvedvOV15cPZyXCijlXoOP
 0JXToXEl5uQiLdJH1iP3MtW85bqzJPMGH8CAL0Af220BDpEkqf4Od+/iZ+y/JpWplR
 gDswNFBX02p7r9p+Q935K7xo4T2ieNb6iF+ViZ9+oEahDG20w7/KIlwTKPRsfS4u+9
 3n7ILsE55rHdw==
From: Kalle Valo <kvalo@kernel.org>
To: Steev Klimaszewski <steev@kali.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Govind Singh <govinds@codeaurora.org>, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] ath10k: do not enforce interrupt trigger type
References: <20220513151516.357549-1-krzysztof.kozlowski@linaro.org>
 <87zgjl4e8t.fsf@kernel.org>
 <3d856d44-a2d6-b5b8-ec78-ce19a3686986@kali.org>
 <3bf28d29-f841-81f7-68f8-3fb7f9c274bf@kali.org>
Date: Wed, 18 May 2022 10:18:50 +0300
In-Reply-To: <3bf28d29-f841-81f7-68f8-3fb7f9c274bf@kali.org> (Steev
 Klimaszewski's message of "Sat, 14 May 2022 13:09:11 -0500")
Message-ID: <87y1yz2tr9.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_001901_331406_E3D6D4FB 
X-CRM114-Status: GOOD (  20.24  )
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

U3RlZXYgS2xpbWFzemV3c2tpIDxzdGVldkBrYWxpLm9yZz4gd3JpdGVzOgoKPiBPbiA1LzE0LzIy
IDEyOjA1IEFNLCBTdGVldiBLbGltYXN6ZXdza2kgd3JvdGU6Cj4+Cj4+IE9uIDUvMTMvMjIgMTA6
NTcgQU0sIEthbGxlIFZhbG8gd3JvdGU6Cj4+PiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0
b2Yua296bG93c2tpQGxpbmFyby5vcmc+IHdyaXRlczoKPj4+Cj4+Pj4gSW50ZXJydXB0IGxpbmUg
Y2FuIGJlIGNvbmZpZ3VyZWQgb24gZGlmZmVyZW50IGhhcmR3YXJlIGluCj4+Pj4gZGlmZmVyZW50
IHdheSwKPj4+PiBldmVuIGludmVydGVkLsKgIFRoZXJlZm9yZSBkcml2ZXIgc2hvdWxkIG5vdCBl
bmZvcmNlIHNwZWNpZmljIHRyaWdnZXIKPj4+PiB0eXBlIC0gZWRnZSByaXNpbmcgLSBidXQgaW5z
dGVhZCByZWx5IG9uIERldmljZXRyZWUgdG8gY29uZmlndXJlIGl0Lgo+Pj4+Cj4+Pj4gQWxsIFF1
YWxjb21tIERUU0kgd2l0aCBXQ04zOTkwIGRlZmluZSB0aGUgaW50ZXJydXB0IHR5cGUgYXMgbGV2
ZWwgaGlnaCwKPj4+PiBzbyB0aGUgbWlzbWF0Y2ggYmV0d2VlbiBEVFNJIGFuZCBkcml2ZXIgY2F1
c2VzIHJlYmluZCBpc3N1ZXM6Cj4+Pj4KPj4+PiDCoMKgICQgZWNobyAxODgwMDAwMC53aWZpID4g
L3N5cy9idXMvcGxhdGZvcm0vZHJpdmVycy9hdGgxMGtfc25vYy91bmJpbmQKPj4+PiDCoMKgICQg
ZWNobyAxODgwMDAwMC53aWZpID4gL3N5cy9idXMvcGxhdGZvcm0vZHJpdmVycy9hdGgxMGtfc25v
Yy9iaW5kCj4+Pj4gwqDCoCBbwqDCoCA0NC43NjMxMTRdIGlycTogdHlwZSBtaXNtYXRjaCwgZmFp
bGVkIHRvIG1hcCBod2lycS00NDYgZm9yCj4+Pj4gaW50ZXJydXB0LWNvbnRyb2xsZXJAMTdhMDAw
MDAhCj4+Pj4gwqDCoCBbwqDCoCA0NC43NjMxMzBdIGF0aDEwa19zbm9jIDE4ODAwMDAwLndpZmk6
IGVycm9yIC1FTlhJTzogSVJRCj4+Pj4gaW5kZXggMCBub3QgZm91bmQKPj4+PiDCoMKgIFvCoMKg
IDQ0Ljc2MzE0MF0gYXRoMTBrX3Nub2MgMTg4MDAwMDAud2lmaTogZmFpbGVkIHRvIGluaXRpYWxp
emUKPj4+PiByZXNvdXJjZTogLTYKPj4+IFNvIHlvdSB0ZXN0ZWQgb24gV0NOMzk5MD8gT24gd2hh
dCBmaXJtd2FyZSB2ZXJzaW9uPyBJIGNhbiBhZGQgdGhlCj4+PiBUZXN0ZWQtb24gdGFnIGlmIHlv
dSBwcm92aWRlIHRoYXQuCj4+Pgo+PiBIZWxsbyBLcnp5c3RvZiwgS2FsbGUsCj4+Cj4+IEkgaGF2
ZSBzZWVuIHRoaXMgaXNzdWUgYXMgd2VsbCBvbiBhIExlbm92byBGbGV4IDVHLCB3aGljaCBoYXMg
YSBXQ04zOTkwOgo+Pgo+PiB3Y24zOTkwIGh3MS4wIHRhcmdldCAweDAwMDAwMDA4IGNoaXBfaWQg
MHgwMDAwMDAwMCBzdWIgMDAwMDowMDAwCj4+IGtjb25maWcgZGVidWcgMCBkZWJ1Z2ZzIDAgdHJh
Y2luZyAwIGRmcyAwIHRlc3Rtb2RlIDAKPj4gZmlybXdhcmUgdmVywqAgYXBpIDUgZmVhdHVyZXMg
d293bGFuLG1nbXQtdHgtYnktcmVmZXJlbmNlLG5vbi1ibWkKPj4gY3JjMzIgYjNkNGI3OTAKPj4g
aHR0LXZlciAzLjg2IHdtaS1vcCA0IGh0dC1vcCAzIGNhbCBmaWxlIG1heC1zdGEgMzIgcmF3IDAg
aHdjcnlwdG8gMQo+Pgo+PiBXaXRoIHRoaXMgcGF0Y2ggYXBwbGllZCwgSSBubyBsb25nZXIgc2Vl
IHRoZSBlcnJvciBtZXNzYWdlIGluIHRoZQo+PiBjb21taXQgbWVzc2FnZSwgd2hlbiBJIHVuYmlu
ZC9iaW5kIHdoZW4gd2lmaSBzdG9wcyB3b3JraW5nLgo+Pgo+PiBUZXN0ZWQtYnk6IFN0ZWV2IEts
aW1hc3pld3NraSA8c3RlZXZAa2FsaS5vcmc+Cj4+Cj4+IC0tIFN0ZWV2Cj4+Cj4gQXBvbG9naWVz
IGZvciB0aGUgc2Vjb25kIGVtYWlsIC0gSSd2ZSB0ZXN0ZWQgdGhpcyBub3cgb24gYm90aCB0aGUK
PiBMZW5vdm8gRmxleCA1RywgYXMgSSBoYXZlIHNlZW4gdGhlIGlzc3VlIG9uIGl0IGFzIHdlbGws
IGFzIHdlbGwgYXMgb24KPiB0aGUgTGVub3ZvIFlvZ2EgQzYzMCwgd2hlcmUgSSBkaWQgbm90IGJ1
dCBJIGRpZCBoYXZlIGlzc3VlcyB3aXRoCj4gYXR0ZW1wdGluZyB0byByZWJpbmQgdGhlIGRldmlj
ZSwgcHJpb3IgdG8gdGhpcyBwYXRjaC4KPgo+IEZpcm13YXJlIHZlcnNpb24gZm9yIHRoZSBGbGV4
IDVHIGlzCj4KPiBxbWkgY2hpcF9pZCAweDMwMjI0IGNoaXBfZmFtaWx5IDB4NDAwMSBib2FyZF9p
ZCAweGZmIHNvY19pZCAweDQwMDYwMDAwCj4gcW1pIGZ3X3ZlcnNpb24gMHgzMjA4MDAwOSBmd19i
dWlsZF90aW1lc3RhbXAgMjAyMC0xMS0xNiAxNDo0NAo+IGZ3X2J1aWxkX2lkCj4gUUNfSU1BR0Vf
VkVSU0lPTl9TVFJJTkc9V0xBTi5ITC4zLjIuMC5jOC0wMDAwOS1RQ0FITFNXU0M4MTgwWE1UUExa
LTEKPgo+IEZpcm13YXJlIHZlcnNpb24gb24gdGhlIFlvZ2EgQzYzMCBpcwo+Cj4gcW1pIGNoaXBf
aWQgMHgzMDIxNCBjaGlwX2ZhbWlseSAweDQwMDEgYm9hcmRfaWQgMHhmZiBzb2NfaWQgMHg0MDAz
MDAwMQo+IHFtaSBmd192ZXJzaW9uIDB4MjAwOTg1NmIgZndfYnVpbGRfdGltZXN0YW1wIDIwMTgt
MDctMTkgMTI6MjgKPiBmd19idWlsZF9pZCBRQ19JTUFHRV9WRVJTSU9OX1NUUklORz1XTEFOLkhM
LjIuMC0wMTM4Ny1RQ0FITFNXTVRQTFotMQoKSW4gdGhlIHBlbmRpbmcgYnJhbmNoIEkgYWRkZWQg
dGhlc2UgdG8gdGhlIGNvbW1pdCBsb2c6CgpUZXN0ZWQtb246IFdDTjM5OTAgaHcxLjAgU05PQyBX
TEFOLkhMLjMuMi4wLmM4LTAwMDA5LVFDQUhMU1dTQzgxODBYTVRQTFotMQpUZXN0ZWQtb246IFdD
TjM5OTAgaHcxLjAgU05PQyBXTEFOLkhMLjIuMC0wMTM4Ny1RQ0FITFNXTVRQTFotMQoKVGhhbmtz
IGZvciB0ZXN0aW5nLCB2ZXJ5IG11Y2ggYXBwcmVjaWF0ZWQhCgotLSAKaHR0cHM6Ly9wYXRjaHdv
cmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXdpcmVsZXNzL2xpc3QvCgpodHRwczovL3dpcmVs
ZXNzLndpa2kua2VybmVsLm9yZy9lbi9kZXZlbG9wZXJzL2RvY3VtZW50YXRpb24vc3VibWl0dGlu
Z3BhdGNoZXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
