Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x236.google.com ([2a00:1450:400c:c05::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yb4dO-0001Mb-TQ
 for ath10k@lists.infradead.org; Thu, 26 Mar 2015 10:03:31 +0000
Received: by wibbg6 with SMTP id bg6so57631063wib.0
 for <ath10k@lists.infradead.org>; Thu, 26 Mar 2015 03:03:09 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+BoTQm74JDvMk=G2Hot7h4v4gU4gRh8JH0K=1yhMa_UGQ4e0A@mail.gmail.com>
References: <1426849379-7562-1-git-send-email-marek.puzyniak@tieto.com>
 <1426849379-7562-2-git-send-email-marek.puzyniak@tieto.com>
 <CA+BoTQm74JDvMk=G2Hot7h4v4gU4gRh8JH0K=1yhMa_UGQ4e0A@mail.gmail.com>
Date: Thu, 26 Mar 2015 11:03:08 +0100
Message-ID: <CA+BoTQmk+KzhO1xa3AP9tiDnEVG36OD5WoV+VwRCtvSF1sEtMw@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] ath10k: unify tx mode and dispatch
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
To: Marek Puzyniak <marek.puzyniak@tieto.com>, Kalle Valo <kvalo@qca.qualcomm.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMjYgTWFyY2ggMjAxNSBhdCAxMDoyNywgTWljaGFsIEthemlvciA8bWljaGFsLmthemlvckB0
aWV0by5jb20+IHdyb3RlOgo+IE9uIDIwIE1hcmNoIDIwMTUgYXQgMTI6MDIsIE1hcmVrIFB1enlu
aWFrIDxtYXJlay5wdXp5bmlha0B0aWV0by5jb20+IHdyb3RlOgo+PiBGcm9tOiBNaWNoYWwgS2F6
aW9yIDxtaWNoYWwua2F6aW9yQHRpZXRvLmNvbT4KPj4KPj4gVGhlcmUgYXJlIGEgZmV3IGRpZmZl
cmVudCB0eCBwYXRocyBkZXBlbmRpbmcgb24KPj4gZmlybXdhcmUgYW5kIGZyYW1lIGl0c2VsZi4K
Pj4KPj4gQ3JlYXRpbmcgYSB1bmlmb3JtIGRlY2lzaW9uIHdpbGwgbWFrZSBpdCBwb3NzaWJsZQo+
PiB0byBzd2l0Y2ggYmV0d2VlbiBkaWZmZXJlbnQgdHhtb2RlIGVhc2llciwgYm90aAo+PiBmb3Ig
dGVzdGluZyBhbmQgZm9yIGZ1dHVyZSBmZWF0dXJlcyBhcyB3ZWxsLgo+Pgo+PiBTaWduZWQtb2Zm
LWJ5OiBNaWNoYWwgS2F6aW9yIDxtaWNoYWwua2F6aW9yQHRpZXRvLmNvbT4KPj4gU2lnbmVkLW9m
Zi1ieTogTWFyZWsgUHV6eW5pYWsgPG1hcmVrLnB1enluaWFrQHRpZXRvLmNvbT4KPiBbLi4uXQo+
Cj4gVGhpcyBwYXRjaCBhcHBhcmVudGx5IGJyZWFrcyBBUCBvcGVyYXRpb24uIEkgbmVlZCB0byBp
bnZlc3RpZ2F0ZSB0aGlzLgoKT2sgLSBodHQuZnJlcSBtaXNzZWQgY2xlYXJpbmcgYW5kIGluIHNv
bWUgY2FzZXMgaXQgY29udGFpbmVkIGdhcmJhZ2UKbGVhZGluZyB0byBIVFQgZGlzY2FyZGluZyBw
YWNrZXRzLgoKQEthbGxlOiBJJ3ZlIHBvc3RlZCBhIHBhdGNoIGBhdGgxMGs6IGNsZWFyIGh0dC5m
cmVxYCB3aGljaCBhZGRyZXNzZXMKdGhlIHByb2JsZW0gc2VwYXJhdGVseS4gUGxlYXNlIGFwcGx5
IGl0IF9iZWZvcmVfIHlvdSBhcHBseSBURExTCnBhdGNoZXMgKHdoaWNoIGFyZSBmaW5lLCBpbmNs
dWRpbmcgdGhpcyBwYXRjaCkgdG8gYXZvaWQgYnJlYWthZ2UKaW4tYmV0d2VlbiBjb21taXRzLgoK
Ck1pY2hhxYIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
