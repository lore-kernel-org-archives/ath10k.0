Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-we0-x232.google.com ([2a00:1450:400c:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wkomh-0001d4-OT
 for ath10k@lists.infradead.org; Thu, 15 May 2014 06:04:52 +0000
Received: by mail-we0-f178.google.com with SMTP id u56so538439wes.37
 for <ath10k@lists.infradead.org>; Wed, 14 May 2014 23:04:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87d2fgcf6v.fsf@kamboji.qca.qualcomm.com>
References: <1399637749-13489-1-git-send-email-michal.kazior@tieto.com>
 <1399637749-13489-5-git-send-email-michal.kazior@tieto.com>
 <87d2fgcf6v.fsf@kamboji.qca.qualcomm.com>
Date: Thu, 15 May 2014 08:04:29 +0200
Message-ID: <CA+BoTQngH43cXSikG+nPe5MozP4gTcbiHdx_gp7s4u=Fmc+AGQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] ath10k: protect wep tx key setup
From: Michal Kazior <michal.kazior@tieto.com>
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMTQgTWF5IDIwMTQgMjE6NTAsIEthbGxlIFZhbG8gPGt2YWxvQHFjYS5xdWFsY29tbS5jb20+
IHdyb3RlOgo+IE1pY2hhbCBLYXppb3IgPG1pY2hhbC5rYXppb3JAdGlldG8uY29tPiB3cml0ZXM6
Cj4KPj4gQWxsIGNvbmZpZ3VyYXRpb24gc2VxdWVuY2VzIHNob3VsZCBiZSBwcm90ZWN0ZWQKPj4g
d2l0aCBjb25mX211dGV4IHRvIGF2b2lkIGNvbmN1cnJlbnQvY29uZmxpY3RpbmcKPj4gcmVxdWVz
dHMuCj4+Cj4+IFRoaXMgc2hvdWxkIG1ha2Ugc3VyZSB0aGF0IHdlcCB0eCBrZXkgc2V0dXAgaXMg
bm90Cj4+IHBlcmZvcm1lZCB3aGlsZSBodyBpcyByZXN0YXJ0ZWQgKGF0IGxlYXN0KS4KPgo+IExv
Y2tzIGFuZCBtdXRleGVzIHNob3VsZCBwcm90ZWN0IGRhdGEsIG5vdCB0aHJlYWQgb2YgZXhlY3V0
aW9uLiBXaGF0IGFyZQo+IHdlIGV4YWN0bHkgcHJvdGVjdGluZyBoZXJlLCBhcnZpZi0+ZGVmX3dl
cF9rZXlfaWR4PwoKQWN0dWFsbHkgY29uZl9tdXRleCBpZGVhIGlzIHRvIHByb3RlY3QgYW5kIHNl
cmlhbGl6ZSBjb25maWd1cmF0aW9uCnNlcXVlbmNlcyAoV01JKSB0b28sIG5vdCBqdXN0IGRhdGEu
IFBlcmhhcHMgd2Ugc2hvdWxkIHJldmlzZSB0aGlzPwoKCj4gVGhlIHBhdGNoIG1ha2VzIHNlbnNl
LCBJJ20ganVzdCB0cnlpbmcgdG8gdW5kZXJzdGFuZCB0aGUgaWRlYSBiZWhpbmQgdGhlCj4gaW1w
bGVtZW50YXRpb24uCj4KPj4gLS0tIGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9t
YWMuYwo+PiArKysgYi9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL21hYy5jCj4+IEBA
IC0xODg4LDggKzE4ODgsMTAgQEAgc3RhdGljIHZvaWQgYXRoMTBrX3R4X3dlcF9rZXlfd29yayhz
dHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB3ZXBfa2V5X3dvcmspOwo+PiAgICAgICBpbnQgcmV0LCBrZXlpZHgg
PSBhcnZpZi0+ZGVmX3dlcF9rZXlfbmV3aWR4Owo+Pgo+PiArICAgICBtdXRleF9sb2NrKCZhcnZp
Zi0+YXItPmNvbmZfbXV0ZXgpOwo+PiArCj4+ICAgICAgIGlmIChhcnZpZi0+ZGVmX3dlcF9rZXlf
aWR4ID09IGtleWlkeCkKPj4gLSAgICAgICAgICAgICByZXR1cm47Cj4+ICsgICAgICAgICAgICAg
Z290byB1bmxvY2s7Cj4KPiBCVFcsIHNob3VsZG4ndCB3ZSBhbHNvIGNoZWNrIHRoZSBzdGF0ZSBh
bmQgYmFpbCBvdXQgaWYgdGhlIHN0YXRlIGlzIG5vdAo+IE9OIChhbmQgcG9zc2libHkgUkVTVEFS
VEVEKT8gSG93IGNhbiB0aGlzIHdvcmsgb3RoZXJ3aXNlPwoKVmVyeSBnb29kIHBvaW50IQoKQnV0
IGFjdHVhbGx5Li4gdGhpcyBzaG91bGQgYmUgY2FuY2VsbGVkIGR1cmluZyByZWNvdmVyeSBpbiB0
aGUgZmlyc3QKcGxhY2UuIEkgbmVlZCB0byB0YWtlIGEgbG9vayBhdCBpdC4KCgpNaWNoYcWCCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFp
bGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
