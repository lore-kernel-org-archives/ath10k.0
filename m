Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x236.google.com ([2a00:1450:4010:c04::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WktZh-0007LA-OY
 for ath10k@lists.infradead.org; Thu, 15 May 2014 11:11:46 +0000
Received: by mail-lb0-f182.google.com with SMTP id z11so435336lbi.27
 for <ath10k@lists.infradead.org>; Thu, 15 May 2014 04:11:22 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <EE97821C81277E459BEA5C6384C6F241012F109978CE@srvexch01.SODIELEC.local>
References: <EE97821C81277E459BEA5C6384C6F241012F0EFBBCBD@srvexch01.SODIELEC.local>
 <5373382C.1030709@elisanet.fi>
 <EE97821C81277E459BEA5C6384C6F241012F109978C9@srvexch01.SODIELEC.local>
 <DUB122-W4070B8F41A0F8A25061141CB360@phx.gbl>
 <EE97821C81277E459BEA5C6384C6F241012F109978CE@srvexch01.SODIELEC.local>
Date: Thu, 15 May 2014 13:11:22 +0200
Message-ID: <CALhHN=pGozL43B+qiJ20it3QCkvKkOL_RynfvUod_Ert8v1+3Q@mail.gmail.com>
Subject: Re: RE : RE : ath10k: set channel by command "iw" not from hostapd
 and DFS support of firmware-2.bin_10.1.467.2-1
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
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
To: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>
Cc: Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Matti Laakso <malaakso@elisanet.fi>

T24gMTUgTWF5IDIwMTQgMTI6NDEsIFZ1IEhhaSBOR1VZRU4gPHZoLm5ndXllbkBhY3RpYXNvZGll
bGVjLmZyPiB3cm90ZToKPj4+IFllcyBJIGRpZCBpdCwgaGVyZSBpcyBteSBjb25maWd1cmF0aW9u
Ogo+Pj4KPj4+IDxNPiAgIEF0aGVyb3MgODAyLjExYWMgd2lyZWxlc3MgY2FyZHMgc3VwcG9ydAo+
Pj4gICDilIIg4pSCICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPE0+ICAgICBBdGhl
cm9zIGF0aDEwayBQQ0kgc3VwcG9ydAo+Pj4gICDilIIg4pSCICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBbKl0gICAgIEF0aGVyb3MgYXRoMTBrIGRlYnVnZ2luZwo+Pj4gICDilIIg
4pSCICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBbKl0gICAgIEF0aGVyb3MgYXRo
MTBrIGRlYnVnZnMgc3VwcG9ydAo+Pj4gICDilIIg4pSCICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBbKl0gICAgIEF0aGVyb3MgYXRoMTBrIHRyYWNpbmcgc3VwcG9ydAo+Pj4gICDi
lIIg4pSCICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBbKl0gICAgIEF0aGVyb3Mg
REZTIHN1cHBvcnQgZm9yIGNlcnRpZmllZCBwbGF0Zm9ybXMKPgo+PkhvdyBvbGQgaXMgeW91ciBo
b3N0YXBkIGJ1aWxkPyBEbyB5b3UgaGF2ZSBjb3VudHJ5IGNvZGUsIGllZWU4MDIxMWQsIGFuZAo+
PmllZWU4MDIxMWhzZXQgaW4gaG9zdGFwZC5jb25mPyBJJ3ZlIGJlZW4gcnVubmluZyBhdGgxMGsg
aW4gQVAgbW9kZSBvbgo+PkRGUy1jaGFubmVscyBzaW5jZSBmZWJydWFyeSAoMTAuMS1icmFuY2gg
ZmlybXdhcmUsIFZIVDgwKS4KPgo+IEknbSB1c2luZyB0aGUgdmVyc2lvbiAyLjEgb2YgaG9zdGFw
ZCwgbXkgaG9zdGFwZC5jb25mIGFscmVheSBpbmNsdWRlZDoKPgo+IGNvdW50cnlfY29kZT1GUgo+
IGllZWU4MDIxMWQ9MQo+IGllZWU4MDIxMWg9MQo+Cj4gQnV0IEkgdGhvdWdodCB0aGF0IEkgZm91
bmQgdGhlIHByb2JsZW0gbWlnaHQgYmUgYmVjYXVzZSBJIGRpZG4ndCBnZXQgdGhlIGRmc19jYWNf
dGltZSBmb3IgREZTLiBJJ20gdXNpbmcgdGhlIHJlZ3VsYXRvcnkgZGF0YWJhc2Ugb2YgY2ZnODAy
MTEgYW5kIGluIHRoZSBmaWxlICAicmVnZGIuYyIgKHdoaWNoIGlzIGdlbmVyYXRlZCBhdXRvbWF0
aWNhbGx5IGZyb20gdGhlIGRhdGFiYXNlIGluIG5ldC93aXJlbGVzcy9kYi50eHQpIGFuZCBJIGFs
d2F5cyBnZXQgdGhlIGRmc19jYWNfdGltZSA9IDAuIEZvciBleGFtcGxlIHRoZSBpbiBmaWxlICJy
ZWd1bGF0b3J5LmgiIHRoZXJlIGlzIGEgZGVmaW5lIG9mIFJFR19SVUxFX0VYVCAoc3RhcnQsIGVu
ZCwgYncsIGdhaW4sIGVpcnAsIGRmc19jYWMsIHJlZ19mbGFncykgYW5kIGluIGZpbGUgInJlZ2Ri
LmMiIEkgZ290IHRoaXMgbGluZTogUkVHX1JVTEVfRVhUKDUyNTAsIDUzMzAsIDgwLCAwLCAyMCwg
MCwgTkw4MDIxMV9SUkZfREZTIHwgMCkgYW5kIHRoYXQgbWVhbnMgbXkgZGZzX2NhYyA9IDAuIEkn
bSBzdHVja2luZyBpbiBob3cgdG8gcGFzcyB0aGUgdmFsdWUgZm9yIHRoaXMgcGFyYW1ldGVyLgo+
Ck5vcGUsIENBQyB0aW1lIGlzIG5vdCByZXF1aXJlZCB0byBzdGFydCBDQUMgKGluIGNhc2UgY2Fj
ID09IDAga2VybmVsCndpbGwgdXNlIGRlZmF1bHQgdmFsdWUgNjBzKS4KV2hhdCBlcnJvciB5b3Ug
aGF2ZSBFQlVTWSBvciBFSU5WQUw/CldoYXQgc3lzdGVtIChQQyBrZXJuZWwsIHdpcmVsZXNzIC4u
LikgY29uZmlndXJhdGlvbj8KCkJSCkphbnVzegoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0
aDEwawo=
