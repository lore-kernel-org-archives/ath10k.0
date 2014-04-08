Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-f42.google.com ([74.125.82.42])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXQ4z-0002c1-2n
 for ath10k@lists.infradead.org; Tue, 08 Apr 2014 07:04:22 +0000
Received: by mail-wg0-f42.google.com with SMTP id y10so473533wgg.25
 for <ath10k@lists.infradead.org>; Tue, 08 Apr 2014 00:03:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87ob0cmhwp.fsf@kamboji.qca.qualcomm.com>
References: <1396610305-5229-1-git-send-email-michal.kazior@tieto.com>
 <87y4zgmifa.fsf@kamboji.qca.qualcomm.com>
 <87ob0cmhwp.fsf@kamboji.qca.qualcomm.com>
Date: Tue, 8 Apr 2014 09:03:15 +0200
Message-ID: <CA+BoTQkWjr9pxTN0AgqDXLzXqTjJ1a=Zepss5UdDw7tpOQLOAw@mail.gmail.com>
Subject: Re: [PATCH] ath10k: refactor monitor code
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gOCBBcHJpbCAyMDE0IDA4OjUzLCBLYWxsZSBWYWxvIDxrdmFsb0BxY2EucXVhbGNvbW0uY29t
PiB3cm90ZToKPiBLYWxsZSBWYWxvIDxrdmFsb0BxY2EucXVhbGNvbW0uY29tPiB3cml0ZXM6Cj4K
Pj4gTWljaGFsIEthemlvciA8bWljaGFsLmthemlvckB0aWV0by5jb20+IHdyaXRlczoKPj4KPj4+
IEl0IHdhcyBwb3NzaWJsZSB0byBjcmVhdGUvZGVsZXRlL3N0YXJ0L3N0b3AKPj4+IG1vbml0b3Ig
dmRldiBmcm9tIGEgZmV3IHBsYWNlcyB0aGF0IHdlcmUgbm90Cj4+PiBleGNsdXNpdmVseSBwcm90
ZWN0ZWQgYWdhaW5zdCBlYWNoIG90aGVyLiBUaGlzCj4+PiByZXN1bHRlZCBpbiBtb25pdG9yIHZk
ZXYgYmVpbmcgc3RvcHBlZC9yZW1vdmVkIGJ5Cj4+PiBvbmUgY2FsbCBvcmlnaW4gd2hpbGUgYW5v
dGhlciBvbmUgd2FzIGV4cGVjdGluZyBpdAo+Pj4gdG8gY29udGludWUgcnVubmluZy4KPj4+Cj4+
PiBGb3IgZXhhbXBsZSBpZiBDQUMgd2FzIHN0YXJ0ZWQgYW5kIGludGVyZmFjZSdzCj4+PiBwcm9t
aXNjdW91cyBtb2RlIHdhcyB0b2dnbGVkIG1vbml0b3IgdmRldiB3YXMKPj4+IHJlbW92ZWQgZnJv
bSB0aGUgZHJpdmVyIG1lYW5pbmcgbm8gcmFkYXIgd291bGQgYmUKPj4+IGRldGVjdGVkLiBJbiBh
ZGRpdGlvbmFsIGEgd2FybmluZyB3b3VsZCBiZSBwcmludGVkCj4+PiB1cG9uIENBQyBjb21wbGV0
aW9uIGNvbXBsYWluaW5nIGl0IHRyaWVkIHRvIHN0b3AKPj4+IG5vbi1ydW5uaW5nIG1vbml0b3Ig
dmRldi4KPj4+Cj4+PiBUaGUgcGF0Y2ggc2ltcGxpZmllcyBtb25pdG9yIGNvZGUgYnkgcmVtb3Zp
bmcKPj4+IElFRUU4MDIxMV9IV19XQU5UX01PTklUT1JfVklGICh3aGljaCB3YXNuJ3QgcmVhbGx5
Cj4+PiBldmVyIG5lZWRlZCkgYW5kIGltcHJvdmVzIHN0YXRlIHRyYWNraW5nLiBJdCBhbHNvCj4+
PiB1bmlmaWVzIHByaW50cy4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWwgS2F6aW9yIDxt
aWNoYWwua2F6aW9yQHRpZXRvLmNvbT4KPj4KPj4gVGhhbmtzLCBhcHBsaWVkLgo+Cj4gQWN0dWFs
bHkgdGhlcmUgd2VyZSB0d28gY2hlY2twYXRjaCB3YXJuaW5ncyB3aGljaCBJIGhhZCBtaXNzZWQ6
Cj4KPiBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL21hYy5jOjI1ODc6IFdBUk5JTkc6
IGxpbmUgb3ZlciA4MCBjaGFyYWN0ZXJzCj4gZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEw
ay9tYWMuYzoyODUyOiBXQVJOSU5HOiBsaW5lIG92ZXIgODAgY2hhcmFjdGVycwo+Cj4gSSBhbWVu
ZGVkIGl0IGxpa2UgdGhpczoKPgoKWy4uLl0KClNvcnJ5IGZvciB0aGUgdHJvdWJsZSBhbmQgdGhh
bmtzIQoKCk1pY2hhxYIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
