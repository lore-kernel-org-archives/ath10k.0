Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from omr2.cc.ipv6.vt.edu ([2607:b400:92:8400:0:33:fb76:806e]
 helo=omr2.cc.vt.edu)
 by casper.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bAZmy-0000aY-1L
 for ath10k@lists.infradead.org; Wed, 08 Jun 2016 09:28:41 +0000
Received: from mr4.cc.vt.edu (mr4.cc.ipv6.vt.edu
 [IPv6:2001:468:c80:2105:0:232:8670:19fe])
 by omr2.cc.vt.edu (8.14.4/8.14.4) with ESMTP id u589SAXg023992
 for <ath10k@lists.infradead.org>; Wed, 8 Jun 2016 05:28:10 -0400
Received: from mail-lb0-f199.google.com (mail-lb0-f199.google.com
 [209.85.217.199])
 by mr4.cc.vt.edu (8.14.4/8.14.4) with ESMTP id u589S5DW023269
 for <ath10k@lists.infradead.org>; Wed, 8 Jun 2016 05:28:10 -0400
Received: by mail-lb0-f199.google.com with SMTP id na2so1224734lbb.1
 for <ath10k@lists.infradead.org>; Wed, 08 Jun 2016 02:28:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+BoTQnF-WgxhBDm=t0QvHTSqsf1Y5mUTwKTu+Wso-hkM+3=xA@mail.gmail.com>
References: <CAFc9h7synwZ1mt0PyRNN1Q6DOwtbL2im=PnxXhtrvZAFa2Yjcg@mail.gmail.com>
 <CA+BoTQnF-WgxhBDm=t0QvHTSqsf1Y5mUTwKTu+Wso-hkM+3=xA@mail.gmail.com>
From: Gaurang Ramesh Naik <gaurang@vt.edu>
Date: Wed, 8 Jun 2016 05:28:03 -0400
Message-ID: <CAFc9h7v=WH7+irh8=vTN4qQBXRfy4uj=PYs4iboE4piwufbPZQ@mail.gmail.com>
Subject: Re: Number of Transmission retries
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
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

SGkgTWljaGFsLAoKVGhhdCBkb2VzIGhlbHAuIFRoYW5rIHlvdSBzbyBtdWNoLgoKR04uCgpPbiBX
ZWQsIEp1biA4LCAyMDE2IGF0IDU6MTQgQU0sIE1pY2hhbCBLYXppb3IgPG1pY2hhbC5rYXppb3JA
dGlldG8uY29tPiB3cm90ZToKPiBPbiA4IEp1bmUgMjAxNiBhdCAxMTowMSwgR2F1cmFuZyBSYW1l
c2ggTmFpayA8Z2F1cmFuZ0B2dC5lZHU+IHdyb3RlOgo+PiBIaSwKPj4KPj4gSSBrbm93IHRoZXJl
IGlzIGFuIGl3IGNvbW1hbmQgdG8gc2V0IHRoZSBudW1iZXIgb2YgdHJhbnNtaXNzaW9uCj4+IHJl
dHJpZXMgdXNpbmcgIml3IHBoeSBwaHl4IHNldCByZXRyeSBzaG9ydCAneScgbG9uZyAneiciLiBX
aGVuIEkgdXNlZAo+PiB0aGlzIGNvbW1hbmQgdGhvdWdoLCBJIGRpZCBub3Qgb2JzZXJ2ZSBhbnkg
Y2hhbmdlIGluIHRoZSBwZXJmb3JtYW5jZQo+PiBvZiB0aGUgbGluayB0aHJvdWdocHV0LiBEb2Vz
IGF0aDEwayBob25vciB0aGlzIGNvbW1hbmQ/IEFsc28sIGlmIGl0Cj4+IGRvZXMsIGlzIGl0IGlt
cGxlbWVudGVkIGluIHRoZSBmaXJtd2FyZSwgb3Igb3Blbi1zb3VyY2U/Cj4KPiBhdGgxMGsgZG9l
cyBub3QgaG9ub3VyIGl0Lgo+Cj4gQXMgZmFyIGFzIEkgdW5kZXJzdGFuZCB5b3Ugd2FudCB0byBh
bHRlciBudW1iZXIgb2YgcmV0cmllcyB3aXRoIHJlZ2FyZAo+IHRvIFJUUy9DVFMgYmVpbmcgdXNl
ZCBvciBub3QuIElmIHNvIEknbSBub3QgYXdhcmUgb2YgYW55IG1lY2hhbmlzbSB0bwo+IHRlbGwg
dGhhdCB0byBmaXJtd2FyZSAodGhpcyBpcyByYXRlLWNvbnRyb2wgcmVsYXRlZCBhbmQgcmF0ZS1j
b250cm9sCj4gaXMgb2ZmbG9hZGVkIGJ5IGZpcm13YXJlIGVudGlyZWx5KS4KPgo+IFRvIG15IGtu
b3dsZWRnZSB3aGF0IHlvdSBjYW4gZG8gaXMgY2hhbmdlIG51bWJlciBvZiBzb2Z0d2FyZSByZXRy
aWVzCj4gZm9yIGFnZ3JlZ2F0ZWQgYW5kIG5vbi1hZ2dyZWdhdGVkIHRyYWZmaWMgdmlhIE5PTl9B
R0dfU1dfUkVUUllfVEggYW5kCj4gQUdHX1NXX1JFVFJZX1RIIFdNSSdzIHBkZXYgcGFyYW1ldGVy
cy4gUGVyaGFwcyB5b3UnbGwgZmluZCB0aGlzCj4gdXNlZnVsLgo+Cj4KPiBNaWNoYcWCCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGlu
ZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
