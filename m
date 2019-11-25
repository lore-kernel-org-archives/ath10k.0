Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-55.smtp-out.us-west-2.amazonses.com ([54.240.27.55])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZDFq-00040p-Sc
 for ath10k@lists.infradead.org; Mon, 25 Nov 2019 12:14:12 +0000
MIME-Version: 1.0
Subject: Re: [PATCH net-next v2] ath10k: fix RX of frames with broken FCS in
 monitor mode
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20191115105612.8531-1-linus.luessing@c0d3.blue>
References: <20191115105612.8531-1-linus.luessing@c0d3.blue>
Message-ID: <0101016ea27bbb36-28d87d93-198a-4e07-abb4-fe4efc2b9614-000000@us-west-2.amazonses.com>
Date: Mon, 25 Nov 2019 12:14:08 +0000
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
To: =?utf-8?q?Linus_L=C3=BCssing?= <linus.luessing@c0d3.blue>
Cc: =?utf-8?q?Linus_L?==?utf-8?q?=C3=BCssing?= <ll@simonwunderlich.de>, Simon Wunderlich <sw@simonwunderlich.de>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Ben Greear <greearb@candelatech.com>, "David S . Miller" <davem@davemloft.net>

TGludXMgTMO8c3Npbmcgd3JvdGU6Cgo+IFNvIGZhciwgZnJhbWVzIHdlcmUgZm9yd2FyZGVkIHJl
Z2FyZGxlc3Mgb2YgdGhlIEZDUyBjb3JyZWN0bmVzcyBsZWFkaW5nCj4gdG8gdXNlcnNwYWNlIGFw
cGxpY2F0aW9ucyBsaXN0ZW5pbmcgb24gdGhlIG1vbml0b3IgbW9kZSBpbnRlcmZhY2UgdG8KPiBy
ZWNlaXZlIHBvdGVudGlhbGx5IGJyb2tlbiBmcmFtZXMsIGV2ZW4gd2l0aCB0aGUgImZjc2ZhaWwi
IGZsYWcgdW5zZXQuCj4gCj4gQnkgZGVmYXVsdCwgd2l0aCB0aGUgImZjc2ZhaWwiIGZsYWcgb2Yg
YSBtb25pdG9yIG1vZGUgaW50ZXJmYWNlCj4gdW5zZXQsIGZyYW1lcyB3aXRoIEZDUyBlcnJvcnMg
c2hvdWxkIGJlIGRyb3BwZWQuIFdpdGggdGhpcyBwYXRjaCwgdGhlCj4gZmNzZmFpbCBmbGFnIGlz
IHRha2VuIGludG8gYWNjb3VudCBjb3JyZWN0bHkuCj4gCj4gVGVzdGVkLW9uOiBRQ0E0MDE5IGZp
cm13YXJlLTUtY3QtZnVsbC1jb21tdW5pdHktMTIuYmluLWxlZGUuMDExCj4gCj4gQ2M6IFNpbW9u
IFd1bmRlcmxpY2ggPHN3QHNpbW9ud3VuZGVybGljaC5kZT4KPiBTaWduZWQtb2ZmLWJ5OiBMaW51
cyBMw7xzc2luZyA8bGxAc2ltb253dW5kZXJsaWNoLmRlPgo+IFNpZ25lZC1vZmYtYnk6IEthbGxl
IFZhbG8gPGt2YWxvQGNvZGVhdXJvcmEub3JnPgoKUGF0Y2ggYXBwbGllZCB0byBhdGgtbmV4dCBi
cmFuY2ggb2YgYXRoLmdpdCwgdGhhbmtzLgoKZWEwYzNlMmE0NzAyIGF0aDEwazogZml4IFJYIG9m
IGZyYW1lcyB3aXRoIGJyb2tlbiBGQ1MgaW4gbW9uaXRvciBtb2RlCgotLSAKaHR0cHM6Ly9wYXRj
aHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMTI0NjA0NS8KCmh0dHBzOi8vd2lyZWxlc3Mud2lraS5r
ZXJuZWwub3JnL2VuL2RldmVsb3BlcnMvZG9jdW1lbnRhdGlvbi9zdWJtaXR0aW5ncGF0Y2hlcwoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBt
YWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
