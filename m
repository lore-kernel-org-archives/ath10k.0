Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hArul-0006DY-0o
 for ath10k@lists.infradead.org; Mon, 01 Apr 2019 08:03:33 +0000
Received: from mail-pg1-f199.google.com ([209.85.215.199])
 by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.76) (envelope-from <kai.heng.feng@canonical.com>)
 id 1hAruh-00066k-BF
 for ath10k@lists.infradead.org; Mon, 01 Apr 2019 08:03:27 +0000
Received: by mail-pg1-f199.google.com with SMTP id h14so2954046pgn.23
 for <ath10k@lists.infradead.org>; Mon, 01 Apr 2019 01:03:27 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.8\))
Subject: Re: Ath10k on XPS 9380 regularly disconnects
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <8ACA9157-127E-43B8-ADD0-28D9EBBCEEB0@canonical.com>
Date: Mon, 1 Apr 2019 16:03:21 +0800
Message-Id: <BD07B681-0083-4537-87D2-099F7152C51F@canonical.com>
References: <042C2903-585B-47BA-8657-8819D225EEA8@canonical.com>
 <87pnqknonc.fsf@codeaurora.org>
 <8ACA9157-127E-43B8-ADD0-28D9EBBCEEB0@canonical.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"; DelSp="yes"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, Anthony Wong <anthony.wong@canonical.com>, ath10k@lists.infradead.org, Stephan Fabel <stephan.fabel@canonical.com>

SGkgS2FsbGUsCgphdCAyMzo0MywgS2FpLUhlbmcgRmVuZyA8a2FpLmhlbmcuZmVuZ0BjYW5vbmlj
YWwuY29tPiB3cm90ZToKCj4gYXQgMDE6MDUsIEthbGxlIFZhbG8gPGt2YWxvQGNvZGVhdXJvcmEu
b3JnPiB3cm90ZToKPgo+PiArIGF0aDEwayBsaXN0Cj4+IC0gbmV0ZGV2ICYgbGludXgta2VybmVs
Cj4+Cj4+IEthaS1IZW5nIEZlbmcgPGthaS5oZW5nLmZlbmdAY2Fub25pY2FsLmNvbT4gd3JpdGVz
Ogo+Pgo+Pj4gVGhlcmXigJlzIGFuIGlzc3VlIHRoYXQgYXRoMTBrIGRpc2Nvbm5lY3RzIGF0IHJl
Z3VsYXIgYmFzaXMgWzFdLCBvbgo+Pj4gTGludXgga2VybmVsIDQuMTguCj4+Pgo+Pj4gVW5mb3J0
dW5hdGVseSBJIGNhbuKAmXQgcmVwcm9kdWNlIHRoZSBpc3N1ZSBvbiBYUFMgOTM4MCBhdCBteSBo
YW5kLgo+Pj4KPj4+IElzIHRoZXJlIGFscmVhZHkgYSBmaXggaW4gdXBzdHJlYW0ga2VybmVsPwo+
Pgo+PiBJJ20gbm90IGF3YXJlIG9mIGFueSBmaXhlcyByZWxhdGVkIHRvIHRoaXMuIElzIHRoaXMg
YSByZWdyZXNzaW9uPyBJbgo+PiBvdGhlciB3b3JkcywgaXMgdGhlcmUgYSBrbm93biB2ZXJzaW9u
IG9mIGF0aDEwayBvciBmaXJtd2FyZSB3aGljaCBkaWRuJ3QKPj4gaGF2ZSB0aGlzIHByb2JsZW0/
Cj4KPiBXZSBrbm93IHRoaXMgaXNzdWUgaGFwcGVuIG9uIGtlcm5lbCB2NC4xNSBhbmQgdjQuMTgs
IGJ1dCBrZXJuZWxzIGJlZm9yZSAgCj4gdjQuMTUgd2VyZSBub3QgdGVzdGVkLgo+Cj4gVGhlIGlz
c3VlIGhhcHBlbnMgd2l0aCBHb29nbGUgTWVzaCwgd2hpY2ggaGFzIDgwMi4xMWFjIGNhcGFiaWxp
dHkuCj4KPiBJIGhhdmVu4oCZdCBiZWVuIGFibGUgdG8gcmVwcm9kdWNlIHRoZSBpc3N1ZSB3aXRo
IGFuIDgwMi4xMW4gcm91dGVyICh5ZXQpLgoKRG8gSSBuZWVkIGEgc3BlY2lhbCBXaUZpIHJvdXRl
ciB3aGljaCBzdXBwb3J0IFJYIHJlb3JkZXIgdG8gcmVwcm9kdWNlIHRoZSAgCmlzc3VlPwoKSXQn
cyBpbnRyb2R1Y2VkIGJ5IGNvbW1pdCBjNTQ1MDcwZTQwNGIgKOKAnGF0aDEwazogaW1wbGVtZW50
IHJ4IHJlb3JkZXIgIApzdXBwb3J04oCdKS4KCkthaS1IZW5nCgo+Cj4gS2FpLUhlbmcKPgo+Pj4g
WzFdIGh0dHBzOi8vYnVncy5sYXVuY2hwYWQubmV0L2J1Z3MvMTgxODg4MQo+Pgo+PiBSZWxldmFu
dCBpbmZvcm1hdGlvbiBmcm9tIGRtZXNnOgo+Pgo+PiBbICAgMTkuMzQ2ODEwXSBhdGgxMGtfcGNp
IDAwMDA6MDI6MDAuMDogcWNhNjE3NCBodzMuMiB0YXJnZXQgMHgwNTAzMDAwMCAgCj4+IGNoaXBf
aWQgMHgwMDM0MGFmZiBzdWIgMWE1NjoxNDNhCj4+IFsgICAxOS4zNDY4MTJdIGF0aDEwa19wY2kg
MDAwMDowMjowMC4wOiBrY29uZmlnIGRlYnVnIDAgZGVidWdmcyAxICAKPj4gdHJhY2luZyAxIGRm
cyAwIHRlc3Rtb2RlIDAKPj4gWyAgIDE5LjM0NzEzNl0gYXRoMTBrX3BjaSAwMDAwOjAyOjAwLjA6
IGZpcm13YXJlIHZlciAgCj4+IFdMQU4uUk0uNC40LjEtMDAxMzItUUNBUk1TV1AtMSBhcGkgNiBm
ZWF0dXJlcyB3b3dsYW4saWdub3JlLW90cCxtZnAgIAo+PiBjcmMzMiA3OWY0ZGI4Ngo+Pgo+PiBb
Li4uXQo+Pgo+PiBbNzc0NTEuMzM4MzM5XSBXQVJOSU5HOiBDUFU6IDQgUElEOiAwIGF0ICAKPj4g
L2J1aWxkL2xpbnV4LWh3ZS05S0owN3EvbGludXgtaHdlLTQuMTguMC9kcml2ZXJzL25ldC93aXJl
bGVzcy9hdGgvYXRoMTBrL2h0dF9yeC5jOjQ2ICAKPj4gYXRoMTBrX2h0dF9yeF9wb3BfcGFkZHIu
aXNyYS4yOSsweGQ5LzB4ZjAgW2F0aDEwa19jb3JlXQo+Pgo+PiBbLi4uXQo+Pgo+PiBbODEyNTQu
ODU3NjY3XSBXQVJOSU5HOiBDUFU6IDEgUElEOiAwIGF0ICAKPj4gL2J1aWxkL2xpbnV4LWh3ZS05
S0owN3EvbGludXgtaHdlLTQuMTguMC9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL2h0
dF9yeC5jOjQ2ICAKPj4gYXRoMTBrX2h0dF9yeF9wb3BfcGFkZHIuaXNyYS4yOSsweGQ5LzB4ZjAg
W2F0aDEwa19jb3JlXQo+Pgo+PiBbLi4uXQo+Pgo+PiBbODEzOTAuMTg2MTY3XSBXQVJOSU5HOiBD
UFU6IDIgUElEOiAwIGF0ICAKPj4gL2J1aWxkL2xpbnV4LWh3ZS05S0owN3EvbGludXgtaHdlLTQu
MTguMC9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL2h0dF9yeC5jOjQ2ICAKPj4gYXRo
MTBrX2h0dF9yeF9wb3BfcGFkZHIuaXNyYS4yOSsweGQ5LzB4ZjAgW2F0aDEwa19jb3JlXQo+Pgo+
PiAtLSAKPj4gS2FsbGUgVmFsbwoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
