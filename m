Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-we0-x234.google.com ([2a00:1450:400c:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X9tBr-0003S9-RY
 for ath10k@lists.infradead.org; Wed, 23 Jul 2014 09:50:29 +0000
Received: by mail-we0-f180.google.com with SMTP id w61so910486wes.25
 for <ath10k@lists.infradead.org>; Wed, 23 Jul 2014 02:50:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87r41dtf2u.fsf@kamboji.qca.qualcomm.com>
References: <1405505855-13741-1-git-send-email-michal.kazior@tieto.com>
 <1405509540-32691-1-git-send-email-michal.kazior@tieto.com>
 <87r41dtf2u.fsf@kamboji.qca.qualcomm.com>
Date: Wed, 23 Jul 2014 11:50:02 +0200
Message-ID: <CA+BoTQng1xwLEbwfQ6P-T=VWYby529jFZ=duTH6hC=HzMW9Y=w@mail.gmail.com>
Subject: Re: [PATCH v3] ath10k: fix Rx aggregation reordering
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
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Denton Gentry <denton.gentry@gmail.com>

T24gMjIgSnVseSAyMDE0IDIwOjM3LCBLYWxsZSBWYWxvIDxrdmFsb0BxY2EucXVhbGNvbW0uY29t
PiB3cm90ZToKPiAoZHJvcHBpbmcgbGludXgtd2lyZWxlc3MpCj4KPiBNaWNoYWwgS2F6aW9yIDxt
aWNoYWwua2F6aW9yQHRpZXRvLmNvbT4gd3JpdGVzOgo+Cj4+IEZpcm13YXJlIGRvZXNuJ3QgcGVy
Zm9ybSBSeCByZW9yZGVyaW5nIHNvIGl0IGlzCj4+IGxlZnQgdG8gdGhlIGhvc3QgZHJpdmVyIHRv
IGRvIHRoYXQuCj4+Cj4+IFVzZSBtYWM4MDIxMSB0byBwZXJmb3JtIHJlb3JkZXJpbmcgaW5zdGVh
ZCBvZgo+PiByZS1pbnZlbnRpbmcgdGhlIHdoZWVsLgo+Pgo+PiBUaGlzIGZpeGVzIFRDUCB0aHJv
dWdocHV0IGlzc3VlcyBpbiBzb21lCj4+IGVudmlyb25tZW50cy4KPj4KPj4gUmVwb3J0ZWQtYnk6
IERlbnRvbiBHZW50cnkgPGRlbnRvbi5nZW50cnlAZ21haWwuY29tPgo+PiBTaWduZWQtb2ZmLWJ5
OiBNaWNoYWwgS2F6aW9yIDxtaWNoYWwua2F6aW9yQHRpZXRvLmNvbT4KPj4gLS0tCj4+IFRoaXMg
ZGVwZW5kcyBvbjoKPj4KPj4gICogbWFjODAyMTE6IGZpeCBSeCByZW9yZGVyaW5nIHdpdGggUlhf
RkxBR19BTVNEVV9NT1JFCj4+ICAqIG1hYzgwMjExOiBhZGQgc3VwcG9ydCBmb3IgUnggcmVvcmRl
cmluZyBvZmZsb2FkaW5nCj4+Cj4+IEknbSBzdGlsbCBzZWVpbmcgc29tZSBpc3N1ZXMgd2l0aCBU
Q1AgdHJhZmZpYy4KPj4gQXBwYXJlbnRseSBmaXJtd2FyZS9oYXJkd2FyZSBzb21ldGltZXMgc3Rh
bGxzIFJ4Cj4+IGZvciB+MTAwbXMgYW5kIG1pc3NlcyBzb21lIGFnZ3JlZ2F0ZSBmcmFtZXMuIEkK
Pj4gd2Fzbid0IGFibGUgdG8gcGlucG9pbnQgd2hhdCB0aGUgcHJvYmxlbSBpcy4gVGhlCj4+IG1v
cmUgcGFyYWxsZWwgVENQIHN0cmVhbXMgKGlwZXJmKSB0aGUgbW9yZSBvZnRlbgo+PiBzdGFsbHMg
aGFwcGVuLiBVRFAgZG9lc24ndCBzZWVtIHRvIHRyaWdnZXIgdGhlIFJ4Cj4+IHN0YWxscyBhdCBh
bGwuCj4KPiBUaGUgbWFjODAyMTEgcGF0Y2hlcyBhcmUgaW4gbWFjODAyMTEtbmV4dCwgYnV0IEkg
Y2FuIG9ubHkgYXBwbHkgdGhpcyBvbmUKPiBvbmx5IG9uY2UgdGhleSBhcmUgaW4gd2lyZWxlc3Mt
bmV4dC4KPgo+IEFsc28gdGhlIG90aGVyIHRoaW5nIGlzIHRoYXQgMy4xNyBtZXJnZSB3aW5kb3cg
aXMgdmVyeSBjbG9zZS4gSSBtaWdodCBiZQo+IGFibGUgdG8gc3F1ZWV6ZSB0aGlzIGluIGJ1dCB0
aGVyZSdzIHRoZSByaXNrIHRoYXQgdGhpcyBwYXRjaCBoYXNuJ3QKPiByZWNlaXZlZCBlbm91Z2gg
dGVzdGluZyBmcm9tIGJlaW5nIGluIGF0aC5naXQuIEhvdyBzYWZlIChvciByaXNreSkgaXMKPiB0
aGlzIHBhdGNoPyBJZiB3ZSBwdXNoIHRoaXMgdG8gMy4xNywgd2UgY291bGQgdHJ5IHRvIGZpeCBy
ZWdyZXNzaW9ucyBpbgo+IC1yYyByZWxlYXNlcyBidXQgdGhhdCdzIGFsd2F5cyBtb3JlIGRpZmZp
Y3VsdCB0aGFuIHdhaXRpbmcgZm9yIDMuMTguCgpJIHRoaW5rIGl0IHNob3VsZCBiZSBmYWlybHkg
c2FmZS4gVGhlIHN0YWxscyBJJ3ZlIG9ic2VydmVkIGRvbid0IG1ha2UKaXQgd29yc2UgdGhhbiBp
dCBpcyB3aXRob3V0IFJ4IHJlb3JkZXJpbmcuCgpCdXQhIEkgbmVlZCB0byByZS1zcGluIHRoaXMg
cGF0Y2ggc2luY2UgdGhlcmUncyBhbiBlbmRpYW5lc3MgYnVnIHdpdGgKaW5mbzAgYmVpbmcgdHJl
YXRlZCBhcyBfX2xlMzIgd2hpbGUgaXRzIF9fbGUxNi4KCgpNaWNoYcWCCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0
aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vYXRoMTBrCg==
