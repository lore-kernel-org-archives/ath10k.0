Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z7RNM-0001lV-6s
 for ath10k@lists.infradead.org; Tue, 23 Jun 2015 16:48:45 +0000
Received: by pabvl15 with SMTP id vl15so10454429pab.1
 for <ath10k@lists.infradead.org>; Tue, 23 Jun 2015 09:48:22 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.0 \(3056\))
Subject: Re: Warnings/errors in use with a QCA989x card
From: Matthew Robbetts <wingfeathera@gmail.com>
In-Reply-To: <CA+BoTQnFAdXM90-5wqFqZ+H3ny8_DyQVfxQpXYDOd=Z-8Q3i2w@mail.gmail.com>
Date: Tue, 23 Jun 2015 09:48:20 -0700
Message-Id: <7FC092B0-9AE5-4985-8C4A-4C072BD8706C@gmail.com>
References: <D38B2BA4-0B08-4B7B-A295-E95D1CF3FDBB@gmail.com>
 <CA+BoTQm735L-TQ0ZjSZ2gHud_AwvP+kZAh+Wc4iQtaGSiC2GLw@mail.gmail.com>
 <5571C5A6.4080809@candelatech.com>
 <CA+BoTQnVin4Aj0MXhVwuX=nmHDsZo_xr-jF4zwLp+1-hExL2zQ@mail.gmail.com>
 <E2234D3C-68F0-44D9-AB50-84C0D13D18C0@gmail.com>
 <CA+BoTQnFAdXM90-5wqFqZ+H3ny8_DyQVfxQpXYDOd=Z-8Q3i2w@mail.gmail.com>
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
Cc: Ben Greear <greearb@candelatech.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

SGkgTWljaGHFgiwKCj4gT24gSnVuIDIyLCAyMDE1LCBhdCAyMjowNiwgTWljaGFsIEthemlvciA8
bWljaGFsLmthemlvckB0aWV0by5jb20+IHdyb3RlOgo+IAo+IE9uIDIzIEp1bmUgMjAxNSBhdCAw
MDo0MCwgTWF0dGhldyBSb2JiZXR0cyA8d2luZ2ZlYXRoZXJhQGdtYWlsLmNvbT4gd3JvdGU6Cj4g
Wy4uLl0KPj4+PiBJIHRob3VnaHQgdGhlIG5ld2VyIHVwc3RyZWFtIGZpcm13YXJlIGhhZAo+Pj4+
IHN1cHBvcnQgZm9yIG1ndCBmcmFtZXMgb3ZlciBub3JtYWwgcGFja2V0IHRyYW5zcG9ydCBpbnN0
ZWFkIG9mIG92ZXIKPj4+PiB0aGUgV01JIG1hbmFnZW1lbnQgaW50ZXJmYWNlPyAgV291bGRuJ3Qg
dGhhdCBmaXggdGhpbmdzPwo+Pj4gCj4+PiBJIGJlbGlldmUgdGhpcyB3YXMvaXMgc3VwcG9zZWQg
dG8gYmUgYXZhaWxhYmxlIGluIHNvbWUgcmVjZW50IDEwLjIuNAo+Pj4gYnVpbGRzLiBJIHRoaW5r
IDEwLjIuNC40OCB3YXMgZmlyc3Qgc3VwcG9zZWQgdG8gc3VwcG9ydCBpdCBidXQgSSBzZWUKPj4+
IHRoZSBhdmFpbGFibGUgInN0YWJsZSIgZncgYXBpIGJsb2Igc3RpbGwgYWR2ZXJ0aXNlcyBoYXMt
d21pLW1nbXQtdHguCj4+PiBUaGUgMTAuMi40LjQ4LTIgZnJvbSB1bnRlc3RlZC8gb24gdGhlIG90
aGVyIGhhbmQgZG9lc24ndCBhZHZlcnRpc2UgdGhlCj4+PiBiaXQgc28gSSBndWVzcyBpdCB1c2Vz
IHRoZSBIVFQgcGF0aCBmb3IgbWFuYWdlbWVudCBmcmFtZXMgd2hpY2ggc2hvdWxkCj4+PiBwcmV2
ZW50IHRoZSB0eCBjcmVkaXQgc3RhcnZhdGlvbiBwcm9ibGVtLgo+Pj4gCj4+PiBATWF0dGhldzog
Q2FuIHlvdSB0cnkgcnVubmluZyAxMC4yLjQuNDgtMiBmcm9tIDEwLjIuNC91bnRlc3RlZC8gQAo+
Pj4gZ2l0aHViLmNvbS9rdmFsby9hdGgxMGstZmlybXdhcmUgYW5kIHNlZSBpZiBpdCBoZWxwcyB5
b3UsIHBsZWFzZT8KPj4gCj4+IEFyZ2ghIEkgbWFuYWdlZCB0byBlbnRpcmVseSBtaXNzIHRoaXMg
bGFzdCBzdGF0ZW1lbnQgaW4geW91ciBlbWFpbCEgSSB3aWxsIGFic29sdXRlbHkgdHJ5IHRoaXMs
IGltbWVkaWF0ZWx5Lgo+PiAKPj4gT3V0IG9mIGludGVyZXN0LCBzaG91bGQgSSBza2lwIHN0cmFp
Z2h0IHRvIDEwLjIuNC43MC0yIG9yIG1pZ2h0IHRoaXMgYmUgc3BlY2lmaWMgdG8gLjQ4LTI/Cj4g
Cj4gQm90aCBzaG91bGQgdXNlIGh0dC1tZ210LXR4IHNvIGl0IHNob3VsZG4ndCBtYXR0ZXIgYXMg
ZmFyIGFzIHRoZQo+IG1nbXQtdHggcHJvYmxlbSBpcyBjb25jZXJuZWQuCgpHcmVhdCwgdGhhbmtz
IQoKSSBhY3R1YWxseSB0cmllZCB0byB1c2UgdGhpcyBmaXJtd2FyZSBsYXN0IG5pZ2h0IHdpdGgg
bXkgNC4wLjQga2VybmVsLCBidXQgaGl0IHRoZSBwcm9ibGVtIG9mIGdldHRpbmcgYSB0b25uZSBv
ZjoKCi4uLgphdGgxMGtfcGNpIDAwMDA6MDI6MDAuMDogaHR0IGV2ZW50ICgxOSkgbm90IGhhbmRs
ZWQKLi4uCgoKaW4gbXkgZG1lc2cgd2hlbmV2ZXIgYSBkZXZpY2UgdHJpZWQgdG8gY29ubmVjdC4g
SSBmb3VuZCB0aGUgcG9zdDoKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvcGlwZXJtYWlsL2F0
aDEway8yMDE1LU1hcmNoLzAwNDc5Ny5odG1sCgppbXBseWluZyB0byBtZSB0aGF0IHRoaXMgaXMg
ZXhwZWN0ZWQgYW5kIHRoYXQgZHJpdmVyIGNoYW5nZXMgYXJlIG5lZWRlZCB0byB1c2UgdGhpcyBu
ZXcgbWVjaGFuaXNtLiBJcyB0aGVyZSBhbiBlYXN5IHdheSAoZm9yIGFuIGlkaW90KSB0byBnZXQg
dGhlc2UgY2hhbmdlcz8gQXJlIHRoZXkgaW4gdGhlIDQuMSBrZXJuZWwsIG9yIHdpbGwgSSBuZWVk
IHRvIHBhdGNoIG1hbnVhbGx5PwoKClRoYW5rcyBhZ2FpbiwKTWF0dApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEw
a0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vYXRoMTBrCg==
