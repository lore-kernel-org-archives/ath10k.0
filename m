Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x230.google.com ([2a00:1450:400c:c05::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XWgPr-0004hv-8u
 for ath10k@lists.infradead.org; Wed, 24 Sep 2014 06:51:08 +0000
Received: by mail-wi0-f176.google.com with SMTP id fb4so6252707wid.3
 for <ath10k@lists.infradead.org>; Tue, 23 Sep 2014 23:50:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5421818A.9040501@candelatech.com>
References: <1411151304-31544-1-git-send-email-greearb@candelatech.com>
 <CA+BoTQm1rZO+yBbYxihpgEvR1cGZWS4Pr0AP+KMODcG4jpd_jQ@mail.gmail.com>
 <5421818A.9040501@candelatech.com>
Date: Wed, 24 Sep 2014 08:50:38 +0200
Message-ID: <CA+BoTQkZaGSkC9mhE8UF0He0RZWmPghDukdE1A5qiO1UNAZj5Q@mail.gmail.com>
Subject: Re: [PATCH] ath10k: request firmware flush in ath10k_flush.
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
To: Ben Greear <greearb@candelatech.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMjMgU2VwdGVtYmVyIDIwMTQgMTY6MTksIEJlbiBHcmVlYXIgPGdyZWVhcmJAY2FuZGVsYXRl
Y2guY29tPiB3cm90ZToKPiBPbiAwOS8yMy8yMDE0IDAyOjE2IEFNLCBNaWNoYWwgS2F6aW9yIHdy
b3RlOgo+PiBPbiAxOSBTZXB0ZW1iZXIgMjAxNCAyMDoyOCwgIDxncmVlYXJiQGNhbmRlbGF0ZWNo
LmNvbT4gd3JvdGU6Cj4+IFsuLi5dCj4+Pgo+Pj4gKyAgICAgICAvKiBJZiB3ZSBhcmUgQ1QgZmly
bXdhcmUsIGFzayBpdCB0byBmbHVzaCBhbGwgdGlkcyBvbiBhbGwgcGVlcnMKPj4+IG9uCj4+PiAr
ICAgICAgICAqIGFsbCB2ZGV2cy4gIE5vcm1hbCBmaXJtd2FyZSB3aWxsIGp1c3QgY3Jhc2ggaWYg
eW91IGRvIHRoaXMuCj4+PiArICAgICAgICAqLwo+Pj4gKyAgICAgICBpZiAodGVzdF9iaXQoQVRI
MTBLX0ZXX0ZFQVRVUkVfV01JXzEwWF9DVCwgYXItPmZ3X2ZlYXR1cmVzKSkKPj4+ICsgICAgICAg
ICAgICAgICBhdGgxMGtfd21pX3BlZXJfZmx1c2goYXIsIDB4RkZGRkZGRkYsIHBlZXJfYWRkciwK
Pj4+IDB4RkZGRkZGRkYpOwo+Pgo+PiBJIHJlY2FsbCB5b3UndmUgZXhwbGFpbmVkIHRoaXMgc29t
ZSB0aW1lIGFnbywgYnV0IGNhbiB5b3UgcmVmcmVzaCBteQo+PiBtZW1vcnksIHBsZWFzZT8gSXMg
dGhpcyBhbnkgZGlmZmVyZW50IGZyb20gaXRlcmF0aW5nIG92ZXIgYWxsIHBlZXJzCj4+IGFuZCBm
bHVzaGluZyBlYWNoPyBPciBkb2VzIHlvdXIgZmlybXdhcmUgZG8gc28gZXh0cmEgbWFnaWMgdGhh
dCBpcwo+PiBpbXBvc3NpYmxlIHRvIGRvIHdpdGggbm9ybWFsIGZpcm13YXJlIGNvbW1hbmRzPwo+
Cj4gTXkgZmlybXdhcmUgZG9lcyB0aGF0IGl0ZXJhdGlvbiBpbnRlcm5hbGx5Lgo+Cj4gWW91IGNv
dWxkIHByb2JhYmx5IGRvIHRoYXQgaW4gdGhlIGRyaXZlciwgYnV0IGl0IHdvdWxkIGJlIGEgbG90
Cj4gb2YgbWVzc2FnZXMgKGZvciBhbGwgdmRldnMsIGFsbCBwZWVycywgYWxsIHRpZHMpLi4uCj4g
SSB3YXMgbm90IHN1cmUgaWYgdGhlcmUgd2VyZSBsaW1pdHMgdG8gdGhlIG51bWJlcgo+IG9mIGNv
bW1hbmRzIHlvdSBzaG91bGQgYXR0ZW1wdCBkdXJpbmcgdGhlIGZsdXNoLi4uCgpUaGFua3MuIEkg
dGhpbmsgYXRoMTBrIHNob3VsZCBkbyB0aGlzIGluc3RlYWQgb2YgaGF2aW5nIENULXNwZWNpZmlj
CmZsdXNoIGV2ZW50dWFsbHkuCgpJIHJlY2FsbCBJIGFjdHVhbGx5IGRpZCBwZXItcGVlciBmbHVz
aGluZyBpbiBSRkMgcGF0Y2hlcyBhIGxvbmcgdGltZQphZ28gYnV0IEkgZGlkbid0IHB1cnN1ZSBn
ZXR0aW5nIHRoZW0gbWVyZ2VkLiBJIHRoaW5rIERlbnRvbiB1c2VzIHRoZXNlCnBhdGNoZXMgaW4g
aGlzIHNldHVwLiBUaGV5IGRvbid0IGZsdXNoIHZkZXYgc2VsZi1wZWVycyB0aG91Z2ggKGRvIHlv
dQpkbyB0aGF0IGludGVybmFsbHk/KS4KCgpNaWNoYcWCCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vYXRoMTBrCg==
