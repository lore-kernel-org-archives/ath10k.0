Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XWoIJ-0004wD-UN
 for ath10k@lists.infradead.org; Wed, 24 Sep 2014 15:15:53 +0000
Message-ID: <5422E012.1030003@candelatech.com>
Date: Wed, 24 Sep 2014 08:15:30 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [RFC 2/2] ath10k: re-config ht_caps when chainmask is modified.
References: <1411518383-32634-1-git-send-email-greearb@candelatech.com>	<1411518383-32634-2-git-send-email-greearb@candelatech.com>	<CA+BoTQ=fS30xz9KcdBJcioNers6PovOFEeqPCCSFn52HkscXug@mail.gmail.com>	<5422D6CF.10408@candelatech.com>
 <CA+BoTQk=X2qVJsY64ZH88h29L6+Y5M9K07nLtzo=0ga1bUsXGw@mail.gmail.com>
In-Reply-To: <CA+BoTQk=X2qVJsY64ZH88h29L6+Y5M9K07nLtzo=0ga1bUsXGw@mail.gmail.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

CgpPbiAwOS8yNC8yMDE0IDA4OjA1IEFNLCBNaWNoYWwgS2F6aW9yIHdyb3RlOgo+IE9uIDI0IFNl
cHRlbWJlciAyMDE0IDE2OjM1LCBCZW4gR3JlZWFyIDxncmVlYXJiQGNhbmRlbGF0ZWNoLmNvbT4g
d3JvdGU6Cj4+IE9uIDA5LzI0LzIwMTQgMTI6NTEgQU0sIE1pY2hhbCBLYXppb3Igd3JvdGU6Cj4+
PiBPbiAyNCBTZXB0ZW1iZXIgMjAxNCAwMjoyNiwgIDxncmVlYXJiQGNhbmRlbGF0ZWNoLmNvbT4g
d3JvdGU6Cj4+PiBbLi4uXQo+Pj4+Cj4+Pj4gK3N0YXRpYyBzdHJ1Y3QgaWVlZTgwMjExX3N0YV92
aHRfY2FwIGF0aDEwa19jcmVhdGVfdmh0X2NhcChzdHJ1Y3QgYXRoMTBrCj4+Pj4gKmFyLAo+Pj4+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBib29sCj4+Pj4gdXNlX2NmZ19jaGFpbnMpCj4+Pj4gICAgewo+Pj4+ICAgICAgICAgICBzdHJ1
Y3QgaWVlZTgwMjExX3N0YV92aHRfY2FwIHZodF9jYXAgPSB7MH07Cj4+Pj4gICAgICAgICAgIHUx
NiBtY3NfbWFwOwo+Pj4+ICAgICAgICAgICBpbnQgaTsKPj4+PiArICAgICAgIGludCBucmYgPSBh
ci0+bnVtX3JmX2NoYWluczsKPj4+PiArCj4+Pj4gKyAgICAgICBpZiAodXNlX2NmZ19jaGFpbnMg
JiYgYXItPmNmZ190eF9jaGFpbm1hc2spCj4+Pj4gKyAgICAgICAgICAgICAgIG5yZiA9IGdldF9u
c3NfZnJvbV9jaGFpbm1hc2soYXItPmNmZ190eF9jaGFpbm1hc2spOwo+Pj4KPj4+Cj4+PiBJcyB1
c2VfY2ZnX2NoYWlucyByZWFsbHkgbmVjZXNzYXJ5IGhlcmU/IElzIHNldHRpbmcgdHgvcnggY2hh
aW5tYXNrIHRvCj4+PiAweDAgbWFrZSBhbnkgc2Vuc2UgYXQgYWxsPyBTaG91bGRuJ3Qgd2UgZGVu
eSBpdCBvciBtYWtlIGl0IGZhbGxiYWNrIHRvCj4+PiB0aGUgc3VwcG9ydGVkIHR4L3J4IGNoYWlu
bWFzayB2YWx1ZXM/Cj4+Cj4+IEl0IHdvdWxkIGNhdXNlIHRoZSBsb2dpYyB0byBmbGlwIGJhY2sg
dG8gdGhlIGRlZmF1bHRzLCBzbyBzZWVtcyBtaWxkbHkKPj4gdXNlZnVsLiAgSSdtIG5vdCBzdXJl
Cj4+IHVwcGVyIGxheWVycyB3b3VsZCBldmVyIGxldCBpdCBiZSA8IDEgdGhvdWdoLgo+Cj4gMCBp
cyBhIHZhbGlkIGFyZ3VtZW50IGFzIGZhciBhcyB1cHBlciBsYXllcnMgYXJlIGNvbmNlcm5lZCBh
bmQgc2hvdWxkCj4gYmUgdHJlYXRlZCBhcyAidXNlIGFsbCBhdmFpbGFibGUgYW50ZW5uYXMiIChz
ZWUgYGl3IGxpc3RgIG91dHB1dAo+IGJlZm9yZSBldmVyIHNldHRpbmcgYW50ZW5uYSwgYWZ0ZXIg
c2V0dGluZyB0bywgZS5nLiAxIGFuZCB0aGVuIHRvIDApLgo+Cj4gVGhpcyBpbXBsaWVzIGN1cnJl
bnQgc2V0X2FudGVubmEoKSBpbXBsZW1lbnRhdGlvbiBpcyBhY3R1YWxseSBidWdneQo+IChwZGV2
IHBhcmFtIHNob3VsZCBpbnZvbHZlIHVzaW5nIHN1cHBfdHgvcnhfY2hhaW5tYXNrKS4gWW91cgo+
IGFzc3VtcHRpb24gaW4gcmVjZW50IHBhdGNoZXMgaXMgYWxzbyBpbmNvcnJlY3QgYXMgYW50ZW5u
YSBtYXNrID0gMAo+IHNob3VsZCBpbXBseSBtYXggbnNzLCBub3QgMS4KCkkgd2lsbCB0ZXN0LCBi
dXQgSSB0aGluayB5b3UgYXJlIG1pcy11bmRlcnN0YW5kaW5nIHRoZSBsb2dpYyBpbiBteQpwYXRj
aGVzLiAgSSBzaG91bGQgYmUgdXNpbmcgdGhlIG1heCBuc3Mgd2hlbmV2ZXIgY29uZmlndXJlZCB2
YWx1ZQppcyAwLgoKVGhhbmtzLApCZW4KCj4KPgo+IE1pY2hhxYIKPgoKLS0gCkJlbiBHcmVlYXIg
PGdyZWVhcmJAY2FuZGVsYXRlY2guY29tPgpDYW5kZWxhIFRlY2hub2xvZ2llcyBJbmMgIGh0dHA6
Ly93d3cuY2FuZGVsYXRlY2guY29tCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
