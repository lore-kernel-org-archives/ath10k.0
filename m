Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fkDLD-0006l6-9j
 for ath10k@lists.infradead.org; Mon, 30 Jul 2018 18:56:24 +0000
Received: by mail-ed1-x541.google.com with SMTP id h4-v6so4553545edi.6
 for <ath10k@lists.infradead.org>; Mon, 30 Jul 2018 11:56:13 -0700 (PDT)
Subject: Re: [PATCH] ath10k: Limit available channels via DT
 ieee80211-freq-limit
References: <20180730153933.3771-1-sven.eckelmann@openmesh.com>
 <5B5F5EF2.2050100@broadcom.com>
From: Arend van Spriel <arend.vanspriel@broadcom.com>
Message-ID: <5B5F5F4A.3000302@broadcom.com>
Date: Mon, 30 Jul 2018 20:56:10 +0200
MIME-Version: 1.0
In-Reply-To: <5B5F5EF2.2050100@broadcom.com>
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
To: Sven Eckelmann <sven.eckelmann@openmesh.com>, ath10k@lists.infradead.org
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, linux-wireless@vger.kernel.org

T24gNy8zMC8yMDE4IDg6NTQgUE0sIEFyZW5kIHZhbiBTcHJpZWwgd3JvdGU6Cj4gKyBSYWZhxYIK
Pgo+IE9uIDcvMzAvMjAxOCA1OjM5IFBNLCBTdmVuIEVja2VsbWFubiB3cm90ZToKPj4gVHJpLWJh
bmQgZGV2aWNlcyAoMXggMi40R0h6ICsgMnggNUdIeikgb2Z0ZW4gaW5jb3Jwb3JhdGUgc3BlY2lh
bAo+PiBmaWx0ZXJzIGluCj4+IHRoZSBSWCBhbmQgVFggcGF0aC4gVGhlc2UgZmlsdGVyZWQgY2hh
bm5lbCBjYW4gaW4gdGhlb3J5IHN0aWxsIGJlIHVzZWQgYnkKPj4gdGhlIGhhcmR3YXJlIGJ1dCB0
aGUgc2lnbmFsIHN0cmVuZ3RoIGlzIHJlZHVjZWQgc28gbXVjaCB0aGF0IGl0IG1ha2VzIG5vCj4+
IHNlbnNlLgo+Pgo+PiBUaGVyZSBpcyBhbHJlYWR5IGEgRFQgcHJvcGVydHkgdG8gbGltaXQgdGhl
IGF2YWlsYWJsZSBjaGFubmVscyBidXQgYXRoMTBrCj4+IGhhcyB0byBtYW51YWxseSBjYWxsIHRo
aXMgZnVuY3Rpb25hbGl0eSB0byBsaW1pdCB0aGUgY3VycnJlbnRseSBzZXQgd2lwaHkKPj4gY2hh
bm5lbHMgZnVydGhlci4KPgo+IFdvbmRlcmluZyB3aGV0aGVyIHdlIGNhbiBjYWxsIGl0IGluIHdp
cGh5X3JlZ2lzdGVyKCkgbGlrZSBiZWxvdy4gTm90Cj4gc3VyZSB3aHkgd2UgZGlkIG5vdCBleHBs
b3JlIHRoYXQgd2l0aCB0aGUgaW50cm9kdWN0aW9uIG9mIGl0IGJ5IFJhZmHFgi4KPiBNYXliZSBo
ZSByZW1lbWJlcnMuIEkgZGlkIG5vdCBmaW5kIHNvbWV0aGluZyBpbiB0aGF0IGRpcmVjdGlvbiBp
bgo+IHBhdGNod29yaywgYnV0IG1heSBoYXZlIG1pc3NlZCBpdC4gSSBrbm93IG10NzYgZHJvcHMg
dGhlIGJhbmQgcmVmZXJlbmNlCj4gaWYgaXQgZW5kcyB1cCB3aXRoIGFsbCBjaGFubmVscyBkaXNh
YmxlZC4gTWF5YmUgdGhhdCB3YXMgdGhlIHJlYXNvbi4KClNvcnJ5IGZvciBzZW5kaW5nIHRoaXMg
dHdpY2UuIE15IHdpZmkgY29ubmVjdGlvbiB3YXMgcXVpcmt5LgoKR3IuIEF2UwoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxp
c3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
