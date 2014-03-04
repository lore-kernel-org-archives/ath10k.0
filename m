Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-bk0-f47.google.com ([209.85.214.47])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WKjZW-00016t-Tl
 for ath10k@lists.infradead.org; Tue, 04 Mar 2014 07:15:29 +0000
Received: by mail-bk0-f47.google.com with SMTP id w10so86488bkz.34
 for <ath10k@lists.infradead.org>; Mon, 03 Mar 2014 23:14:59 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <5314FD54.7070202@candelatech.com>
References: <1393550452-1302-1-git-send-email-greearb@candelatech.com>
 <CA+BoTQnCjkgr3V4bzXW8GHJDmGRHqg6x8An__vFW5bxdub=uyw@mail.gmail.com>
 <5314FD54.7070202@candelatech.com>
Date: Tue, 4 Mar 2014 08:14:59 +0100
Message-ID: <CA+BoTQk1QJfOPORL54kUR+gxBO97BZhHnm_+KV4KgpAruKW0JQ@mail.gmail.com>
Subject: Re: [PATCH v2] ath10k: support msdu chaining.
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

T24gMyBNYXJjaCAyMDE0IDIzOjA4LCBCZW4gR3JlZWFyIDxncmVlYXJiQGNhbmRlbGF0ZWNoLmNv
bT4gd3JvdGU6Cj4gT24gMDIvMjcvMjAxNCAxMTo1MSBQTSwgTWljaGFsIEthemlvciB3cm90ZToK
Pj4gT24gMjggRmVicnVhcnkgMjAxNCAwMjoyMCwgIDxncmVlYXJiQGNhbmRlbGF0ZWNoLmNvbT4g
d3JvdGU6Cj4+PiBGcm9tOiBCZW4gR3JlZWFyIDxncmVlYXJiQGNhbmRlbGF0ZWNoLmNvbT4KPj4+
Cj4+PiBDb25zb2xpZGF0ZSB0aGUgbGlzdCBvZiBtc2R1IHNrYnMgaW50byB0aGUgbXNkdS1oZWFk
IHNrYiwgZGVsZXRlIHRoZQo+Pj4gcmVzdCBvZiB0aGUgc2ticywgcGFzcyB0aGUgbXNkdS1oZWFk
IHNrYiBvbiB1cCB0aGUgc3RhY2sgYXMgbm9ybWFsLgo+Pj4KPj4+IFRlc3RlZCB3aXRoIGhpZ2gt
c3BlZWQgVENQIGFuZCBVRFAgdHJhZmZpYyBvbiBtb2RpZmllZCBmaXJtd2FyZSB0aGF0Cj4+PiBz
dXBwb3J0cyByYXctcnguCj4+Cj4+IEFzIGZvciBhbiB1bW9kaWZpZWQgZmlybXdhcmUgSSBleHBl
Y3QgYXRoMTBrIHdpbGwganVzdCByZS1hc3NlbWJsZQo+PiBjb3JydXB0ZWQgZnJhbWVzIGp1c3Qg
dG8gaGF2ZSB0aGVtIGRyb3BwZWQgYnkgbWFjODAyMTEuIEl0IG1pZ2h0IGJlCj4+IHdvcnRoIGNo
ZWNraW5nOgo+Pgo+PiAgaWYgKGNoYWluaW5nICYmIGZjc19lcnJvcikKPj4gICAgIGRyb3AoKTsK
Pgo+IEFzIGZhciBhcyBJIGNhbiB0ZWxsLCBwYWNrZXRzIHdpdGggYmFkIEZDUyBhcmUgZHJvcHBl
ZCBlYXJsaWVyIGluIHRoYXQKPiByeCBtZXRob2Q/CgpBaCwgZ29vZCBwb2ludC4gV2UncmUgZHJv
cHBpbmcgc29tZSBmcmFtZXMgYmFzZWQgb24gYHN0YXR1c2AgdmFsdWUgYWxyZWFkeS4KCgpNaWNo
YcWCCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgx
MGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
