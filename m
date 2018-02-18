Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtps.newmedia-net.de ([2a05:a1c0:0:de::167]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1enS0d-0002QH-3t
 for ath10k@lists.infradead.org; Sun, 18 Feb 2018 16:40:17 +0000
Subject: Re: [PATCH] v5 ath10k: add LED and GPIO controlling support for
 various chipsets
References: <20180218120300.5997-1-s.gottschall@dd-wrt.com>
 <20180218143351.GA30308@yubo-2>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <8f49257f-b40b-2e97-5f45-04fc1e6e544a@dd-wrt.com>
Date: Sun, 18 Feb 2018 17:40:01 +0100
MIME-Version: 1.0
In-Reply-To: <20180218143351.GA30308@yubo-2>
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
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Bo YU <tsu.yubo@gmail.com>
Cc: Sebastian Gottschall <s.gottschall@newmedia-net.de>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, kvalo@codeaurora.org

QW0gMTguMDIuMjAxOCB1bSAxNTozMyBzY2hyaWViIEJvIFlVOgo+IEhpLAo+IEkgYW0ganVzdCB3
b25kZXJpbmcgYWJvdXQgc29tZXRoaW5nLkkgYW0gYSBuZXdiaWVzLgo+Cj4gT24gU3VuLCBGZWIg
MTgsIDIwMTggYXQgMDE6MDM6MDBQTSArMDEwMCwgcy5nb3R0c2NoYWxsQGRkLXdydC5jb20gd3Jv
dGU6Cj4+Cj4+Cj4+ICsjaWZkZWYgQ09ORklHX0dQSU9MSUIKPj4gKwo+PiArc3RhdGljIGludCBh
dGgxMGtfZ3Bpb19waW5fY2ZnX2lucHV0KHN0cnVjdCBncGlvX2NoaXAgKmNoaXAsIAo+PiB1bnNp
Z25lZCBvZmZzZXQpCj4+ICt7Cj4+ICvCoMKgwqAgc3RydWN0IGF0aDEwa19ncGlvY29udHJvbCAq
Z3BpbyA9IGNvbnRhaW5lcl9vZihjaGlwLCBzdHJ1Y3QgCj4+IGF0aDEwa19ncGlvY29udHJvbCwg
Z2NoaXApOwo+PiArwqDCoMKgIGF0aDEwa193bWlfZ3Bpb19jb25maWcoZ3Bpby0+YXIsIG9mZnNl
dCwgMSwgV01JX0dQSU9fUFVMTF9OT05FLCAKPj4gV01JX0dQSU9fSU5UVFlQRV9ESVNBQkxFKTsg
Ly8gY29uZmlndXJlIHRvIGlucHV0Cj4gSWYgaSByZW1lbWJlciByaWdodCxjb21tZW50IHN0eWxl
IGluIGtlcm5lbCBjb2RlIHdvdWxkIGJldHRlciB0byB1c2UKPiAvKiAuLiAqLy4gU2FtZSB0aGUg
YmVsb3cgY29tbWVudC4KdHJ1ZQo+ICsgKy8qIHJlZ2lzdGVyIEdQSU8gY2hpcCAqLwo+PiArc3Rh
dGljIGludCBhdGgxMGtfcmVnaXN0ZXJfZ3Bpb19jaGlwKHN0cnVjdCBhdGgxMGsgKmFyKQo+PiAr
ewo+PiArwqDCoMKgIHN0cnVjdCBhdGgxMGtfZ3Bpb2NvbnRyb2wgKmdwaW87Cj4+ICvCoMKgwqAg
Z3BpbyA9IGt6YWxsb2Moc2l6ZW9mKHN0cnVjdCBhdGgxMGtfZ3Bpb2NvbnRyb2wpLCBHRlBfS0VS
TkVMKTsKPj4gK8KgwqDCoCBpZiAoIWdwaW8pIHsKPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiAt
MTsKPiBUaGVyZSBpcyByYXJlIHZhbHVlIHJldHVybmVkIGFmdGVyIGFsbG9jaW5nIG1lbW9yeSBm
cm9tIGtlcm5lbC5NYXliZQo+ICJyZXR1cm4gLUVOT01FTSI/Cm5vdCByZWFsbHkgcmVsZXZhbnQg
c2luY2UgdGhlIHJldHVybiBjaGVjayBqdXN0IGNoZWNrcyBmb3IgdmFsdWUgcHJlc2VudCAKYW5k
IG5vdCBmb3IgdmFsdWUgdHlwZQpidXQgaSBhcHBsaWVkIGl0IGZvciBuZXh0IHBhdGNoIHZlcnNp
b24KCi0tIApNaXQgZnJldW5kbGljaGVuIEdyw7xzc2VuIC8gUmVnYXJkcwoKU2ViYXN0aWFuIEdv
dHRzY2hhbGwgLyBDVE8KCk5ld01lZGlhLU5FVCBHbWJIIC0gREQtV1JUCkZpcm1lbnNpdHo6ICBT
dHViZW53YWxkYWxsZWUgMjFhLCA2NDYyNSBCZW5zaGVpbQpSZWdpc3RlcmdlcmljaHQ6IEFtdHNn
ZXJpY2h0IERhcm1zdGFkdCwgSFJCIDI1NDczCkdlc2Now6RmdHNmw7xocmVyOiBQZXRlciBTdGVp
bmjDpHVzZXIsIENocmlzdGlhbiBTY2hlZWxlCmh0dHA6Ly93d3cuZGQtd3J0LmNvbQplbWFpbDog
cy5nb3R0c2NoYWxsQGRkLXdydC5jb20KVGVsLjogKzQ5NjI1MS01ODI2NTAgLyBGYXg6ICs0OTYy
NTEtNTgyNjU2NQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
