Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x22c.google.com ([2a00:1450:400c:c09::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aicHD-0003oY-Oa
 for ath10k@lists.infradead.org; Wed, 23 Mar 2016 06:28:20 +0000
Received: by mail-wm0-x22c.google.com with SMTP id p65so9963387wmp.0
 for <ath10k@lists.infradead.org>; Tue, 22 Mar 2016 23:27:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <56F1E003.4000900@codeaurora.org>
References: <201603230727.oL9ihH6E%fengguang.wu@intel.com>
 <56F1E003.4000900@codeaurora.org>
Date: Wed, 23 Mar 2016 07:27:54 +0100
Message-ID: <CA+BoTQneAJJ=9L4XZYJVxxPXwbH3x_d6ExJii70tG3YJRxPicw@mail.gmail.com>
Subject: Re: [PATCH v2] ath10k: parse Rx MAC timestamp in mgmt frame for FW
 10.4
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
To: Peter Oh <poh@codeaurora.org>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, linux-wireless <linux-wireless@vger.kernel.org>, kbuild test robot <lkp@intel.com>, Peter Oh <poh@qca.qualcomm.com>, kbuild-all@01.org

T24gMjMgTWFyY2ggMjAxNiBhdCAwMToxNCwgUGV0ZXIgT2ggPHBvaEBjb2RlYXVyb3JhLm9yZz4g
d3JvdGU6Cj4KPiBPbiAwMy8yMi8yMDE2IDA0OjE0IFBNLCBrYnVpbGQgdGVzdCByb2JvdCB3cm90
ZToKPj4KPj4gSGkgUGV0ZXIsCj4+Cj4+IFthdXRvIGJ1aWxkIHRlc3QgV0FSTklORyBvbiB3aXJl
bGVzcy1kcml2ZXJzLW5leHQvbWFzdGVyXQo+PiBbYWxzbyBidWlsZCB0ZXN0IFdBUk5JTkcgb24g
djQuNSBuZXh0LTIwMTYwMzIyXQo+PiBbaWYgeW91ciBwYXRjaCBpcyBhcHBsaWVkIHRvIHRoZSB3
cm9uZyBnaXQgdHJlZSwgcGxlYXNlIGRyb3AgdXMgYSBub3RlIHRvCj4+IGhlbHAgaW1wcm92aW5n
IHRoZSBzeXN0ZW1dCj4+Cj4+IHVybDoKPj4gaHR0cHM6Ly9naXRodWIuY29tLzBkYXktY2kvbGlu
dXgvY29tbWl0cy9QZXRlci1PaC9hdGgxMGstcGFyc2UtUngtTUFDLXRpbWVzdGFtcC1pbi1tZ210
LWZyYW1lLWZvci1GVy0xMC00LzIwMTYwMzIzLTA2NDg0Mwo+PiBiYXNlOgo+PiBodHRwczovL2dp
dC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9rdmFsby93aXJlbGVzcy1kcml2
ZXJzLW5leHQuZ2l0Cj4+IG1hc3Rlcgo+PiBjb25maWc6IHg4Nl82NC1yYW5kY29uZmlnLXgwMDAt
MjAxNjEyIChhdHRhY2hlZCBhcyAuY29uZmlnKQo+PiByZXByb2R1Y2U6Cj4+ICAgICAgICAgICMg
c2F2ZSB0aGUgYXR0YWNoZWQgLmNvbmZpZyB0byBsaW51eCBidWlsZCB0cmVlCj4+ICAgICAgICAg
IG1ha2UgQVJDSD14ODZfNjQKPj4KPj4gQWxsIHdhcm5pbmdzIChuZXcgb25lcyBwcmVmaXhlZCBi
eSA+Pik6Cj4+Cj4+ICAgICBJbiBmaWxlIGluY2x1ZGVkIGZyb20gaW5jbHVkZS9saW51eC9saW5r
YWdlLmg6NDowLAo+PiAgICAgICAgICAgICAgICAgICAgICBmcm9tIGluY2x1ZGUvbGludXgva2Vy
bmVsLmg6NiwKPj4gICAgICAgICAgICAgICAgICAgICAgZnJvbSBpbmNsdWRlL2xpbnV4L3NrYnVm
Zi5oOjE3LAo+PiAgICAgICAgICAgICAgICAgICAgICBmcm9tIGRyaXZlcnMvbmV0L3dpcmVsZXNz
L2F0aC9hdGgxMGsvd21pLmM6MTg6Cj4+ICAgICBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRo
MTBrL3dtaS5jOiBJbiBmdW5jdGlvbgo+PiAnYXRoMTBrX3dtaV8xMF80X29wX3B1bGxfbWdtdF9y
eF9ldic6Cj4+ICAgICBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL3dtaS5jOjIyMzY6
MzM6IGVycm9yOgo+PiAnV01JX1JYX1NUQVRVU19FWFRfSU5GTycgdW5kZWNsYXJlZCAoZmlyc3Qg
dXNlIGluIHRoaXMgZnVuY3Rpb24pCj4KPiBpdCBzZWVtcyB0aGUgd2FybmluZyBpcyBmYWxzZSBy
ZXBvcnQuIEkgY291bGQgc2VlIFdNSV9SWF9TVEFUVVNfRVhUX0lORk8gaXMKPiBkZWZpbmVkIGlu
IHdtaS5oLgo+IE1vcmVvdmVyIHRoaXMgY2hlY2sgY29tbWFuZCBkb2Vzbid0IGNsYWltIGFueSB3
YXJuaW5nL2Vycm9yIG1ha2UKPiBNPWRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsgQz0y
IENGPSItRF9fQ0hFQ0tfRU5ESUFOX18iCgpJIHRoaW5rIHRoZSBwcm9ibGVtIGhlcmUgaXMgYnVp
bGRib3QgdGVzdGVkIHlvdXIgcGF0Y2ggYWdhaW5zdAp3aXJlbGVzcy1kcml2ZXJzLW5leHQgdHJl
ZSB3aGljaCBkb2Vzbid0IGluY2x1ZGUgdGhlIG1hY3JvIHlldC4gVGhlCm1hY3JvIGlzIGluIGF0
aC5naXQgdGhvdWdoLgoKCk1pY2hhxYIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
