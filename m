Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x22c.google.com ([2a00:1450:400c:c09::22c])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bIW6I-00021O-Cw
 for ath10k@lists.infradead.org; Thu, 30 Jun 2016 07:09:27 +0000
Received: by mail-wm0-x22c.google.com with SMTP id r201so104162229wme.1
 for <ath10k@lists.infradead.org>; Thu, 30 Jun 2016 00:09:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1467218124941.40575@qti.qualcomm.com>
References: <20160614061728.570-1-rmanohar@qti.qualcomm.com>
 <e05dcb58-1cb1-a33a-31bb-b8ba1edf1363@dd-wrt.com>
 <fa3eab06-28f0-e5d4-2e92-770134b49dfa@dd-wrt.com>
 <1467218124941.40575@qti.qualcomm.com>
From: Michal Kazior <michal.kazior@tieto.com>
Date: Thu, 30 Jun 2016 09:09:01 +0200
Message-ID: <CA+BoTQkepLz55Vdr7OuMnPQPLKq_+vjZi=m2Y9rHLRgBZPsWOw@mail.gmail.com>
Subject: Re: [PATCH] ath10k: fix system hang at qca99x0 probe on x86 platform
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
To: "Manoharan, Rajkumar" <rmanohar@qti.qualcomm.com>
Cc: "Valo, Kalle" <kvalo@qca.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Sebastian Gottschall <s.gottschall@dd-wrt.com>, "nbd@nbd.name" <nbd@nbd.name>

T24gMjkgSnVuZSAyMDE2IGF0IDE4OjM1LCBNYW5vaGFyYW4sIFJhamt1bWFyIDxybWFub2hhckBx
dGkucXVhbGNvbW0uY29tPiB3cm90ZToKPj4+IEFtIDI5LjA2LjIwMTYgdW0gMTY6MDQgc2Nocmll
YiBTZWJhc3RpYW4gR290dHNjaGFsbDoKPj4+IHRoaXMgZml4IHdpbGwgY3Jhc2ggUUNBOTk4MCBv
biBRQ0EgSVBRODA2NCBjcHUgYmFzZWQgc3lzdGVtcy4KPj4+IHNvIHBsZWFzZSByZXdvcmsgaXQs
IG9yIGxlYXZlIGl0IG91dC4KPj4+IG5vdGU6Cj4+PiBtYXliZSB0aGUgbGltaXQgb2YgMjU2a2Ig
aXMgdG9vIGxvdyBmb3IgdGhhdCBjYXJkCj4+Pgo+PiBieSB0aGUgd2F5LiA1MTIgd29ya3MKCkkg
dGhpbmsgdGhpcyBzdWdnZXN0cyB0aGUgcHJvYmxlbSBpc24ndCBhYm91dCBtZW1vcnkgY2h1bmsg
c2l6ZSBsaW1pdApwZXIgc2UgYnV0IHNvbWUga2luZCBvZiBidWcgaW4gYWRkcmVzcy9vZmZzZXQg
bG9naWMgaW4gZncgb3IgaHcuCgpETUEgY29oZXJlbnQgYW5kIHNpbmdsZS1tYXAgYWRkcmVzc2Vz
IHVzZSBjb21wbGV0ZWx5IGRpZmZlcmVudCByYW5nZXMKaW4gbWFueSBjYXNlcy4gUGVyaGFwcyBz
b21lIE1TQnMgYXJlIG5vdCBwcm9wZXJseSBoYW5kbGVkIGluIGZ3IG9yIGh3LgpJIHJlY2FsbCB0
aGVyZSBpcyBhIG1hZ2ljIG1hY3JvIHRocm91Z2ggd2hpY2ggdGFyZ2V0IGRldmljZSBhY2Nlc3Nl
cwpob3N0IG1lbW9yeSBzbyBtYXliZSB0aGF0J3MgYSBnb29kIHBsYWNlIHRvIGxvb2sgdG8gYmV0
dGVyIHVuZGVyc3RhbmQKdGhlIHByb2JsZW0/CgpJIHJlY2FsbCBCZW4gbWVudGlvbmVkIGhlIHdv
cmtlZCBhcm91bmQgdGhlIHByb2JsZW0gYnkgZW5hYmxpbmcKSU9NTVUvVlQtZCBvbiBoaXMgc3lz
dGVtLiBUaGlzIGNvdWxkIGVpdGhlciBwcmV2ZW50IHRoZSBkZXZpY2UgZnJvbQpkb2luZyBiYWQg
dGhpbmdzIG9yIG1heWJlIGNoYW5nZWQgRE1BIGFkZHJlc3MgcmFuZ2VzIHRoYXQgYXJlIGhhbmRl
ZApvdXQgdG8gdGhlIGRyaXZlciBlZmZlY3RpdmVseSBvciBjaGFuZ2VkIFBDSSBjb250cm9sbGVy
IGJlaGF2aW9yIGluCnNvbWUgd2F5LgoKCj4gVGhhbmtzIGEgbG90IFNlYmFzdGlhbi4gTGV0IG1l
IGNvbmZpcm0gdGhlIHNhbWUgb24geDg2IGFuZCB3aWxsIHVwZGF0ZSB0aGUgY2hhbmdlLgoKSnVz
dCBjaGFuZ2luZyB0aGUgbWVtb3J5IGNodW5rIHNpemUgbGltaXQgYmxpbmRseSBpcyBiYWQgYW5k
ClNlYmFzdGlhbidzIGNyYXNoIGhhcyBwcm92ZW4gaXQuIDUxMiBtYXkgc2VlbSB0byB3b3JrIG5v
dyBidXQgaXQgbWF5CmZhaWwgd2l0aCBhIG90aGVyIDEwLjQgZmlybXdhcmUgcmV2aXNpb25zIG9y
IG1ha2UgeDg2IGhhbmcgaW4gb3RoZXIKY2FzZXMuCgoKTWljaGHFggoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgx
MGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2F0aDEwawo=
