Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22c.google.com ([2a00:1450:400c:c05::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YJIdD-0000nF-Kw
 for ath10k@lists.infradead.org; Thu, 05 Feb 2015 09:21:52 +0000
Received: by mail-wi0-f172.google.com with SMTP id h11so37388387wiw.5
 for <ath10k@lists.infradead.org>; Thu, 05 Feb 2015 01:21:28 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <874mr2uklo.fsf@kamboji.qca.qualcomm.com>
References: <1422611244-20767-1-git-send-email-michal.kazior@tieto.com>
 <874mr2uklo.fsf@kamboji.qca.qualcomm.com>
Date: Thu, 5 Feb 2015 10:21:28 +0100
Message-ID: <CA+BoTQmuHASUnvVphBLu0sg-U3c7-GmbVrZ5EsZXZ3_0+RqG0A@mail.gmail.com>
Subject: Re: [PATCH 0/4] ath10k: implement fw stats for wmi-tlv
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

T24gNCBGZWJydWFyeSAyMDE1IGF0IDA5OjQ5LCBLYWxsZSBWYWxvIDxrdmFsb0BxY2EucXVhbGNv
bW0uY29tPiB3cm90ZToKPiBNaWNoYWwgS2F6aW9yIDxtaWNoYWwua2F6aW9yQHRpZXRvLmNvbT4g
d3JpdGVzOgo+Cj4+IFRoZXJlIGFyZSBzb21lIHNsaWdodCBkaWZmZXJlbmNlcyBpbiBmdyBzdGF0
cwo+PiAoc2ljKSBpbiB3bWktdGx2Lgo+Pgo+PiBGaXJtd2FyZSBoYXMgY2hhbmdlZCB0aGUgcXVl
cnlpbmcgc2NoZW1lIGFuZCBubwo+PiBsb25nZXIgcmVxdWlyZXMgdGhlIHBpbmctcG9uZyB0byBn
ZXQgYWxsIHN0YXRzLgo+PiBUaGUgcGF0Y2hzZXQgZG9lc24ndCBjaGFuZ2UgdGhpcyBiZWhhdmlv
dXIgc28gd2l0aAo+PiB3bWktdGx2IGl0J3MgcG9zc2libGUgdG8gc2VlIHRoZSBmb2xsb3dpbmcK
Pj4gd2FybmluZ3Mgd2hlbiByZWFkaW5nIGZ3IHN0YXRzOgo+Pgo+PiAgYXRoMTBrX3BjaSAwMDAw
OjAwOjA2LjA6IHJlY2VpdmVkIHVuc29saWNpdGVkIHN0YXRzIHVwZGF0ZSBldmVudAo+Pgo+PiBU
aGUgbG9naWMgaW4gYXRoMTBrIHN0aWxsIHByb2R1Y2VzIGNvcnJlY3QgcmVzdWx0cwo+PiBzbyB0
aGlzIGlzIGhhcm1sZXNzLgo+Pgo+PiBJIHdvbmRlciBob3cgdG8gZGVhbCB3aXRoIHRoaXMgaW4g
YSBzYW5lIHdheS4gQW4KPj4gYGlmIChvcF92ZXIgPT0gV01JX1RMVilgIGlzIGEgbGl0dGxlIGJh
ZCBidXQKPj4gaGF2aW5nIGEgbmV3IGFyLT5md19mZWF0dXJlIGZsYWcganVzdCBmb3IgYSBkZWJ1
Zwo+PiBmYWNpbGl0eSBsaWtlIHRoaXMgaXMgYSBiaXQgc2lsbHkuIE9yIHdlIGNhbiBqdXN0Cj4+
IGRyb3AgdGhlIHdhcm5pbmcgYW5kIGxlYXZlIGEgY29tbWVudC4gSWRlYXM/Cj4KPiBJIHRoaW5r
IHdlIGNvdWxkIGp1c3QgcmVtb3ZlIHRoZSB3YXJuaW5nLgo+Cj4+IE1pY2hhbCBLYXppb3IgKDQp
Ogo+PiAgIGF0aDEwazogYWRkIHZkZXYgc3RhdHMgcHJvY2Vzc2luZwo+PiAgIGF0aDEwazogY2hh
bmdlIHJlcXVlc3Qgc3RhdHMgY29tbWFuZCBwcm90b3R5cGUKPj4gICBhdGgxMGs6IGFkZCBtb3Jl
IHdtaSBmdyBzdGF0IGRlZmluZXMKPj4gICBhdGgxMGs6IGltcGxlbWVudCBmdyBzdGF0cyBmb3Ig
d21pLXRsdgo+Cj4gVGhlcmUgd2FzIGEgY29uZmxpY3QgaW4gcGF0Y2ggMiBidXQgMy13YXkgbWVy
Z2Ugc29sdmVkIGl0IGF1dG9tYXRpY2FsbHkuCj4gUGxlYXNlIGNoZWNrIHRoZSByZXN1bHQgaW4g
dGhlIHBlbmRpbmcgYnJhbmNoLgoKTG9va3MgZ29vZCwgdGhhbmtzIQoKCk1pY2hhxYIKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5n
IGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
