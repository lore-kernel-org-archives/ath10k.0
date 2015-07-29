Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x231.google.com ([2a00:1450:400c:c05::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZKSFq-0002tE-H8
 for ath10k@lists.infradead.org; Wed, 29 Jul 2015 14:22:47 +0000
Received: by wibxm9 with SMTP id xm9so203724597wib.0
 for <ath10k@lists.infradead.org>; Wed, 29 Jul 2015 07:22:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <874mkn71ls.fsf@kamboji.qca.qualcomm.com>
References: <CAMQd7mbWC7rj8-eU7Jv21ehT8KrpC=L=xWxzDQxHEU_ePNSdUg@mail.gmail.com>
 <CA+BoTQmd0Uoi=2MNMsDXYe1yKsYa3P8uvVzWwXoMynQGtjeD4w@mail.gmail.com>
 <CAMQd7maioLviTaLHp+f03HafABijKD_d92K_SRO8XS51poKGqg@mail.gmail.com>
 <CA+BoTQkA0k1RBwzKFchcWebuWUmdoaqvaAq4BRz2o3C-GGUCog@mail.gmail.com>
 <CAMQd7ma7hehYLBf-5hUD0sViUwWGX8vy7ENXuBi8Q49F88A45Q@mail.gmail.com>
 <CA+BoTQkqttvPkk6qk6YV8SYPVnEcADfcUkLBCpjFoZBab81Byg@mail.gmail.com>
 <871tfr8ne9.fsf@kamboji.qca.qualcomm.com>
 <CAMQd7mY+upL+t9q0yJ0uL_jw_STEKL+hhe1PF_D5yPwfTkcgZg@mail.gmail.com>
 <874mkn71ls.fsf@kamboji.qca.qualcomm.com>
Date: Wed, 29 Jul 2015 16:22:24 +0200
Message-ID: <CAMQd7mYa4egNdyRq+8Wnv96L1aEU2esyfb0EEDjkbKO7O-9qDQ@mail.gmail.com>
Subject: Re: QCA6174 hw2.1 irq_mode=0 broken on 4.2-rc3, working on 4.1.2
From: Enrico Tagliavini <enrico.tagliavini@gmail.com>
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

U291bmQhIEknbGwga2VlcCBhIGNvcHkgb2YgdGhlIGxvZyB0aGVuLiBJZiB0aGUgYmlzZWN0IG9u
IGF0aDEwawpmb2xkZXIgd2lsbCBsZWFkIG5vd2hlcmUgSSdsbCBzZWUgaWYgSSBjYW4gbWFrZSBp
dCBvdmVyIHRoZSB3aG9sZQp0cmVlLiBBdCBsZWFzdCBieSBkb2luZyBpdCBvbiB0aGUgYXRoMTBr
IHRyZWUgSSBob3BlIHRvIG5hcnJvdyBkb3duCnRoZSBudW1iZXIgb2YgY29tbWl0LgoKT2sgdGhl
biBJJ2xsIHVzZSBMaW51cycgbWFzdGVyLCBubyBwcm9ibGVtIHdpdGggdGhpcy4KCkkgaG9wZSB0
byBhdCBsZWFzdCBnZXQgc3RhcnRlZCB0aGlzIHdlZWtlbmQuCgpPbiAyOSBKdWx5IDIwMTUgYXQg
MTE6MzAsIEthbGxlIFZhbG8gPGt2YWxvQHFjYS5xdWFsY29tbS5jb20+IHdyb3RlOgo+IEVucmlj
byBUYWdsaWF2aW5pIDxlbnJpY28udGFnbGlhdmluaUBnbWFpbC5jb20+IHdyaXRlczoKPgo+PiBZ
ZWFoIHRoYXQncyB3aGF0IEkgbWVhbnQuIE15IGlkZWEgd2FzIHRvIGZpcnN0IGJpc2VjdCBvbmx5
IHRoZSBhdGgxMGsKPj4gZGlyZWN0b3J5LCBzbyByZXN0cmljdGluZyB0aGUgYmlzZWN0IG9uIHRo
ZSBjb21taXRzIHRvdWNoaW5nIHN0dWZmCj4+IHRoZXJlLiBJIGd1ZXNzIGlmIHRoZSBpc3N1ZSBp
cyBtb3JlIGJyb2FkIGl0IHdpbGwgY29tZSB1cCBzb21ld2hlcmUKPj4gZWxzZSBhcyB3ZWxsLCBz
byB0aGlzIGlzIGEgZ29vZCBzdGFydGluZyBwb2ludCwgSSBob3BlLiBUaGFuayB5b3UgZm9yCj4+
IHBvaW50aW5nIGl0IG91dCB0aG91Z2gsIHRoaXMgd2lsbCBhY3R1YWxseSBiZSB0aGUgZmlyc3Qg
dGltZSBJIGRvIGEKPj4gcHJvcGVyIGJpc2VjdC4KPgo+IEFuZCByZW1lbWJlciB0byBhbHdheXMg
dG8gbWVudGlvbiBpZiB5b3UgaGF2ZSByZXN0cmljdGVkIHRoZSBiaXNlY3QKPiBzb21laG93LCB0
aGF0J3MgaW1wb3J0YW50IGluZm9ybWF0aW9uLiBBbmQgYmV0dGVyIGlmIHlvdSBwcm92aWRlICdn
aXQKPiBiaXNlY3QgbG9nJyBvdXRwdXQgYXMgd2VsbC4KPgo+PiBBbHNvIGRvIHlvdSB3YW50IG1l
IHRvIGJpc2VjdCBLYWxsZSdzIHNvdXJjZXMgb3IgTGludXMnIG1hc3Rlcj8gQnkKPj4gd2hhdCBN
aWNoYcWCIHNhaWQgSSBndWVzcyBLYWxsZSdzIGJ1dCBJIGFzayB0byBiZSBzdXJlLgo+Pgo+PiBB
bHNvIHRvIGJlIGNsZWFyOiBJJ20gdXNpbmcgTGludXMnIHNvdXJjZXMgYXQgdGhlIG1vbWVudCwg
YXMgcHJvdmlkZWQKPj4gYnkgRmVkb3JhIHJhd2hpZGUuCj4+Cj4+IEZvciBtZSBpdCdzIHRoZSBz
YW1lLCBzbyBsZXQgbWUga25vdyB3aGF0IHlvdSBwcmVmZXIgYW5kIGlzIG1vcmUKPj4gdXNlZnVs
IHRvIHNvbHZlIHRoaXMgaXNzdWUuCj4KPiBHb29kIHRoYXQgeW91IGJyb3VnaHQgdGhpcyB1cC4g
QXMgYXRoLmdpdCBtYXN0ZXIgYnJhbmNoIGdldHMgcmViYXNlZAo+IGV2ZXJ5IHJjMSByZWxlYXNl
IHlvdSByZWFsbHkgY2Fubm90IHVzZSB0aGF0IGZvciBiaXNlY3QuIEVpdGhlciB5b3UKPiBzaG91
bGQgdXNlIGF0aC5naXQgYXRoLW5leHQgYnJhbmNoIG9yIExpbnVzJyB0cmVlLiBUbyBiZSBvbiB0
aGUgc2FmZQo+IHNpZGUgSSBhbHdheXMgcmVjb21tZW5kIHRvIHVzZSBMaW51cycgdHJlZSBpZiBh
dCBhbGwgcG9zc2libGUuCj4KPiAtLQo+IEthbGxlIFZhbG8KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hdGgxMGsK
