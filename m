Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x229.google.com ([2a00:1450:400c:c09::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1azkHD-0007VK-A1
 for ath10k@lists.infradead.org; Mon, 09 May 2016 12:27:08 +0000
Received: by mail-wm0-x229.google.com with SMTP id n129so135520861wmn.1
 for <ath10k@lists.infradead.org>; Mon, 09 May 2016 05:26:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CACiydbLD2F2Z-iEW_jNr2hoKZzbiA7Y2gCnP4eeKkZpotzkSzA@mail.gmail.com>
References: <CACiydb+XMSfC262B6TzuZwx4W+LAbC7627uMKmiK9SjfuFpO4A@mail.gmail.com>
 <1460129643950.46282@qti.qualcomm.com>
 <CACiydbLHksfB68yOZq3SLuXEw-ucw5FnTDHq_un_Bpeah_5mZQ@mail.gmail.com>
 <ab762b501abc457aa1dbf965895eb113@aphydexm01b.ap.qualcomm.com>
 <CACiydbL3-QoC=muZf4aJOaUWZN-tpA3h1SwNfYU3+LnY_FHF+g@mail.gmail.com>
 <1460174525702.66744@qti.qualcomm.com>
 <CACiydbLh+X540MrnvS5MGm8Bd3QnnWmdFyon8H5khJiFtGK85w@mail.gmail.com>
 <1460905574286.42282@qti.qualcomm.com>
 <CACiydb+AaTc2wWzVeJNwPzA+PH9FcrqWzx3nW2RmKxaiaHwg-w@mail.gmail.com>
 <CACiydbKu8_1sO9K8uuY_SSL8ECvr3wZttt+72cNO9dc_7RRM2A@mail.gmail.com>
 <CA+BoTQndOpgYYZiZbenROV9+-WUHSbUugDDgCKGVe2fyA0efXQ@mail.gmail.com>
 <CACiydb+rPQW8_0bQE0maVt6cvbhxtH0ZuFeRNW2paupBaVT3vA@mail.gmail.com>
 <CA+BoTQmn_hS1X1BjC7=wmevnAGiPx7iit0NMUxnmmqjFZ_RnVA@mail.gmail.com>
 <87k2jtk3wt.fsf@kamboji.qca.qualcomm.com>
 <CACiydbLD2F2Z-iEW_jNr2hoKZzbiA7Y2gCnP4eeKkZpotzkSzA@mail.gmail.com>
Date: Mon, 9 May 2016 14:26:45 +0200
Message-ID: <CA+BoTQkOLAB5KXo4taFEn_K_uEeLi81shEupVMU7E=97389cpQ@mail.gmail.com>
Subject: Re: ath10k performance, master branch from 20160407
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
To: Roman Yeryomin <leroi.lists@gmail.com>
Cc: "Valo, Kalle" <kvalo@qca.qualcomm.com>, "Manoharan,
 Rajkumar" <rmanohar@qti.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Rajkumar Manoharan <rmanohar@codeaurora.org>

SGkgUm9tYW4sCgpPbiAyMiBBcHJpbCAyMDE2IGF0IDE5OjA1LCBSb21hbiBZZXJ5b21pbiA8bGVy
b2kubGlzdHNAZ21haWwuY29tPiB3cm90ZToKPiBPbiAxOSBBcHJpbCAyMDE2IGF0IDE4OjM1LCBW
YWxvLCBLYWxsZSA8a3ZhbG9AcWNhLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4+IE1pY2hhbCBLYXpp
b3IgPG1pY2hhbC5rYXppb3JAdGlldG8uY29tPiB3cml0ZXM6Cj4+Cj4+PiBPbiAxOSBBcHJpbCAy
MDE2IGF0IDA5OjMxLCBSb21hbiBZZXJ5b21pbiA8bGVyb2kubGlzdHNAZ21haWwuY29tPiB3cm90
ZToKPj4+PiBPbiAxOSBBcHJpbCAyMDE2IGF0IDA4OjI4LCBNaWNoYWwgS2F6aW9yIDxtaWNoYWwu
a2F6aW9yQHRpZXRvLmNvbT4gd3JvdGU6Cj4+Pj4KPj4+Pj4gSWYgbXkgaHVuY2ggaXMgcmlnaHQg
dGhlcmUncyBubyBlYXN5IChhbmQgcHJvcGVyKSBmaXggZm9yIHRoYXQgbm93Lgo+Pj4+Pgo+Pj4+
PiBPbmUgb2YgdGhlIHBhdGNoc2V0IHBhdGNoZXMgKGF0aDEwazogaW1wbGVtZW50IHdha2VfdHhf
cXVldWUpIHN0YXJ0cwo+Pj4+PiB0byB1c2UgbWFjODAyMTEgc29mdHdhcmUgcXVldWluZy4gVGhp
cyBpbnRyb2R1Y2VzIGV4dHJhIGluZHVjZWQKPj4+Pj4gbGF0ZW5jeSBhbmQgSSdtIGd1ZXNzaW5n
IGl0IHJlc3VsdHMgaW4gZmlsbC1pbi10aGVuLWRyYWluIHNlcXVlbmNlcyBpbgo+Pj4+PiBzb21l
IGNhc2VzIHdoaWNoIGVuZCB1cCBiZWluZyBsb25nIGVub3VnaCB0byBtYWtlIGZxX2NvZGVsX2Ry
b3AgbW9yZQo+Pj4+PiB3b3JrIHRoYW4gbm9ybWFsLgo+Pj4+Pgo+Pj4+PiBUaGlzIGlzIHJlcXVp
cmVkIGZvciBvdGhlciBjaGFuZ2VzIGFuZCBNVS1NSU1PIHBlcmZvcm1hbmNlCj4+Pj4+IGltcHJv
dmVtZW50cyBzbyB0aGlzIHBhdGNoIGNhbid0IGJlIHJlbW92ZWQuCj4+Pj4KPj4+PiBCdXQgcWNh
OTg4eCBkb2Vzbid0IHN1cHBvcnQgTVUtTUlNTywgQUZBSUsuCj4+Pgo+Pj4gQ29ycmVjdC4KPj4+
Cj4+Pgo+Pj4+IENhbiB0aGlzIGJlIG1hZGUgY2hpcCBkZXBlbmRlbnQ/Cj4+Pgo+Pj4gSSBndWVz
cyBpdCBjb3VsZCBidXQgaXQnZCBhcmd1YWJseSBtYWtlIHRoZSBkcml2ZXIgbW9yZSBjb21wbGV4
IGFuZAo+Pj4gaGFyZGVyIHRvIG1haW50YWluLiBXaGF0IHdlIHdhbnQgaXMgYSBsb25nLXRlcm0g
Zml4LCBub3QgYSBzaG9ydC10ZXJtCj4+PiBvbmUuCj4+Cj4+IEJ1dCB3ZSBzaG91bGQgbmV2ZXIg
Z28gYmFja3dhcmRzIGFuZCBUQ1AgZHJvcHBpbmcgZnJvbSA3NTAgTWJwcyB0byB+NTUwCj4+IE1i
cHMgaXMgYSBodWdlIGRyb3AsIHNvIHRoaXMgaXMgbm90IG9rLiBXZSBoYXZlIHRvIGRvIHNvbWV0
aGluZyB0byBmaXgKPj4gdGhpcywgYmUgaXQgcmV2ZXJ0aW5nIHRoZSB3YWtlX3R4X3F1ZXVlIHN1
cHBvcnQsIHNvbWVob3cgZGlzYWJsaW5nIGl0IGJ5Cj4+IGRlZmF1bHQgb3Igc29tZXRoaW5nLgo+
Cj4gSSB3b3VsZCBhZ3JlZSB3aXRoIEthbGxlIGhlcmUuIFRoaXMgbG9va3MgbGlrZSB2ZXJ5IHNl
cmlvdXMgcmVncmVzc2lvbi4KPiBCdXQgSSdtIGFmcmFpZCBJIGNhbiBvbmx5IGhlbHAgd2l0aCB0
ZXN0aW5nIGhlcmUuCgpDYW4geW91IGdpdmUgdGhlIGZvbGxvd2luZyBwYXRjaCBhIHRyeSwgcGxl
YXNlPyBJIGRpZG4ndCBnZXQgdG8KcmVwcm9kdWNlIHlvdXIgcHJvYmxlbSBvbiBhIHJlYWwgQVAx
MzUvQVAxNTIgYm9hcmQgYW5kIGluc3RlYWQgdHJpZWQKdG8gc2ltdWxhdGUgYSBzbG93IHVuaS1w
cm9jIHN5c3RlbSB2aWEgS1ZNIGFuZCBjb29saW5nX2RldmljZSBpbgpzeXNmcy4gVGhlIHBhdGNo
IGRvZXMgaW1wcm92ZSB0aGluZ3MgaW4gdGhpcyBzeW50aGV0aWMgc2V0dXAgZm9yIG1lLgoKICBo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9waXBlcm1haWwvYXRoMTBrLzIwMTYtTWF5LzAwNzUy
Ni5odG1sCgoKTWljaGHFggoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
