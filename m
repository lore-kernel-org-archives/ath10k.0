Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtps.newmedia-net.de ([2a05:a1c0:0:de::167]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f9QMf-0002v3-SG
 for ath10k@lists.infradead.org; Fri, 20 Apr 2018 07:22:15 +0000
Subject: Re: [PATCH v2 4/4] ath10k: Enable sta idle power save
References: <1523966821-21903-1-git-send-email-pillair@codeaurora.org>
 <1523966821-21903-5-git-send-email-pillair@codeaurora.org>
 <946e582c-2438-872b-eec8-25d9dcb994d9@dd-wrt.com>
 <7a06a34a5fcb97e07a8d79b4d689e781@codeaurora.org>
 <87604oodt4.fsf@kamboji.qca.qualcomm.com>
 <a7dd1b94951725c61034f5be6744b725@codeaurora.org>
 <8736zrjgq6.fsf@kamboji.qca.qualcomm.com>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <c48c1bae-04c9-55d0-fdb9-d9ae8f7cb843@dd-wrt.com>
Date: Fri, 20 Apr 2018 09:21:33 +0200
MIME-Version: 1.0
In-Reply-To: <8736zrjgq6.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@codeaurora.org>, govinds@codeaurora.org
Cc: linux-wireless@vger.kernel.org, arend.vanspriel@broadcom.com, pillair@codeaurora.org, ath10k@lists.infradead.org

Cj4+IFllcyB0aGlzIGlzIFdJRkkgY2hpcCBzZXQgbGV2ZWwgcG93ZXItc2F2ZShiYXNlZCBvbiBp
ZGxlbmVzcykgYW5kIG5vdAo+PiByZWxhdGVkIHRvIHByb3RvY29sIHBvd2VyIHNhdmUuIEZXIHdp
bGwgdHVybiBvZmYvc2NhbGUgZG93biB0aGUKPj4gcmVzb3VyY2VzKGNsb2NrL3JhaWxzKSBiYXNl
ZCBvbiBvcHBvcnR1bml0eSh3aGVuIGV2ZXIgaWRsZSBtb2RlIGlzCj4+IGRldGVjdGVkKS4gVGhp
cyBwb3dlciBzYXZlIGlzIG1vc3RseSBkb25lIGluIGRpc2Nvbm5lY3RlZCBzdGF0ZS4gSSBhbQo+
PiBub3QgcmVhbGx5IHN1cmUgd2hlbiBmcmFtZXdvcmsvdXNlci1zcGFjZSB0cmlnZ2VycyBwb3dl
ci1zYXZlCj4+IGNvbmZpZyhpdyBkZXYgPGRldm5hbWU+IHNldCBwb3dlcl9zYXZlIG9uL29mZiku
IFRoZW4gZG9pbmcgdGhpcyBmcm9tCj4+IHVzZXItc3BhY2Ugd2lsbCBiZSB1bm5lY2Vzc2FyaWx5
IHRvZ2dsaW5nIHRoaXMgY29uZmlnIG9yIG1heSBub3QgYmUKPj4gc2V0dGluZyBhdCBkaXNjb25u
ZWN0ZWQgc3RhdGUuCj4gSSB0aGluayB0aGF0ICdzZXQgcG93ZXJfc2F2ZScgY29tbWFuZHMgYWZm
ZWN0cyBzdHJ1Y3QKPiBpZWVlODAyMTFfYnNzX2NvbmY6OnBzIHBhcmFtZXRlciBhbmQgSSBkb24n
dCB0aGluayBpdCBzaG91bGQgYmUgdXNlZCBpbgo+IHRoaXMgY2FzZS4gV2UgYWxyZWFkeSBoYXZl
IGF0aDEwa19jb25maWdfcHMoKSBmb3IgODAyLjExIGxldmVsIG9mIHBvd2VyCj4gc2F2aW5nLgo+
Cj4gQXJlbmQgYWdhaW4gcHJvcG9zZWQgcnVudGltZS1wbSB3aXRoIHdoaWNoIEknbSBub3QgdmVy
eSBmYW1pbGlhci4gQnV0Cj4gd2h5IHdvdWxkIHdlIHdhbnQgdG8gZGlzYWJsZSB0aGlzPyBEb2Vz
bid0IGl0IG1ha2Ugc2Vuc2UgdG8gaGF2ZSB0aGlzCj4gZmVhdHVyZSBhbHdheXMgZW5hYmxlZCB0
byBzYXZlIHBvd2VyPyB3Y24zOTkwIGlzIGEgY2hpcCBmb3IgYSBtb2JpbGUKPiBkZXZpY2UgYW55
d2F5LgppdCBtaWdodCBiZSBtYWRlIGZvciBtb2JpbGUgZGV2aWNlcyBidXQgd2hvIGtub3dzIGhv
dyBpdCBpcyB1c2VkIGJ5IHRoZSAKbWFya2V0LgoKU2ViYXN0aWFuCj4KCi0tIApNaXQgZnJldW5k
bGljaGVuIEdyw7xzc2VuIC8gUmVnYXJkcwoKU2ViYXN0aWFuIEdvdHRzY2hhbGwgLyBDVE8KCk5l
d01lZGlhLU5FVCBHbWJIIC0gREQtV1JUCkZpcm1lbnNpdHo6ICBTdHViZW53YWxkYWxsZWUgMjFh
LCA2NDYyNSBCZW5zaGVpbQpSZWdpc3RlcmdlcmljaHQ6IEFtdHNnZXJpY2h0IERhcm1zdGFkdCwg
SFJCIDI1NDczCkdlc2Now6RmdHNmw7xocmVyOiBQZXRlciBTdGVpbmjDpHVzZXIsIENocmlzdGlh
biBTY2hlZWxlCmh0dHA6Ly93d3cuZGQtd3J0LmNvbQplbWFpbDogcy5nb3R0c2NoYWxsQGRkLXdy
dC5jb20KVGVsLjogKzQ5NjI1MS01ODI2NTAgLyBGYXg6ICs0OTYyNTEtNTgyNjU2NQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5n
IGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
