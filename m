Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x22a.google.com ([2a00:1450:4010:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xovjf-0008Rv-5Z
 for ath10k@lists.infradead.org; Thu, 13 Nov 2014 14:50:59 +0000
Received: by mail-la0-f42.google.com with SMTP id gq15so13437699lab.15
 for <ath10k@lists.infradead.org>; Thu, 13 Nov 2014 06:50:36 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CABfbVPKvcAkwY2_qywhvewVwuk4sktMsmzwdek1kdhZKhefLzA@mail.gmail.com>
References: <CABfbVPKXg2HiVHuEy13s2_F=xw5nxyC7r0J229LsfRgGHySCMg@mail.gmail.com>
 <CA+BoTQnzBRj5rk66RD61sRc-9mcwJFaPiAdYqrjCqOXWULHaGQ@mail.gmail.com>
 <CABfbVPKvcAkwY2_qywhvewVwuk4sktMsmzwdek1kdhZKhefLzA@mail.gmail.com>
Date: Thu, 13 Nov 2014 09:50:36 -0500
Message-ID: <CABfbVP+jeJOG=pmpoOFhE=+mhgWWNJ7zY6xDUPYEL0OgnqYOHQ@mail.gmail.com>
Subject: Re: Ath10k leaves AR9880 in a state that will not enumerate again
 when CPU warm booted
From: David Dailey <daileycrew@gmail.com>
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
To: ath10k@lists.infradead.org

WWVzLCBJIGhhZCBubyBsdWNrIHdpdGggdGhhdC4KRGF2ZQoKPiBPbiBOb3YgMTMsIDIwMTQgMToz
NyBBTSwgIk1pY2hhbCBLYXppb3IiIDxtaWNoYWwua2F6aW9yQHRpZXRvLmNvbT4gd3JvdGU6Cj4+
Cj4+IE9uIDEyIE5vdmVtYmVyIDIwMTQgMjI6MzQsIERhdmlkIERhaWxleSA8ZGFpbGV5Y3Jld0Bn
bWFpbC5jb20+IHdyb3RlOgo+PiA+IEkgZGlzY292ZXJlZCB0aGF0IHRoaXMgaXNzdWUgc2VlbXMg
dG8gZm9sbG93IGF0IGxlYXN0IDIgZGlmZmVyZW50Cj4+ID4gY2hpcHNldHMgKEFSOTg4MCBhbmQg
QVI5ODkwKSBidXQgZG9lc24ndCBoYXBwZW4gd2l0aCBhdCBsZWFzdCB0d28gQkNNCj4+ID4gY2hp
cHNldHMuICBBbmQgdGhlIGVudW1lcmF0aW9uIGZhaWxpbmcgYWZ0ZXIgYSB3YXJtIGJvb3QgZG9l
c24ndAo+PiA+IGRlcGVuZCBvbiBhdGgxMGsgbG9hZGluZyBhdCBhbGwuICBFdmVuIHdpdGggdGhl
IG1vZHVsZSBub3QgcHJlc2VudCBvbgo+PiA+IHRoZSBzeXN0ZW0sIHRoZSBkZXZpY2UgZG9lc24n
dCBlbnVtZXJhdGUgYWZ0ZXIgY29sZCBib290LiAgU28gaXQKPj4gPiBhcHBlYXJzIHRoaXMgaXMg
c29tZXRoaW5nIHVuaXF1ZSB0byB0aGUgUENJZSBjb3JlIG9uIEF0aGVyb3MsIG5vdAo+PiA+IGF0
aDEway4gIEkgZ3Vlc3MgdGhlIG9ubHkgaG9wZSB3b3VsZCBiZSBpZiBzb21laG93IHRoZSB1bmxv
YWQgb2YgdGhlCj4+ID4gZHJpdmVyIGNvdWxkIHJlc3RvcmUgdGhlIGNoaXBzZXQgYmFjayB0byBh
IHN0YXRlIHdoZXJlIGl0IHdvdWxkCj4+ID4gZW51bWVyYXRlIGFnYWluLCBidXQgSSBkb24ndCBo
YXZlIGluZm9ybWF0aW9uIG9uIHRoZSBjaGlwc2V0IGF0IHRoYXQKPj4gPiBsZXZlbC4KPj4KPj4g
RGlkIHlvdSB0cnkgdG8gcmVzY2FuIHRoZSBwY2kgYnVzIGV4cGxpY2l0bHk/Cj4+Cj4+ICAgZWNo
byAxIHwgc3VkbyB0ZWUgL3N5cy9idXMvcGNpL3Jlc2Nhbgo+Pgo+Pgo+PiBNaWNoYcWCCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGlu
ZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
