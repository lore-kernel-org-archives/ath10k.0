Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.marcant.net ([217.14.160.186])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X4AHH-0005GP-Ps
 for ath10k@lists.infradead.org; Mon, 07 Jul 2014 14:52:24 +0000
Message-ID: <53BAB401.3080406@marcant.net>
Date: Mon, 07 Jul 2014 16:51:45 +0200
From: =?UTF-8?B?QW5kcsOpIFZhbGVudGlu?= <avalentin@marcant.net>
MIME-Version: 1.0
Subject: Re: ath10k OTP loading issues
References: <53AD2EEE.4040704@marcant.net>
 <53AD4F17.6070604@marcant.net>	<87pphop499.fsf@kamboji.qca.qualcomm.com>	<53B3C3FF.1060207@marcant.net>
 <87egy4p2ae.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87egy4p2ae.fsf@kamboji.qca.qualcomm.com>
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
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

SGkhCgpUaGFua3MgZm9yIHlvdXIgaGludC4gSSBub3cgZm91bmQgYXQgbGVhc3QgdGhlIGNvcnJl
Y3QgYm9hcmQuYmluLiBBbHNvIEkgZGlzYWJsZWQgdGhlIE9UUCBjaGVjayBiZWNhdXNlIGl0IGFs
d2F5cyB0aHJvd3MgYW4gZXJyb3IuCgpCeSB0aGUgd2F5LCBjYW4gSSBvdmVyd3JpdGUgdGhlIE1B
QyBhZGRyZXNzPyBJIGNoYW5nZWQgaXQgaW4gYm9hcmQuYmluIHRvIHRoZSBkZXZpY2UgTUFDLCBi
dXQgaXQgZGlkIG5vdCB3b3JrLiBBbHNvIGlmIEkgc2V0IGl0CndpdGggaWZjb25maWcsIGl0IGlz
IG9ubHkgdGVtb3JhcmlseS4gSG9zdGFwZCBkb2Vzbid0IHVzZSBpdCBhdCBhbGwsIGl0IHNvbWVo
b3cgcmVhZHMgdGhlIE1BQyBmcm9tIHRoZSBkZXZpY2UuIERvIHlvdSBoYXZlIGFuIGlkZWE/CgpB
bmRyw6kKCk9uIDAyLjA3LjIwMTQgMTA6NTYsIEthbGxlIFZhbG8gd3JvdGU6Cj4+Pj4gaGF2ZSBz
b21lIGtpbmQgb2YgbWFnaWMgc28gSSBjYW4gaWRlbnRpZnkgaXQ/Cj4+Pgo+Pj4gTUFDIGFkZHJl
c3NlcyBhcmUgZ29vZCBvbmUgdG8gY2hlY2suIEJhc2ljYWxseSBpdCBzaG91bGQgYmUgc2ltaWxh
ciBkYXRhCj4+PiBhcyBpbiBib2FyZC5iaW4uCj4+Cj4+IE9mIGNvdXJzZSBJIGFscmVhZHkgdHJp
ZWQgdGhpcy4gQnV0IG5vIGx1Y2suCj4gCj4gSG93IGV4YWN0bHkgZGlkIHlvdSBzZWFyY2ggZm9y
IGl0PyBBcmUgeW91IHN1cmUgeW91IHVzZWQgdGhlIGNvcnJlY3QgTUFDCj4gYWRkcmVzcz8KPiAK
Pj4gRG8geW91IGhhdmUgYW5vdGhlciBpZGVhLiBPciBpcyB0aGUgTUFDIHNvbWVob3cgZW5jcnlw
dGVkID8KPiAKPiBOb3RoaW5nIHNwZWNpYWwsIHRoZSBNQUMgYWRkcmVzcyBzaG91bGQgc2hvdWxk
IGJlIHdpdGhpbiB0aGUgZmlyc3QgMjAKPiBieXRlcy4gRm9yIGV4YW1wbGUsIGhlcmUncyAwMDow
MzowNzoxMjozNDo1NjoKPiAKPiAkIG9kIC10IHgxIGJvYXJkLmJpbiAgfCBoZWFkIC0xCj4gMDAw
MDAwMCA0NCAwOCBkZiAzMCAwMiAwNCAwMCAwMyAwNyAxMiAzNCA1NiAwMCAwMCA2YSAwMAo+IAo+
IEJ1dCBvZiBjb3Vyc2UgSSBtaWdodCBiZSBtaXNzaW5nIHNvbWV0aGluZy4gT3IgdGhlIGNhbGli
cmF0aW9uIGRhdGEgaXMKPiBzb21laG93IGVuY3J5cHRlZCBvbiB0aGUgZmxhc2guCj4gCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGlu
ZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
