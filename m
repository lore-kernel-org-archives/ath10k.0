Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x233.google.com ([2a00:1450:400c:c00::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xqz0H-0000HS-Uw
 for ath10k@lists.infradead.org; Wed, 19 Nov 2014 06:44:39 +0000
Received: by mail-wg0-f51.google.com with SMTP id k14so10427884wgh.10
 for <ath10k@lists.infradead.org>; Tue, 18 Nov 2014 22:44:10 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAD1M062FNiiAD=Q6zGX8ooSfrQTj8gi_1oDSdEPjAQsaNPrjEw@mail.gmail.com>
References: <CAD1M060Y+3r_-J12ZqT4TqddUf9tJHKCEPJ0DhFJ1sCiXimdVw@mail.gmail.com>
 <5461382B.6070607@candelatech.com>
 <CAD1M062xcGu2EJzxaXYQt5uHyDxHpEE+FDiPB4SBirXX5ePz_A@mail.gmail.com>
 <54613C13.9010008@candelatech.com>
 <CAD1M061wRo5MqmKYy8jw9fKpraA0DFJTh4k+QNzLkayLmBttfA@mail.gmail.com>
 <CA+BoTQk7idFbyYzLxKCgmSQ=zzQTraOJ-fy5_qhDpzkueQe8KQ@mail.gmail.com>
 <CAD1M063n=WGeQRJKycvWYGMZRFN4gabM56dgeX_4tf8W8hyUKA@mail.gmail.com>
 <CA+BoTQkfPJp4tg8eR4OJDs2Cf_s0x36QYD-Yq6fTQ41c1jm6TA@mail.gmail.com>
 <CAD1M0638VrB_hAqAn-H-02cjF6ivQzFBwtqs02BxgzLRdpCGsg@mail.gmail.com>
 <CA+BoTQkdZ52GKaGzKL_NU8TD5fCxxxiObj6RnBXk1Rz=426N7w@mail.gmail.com>
 <CAD1M062FNiiAD=Q6zGX8ooSfrQTj8gi_1oDSdEPjAQsaNPrjEw@mail.gmail.com>
Date: Wed, 19 Nov 2014 07:44:10 +0100
Message-ID: <CA+BoTQn2xi3ssEn+HGc_5pgdb5Xrw4SPqBD4-QaWT1d9LqieMA@mail.gmail.com>
Subject: Re: htt rx stopped. cannot recover
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
To: Pushpal Sidhu <psidhu@gateworks.com>
Cc: Ben Greear <greearb@candelatech.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMTkgTm92ZW1iZXIgMjAxNCAwMjoyMywgUHVzaHBhbCBTaWRodSA8cHNpZGh1QGdhdGV3b3Jr
cy5jb20+IHdyb3RlOgo+IE9uIE1vbiwgTm92IDE3LCAyMDE0IGF0IDEwOjU2IFBNLCBNaWNoYWwg
S2F6aW9yIDxtaWNoYWwua2F6aW9yQHRpZXRvLmNvbT4gd3JvdGU6Cj4+IFlvdSBjYW4gZ2V0IHN1
cGVyIHN1cmUgYW5kIHRha2UgYSBsb29rIGluIGRtZXNnL3N5c2xvZyB0byB2ZXJpZnkgaWYKPj4g
YXRoMTBrJ3Mgd2xhbiBpbnRlcmZhY2UgaXMgaW4gcHJvbWlzYyBtb2RlIG9yIG5vdC4gSSBndWVz
cyBpdCdzIG5vdAo+PiB0aG91Z2guCj4gSXQgc2VlbXMgdGhhdCB0aGVyZSdzIGEgInZkZXYgMCIu
IEknbGwgbG9vayBpbnRvIGhhY2tpbmcgdGhpcyBvdXQKPiBsYXRlciB3aGVuIEkgZ2V0IHNvbWUg
bW9yZSB0aW1lLCB0aG91Z2ggaXQgc2VlbXMgdGhhdCB3aGVuZXZlciBhCj4gc3RhdGlvbiBpcyBh
c3NvY2lhdGVkIHdpdGggYW4gQVAsIGEgdmRldiBpcyBhbHdheXMgY3JlYXRlZC4KClRoaXMgaXMg
ZmluZS4gRWFjaCB2aWYgd2lsbCBoYXZlIGEgdmRldiBvZiBhbiBhY2NvcmRpbmcgdHlwZS4gUHJv
bWlzYwptb2RlIHRyaWdnZXJzIGNyZWF0aW9uIG9mIGFuIGFkZGl0aW9uYWwsIHNwZWNpYWwgdmRl
diAod2hpY2ggaXNuJ3QKYXNzb2NpYXRlZCB3aXRoIGFueSB2aWYgd2hhdHNvZXZlcikgd2l0aCB0
eXBlPW1vbml0b3IKCgpbLi4uXQo+IFdoaWxlIHJ1bm5pbmcgdGhlIGV4dGVuZGVkIHRlc3QsIGF0
IGFib3V0IDcgaG91cnMgb2YgY29udGludW91cwo+IHRlc3Rpbmcgd2l0aCB0aGUgdHdvIGJvYXJk
cyB3aXRob3V0IGEgUENJZSBicmlkZ2UgKGNvbmZpZ3VyZWQgYXMgYQo+IHdpcmVsZXNzIGJyaWRn
ZSBlLmcuIDRhZGRyPW9uKSwgdGhlIFNUQXRpb24gaGFzIGEga2VybmVsIHBhbmljIHRoYXQKPiBz
ZWVtcyB0byBiZSBjYXVzZWQgYnkgYSBkb3VibGUgZnJlZSBvciBzb21ldGhpbmcgc2ltaWxhci4g
TG9nIGlzCj4gbG9jYXRlZCBoZXJlIChnbGFkIEkgc2V0ICdkZWJ1ZycgaW4ga2VybmVsIGNtZGxp
bmUpOgo+IGh0dHA6Ly9kcGFzdGUuY29tLzFHNzdYN04gKG1vc3QgaW50ZXJlc3RpbmcgaW5mbyBs
b2NhdGVkIGJldHdlZW4gdGltZXMKPiBbMjU2ODQuNTEyOTcxXSAtIFsyNTY4NC41ODc1ODVdKS4K
CklzIHRoaXMgb24gdmFuaWxsYSBhdGgxMGsgY29kZSBvciBkaWQgeW91IGlnbm9yZSB0aGUgcnhf
Y29uZnVzZWQgZmxhZwpkdXJpbmcgdGhlIHRlc3Q/CgpBbnl3YXkgaXQnZCBiZSBsb3ZlbHkgaWYg
eW91IGNvdWxkIGdldCB0aGUgY29kZSBsaW5lIGZvcgphdGgxMGtfaHR0X3R4cnhfY29tcGxfdGFz
aysweDEwMCAoZS5nLiB2aWEgYGdkYmAgd2l0aCBgbCAqCmF0aDEwa19odHRfdHhyeF9jb21wbF90
YXNrKzB4MTAwKWAuCgoKTWljaGHFggoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
