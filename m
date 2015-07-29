Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZKNhD-0006RI-Sc
 for ath10k@lists.infradead.org; Wed, 29 Jul 2015 09:30:44 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: QCA6174 hw2.1 irq_mode=0 broken on 4.2-rc3, working on 4.1.2
References: <CAMQd7mbWC7rj8-eU7Jv21ehT8KrpC=L=xWxzDQxHEU_ePNSdUg@mail.gmail.com>
 <CA+BoTQmd0Uoi=2MNMsDXYe1yKsYa3P8uvVzWwXoMynQGtjeD4w@mail.gmail.com>
 <CAMQd7maioLviTaLHp+f03HafABijKD_d92K_SRO8XS51poKGqg@mail.gmail.com>
 <CA+BoTQkA0k1RBwzKFchcWebuWUmdoaqvaAq4BRz2o3C-GGUCog@mail.gmail.com>
 <CAMQd7ma7hehYLBf-5hUD0sViUwWGX8vy7ENXuBi8Q49F88A45Q@mail.gmail.com>
 <CA+BoTQkqttvPkk6qk6YV8SYPVnEcADfcUkLBCpjFoZBab81Byg@mail.gmail.com>
 <871tfr8ne9.fsf@kamboji.qca.qualcomm.com>
 <CAMQd7mY+upL+t9q0yJ0uL_jw_STEKL+hhe1PF_D5yPwfTkcgZg@mail.gmail.com>
Date: Wed, 29 Jul 2015 12:30:07 +0300
In-Reply-To: <CAMQd7mY+upL+t9q0yJ0uL_jw_STEKL+hhe1PF_D5yPwfTkcgZg@mail.gmail.com>
 (Enrico Tagliavini's message of "Wed, 29 Jul 2015 11:02:40 +0200")
Message-ID: <874mkn71ls.fsf@kamboji.qca.qualcomm.com>
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
To: Enrico Tagliavini <enrico.tagliavini@gmail.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

RW5yaWNvIFRhZ2xpYXZpbmkgPGVucmljby50YWdsaWF2aW5pQGdtYWlsLmNvbT4gd3JpdGVzOgoK
PiBZZWFoIHRoYXQncyB3aGF0IEkgbWVhbnQuIE15IGlkZWEgd2FzIHRvIGZpcnN0IGJpc2VjdCBv
bmx5IHRoZSBhdGgxMGsKPiBkaXJlY3RvcnksIHNvIHJlc3RyaWN0aW5nIHRoZSBiaXNlY3Qgb24g
dGhlIGNvbW1pdHMgdG91Y2hpbmcgc3R1ZmYKPiB0aGVyZS4gSSBndWVzcyBpZiB0aGUgaXNzdWUg
aXMgbW9yZSBicm9hZCBpdCB3aWxsIGNvbWUgdXAgc29tZXdoZXJlCj4gZWxzZSBhcyB3ZWxsLCBz
byB0aGlzIGlzIGEgZ29vZCBzdGFydGluZyBwb2ludCwgSSBob3BlLiBUaGFuayB5b3UgZm9yCj4g
cG9pbnRpbmcgaXQgb3V0IHRob3VnaCwgdGhpcyB3aWxsIGFjdHVhbGx5IGJlIHRoZSBmaXJzdCB0
aW1lIEkgZG8gYQo+IHByb3BlciBiaXNlY3QuCgpBbmQgcmVtZW1iZXIgdG8gYWx3YXlzIHRvIG1l
bnRpb24gaWYgeW91IGhhdmUgcmVzdHJpY3RlZCB0aGUgYmlzZWN0CnNvbWVob3csIHRoYXQncyBp
bXBvcnRhbnQgaW5mb3JtYXRpb24uIEFuZCBiZXR0ZXIgaWYgeW91IHByb3ZpZGUgJ2dpdApiaXNl
Y3QgbG9nJyBvdXRwdXQgYXMgd2VsbC4KCj4gQWxzbyBkbyB5b3Ugd2FudCBtZSB0byBiaXNlY3Qg
S2FsbGUncyBzb3VyY2VzIG9yIExpbnVzJyBtYXN0ZXI/IEJ5Cj4gd2hhdCBNaWNoYcWCIHNhaWQg
SSBndWVzcyBLYWxsZSdzIGJ1dCBJIGFzayB0byBiZSBzdXJlLgo+Cj4gQWxzbyB0byBiZSBjbGVh
cjogSSdtIHVzaW5nIExpbnVzJyBzb3VyY2VzIGF0IHRoZSBtb21lbnQsIGFzIHByb3ZpZGVkCj4g
YnkgRmVkb3JhIHJhd2hpZGUuCj4KPiBGb3IgbWUgaXQncyB0aGUgc2FtZSwgc28gbGV0IG1lIGtu
b3cgd2hhdCB5b3UgcHJlZmVyIGFuZCBpcyBtb3JlCj4gdXNlZnVsIHRvIHNvbHZlIHRoaXMgaXNz
dWUuCgpHb29kIHRoYXQgeW91IGJyb3VnaHQgdGhpcyB1cC4gQXMgYXRoLmdpdCBtYXN0ZXIgYnJh
bmNoIGdldHMgcmViYXNlZApldmVyeSByYzEgcmVsZWFzZSB5b3UgcmVhbGx5IGNhbm5vdCB1c2Ug
dGhhdCBmb3IgYmlzZWN0LiBFaXRoZXIgeW91CnNob3VsZCB1c2UgYXRoLmdpdCBhdGgtbmV4dCBi
cmFuY2ggb3IgTGludXMnIHRyZWUuIFRvIGJlIG9uIHRoZSBzYWZlCnNpZGUgSSBhbHdheXMgcmVj
b21tZW5kIHRvIHVzZSBMaW51cycgdHJlZSBpZiBhdCBhbGwgcG9zc2libGUuCgotLSAKS2FsbGUg
VmFsbwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRo
MTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
