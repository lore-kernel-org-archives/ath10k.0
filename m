Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x235.google.com ([2a00:1450:400c:c09::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bABpz-0000jq-VE
 for ath10k@lists.infradead.org; Tue, 07 Jun 2016 07:54:12 +0000
Received: by mail-wm0-x235.google.com with SMTP id n184so124144841wmn.1
 for <ath10k@lists.infradead.org>; Tue, 07 Jun 2016 00:53:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAJ-VmontFzXCqOhyEENTeWFnyeb0r=1d9jdX8SVRc9WeuX5vag@mail.gmail.com>
References: <CAOiRWuVxbGDoVtxahwRxyH9NaBB9LmaEBZ5bzgSPEf=Eu1g=ug@mail.gmail.com>
 <5755B0FF.9010900@candelatech.com>
 <CAOiRWuUFvZU1b4Pn8nDVs5O5sNK-g0PPbckriP=RmBnB5f-5Gw@mail.gmail.com>
 <5755B2D9.7080207@candelatech.com>
 <CAOiRWuUjugeDtRTQUWBzoCq58L8XfW7aYQTHa=Mnf4smx6AR2g@mail.gmail.com>
 <5755BABA.1030006@candelatech.com>
 <CAJ-VmomKzRAkJNQr2Sg=j57uPfptPiRs1Q026dPeuQv0jMx-Og@mail.gmail.com>
 <CAOiRWuUL9RC61pdieiEh3ZtWFGLomHzPxqbbVE3Oe_3043Zv2g@mail.gmail.com>
 <5755C7AF.6020203@candelatech.com>
 <CAOiRWuX4mwQEmY0pNvAvufHrfte_94JzyMw41i1SDMNHj=KtCQ@mail.gmail.com>
 <CALhHN=pkwmRJKq1_RQ+3dryu8XcgbhwR-9T288ugoSJAHKM5AA@mail.gmail.com>
 <CAJ-VmontFzXCqOhyEENTeWFnyeb0r=1d9jdX8SVRc9WeuX5vag@mail.gmail.com>
From: Michal Kazior <michal.kazior@tieto.com>
Date: Tue, 7 Jun 2016 09:53:48 +0200
Message-ID: <CA+BoTQn_jR26JJrnGS_1Ays1yjAUKTFrLsWnofuHGZQv9NTHMg@mail.gmail.com>
Subject: Re: Any tips on where per-packet antenna selection could be pushed?
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
To: Adrian Chadd <adrian.chadd@gmail.com>
Cc: Janusz Dziedzic <janusz.dziedzic@tieto.com>, Zach Sherin <zach@netblazr.com>, Ben Greear <greearb@candelatech.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gNyBKdW5lIDIwMTYgYXQgMDk6NDAsIEFkcmlhbiBDaGFkZCA8YWRyaWFuLmNoYWRkQGdtYWls
LmNvbT4gd3JvdGU6Cj4gT24gNiBKdW5lIDIwMTYgYXQgMjM6MjQsIEphbnVzeiBEemllZHppYyA8
amFudXN6LmR6aWVkemljQHRpZXRvLmNvbT4gd3JvdGU6Cj4+IE9uIDYgSnVuZSAyMDE2IGF0IDIx
OjIyLCBaYWNoIFNoZXJpbiA8emFjaEBuZXRibGF6ci5jb20+IHdyb3RlOgo+Pj4gVGhhdCdzIHdo
YXQgSSB0aG91Z2h0LiBUaGFua3MgZm9yIGNvbmZpcm1pbmcsIGFuZCB0aGFua3MgYWdhaW4gZm9y
Cj4+PiB5b3VyIHRpbWUgYW5kIGhlbHAhCj4+Pgo+PiBCVFcsIGNoZWNrIGdvb2dsZTogYXRoMTBr
IHNtYXJ0IGFudGVubmEKPj4gU2VlbXMgMTAuMiBzdXBwb3J0IHRoaXMuCj4KPgo+IG9vbyBjb29s
LiB3b25kZXIgaG93IG11Y2ggb2YgdGhlIHVzZWZ1bCBiaXRzIGl0IGltcGxlbWVudHMhCgpLZWVw
IGluIG1pbmQgc21hcnQgYW50ZW5uYSByZXF1aXJlcyBIVyBzdXBwb3J0ICh5b3UgY2FuIGNoZWNr
IHRoaXMgdmlhCndtaV9zZXJ2aWNlcyBpbiBkZWJ1Z2ZzIG9uIGF0aDEwayAtIHRoZXJlJ3MgU1cg
YW5kIEhXIGJpdHMgYXJlCmFkdmVydGlzZWQgdGhlcmUpLiBOb3QgYWxsIHFjYTk4OHggY2hpcHMg
c3VwcG9ydCBpdCAtIG9ubHkgc29tZSBvZiB0aGUKcmV2aXNpb25zLiBJIGRvbid0IGtub3cgaWYg
b25lcyBmb3VuZCBpbiBBcmNoZXIgQzcgc3VwcG9ydCBpdCAobWF5YmUKc29tZSBkbz8pLgoKVGhl
cmUncyBzb21lIGNvZGUgb24gY29kZWF1cm9yYSB5b3UgY2FuIHVzZSBhcyBhIHJlZmVyZW5jZToK
CiBodHRwczovL3VzLmNvZGVhdXJvcmEub3JnL2NnaXQvcXVpYy9xc2RrL29zcy9zeXN0ZW0vZmVl
ZHMvd2xhbi1vcGVuL3RyZWUvbWFjODAyMTEvcGF0Y2hlcy9hMDAtMDAxNS1hdGgxMGstc21hcnQt
YW50ZW5uYS1BUEktc3VwcG9ydC5wYXRjaD9oPWNvY29udXQKCiBodHRwczovL3VzLmNvZGVhdXJv
cmEub3JnL2NnaXQvcXVpYy9xc2RrL29zcy9zeXN0ZW0vZmVlZHMvd2xhbi1vcGVuL3RyZWUvbWFj
ODAyMTEvcGF0Y2hlcy9hMDAtMDAxNi1hdGgxMGstc21hcnQtYW50ZW5uYS1kZWJ1Z2ZzLnBhdGNo
P2g9Y29jb251dAoKIGh0dHBzOi8vdXMuY29kZWF1cm9yYS5vcmcvY2dpdC9xdWljL3FzZGsvb3Nz
L3N5c3RlbS9mZWVkcy93bGFuLW9wZW4vdHJlZS9tYWM4MDIxMS9wYXRjaGVzL2EwMC0wMDIxLWF0
aDEway1TbWFydC1hbnRlbm5hLUFsZ29yaXRobS5wYXRjaD9oPWNvY29udXQKCgpNaWNoYcWCCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFp
bGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
