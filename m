Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from vs18.mail.saunalahti.fi ([62.142.117.199])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WlCmu-0002Kp-4R
 for ath10k@lists.infradead.org; Fri, 16 May 2014 07:42:41 +0000
Message-ID: <5375C147.3020905@elisanet.fi>
Date: Fri, 16 May 2014 09:41:59 +0200
From: Matti Laakso <malaakso@elisanet.fi>
MIME-Version: 1.0
Subject: Re: RE : RE : RE : RE : ath10k: set channel by command "iw" not from
 hostapd and DFS support of firmware-2.bin_10.1.467.2-1
References: <EE97821C81277E459BEA5C6384C6F241012F0EFBBCBD@srvexch01.SODIELEC.local>	<5373382C.1030709@elisanet.fi>	<EE97821C81277E459BEA5C6384C6F241012F109978C9@srvexch01.SODIELEC.local>	<DUB122-W4070B8F41A0F8A25061141CB360@phx.gbl>	<EE97821C81277E459BEA5C6384C6F241012F109978CE@srvexch01.SODIELEC.local>	<CALhHN=pGozL43B+qiJ20it3QCkvKkOL_RynfvUod_Ert8v1+3Q@mail.gmail.com>	<EE97821C81277E459BEA5C6384C6F241012F109978CF@srvexch01.SODIELEC.local>	<EE97821C81277E459BEA5C6384C6F241012F109978D1@srvexch01.SODIELEC.local>,
 <CALhHN=q_kuaszuBdsWHLZJYEA1PW63AqDFiF89DC3c4pOJseOg@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978D3@srvexch01.SODIELEC.local>
In-Reply-To: <EE97821C81277E459BEA5C6384C6F241012F109978D3@srvexch01.SODIELEC.local>
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
To: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>, Janusz Dziedzic <janusz.dziedzic@tieto.com>
Cc: Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMTYuMDUuMjAxNCAwOTowMSwgVnUgSGFpIE5HVVlFTiB3cm90ZToKPj4gT0sgdGhlbi4gRUJV
U1kgeW91IGdldCB3aGVuIHlvdSBkb24ndCBoYXZlIGNvcnJlY3QgY29tYmluYXRpb24gKERGUwo+
PiBjb21iaW5hdGlvbiBpcyBub3QgcHJlc2VudCkuCj4+IFdoaWNoIHN1Z2dlc3QgZm9yIHNvbWUg
cmVhc29uIHlvdXIgY29uZmlndXJhdGlvbiBkaWRuJ3QgYWN0aXZhdGUKPj4gQ09ORklHX0FUSDEw
S19ERlNfQ0VSVElGSUVELgo+PiBDaGVjayBpdyBsaXN0LCB5b3Ugc2h1bGQgc2VlOgo+PiByYWRh
ciBkZXRlY3Qgd2lkdGhzOiB7IDIwIE1IeiAobm8gSFQpLCAyMCBNSHosIDQwIE1IeiwgODAgTUh6
IH0KPiBZZXMgSSBhbHJlYWR5IGRpZCBpdCwgaGVyZSBpcyBteSBjb25maWd1cmF0aW9uOgo+Cj4g
PE0+ICAgQXRoZXJvcyA4MDIuMTFhYyB3aXJlbGVzcyBjYXJkcyBzdXBwb3J0Cj4gICAggSCBICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPE0+ICAgICBBdGhlcm9zIGF0aDEwayBQQ0kg
c3VwcG9ydAo+ICAgIIEggSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgWypdICAg
ICBBdGhlcm9zIGF0aDEwayBkZWJ1Z2dpbmcKPiAgICCBIIEgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFsqXSAgICAgQXRoZXJvcyBhdGgxMGsgZGVidWdmcyBzdXBwb3J0Cj4gICAg
gSCBICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBbKl0gICAgIEF0aGVyb3MgYXRo
MTBrIHRyYWNpbmcgc3VwcG9ydAo+ICAgIIEggSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgWypdICAgICBBdGhlcm9zIERGUyBzdXBwb3J0IGZvciBjZXJ0aWZpZWQgcGxhdGZvcm1z
Cj4KCllvdSBhbHNvIGdldCBFQlVTWSB3aXRoIHRoZSBub24tQVAgZmlybXdhcmUgKHJlZ2FyZGxl
c3Mgb2YKQVRIMTBLX0RGU19DRVJUSUZJRUQpLiBIYXZlIHlvdSBkb3VibGUgY2hlY2tlZCBmcm9t
IGRtZXNnIHRoYXQgdGhlCmNvcnJlY3QgZmlybXdhcmUgaXMgaW5kZWVkIGxvYWRlZD8KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5n
IGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
