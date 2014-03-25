Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WST4J-0007vK-1l
 for ath10k@lists.infradead.org; Tue, 25 Mar 2014 15:15:11 +0000
Message-ID: <53319D65.4090907@candelatech.com>
Date: Tue, 25 Mar 2014 08:14:45 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] ath10k: Add debugging for tx-credits usage.
References: <1395428150-31996-1-git-send-email-greearb@candelatech.com>	<871txr7svw.fsf@kamboji.qca.qualcomm.com>	<CA+BoTQmquq7dXTV0sSV1mJ0+8-9OuiCnqz2iN8VNO4J3iaeexQ@mail.gmail.com>	<53306239.2020006@candelatech.com>
 <CA+BoTQkCmJbvQjZ3vTV7AP1EwdcH_pAd0pex_v9bZDzwZdufbw@mail.gmail.com>
In-Reply-To: <CA+BoTQkCmJbvQjZ3vTV7AP1EwdcH_pAd0pex_v9bZDzwZdufbw@mail.gmail.com>
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
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMDMvMjUvMjAxNCAxMjoyNyBBTSwgTWljaGFsIEthemlvciB3cm90ZToKPiBPbiAyNCBNYXJj
aCAyMDE0IDE3OjUwLCBCZW4gR3JlZWFyIDxncmVlYXJiQGNhbmRlbGF0ZWNoLmNvbT4gd3JvdGU6
Cj4+IE9uIDAzLzI0LzIwMTQgMDQ6MjEgQU0sIE1pY2hhbCBLYXppb3Igd3JvdGU6Cj4+PiBPbiAy
NCBNYXJjaCAyMDE0IDEyOjEyLCBLYWxsZSBWYWxvIDxrdmFsb0BxY2EucXVhbGNvbW0uY29tPiB3
cm90ZToKPj4KPj4+Pj4gLSAgICAgc3RhdHVzID0gYXRoMTBrX2h0Y19zZW5kKGh0YywgQVRIMTBL
X0hUQ19FUF8wLCBza2IpOwo+Pj4+PiArICAgICBzdGF0dXMgPSBhdGgxMGtfaHRjX3NlbmQoaHRj
LCBBVEgxMEtfSFRDX0VQXzAsIHNrYiwgX19MSU5FX18pOwo+Pj4+Cj4+Pj4gVXNpbmcgbGluZSBu
dW1iZXJzIGluIGRlYnVnIG1lc3NhZ2VzIGlzIHZlcnkgY3VtYmVyc29tZS4gU29tZSBwZW9wbGUK
Pj4+PiBjaGVycnkgcGljayBwYXRjaGVzLCBoYXZlIHRoZWlyIG93biBjaGFuZ2VzIGFuZCB3aGF0
bm90IHdoaWNoIHdpbGwgbWFrZQo+Pj4+IGl0IG1vcmUgZGlmZmljdWx0IHRvIHJlYWQgdGhlIGRl
YnVnIGxvZ3MuIElzbid0IHRoZXJlIGFueSBiZXR0ZXIgd2F5IHRvCj4+Pj4gZG8gdGhpcz8KPj4+
Cj4+PiBJIHdvdWxkIHByZWZlciB0byBleHBsaWNpdGx5IHdhaXQgZm9yIHR4IGNyZWRpdCByZXBs
ZW5pc2htZW50IGluCj4+PiBhdGgxMGtfd21pX2NtZF9zZW5kKCkgYWZ0ZXIgYSBjb21tYW5kIGlz
IHNlbnQgaW5zdGVhZCBvZiBhbGwgdGhlc2UKPj4+IHByaW50cy4gVGhpcyB3YXkgeW91IGNhbiBn
ZXQgYSBmdWxsIGNhbGwgdHJhY2UgaWYgaXQgdGltZXMgb3V0Lgo+Pgo+PiBXb3VsZCB0aGF0IGJl
IGEgcGVyZm9ybWFuY2UgcHJvYmxlbSAoYnkgZWZmZWN0aXZlbHkgYWxsb3dpbmcgb25seSBhIHNp
bmdsZQo+PiBpdGVtIHRvIGJlIHNlbnQgdG8gdGhlIGZpcm13YXJlIGF0IGFueSBnaXZlbiB0aW1l
PykKPgo+IFRoZSBvbmx5IHRoaW5nIHRoYXQgbWF5IHN1ZmZlciBoZXJlIGlzIHdtaSBtZ210IHR4
IGJ1dCBJIHdvdWxkbid0Cj4gY29uc2lkZXIgdGhhdCBwZXJmb3JtYW5jZSBjcml0aWNhbC4KCklu
IHRoYXQgY2FzZSwgd2h5IHVzZSBjcmVkaXRzIGF0IGFsbD8KClRoYW5rcywKQmVuCgo+Cj4KPiBN
aWNoYcWCCj4gLS0KPiBUbyB1bnN1YnNjcmliZSBmcm9tIHRoaXMgbGlzdDogc2VuZCB0aGUgbGlu
ZSAidW5zdWJzY3JpYmUgbGludXgtd2lyZWxlc3MiIGluCj4gdGhlIGJvZHkgb2YgYSBtZXNzYWdl
IHRvIG1ham9yZG9tb0B2Z2VyLmtlcm5lbC5vcmcKPiBNb3JlIG1ham9yZG9tbyBpbmZvIGF0ICBo
dHRwOi8vdmdlci5rZXJuZWwub3JnL21ham9yZG9tby1pbmZvLmh0bWwKPgoKCi0tIApCZW4gR3Jl
ZWFyIDxncmVlYXJiQGNhbmRlbGF0ZWNoLmNvbT4KQ2FuZGVsYSBUZWNobm9sb2dpZXMgSW5jICBo
dHRwOi8vd3d3LmNhbmRlbGF0ZWNoLmNvbQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgx
MGsK
