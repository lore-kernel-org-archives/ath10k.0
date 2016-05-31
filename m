Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-io0-x231.google.com ([2607:f8b0:4001:c06::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b7lzn-00025c-L3
 for ath10k@lists.infradead.org; Tue, 31 May 2016 15:54:20 +0000
Received: by mail-io0-x231.google.com with SMTP id f8so137713881ioe.3
 for <ath10k@lists.infradead.org>; Tue, 31 May 2016 08:53:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+BoTQ=NjABLfzMjc-5+wKEvesKsyMJDheZRu8_eR=XD8zic7Q@mail.gmail.com>
References: <loom.20160531T102350-834@post.gmane.org>
 <CA+BoTQ=NjABLfzMjc-5+wKEvesKsyMJDheZRu8_eR=XD8zic7Q@mail.gmail.com>
Date: Tue, 31 May 2016 08:53:56 -0700
Message-ID: <CAJ-VmokXt-V9JGL4E4jcL+u+gfvVJ-rFGP5H1bzTFkUr39mhtQ@mail.gmail.com>
Subject: Re: Please don't puke: Modifying Frame Version, Beacon and
 Probe-Response values
From: Adrian Chadd <adrian@freebsd.org>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, jpo <pommnitz@yahoo.com>

SGksCgpUaGUgb3RoZXIgdGhpbmcgdG8ga2VlcCBpbiBtaW5kIGlzIHRoZSBoYXJkd2FyZSBhc3Np
c3QgZm9yIHRoaW5ncyBsaWtlClRJTSBwYXJzaW5nLCB3YWtldXAsIGV0YyB3aWxsIGxpa2VseSBu
b3Qgd29yay4gOikKCgoKLWEKCgpPbiAzMSBNYXkgMjAxNiBhdCAwMzo1MCwgTWljaGFsIEthemlv
ciA8bWljaGFsLmthemlvckB0aWV0by5jb20+IHdyb3RlOgo+IE9uIDMxIE1heSAyMDE2IGF0IDEw
OjQ0LCBqcG8gPHBvbW1uaXR6QHlhaG9vLmNvbT4gd3JvdGU6Cj4+IEhlbGxvIGFsbCwKPj4gdG8g
aW1wbGVtZW50IGEgIlN0ZWFsdGggZmVhdHVyZSIsIGUuZy4gdGhlIFdMQU4gbmV0d29yayBkb2Vz
IG5vdCBzaG93IHVwIGluCj4+IG5vcm1hbCBTY2Fucywgd2UgbW9kaWZpZWQgdGhlIEZyYW1lIHZl
cnNpb24sIEJlYWNvbiBhbmQgUHJvYmUtUmVzcG9uc2UKPj4gdmFsdWVzIGZvciBhbiBvbGQgQVRI
NUsgY2FyZCBydW5uaW5nIG9uIHRoZSBub3cgZG9ybWFudCBNYWR3aWZpIGRyaXZlci4KPj4gUXVl
c3Rpb246IElzIHRoZSBzYW1lIHRoaW5nIGV2ZW4gUE9TU0lCTEUgd2l0aCBhdGgxMGs/IE15IG1h
aW4gY29uY2VybiBpcywKPj4gdGhhdCB0aGUgZmlybXdhcmUganVzdCB3b24ndCBoYW5kbGUgbm9u
LXN0YW5kYXJkIHZhbHVlcy4KPj4KPj4gQ2FuIHNvbWVib2R5IHdobyB1bmRlcnN0YW5kcyB0aGUg
ZGl2aXNpb24gb2YgbGFib3IgYmV0d2VlbiBtYWM4MDIxMSwgYXRoMTBrLAo+PiB0aGUgZmlybXdh
cmUgYW5kIHRoZSBoYXJkd2FyZSBzdXBwcmVzcyBoaXMgb3IgaGVyIGdhZyByZWZsZXggbG9uZyBl
bm91Z2ggdG8KPj4gdGhpbmsgYWJvdXQgdGhpcz8KPgo+IEZpcnN0IGFuZCBmb3JlbW9zdCB5b3Un
bGwgbmVlZCB0byB1c2UgZmlybXdhcmUgd2l0aCAicmF3LW1vZGUiIHN1cHBvcnQKPiAtIG90aGVy
d2lzZSBmaXJtd2FyZSBqdXN0IGNyYXBzIG92ZXIgZnJhbWUgaGVhZGVycy4gU29tZSAxMC4yLjQK
PiBzdXBwb3J0IGl0IC0geW91IGNhbiBsb29rIGludG8gdGhlIG1haWxpbmcgbGlzdCBhcmNoaXZl
IGZvciBzb21lCj4gZGlzY3Vzc2lvbnMuCj4KPiBOb3Qgc3VyZSBpZiBSeCB3aWxsIHdvcmsgdGhv
dWdoIGFzIGZpcm13YXJlLWNvbnRyb2xsZWQgUnggZmlsdGVycyBtYXkKPiBwcmV2ZW50IHlvdSBm
cm9tIHJlY2VpdmluZyBmcmFtZXMgd2l0aCBjcmF6eSBmcmFtZV9jb250cm9sIHZhbHVlcy4KPiBZ
b3UnbGwgbmVlZCB0byBjaGVjayB0aGlzIG91dCB5b3Vyc2VsZi4gU29tZSBmaXJtd2FyZSByZXZp
c2lvbnMgbWlnaHQKPiBoYXZlIFJYX0ZJTFRFUiB3bWkgY29tbWFuZCBzdXBwb3J0IGJ1dCB0aGlz
IGlzbid0IHVzZWQvZG9jdW1lbnRlZAo+IGFueXdoZXJlIGFuZCBpdCdzIHF1ZXN0aW9uYWJsZSBo
b3cgbXVjaCBpdCBhbGxvd3MgeW91IHRvIG92ZXJyaWRlLgo+Cj4gV2hhdGV2ZXIgeW91IGZpbmQg
aXQnZCBiZSBuaWNlIGlmIHlvdSBwb3N0IHdoYXRldmVyIHlvdSBmaW5kIG91dCAoZm9yCj4gcG9z
dGVyaXR5IDopCj4KPgo+IE1pY2hhxYIKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gYXRoMTBrIG1haWxpbmcgbGlzdAo+IGF0aDEwa0BsaXN0cy5p
bmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hdGgxMGsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
