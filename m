Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-we0-x236.google.com ([2a00:1450:400c:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XJcqH-0003VS-Oi
 for ath10k@lists.infradead.org; Tue, 19 Aug 2014 06:24:26 +0000
Received: by mail-we0-f182.google.com with SMTP id k48so5981745wev.13
 for <ath10k@lists.infradead.org>; Mon, 18 Aug 2014 23:24:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87wqa5au7q.fsf@kamboji.qca.qualcomm.com>
References: <CAHqTa-0GxKjo2ObRtoAKu6H9J6upC7JNS44MpNQpFDPXpiEKJw@mail.gmail.com>
 <8761hpc9j9.fsf@kamboji.qca.qualcomm.com>
 <CAHqTa-1ZWg38dkT1N0fm3JkLL1kVc_pP1dsuCuorZxXm8z6M7Q@mail.gmail.com>
 <87wqa5au7q.fsf@kamboji.qca.qualcomm.com>
Date: Tue, 19 Aug 2014 08:24:03 +0200
Message-ID: <CA+BoTQ=Qcrrutt6ZUtbrgKzx0Mo9186SRuV7dc97FnOxwn3Jxg@mail.gmail.com>
Subject: Re: Support for scan while in AP mode, and offchannel while in AP mode
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
Cc: ath10k <ath10k@lists.infradead.org>, Avery Pennarun <apenwarr@gmail.com>

T24gMTkgQXVndXN0IDIwMTQgMDg6MDcsIEthbGxlIFZhbG8gPGt2YWxvQHFjYS5xdWFsY29tbS5j
b20+IHdyb3RlOgo+IEF2ZXJ5IFBlbm5hcnVuIDxhcGVud2FyckBnbWFpbC5jb20+IHdyaXRlczoK
Pgo+Pj4+IEFyZSB0aGVyZSBhbnkgcGxhbnMgdG8gaW1wbGVtZW50IHRoaXMgZmVhdHVyZT8gIEl0
J3MgaW1wb3J0YW50IGluCj4+Pj4gb3JkZXIgdG8gaW1wbGVtZW50IGF1dG9tYXRpYyBjaGFubmVs
IGNoYW5nZSBpbiBjYXNlIG9mIGNoYW5nZXMgaW4gdGhlCj4+Pj4gaW50ZXJmZXJlbmNlIGVudmly
b25tZW50Lgo+Pj4KPj4+IE5vIHBsYW5zIGF0IHRoZSBtb21lbnQuIERvZXMgYW55b25lIGtub3cg
aG93IG11Y2ggd29yayB3b3VsZCBpdCBiZSB0bwo+Pj4gY2hhbmdlIG1hYzgwMjExIHRvIHN1cHBv
cnQgdGhpcyB3aXRoIGh3X3NjYW4/Cj4+Cj4+IElzIHRoZXJlIGFueSBwYXJ0aWN1bGFyIHJlYXNv
biBpdCBjYW4ndCBqdXN0IHJlc29ydCB0byBhIHN3X3NjYW4gZm9yCj4+IHRoaXMgdXNlIGNhc2U/
ICBXaGF0J3MgdGhlIGJlbmVmaXQgb2YgaHdfc2Nhbj8gIEknbSBzdXJwcmlzZWQgdGhlcmUKPj4g
d291bGQgYmUgYW55IHBhcnRpY3VsYXIgQ1BVIHRpbWUgdGFrZW4gZm9yIHN1Y2ggYSB0aGluZy4K
Pgo+IEZvciBtb2JpbGUgZGV2aWNlcyBod19zY2FuIGlzIGltcG9ydGFudCBiZWNhdXNlIHRoZSBh
YmlsaXR5IHRvIGFsbG93IHRoZQo+IGhvc3QgQ1BVIHRvIHNsZWVwIHdoaWxlIHNjYW5uaW5nLiBG
b3Igb3RoZXJzIEknbSBub3QgdGhhdCBzdXJlLCBtYXliZQo+IGZpcm13YXJlIGNhbiBkbyB0aW1p
bmcgYmV0dGVyIChsZXNzIGludHJ1c2l2ZSkgdGhhbiBob3N0IGJhc2VkIHN3Cj4gc2Nhbm5pbmc/
Cgpzd19zY2FuIHJlcXVpcmVzIGEgZHJpdmVyIHRvIGJlIGFibGUgdG8gImp1c3QgY2hhbmdlIHRo
ZSBjaGFubmVsIi4KU29tZSBkZXZpY2UgZmlybXdhcmVzIGhhdmUgbm8gZGlyZWN0IGNvbnRyb2wg
b3ZlciBwcm9ncmFtbWVkIGh3CmNoYW5uZWwuIEluc3RlYWQgdGhleSBoYXZlIHN0YXJ0L2pvaW4v
Y29ubmVjdCBjb21tYW5kcyB0aGF0IGltcGxpY2l0bHkKc2V0dXAgaHcgY2hhbm5lbC4gYXRoMTBr
IGlzIGFjdHVhbGx5IGxpa2UgdGhhdCwgaXNuJ3QgaXQgKHZkZXYgc3RhcnQpPwoKCk1pY2hhxYIK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBt
YWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
