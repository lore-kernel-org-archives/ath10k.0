Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nm.newmedia-net.de ([217.113.179.122]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ccPDX-0005Vt-5f
 for ath10k@lists.infradead.org; Sat, 11 Feb 2017 04:23:26 +0000
References: <0082a9e3-83f3-9bc3-af43-b890b91cfd93@candelatech.com>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <e71fe0b1-4482-b80b-2624-240b154ff980@dd-wrt.com>
Date: Sat, 11 Feb 2017 05:22:51 +0100
MIME-Version: 1.0
In-Reply-To: <0082a9e3-83f3-9bc3-af43-b890b91cfd93@candelatech.com>
Subject: Re: VHT 160Mhz and nss related config.
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
To: Ben Greear <greearb@candelatech.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>

aSByZWFsbHkgY2FuJ3QgYmVsaWV2ZSB0aGlzLiBpZiB0aGlzIGlzIHRydWUgdGhlICAxNjAgbWh6
IG1vZGUgd291bGQgbm90IAptYWtlIGFueSBzZW5zZS4KdGhlIG1heGltdW0gdHggLyByeCByYXRl
IGZvciA0eDQgdmh0ODAgYW5kIDJ4MiB2aHQxNjAgaXMgaWRlbnRpY2FsLiBzbyAKdmh0MTYwIHdv
dWxkIG5vdCBpbmNyZWFzZSBwZXJmb3JtYW5jZSBpbiBhbnkgd2F5CgpBbSAxMC4wMi4yMDE3IHVt
IDIzOjU4IHNjaHJpZWIgQmVuIEdyZWVhcjoKPiBTbywgaXQgYXBwZWFycyB0aGF0IHRoZSBhdGgx
MGsgUUNBOTk4NCA0eDQgMTYwTWh6IGNoaXAgY2FuIGRvIDR4NCBNSU1PIAo+IGF0IFZIVDgwLCBi
dXQKPiBpdCBjYW4gZG8gb25seSAyeDIgTUlNTyBhdCBWSFQxNjAvODArODAuCj4KPiBXaGVuIGNv
bmZpZ3VyaW5nIGEgcGVlciwgd2UgbmVlZCB0byB0ZWxsIHRoZSBmaXJtd2FyZSB0aGUgbnVtYmVy
IG9mIAo+IHNwYXRpYWwgc3RyZWFtcwo+IG9mIHRoZSBwZWVyIGF0IFZIVDE2MCBhbmQgYXQgVkhU
ODAgYW5kIGxvd2VyLiAgVGhleSBhcmUgbm90IHRoZSBzYW1lIAo+IHZhbHVlLgo+Cj4gSSBjYW5u
b3QgdGhpbmsgb2YgYW55IHN0YW5kYXJkIHdheSB0byBnZXQgdGhpcyBpbmZvcm1hdGlvbiBiYXNl
ZCBvbiAKPiBWSFQgY2FwYWJpbGl0aWVzCj4gYW5kIHN1Y2guICBDdXJyZW50bHksIG9uZSBjb3Vs
ZCBqdXN0IGFzc3VtZSBWSFQxNjAgTlNTIGlzIDEvMiBvZiB0aGUgCj4gVkhUODAgTlNTLAo+IGJ1
dCB0aGF0IGlzIHVubGlrZWx5IHRvIGJlIHRydWUgZm9yIGFsbCB2ZW5kb3JzLgo+Cj4gQW55IGlk
ZWFzPwo+Cj4gVGhhbmtzLAo+IEJlbgo+CgoKLS0gCk1pdCBmcmV1bmRsaWNoZW4gR3LDvHNzZW4g
LyBSZWdhcmRzCgpTZWJhc3RpYW4gR290dHNjaGFsbCAvIENUTwoKTmV3TWVkaWEtTkVUIEdtYkgg
LSBERC1XUlQKRmlybWVuc2l0ejogIEJlcmxpbmVyIFJpbmcgMTAxLCA2NDYyNSBCZW5zaGVpbQpS
ZWdpc3RlcmdlcmljaHQ6IEFtdHNnZXJpY2h0IERhcm1zdGFkdCwgSFJCIDI1NDczCkdlc2Now6Rm
dHNmw7xocmVyOiBQZXRlciBTdGVpbmjDpHVzZXIsIENocmlzdGlhbiBTY2hlZWxlCmh0dHA6Ly93
d3cuZGQtd3J0LmNvbQplbWFpbDogcy5nb3R0c2NoYWxsQGRkLXdydC5jb20KVGVsLjogKzQ5NjI1
MS01ODI2NTAgLyBGYXg6ICs0OTYyNTEtNTgyNjU2NQoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hdGgxMGsK
