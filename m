Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XS5Dn-0004RA-St
 for ath10k@lists.infradead.org; Thu, 11 Sep 2014 14:19:40 +0000
Message-ID: <5411AF6A.7010702@candelatech.com>
Date: Thu, 11 Sep 2014 07:19:22 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [RFC] ath10k: use raw tx
References: <1408693965-29858-1-git-send-email-michal.kazior@tieto.com>	<5400F497.7070904@candelatech.com>
 <CA+BoTQnhqxtHcX46-U+TjQBMDm27jM11xCJ956UFM_gjMvvs+A@mail.gmail.com>
In-Reply-To: <CA+BoTQnhqxtHcX46-U+TjQBMDm27jM11xCJ956UFM_gjMvvs+A@mail.gmail.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMDkvMTEvMjAxNCAwMzozNSBBTSwgTWljaGFsIEthemlvciB3cm90ZToKPiBPbiAyOSBBdWd1
c3QgMjAxNCAyMzo0NSwgQmVuIEdyZWVhciA8Z3JlZWFyYkBjYW5kZWxhdGVjaC5jb20+IHdyb3Rl
Ogo+PiBPbiAwOC8yMi8yMDE0IDEyOjUyIEFNLCBNaWNoYWwgS2F6aW9yIHdyb3RlOgo+Pj4gVGhp
cyBpcyBqdXN0IGEgcmVmZXJlbmNlIGZvciBhbnlvbmUgaW50ZXJlc3RlZCBpbgo+Pj4gZ2V0dGlu
ZyBpbmplY3Rpb24gd29ya2luZyB3aXRoIGF0aDEway4KPj4KPj4gRGlkIHlvdSB0cnkgdGhpcyB3
aXRoIGVuY3J5cHRpb24/ICBJIGNhbiByZXByb2R1Y2UgdGhlIGNyYXNoCj4+IGluIG9wZW4gbW9k
ZSBvbiBteSBDVCBmaXJtd2FyZSwgYnV0IEkgY291bGRuJ3QgZXZlbiBnZXQKPj4gREhDUCB0byBj
b21wbGV0ZSB3aXRoIHdwYTIgZW5hYmxlZC4KPgo+IEhpLAo+Cj4gTGF0ZSByZXBseSwgc29ycnku
Cj4KPiBJJ3ZlIGp1c3QgZGlkIGEgcXVpY2sgdGVzdCBvbiAxMC4yIChib3RoIEFQIGFuZCBTVEEp
IHdpdGggV1BBMi4KPiBBcHBhcmVudGx5IHRoZSByYXcgdHggbW9kZSByZXF1aXJlcyBJViB0byBi
ZSBzZXQgdXAgb24gaG9zdCBhbmQgcGFja2V0Cj4gbGVuZ3RoIChyZXBvcnRlZCBpbiBIVFQgVHgg
Y29tbWFuZCBoZWFkZXIpIG11c3QgYmUgcmUtYWRqdXN0ZWQKPiBkaWZmZXJlbnRseSwgb3RoZXJ3
aXNlIGZyYW1lcyBhcmUgYnJva2VuIChpbmNvcnJlY3QgRkNTLCB0b28gbG9uZywKPiBzb21ld2hh
dCBlbmNyeXB0ZWQgZXhjZXB0IExMQy9TTkFQKS4gVGhlIGJlc3QgSSBjb3VsZCBnZXQgd2VyZQo+
IEZDUy1jb3JyZWN0IHVuZGVjcnlwdGFibGUgZnJhbWVzIG9uIGFpci4gUGVyaGFwcyBzb21lb25l
IHdpbGwgZmlndXJlCj4gdGhhdCBvdXQuLgo+Cj4gQW5vdGhlciB3YXkgYXJvdW5kIHRoaXMgd291
bGQgYmUgdG8gcGVyZm9ybSBzb2Z0d2FyZSBjcnlwdG8gZm9yIHR4Cj4gZW50aXJlbHkgb24gaG9z
dC4KClRoYXQgZGlkIG5vdCBmaXggdGhlIHByb2JsZW0gZm9yIG1lLiAgVGhlIGZpcm13YXJlL2hh
cmR3YXJlIGNvdWxkIG5vdCBiZQpjb252aW5jZWQgKGJ5IG1lLCBhdCBsZWFzdCkgdG8gbGVhdmUg
dGhlIGVuY3J5cHRlZCBwYWNrZXQgYWxvbmUgYW5kIGluc2lzdGVkIG9uCmRvaW5nIGF0IGxlYXN0
IHBhcnRpYWwgcmUtY3J5cHQsIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCgpUaGFua3MsCkJlbgoK
Pgo+Cj4gTWljaGHFggo+CgoKLS0gCkJlbiBHcmVlYXIgPGdyZWVhcmJAY2FuZGVsYXRlY2guY29t
PgpDYW5kZWxhIFRlY2hub2xvZ2llcyBJbmMgIGh0dHA6Ly93d3cuY2FuZGVsYXRlY2guY29tCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1h
aWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
