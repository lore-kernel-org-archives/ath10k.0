Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.taht.net ([176.58.107.8])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZG3J-0005oL-DN
 for ath10k@lists.infradead.org; Tue, 18 Dec 2018 14:08:55 +0000
From: Dave Taht <dave@taht.net>
Subject: Re: [Make-wifi-fast] [PATCH v3 3/6] mac80211: Add airtime accounting
 and scheduling to TXQs
References: <1542063113-22438-1-git-send-email-rmanohar@codeaurora.org>
 <1542063113-22438-4-git-send-email-rmanohar@codeaurora.org>
 <CADMDV=zX4NuyDS+C==c8iq7FagGLFOoQ-Fjf=x-zmehJAz8=zQ@mail.gmail.com>
 <87va4ytgff.fsf@toke.dk>
 <5d46e8942ea151b211651588db3dacb97e6e5a53.camel@sipsolutions.net>
Date: Tue, 18 Dec 2018 06:08:22 -0800
In-Reply-To: <5d46e8942ea151b211651588db3dacb97e6e5a53.camel@sipsolutions.net>
 (Johannes Berg's message of "Tue, 18 Dec 2018 13:11:27 +0100")
Message-ID: <87a7l30vxl.fsf@taht.net>
MIME-Version: 1.0
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
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>, rmanohar@codeaurora.org, make-wifi-fast@lists.bufferbloat.net, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Louie Lu <me@louie.lu>

Sm9oYW5uZXMgQmVyZyA8am9oYW5uZXNAc2lwc29sdXRpb25zLm5ldD4gd3JpdGVzOgoKPiBPbiBU
aHUsIDIwMTgtMTEtMTUgYXQgMDk6MTAgLTA4MDAsIFRva2UgSMO4aWxhbmQtSsO4cmdlbnNlbiB3
cm90ZToKPj4gTG91aWUgTHUgPG1lQGxvdWllLmx1PiB3cml0ZXM6Cj4+IAo+PiA+IEhpIFJhamt1
bWFyLCBUb2tlLAo+PiA+IAo+PiA+IEkgZm91bmQgdGhlIHNlcmllcyAodjMsNC82KSByZW1vdmUg
dGhlIGRlYnVnZnMgcmVtb3ZlIHJlc2V0Cj4+ID4gc3RhdGlvbidzCj4+ID4gYWlydGltZSBtZXRo
b2QsIGFuZCBkaWRuJ3QgYWRkZWQgYXQgaGVyZS4KPj4gPiAKPj4gPiBOb3Qgc3VyZSBob3cgdG8g
aGVscCB0aGlzIGtpbmQgb2Ygc2l0dWF0aW9uLCBkbyBJIG5lZWQgYSBzZXBhcmF0ZQo+PiA+IHBh
dGNoIHRvIGZpeCB0aGlzLCBvciBwb3N0aW5nIHRoZSBwYXRjaCBoZXJlIGlzIGZpbmU/Cj4+IAo+
PiBUaGlzIGlzIGZpbmU7IHdlIGNhbiBmb2xkIGl0IGludG8gdGhlIG5leHQgdmVyc2lvbi4gVGhh
bmtzIDopCj4KPiBKdXN0IEZZSSAtIEknbSBnb2luZyB0byBhc3N1bWUsIGdpdmVuIHRoaXMgY29t
bWVudCBhbmQgdGhlIGxvbmcKPiBkaXNjdXNzaW9uLCB0aGF0IHRoZXJlIHdpbGwgYmUgYSBuZXh0
IHZlcnNpb24gOikKCkkgdGhpbmsgdG9rZSdzIHN0aWxsIHNsZWVwaW5nIG9mZiB0aGUgcG9zdCBn
cmFkdWF0aW9uIGhhbmdvdmVyLgoKPgo+IGpvaGFubmVzCj4KPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IE1ha2Utd2lmaS1mYXN0IG1haWxpbmcgbGlz
dAo+IE1ha2Utd2lmaS1mYXN0QGxpc3RzLmJ1ZmZlcmJsb2F0Lm5ldAo+IGh0dHBzOi8vbGlzdHMu
YnVmZmVyYmxvYXQubmV0L2xpc3RpbmZvL21ha2Utd2lmaS1mYXN0CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEw
a0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vYXRoMTBrCg==
