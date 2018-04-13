Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f6z4M-0001DL-5S
 for ath10k@lists.infradead.org; Fri, 13 Apr 2018 13:48:51 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v2] ath10k: Implement get_expected_throughput callback
References: <1521814034-17880-1-git-send-email-akolli@codeaurora.org>
 <2322769.sx4MhzsvNg@bentobox>
 <7428dc3685e146dca147805b6a1bc5d2@codeaurora.org>
 <1580002.5HauTVtcdp@bentobox>
Date: Fri, 13 Apr 2018 16:48:34 +0300
In-Reply-To: <1580002.5HauTVtcdp@bentobox> (Sven Eckelmann's message of "Wed, 
 28 Mar 2018 08:37:57 +0200")
Message-ID: <87lgdrqkst.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
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
To: Sven Eckelmann <sven.eckelmann@openmesh.com>
Cc: Marek Lindner <mareklindner@neomailbox.ch>, Johannes Berg <johannes.berg@intel.com>, linux-wireless@vger.kernel.org, akolli@codeaurora.org, Antonio Quartulli <a@unstable.cc>, ath10k@lists.infradead.org, Felix Fietkau <nbd@nbd.name>

U3ZlbiBFY2tlbG1hbm4gPHN2ZW4uZWNrZWxtYW5uQG9wZW5tZXNoLmNvbT4gd3JpdGVzOgoKPiBP
biBNaXR0d29jaCwgMjguIE3DpHJ6IDIwMTggMTE6NDE6NTEgQ0VTVCBha29sbGlAY29kZWF1cm9y
YS5vcmcgd3JvdGU6Cj4gWy4uLl0KPj4gVGhlIHJhdGUgYXZlcmFnZSBhbmQgdGhyb3VnaHB1dCBh
cmUgcmVsYXRpdmUuIG5vPwo+Cj4gSW4gdGhlIHNlbnNlIHRoYXQgcmF0ZSBoYXMgYSB0ZW5kZW5j
eSB0byBhZmZlY3QgdGhlIGV4cGVjdGVkIHRocm91Z2hwdXQgLSB5ZXMuIAo+IEJ1dCBpdCBpcyBu
b3QgbGlrZSB0aGUgZXhwZWN0ZWQgdGhyb3VnaHB1dCBwZXJmZWN0bHkgY29ycmVsYXRlcyB3aXRo
IHRoZSByYXRlIAo+IGFuZCB5b3Ugb25seSBoYXZlIHRvIG11bHRpcGx5IHdpdGggYSBmYWN0b3Ig
WCAod2hpY2ggc2VlbXMgdG8gYmUgbWlzc2luZyBpbiAKPiB5b3VyIGNvZGUpIHRvIGdldCBmcm9t
IHJhdGUgdG8gZXhwZWN0ZWQgdGhyb3VnaHB1dC4gVGhlIGF2ZXJhZ2UgcGFja2V0IGxvc3MgCj4g
Zm9yIHRoaXMgc2VsZWN0ZWQgcmF0ZSwgaW50ZXJmcmFtZSBzcGFjaW5nIGFuZCB0aGUgYWdncmVn
YXRpb24gYXJlIGltcG9ydGFudCAKPiBmYWN0b3JzIGhlcmUgdG9vLgoKSSBkb3VidCB3ZSBjYW4g
Z2V0IHRoYXQgaW5mb3JtYXRpb24gZnJvbSB0aGUgZmlybXdhcmUgc28gc2hvdWxkIHdlIGp1c3QK
Z28gd2l0aCB0aGUgIm11bHRpcGxlIHdpdGggWCIgbWV0aG9kPyBXaGF0IHdvdWxkIGJlIGdvb2Qg
WD8KCj4gQnV0IG9mIGNvdXJzZSwgSSBjYW5ub3Qgc2F5IG11Y2ggYWJvdXQgaG93IHRoZSByYXRl
IGNvbnRyb2wgZnJvbSBRQ0Egd29ya3MgYW5kIAo+IGluIHdoaWNoIGZvcm0gdGhlc2UgaW5mb3Jt
YXRpb24gYXJlIGFscmVhZHkgYXZhaWxhYmxlLgo+Cj4gSWYgeW91IHdhbnQgdG8ga25vdyB0aGUg
YXZlcmFnZSBQSFkgcmF0ZSB0aGVuIHdvdWxkbid0IGl0IGJlIGJldHRlciB0byByZXBvcnQgCj4g
dGhlIHJhdGVzIHRvIG9uZSBvZiB0aGUgdXBwZXIgbGF5ZXJzIGFuZCBsZXQgdGhlbSB0byB0aGUg
YXZlcmFnaW5nPyBTaW1pbGFyIHRvIAo+IHdoYXQgdGhlcmUgYWxyZWFkeSBpcyBmb3IgTkw4MDIx
MV9TVEFfSU5GT19DSEFJTl9TSUdOQUwgCj4gKE5MODAyMTFfU1RBX0lORk9fQ0hBSU5fU0lHTkFM
X0FWRykganVzdCBmb3IgTkw4MDIxMV9TVEFfSU5GT19UWF9CSVRSQVRFLwo+IE5MODAyMTFfU1RB
X0lORk9fUlhfQklUUkFURS4gTm90IHN1cmUgd2hldGhlciB0aGlzIG1ha2VzIHNlbnNlIG9yIHdo
ZXRoZXIgCj4gc29tZW9uZSBoYXMgYW4gdXNlLWNhc2UgZm9yIGl0LgoKU291bmRzIGxpa2UgYSBn
b29kIGlkZWEsIGJ1dCBJIGRvbid0IHNlZSBpdCBwcmV2ZW50aW5nIHRvIGFwcGx5IHRoaXMKcGF0
Y2guIFdlIGNhbiBhbHdheXMgY2hhbmdlIHRoZSBpbXBsZW1lbnRhdGlvbiBsYXRlciBhcyB0aGlz
IGlzIGp1c3QKY29tbXVuaWNhdGlvbiBiZXR3ZWVuIGF0aDEwayBhbmQgbWFjODAyMTEsIHJpZ2h0
PwoKLS0gCkthbGxlIFZhbG8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
