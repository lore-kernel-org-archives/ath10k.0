Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fKty1-0002xQ-SI
 for ath10k@lists.infradead.org; Mon, 21 May 2018 23:11:51 +0000
MIME-Version: 1.0
Date: Mon, 21 May 2018 16:11:38 -0700
From: Rajkumar Manoharan <rmanohar@codeaurora.org>
Subject: Re: [PATCH v2] ath10k: transmit queued frames after waking queues
In-Reply-To: <20180521204359.23884-1-niklas.cassel@linaro.org>
References: <20180521204359.23884-1-niklas.cassel@linaro.org>
Message-ID: <8195be7603a8cd659d25a9c3d898b891@codeaurora.org>
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
To: Niklas Cassel <niklas.cassel@linaro.org>
Cc: linux-wireless-owner@vger.kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Kalle Valo <kvalo@qca.qualcomm.com>, "David S. Miller" <davem@davemloft.net>

T24gMjAxOC0wNS0yMSAxMzo0MywgTmlrbGFzIENhc3NlbCB3cm90ZToKPiBUaGUgZm9sbG93aW5n
IHByb2JsZW0gd2FzIG9ic2VydmVkIHdoZW4gcnVubmluZyBpcGVyZjoKWy4uLl0KPiAKPiBJbiBv
cmRlciB0byBhdm9pZCB0cnlpbmcgdG8gZmx1c2ggdGhlIHF1ZXVlIGV2ZXJ5IHRpbWUgd2UgZnJl
ZSBhIGZyYW1lLAo+IG9ubHkgZG8gdGhpcyB3aGVuIHRoZXJlIGFyZSAzIG9yIGxlc3MgZnJhbWVz
IHBlbmRpbmcsIGFuZCB3aGlsZSB3ZQo+IGFjdHVhbGx5IGhhdmUgZnJhbWVzIGluIHRoZSBxdWV1
ZS4gVGhpcyBsb2dpYyB3YXMgY29waWVkIGZyb20KPiBtdDc2X3R4cV9zY2hlZHVsZSAobXQ3Niks
IG9uZSBvZiBmZXcgb3RoZXIgZHJpdmVycyB0aGF0IGFyZSBhY3R1YWxseQo+IHVzaW5nIHdha2Vf
dHhfcXVldWUuCj4gCj4gU3VnZ2VzdGVkLWJ5OiBUb2tlIEjDuGlsYW5kLUrDuHJnZW5zZW4gPHRv
a2VAdG9rZS5kaz4KPiBTaWduZWQtb2ZmLWJ5OiBOaWtsYXMgQ2Fzc2VsIDxuaWtsYXMuY2Fzc2Vs
QGxpbmFyby5vcmc+Cj4gLS0tCj4gQ2hhbmdlcyBzaW5jZSBWMTogdXNlIFJFQURfT05DRSgpIHRv
IGRpc2FsbG93IHRoZSBjb21waWxlcgo+IG9wdGltaXppbmcgdGhpbmdzIGluIHVuZGVzaXJhYmxl
IHdheXMuCj4gCj4gIGRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvdHhyeC5jIHwgMyAr
KysKPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL3R4cnguYwo+IGIvZHJpdmVycy9uZXQvd2ly
ZWxlc3MvYXRoL2F0aDEway90eHJ4LmMKPiBpbmRleCBjZGExNjRmNmU5ZjYuLjI2NGNmMGJkNWMw
MCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL3R4cnguYwo+
ICsrKyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvdHhyeC5jCj4gQEAgLTk1LDYg
Kzk1LDkgQEAgaW50IGF0aDEwa190eHJ4X3R4X3VucmVmKHN0cnVjdCBhdGgxMGtfaHR0ICpodHQs
Cj4gIAkJd2FrZV91cCgmaHR0LT5lbXB0eV90eF93cSk7Cj4gIAlzcGluX3VubG9ja19iaCgmaHR0
LT50eF9sb2NrKTsKPiAKPiArCWlmIChSRUFEX09OQ0UoaHR0LT5udW1fcGVuZGluZ190eCkgPD0g
MyAmJiAhbGlzdF9lbXB0eSgmYXItPnR4cXMpKQo+ICsJCWF0aDEwa19tYWNfdHhfcHVzaF9wZW5k
aW5nKGFyKTsKPiArCk5pa2xhcywKClNvcnJ5IGZvciB0aGUgbGF0ZSByZXNwb25zZS4gYXRoMTBr
X21hY190eF9wdXNoX3BlbmRpbmcgaXMgYWxyZWFkeSAKY2FsbGVkCmF0IHRoZSBlbmQgb2YgTkFQ
SSBoYW5kbGVyLiBJc24ndCB0aGF0IGVub3VnaCB0byBwcm9jZXNzIHBlbmRpbmcgZnJhbWVzPwoK
RWFybGllciB3ZSBvYnNlcnZlZCBwZXJmb3JtYW5jZSBpc3N1ZXMgaW4gY2FsbGluZyBwdXNoX3Bl
bmRpbmcgZnJvbSBlYWNoCnR4IGNvbXBsZXRpb24uIElNSE8gdGhpcyBjaGFuZ2UgbWF5IGludHJv
ZHVjZSB0aGUgc2FtZSBwcm9ibGVtIGFnYWluLgoKLVJhamt1bWFyCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEw
a0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vYXRoMTBrCg==
