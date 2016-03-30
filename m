Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85 #2 (Red Hat Linux))
 id 1alNI3-0003oZ-8w
 for ath10k@lists.infradead.org; Wed, 30 Mar 2016 21:04:35 +0000
Subject: Re: How is tx-flushing supposed to work now?
References: <56FAD6D6.9030105@candelatech.com>
 <CA+BoTQn8ptm785Dn14fT7OObFoTEeq2ym7AQFmu889P_BDt6jw@mail.gmail.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <56FC3C30.5060302@candelatech.com>
Date: Wed, 30 Mar 2016 13:50:56 -0700
MIME-Version: 1.0
In-Reply-To: <CA+BoTQn8ptm785Dn14fT7OObFoTEeq2ym7AQFmu889P_BDt6jw@mail.gmail.com>
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
Cc: ath10k <ath10k@lists.infradead.org>

T24gMDMvMzAvMjAxNiAwMzozOCBBTSwgTWljaGFsIEthemlvciB3cm90ZToKPiBPbiAyOSBNYXJj
aCAyMDE2IGF0IDIxOjI2LCBCZW4gR3JlZWFyIDxncmVlYXJiQGNhbmRlbGF0ZWNoLmNvbT4gd3Jv
dGU6Cj4+IFdoZW4gd2UgaGF2ZSBtdWx0aXBsZSB2ZGV2cywgYW5kIHRoZSAxMC40LjMgZmlybXdh
cmUgd2l0aCB0aGUgdHgtcHVzaCBsb2dpYywKPj4gaG93IGlzIGZsdXNoaW5nIHN1cHBvc2VkIHRv
IHdvcms/Cj4KPiBUaGlzIGlzbid0IHJlYWxseSBhcyBtdWNoIGFib3V0IHB1bGwtcHVzaCBsb2dp
YyBpbiAxMC40LjMgYXMgaXQgaXMKPiBhYm91dCB3YWtlX3R4X3F1ZXVlKCkgaW4gZ2VuZXJhbCwg
aXMgaXQ/CgpJbiBwYXJ0aWN1bGFyLCBJIGFtIGN1cmlvdXMgYWJvdXQgdGhlIGFyLT50eHFzLCBh
bmQgdGhlIGF0aDEwa19tYWNfdHhfcHVzaF9wZW5kaW5nCm1ldGhvZC4gIFNob3VsZCB3ZSBwdXJn
ZSB0aGUgYXItPnR4cXMgYXMgcGFydCBvZiB0aGUgZmx1c2ggbG9naWM/CgpUaGFua3MsCkJlbgoK
Cj4KPgo+PiBGaXJzdCwgd2hlbiB3ZSBnZXQgYSBmbHVzaCwgc2hvdWxkIHdlIGZpcnN0IHB1cmdl
IGFueSBmcmFtZXMgbm90IHlldCBwdXNoZWQKPj4gdG8gdGhlIGZpcm13YXJlPwo+Cj4gSSB3b3Vs
ZCBleHBlY3QgbWFjODAyMTEgdG8gcHVyZ2UgdHhxcy4KPgo+Cj4+IEFuZCBzZWNvbmQsIHdoYXQg
a2VlcHMgb3RoZXIgdmRldnMgZnJvbSBjb250aW51aW5nIHRvIHRyYW5zbWl0IGZyYW1lcyB3aGls
ZQo+PiBvbmUKPj4gdmRldiBpcyB0cnlpbmcgdG8gYmUgZmx1c2hlZD8KPgo+IEhtbS4uIEkgZ3Vl
c3MgYXRoMTBrIGZsdXNoKCkgaW1wbGVtZW50YXRpb24gZG9lc24ndCByZWFsbHkgZG8gd2hhdCBp
dAo+IHNob3VsZC4gSXQgc2hvdWxkIHdhaXQganVzdCBmb3IgZnJhbWVzIGZvciBnaXZlbiB2aWYg
YnV0IGl0IHdhaXRzIGZvcgo+IGV2ZXJ5dGhpbmcuCj4KPgo+IE1pY2hhxYIKPgoKCi0tIApCZW4g
R3JlZWFyIDxncmVlYXJiQGNhbmRlbGF0ZWNoLmNvbT4KQ2FuZGVsYSBUZWNobm9sb2dpZXMgSW5j
ICBodHRwOi8vd3d3LmNhbmRlbGF0ZWNoLmNvbQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
dGgxMGsK
