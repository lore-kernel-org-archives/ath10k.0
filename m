Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x229.google.com ([2a00:1450:400c:c05::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YwngL-0000ej-As
 for ath10k@lists.infradead.org; Mon, 25 May 2015 08:24:26 +0000
Received: by wicmx19 with SMTP id mx19so34460186wic.0
 for <ath10k@lists.infradead.org>; Mon, 25 May 2015 01:23:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CACZoB6-+AUWN6gBqnwgJY101jfjBkDukLYNNffbe2bWNidjJ0Q@mail.gmail.com>
References: <CA+BoTQ=V1psOoaL1WG7vSUjSLhPnQqBUODjeB3NyWt-pMtmNFA@mail.gmail.com>
 <1432282693-4553-1-git-send-email-michal.kazior@tieto.com>
 <CACZoB6-+AUWN6gBqnwgJY101jfjBkDukLYNNffbe2bWNidjJ0Q@mail.gmail.com>
Date: Mon, 25 May 2015 10:23:54 +0200
Message-ID: <CA+BoTQkzg1jEXjem=HQZW_qTMTZfjqLzfm58FoBraBf2urdoKA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] ath10k: handle cycle counter wraparound
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
To: Srinivasa Duvvuri <sduvvuri@google.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMjIgTWF5IDIwMTUgYXQgMTk6MTEsIFNyaW5pdmFzYSBEdXZ2dXJpIDxzZHV2dnVyaUBnb29n
bGUuY29tPiB3cm90ZToKPiBNaWNoYWwsCj4gICAgU29ycnkgSSB3YXMgb3V0IHNpY2sgbGFzdCBm
ZXcgZGF5cy4gVGhhbmtzIGZvciBzcGxpdHRpbmcgYW5kIGNyZWF0aW5nIDIKPiBwYXRjaGVzLgo+
ICAgIFRoZSBtYXRoIGZvciB0b3RhbCBjeWNsZSBjb3VudHMgbWFrZXMgc2Vuc2UgYnV0IHRoZSBt
YXRoIHRvIGhhbmRsZSB0aGUKPiByeF9jbGVhcl9jb3VudAo+ICAgIGRvZXMgbm90IHNlZW0gcmln
aHQgdG8gbWUuIEZvciB0aGUgdG90YWwgY3ljbGUgY291bnQgd2Uga25vdyB0aGF0IHRoZQo+IGNv
dW50IGNoYW5nZXMKPiAgICBmcm9tIDB4ZmZmZmZmZmYgdG8gMHg3ZmZmZmZmZi4gU28sIHdlIGNs
ZWFybHkga25vdyB0aGUgd3JhcCBhcm91bmQgcG9pbnQKPiAuIEJ1dCBmb3IKPiAgICByY2MoIHJ4
X2NsZWFyX2NvdW50KSAgd2UgZG8gbm90IGtub3cgd2hlbiB0aGlzIGNvdW50IGlzIGhhbGZlZCAo
d3JhcHBlZCkuCj4KPiAgICBMZXRzIHNheSByY2NfcHJldiAgaXMgdGhlIHByZXZpb3VzIGNsZWFy
IGN5Y2xlIGNvdW50LCByY2MgaXMgdGhlIGN1cnJlbnQKPiBjbGVhciBjeWNsZSBjb3VudAo+ICAg
IGFuZCByY2Nfd3JhcCBpcyBhIHBvaW50IGF0IHdoaWNoIHRoZSB0aGUgdG90YWwgY3ljbGUgY291
bnQgaXMgd3JhcHBlZAo+IGZyb20gMHhmZmZmZmZmZmYgdG8gMHg3ZmZmZmZmZiAuCj4gICAgQXQg
dGhhdCBwb2ludCB0aGUgcmNjX3dyYXAgcmVzZXRzIHRvIHJjY193cmFwLzIuCj4KPiAgICAgSGVy
ZSBpcyBob3cgY291bnRzIHdyYXAgYXJvdW5kLgo+Cj4gICAgY2NfcHJldiAgLi4uLi4uLi4uLi4u
MHhmZmZmZmZmZiAgICAtPiAweDdmZmZmZmZmIC4uLi4uLi4uLi4uLi4uLi4gY2MKPiAgICByY2Nf
cHJldiAuLi4uLi4uLi4uLi5yY2Nfd3JhcCAtPiAgcmNjX3dyYXAvMiAuLi4uLi4uLi4uLiByY2Mu
Cj4KPiAgICBUaGUgcmlnaHQgbWF0aCB0byBjYWxjdWxhdGUgcmNjX2RlbHRhIHdvdWxkIGJlICAo
cmNjX3dyYXAgLSByY2NfcHJldikgKwo+IChyY2MgLSByY2Nfd3JhcC8yKS4KPiAgICBUbyBkbyB0
aGUgbWF0aCwgIHdlIG5lZWQgdGhlIHJjY193cmFwIHdoaWNoIHdlIGRvIG5vdCBoYXZlLgo+ICAg
IHRoZSBwYXRjaCBzZWVtcyB0byBzaW1wbHkgZG8gIDIqcmNjIC0gcmNjX3ByZXYgLiBVbmxlc3Mg
SSBhbSBtaXNzaW5nCj4gc29tZXRoaW5nLAo+ICAgIHRoaXMgZG9lcyBub3Qgc2VlbSByaWdodCB0
byBtZS4KCkFoLCB5b3UncmUgcmlnaHQuIEkgZ3Vlc3MgSSdsbCBuZWVkIHRvIGRpc2NhcmQgdGhl
IGRhdGEgbGlrZSB5b3UKb3JpZ2luYWxseSBkaWQgdXBvbiB3cmFwYXJvdW5kIGRldGVjdGlvbi4K
CgpNaWNoYcWCCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
