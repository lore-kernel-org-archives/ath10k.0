Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x22c.google.com ([2a00:1450:4013:c00::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WJK9h-0004tW-52
 for ath10k@lists.infradead.org; Fri, 28 Feb 2014 09:54:58 +0000
Received: by mail-ee0-f44.google.com with SMTP id d49so2111181eek.31
 for <ath10k@lists.infradead.org>; Fri, 28 Feb 2014 01:54:33 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87txbjbn7s.fsf@kamboji.qca.qualcomm.com>
References: <1392629563-31046-1-git-send-email-michal.kazior@tieto.com>
 <1393485587-16879-1-git-send-email-michal.kazior@tieto.com>
 <1393485587-16879-5-git-send-email-michal.kazior@tieto.com>
 <8738j3d2t2.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQn8GTu3A4LdRGtpJeVr0SnaApTwnNZAoZ8=3Vj5qF+W=g@mail.gmail.com>
 <87txbjbn7s.fsf@kamboji.qca.qualcomm.com>
Date: Fri, 28 Feb 2014 10:54:31 +0100
Message-ID: <CA+BoTQkgxNL9tkxR=b2Qif5+6Z_cFQOc2uL5QD5scd=Nx1y50g@mail.gmail.com>
Subject: Re: [PATCH v3 4/8] ath10k: bypass htc for htt tx path
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

T24gMjggRmVicnVhcnkgMjAxNCAxMDoyOCwgS2FsbGUgVmFsbyA8a3ZhbG9AcWNhLnF1YWxjb21t
LmNvbT4gd3JvdGU6Cj4gTWljaGFsIEthemlvciA8bWljaGFsLmthemlvckB0aWV0by5jb20+IHdy
aXRlczoKPgo+PiBPbiAyOCBGZWJydWFyeSAyMDE0IDEwOjA2LCBLYWxsZSBWYWxvIDxrdmFsb0Bx
Y2EucXVhbGNvbW0uY29tPiB3cm90ZToKPj4+IE1pY2hhbCBLYXppb3IgPG1pY2hhbC5rYXppb3JA
dGlldG8uY29tPiB3cml0ZXM6Cj4+Pgo+Pj4+IC0tLSBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0
aC9hdGgxMGsvaHRjLmMKPj4+PiArKysgYi9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBr
L2h0Yy5jCj4+Pj4gQEAgLTIwMiwxMCArMjAyLDggQEAgc3RhdGljIGludCBhdGgxMGtfaHRjX3R4
X2NvbXBsZXRpb25faGFuZGxlcihzdHJ1Y3QgYXRoMTBrICphciwKPj4+PiAgICAgICBzdHJ1Y3Qg
YXRoMTBrX2h0YyAqaHRjID0gJmFyLT5odGM7Cj4+Pj4gICAgICAgc3RydWN0IGF0aDEwa19odGNf
ZXAgKmVwID0gJmh0Yy0+ZW5kcG9pbnRbZWlkXTsKPj4+Pgo+Pj4+IC0gICAgIGlmICghc2tiKSB7
Cj4+Pj4gLSAgICAgICAgICAgICBhdGgxMGtfd2FybigiaW52YWxpZCBza19idWZmIGNvbXBsZXRp
b24gLSBOVUxMIHBvaW50ZXIuIGZpcm13YXJlIGNyYXNoZWQ/XG4iKTsKPj4+PiArICAgICBpZiAo
V0FSTl9PTighc2tiKSkKPj4+PiAgICAgICAgICAgICAgIHJldHVybiAwOwo+Pj4+IC0gICAgIH0K
Pj4+Cj4+PiBXQVJOX09OKCkgaXMgYSBiaXQgZGFuZ2Vyb3VzIGhlcmUgYXMgaXQgbWlnaHQgY2F1
c2UgZXhjZXNzaXZlIHNwYW1taW5nLgo+Pj4gV2h5IGRpZCB5b3Ugd2FudCB0byBjaGFuZ2UgdGhp
cz8gSSB0aGluayBlaXRoZXIgYXRoMTBrX3dhcm4oKSBvcgo+Pj4gV0FSTl9PTl9PTkNFKCkgd291
bGQgYmUgc2FmZXIsIGJ1dCBub3Qgc3VyZSB3aGljaCBvbmUgdG8gdXNlLgo+PgoKWy4uLl0KCj4+
IFBlcmhhcHMgV0FSTl9PTigpIGlzIGEgYml0IG92ZXIgdGhlIHRvcCBoZXJlLCBidXQgc2luY2Ug
dGhpcyBpcyBub3cKPj4gbW9yZSBvZiBhIGxvZ2ljIGlzc3VlIHJhdGhlciB0aGFuIHJ1bnRpbWUg
aXNzdWUgSSBkZWNpZGVkIHRvIGNoYW5nZSBpdAo+PiBmcm9tIGF0aDEwa193YXJuIHRvIFdBUk5f
T04oKS4gSXQncyBwcm9iYWJseSBzdGlsbCBhIGdvb2QgaWRlYSB0byBtYWtlCj4+IGl0IF9PTkNF
IGdlbmVyYWxseSwgYWx0aG91Z2ggaWYgeW91IGFjdHVhbGx5IGdldCBza2J1ZmYgaXQncyBhbHJl
YWR5Cj4+IHRvbyBsYXRlIG9yIGl0IHNob3VsZCBiZSBzY3JlYW1pbmcgbG91ZGx5IGJlY2F1c2Ug
c29tZW9uZSBtdXN0J3ZlCj4+IGNoYW5nZWQgdGhlIGNvZGUgaW4gYW4gaW5jb3JyZWN0L2luY29t
cGxldGUgd2F5Lgo+Cj4gU28gSSBjaGFuZ2UgaXQgdG8gV0FSTl9PTl9PTkNFKCksIG9rPwoKU3Vy
ZS4gVGhhbmtzIQoKCk1pY2hhxYIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
