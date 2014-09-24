Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XWng6-0002nh-31
 for ath10k@lists.infradead.org; Wed, 24 Sep 2014 14:36:23 +0000
Message-ID: <5422D6CF.10408@candelatech.com>
Date: Wed, 24 Sep 2014 07:35:59 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [RFC 2/2] ath10k: re-config ht_caps when chainmask is modified.
References: <1411518383-32634-1-git-send-email-greearb@candelatech.com>	<1411518383-32634-2-git-send-email-greearb@candelatech.com>
 <CA+BoTQ=fS30xz9KcdBJcioNers6PovOFEeqPCCSFn52HkscXug@mail.gmail.com>
In-Reply-To: <CA+BoTQ=fS30xz9KcdBJcioNers6PovOFEeqPCCSFn52HkscXug@mail.gmail.com>
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

CgpPbiAwOS8yNC8yMDE0IDEyOjUxIEFNLCBNaWNoYWwgS2F6aW9yIHdyb3RlOgo+IE9uIDI0IFNl
cHRlbWJlciAyMDE0IDAyOjI2LCAgPGdyZWVhcmJAY2FuZGVsYXRlY2guY29tPiB3cm90ZToKPiBb
Li4uXQo+PiArc3RhdGljIHN0cnVjdCBpZWVlODAyMTFfc3RhX3ZodF9jYXAgYXRoMTBrX2NyZWF0
ZV92aHRfY2FwKHN0cnVjdCBhdGgxMGsgKmFyLAo+PiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYm9vbCB1c2VfY2ZnX2NoYWlucykKPj4g
ICB7Cj4+ICAgICAgICAgIHN0cnVjdCBpZWVlODAyMTFfc3RhX3ZodF9jYXAgdmh0X2NhcCA9IHsw
fTsKPj4gICAgICAgICAgdTE2IG1jc19tYXA7Cj4+ICAgICAgICAgIGludCBpOwo+PiArICAgICAg
IGludCBucmYgPSBhci0+bnVtX3JmX2NoYWluczsKPj4gKwo+PiArICAgICAgIGlmICh1c2VfY2Zn
X2NoYWlucyAmJiBhci0+Y2ZnX3R4X2NoYWlubWFzaykKPj4gKyAgICAgICAgICAgICAgIG5yZiA9
IGdldF9uc3NfZnJvbV9jaGFpbm1hc2soYXItPmNmZ190eF9jaGFpbm1hc2spOwo+Cj4gSXMgdXNl
X2NmZ19jaGFpbnMgcmVhbGx5IG5lY2Vzc2FyeSBoZXJlPyBJcyBzZXR0aW5nIHR4L3J4IGNoYWlu
bWFzayB0bwo+IDB4MCBtYWtlIGFueSBzZW5zZSBhdCBhbGw/IFNob3VsZG4ndCB3ZSBkZW55IGl0
IG9yIG1ha2UgaXQgZmFsbGJhY2sgdG8KPiB0aGUgc3VwcG9ydGVkIHR4L3J4IGNoYWlubWFzayB2
YWx1ZXM/CgpJdCB3b3VsZCBjYXVzZSB0aGUgbG9naWMgdG8gZmxpcCBiYWNrIHRvIHRoZSBkZWZh
dWx0cywgc28gc2VlbXMgbWlsZGx5IHVzZWZ1bC4gIEknbSBub3Qgc3VyZQp1cHBlciBsYXllcnMg
d291bGQgZXZlciBsZXQgaXQgYmUgPCAxIHRob3VnaC4KClRoYW5rcywKQmVuCgo+Cj4KPiBNaWNo
YcWCCj4KCi0tIApCZW4gR3JlZWFyIDxncmVlYXJiQGNhbmRlbGF0ZWNoLmNvbT4KQ2FuZGVsYSBU
ZWNobm9sb2dpZXMgSW5jICBodHRwOi8vd3d3LmNhbmRlbGF0ZWNoLmNvbQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAph
dGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2F0aDEwawo=
