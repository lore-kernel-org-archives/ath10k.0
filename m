Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x230.google.com ([2a00:1450:400c:c05::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YSNfZ-0007j2-Vg
 for ath10k@lists.infradead.org; Mon, 02 Mar 2015 10:33:52 +0000
Received: by widem10 with SMTP id em10so13674814wid.1
 for <ath10k@lists.infradead.org>; Mon, 02 Mar 2015 02:33:27 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <54F438C5.802@qti.qualcomm.com>
References: <1425030606-21933-1-git-send-email-vthiagar@qti.qualcomm.com>
 <1425030606-21933-2-git-send-email-vthiagar@qti.qualcomm.com>
 <CA+BoTQ=UFo=2Fa8FXw6JTGKkNLoG=m56py0a8AShyh3nTJ+TKQ@mail.gmail.com>
 <1425288686058.83668@qti.qualcomm.com>
 <54F438C5.802@qti.qualcomm.com>
Date: Mon, 2 Mar 2015 11:33:27 +0100
Message-ID: <CA+BoTQmLciCZ4dXbH4rO1vU32OQzNgF+cJT-tkFcOKvq00Ur1Q@mail.gmail.com>
Subject: Re: [PATCH V3 2/2] ath10k: Fix interrupt storm
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
To: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMiBNYXJjaCAyMDE1IGF0IDExOjE3LCBWYXNhbnRoYWt1bWFyIFRoaWFnYXJhamFuCjx2dGhp
YWdhckBxdGkucXVhbGNvbW0uY29tPiB3cm90ZToKWy4uLl0KPj4+ICt7Cj4+PiArICAgICAgIHN0
cnVjdCBhdGgxMGtfdmlmICphcnZpZjsKPj4+ICsKPj4+ICsgICAgICAgaWYgKCFhci0+bnVtX3N0
YXJ0ZWRfdmRldnMpCj4+PiArICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+Pj4gKwo+Pj4g
KyAgICAgICBsaXN0X2Zvcl9lYWNoX2VudHJ5KGFydmlmLCAmYXItPmFydmlmcywgbGlzdCkgewo+
Pgo+Pgo+PiBUaGlzIG1lYW5zIGZ1bmN0aW9uIG11c3QgYmUgY2FsbGVkIHdoaWxlIGhvbGRpbmcg
Y29uZl9tdXRleCAobXkgTUNDCj4+IHBhdGNoIGFkZHMgZGF0YV9sb2NrIGFzIGFuIG9wdGlvbiwg
YnV0IGN1cnJlbnQgdXBzdHJlYW0gdHJlZSB1c2VzCj4+IGNvbmZfbXV0ZXggb25seSkuCj4KPgo+
IE9rLiBTdXJlLCB3ZSBjYW4gZml4IGl0IHdoZW4gd2UgaGF2ZSBNQ0MgY2hhbmdlIGludG8gdGhl
IHRyZWUuCgpObyBuZWVkLiBXaXRoIHRoZSB3YXkgYXRoMTBrX21vbml0b3JfcmVjYWxjKCkgaXMg
Y2FsbGVkIGl0IG1ha2VzIHNlbnNlCnRvIHJlbHkgb24gbG9ja2RlcF9hc3NlcnRfaGVsZChhci0+
Y29uZl9tdXRleCkgb25seS4KClRoZSBkYXRhX2xvY2sgd2FzIGp1c3QgRllJLgoKCgo+Pj4gQEAg
LTM0NzYsNiArMzUwNCwxMyBAQCBzdGF0aWMgdm9pZCBhdGgxMGtfY29uZmlndXJlX2ZpbHRlcihz
dHJ1Y3QKPj4+IGllZWU4MDIxMV9odyAqaHcsCj4+Pgo+Pj4gICAgICAgICAgY2hhbmdlZF9mbGFn
cyAmPSBTVVBQT1JURURfRklMVEVSUzsKPj4+ICAgICAgICAgICp0b3RhbF9mbGFncyAmPSBTVVBQ
T1JURURfRklMVEVSUzsKPj4+ICsgICAgICAgaWYgKCp0b3RhbF9mbGFncyAmIEZJRl9QUk9NSVND
X0lOX0JTUykgewo+Pj4gKyAgICAgICAgICAgICAgIGlmIChhci0+bnVtX3N0YXJ0ZWRfdmRldnMp
IHsKPj4+ICsgICAgICAgICAgICAgICAgICAgICAgIGF0aDEwa19kYmcoYXIsIEFUSDEwS19EQkdf
TUFDLAo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAibWFjIGRvZXMgbm90
IGVuYWJsZSBwcm9taXNjdW91cyBtb2RlCj4+PiB3aGVuIGFscmVhZHkgYSB2ZGV2IGlzIHJ1bm5p
bmdcbiIpOwo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgKnRvdGFsX2ZsYWdzICY9IH5GSUZf
UFJPTUlTQ19JTl9CU1M7Cj4+PiArICAgICAgICAgICAgICAgfQo+Pj4gKyAgICAgICB9Cj4+Cj4+
Cj4+IFRoZXJlJ3Mgbm8gbmVlZCBmb3IgdGhhdCwgaXMgdGhlcmU/IFRoZSBtb25pdG9yX3JlY2Fs
YygpIGlzIHN1cHBvc2VkCj4+IHRvIGRlYWwgd2l0aCB0aGlzLgo+Cj4KPiBSaWdodCwgYnV0IHdl
IG1heSBub3Qgd2FudCB0byBjcmVhdGUgYW55IGluY29uc2lzdGVuY2llcyBiZXR3ZWVuCj4gKnRv
dGFsX2ZsYWdzIGFuZCBhY3R1YWwKPiBmaWx0ZXJzIGVuYWJsZWQgaW4gdGhlIGRyaXZlcj8uCgpT
ZWUgdGhlICJET0M6IEZyYW1lIGZpbHRlcmluZyIgaW4gaW5jbHVkZS9uZXQvbWFjODAyMTEuaC4g
YXRoMTBrCmVpdGhlciBhbHdheXMgZGVsaXZlcnMgZnJhbWVzIElOX0JTUyAoQVAgb3BlcmF0aW9u
KSBvciBjYW4gYmUgZm9yY2VkCnRvICh2aWEgbW9uaXRvciB2ZGV2IGZvciBTVEEvSUJTUyBvcGVy
YXRpb24pIHNvIEZJRl9QUk9NSVNDX0lOX0JTUwpzaG91bGQgbmV2ZXIgYmUgY2xlYXJlZC4KCgpN
aWNoYcWCCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
dGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
