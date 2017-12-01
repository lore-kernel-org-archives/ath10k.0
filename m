Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from [2001:470:dc45:1000::1] (helo=mail.toke.dk)
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eKlZb-0008S1-1T
 for ath10k@lists.infradead.org; Fri, 01 Dec 2017 13:41:48 +0000
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Subject: Re: [PATCH 2/2] ath10k: add per peer tx stats support for 10.2.4
In-Reply-To: <5080a68538fd2d883e15bacaa969661b@codeaurora.org>
References: <1512046701-14435-1-git-send-email-akolli@qti.qualcomm.com>
 <1512046701-14435-3-git-send-email-akolli@qti.qualcomm.com>
 <87k1y7zqtj.fsf@kamboji.qca.qualcomm.com>
 <DAB5EBB8-C820-4056-8AAB-063D05F38BD5@toke.dk>
 <87bmjjzppd.fsf@kamboji.qca.qualcomm.com>
 <5080a68538fd2d883e15bacaa969661b@codeaurora.org>
Date: Fri, 01 Dec 2017 14:41:13 +0100
Message-ID: <87r2se36rq.fsf@toke.dk>
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
To: akolli@codeaurora.org, Kalle Valo <kvalo@qca.qualcomm.com>
Cc: linux-wireless-owner@vger.kernel.org, Anilkumar Kolli <akolli@qti.qualcomm.com>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

YWtvbGxpQGNvZGVhdXJvcmEub3JnIHdyaXRlczoKCj4gT24gMjAxNy0xMS0zMCAyMjowOCwgS2Fs
bGUgVmFsbyB3cm90ZToKPj4gVG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2VuIDx0b2tlQHRva2UuZGs+
IHdyaXRlczoKPj4gCj4+Pj4+ICtzdHJ1Y3QgYXRoMTBrXzEwXzJfcGVlcl90eF9zdGF0cyB7Cj4+
Pj4+ICsJdTggcmF0ZWNvZGVbUEVFUl9TVEFUU19GT1JfTk9fT0ZfUFBEVVNdOwo+Pj4+PiArCXU4
IHN1Y2Nlc3NfcGt0c1tQRUVSX1NUQVRTX0ZPUl9OT19PRl9QUERVU107Cj4+Pj4+ICsJX19sZTE2
IHN1Y2Nlc3NfYnl0ZXNbUEVFUl9TVEFUU19GT1JfTk9fT0ZfUFBEVVNdOwo+Pj4+PiArCXU4IHJl
dHJ5X3BrdHNbUEVFUl9TVEFUU19GT1JfTk9fT0ZfUFBEVVNdOwo+Pj4+PiArCV9fbGUxNiByZXRy
eV9ieXRlc1tQRUVSX1NUQVRTX0ZPUl9OT19PRl9QUERVU107Cj4+Pj4+ICsJdTggZmFpbGVkX3Br
dHNbUEVFUl9TVEFUU19GT1JfTk9fT0ZfUFBEVVNdOwo+Pj4+PiArCV9fbGUxNiBmYWlsZWRfYnl0
ZXNbUEVFUl9TVEFUU19GT1JfTk9fT0ZfUFBEVVNdOwo+Pj4+PiArCXU4IGZsYWdzW1BFRVJfU1RB
VFNfRk9SX05PX09GX1BQRFVTXTsKPj4+Pj4gKwlfX2xlMzIgdHhfZHVyYXRpb247Cj4+Pj4+ICsJ
dTggdHhfcHBkdV9jbnQ7Cj4+Pj4+ICsJdTggcGVlcl9pZDsKPj4+Pj4gK30gX19wYWNrZWQ7Cj4+
Pj4gCj4+Pj4gVG9rZSwgaG9wZWZ1bGx5IHRoZSB0eF9kdXJhdGlvbiB2YWx1ZSBoZXJlIGhlbHBz
IHdpdGggQVRGCj4+Pj4gaW1wbGVtZW50YXRpb24KPj4+PiB1c2luZyBRQ0E5ODhYLgo+Pj4gCj4+
PiBBd2Vzb21lISBXaGF0J3MgdGhlIHNlbWFudGljcyBvZiB0aGlzIGZpZWxkPyBKdXN0IHRvdGFs
Cj4+PiBkdXJhdGlvbiBzcGVudCBzZXJ2aW5nIHRoYXQgc3RhdGlvbiBpbiB0aGUgcmVwb3J0aW5n
IGludGVydmFsPwo+Pj4gRG9lcyBpdCBpbmNsdWRlIHJldHJ5IGF0dGVtcHRzPwo+PiAKPj4gSSBo
YXZlIG5vIGNsdWUgOikgSSBqdXN0IG5vdGljZWQgdGhpcyB3aGlsZSBJIHdhcyByZXZpZXdpbmcg
dGhlIHBhdGNoCj4+IGludGVybmFsbHkgYW5kIGltbWVkaWF0ZWx5IHJlY2FsbGVkIG91ciBkaXNj
dXNzaW9ucyBhdCBTZW91bC4gSSBjYW4gdHJ5Cj4+IHRvIGZpbmQgb3V0LCBidXQgdGhhdCB3aWxs
IHRha2UgYSBsb25nIHRpbWUgYXMgSSBoYXZlIHdheSB0b28gbXVjaCAKPj4gc3R1ZmYKPj4gcGVu
ZGluZyBhdCB0aGUgbW9tZW50LiBIb3BlZnVsbHkgc29tZW9uZSBtb3JlIGtub3dsZWRnZWFibGUg
Cj4+IChBbmlsa3VtYXI/KQo+PiBjYW4gY2hpbWUgaW4gYW5kIGhlbHAuCj4KPiB0eF9kdXJhdGlv
biBpcyBhZ2dyZWdhdGUgdGltZSBkdXJhdGlvbiBvZiA0IFBQRFUgc2VudCB0byBTVEEuCj4gRlcg
c2VuZHMgdGhlc2UgdmFsdWVzIGZvciByZXRyeSBwYWNrZXRzIGFsc28uCgpHcmVhdCwgdGhhdCBz
b3VuZHMgbGlrZSBqdXN0IHdoYXQgd2UgbmVlZC4gVGhhbmtzIGZvciB0aGUgcG9pbnRlciA6KQoK
LVRva2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0
aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
