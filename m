Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173]
 helo=mail3.candelatech.com)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSjdt-0004ep-Ud
 for ath10k@lists.infradead.org; Thu, 07 Nov 2019 15:24:15 +0000
Subject: Re: [PATCH net-next] ath10k: fix RX of frames with broken FCS in
 monitor mode
References: <20191105164932.11799-1-linus.luessing@c0d3.blue>
 <927cea69-7afc-5c35-df8d-9813392e8928@candelatech.com>
 <20191107140149.GB19482@otheros>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <6ca7e338-d14d-49f6-f51c-600856b59767@candelatech.com>
Date: Thu, 7 Nov 2019 07:24:06 -0800
MIME-Version: 1.0
In-Reply-To: <20191107140149.GB19482@otheros>
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
To: =?UTF-8?Q?Linus_L=c3=bcssing?= <linus.luessing@c0d3.blue>
Cc: =?UTF-8?Q?Linus_L=c3=bcssing?= <ll@simonwunderlich.de>, Simon Wunderlich <sw@simonwunderlich.de>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, "David S . Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>

CgpPbiAxMS8wNy8yMDE5IDA2OjAzIEFNLCBMaW51cyBMw7xzc2luZyB3cm90ZToKPiBPbiBUdWUs
IE5vdiAwNSwgMjAxOSBhdCAwOToxOToyMEFNIC0wODAwLCBCZW4gR3JlZWFyIHdyb3RlOgo+PiBU
aGFua3MgZm9yIGFkZGluZyB0aGUgY291bnRlci4gIFNpbmNlIGl0IHVzIHUzMiwgSSBkb3VidCB5
b3UgbmVlZCB0aGUgc3BpbiBsb2NrCj4+IGJlbG93Pwo+Cj4gT2ssIEkgY2FuIHJlbW92ZSB0aGUg
c3Bpbi1sb2NrLgo+Cj4gSnVzdCBmb3IgY2xhcmlmaWNhdGlvbiB0aG91Z2gsIGlmIEkgcmVjYWxs
IGNvcnJlY3RseSB0aGVuIGFuIGluY3JlbWVudCBvcGVyYXRvcgo+IGlzIG5vdCBndWFyYW50ZWVk
IHRvIHdvcmsgYXRvbWljYWxseS4gQnV0IHlvdSB0aGluayBpdCdzIHVubGlrZWx5Cj4gdG8gcmFj
ZSB3aXRoIGEgY29uY3VycmVudCArKyBhbmQgdGhlcmVmb3JlIGl0J3MgZmluZSBmb3IganVzdCBh
IGRlYnVnIGNvdW50ZXI/Cj4gKGFuZCBpZiBpdCB3ZXJlIHJhY2luZywgaXQnZCBqdXN0IGJlIGEg
bWlzc2VkICsxKQoKSSB0aGluayBpdCBpcyBmaW5lIHRvIGJlIG9mZi1ieS1vbmUsIGFuZCB1MzIg
aXMgYXRvbWljIHNvIHlvdSB3b3VsZCBuZXZlciByZWFkIGEgcmVhbGx5CndlaXJkIG51bWJlciwg
bGlrZSB5b3UgY2FuIGlmIHU2NCBpcyBub24tYXRvbWljYWxseSBiZWluZyBpbmNyZW1lbnRlZC4K
ClRoYW5rcywKQmVuCgoKLS0gCkJlbiBHcmVlYXIgPGdyZWVhcmJAY2FuZGVsYXRlY2guY29tPgpD
YW5kZWxhIFRlY2hub2xvZ2llcyBJbmMgIGh0dHA6Ly93d3cuY2FuZGVsYXRlY2guY29tCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGlu
ZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
