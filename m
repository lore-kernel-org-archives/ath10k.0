Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-bk0-f45.google.com ([209.85.214.45])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V6bDb-0003As-0n
 for ath10k@lists.infradead.org; Tue, 06 Aug 2013 06:58:08 +0000
Received: by mail-bk0-f45.google.com with SMTP id je2so4692bkc.32
 for <ath10k@lists.infradead.org>; Mon, 05 Aug 2013 23:57:41 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87iozkf5w0.fsf@kamboji.qca.qualcomm.com>
References: <1375430329-23352-1-git-send-email-bartosz.markowski@tieto.com>
 <CA+BoTQkD5grL_5dJDgkwo40ET1zax56oN=ZGFxnyGqboQShbgQ@mail.gmail.com>
 <87iozkf5w0.fsf@kamboji.qca.qualcomm.com>
Date: Tue, 6 Aug 2013 08:57:40 +0200
Message-ID: <CA+BoTQkCQMZaicJpcrJGk+vz7kwMgcQcLS6PUn_4c65PJ4gRTA@mail.gmail.com>
Subject: Re: [PATCH v2] ath10k: add SoC power save option to PCI features map
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Bartosz Markowski <bartosz.markowski@tieto.com>

T24gNSBBdWd1c3QgMjAxMyAxODo0MCwgS2FsbGUgVmFsbyA8a3ZhbG9AcWNhLnF1YWxjb21tLmNv
bT4gd3JvdGU6Cj4gTWljaGFsIEthemlvciA8bWljaGFsLmthemlvckB0aWV0by5jb20+IHdyaXRl
czoKPgo+PiBPbiAyIEF1Z3VzdCAyMDEzIDA5OjU4LCBCYXJ0b3N6IE1hcmtvd3NraSA8YmFydG9z
ei5tYXJrb3dza2lAdGlldG8uY29tPiB3cm90ZToKPj4+IFVuaWZ5IHRoZSBQQ0kgb3B0aW9ucyBs
b2NhdGlvbi4KPj4+Cj4+PiBCeSBkZWZhdWx0IHRoZSBTb0MgUFMgb3B0aW9uIGlzIGRpc2FibGVk
IHRvIGJvb3N0IHRoZQo+Pj4gcGVyZm9ybWFuY2UgYW5kIGR1ZSB0byBwb29yIHN0YWJpbGl0eSBv
biBlYXJseSBIVyByZXZpc2lvbnMuCj4+PiBJbiBmdXR1cmUgd2UgY2FuIHJlbW92ZSB0aGUgbW9k
dWxlIHBhcmFtZXRlciBhbmQgdHVybiBvbi9vZmYKPj4+IHRoZSBQUyBmb3IgZ2l2ZW4gaGFyZHdh
cmUuCj4+Pgo+Pj4gVGhpcyBjaGFuZ2UgYWxzbyBtYWtlcyB0aGUgcGNpIG1vZHVsZSBwYXJhbWV0
ZXIgZm9yIFNvQyBQUyBzdGF0aWMuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogQmFydG9zeiBNYXJr
b3dza2kgPGJhcnRvc3oubWFya293c2tpQHRpZXRvLmNvbT4KPj4KPj4gSG1tLi4gSSdtIHdvcnJp
ZWQgYWJvdXQgcGNpIHdha2Uvc2xlZXAgbG9ja2luZzoKPj4KPj4gIChhKSBwY2lfd2FrZSgpIChh
d2FrZSBjb3VudCA9MSkKPj4gIChhKSBkbyBzb21ldGhpbmcKPj4gIE5vdywgaWYgcGNpX3NsZWVw
KCkgYW5kIHBjaV93YWtlKCkgaGFwcGVuIHNpbXVsdGFuZW91c2x5L2FyZQo+PiBwcmVlbXB0ZWQg
c3BsaXR0aW5nIHByaW1pdGl2ZSBvcGVyYXRpb25zIHRvOgo+PiAgKGEpIHBjaV9zbGVlcCgpOiBk
ZWNyZWFzZSBhd2FrZSBjb3VudCAoPTApCj4+ICAoYikgcGNpX3dha2UoKTogaW5jcmVhc2UgYXdh
a2UgY291bnQgKD0xKSwgaW93cml0ZSwgd2FpdCBmb3IgYXdha2UsIHJldHVybgo+PiAgKGEpIHBj
aV9zbGVlcCgpOiBpb3dyaXRlKCkuIHJldHVybgo+PiAgVGhlIGZsb3cgaW4gKGIpIG5vdyB0aGlu
a3MgdGhlIGRldmljZSBpcyBhd2FrZSwgYnV0IGl0J3Mgbm90Cj4+IGd1YXJhbnRlZWQgdG8gYmUg
YW55bW9yZSBiZWNhdXNlIGl0IGhhcyBiZWVuIHB1dCB0byBzbGVlcCBieSAoYSkuCj4KPiBZZWFo
LCB0aGVyZSdzIGEgcmFjZSBhbHJpZ2h0LiBJIHdvbmRlciBpZiBJIGhhdmUgZXZlciBzZWVuIGEg
cHJvcGVyIHVzZQo+IG9mIGEgYXRvbWljIHZhcmlhYmxlIGluIGEgd2lyZWxlc3MgZHJpdmVyIDop
Cj4KPiBCdXQgdGhpcyBkb2Vzbid0IHByZXZlbnQgdGFraW5nIHRoaXMgcGF0Y2ggYXMgdGhlIHJh
Y2UgaGFzIGV4aXN0ZWQgc2luY2UKPiB0aGUgYmVnaW5uaW5nLCByaWdodD8KCkkgZG9uJ3QgaGF2
ZSBhbnl0aGluZyBhZ2FpbnN0IGl0LiBJIGp1c3Qgbm90aWNlZCB0aGUgcmFjZSBhbmQgdGhvdWdo
dAppdCdzIGdvb2QgdG8gcG9pbnQgb3V0IHRoZSBpc3N1ZS4KCgpQb3pkcmF3aWFtIC8gQmVzdCBy
ZWdhcmRzLApNaWNoYcWCIEthemlvci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
