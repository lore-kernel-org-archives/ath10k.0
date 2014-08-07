Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22e.google.com ([2a00:1450:400c:c05::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XFKAc-0007oB-Lv
 for ath10k@lists.infradead.org; Thu, 07 Aug 2014 09:39:39 +0000
Received: by mail-wi0-f174.google.com with SMTP id d1so10411705wiv.1
 for <ath10k@lists.infradead.org>; Thu, 07 Aug 2014 02:39:16 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <8738d84pgg.fsf@kamboji.qca.qualcomm.com>
References: <1407402308-29899-1-git-send-email-michal.kazior@tieto.com>
 <1407402308-29899-6-git-send-email-michal.kazior@tieto.com>
 <8738d84pgg.fsf@kamboji.qca.qualcomm.com>
Date: Thu, 7 Aug 2014 11:39:16 +0200
Message-ID: <CA+BoTQnCHA5cKFTTF+v1GHqb65JyFxFUXcJt6_AFBtS7jWHKJQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] ath10k: flush hif buffers before recovery
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

T24gNyBBdWd1c3QgMjAxNCAxMTozMCwgS2FsbGUgVmFsbyA8a3ZhbG9AcWNhLnF1YWxjb21tLmNv
bT4gd3JvdGU6Cj4gTWljaGFsIEthemlvciA8bWljaGFsLmthemlvckB0aWV0by5jb20+IHdyaXRl
czoKPgo+PiBUcmFuc3BvcnQgYnVmZmVycyB3ZXJlbid0IGZsdXNoZWQgYW5kIHByb2Nlc3NlZAo+
PiBiZWZvcmUgcXVldWVpbmcgaHcgcmVjb3ZlcnkgcmVxdWVzdCB0byBtYWM4MDIxMS4KPj4KPj4g
VGhpcyBjb3VsZCBpbiB0aGVvcnkgcmVzdWx0IGluIGFuIHVud2FudGVkIGh0dC93bWkKPj4gcngg
ZXZlbnRzIGJlaW5nIHByb2Nlc3NlZCB3aGlsZSBtYWM4MDIxMSByZWNvdmVycwo+PiB0aGUgZGV2
aWNlIGFuZCBwb3NzaWJseSBpbnRlcmZlcmUgb3IgZXZlbiBjcmFzaAo+PiB0aGUgc3lzdGVtLgo+
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWwgS2F6aW9yIDxtaWNoYWwua2F6aW9yQHRpZXRvLmNv
bT4KPgo+IFRoaXMgb25lIGhhZCBhIGNvbmZsaWN0IGluIGF0aC1uZXh0LXRlc3QsIEkgY2hhbmdl
ZCB0aGUgcGF0Y2ggdG8gdGhpczoKPgo+IC0tLSBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9h
dGgxMGsvY29yZS5jCj4gKysrIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9jb3Jl
LmMKPiBAQCAtNjY2LDYgKzY2Niw3IEBAIHN0YXRpYyB2b2lkIGF0aDEwa19jb3JlX3Jlc3RhcnQo
c3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQo+ICAgICAgICAgY2FzZSBBVEgxMEtfU1RBVEVfT046
Cj4gICAgICAgICAgICAgICAgIGFyLT5zdGF0ZSA9IEFUSDEwS19TVEFURV9SRVNUQVJUSU5HOwo+
ICAgICAgICAgICAgICAgICBhdGgxMGtfc2Nhbl9maW5pc2goYXIpOwo+ICsgICAgICAgICAgICAg
ICBhdGgxMGtfaGlmX3N0b3AoYXIpOwo+ICAgICAgICAgICAgICAgICBpZWVlODAyMTFfcmVzdGFy
dF9odyhhci0+aHcpOwoKT29wcy4gSSd2ZSBhY2NpZGVudGFsbHkgcG9zdGVkIGFuIG9sZCB2ZXJz
aW9uIG9mIHRoaXMgc2luZ2xlIHBhdGNoLgpUaGUgaGlmX3N0b3AoKSBzaG91bGQgYmUgX2JlZm9y
ZV8gc2Nhbl9maW5pc2gvcmVzZXQoKS4gSSdsbCB3YWl0IGZvcgptb3JlIGNvbW1lbnRzIGJlZm9y
ZSBwb3N0aW5nIGEgdjIgdGhvdWdoLgoKCk1pY2hhxYIKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hdGgxMGsK
