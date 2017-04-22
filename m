Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vk0-x22b.google.com ([2607:f8b0:400c:c05::22b])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d1r6K-0004Vx-SO
 for ath10k@lists.infradead.org; Sat, 22 Apr 2017 09:13:10 +0000
Received: by mail-vk0-x22b.google.com with SMTP id q78so20726587vke.3
 for <ath10k@lists.infradead.org>; Sat, 22 Apr 2017 02:12:48 -0700 (PDT)
Subject: Re: [OpenWrt-Devel] [ath10k] [batman-adv] Robustness of batman-adv or
 IBSS/802.11s on ath9k (AR9331 chip)
References: <52905ff0-487f-f50f-797a-6f6f1740d1d4@gmail.com>
 <87fuh095zo.fsf@husum.klickitat.com>
From: Xuebing Wang <xbing6@gmail.com>
Message-ID: <49f858df-6cd0-1917-2209-d26bb5e4d6c5@gmail.com>
Date: Sat, 22 Apr 2017 17:12:42 +0800
MIME-Version: 1.0
In-Reply-To: <87fuh095zo.fsf@husum.klickitat.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Russell Senior <russell@personaltelco.net>
Cc: Sven Eckelmann <sven@narfation.org>, b.a.t.m.a.n@lists.open-mesh.org, openwrt-devel@lists.openwrt.org, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Simon Wunderlich <sw@simonwunderlich.de>

T24gMjAxN+W5tDA05pyIMjLml6UgMTY6NTUsIFJ1c3NlbGwgU2VuaW9yIHdyb3RlOgo+Pj4+Pj4g
Ilh1ZWJpbmciID09IFh1ZWJpbmcgV2FuZyA8eGJpbmc2QGdtYWlsLmNvbT4gd3JpdGVzOgo+IFh1
ZWJpbmc+IEhpIGF0aDEwayBjb21tdW5pdHksIERvZXMgYW55b25lIHVzZSBhdGg5ayBkcml2ZXIg
KyA4MDIuMTFzIChvcgo+IFh1ZWJpbmc+IElCU1MvYWRob2MpIG9uIGNvbW1lcmNpYWwgcHJvZHVj
dHM/Cj4KPiBYdWViaW5nPiBPdXIgc2V0dXAgaXMgQVI5MzMxICsgYXRoOWsgZHJpdmVyICsgT3Bl
bldSVCAxNS4wNSArIGJhdG1hbi1hZHYKPiBYdWViaW5nPiAyMDE2LjEgKFBLR19SRUxFQVNFOj0z
KQo+Cj4gWHVlYmluZz4gV2UgYXJlIHZlcnkgc2VyaW91cyBhYm91dCByb2J1c3RuZXNzIG9mIHJ1
bm5pbmcgYmF0bWFuLWFkdiBvbgo+IFh1ZWJpbmc+IEFSOTMzMSwgYmVjYXVzZSB3ZSBoYXZlIDIw
KyBjb21tZXJjaWFsIHNpdGVzIHJ1bm5pbmcsIGVhY2ggc2l0ZQo+IFh1ZWJpbmc+IGlzIHdpdGgg
YWJvdXQgMjAgbm9kZXMuICAtIGJhdG1hbi1hZHYgKyBhcjkzMzEgd29yayBhbG1vc3QKPiBYdWVi
aW5nPiAod2VsbCBhbG1vc3QpIHBlcmZlY3RseS4gIC0gU29tZXRpbWVzLCBvbmUgbm9kZSBkcm9w
cyBvZmYgdGhlCj4gWHVlYmluZz4gbWVzaCwgb2NjdXJyZW5jZSByYXRlIGlzIHZlcnkgbG93LiAg
LSBGb3Igb25lIHRpbWUsIHdoZW4gTm9kZQo+IFh1ZWJpbmc+IGRyb3BzIG9mZiB0aGUgbWVzaCwg
InJtbW9kIGF0aDlrIiB0aGVuICJtb2Rwcm9iZSBhdGg5ayIgY2FuIGdldAo+IFh1ZWJpbmc+IGJv
dGggYmF0bWFuLWFkdiAoYW5kIGlic3MvYWRob2Mgb24gdG9wIG9mIGF0aDlrKSByZWNvdmVyLiBU
aGlzCj4gWHVlYmluZz4gc2VlbWluZ2x5IHBvaW50cyB0byB0aGF0IHRoZSBpc3N1ZSBpcyB3aXRo
IGF0aDlrIGRyaXZlcgo+IFh1ZWJpbmc+IChpYnNzL2FkaG9jIG1vZGUpLgo+Cj4gSSdtIHJ1bm5p
bmcgYmF0bWFuLWFkdiBvbiBMRURFLXByb2plY3QgKHIxNDk3KSBvbiBhIFRQLUxpbmsgVFAtV0RS
MzYwMAo+IHdpdGggaWJzcy9hZGhvYyArIGFwIG9uIHRoZSAyLjRHSHogcmFkaW8uICBUaGlzIGlz
IGF0aDlrLCBub3QgYXRoMTBrLgo+IFNlZW1zIHRvIHdvcmsgZmluZSwgbm8gcHJvYmxlbXMuCkhp
IFJ1c3NlbCwKClRoYW5rcy4gQnkgIndvcmsgZmluZSIsIGRvIHlvdSBtZWFuIHRoYXQgeW91IGhh
dmUgMjArIG5vZGVzIHJ1bm5pbmcgZm9yIAphdCBsZWFzdCBhIG1vbnRoIHdpdGhvdXQgYW55IGlz
c3Vlcz8KClh1ZWJpbmcgV2FuZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
