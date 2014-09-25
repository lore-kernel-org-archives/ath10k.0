Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-we0-x229.google.com ([2a00:1450:400c:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XX2T9-0007wG-J7
 for ath10k@lists.infradead.org; Thu, 25 Sep 2014 06:24:00 +0000
Received: by mail-we0-f169.google.com with SMTP id k48so7315482wev.28
 for <ath10k@lists.infradead.org>; Wed, 24 Sep 2014 23:23:36 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5422F1C2.4090100@candelatech.com>
References: <1411518383-32634-1-git-send-email-greearb@candelatech.com>
 <1411518383-32634-2-git-send-email-greearb@candelatech.com>
 <CA+BoTQ=fS30xz9KcdBJcioNers6PovOFEeqPCCSFn52HkscXug@mail.gmail.com>
 <5422D6CF.10408@candelatech.com>
 <CA+BoTQk=X2qVJsY64ZH88h29L6+Y5M9K07nLtzo=0ga1bUsXGw@mail.gmail.com>
 <5422F1C2.4090100@candelatech.com>
Date: Thu, 25 Sep 2014 08:23:35 +0200
Message-ID: <CA+BoTQkncctvMFx7U0Qzq7+7W2o9Vo5qKcDEi6DUdJTEQWDfAA@mail.gmail.com>
Subject: Re: [RFC 2/2] ath10k: re-config ht_caps when chainmask is modified.
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMjQgU2VwdGVtYmVyIDIwMTQgMTg6MzAsIEJlbiBHcmVlYXIgPGdyZWVhcmJAY2FuZGVsYXRl
Y2guY29tPiB3cm90ZToKPiBPbiAwOS8yNC8yMDE0IDA4OjA1IEFNLCBNaWNoYWwgS2F6aW9yIHdy
b3RlOgo+PiBPbiAyNCBTZXB0ZW1iZXIgMjAxNCAxNjozNSwgQmVuIEdyZWVhciA8Z3JlZWFyYkBj
YW5kZWxhdGVjaC5jb20+IHdyb3RlOgo+Pj4gT24gMDkvMjQvMjAxNCAxMjo1MSBBTSwgTWljaGFs
IEthemlvciB3cm90ZToKPj4+PiBPbiAyNCBTZXB0ZW1iZXIgMjAxNCAwMjoyNiwgIDxncmVlYXJi
QGNhbmRlbGF0ZWNoLmNvbT4gd3JvdGU6Cj4+Pj4gWy4uLl0KPj4+Pj4KPj4+Pj4gK3N0YXRpYyBz
dHJ1Y3QgaWVlZTgwMjExX3N0YV92aHRfY2FwIGF0aDEwa19jcmVhdGVfdmh0X2NhcChzdHJ1Y3Qg
YXRoMTBrCj4+Pj4+ICphciwKPj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGJvb2wKPj4+Pj4gdXNlX2NmZ19jaGFpbnMpCj4+Pj4+
ICAgewo+Pj4+PiAgICAgICAgICBzdHJ1Y3QgaWVlZTgwMjExX3N0YV92aHRfY2FwIHZodF9jYXAg
PSB7MH07Cj4+Pj4+ICAgICAgICAgIHUxNiBtY3NfbWFwOwo+Pj4+PiAgICAgICAgICBpbnQgaTsK
Pj4+Pj4gKyAgICAgICBpbnQgbnJmID0gYXItPm51bV9yZl9jaGFpbnM7Cj4+Pj4+ICsKPj4+Pj4g
KyAgICAgICBpZiAodXNlX2NmZ19jaGFpbnMgJiYgYXItPmNmZ190eF9jaGFpbm1hc2spCj4+Pj4+
ICsgICAgICAgICAgICAgICBucmYgPSBnZXRfbnNzX2Zyb21fY2hhaW5tYXNrKGFyLT5jZmdfdHhf
Y2hhaW5tYXNrKTsKPj4+Pgo+Pj4+Cj4+Pj4gSXMgdXNlX2NmZ19jaGFpbnMgcmVhbGx5IG5lY2Vz
c2FyeSBoZXJlPyBJcyBzZXR0aW5nIHR4L3J4IGNoYWlubWFzayB0bwo+Pj4+IDB4MCBtYWtlIGFu
eSBzZW5zZSBhdCBhbGw/IFNob3VsZG4ndCB3ZSBkZW55IGl0IG9yIG1ha2UgaXQgZmFsbGJhY2sg
dG8KPj4+PiB0aGUgc3VwcG9ydGVkIHR4L3J4IGNoYWlubWFzayB2YWx1ZXM/Cj4+Pgo+Pj4gSXQg
d291bGQgY2F1c2UgdGhlIGxvZ2ljIHRvIGZsaXAgYmFjayB0byB0aGUgZGVmYXVsdHMsIHNvIHNl
ZW1zIG1pbGRseQo+Pj4gdXNlZnVsLiAgSSdtIG5vdCBzdXJlCj4+PiB1cHBlciBsYXllcnMgd291
bGQgZXZlciBsZXQgaXQgYmUgPCAxIHRob3VnaC4KPj4KPj4gMCBpcyBhIHZhbGlkIGFyZ3VtZW50
IGFzIGZhciBhcyB1cHBlciBsYXllcnMgYXJlIGNvbmNlcm5lZCBhbmQgc2hvdWxkCj4+IGJlIHRy
ZWF0ZWQgYXMgInVzZSBhbGwgYXZhaWxhYmxlIGFudGVubmFzIiAoc2VlIGBpdyBsaXN0YCBvdXRw
dXQKPj4gYmVmb3JlIGV2ZXIgc2V0dGluZyBhbnRlbm5hLCBhZnRlciBzZXR0aW5nIHRvLCBlLmcu
IDEgYW5kIHRoZW4gdG8gMCkuCj4+Cj4+IFRoaXMgaW1wbGllcyBjdXJyZW50IHNldF9hbnRlbm5h
KCkgaW1wbGVtZW50YXRpb24gaXMgYWN0dWFsbHkgYnVnZ3kKPj4gKHBkZXYgcGFyYW0gc2hvdWxk
IGludm9sdmUgdXNpbmcgc3VwcF90eC9yeF9jaGFpbm1hc2spLiBZb3VyCj4+IGFzc3VtcHRpb24g
aW4gcmVjZW50IHBhdGNoZXMgaXMgYWxzbyBpbmNvcnJlY3QgYXMgYW50ZW5uYSBtYXNrID0gMAo+
PiBzaG91bGQgaW1wbHkgbWF4IG5zcywgbm90IDEuCj4KPiBJIHRlc3RlZCB0aGlzIHVzaW5nOgo+
Cj4gaXcgcGh5IHdpcGh5MSBzZXQgYW50ZW5uYSAwIDAKPgo+IFRoaXMgZmxpcHMgaXQgYmFjayB0
byAzeDMgKEkgaGFkIHByZXZpb3VzbHkgY29uZmlndXJlZCBpdCBmb3IgMngyKSwKPiBzbyBJIHRo
aW5rIHRoZSBwYXRjaGVzIGFyZSB3b3JraW5nIHByb3Blcmx5LgoKTWVhIGN1bHBhLiBJdCB3aWxs
IGZsaXAgYmFjayBpbmRlZWQuCgpCdXQgSSBzdGlsbCBkb24ndCBzZWUgd2h5IHVzZV9jZmdfY2hh
aW5zIGlzIG5lY2Vzc2FyeS4gSSBkb24ndCBzZWUgaG93CmNmZ190eF9jaGFpbm1hc2sgY291bGQg
YmUgbm9uLXplcm8gd2hlbiBhdGgxMGsgaXMgcmVnaXN0ZXJpbmcgdG8gbWFjLgoKCk1pY2hhxYIK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBt
YWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
