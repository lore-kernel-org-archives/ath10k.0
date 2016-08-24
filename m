Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bcUEC-0005RS-0m
 for ath10k@lists.infradead.org; Wed, 24 Aug 2016 09:12:08 +0000
Received: by mail-qk0-x242.google.com with SMTP id v123so757747qkh.3
 for <ath10k@lists.infradead.org>; Wed, 24 Aug 2016 02:11:47 -0700 (PDT)
Message-ID: <57BD64CE.7060106@gmail.com>
Date: Wed, 24 Aug 2016 17:11:42 +0800
From: Xuebing Wang <xbing6@gmail.com>
MIME-Version: 1.0
Subject: Re: ath10k: qca6174 firmware: difference between hw2.1/firmware-5
 and hw3.0/firmware-4
References: <57BD1B3D.3050104@gmail.com>
 <CA+BoTQnurvJv32Uszq-SngfJ5NDhjPMORDtbQGvK59LVqdxjVg@mail.gmail.com>
In-Reply-To: <CA+BoTQnurvJv32Uszq-SngfJ5NDhjPMORDtbQGvK59LVqdxjVg@mail.gmail.com>
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
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, Stanislaw Gruszka <sgruszka@redhat.com>, marcus Wright <mwright@sharetracker.net>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

SGkgTWljaGFsLCB0aGFua3MuCgoKSGkgS2FsbGUsCgpJcyB0aGVyZSBhIHZlcnNpb24gb2YgaHcz
LjAgZmlybXdhcmUgKHdpdGhvdXQgUnggb2ZmbG9hZGluZykgZm9yIG1lIHRvIApnaXZlIGEgdHJ5
IG9mIE1vbml0b3IgTW9kZSBvbiBxY2E2MTc0IGh3My4yIGNoaXA/IFRoYW5rcy4KCnh1ZWJpbmcK
Ck9uIDA4LzI0LzIwMTYgMDI6MTMgUE0sIE1pY2hhbCBLYXppb3Igd3JvdGU6Cj4gT24gMjQgQXVn
dXN0IDIwMTYgYXQgMDU6NTcsIFh1ZWJpbmcgV2FuZyA8eGJpbmc2QGdtYWlsLmNvbT4gd3JvdGU6
Cj4+IEhpIEthbGxlLAo+Pgo+PiBJIGNsb25lZCB5b3VyIGF0aDEway1maXJtd2FyZSBmcm9tIHlv
dXIgZ2l0aHViLiBXb3VsZCB5b3UgcGxlYXNlIGFkdmlzZSB3aGF0Cj4+IGFyZSB0aGUgZGlmZmVy
ZW5jZXMgb2YgaHcyLjEvZmlybXdhcmUtNSBhbmQgaHczLjAvZmlybXdhcmUtNCBmb3IgcWNhNjE3
ND8KPj4gRG9lcyBodzMuMC9maXJtd2FyZS00IHN1cHBvcnQgTW9uaXRvciBNb2RlPwo+Pgo+PiBJ
IGhhdmUgYSB3bGFuIGNhcmQgd2l0aCBCTUkgdmVyc2lvbiAoUUNBNjE3NF9IV18yXzFfVkVSU0lP
TiAweDA1MDEwMDAwKSBhbmQKPj4gTW9uaXRvciBNb2RlIHdvcmtzIG5vIHByb2JsZW0gd2l0aCBs
YXRlc3Qga2VybmVsIHY0LjgtcmMyLgo+Pgo+PiBJIGhhdmUgYW5vdGhlciB3bGFuIGNhcmQgd2l0
aCAoUUNBNjE3NF9IV18zXzJfVkVSU0lPTiAweDA1MDMwMDAwKS4gSSBhbQo+PiB0cnlpbmcgdG8g
YmFjay1wb3J0IGF0aDEwayBmcm9tIHY0LjgtcmMyIHRvIDMuMTAuNzMgZm9yIHRoaXMgSFdfM18y
IFFDQTYxNzQKPj4gd2xhbiBjYXJkLiBWaXJ0dWFsIGludGVyZmFjZSAobW9uMCkgY2FuIGJlIGFk
ZGVkIGFuZCBicm91Z2h0LXVwLCBidXQgdGNwZHVtcAo+PiBjYW4gbm90IGNhcHR1cmUgYW55IHBh
Y2tldHMuIEkgYW0gd29uZGVyaW5nIGlmIGl0IGNvdWxkIGJlIHJlbGF0ZWQgdG8KPj4gKGh3Mi4x
L2Zpcm13YXJlLTUgdnMgaHczLjAvZmlybXdhcmUtNCk/Cj4gT2ZmaWNpYWwgaHczLngncyBmaXJt
d2FyZSBzdXBwb3J0cyBmdWxsIHJ4IG9mZmxvYWQuIFJ4IGV2ZW50IHVzZWQgdG8KPiBkZWxpdmVy
IGZyYW1lcyBpcyB2ZXJ5IHNwZWNpYWxpemVkIGVmZmVjdGl2ZWx5IHByZXZlbnRpbmcgc25pZmZp
bmcgLwo+IG1vbml0b3Igb3BlcmF0aW9uLgo+Cj4gSSBkb24ndCBrbm93IGlmIHRoZXJlJ3MgYW55
IHdheSBhcm91bmQgaXQgd2l0aG91dCBnZXR0aW5nIHlvdXIgaGFuZHMKPiBvbiBmaXJtd2FyZSBi
dWlsZCB0aGF0IGRvZXNuJ3QgaGF2ZSB0aGUgZnVsbCByeCBvZmZsb2FkIGNvbXBpbGVkIGluCj4g
KGFzc3VtaW5nIHN1Y2ggYSBidWlsZCBldmVuIGV4aXN0cykuCj4KPgo+IE1pY2hhxYIKPgoKLS0g
Clh1ZWJpbmcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
