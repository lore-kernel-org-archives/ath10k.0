Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x231.google.com ([2a00:1450:400c:c05::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z7GQG-0002Bo-Ne
 for ath10k@lists.infradead.org; Tue, 23 Jun 2015 05:07:01 +0000
Received: by wicnd19 with SMTP id nd19so94504467wic.1
 for <ath10k@lists.infradead.org>; Mon, 22 Jun 2015 22:06:36 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <E2234D3C-68F0-44D9-AB50-84C0D13D18C0@gmail.com>
References: <D38B2BA4-0B08-4B7B-A295-E95D1CF3FDBB@gmail.com>
 <CA+BoTQm735L-TQ0ZjSZ2gHud_AwvP+kZAh+Wc4iQtaGSiC2GLw@mail.gmail.com>
 <5571C5A6.4080809@candelatech.com>
 <CA+BoTQnVin4Aj0MXhVwuX=nmHDsZo_xr-jF4zwLp+1-hExL2zQ@mail.gmail.com>
 <E2234D3C-68F0-44D9-AB50-84C0D13D18C0@gmail.com>
Date: Tue, 23 Jun 2015 07:06:35 +0200
Message-ID: <CA+BoTQnFAdXM90-5wqFqZ+H3ny8_DyQVfxQpXYDOd=Z-8Q3i2w@mail.gmail.com>
Subject: Re: Warnings/errors in use with a QCA989x card
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
To: Matthew Robbetts <wingfeathera@gmail.com>
Cc: Ben Greear <greearb@candelatech.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMjMgSnVuZSAyMDE1IGF0IDAwOjQwLCBNYXR0aGV3IFJvYmJldHRzIDx3aW5nZmVhdGhlcmFA
Z21haWwuY29tPiB3cm90ZToKWy4uLl0KPj4+IEkgdGhvdWdodCB0aGUgbmV3ZXIgdXBzdHJlYW0g
ZmlybXdhcmUgaGFkCj4+PiBzdXBwb3J0IGZvciBtZ3QgZnJhbWVzIG92ZXIgbm9ybWFsIHBhY2tl
dCB0cmFuc3BvcnQgaW5zdGVhZCBvZiBvdmVyCj4+PiB0aGUgV01JIG1hbmFnZW1lbnQgaW50ZXJm
YWNlPyAgV291bGRuJ3QgdGhhdCBmaXggdGhpbmdzPwo+Pgo+PiBJIGJlbGlldmUgdGhpcyB3YXMv
aXMgc3VwcG9zZWQgdG8gYmUgYXZhaWxhYmxlIGluIHNvbWUgcmVjZW50IDEwLjIuNAo+PiBidWls
ZHMuIEkgdGhpbmsgMTAuMi40LjQ4IHdhcyBmaXJzdCBzdXBwb3NlZCB0byBzdXBwb3J0IGl0IGJ1
dCBJIHNlZQo+PiB0aGUgYXZhaWxhYmxlICJzdGFibGUiIGZ3IGFwaSBibG9iIHN0aWxsIGFkdmVy
dGlzZXMgaGFzLXdtaS1tZ210LXR4Lgo+PiBUaGUgMTAuMi40LjQ4LTIgZnJvbSB1bnRlc3RlZC8g
b24gdGhlIG90aGVyIGhhbmQgZG9lc24ndCBhZHZlcnRpc2UgdGhlCj4+IGJpdCBzbyBJIGd1ZXNz
IGl0IHVzZXMgdGhlIEhUVCBwYXRoIGZvciBtYW5hZ2VtZW50IGZyYW1lcyB3aGljaCBzaG91bGQK
Pj4gcHJldmVudCB0aGUgdHggY3JlZGl0IHN0YXJ2YXRpb24gcHJvYmxlbS4KPj4KPj4gQE1hdHRo
ZXc6IENhbiB5b3UgdHJ5IHJ1bm5pbmcgMTAuMi40LjQ4LTIgZnJvbSAxMC4yLjQvdW50ZXN0ZWQv
IEAKPj4gZ2l0aHViLmNvbS9rdmFsby9hdGgxMGstZmlybXdhcmUgYW5kIHNlZSBpZiBpdCBoZWxw
cyB5b3UsIHBsZWFzZT8KPgo+IEFyZ2ghIEkgbWFuYWdlZCB0byBlbnRpcmVseSBtaXNzIHRoaXMg
bGFzdCBzdGF0ZW1lbnQgaW4geW91ciBlbWFpbCEgSSB3aWxsIGFic29sdXRlbHkgdHJ5IHRoaXMs
IGltbWVkaWF0ZWx5Lgo+Cj4gT3V0IG9mIGludGVyZXN0LCBzaG91bGQgSSBza2lwIHN0cmFpZ2h0
IHRvIDEwLjIuNC43MC0yIG9yIG1pZ2h0IHRoaXMgYmUgc3BlY2lmaWMgdG8gLjQ4LTI/CgpCb3Ro
IHNob3VsZCB1c2UgaHR0LW1nbXQtdHggc28gaXQgc2hvdWxkbid0IG1hdHRlciBhcyBmYXIgYXMg
dGhlCm1nbXQtdHggcHJvYmxlbSBpcyBjb25jZXJuZWQuCgoKTWljaGHFggoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAph
dGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2F0aDEwawo=
