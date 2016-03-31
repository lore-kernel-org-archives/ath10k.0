Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1alWF6-0000g8-AG
 for ath10k@lists.infradead.org; Thu, 31 Mar 2016 06:38:08 +0000
Received: by mail-wm0-x22d.google.com with SMTP id 20so99679937wmh.1
 for <ath10k@lists.infradead.org>; Wed, 30 Mar 2016 23:37:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <56FBF3CF.5090009@candelatech.com>
References: <56FAF40B.1040301@candelatech.com>
 <CA+BoTQkfYwCfH2iWyzWbugCK50whafctRtfy928tzHpo7oq7ZQ@mail.gmail.com>
 <56FBF3CF.5090009@candelatech.com>
Date: Thu, 31 Mar 2016 08:37:46 +0200
Message-ID: <CA+BoTQk9O9HVGwFT_pPSAcSfwwvEaDkBL+R_B+JNUr6Vav9dxg@mail.gmail.com>
Subject: Re: Why is peer->peer_ids a bitmap?
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
To: Ben Greear <greearb@candelatech.com>
Cc: ath10k <ath10k@lists.infradead.org>

T24gMzAgTWFyY2ggMjAxNiBhdCAxNzo0MiwgQmVuIEdyZWVhciA8Z3JlZWFyYkBjYW5kZWxhdGVj
aC5jb20+IHdyb3RlOgo+IE9uIDAzLzMwLzIwMTYgMDM6MDcgQU0sIE1pY2hhbCBLYXppb3Igd3Jv
dGU6Cj4+Cj4+IE9uIDI5IE1hcmNoIDIwMTYgYXQgMjM6MzAsIEJlbiBHcmVlYXIgPGdyZWVhcmJA
Y2FuZGVsYXRlY2guY29tPiB3cm90ZToKPj4+Cj4+PiBDYW4gYSBzaW5nbGUgcGVlciBvYmplY3Qg
cmVhbGx5IGhhdmUgbW9yZSB0aGFuIG9uZSBJRD8KPj4KPj4KPj4gV2hlbiB5b3UgaW5zdGFsbCBr
ZXlzIHlvdSB0eXBpY2FsbHkgZ2V0IG1vcmUgaWRzIHZpYSBodHQtcGVlci1tYXAKPj4gZXZlbnQu
IEkgdGhpbmsgdGhlcmUgd2VyZSBzb21lIG90aGVyIGNhc2VzIGFzIHdlbGwuLgo+Pgo+Pgo+Pj4g
SXMgdGhpcyB0cnlpbmcgdG8gZGVhbCB3aXRoIHNoYXJlZCBwZWVyIG9iamVjdHMsIHBlcmhhcHM/
Cj4+Cj4+Cj4+IFRoaXMgd2FzIGRldmVsb3BlZCB2ZXJ5IGxvbmcgYWdvIHdoZW4gcGVlci1pZCBt
YXBwaW5nIHdhc24ndCByZWFsbHkKPj4gd2VsbCB1bmRlcnN0b29kLiBQZXJoYXBzIHdlIGNvdWxk
IG1ha2UgZG8gd2l0aG91dCBwZWVyIGlkIG1hcCBub3c/Cj4+IGkuZS4gb25seSBjYXJlIGFib3V0
IHRoZSBmaXJzdCBodHQtcGVlci1tYXAgcGVyIHBlZXIgYWRkcmVzcz8KPgo+Cj4gVGhlIDEwLjQu
MyBmaXJtd2FyZSBjYW4gcHJvYmFibHkgc3RpbGwgZG8gc2hhcmVkIHBlZXJzLCB0aG91Z2ggbm90
IHN1cmUgaWYKPiBpdCBhY3R1YWxseQo+IGhhcHBlbnMgaW4gcHJhY3RpY2UsIGFuZCBJJ20gbm90
IHN1cmUgaXQgdGhhdCB3b3VsZCBjYXVzZSB0aGlzIGJpdG1hcCB0bwo+IGV2ZXIgaGF2ZSBtb3Jl
IHRoYW4gb25lIGJpdCBzZXQgYW55d2F5Lgo+Cj4gSXQganVzdCBzdHJ1Y2sgbWUgYXMgc3RyYW5n
ZSwgbWFpbmx5LCBhbmQgc2luY2UgdGhlIHJhZGlvIHN0cnVjdCBoYXMKPiBhIHBlZXIgYXJyYXkg
aW5kZXhlZCBieSB0aGUgcGVlci1pZCwgdGhlbiBpdCB3b3VsZCBzZWVtIHRoYXQgd2Ugc2hvdWxk
IG5ldmVyCj4gaGF2ZSBkdXBsaWNhdGUgYml0cyBzZXQgaW4gYW55IG9mIHRoZSBwZWVyIG9iamVj
dHMuICBBbmQsIGlmIHRoYXQgaXMKPiBjb3JyZWN0LAo+IHRoZW4gdGhlIGJpdG1hcCBvciBzaW1p
bGFyIHNob3VsZCBwcm9iYWJseSBiZSBpbiB0aGUgcmFkaW8gc3RydWN0IGluc3RlYWQgb2YKPiBp
biBwZWVyIG9iamVjdHMuCgpBaCwgZ29vZCBwb2ludC4gVGhlIHBlZXJfbWFwW10gd2FzIGludHJv
ZHVjZWQgcmVjZW50bHkgdG8gYWxsb3cgcXVpY2sKcGVlcl9pZCAtPiBwZWVyL3N0YXRpb24gdHJh
bnNsYXRpb24gZm9yIHB1bGwtcHVzaCBwdXJwb3Nlcy4gU28geWVzIC0KdGhlcmUgc29tZSBkdXBs
aWNhdGlvbiBnb2luZyBvbiBub3cuIEkgZ3Vlc3MgdGhlIGJpdG1hcCBjb3VsZCBnbyBhd2F5LgoK
Ck1pY2hhxYIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
