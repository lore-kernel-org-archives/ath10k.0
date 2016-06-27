Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x236.google.com ([2a00:1450:400c:c09::236])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bHVB4-0006eX-Hq
 for ath10k@lists.infradead.org; Mon, 27 Jun 2016 11:58:11 +0000
Received: by mail-wm0-x236.google.com with SMTP id r201so111685031wme.1
 for <ath10k@lists.infradead.org>; Mon, 27 Jun 2016 04:57:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAFc9h7vWsEyU7V4X0ehzjsmgw=a_hym0SVrF4Gay=5jJTL2VFA@mail.gmail.com>
References: <CAFc9h7vWsEyU7V4X0ehzjsmgw=a_hym0SVrF4Gay=5jJTL2VFA@mail.gmail.com>
From: Michal Kazior <michal.kazior@tieto.com>
Date: Mon, 27 Jun 2016 13:57:48 +0200
Message-ID: <CA+BoTQ=-x_xApaiYcYF6FeoVcboc+BV61gA2JfOSdA9SitcuUw@mail.gmail.com>
Subject: Re: Set the primary channel in HT40 mode
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
To: Gaurang Ramesh Naik <gaurang@vt.edu>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMjcgSnVuZSAyMDE2IGF0IDEwOjU4LCBHYXVyYW5nIFJhbWVzaCBOYWlrIDxnYXVyYW5nQHZ0
LmVkdT4gd3JvdGU6Cj4gSGkgQWxsLAo+Cj4gSSBoYXZlIHNvbWUgZGlmZmljdWx0eSBpbiB1bmRl
cnN0YW5kaW5nIGhvdyBIVDQwLCBIVDQwLSBhbmQgSFQ0MCsKPiBtb2RlcyB3b3JrLiBNeSBvYmpl
Y3RpdmUgaXMgdG8gc2V0IGEgcGFydGljdWxhciAyMCBNSHogY2hhbm5lbCBhcyB0aGUKPiBwcmlt
YXJ5IGNoYW5uZWwgd2hlbiBjaGFubmVsIGJvbmRpbmcgaXMgZW5hYmxlZC4gRnJvbSB3aGF0IEkK
PiB1bmRlcnN0YW5kLCBIVDQwLSBtZWFucyBzZWNvbmRhcnkgY2hhbm5lbCBpcyBiZWxvdyB0aGUg
cHJpbWFyeSwgd2hpbGUKPiBIVDQwKyBtZWFucyBzZWNvbmRhcnkgY2hhbm5lbCBpcyBhYm92ZSB0
aGUgcHJpbWFyeSBjaGFubmVsLiBJIGFtCj4gcGFydGljdWxhcmx5IGRlYWxpbmcgd2l0aCBjaGFu
bmVscyAxNDksIDE1MywgMTU3IGFuZCAxNjEuCgpodHRwOi8vc2VjdXJpdHl1bmNvcmtlZC5jb20v
d29yZHByZXNzL3dwLWNvbnRlbnQvdXBsb2Fkcy8yMDEzLzExL2dyYXBoaWMtODAyMTEtYWNDaGFu
bmVscy1hbGwucG5nCgoKPiBXaGVuIEkgc2V0IHRoZSBjaGFubmVsIHRvIHNheSAxNTcsIHdoZXRo
ZXIgSSB1c2UgSFQ0MCsgb3IgSFQ0MC0sIHRoZQo+IHByaW1hcnkgY2hhbm5lbCBpcyBhbHdheXMg
c2V0IHRvIGNoYW5uZWwgMTYxLiBJIGFtIGluZmVycmluZyB0aGlzCj4gYmVjYXVzZSB3aGVuIEkg
c2NhbiB1c2luZyBpd2xpc3Qgc2NhbiwgbXkgU1NJRCBzaG93cyBvbiBDaGFubmVsIDE2MS4KPiBE
b2VzIGF0aDEwayBub3Qgc2V0IHRoZSBwcmltYXJ5IGFuZCBzZWNvbmRhcnkgY2hhbm5lbCBpbiB0
aGlzIG1hbm5lcj8KCmF0aDEwayBkb2Vzbid0IGNhcmUuIGhvc3RhcGQgY2FuIGRvIGEgY2hhbm5l
bCBzd2FwIGlmIGl0IGRldGVjdHMgT0JTUy4KTm90IHN1cmUgaG93IG11Y2ggT3BlbldSVCBzY3Jp
cHRzIG1pbmdsZSBpbiAoSSdtIGd1ZXNzaW5nIHlvdSdyZSB1c2luZwpgdWNpYCwgaGVuY2UgdGhl
IG1lbnRpb24pLgoKCj4gSWYgbm90LCBpcyB0aGVyZSBhIG1lY2hhbmlzbSBieSB3aGljaCBJIGNh
biBleHBsaWNpdGx5IG1lbnRpb24gd2hpY2gKPiBjaGFubmVsIG11c3QgYmUgcHJpbWFyeSwgYW5k
IHdoaWNoIG11c3QgYmUgc2Vjb25kYXJ5PwoKWW91IGNhbid0LiBPQlNTIGNhbiBzdGlsbCBlbmQg
dXAgc3dhcHBpbmcgeW91ciBwcmltYXJ5IGFuZCBleHRlbnNpb24gY2hhbm5lbHMuCgoKPiBBbHNv
LCBob3cgaXMgdGhlCj4gcHJpbWFyeSBjaGFubmVsIGRlY2lkZWQgZm9yIFZIVDgwIG1vZGU/CgpW
SFQ4MCBpcyBiYWNrd2FyZCBjb21wYXQgZm9yIEhUNDAgYW5kIEhUMjAgY2xpZW50cy4gU2VlIHRo
ZSBjaGFubmVsCmFsbG9jYXRpb24gbGluayBhYm92ZS4KCgpNaWNoYcWCCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0
aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vYXRoMTBrCg==
