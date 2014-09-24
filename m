Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x22d.google.com ([2a00:1450:400c:c00::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XWo8y-0006FD-VO
 for ath10k@lists.infradead.org; Wed, 24 Sep 2014 15:06:13 +0000
Received: by mail-wg0-f45.google.com with SMTP id x13so5765339wgg.28
 for <ath10k@lists.infradead.org>; Wed, 24 Sep 2014 08:05:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5422D6CF.10408@candelatech.com>
References: <1411518383-32634-1-git-send-email-greearb@candelatech.com>
 <1411518383-32634-2-git-send-email-greearb@candelatech.com>
 <CA+BoTQ=fS30xz9KcdBJcioNers6PovOFEeqPCCSFn52HkscXug@mail.gmail.com>
 <5422D6CF.10408@candelatech.com>
Date: Wed, 24 Sep 2014 17:05:50 +0200
Message-ID: <CA+BoTQk=X2qVJsY64ZH88h29L6+Y5M9K07nLtzo=0ga1bUsXGw@mail.gmail.com>
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

T24gMjQgU2VwdGVtYmVyIDIwMTQgMTY6MzUsIEJlbiBHcmVlYXIgPGdyZWVhcmJAY2FuZGVsYXRl
Y2guY29tPiB3cm90ZToKPiBPbiAwOS8yNC8yMDE0IDEyOjUxIEFNLCBNaWNoYWwgS2F6aW9yIHdy
b3RlOgo+PiBPbiAyNCBTZXB0ZW1iZXIgMjAxNCAwMjoyNiwgIDxncmVlYXJiQGNhbmRlbGF0ZWNo
LmNvbT4gd3JvdGU6Cj4+IFsuLi5dCj4+Pgo+Pj4gK3N0YXRpYyBzdHJ1Y3QgaWVlZTgwMjExX3N0
YV92aHRfY2FwIGF0aDEwa19jcmVhdGVfdmh0X2NhcChzdHJ1Y3QgYXRoMTBrCj4+PiAqYXIsCj4+
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgYm9vbAo+Pj4gdXNlX2NmZ19jaGFpbnMpCj4+PiAgIHsKPj4+ICAgICAgICAgIHN0cnVjdCBp
ZWVlODAyMTFfc3RhX3ZodF9jYXAgdmh0X2NhcCA9IHswfTsKPj4+ICAgICAgICAgIHUxNiBtY3Nf
bWFwOwo+Pj4gICAgICAgICAgaW50IGk7Cj4+PiArICAgICAgIGludCBucmYgPSBhci0+bnVtX3Jm
X2NoYWluczsKPj4+ICsKPj4+ICsgICAgICAgaWYgKHVzZV9jZmdfY2hhaW5zICYmIGFyLT5jZmdf
dHhfY2hhaW5tYXNrKQo+Pj4gKyAgICAgICAgICAgICAgIG5yZiA9IGdldF9uc3NfZnJvbV9jaGFp
bm1hc2soYXItPmNmZ190eF9jaGFpbm1hc2spOwo+Pgo+Pgo+PiBJcyB1c2VfY2ZnX2NoYWlucyBy
ZWFsbHkgbmVjZXNzYXJ5IGhlcmU/IElzIHNldHRpbmcgdHgvcnggY2hhaW5tYXNrIHRvCj4+IDB4
MCBtYWtlIGFueSBzZW5zZSBhdCBhbGw/IFNob3VsZG4ndCB3ZSBkZW55IGl0IG9yIG1ha2UgaXQg
ZmFsbGJhY2sgdG8KPj4gdGhlIHN1cHBvcnRlZCB0eC9yeCBjaGFpbm1hc2sgdmFsdWVzPwo+Cj4g
SXQgd291bGQgY2F1c2UgdGhlIGxvZ2ljIHRvIGZsaXAgYmFjayB0byB0aGUgZGVmYXVsdHMsIHNv
IHNlZW1zIG1pbGRseQo+IHVzZWZ1bC4gIEknbSBub3Qgc3VyZQo+IHVwcGVyIGxheWVycyB3b3Vs
ZCBldmVyIGxldCBpdCBiZSA8IDEgdGhvdWdoLgoKMCBpcyBhIHZhbGlkIGFyZ3VtZW50IGFzIGZh
ciBhcyB1cHBlciBsYXllcnMgYXJlIGNvbmNlcm5lZCBhbmQgc2hvdWxkCmJlIHRyZWF0ZWQgYXMg
InVzZSBhbGwgYXZhaWxhYmxlIGFudGVubmFzIiAoc2VlIGBpdyBsaXN0YCBvdXRwdXQKYmVmb3Jl
IGV2ZXIgc2V0dGluZyBhbnRlbm5hLCBhZnRlciBzZXR0aW5nIHRvLCBlLmcuIDEgYW5kIHRoZW4g
dG8gMCkuCgpUaGlzIGltcGxpZXMgY3VycmVudCBzZXRfYW50ZW5uYSgpIGltcGxlbWVudGF0aW9u
IGlzIGFjdHVhbGx5IGJ1Z2d5CihwZGV2IHBhcmFtIHNob3VsZCBpbnZvbHZlIHVzaW5nIHN1cHBf
dHgvcnhfY2hhaW5tYXNrKS4gWW91cgphc3N1bXB0aW9uIGluIHJlY2VudCBwYXRjaGVzIGlzIGFs
c28gaW5jb3JyZWN0IGFzIGFudGVubmEgbWFzayA9IDAKc2hvdWxkIGltcGx5IG1heCBuc3MsIG5v
dCAxLgoKCk1pY2hhxYIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
