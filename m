Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iT21M-0000BB-89
 for ath10k@lists.infradead.org; Fri, 08 Nov 2019 11:01:41 +0000
Received: by mail-ed1-f69.google.com with SMTP id f26so4145239edy.16
 for <ath10k@lists.infradead.org>; Fri, 08 Nov 2019 03:01:35 -0800 (PST)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Subject: Re: [PATCH v6 4/4] mac80211: Use Airtime-based Queue Limits (AQL) on
 packet dequeue
In-Reply-To: <0b43c4822ab83ea4d33a5a32d8ff6c7a56eff6c5.camel@sipsolutions.net>
References: <157182473951.150713.7978051149956899705.stgit@toke.dk>
 <157182474399.150713.16380222749144410045.stgit@toke.dk>
 <0b43c4822ab83ea4d33a5a32d8ff6c7a56eff6c5.camel@sipsolutions.net>
Date: Fri, 08 Nov 2019 12:01:32 +0100
Message-ID: <877e4afx83.fsf@toke.dk>
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
Cc: Kan Yan <kyan@google.com>, Rajkumar Manoharan <rmanohar@codeaurora.org>, Kevin Hayes <kevinhayes@google.com>, make-wifi-fast@lists.bufferbloat.net, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, John Crispin <john@phrozen.org>, Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>

Sm9oYW5uZXMgQmVyZyA8am9oYW5uZXNAc2lwc29sdXRpb25zLm5ldD4gd3JpdGVzOgoKPiBPbiBX
ZWQsIDIwMTktMTAtMjMgYXQgMTE6NTkgKzAyMDAsIFRva2UgSMO4aWxhbmQtSsO4cmdlbnNlbiB3
cm90ZToKPj4gCj4+ICsJaWYgKGluZm8tPnR4X3RpbWVfZXN0KSB7Cj4+ICsJCXN0cnVjdCBzdGFf
aW5mbyAqc3RhID0gTlVMTCwgKnM7Cj4+ICsJCXN0cnVjdCByaGxpc3RfaGVhZCAqdG1wOwo+PiAr
Cj4+ICsJCXJjdV9yZWFkX2xvY2soKTsKPj4gKwo+PiArCQlmb3JfZWFjaF9zdGFfaW5mbyhsb2Nh
bCwgaGRyLT5hZGRyMSwgcywgdG1wKSB7Cj4+ICsJCQkvKiBza2lwIHdyb25nIHZpcnR1YWwgaW50
ZXJmYWNlICovCj4+ICsJCQlpZiAoIWV0aGVyX2FkZHJfZXF1YWwoaGRyLT5hZGRyMiwgcy0+c2Rh
dGEtPnZpZi5hZGRyKSkKPj4gKwkJCQljb250aW51ZTsKPj4gKwo+PiArCQkJc3RhID0gczsKPj4g
KwkJCWJyZWFrOwo+PiArCQl9Cj4KPiBJIGd1ZXNzIHRoYXQgaXMgYmV0dGVyIHRoYW4gbG9va2lu
ZyB1cCB0aGUgc2RhdGEgYW5kIHRoZW4gdXNpbmcKPiBzdGFfaW5mb19nZXQoKSwgYnV0IEkgdGhp
bmsgSSdkIGxpa2UgdG8gc2VlIHRoaXMgd3JhcHBlZCBpbnRvIGEgZnVuY3Rpb24KPiAoZXZlbiBp
ZiBpdCdzIGFuIGlubGluZSkgaW4gc3RhX2luZm8ue2MsaH0uCgpPSywgY2FuIGRvLgoKPj4gKwkJ
YWlydGltZSA9IGllZWU4MDIxMV9jYWxjX2V4cGVjdGVkX3R4X2FpcnRpbWUoaHcsIHZpZiwgdHhx
LT5zdGEsCj4+ICsJCQkJCQkJICAgICBza2ItPmxlbik7Cj4+ICsJCWlmIChhaXJ0aW1lKSB7Cj4+
ICsJCQkvKiBXZSBvbmx5IGhhdmUgMTAgYml0cyBpbiB0eF90aW1lX2VzdCwgc28gc3RvcmUgYWly
dGltZQo+PiArCQkJICogaW4gaW5jcmVtZW50cyBvZiA0dXMgYW5kIGNsYW1wIHRoZSBtYXhpbXVt
IHRvIDIqKjEyLTEKPj4gKwkJCSAqLwo+PiArCQkJYWlydGltZSA9IG1pbl90KHUzMiwgYWlydGlt
ZSwgNDA5NSkgJiB+M1U7Cj4+ICsJCQlpbmZvLT50eF90aW1lX2VzdCA9IGFpcnRpbWUgPj4gMjsK
Pj4gKwkJCWllZWU4MDIxMV9zdGFfdXBkYXRlX3BlbmRpbmdfYWlydGltZShsb2NhbCwgdHguc3Rh
LAo+PiArCQkJCQkJCSAgICAgdHhxLT5hYywgYWlydGltZSwKPj4gKwkJCQkJCQkgICAgIGZhbHNl
KTsKPgo+IEkgd29uZGVyIGlmIGl0J2QgYmUgYmV0dGVyIHRvIHBhc3MgdGhlIHNoaWZ0ZWQgdmFs
dWUgdG8KPiBpZWVlODAyMTFfc3RhX3VwZGF0ZV9wZW5kaW5nX2FpcnRpbWUoKSB0byBhdm9pZCBh
bGwgdGhlIHNoaWZ0aW5nIGluIGFsbAo+IHBsYWNlcz8KPgo+IFlvdSBjb3VsZCBldmVuIHN0b3Jl
IHRoZSBzaGlmdGVkIHZhbHVlIGluICJhcWxfdHhfcGVuZGluZyIgYW5kCj4gImFxbF90b3RhbF9w
ZW5kaW5nX2FpcnRpbWUiIGV0Yy4sIGl0J3MgY29tcGxldGVseSBlcXVpdmFsZW50LCBhbmQgb25s
eQo+IHNoaWZ0IGl0IG91dCBmb3IgcGVvcGxlIGxvb2tpbmcgYXQgZGVidWdmcy4KCk15IHJlYXNv
bmluZyBmb3IgZG9pbmcgaXQgdGhpcyB3YXkgd2FzIHRoYXQgd2UgaGF2ZSBhbm90aGVyIHNldCBv
ZiBBUElzCmRlYWxpbmcgd2l0aCBhaXJ0aW1lIHdoaWNoIGRvZXNuJ3QgZG8gYW55IHNoaWZ0aW5n
OyBzbyBrZWVwaW5nIHRoZSBBUElzCmluIHRoZSBzYW1lIHVuaXQgKHN0cmFpZ2h0IGFpcnRpbWUp
IHNlZW1lZCBsZXNzIGNvbmZ1c2luZy4KCldlIGNvdWxkIGFkZCAoaW5saW5lKSBzZXR0ZXIgYW5k
IGdldHRlciBmdW5jdGlvbnMgZm9yIHRoZSB0eF90aW1lX2VzdApmaWVsZCBpbnN0ZWFkIHRvIGF2
b2lkIHNwcmlua2xpbmcgc2hpZnRzIGFsbCBvdmVyIHRoZSBwbGFjZT8gOikKCi1Ub2tlCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxp
bmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
