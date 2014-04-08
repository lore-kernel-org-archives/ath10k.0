Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x229.google.com ([2a00:1450:400c:c05::229])
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXPba-0003mc-Pg
 for ath10k@lists.infradead.org; Tue, 08 Apr 2014 06:33:59 +0000
Received: by mail-wi0-f169.google.com with SMTP id hm4so7345834wib.4
 for <ath10k@lists.infradead.org>; Mon, 07 Apr 2014 23:32:58 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87bnwdnslk.fsf@kamboji.qca.qualcomm.com>
References: <1396337123-12622-1-git-send-email-michal.kazior@tieto.com>
 <1396610926-5787-1-git-send-email-michal.kazior@tieto.com>
 <1396610926-5787-3-git-send-email-michal.kazior@tieto.com>
 <87bnwdnslk.fsf@kamboji.qca.qualcomm.com>
Date: Tue, 8 Apr 2014 08:32:58 +0200
Message-ID: <CA+BoTQ=-vrJ_tize+uwCp5jgM7pvPZ0s9bGUK42Ko1TCHzmfzg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ath10k: refactor radar detection code
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

T24gNyBBcHJpbCAyMDE0IDE2OjA0LCBLYWxsZSBWYWxvIDxrdmFsb0BxY2EucXVhbGNvbW0uY29t
PiB3cm90ZToKPiBNaWNoYWwgS2F6aW9yIDxtaWNoYWwua2F6aW9yQHRpZXRvLmNvbT4gd3JpdGVz
Ogo+Cj4+IElmIDIwTUh6IENBQyBjb21wbGV0ZWQgc3VjY2Vzc2Z1bGx5IHRoZW4KPj4gc3Vic2Vx
dWVudCBDQUMgd2l0aCB3aWRlciBiYW5kd2lkdGggKDQwTWh6LCA4ME1oeikKPj4gd2l0aCBpZGVu
dGljYWwgY29udHJvbCBmcmVxdWVuY3kgZGlkIG5vdCBzdGFydAo+PiBtb25pdG9yIHZkZXYgbWFr
aW5nIGl0IGltcG9zc2libGUgdG8gZGV0ZWN0IGFueQo+PiByYWRhciBwdWxzZXMgZHVyaW5nIGlu
dGVuZGVkIENBQy4KPj4KPj4gSXQgYWxzbyB3YXMgaW5jb3JyZWN0IHRvIGFzc3VtZSBhdGgxMGtf
Y29uZmlnKCkgd2lsbAo+PiBiZSBjYWxsZWQgYWZ0ZXIgQ0FDIGlzIGZpbmlzaGVkLiBUaGVvcmV0
aWNhbGx5IGZvcgo+PiBub24tSFQgY2hhbm5lbHMgbm90aGluZyBjaGFuZ2VzIGJldHdlZW4gQ0FD
IGFuZAo+PiBzdGFydF9hcCgpIChhbGJlaXQgaW4gcHJhY3RpY2UgdGhpcyBjYW4gYmUKPj4gZGlm
ZmVyZW50KS4gVGhlIGluY29ycmVjdCBhc3N1bXB0aW9uIGxlZCB0byBDQUMKPj4gbm90IGJlaW5n
IHN0b3BwZWQgb24gbm9uLUhUIGNoYW5kZWZzIGxlYWRpbmcgdG8KPj4gYWxsIFJ4IGJlaW5nIGRy
b29wZWQgbWFraW5nIGl0IGltcG9zc2libGUgZm9yCj4+IGNsaWVudHMgdG8gYXNzb2NpYXRlLgo+
Pgo+PiBXaGlsZSBhdCBpdCBjbGVhbiB1cCB0aGUgY29kZSBhIGJpdC4KPj4KPj4gU2lnbmVkLW9m
Zi1ieTogTWljaGFsIEthemlvciA8bWljaGFsLmthemlvckB0aWV0by5jb20+Cj4KPiBbLi4uXQo+
Cj4+IEBAIC04NTgsNiArODMwLDExIEBAIHN0YXRpYyBpbnQgYXRoMTBrX3ZkZXZfc3RvcChzdHJ1
Y3QgYXRoMTBrX3ZpZiAqYXJ2aWYpCj4+ICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPj4gICAg
ICAgfQo+Pgo+PiArICAgICBpZiAoIVdBUk5fT04oYXItPm51bV9zdGFydGVkX3ZkZXZzID09IDAp
KSB7Cj4KPiBFdmVuIHRob3VnaCB0aGlzIGlzIGNvcnJlY3QsIEkgdGhpbmsgaXQncyBzdGlsbCBh
IGJpdCBldmlsLiBGb3IgZXhhbXBsZSwKPiBJIG1pc3NlZCAnIScgdGhlIGZpcnN0IHRpbWUgSSBs
b29rZWQgYXQgdGhpcy4gRXZlbiB0aGlzIGlzIGEgbGluZQo+IGxvbmdlciwgSSB0aGluayBpdCB3
b3VsZCBiZSBlYXNpZXIgdG8gcmVhZDoKPgo+IFdBUk5fT04oYXItPm51bV9zdGFydGVkX3ZkZXZz
ID09IDApOwo+Cj4gaWYgKGFyLT5udW1fc3RhcnRlZF92ZGV2cyAhPSAwKSB7Cj4gICAgICAgICAu
Li4KPiB9CgpTb3VuZCByZWFzb25hYmx5LgoKCk1pY2hhxYIKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hdGgxMGsK
