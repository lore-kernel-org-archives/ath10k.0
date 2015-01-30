Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x22d.google.com ([2a00:1450:400c:c00::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YHBHK-0005ra-8f
 for ath10k@lists.infradead.org; Fri, 30 Jan 2015 13:06:30 +0000
Received: by mail-wg0-f45.google.com with SMTP id x12so26762607wgg.4
 for <ath10k@lists.infradead.org>; Fri, 30 Jan 2015 05:06:08 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1422622694.1919.17.camel@sipsolutions.net>
References: <1422607287-12289-1-git-send-email-michal.kazior@tieto.com>
 <1422621086-28970-1-git-send-email-michal.kazior@tieto.com>
 <1422621086-28970-3-git-send-email-michal.kazior@tieto.com>
 <1422622694.1919.17.camel@sipsolutions.net>
Date: Fri, 30 Jan 2015 14:06:08 +0100
Message-ID: <CA+BoTQkVuDqZVCVUB6pkDKp2tZ1sgnezju6Kg48JvnS4a_LZyA@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] ath10k: implement chanctx API
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
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMzAgSmFudWFyeSAyMDE1IGF0IDEzOjU4LCBKb2hhbm5lcyBCZXJnIDxqb2hhbm5lc0BzaXBz
b2x1dGlvbnMubmV0PiB3cm90ZToKPgo+PiArKysgYi9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgv
YXRoMTBrL2NvcmUuaAo+Cj4+IEBAIC0yNzcsNiArMjgyLDcgQEAgc3RydWN0IGF0aDEwa192aWYg
ewo+PiAgICAgICBkbWFfYWRkcl90IGJlYWNvbl9wYWRkcjsKPj4KPj4gICAgICAgc3RydWN0IGF0
aDEwayAqYXI7Cj4+ICsgICAgIHN0cnVjdCBhdGgxMGtfY2hhbmN0eCAqYXJjdHg7Cj4KPiB5b3Ug
YWxzbyBoYXZlIHZpZi0+Y2hhbmN0eF9jb25mIHBvaW50ZXIsIHdoaWNoIHlvdSBjb3VsZCB1c2UK
Pgo+IHVsdGltYXRlbHkgaXQncyBhIHNvZnR3YXJlIGFyY2hpdGVjdHVyZSBkZWNpc2lvbiAtIHBl
cnNvbmFsbHkgSSB3b3VsZG4ndAo+IHdhbnQgdG8gZHVwbGljYXRlIGFsbCB0aGF0IGRhdGEgYW5k
IHRoZSBsaXN0cyBldGMuIGluIHRoZSBkcml2ZXIgd2hlbgo+IG1hYzgwMjExIGhhcyB0aGVtLCBi
dXQgdGhhdCdzIGp1c3QgbXkgb3Bpbmlvbi4gOikKCkknbSBhIGJpdCByZWx1Y3RhbnQgdG8gZnJl
ZWx5IHVzZSBtYWM4MDIxMSBvd25lZCBzdHJ1Y3R1cmVzIG91dCBvZgptYWM4MDIxMV9vcHMgY2Fs
bGJhY2sgY29udGV4dCwgaS5lLiBmcm9tIGEgdGFza2xldCBmZWFyaW5nCmluY29uc2lzdGVuY2ll
cy4gT3IgYW0gSSB3b3JyeWluZyB1bm5lY2Vzc2FyaWx5PyBJZiBzbyBJIGd1ZXNzIEknbGwKcmVk
byB0aGlzIGFuZCB1c2UgbWFjODAyMTEncyBzdHJ1Y3R1cmVzIGRpcmVjdGx5IDotKQoKCk1pY2hh
xYIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEw
ayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
