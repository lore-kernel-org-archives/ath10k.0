Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mailhost.actiasodielec.fr ([89.91.64.97])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WktAR-0007JY-BE
 for ath10k@lists.infradead.org; Thu, 15 May 2014 10:45:42 +0000
From: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>
Date: Thu, 15 May 2014 12:41:54 +0200
Subject: RE : RE : ath10k: set channel by command "iw" not from hostapd and
 DFS support of firmware-2.bin_10.1.467.2-1
Message-ID: <EE97821C81277E459BEA5C6384C6F241012F109978CE@srvexch01.SODIELEC.local>
References: <EE97821C81277E459BEA5C6384C6F241012F0EFBBCBD@srvexch01.SODIELEC.local>, 
 <5373382C.1030709@elisanet.fi>,
 <EE97821C81277E459BEA5C6384C6F241012F109978C9@srvexch01.SODIELEC.local>,
 <DUB122-W4070B8F41A0F8A25061141CB360@phx.gbl>
In-Reply-To: <DUB122-W4070B8F41A0F8A25061141CB360@phx.gbl>
Content-Language: fr-FR
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="koi8-r"
Content-Transfer-Encoding: base64
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Matti Laakso <malaakso@elisanet.fi>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Cc: Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>, "janusz.dziedzic@tieto.com" <janusz.dziedzic@tieto.com>

Pj4gWWVzIEkgZGlkIGl0LCBoZXJlIGlzIG15IGNvbmZpZ3VyYXRpb246Cj4+Cj4+IDxNPiAgIEF0
aGVyb3MgODAyLjExYWMgd2lyZWxlc3MgY2FyZHMgc3VwcG9ydAo+PiAgIIEggSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIDxNPiAgICAgQXRoZXJvcyBhdGgxMGsgUENJIHN1cHBvcnQK
Pj4gICCBIIEgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFsqXSAgICAgQXRoZXJv
cyBhdGgxMGsgZGVidWdnaW5nCj4+ICAggSCBICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBbKl0gICAgIEF0aGVyb3MgYXRoMTBrIGRlYnVnZnMgc3VwcG9ydAo+PiAgIIEggSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgWypdICAgICBBdGhlcm9zIGF0aDEwayB0cmFj
aW5nIHN1cHBvcnQKPj4gICCBIIEgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFsq
XSAgICAgQXRoZXJvcyBERlMgc3VwcG9ydCBmb3IgY2VydGlmaWVkIHBsYXRmb3JtcwoKPkhvdyBv
bGQgaXMgeW91ciBob3N0YXBkIGJ1aWxkPyBEbyB5b3UgaGF2ZSBjb3VudHJ5IGNvZGUsIGllZWU4
MDIxMWQsIGFuZAo+aWVlZTgwMjExaHNldCBpbiBob3N0YXBkLmNvbmY/IEkndmUgYmVlbiBydW5u
aW5nIGF0aDEwayBpbiBBUCBtb2RlIG9uCj5ERlMtY2hhbm5lbHMgc2luY2UgZmVicnVhcnkgKDEw
LjEtYnJhbmNoIGZpcm13YXJlLCBWSFQ4MCkuCgpJJ20gdXNpbmcgdGhlIHZlcnNpb24gMi4xIG9m
IGhvc3RhcGQsIG15IGhvc3RhcGQuY29uZiBhbHJlYXkgaW5jbHVkZWQ6Cgpjb3VudHJ5X2NvZGU9
RlIKaWVlZTgwMjExZD0xCmllZWU4MDIxMWg9MQoKQnV0IEkgdGhvdWdodCB0aGF0IEkgZm91bmQg
dGhlIHByb2JsZW0gbWlnaHQgYmUgYmVjYXVzZSBJIGRpZG4ndCBnZXQgdGhlIGRmc19jYWNfdGlt
ZSBmb3IgREZTLiBJJ20gdXNpbmcgdGhlIHJlZ3VsYXRvcnkgZGF0YWJhc2Ugb2YgY2ZnODAyMTEg
YW5kIGluIHRoZSBmaWxlICAicmVnZGIuYyIgKHdoaWNoIGlzIGdlbmVyYXRlZCBhdXRvbWF0aWNh
bGx5IGZyb20gdGhlIGRhdGFiYXNlIGluIG5ldC93aXJlbGVzcy9kYi50eHQpIGFuZCBJIGFsd2F5
cyBnZXQgdGhlIGRmc19jYWNfdGltZSA9IDAuIEZvciBleGFtcGxlIHRoZSBpbiBmaWxlICJyZWd1
bGF0b3J5LmgiIHRoZXJlIGlzIGEgZGVmaW5lIG9mIFJFR19SVUxFX0VYVCAoc3RhcnQsIGVuZCwg
YncsIGdhaW4sIGVpcnAsIGRmc19jYWMsIHJlZ19mbGFncykgYW5kIGluIGZpbGUgInJlZ2RiLmMi
IEkgZ290IHRoaXMgbGluZTogUkVHX1JVTEVfRVhUKDUyNTAsIDUzMzAsIDgwLCAwLCAyMCwgMCwg
Tkw4MDIxMV9SUkZfREZTIHwgMCkgYW5kIHRoYXQgbWVhbnMgbXkgZGZzX2NhYyA9IDAuIEknbSBz
dHVja2luZyBpbiBob3cgdG8gcGFzcyB0aGUgdmFsdWUgZm9yIHRoaXMgcGFyYW1ldGVyLiAKCgog
TkdVWUVOIFZ1IEhhaQogQWNpdGEtU29kaWVsZWMKIFJvdXRlIGRlIE1heXJlcyAtIEIuUC4gOQog
MTIxMDAgU3QgR0VPUkdFUyBERSBMVVpFTkNPTgogRlJBTkNFCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2F0aDEwawo=
