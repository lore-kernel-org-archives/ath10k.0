Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x234.google.com ([2a00:1450:400c:c05::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XhIIY-0000KO-CY
 for ath10k@lists.infradead.org; Thu, 23 Oct 2014 13:19:27 +0000
Received: by mail-wi0-f180.google.com with SMTP id em10so1931462wid.13
 for <ath10k@lists.infradead.org>; Thu, 23 Oct 2014 06:19:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <871tpzq67b.fsf@kamboji.qca.qualcomm.com>
References: <1413807282-27951-1-git-send-email-michal.kazior@tieto.com>
 <1413807282-27951-5-git-send-email-michal.kazior@tieto.com>
 <CA+BoTQ=P2XOaOsaVOj+=fEs=nGfhUCNQvDYx6qb=A=JRCnbQmg@mail.gmail.com>
 <871tpzq67b.fsf@kamboji.qca.qualcomm.com>
Date: Thu, 23 Oct 2014 15:19:03 +0200
Message-ID: <CA+BoTQmSRCMM9S9UrdKvMRxc4qGMGRNvmZQ5kJ7k6rGAtymPqQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] ath10k: make warm reset a bit safer and faster
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

T24gMjMgT2N0b2JlciAyMDE0IDE1OjE0LCBLYWxsZSBWYWxvIDxrdmFsb0BxY2EucXVhbGNvbW0u
Y29tPiB3cm90ZToKPiBNaWNoYWwgS2F6aW9yIDxtaWNoYWwua2F6aW9yQHRpZXRvLmNvbT4gd3Jp
dGVzOgo+Cj4+IE9uIDIwIE9jdG9iZXIgMjAxNCAxNDoxNCwgTWljaGFsIEthemlvciA8bWljaGFs
LmthemlvckB0aWV0by5jb20+IHdyb3RlOgo+Pj4gT25lIG9mIHRoZSBwcm9ibGVtcyB3aXRoIHdh
cm0gcmVzZXQgSSd2ZSBmb3VuZCBpcwo+Pj4gdGhhdCBpdCBtdXN0IGJlIGd1YXJhbnRlZWQgdGhh
dCBjb3B5IGVuZ2luZQo+Pj4gcmVnaXN0ZXJzIGFyZSBub3QgYmVpbmcgYWNjZXNzZWQgd2hpbGUg
YmVpbmcKPj4+IHJlc2V0LiBPdGhlcndpc2UgaW4gd29yc3QgY2FzZSBzY2VuYXJpbyB0aGUgaG9z
dAo+Pj4gbWF5IGxvY2sgdXAuCj4+Pgo+Pj4gSW5zdGVhZCBvZiB1c2luZyBzbGVlcHMgYW5kIGhv
cGluZyB0aGUgZGV2aWNlIGlzCj4+PiBvcGVyYXRpb25hbCBpbiBzb21lIGFyYml0cmFyeSB0aW1l
ZnJhbWVzIHVzZQo+Pj4gZmlybXdhcmUgaW5kaWNhdGlvbiByZWdpc3Rlci4KPj4+Cj4+PiBBcyBh
IHNpZGUgZWZmZWN0IHRoaXMgbWFrZXMgZHJpdmVyCj4+PiBib290L3N0b3AvcmVjb3ZlcnkgZmFz
dGVyLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IE1pY2hhbCBLYXppb3IgPG1pY2hhbC5rYXppb3JA
dGlldG8uY29tPgo+Pj4gLS0tCj4+Pgo+Pj4gTm90ZXM6Cj4+PiAgICAgdjI6Cj4+PiAgICAgICog
Zml4IGtlcm5lbCBwYW5pYyBvbiBlYXJseSBmdyBjcmFzaCBkdWUgdG8gQ0Ugbm90IGJlaW5nIGZ1
bGx5IGluaXRpYWxpemVkIFtKYW51c3pdCj4+Cj4+IE1hcmVrIHJlcG9ydGVkIGhlIHNlZXMgYSBt
ZW1vcnkgbGVhayBhbmQgZ2l0IGJpc2VjdCBibGFtZXMgdGhpcyBwYXRjaC4KPj4gUGxlYXNlIGRv
bid0IGFwcGx5IHRoaXMgcGF0Y2ggeWV0Lgo+Cj4gT2ssIHRoYW5rcyBmb3IgbGV0dGluZyBtZSBr
bm93LiBXaGF0IGFib3V0IHJlc3Qgb2YgdGhlIHBhdGNoZXMgaW4gdGhlCj4gcGF0Y2hzZXQ/IEkg
YXNzdW1lIGl0J3Mgc2FmZSB0byBhcHBseSB0aGVtLgoKSXQncyBzYWZlIHRvIGFwcGx5OgoKICBh
dGgxMGs6IHJlLWRpc2FibGUgaW50ZXJydXB0cyBhZnRlciB0YXJnZXQgaW5pdAogIGF0aDEwazog
bWFzay91bm1hc2sgbXNpIGZ3IGlycQogIGF0aDEwazogc3BsaXQgY2UgcGlwZSBpbml0L2FsbG9j
IGZ1cnRoZXIKClBsZWFzZSwgZG8gbm90IGFwcGx5IHRoZSBmb2xsb3dpbmcgeWV0OgogIGF0aDEw
azogbWFrZSB3YXJtIHJlc2V0IGEgYml0IHNhZmVyIGFuZCBmYXN0ZXIgKHRoaXMgcGF0Y2gpCiAg
YXRoMTBrOiBzcGxpdCByZXNldCBsb2dpYyBmcm9tIHBvd2VyIHVwCiAgYXRoMTBrOiBkb24ndCBy
ZXNldCBjaGlwIG9uIHBvd2VyX2Rvd24KCgpNaWNoYcWCCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vYXRoMTBrCg==
