Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtps.newmedia-net.de ([2a05:a1c0:0:de::167]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gM3Yt-0001Dr-Sq
 for ath10k@lists.infradead.org; Mon, 12 Nov 2018 04:10:57 +0000
Subject: Re: [EXTERNAL] Re: [PATCH] ath10k: Disable 4addr source port learning
 in 10.4 FW by default
From: Sebastian Gottschall <s.gottschall@newmedia-net.de>
References: <20181109061121.4184-1-murugana@codeaurora.org>
 <0d74b002-e36d-8169-34e8-59338eac6918@newmedia-net.de>
 <00fd01d4798e$1c0d2f10$54278d30$@codeaurora.org>
 <18df2020-f8c4-b9f7-cf9c-63802ea02429@newmedia-net.de>
Message-ID: <cc8040a6-47f8-c8f0-0451-2e220d91d62c@newmedia-net.de>
Date: Mon, 12 Nov 2018 05:10:33 +0100
MIME-Version: 1.0
In-Reply-To: <18df2020-f8c4-b9f7-cf9c-63802ea02429@newmedia-net.de>
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
To: murugana@codeaurora.org, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

aSB0ZXN0ZWQgbXkgcHJvcG9zYWwgbm93IGFuZCBpdCBmaXhlcyB0aGUgaXNzdWUuIHRoZSBzdWJt
aXR0ZWQgcGF0Y2ggd2FzIApzaW1wbHkgYnJva2VuIGF0IHRoYXQgc21hbGwgcG9pbnQKCkFtIDEy
LjExLjIwMTggdW0gMDM6NDQgc2NocmllYiBTZWJhc3RpYW4gR290dHNjaGFsbDoKPiBoaW50IGZv
ciBhIHBvc3NpYmxlIGZpeAo+Cj4KPiBkaXNhYmxlXzRhZGRyX3NyY19scm4gaXMgbm90IHNldCBp
biAxMF80IHZkZXYgcGFyYW1ldGVyIG1hcC4gc28gdGhpcyAKPiBmZWF0dXJlIGNhbm5vdCB3b3Jr
Cj4KPgo+IC0tLSB3bWkuY8KgwqDCoMKgwqDCoCAoUmV2aXNpb24gNDIxNCkKPiArKysgd21pLmPC
oMKgwqDCoMKgwqAgKEFyYmVpdHNrb3BpZSkKPiBAQCAtOTcyLDYgKzk3Miw3IEBACj4gwqDCoMKg
wqDCoMKgwqAgLm1lcnVfdmMgPSBXTUlfVkRFVl9QQVJBTV9VTlNVUFBPUlRFRCwKPiDCoMKgwqDC
oMKgwqDCoCAucnhfZGVjYXBfdHlwZSA9IFdNSV9WREVWX1BBUkFNX1VOU1VQUE9SVEVELAo+IMKg
wqDCoMKgwqDCoMKgIC5id19uc3NfcmF0ZW1hc2sgPSBXTUlfVkRFVl9QQVJBTV9VTlNVUFBPUlRF
RCwKPiArwqDCoMKgwqDCoMKgIC5kaXNhYmxlXzRhZGRyX3NyY19scm4gPSBXTUlfVkRFVl9QQVJB
TV9VTlNVUFBPUlRFRCwKPiDCoH07Cj4KPiDCoHN0YXRpYyBzdHJ1Y3Qgd21pX3ZkZXZfcGFyYW1f
bWFwIHdtaV8xMF80X3ZkZXZfcGFyYW1fbWFwID0gewo+IEBAIC0xMDQ5LDYgKzEwNTAsNyBAQAo+
IMKgwqDCoMKgwqDCoMKgIC5id19uc3NfcmF0ZW1hc2sgPSBXTUlfMTBfNF9WREVWX1BBUkFNX0JX
X05TU19SQVRFTUFTSywKPiDCoMKgwqDCoMKgwqDCoCAuaW5jX3RzZiA9IFdNSV8xMF80X1ZERVZf
UEFSQU1fVFNGX0lOQ1JFTUVOVCwKPiDCoMKgwqDCoMKgwqDCoCAuZGVjX3RzZiA9IFdNSV8xMF80
X1ZERVZfUEFSQU1fVFNGX0RFQ1JFTUVOVCwKPiArwqDCoMKgwqDCoMKgIC5kaXNhYmxlXzRhZGRy
X3NyY19scm4gPSAKPiBXTUlfMTBfNF9WREVWX1BBUkFNX0RJU0FCTEVfNF9BRERSX1NSQ19MUk4s
Cj4gwqB9Owo+Cj4gQW0gMTEuMTEuMjAxOCB1bSAwODoxMyBzY2hyaWViIG11cnVnYW5hQGNvZGVh
dXJvcmEub3JnOgo+PiBIaSBTZWJhc3RpYW4sCj4+Cj4+PiBhZnRlciB0ZXN0ZWQgMiBXRFMgZGV2
aWNlcyAob25lIFdEUyBBUCwgb25lIFdEUyBTVEEpIHdpdGggOTk4NCAobmV0Z2Vhcgo+Pj4gcjc4
MDApIGkgZm91bmQgb3V0IHRoYXQgdGhlIGlzc3VlIHBlcnNpc3RzLiBndGsgcmVrZXlpbmcgZmFp
bHMsIHNvIAo+Pj4gZGlzY29ubmVjdCBhbmQKPj4+IHJlY29ubmVjdCBhZnRlciA2MCBtaW51dGVz
Lgo+PiBBcmUgeW91IHVzaW5nIHRoZSBsYXRlc3QgRlcgMTAuNC0zLjYuMC4xLTAwMDAzIGZvciA5
OTg0ICggbWFpbmx5IG9uIAo+PiB0aGUgQVAgc2lkZSApID8KPj4KPj4gKGh0dHBzOi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2Zpcm13YXJlL2xpbnV4LWZpcm13YXJl
LmdpdC9jb21taXQvP2lkPWEwMGU2MWI5MjAzMTg2NTYxZGM5MGRlMWZmN2VkNGQ1ZjVlOTIwZDUp
IAo+Pgo+Pgo+PiBUaGFua3MsCj4+IFNhdGhpc2hrdW1hcgo+Pgo+Pgo+PgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAph
dGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2F0aDEwawo=
