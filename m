Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22b.google.com ([2a00:1450:400c:c05::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WkZT3-0000vt-UB
 for ath10k@lists.infradead.org; Wed, 14 May 2014 13:43:34 +0000
Received: by mail-wi0-f171.google.com with SMTP id hm4so8043827wib.4
 for <ath10k@lists.infradead.org>; Wed, 14 May 2014 06:43:11 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87oaz0fprm.fsf@kamboji.qca.qualcomm.com>
References: <1399638957-20449-1-git-send-email-michal.kazior@tieto.com>
 <CA+BoTQ=VxSu9q_w3tjMNikKxuiMAfW5=k9La_AK3PoP8azgFUA@mail.gmail.com>
 <87oaz0fprm.fsf@kamboji.qca.qualcomm.com>
Date: Wed, 14 May 2014 15:43:11 +0200
Message-ID: <CA+BoTQmytFM-YxXCMdhZ8J3OhK2udRrAtuWrY0rrLrHbASjGgA@mail.gmail.com>
Subject: Re: [PATCH 0/7] ath10k: recovery improvements 2014-05-09
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

T24gMTQgTWF5IDIwMTQgMTU6MzQsIEthbGxlIFZhbG8gPGt2YWxvQHFjYS5xdWFsY29tbS5jb20+
IHdyb3RlOgo+IE1pY2hhbCBLYXppb3IgPG1pY2hhbC5rYXppb3JAdGlldG8uY29tPiB3cml0ZXM6
Cj4KPj4gT24gOSBNYXkgMjAxNCAxNDozNSwgTWljaGFsIEthemlvciA8bWljaGFsLmthemlvckB0
aWV0by5jb20+IHdyb3RlOgo+Pj4gSGksCj4+Pgo+Pj4gVGhpcyBkZXBlbmRzIG9uIG15IGBhdGgx
MGs6IHJlY292ZXJ5IGZpeGVzCj4+PiAyMDE0LTA1LTA5YC4KPj4+Cj4+PiBIb3BlZnVsbHkgdGhl
IHNwbGl0IG1ha2VzIGl0IGEgbGl0dGxlIHNhbmVyIHRvCj4+PiByZXZpZXcuCj4+Pgo+Pj4gUGxl
YXNlIG5vdGU6IGBhdGgxMGs6IG1ha2Ugd21pIHRpbWVvdXQgdHJpZ2dlciBodwo+Pj4gcmVzdGFy
dGAgZWZmZWN0aXZlbHkgaGlkZXMgdGhlIG1nbXQgdHggLyBodGMKPj4+IGNyZWRpdCBzdGFydmF0
aW9uIGlzc3VlIHRoYXQgd2FzIGRpc2N1c3NlZAo+Pj4gcmVjZW50bHkuIE15IGludGVudGlvbiBp
cyB0byBtYWtlIHRoZSBkcml2ZXIgbW9yZQo+Pj4gcm9idXN0IGFuZCBhcyBhIHNpZGUgZWZmZWN0
IGl0IG1ha2VzIHRoZQo+Pj4gc3RhcnZhdGlvbiBpc3N1ZSBsZXNzIHBhaW5mdWwuIElmIGRlc2ly
ZWQgc28KPj4+IHRoZSBwYXRjaCBjYW4gYmUgZWFzaWx5IGlnbm9yZWQgaW4gdGhlIHNlcmllcyBh
cwo+Pj4gbm90aGluZyBkZXBlbmRzIG9uIGl0Lgo+Pj4KPj4+Cj4+PiBNaWNoYWwgS2F6aW9yICg3
KToKPj4+ICAgYXRoMTBrOiBtb3ZlIHJlc3RhcnRfd29yayBjYWxsCj4+PiAgIGF0aDEwazogaW50
cm9kdWNlIGNvcmUgcmVzdGFydCBzeW1ib2wKPj4KPj4KPj4+ICAgYXRoMTBrOiBkcmFpbiB3bWkg
cXVpY2tseSB1cG9uIGh3IHJlc3RhcnQKPj4+ICAgYXRoMTBrOiB3YWtlIHVwIGV2ZXJ5dGhpbmcg
b24gY29yZSByZXN0YXJ0Cj4+Cj4+IFRoZXNlIDIgYXJlIGhhcm1mdWwgYXMgdGhleSBhcmUuIElu
IGNhc2Ugb2YgZWFybHkgZncgY3Jhc2gKPj4gdW5pbml0aWFsaXplZCBzdHJ1Y3R1cmVzIGFyZSBh
Y2Nlc3NlZC4gSSdsbCByZS1zcGluIGxhdGVyLgo+Cj4gU28gSSBjYW4gZHJvcCB0aGUgd2hvbGUg
c2VyaWVzLCByaWdodD8KCkNvcnJlY3QuCgoKTWljaGHFggoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2F0aDEwawo=
