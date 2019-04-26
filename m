Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from [208.74.158.174] (helo=mail3.candelatech.com)
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hK1L5-0005QJ-Mq
 for ath10k@lists.infradead.org; Fri, 26 Apr 2019 13:56:33 +0000
Subject: Re: [PATCHv2] ath10k: Add wrapper function to ath10k debug
References: <1556283505-29539-1-git-send-email-vnaralas@codeaurora.org>
 <CABvG-CVxmnm=JsSsgYQqEzHHYU8RJDxqCZJn4Rzy=zPLtKY1hA@mail.gmail.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <52f8d2ff-9bd0-d456-e29a-c60b99a1eb8a@candelatech.com>
Date: Fri, 26 Apr 2019 06:56:30 -0700
MIME-Version: 1.0
In-Reply-To: <CABvG-CVxmnm=JsSsgYQqEzHHYU8RJDxqCZJn4Rzy=zPLtKY1hA@mail.gmail.com>
Content-Language: en-US
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
To: =?UTF-8?Q?Micha=c5=82_Kazior?= <kazikcz@gmail.com>, Venkateswara Naralasetty <vnaralas@codeaurora.org>
Cc: Kan Yan <kyan@chromium.org>, linux-wireless <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org

T24gNC8yNi8xOSA2OjQ0IEFNLCBNaWNoYcWCIEthemlvciB3cm90ZToKPiBPbiBGcmksIDI2IEFw
ciAyMDE5IGF0IDE0OjU4LCBWZW5rYXRlc3dhcmEgTmFyYWxhc2V0dHkKPiA8dm5hcmFsYXNAY29k
ZWF1cm9yYS5vcmc+IHdyb3RlOgo+Pgo+PiBhdGgxMGtfZGJnKCkgaXMgY2FsbGVkIGluIGF0aDEw
a19wcm9jZXNzX3J4KCkgd2l0aCBodWdlIHNldCBvZiBhcmd1bWVudHMKPj4gd2hpY2ggaXMgY2F1
c2luZyBDUFUgb3ZlcmhlYWQgZXZlbiB3aGVuIGRlYnVnX21hc2sgaXMgbm90IHNldC4KPj4gR29v
ZCBpbXByb3ZlbWVudCB3YXMgb2JzZXJ2ZWQgaW4gdGhlIHJlY2VpdmUgc2lkZSBwZXJmb3JtYW5j
ZSB3aGVuIGNhbGwKPj4gdG8gYXRoMTBrX2RiZygpIGlzIGF2b2lkZWQgaW4gdGhlIFJYIHBhdGgu
Cj4gWy4uLl0KPiAKPj4gKy8qIEF2b2lkIGNhbGxpbmcgX19hdGgxMGtfZGJnKCkgaWYgZGVidWdf
bWFzayBpcyBub3Qgc2V0IGFuZCB0cmFjaW5nCj4+ICsgKiBkaXNhYmxlZC4KPj4gKyAqLwo+PiAr
I2RlZmluZSBhdGgxMGtfZGJnKGFyLCBkYmdfbWFzaywgZm10LCAuLi4pICAgICAgICAgICAgICAg
ICAgICAgXAo+PiArZG8geyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXAo+PiArICAgICAgIGlmICgoYXRoMTBrX2RlYnVnX21hc2sgJiBk
YmdfbWFzaykgfHwgICAgICAgICAgICAgICAgICAgXAo+PiArICAgICAgICAgICB0cmFjZV9hdGgx
MGtfbG9nX2RiZ19lbmFibGVkKCkpICAgICAgICAgICAgICAgICAgICAgXAo+PiArICAgICAgICAg
ICAgICAgX19hdGgxMGtfZGJnKGFyLCBkYmdfbWFzaywgZm10LCAjI19fVkFfQVJHU19fKTsgXAo+
PiArfSB3aGlsZSAoMCkKPiAKPiBEaWQgeW91IGNvbnNpZGVyIHVzaW5nIGp1bXAgbGFiZWxzIChz
ZWUgaW5jbHVkZS9saW51eC9qdW1wX2xhYmVsLmgpPwo+IEl0J3Mgd2hhdCB0cmFjaW5nIHVzZXMg
dW5kZXIgdGhlIGhvb2QuIEkgd29uZGVyIGlmIHlvdSBjb3VsZCBzcXVlZXplCj4gb3V0IGEgYml0
IG1vcmUgcGVyZm9ybWFuY2Ugd2l0aCB0aGF0PyBJIGd1ZXNzIHlvdSdkIG5lZWQgdG8gYWRkCj4g
YHN0cnVjdCBzdGF0aWNfa2V5IGF0aDEwa19kYmdfbWFza19rZXlzW0FUSDEwS19EQkdfTUFYXWAg
YW5kIHJlLWRvCj4gYXRoMTBrX2RlYnVnX21hc2sgZW51bSBhIGJpdC4KCk1heWJlIGZpcnN0IHRl
c3Qgd2l0aCBkZWJ1Z2dpbmcganVzdCBjb21waWxlZCBvdXQgdG8gc2VlIGlmIHRoZXJlIGlzIHN0
aWxsCmFueSBzaWduaWZpY2FudCBvdmVyaGVhZCB3aXRoIHRoaXMgbmV3IHBhdGNoIGFwcGxpZWQ/
CgpUaGFua3MsCkJlbgoKLS0gCkJlbiBHcmVlYXIgPGdyZWVhcmJAY2FuZGVsYXRlY2guY29tPgpD
YW5kZWxhIFRlY2hub2xvZ2llcyBJbmMgIGh0dHA6Ly93d3cuY2FuZGVsYXRlY2guY29tCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxp
bmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
