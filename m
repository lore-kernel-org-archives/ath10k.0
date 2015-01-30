Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x234.google.com ([2a00:1450:400c:c00::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YHBWx-0005hE-2s
 for ath10k@lists.infradead.org; Fri, 30 Jan 2015 13:22:39 +0000
Received: by mail-wg0-f52.google.com with SMTP id y19so26816650wgg.11
 for <ath10k@lists.infradead.org>; Fri, 30 Jan 2015 05:22:17 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1422623054.1919.18.camel@sipsolutions.net>
References: <1422607287-12289-1-git-send-email-michal.kazior@tieto.com>
 <1422621086-28970-1-git-send-email-michal.kazior@tieto.com>
 <1422621086-28970-3-git-send-email-michal.kazior@tieto.com>
 <1422621903.1919.7.camel@sipsolutions.net>
 <CA+BoTQkdszYWbNJcV+1dDFsaSJ3aoTuC=ORUMr_aJx7_aQmcqw@mail.gmail.com>
 <1422623054.1919.18.camel@sipsolutions.net>
Date: Fri, 30 Jan 2015 14:22:16 +0100
Message-ID: <CA+BoTQnkqzHNWTFSc9VB4_itCK_+jC6HC8GmdMKiyrhu-Sz9Cg@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] ath10k: implement chanctx API
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
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMzAgSmFudWFyeSAyMDE1IGF0IDE0OjA0LCBKb2hhbm5lcyBCZXJnIDxqb2hhbm5lc0BzaXBz
b2x1dGlvbnMubmV0PiB3cm90ZToKPiBPbiBGcmksIDIwMTUtMDEtMzAgYXQgMTQ6MDIgKzAxMDAs
IE1pY2hhbCBLYXppb3Igd3JvdGU6Cj4KPj4gSSByZWNhbGwgdGhhdCBhdCBsZWFzdCB0aGVyZSdz
IG9uZSBjYXNlIHdoZXJlIHVzaW5nIHRoZXNlIGhlbHBlcnMgaXMKPj4gaW1wb3NzaWJsZTogZHJ2
X2NvbmZpZygpIHdoaWNoIGNhbiBiZSBjYWxsZWQgd2hpbGUgbWFjODAyMTEgaXMgYWxyZWFkeQo+
PiBob2xkaW5nIGlmbGlzdF9tdHguIGF0aDEwayBuZWVkcyB0byBpdGVyYXRlIG92ZXIgdmlmcyBh
bmQgaXNzdWUKPj4gYmxvY2tpbmcgY29tbWFuZHMgc29tZXRpbWVzIHNvIGl0IGNhbid0IHVzZSBh
dG9taWMvcmN1IHZlcnNpb25zCj4+IGVpdGhlci4KPgo+IElmIHlvdSB3YW50ZWQgdG8gdXNlIGl0
LCBJIHdvdWxkbid0IGJlIGF2ZXJzZSB0byBhZGRpbmcgYSBsb2NrZWQgdmVyc2lvbgo+IHRoYXQg
Y2FuIG9ubHkgYmUgdXNlZCBpbnNpZGUgYSBmZXcgb2Ygc3VjaCBjYWxsYmFja3MuIFdpdGggYXBw
cm9wcmlhdGUKPiBsb2NrZGVwIHdhcm5pbmdzIHRoYXQgd291bGQgYmUgc2FmZSBlbm91Z2gsIEkg
dGhpbmsuCgpZb3UnZCBwcm9iYWJseSBoYXZlIHRvIGFkZCBxdWl0ZSBhIGZldyBtdXRleF9sb2Nr
KGlmbGlzdF9tdHgpIGFyb3VuZApkcnZfKigpIGNhbGxzIChub3QgZGlyZWN0bHkgYnV0IHNvbWV3
aGVyZSBhdCB0aGVpciBjYWxsIHRyZWVzKSB0bwpndWFyYW50ZWUgZHJpdmVyIGNhbiB1c2UgbG9j
ay1mcmVlIGl0ZXJhdGUoKSB2ZXJzaW9uICh3aGljaCBkb2Vzbid0CmV4aXN0IHlldCkuIFRoaXMg
Y291bGQgYmUgdHJpY2t5LgoKCk1pY2hhxYIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgx
MGsK
