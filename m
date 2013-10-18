Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x235.google.com ([2a00:1450:4013:c00::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VXCBJ-0007wl-Oy
 for ath10k@lists.infradead.org; Fri, 18 Oct 2013 15:41:42 +0000
Received: by mail-ee0-f53.google.com with SMTP id t10so2105097eei.26
 for <ath10k@lists.infradead.org>; Fri, 18 Oct 2013 08:41:16 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87txgfytvc.fsf@kamboji.qca.qualcomm.com>
References: <52588F0C.3000009@candelatech.com>
 <525EB81E.5060305@candelatech.com>
 <87li1t5gmi.fsf@kamboji.qca.qualcomm.com>
 <87r4bk2spq.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQkbqvrcEQSkkHyYi0J1_Pa4yTC5Pk=CtKbd4_uOO3pBDg@mail.gmail.com>
 <87txgfytvc.fsf@kamboji.qca.qualcomm.com>
Date: Fri, 18 Oct 2013 08:41:16 -0700
Message-ID: <CA+BoTQmTMHkELHmO3hK6zcMyyy0OoatkKkxc+OdM_HnDQ2tCQQ@mail.gmail.com>
Subject: Re: Fwd: ath10k related kernel crash in wireless-testing
 (3.12.0-rc3-wl+)
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
Cc: Ben Greear <greearb@candelatech.com>, ath10k@lists.infradead.org

T24gMTcgT2N0b2JlciAyMDEzIDIzOjI5LCBLYWxsZSBWYWxvIDxrdmFsb0BxY2EucXVhbGNvbW0u
Y29tPiB3cm90ZToKPiBNaWNoYWwgS2F6aW9yIDxtaWNoYWwua2F6aW9yQHRpZXRvLmNvbT4gd3Jp
dGVzOgo+Cj4+IE9uIDE3IE9jdG9iZXIgMjAxMyAwMTo0MywgS2FsbGUgVmFsbyA8a3ZhbG9AcWNh
LnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4+PiBLYWxsZSBWYWxvIDxrdmFsb0BxY2EucXVhbGNvbW0u
Y29tPiB3cml0ZXM6Cj4+Pgo+Pj4+IEJlbiBHcmVlYXIgPGdyZWVhcmJAY2FuZGVsYXRlY2guY29t
PiB3cml0ZXM6Cj4+Pj4KPj4+Pj4gSSBzZW50IHRoaXMgdG8gdGhlIHdyb25nIGxpc3QgdGhlIGZp
cnN0IHRpbWUuCj4+Pj4+Cj4+Pj4+IERvIHlvdSBrbm93IGlmIHRoaXMgaXMgYWxyZWFkeSBhZGRy
ZXNzZWQ/ICBJZiBub3QsIEknbGwgc2VlIGlmIEkgY2FuCj4+Pj4+IGZpbmQgYSBmaXguCj4+Pj4K
Pj4+PiBbLi4uXQo+Pj4+Cj4+Pj4+IGF0aDEwazogTVNJLVggaW50ZXJydXB0IGhhbmRsaW5nICg4
IGludHJzKQo+Pj4+PiBhdGgxMGs6IFVuYWJsZSB0byB3YWtldXAgdGFyZ2V0Cj4+Pj4+IGF0aDEw
azogdGFyZ2V0IHRvb2sgbG9uZ2VyIDUwMDAgdXMgdG8gd2FrZSB1cCAoYXdha2UgY291bnQgMSkK
Pj4+Pj4gYXRoMTBrOiBGYWlsZWQgdG8gZ2V0IHBjaWUgc3RhdGUgYWRkcjogLTE2Cj4+Pj4+IGF0
aDEwazogZWFybHkgZmlybXdhcmUgZXZlbnQgaW5kaWNhdGVkCj4+Pj4+IEJVRzogdW5hYmxlIHRv
IGhhbmRsZSBrZXJuZWwgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIGF0IDAwMDAwMDAwMDAwMDAw
MDQKPj4+Pj4gSVA6IFs8ZmZmZmZmZmZhMDZhZTQ2Yz5dIGF0aDEwa19jZV9jb21wbGV0ZWRfc2Vu
ZF9uZXh0KzB4NDcvMHgxMjIKPj4+Pj4gW2F0aDEwa19wY2ldCj4+Cj4+IEhtbS4uIGlmIEJNSSBo
YW5kbGVycyBhcmUgc2V0IHRoZW4gbXVzdCd2ZSBiZWVuIENFIGlzIGFsbG9jYXRlZAo+PiBlYXJs
aWVyLiBJJ20gc3VzcGVjdGluZyB0aGlzIGlzIGJlY2F1c2UgYXRoMTBrX3BjaV9jZV9kZWluaXQo
KSBnZXRzCj4+IGNhbGxlZCBvbiBhdGgxMGtfcGNpX3Bvd2VyX3VwKCkgZmFpbHBhdGggYmVmb3Jl
IGludGVycnVwdHMgYXJlCj4+IGRpc2FibGVkL2hhbmxkZXJzIHVucmVnaXN0ZXJlZC4KPj4KPj4g
SW4gdGhhdCBjYXNlIHRoZSBzb2x1dGlvbiBpcyB0byBmaXggdGhlIGZhaWxwYXRoIGluCj4+IGF0
aDEwa19wY2lfcG93ZXJfdXAoKS4gRGlzYWJsaW5nIGludGVycnVwdHMgb3IgbW92aW5nCj4+IGF0
aDEwa19wY2lfY2VfZGVpbml0KCkgYmVmb3JlIHRoZSB2ZXJ5IHJldHVybiBzdGF0ZW1lbnQgaW4K
Pj4gYXRoMTBrX3BjaV9oaWZfcG93ZXJfdXAoKSdzIGZhaWxwYXRoIHNob3VsZCBzdWZmaWNlLiBJ
dCBzaG91bGQgYmUgc2FmZQo+PiB0byBjYWxsIGF0aDEwa19wY2lfY2VfZGVpbml0KCkgd2l0aG91
dCBjYWxsaW5nIHRvCj4+IGF0aDEwa19wY2lfY2VfaW5pdCgpLgo+Cj4gQnV0IGRvZXNuJ3QgdGhh
dCB3aWxsIHN0aWxsIGxlYXZlIHRoZSByYWNlIG9mIGhhdmluZyBpbnRlcnJ1cHRzIGVuYWJsZWQK
PiBidXQgdGFza2xldCBoYW5kbGVyIG5vdCBwcm9wZXJseSBpbml0aWFsaXNlZD8gSSB0aGluayB0
aGUgcmlnaHQgZml4IGlzCj4gdG8gZmlyc3QgaW5pdGlhbGlzZSBldmVyeXRoaW5nIGFuZCBvbmx5
IHRoZW4gZW5hYmxlIGludGVycnVwdHMuCgpZZXMuIEl0IHdvdWxkIHN0aWxsIGxlYXZlIHRoYXQg
Y2FzZSBicm9rZW4uCgoKTWljaGHFggoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
