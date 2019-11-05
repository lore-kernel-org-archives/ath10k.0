Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173]
 helo=mail3.candelatech.com)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iS2UE-0005WQ-5q
 for ath10k@lists.infradead.org; Tue, 05 Nov 2019 17:19:23 +0000
Subject: Re: [PATCH net-next] ath10k: fix RX of frames with broken FCS in
 monitor mode
References: <20191105164932.11799-1-linus.luessing@c0d3.blue>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <927cea69-7afc-5c35-df8d-9813392e8928@candelatech.com>
Date: Tue, 5 Nov 2019 09:19:20 -0800
MIME-Version: 1.0
In-Reply-To: <20191105164932.11799-1-linus.luessing@c0d3.blue>
Content-Language: en-US
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
To: =?UTF-8?Q?Linus_L=c3=bcssing?= <linus.luessing@c0d3.blue>, ath10k@lists.infradead.org
Cc: =?UTF-8?Q?Linus_L=c3=bcssing?= <ll@simonwunderlich.de>, Simon Wunderlich <sw@simonwunderlich.de>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>

T24gMTEvNS8xOSA4OjQ5IEFNLCBMaW51cyBMw7xzc2luZyB3cm90ZToKPiBGcm9tOiBMaW51cyBM
w7xzc2luZyA8bGxAc2ltb253dW5kZXJsaWNoLmRlPgo+IAo+IFNvIGZhciwgZnJhbWVzIHdlcmUg
Zm9yd2FyZGVkIHJlZ2FyZGxlc3Mgb2YgdGhlIEZDUyBjb3JyZWN0bmVzcyBsZWFkaW5nCj4gdG8g
dXNlcnNwYWNlIGFwcGxpY2F0aW9ucyBsaXN0ZW5pbmcgb24gdGhlIG1vbml0b3IgbW9kZSBpbnRl
cmZhY2UgdG8KPiByZWNlaXZlIHBvdGVudGlhbGx5IGJyb2tlbiBmcmFtZXMsIGV2ZW4gd2l0aCB0
aGUgImZjc2ZhaWwiIGZsYWcgdW5zZXQuCj4gCj4gQnkgZGVmYXVsdCwgd2l0aCB0aGUgImZjc2Zh
aWwiIGZsYWcgb2YgYSBtb25pdG9yIG1vZGUgaW50ZXJmYWNlCj4gdW5zZXQsIGZyYW1lcyB3aXRo
IEZDUyBlcnJvcnMgc2hvdWxkIGJlIGRyb3BwZWQuIFdpdGggdGhpcyBwYXRjaCwgdGhlCj4gZmNz
ZmFpbCBmbGFnIGlzIHRha2VuIGludG8gYWNjb3VudCBjb3JyZWN0bHkuCj4gCj4gQ2M6IFNpbW9u
IFd1bmRlcmxpY2ggPHN3QHNpbW9ud3VuZGVybGljaC5kZT4KPiBTaWduZWQtb2ZmLWJ5OiBMaW51
cyBMw7xzc2luZyA8bGxAc2ltb253dW5kZXJsaWNoLmRlPgo+IC0tLQo+IFRoaXMgd2FzIHRlc3Rl
ZCBvbiBhbiBPcGVuIE1lc2ggQTQxIGRldmljZSwgZmVhdHVyaW5nIGEgUUNBNDAxOS4gQW5kCj4g
d2l0aCB0aGlzIGZpcm13YXJlOgo+IAo+IGh0dHBzOi8vd3d3LmNhbmRlbGF0ZWNoLmNvbS9kb3du
bG9hZHMvYXRoMTBrLTQwMTktMTAtNGIvZmlybXdhcmUtNS1jdC1mdWxsLWNvbW11bml0eS0xMi5i
aW4tbGVkZS4wMTEKPiAKPiBCdXQgZnJvbSBsb29raW5nIGF0IHRoZSBjb2RlIGl0IHNlZW1zIHRo
YXQgdGhlIHZhbmlsbGEgYXRoMTBrIGhhcyB0aGUKPiBzYW1lIGlzc3VlLCB0aGVyZWZvcmUgc3Vi
bWl0dGluZyBpdCBoZXJlLgo+IAo+IENoYW5nZWxvZyBSRkMtPnYxOgo+IAo+ICogcmVtb3ZlZCAi
YXItPm1vbml0b3IiIGNoZWNrCj4gKiBhZGRlZCBhIGRlYnVnIGNvdW50ZXIKClRoYW5rcyBmb3Ig
YWRkaW5nIHRoZSBjb3VudGVyLiAgU2luY2UgaXQgdXMgdTMyLCBJIGRvdWJ0IHlvdSBuZWVkIHRo
ZSBzcGluIGxvY2sKYmVsb3c/CgotLUJlbgoKPiArCWlmICghKGFyLT5maWx0ZXJfZmxhZ3MgJiBG
SUZfRkNTRkFJTCkgJiYKPiArCSAgICBzdGF0dXMtPmZsYWcgJiBSWF9GTEFHX0ZBSUxFRF9GQ1Nf
Q1JDKSB7Cj4gKwkJc3Bpbl9sb2NrX2JoKCZhci0+ZGF0YV9sb2NrKTsKPiArCQlhci0+c3RhdHMu
cnhfY3JjX2Vycl9kcm9wKys7Cj4gKwkJc3Bpbl91bmxvY2tfYmgoJmFyLT5kYXRhX2xvY2spOwo+
ICsKPiArCQlkZXZfa2ZyZWVfc2tiX2FueShza2IpOwo+ICsJCXJldHVybjsKPiArCX0KPiArCj4g
ICAJYXRoMTBrX2RiZyhhciwgQVRIMTBLX0RCR19EQVRBLAo+ICAgCQkgICAicnggc2tiICVwSyBs
ZW4gJXUgcGVlciAlcE0gJXMgJXMgc24gJXUgJXMlcyVzJXMlcyVzICVzcmF0ZV9pZHggJXUgdmh0
X25zcyAldSBmcmVxICV1IGJhbmQgJXUgZmxhZyAweCV4IGZjcy1lcnIgJWkgbWljLWVyciAlaSBh
bXNkdS1tb3JlICVpXG4iLAo+ICAgCQkgICBza2IsCj4gCgoKLS0gCkJlbiBHcmVlYXIgPGdyZWVh
cmJAY2FuZGVsYXRlY2guY29tPgpDYW5kZWxhIFRlY2hub2xvZ2llcyBJbmMgIGh0dHA6Ly93d3cu
Y2FuZGVsYXRlY2guY29tCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
