Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp-out06.msg.oleane.net ([62.161.7.4])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xdhc3-00015E-9C
 for ath10k@lists.infradead.org; Mon, 13 Oct 2014 15:32:44 +0000
Received: from smtp26.msg.oleane.net (smtp26.mail.priv [172.17.20.148]) 
 by smtp-out06.msg.oleane.net with ESMTP id s9D9flbg030688
 for <ath10k@lists.infradead.org>; Mon, 13 Oct 2014 11:41:47 +0200
From: "voncken" <cedric.voncken@acksys.fr>
References: <773DB8A82AB6A046AE0195C68612A319018C2750@sbs2003.acksys.local>	<CA+BoTQ=a8kY0CGGKHwRhk4cg=V0oimipuht6Pkc0K0x4WMMn-A@mail.gmail.com>	<023801cfe6b8$350c1930$9f244b90$@acksys.fr>
 <CA+BoTQkXc-VL1ixRK5KWUiE0igCxXRQyyde86TAvuKVxZhEPdg@mail.gmail.com>
In-Reply-To: <CA+BoTQkXc-VL1ixRK5KWUiE0igCxXRQyyde86TAvuKVxZhEPdg@mail.gmail.com>
Subject: RE: ath10k firmware crash
Date: Mon, 13 Oct 2014 11:20:07 +0200
Message-ID: <024901cfe6c6$e1905780$a4b10680$@acksys.fr>
MIME-Version: 1.0
Content-Language: fr
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
To: 'Michal Kazior' <michal.kazior@tieto.com>
Cc: 'linux-wireless' <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org

Cgo+IC0tLS0tTWVzc2FnZSBkJ29yaWdpbmUtLS0tLQo+IERlIDogTWljaGFsIEthemlvciBbbWFp
bHRvOm1pY2hhbC5rYXppb3JAdGlldG8uY29tXQo+IEVudm95w6kgOiBsdW5kaSAxMyBvY3RvYnJl
IDIwMTQgMDk6NTQKPiDDgCA6IHZvbmNrZW4KPiBDYyA6IGF0aDEwa0BsaXN0cy5pbmZyYWRlYWQu
b3JnOyBsaW51eC13aXJlbGVzcwo+IE9iamV0IDogUmU6IGF0aDEwayBmaXJtd2FyZSBjcmFzaAo+
IAo+IE9uIDEzIE9jdG9iZXIgMjAxNCAwOTozNSwgdm9uY2tlbiA8Y2VkcmljLnZvbmNrZW5AYWNr
c3lzLmZyPiB3cm90ZToKPiA+ICAgICAgICAgVGhhbmtzIGZvciB5b3VyIHJlcGx5LAo+ID4KPiA+
Pgo+ID4+IENhbiB5b3UgdGhlbiBwcm92aWRlIGEgY3Jhc2ggcmVnaXN0ZXIgZHVtcCBmb3IgMTAu
MSwgcGxlYXNlPyBJIGNhbid0Cj4gPj4gaGVscCB5b3UgbXVjaCB3aXRoIHRoZSA2MzYgZHVtcC4K
PiA+Pgo+ID4gWWVzIEkgY2FuLCBidXQgd2hlcmUgSSBmaW5kIGl0Pwo+IAo+IGh0dHBzOi8vZ2l0
aHViLmNvbS9rdmFsby9hdGgxMGstZmlybXdhcmUvYmxvYi9tYXN0ZXIvMTAuMS9maXJtd2FyZS0K
PiAyLmJpbl8xMC4xLjQ2Ny4yLTEKPiAKPiAKPiA+PiBBcmUgeW91IHBlcmhhcHMgdHJ5aW5nIHRv
IHJ1biBTVEEgd2l0aCA0YWRkciBicmlkZ2luZz8gSWYgc28gdGhlbgo+ID4+IG1ha2Ugc3VyZSB5
b3UgdXNlIHJlY2VudCBhdGgxMGsgYXMgdGhpcyB3YXMga25vd24gdG8gYmUgYSBwcm9ibGVtLgo+
ID4+Cj4gPiBZZXMgSSdtIHRlc3Rpbmcgd2l0aCA0IGFkZHIgYnJpZGdpbmcgYmVjYXVzZSBJIG5l
ZWQgdG8gYnJpZGdlIHRoaXMKPiBpbnRlcmZhY2UuIEknIGxsIHRyeSB3aXRob3V0IHRoaXMgb3B0
aW9uLgo+ID4gSSdtIHRlc3Rpbmcgd2l0aCBjb21taXQgbnVtYmVyIDM4ZWVkYTNhZTZmOTBmZGU1
NTQ2YmRkNDhlZTRmZjMwOTBmMjM4YzAKPiBmcm9tIGtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9r
ZXJuZWwvZ2l0L2Zpcm1hcmUvbGludXgtZmlybXdhcmUuIEl0IGlzIHRoZQo+IGxhdGVzdCB2ZXJz
aW9uIGluIG9wZW53cnQuCj4gPgo+ID4+IENhbiB5b3UgYWxzbyBwcm92aWRlIGF0aDEwayB0cmFj
ZXMgb3IgZGVidWcgbG9ncywgcGxlYXNlPwo+ID4+Cj4gPiBJJ2xsIHNlbmQgYSB0cmFjZS4KPiAK
SSdtIHVzaW5nIHRoZSBjb21wYXQgd2lyZWxlc3MgZnJvbSBPcGVud3J0LgoJQ29tcGF0IHdpcmVs
ZXNzIHZlcnNpb24gMjAxNC0wNS0yMiwgYnV0IHdlIHVwZGF0ZWQgdGhlIGZpcm13YXJlIHdpdGgg
dGhlIGxhdGVzdCB2ZXJzaW9uIHByb3ZpZGVkIGJ5IG9wZW53cnQgKGNvbW1pdCBudW1iZXIgMzhl
ZWRhM2FlNmY5MGZkZTU1NDZiZGQ0OGVlNGZmMzA5MGYyMzhjMCBmcm9tIGtlcm5lbC5vcmcvcHVi
L3NjbS9saW51eC9rZXJuZWwvZ2l0L2Zpcm1hcmUvbGludXgtZmlybXdhcmUpCgo+IFRoYW5rcy4K
PiAKPiBCeSB0aGUgd2F5LCB3aGF0IGtlcm5lbC9jb21wYXQtd2lyZWxlc3MgYXJlIHlvdSB1c2lu
Zz8gSSdtIHN1c3BlY3RpbmcgeW91cgo+IGJ1aWxkIG1pZ2h0IGJlIG1pc3NpbmcgdGhlIGZpeCBm
b3IgU1RBIGJyaWRnaW5nLgpUaGFua3MuCgo+IAo+IAo+IE1pY2hhxYIKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0
aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vYXRoMTBrCg==
