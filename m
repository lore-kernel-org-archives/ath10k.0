Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22e.google.com ([2a00:1450:400c:c05::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XdbGA-00005i-0P
 for ath10k@lists.infradead.org; Mon, 13 Oct 2014 08:45:42 +0000
Received: by mail-wi0-f174.google.com with SMTP id h11so2999803wiw.7
 for <ath10k@lists.infradead.org>; Mon, 13 Oct 2014 01:45:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87bnpg9yvh.fsf@kamboji.qca.qualcomm.com>
References: <1412847527-25983-1-git-send-email-michal.kazior@tieto.com>
 <1412847527-25983-3-git-send-email-michal.kazior@tieto.com>
 <87bnpg9yvh.fsf@kamboji.qca.qualcomm.com>
Date: Mon, 13 Oct 2014 10:45:18 +0200
Message-ID: <CA+BoTQn035S9KvuoJw6vNnbPsqyLJJK_svPu7W0XAXumkJU09g@mail.gmail.com>
Subject: Re: [PATCH 2/3] ath10k: expose hw restart via debugfs
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

T24gMTMgT2N0b2JlciAyMDE0IDEwOjA3LCBLYWxsZSBWYWxvIDxrdmFsb0BxY2EucXVhbGNvbW0u
Y29tPiB3cm90ZToKPiBNaWNoYWwgS2F6aW9yIDxtaWNoYWwua2F6aW9yQHRpZXRvLmNvbT4gd3Jp
dGVzOgpbLi4uXQo+PiAtLS0gYS9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL2RlYnVn
LmMKPj4gKysrIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9kZWJ1Zy5jCj4+IEBA
IC02OTQsNyArNjk0LDggQEAgc3RhdGljIHNzaXplX3QgYXRoMTBrX3JlYWRfc2ltdWxhdGVfZndf
Y3Jhc2goc3RydWN0IGZpbGUgKmZpbGUsCj4+ICAgICAgICAgICAgICAgIlRvIHNpbXVsYXRlIGZp
cm13YXJlIGNyYXNoIHdyaXRlIG9uZSBvZiB0aGUga2V5d29yZHMgdG8gdGhpcyBmaWxlOlxuIgo+
PiAgICAgICAgICAgICAgICJgc29mdGAgLSB0aGlzIHdpbGwgc2VuZCBXTUlfRk9SQ0VfRldfSEFO
R19BU1NFUlQgdG8gZmlybXdhcmUgaWYgRlcgc3VwcG9ydHMgdGhhdCBjb21tYW5kLlxuIgo+PiAg
ICAgICAgICAgICAgICJgaGFyZGAgLSB0aGlzIHdpbGwgc2VuZCB0byBmaXJtd2FyZSBjb21tYW5k
IHdpdGggaWxsZWdhbCBwYXJhbWV0ZXJzIGNhdXNpbmcgZmlybXdhcmUgY3Jhc2guXG4iCj4+IC0g
ICAgICAgICAgICAgImBhc3NlcnRgIC0gdGhpcyB3aWxsIHNlbmQgc3BlY2lhbCBpbGxlZ2FsIHBh
cmFtZXRlciB0byBmaXJtd2FyZSB0byBjYXVzZSBhc3NlcnQgZmFpbHVyZSBhbmQgY3Jhc2guXG4i
Owo+PiArICAgICAgICAgICAgICJgYXNzZXJ0YCAtIHRoaXMgd2lsbCBzZW5kIHNwZWNpYWwgaWxs
ZWdhbCBwYXJhbWV0ZXIgdG8gZmlybXdhcmUgdG8gY2F1c2UgYXNzZXJ0IGZhaWx1cmUgYW5kIGNy
YXNoLlxuIgo+PiArICAgICAgICAgICAgICJgcmVxdWVzdGAgLSB0aGlzIHdpbGwgc2ltcGx5IHF1
ZXVlIGh3IHJlc3RhcnQgd2l0aG91dCBmdy9odyBhY3R1YWxseSBjcmFzaGluZy5cbiI7Cj4KPiAi
cmVxdWVzdCIgaXMgbm90IHJlYWxseSB2ZXJ5IGRlc2NyaXB0aXZlIGNvbW1hbmQuIE1heWJlIGNh
bGwgaXQKPiAiaHctcmVzdGFydCIgYmVjYXVzZSB0aGF0J3Mgd2hhdCBpdCByZWFsbHkgZG9lcywg
cmlnaHQ/CgpHb29kIGlkZWEuIEknbGwgcmVuYW1lIGl0LgoKCk1pY2hhxYIKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QK
YXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hdGgxMGsK
