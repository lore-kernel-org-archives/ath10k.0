Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22e.google.com ([2a00:1450:400c:c05::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X7OWs-0005sM-Ik
 for ath10k@lists.infradead.org; Wed, 16 Jul 2014 12:41:51 +0000
Received: by mail-wi0-f174.google.com with SMTP id d1so6085332wiv.13
 for <ath10k@lists.infradead.org>; Wed, 16 Jul 2014 05:41:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+BoTQn8TYX4vDx=K4P5rE+LBXrrUL2q1E7GsiOpBj82QgRKsw@mail.gmail.com>
References: <1405505855-13741-1-git-send-email-michal.kazior@tieto.com>
 <1405509540-32691-1-git-send-email-michal.kazior@tieto.com>
 <53C66422.10702@gmail.com>
 <CA+BoTQn8TYX4vDx=K4P5rE+LBXrrUL2q1E7GsiOpBj82QgRKsw@mail.gmail.com>
Date: Wed, 16 Jul 2014 14:41:27 +0200
Message-ID: <CA+BoTQkk5oYS4JZ5a6W02rZ62AgxcHE76knS7QA2VfZDxYi2Jg@mail.gmail.com>
Subject: Re: [PATCH v3] ath10k: fix Rx aggregation reordering
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
To: Varka Bhadram <varkabhadram@gmail.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Denton Gentry <denton.gentry@gmail.com>

T24gMTYgSnVseSAyMDE0IDE0OjM1LCBNaWNoYWwgS2F6aW9yIDxtaWNoYWwua2F6aW9yQHRpZXRv
LmNvbT4gd3JvdGU6Cj4gT24gMTYgSnVseSAyMDE0IDEzOjM4LCBWYXJrYSBCaGFkcmFtIDx2YXJr
YWJoYWRyYW1AZ21haWwuY29tPiB3cm90ZToKPj4gT24gMDcvMTYvMjAxNCAwNDo0OSBQTSwgTWlj
aGFsIEthemlvciB3cm90ZToKPj4KPj4gKC4uLikKPj4KPj4KPj4+ICtzdGF0aWMgdm9pZCBhdGgx
MGtfaHR0X3J4X2FkZGJhKHN0cnVjdCBhdGgxMGsgKmFyLCBzdHJ1Y3QgaHR0X3Jlc3AgKnJlc3Ap
Cj4+PiArewo+Pj4gKyAgICAgICBzdHJ1Y3QgaHR0X3J4X2FkZGJhICpldiA9ICZyZXNwLT5yeF9h
ZGRiYTsKPj4+ICsgICAgICAgc3RydWN0IGF0aDEwa19wZWVyICpwZWVyOwo+Pj4gKyAgICAgICBz
dHJ1Y3QgYXRoMTBrX3ZpZiAqYXJ2aWY7Cj4+PiArICAgICAgIHUxNiBpbmZvMCwgdGlkLCBwZWVy
X2lkOwo+Pj4gKwo+Pj4gKyAgICAgICBpbmZvMCA9IF9fbGUzMl90b19jcHUoZXYtPmluZm8wKTsK
Pj4+ICsgICAgICAgdGlkID0gTVMoaW5mbzAsIEhUVF9SWF9CQV9JTkZPMF9USUQpOwo+Pj4gKyAg
ICAgICBwZWVyX2lkID0gTVMoaW5mbzAsIEhUVF9SWF9CQV9JTkZPMF9QRUVSX0lEKTsKPj4+ICsK
Pj4+ICsgICAgICAgYXRoMTBrX2RiZyhBVEgxMEtfREJHX0hUVCwKPj4+ICsgICAgICAgICAgICAg
ICAgICAiaHR0IHJ4IGFkZGJhIHRpZCAlaHUgcGVlcl9pZCAlaHUgc2l6ZSAlaGh1XG4iLAo+Pj4g
KyAgICAgICAgICAgICAgICAgIHRpZCwgcGVlcl9pZCwgZXYtPndpbmRvd19zaXplKTsKPj4+ICsK
Pj4+ICsgICAgICAgc3Bpbl9sb2NrX2JoKCZhci0+ZGF0YV9sb2NrKTsKPj4+ICsgICAgICAgcGVl
ciA9IGF0aDEwa19wZWVyX2ZpbmRfYnlfaWQoYXIsIHBlZXJfaWQpOwo+Pj4gKyAgICAgICBpZiAo
IXBlZXIpIHsKPj4+ICsgICAgICAgICAgICAgICBhdGgxMGtfd2FybigicmVjZWl2ZWQgYWRkYmEg
ZXZlbnQgZm9yIGludmFsaWQgcGVlcl9pZDoKPj4+ICVodVxuIiwKPj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICBwZWVyX2lkKTsKPj4+ICsgICAgICAgICAgICAgICBzcGluX3VubG9ja19i
aCgmYXItPmRhdGFfbG9jayk7Cj4+PiArICAgICAgICAgICAgICAgcmV0dXJuOwo+Pj4gKyAgICAg
ICB9Cj4+Cj4+Cj4+IEhlcmUgbXkgY29uY2VybiBpbiBhbW91bnQgb2YgdGltZSBob2xkaW5nIHRo
ZSBsb2NrLi4uCj4+Cj4+IHNwaW5fbG9ja19iaCgmYXItPmRhdGFfbG9jayk7Cj4+IHBlZXIgPSBh
dGgxMGtfcGVlcl9maW5kX2J5X2lkKGFyLCBwZWVyX2lkKTsKPj4gaWYgKCFwZWVyKSB7Cj4+ICAg
ICAgICAgc3Bpbl91bmxvY2tfYmgoJmFyLT5kYXRhX2xvY2spOwo+Pgo+PiAgICAgICAgIGF0aDEw
a193YXJuKCJyZWNlaXZlZCBhZGRiYSBldmVudCBmb3IgaW52YWxpZCBwZWVyX2lkOiAlaHVcbiIs
Cj4+ICAgICAgICAgICAgICAgICAgICAgcGVlcl9pZCk7Cj4+ICAgICAgICAgcmV0dXJuOwo+PiB9
Cj4+Cj4+IE5vIG5lZWQgdG8gb2YgcHV0dGluZyB0aGUgZGVidWcgbWVzc2FnZSBpbnNpZGUgdGhl
IGNyaXRpY2FsIHJlZ2lvbi4uLiAgOi0pCj4KPiBTb3VuZHMgcmVhc29uYWJsZSBpbiB0aGlzIGNh
c2UgYXMgSSdtIG5vdCBwcmludGluZyBzcGlubG9jay1wcm90ZWN0ZWQgdmFsdWVzLgoKLi5hbmQg
SSByZWFsaXplZCB0aGlzIGlzbid0IHRydWUgdXBvbiBoaXR0aW5nIHRoZSBzZW5kIGJ1dHRvbi4K
ClRoZSBvdGhlciBwcmludCB1c2VzIHBlZXItPnZkZXZfaWQuIFRoZSBwZWVyIHdhcyBhY3F1aXJl
ZCB1bmRlciBhIGxvY2sKYW5kIG11c3Qgbm90IGJlIHVzZWQgYWZ0ZXIgdGhlIGxvY2sgaXMgcmVs
ZWFzZWQuIEl0J2xsIGp1c3QgbG9vawpjb25mdXNpbmcgaWYgSSBtaXggb3JkZXJpbmcgb2YgdW5s
b2NrL3ByaW50IGluIHNvbWUgY2FzZXMgc28gSSdsbApsZWF2ZSBpdCBhcyBpcy4KCihzb3JyeSBm
b3IgdGhlIG5vaXNlKQoKCk1pY2hhxYIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
