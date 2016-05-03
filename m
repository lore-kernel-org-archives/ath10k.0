Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oi0-x22d.google.com ([2607:f8b0:4003:c06::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1axend-0000N3-IZ
 for ath10k@lists.infradead.org; Tue, 03 May 2016 18:11:58 +0000
Received: by mail-oi0-x22d.google.com with SMTP id x201so36639521oif.3
 for <ath10k@lists.infradead.org>; Tue, 03 May 2016 11:11:36 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1462298099.5535.315.camel@edumazet-glaptop3.roam.corp.google.com>
References: <CAA93jw6QLyx9EaS+ntB0D3duoysu_Z-UYyQfHnRa=pfqPDfWOw@mail.gmail.com>
 <1462125592.5535.194.camel@edumazet-glaptop3.roam.corp.google.com>
 <865DA393-262D-40B6-A9D3-1B978CD5F6C6@gmail.com>
 <CAA93jw6WKyWmgzni1Tn0oQfJyN7hss++MKLkJ8+3sRcVLu7krg@mail.gmail.com>
 <CAA93jw5NwBMzNrm6S2wPnx4yLTYq1k_J-cJ_Bi73p_uD_uo1xw@mail.gmail.com>
 <7A2801D5E40DD64A85E38DF22117852CD09A181F@wdc1exchmbxp01.hq.corp.viasat.com>
 <7A2801D5E40DD64A85E38DF22117852CD09A1873@wdc1exchmbxp01.hq.corp.viasat.com>
 <1462282531.5535.307.camel@edumazet-glaptop3.roam.corp.google.com>
 <CAA93jw4JrsR+3pR31OvghppU6n3VnvFodnFNfLkj8=4K_u4YNw@mail.gmail.com>
 <1462298099.5535.315.camel@edumazet-glaptop3.roam.corp.google.com>
Date: Tue, 3 May 2016 11:11:35 -0700
Message-ID: <CAA93jw5Az0T_muiAWQdeVkvHP6+Ke+yDOzktRvFLgkSvo38Yiw@mail.gmail.com>
Subject: Re: [Codel] fq_codel_drop vs a udp flood
From: Dave Taht <dave.taht@gmail.com>
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
To: Eric Dumazet <eric.dumazet@gmail.com>
Cc: Jonathan Morton <chromatix99@gmail.com>, "Agarwal,
 Anil" <Anil.Agarwal@viasat.com>, "codel@lists.bufferbloat.net" <codel@lists.bufferbloat.net>, ath10k <ath10k@lists.infradead.org>, "make-wifi-fast@lists.bufferbloat.net" <make-wifi-fast@lists.bufferbloat.net>

T24gVHVlLCBNYXkgMywgMjAxNiBhdCAxMDo1NCBBTSwgRXJpYyBEdW1hemV0IDxlcmljLmR1bWF6
ZXRAZ21haWwuY29tPiB3cm90ZToKPiBPbiBUdWUsIDIwMTYtMDUtMDMgYXQgMTA6MzcgLTA3MDAs
IERhdmUgVGFodCB3cm90ZToKPj4gVGh1cyBmYXIgdGhpcyBiYXRjaCBkcm9wIHBhdGNoIGlzIHRl
c3Rpbmcgb3V0IGJlYXV0aWZ1bGx5LiBVbmRlciBhCj4+IDkwME1iaXQgZmxvb2QgZ29pbmcgaW50
byAxMDBNYml0IG9uIHRoZSBwY2VuZ2luZXMgYXB1MiwgIGNwdSB1c2FnZSBmb3IKPj4ga3NvZnRp
cnFkIG5vdyBkb2Vzbid0IGNyYWNrIDEwJSwgd2hlcmUgYmVmb3JlICh1bmRlcgo+PiBwaWUscGZp
Zm8sZnFfY29kZWwsY2FrZSAmIHRoZSBwcmlvciBmcV9jb2RlbCkgaXQgd2VudCB0byA4OCUgYW5k
Cj4+IHVsdGltYXRlbHkgYmFkIHRoaW5ncyBoYXBwZW5lZCwgbGlrZSBsb3Npbmcgcm91dGFiaWxp
dHkuCj4+Cj4+IEkndmUgaGFkIGl0IHJ1bm5pbmcgZm9yIGhvdXJzIGFuZCBJIGhhcmRseSBub3Rp
Y2UgaXQncyB0aGVyZS4KPj4KPgo+IEV4Y2VsbGVudCwgdGhhbmtzIGZvciB0ZXN0aW5nIGl0LgoK
R2V0dGluZyBpdCB1cCB0byA0IGZsb29kcyB3aXRoIDhrIHVkcCBmcmFnbWVudHMgZWFjaCBjb3Vs
ZCB0YWtlIGl0IHVwCnRvIGFib3V0IDIwLTMwJSBvZiBjcHUuCgppcGVyZjMgLWMgMTcyLjI2LjY0
LjIwMCAtdSAtUCA0IC1iMjAwTWJpdCAtdCA2MDAgJgoKc3RpbGwsIGJleW9uZCBhd2Vzb21lLgoK
Pgo+PiBQZXJmb3JtYW5jZSBmb3IgdGhlIG5vcm1hbCBjYyBjb250cm9sbGVkIGFuZC9vciBzcGFy
c2UgZmxvd3MgaXMKPj4gdW5hZmZlY3RlZCwgYXNpZGUgZnJvbSB0aGUgdW5jb250cm9sbGVkIGZs
b3dzIGVhdGluZyB0aGVpciBwZXJjZW50YWdlCj4+IG9mIHRoZSBsaW5rLgo+Pgo+PiBOaWNlIHdv
cmsuIFRoeC4gVGhpcyBzaG91bGQgZ28gaW50byAtc3RhYmxlLgo+Pgo+PiBodHRwczovL3BhdGNo
d29yay5vemxhYnMub3JnL3BhdGNoLzYxNzMwNy8KPj4KPj4gU2lnaC4gVGhlIFJGQyBpcyBwYXN0
IGxhc3QgY2FsbC4uLgo+Cj4gSXQgaXMgbWVyZ2VkIDoKPgo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5v
cmcvY2dpdC9saW51eC9rZXJuZWwvZ2l0L2RhdmVtL25ldC1uZXh0LmdpdC9jb21taXQvP2lkPTlk
MTg1NjJhMjI3ODc0Mjg5ZmRhOGNhNWQxMTdkOGY1MDNmMWRjY2EKCnRoZSBpZXRmIGFwcHJvdmFs
IHByb2Nlc3MgaXMgYWJvdXQgMTc1MTIgaG91cnMgbG9uZ2VyIHRoYW4gdGhlIG5ldGRldgphcHBy
b3ZhbCBwcm9jZXNzLgoKPgo+CgoKCi0tIApEYXZlIFTDpGh0CkxldCdzIGdvIG1ha2UgaG9tZSBy
b3V0ZXJzIGFuZCB3aWZpIGZhc3RlciEgV2l0aCBiZXR0ZXIgc29mdHdhcmUhCmh0dHA6Ly9ibG9n
LmNlcm93cnQub3JnCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
