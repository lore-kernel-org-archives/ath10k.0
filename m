Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x231.google.com ([2a00:1450:400c:c05::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X7L11-0006Ma-UZ
 for ath10k@lists.infradead.org; Wed, 16 Jul 2014 08:56:44 +0000
Received: by mail-wi0-f177.google.com with SMTP id ho1so898396wib.4
 for <ath10k@lists.infradead.org>; Wed, 16 Jul 2014 01:56:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <201407161038.10130.sw@simonwunderlich.de>
References: <1405441966-32681-1-git-send-email-sw@simonwunderlich.de>
 <CA+BoTQmNJuwYpSiXqF8OUuXQULLSdUW+PO4Sz5oNKyaduHMKPg@mail.gmail.com>
 <4111404.UJkIUxkzQm@bentobox>
 <201407161038.10130.sw@simonwunderlich.de>
Date: Wed, 16 Jul 2014 10:56:16 +0200
Message-ID: <CA+BoTQm_pbtiT+ujRypZ6DuoqfFkYM-OfzvtaC+q9qurnMwpaA@mail.gmail.com>
Subject: Re: [RFC 0/2] ath10k spectral scan support
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
To: Simon Wunderlich <sw@simonwunderlich.de>
Cc: Mathias Kretschmer <mathias.kretschmer@fokus.fraunhofer.de>, "Giori,
 Kathy" <kgiori@qca.qualcomm.com>, linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Sven Eckelmann <sven@narfation.org>

T24gMTYgSnVseSAyMDE0IDEwOjM4LCBTaW1vbiBXdW5kZXJsaWNoIDxzd0BzaW1vbnd1bmRlcmxp
Y2guZGU+IHdyb3RlOgo+Cj4+IE9uIFdlZG5lc2RheSAxNiBKdWx5IDIwMTQgMDg6MjQ6NTggTWlj
aGFsIEthemlvciB3cm90ZToKPj4gPiA+ICAqIFNvIGZhciwgd2UgYWx3YXlzIGdldCA2NCBiaW5z
IG9mIGZmdCBkYXRhIGluIHRoZSBzYW1wbGVzLCBldmVuIGlmIHdlCj4+ID4gPgo+PiA+ID4gICAg
YXJlIGluIEhUNDAgb3IgVkhUODAgbW9kZS4gVGhhdCBkb2Vzbid0IHNlZW0gcmlnaHQsIGFzIHRo
ZXJlIHNob3VsZAo+PiA+ID4gICAgYmUgbW9yZSBiaW5zIGZvciB3aWRlciBjaGFubmVscyAoZS5n
LiAxMjggb3IgMjU2IGJpbnMpLiBJcyB0aGVyZSBhbnkKPj4gPiA+ICAgIHBhcmFtZXRlciB0byBj
aGFuZ2UgaW4gdGhlIGNvbmZpZ3VyYXRpb24gdG8gZ2V0IHRoZSBvdXRwdXQgZnJvbQo+PiA+ID4g
ICAgbXVsdGlwbGUgY2hhbm5lbHMgLyBoaWdoZXIgYmFuZHdpZHRoPwo+PiA+Cj4+ID4gSG1tLi4g
SSBzdXNwZWN0IHRoaXMgbWF5IGJlIGJlY2F1c2UgeW91IHVzZSBzY2FuIGNvbW1hbmQuIFNjYW5u
aW5nCj4+ID4gdXNlcyBjaGFubmVsIGxpc3Qgd2hpY2ggaXMgcHJvZ3JhbW1lZCB3aXRoIGxlZ2Fj
eSBtb2RlcyBhIGFuZCBnCj4+ID4gKGltcGx5aW5nIDIwTWh6KS4gUGVyaGFwcyB0aGF0J3MgdGhl
IGxpbWl0aW5nIGZhY3RvciBub3cuIFVzaW5nIG90aGVyCj4+ID4gKHdpZGVyKSBtb2RlcyBicmVh
a3Mgc2NhbiBmcm9tIHdoYXQgSSByZW1lbWJlciBidXQgaXQgbWlnaHQgYmUgd29ydGgKPj4gPiBj
aGVja2luZyBvdXQgaWYgaXQgaW1wYWN0cyBmZnQgYmluIHNpemVzLgo+Pgo+PiBJIGRpZCB0aGUg
SFQ4MCBhbmQgSFQ0MCBzdHVmZiBvbiBhIHNpbmdsZSBjaGFubmVsIGluIHRoZSBzcGVjdHJhbAo+
PiAiYmFja2dyb3VuZCIgbW9kZS4gVGhleSByZXBvcnRzIGZyb20gdGhlIGZpcm13YXJlICgxMC4x
KSBzdGlsbCBvbmx5IGhhZCA2NAo+PiBiaW5zLiBUaGUgSFQ4MCBzdHVmZiB3YXNuJ3QgdGVzdGVk
IHdpdGggdGhlICJtYWluIiBmaXJtd2FyZSBiZWNhdXNlIGl0Cj4+IHJlZnVzZWQgdG8gc3dpdGNo
IHRvIEhUODAgbW9kZSBhcyBBUC9TdGEuCj4KPiBKdXN0IHRvIGNsYXJpZnkgdGhpcyBhIGxpdHRs
ZSBtb3JlLCB3ZSB0cmllZCBBUCAocnVubmluZyBob3N0YXBkKSBhcyB3ZWxsIGEKPiBTVEEgaW4g
NDAgYW5kIDgwIE1IeiBtb2Rlcy4gV2UgYWx3YXlzIGdvdCA2NCBiaW5zIHJldHVybmVkLgoKSXQg
c2VlbXMgdGhlIG51bWJlciBvZiBiaW5zIGlzIDJeIChmZnRfc2l6ZSAtIGJpbl9zY2FsZSkgPSAy
Xig3LTEpID0KNjQuIENoYW5naW5nIGZmdF9zaXplIHRvIDkgeWllbGRzIDI1NiBiaW5zLgoKUGVy
aGFwcyBmZnQgcmVwb3J0cyBhcmUgKGltcGxpY2l0bHkpIHJlbGF0aXZlIHRvIHRoZSBtb2RlIHRo
ZSBodyBpcyBpbgphdCBhIGdpdmVuIHRpbWUgYW5kIGlmIHlvdSB3YW50IGEgcmVhc29uYWJsZSBi
aW4gcmVzb2x1dGlvbiBmb3IsIGUuZy4KVkhUODAgeW91IG5lZWQgdG8gaW5jcmVhc2UgZmZ0X3Np
emU/CgoKTWljaGHFggoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
