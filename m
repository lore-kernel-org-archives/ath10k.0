Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iD073-0005Sb-II
 for ath10k@lists.infradead.org; Wed, 25 Sep 2019 05:45:19 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v2 3/5] ath10k: sdio: read RX packets in bundles
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20190417191503.18814-4-erik.stromdahl@gmail.com>
References: <20190417191503.18814-4-erik.stromdahl@gmail.com>
Message-Id: <20190925054517.11D3E611FA@smtp.codeaurora.org>
Date: Wed, 25 Sep 2019 05:45:17 +0000 (UTC)
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
To: Erik Stromdahl <erik.stromdahl@gmail.com>
Cc: kvalo@qca.qualcomm.com, Alagu Sankar <alagusankar@silex-india.com>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

RXJpayBTdHJvbWRhaGwgPGVyaWsuc3Ryb21kYWhsQGdtYWlsLmNvbT4gd3JvdGU6Cgo+IEZyb206
IEFsYWd1IFNhbmthciA8YWxhZ3VzYW5rYXJAc2lsZXgtaW5kaWEuY29tPgo+IAo+IFRoZSBleGlz
dGluZyBpbXBsZW1lbnRhdGlvbiBvZiBpbml0aWF0aW5nIG11bHRpcGxlIHNkaW8gdHJhbnNmZXJz
IGZvcgo+IHJlY2VpdmUgYnVuZGxpbmcgaXMgc2xvd2luZyBkb3duIHRoZSByZWNlaXZlIHNwZWVk
Lgo+IAo+IEluc3RlYWQgb2YgaGF2aW5nIG9uZSBzZGlvIHRyYW5zZmVyIGZvciBlYWNoIHBhY2tl
dCBpbiB0aGUgYnVuZGxlLCB3ZQo+IHJlYWQgYWxsIHBhY2tldHMgaW4gb25lIHNkaW8gdHJhbnNm
ZXIuCj4gCj4gVGhpcyByZXN1bHRzIGluIHNpZ25pZmljYW50IHBlcmZvcm1hbmNlIGltcHJvdmVt
ZW50IG9uIHNvbWUgdGFyZ2V0cy4KPiAKPiBPbiBhbiBpbXg2ZGwgdG9nZXRoZXIgd2l0aCBhIFFD
QTkzNzcgU0RJTyBkZXZpY2UsIHRoZSBmb2xsb3dpbmcKPiBwZXJmb3JtYW5jZSBpbmNyZWFzZSB3
YXMgb2J0YWluZWQgd2l0aCBpcGVyZjoKPiAKPiBCZWZvcmU6Cj4gCj4gWyAgM10gIDAuMC0gMS4w
IHNlYyAgMy4zOCBNQnl0ZXMgIDI4LjMgTWJpdHMvc2VjCj4gCj4gQWZ0ZXI6Cj4gCj4gWyAgM10g
IDAuMC0gMS4wIHNlYyAgNy4xMiBNQnl0ZXMgIDU5LjggTWJpdHMvc2VjCj4gCj4gQ28tZGV2ZWxv
cGVkLWJ5OiBFcmlrIFN0cm9tZGFobCA8ZXJpay5zdHJvbWRhaGxAZ21haWwuY29tPgo+IFNpZ25l
ZC1vZmYtYnk6IEFsYWd1IFNhbmthciA8YWxhZ3VzYW5rYXJAc2lsZXgtaW5kaWEuY29tPgo+IFNp
Z25lZC1vZmYtYnk6IEVyaWsgU3Ryb21kYWhsIDxlcmlrLnN0cm9tZGFobEBnbWFpbC5jb20+CgpX
ZW4gaXMgd29ya2luZyBvbiB0aGlzOgoKW3Y1LDIvOF0gYXRoMTBrOiBlbmFibGUgUlggYnVuZGxl
IHJlY2VpdmUgZm9yIHNkaW/vv7wgMTExMzI2NjFkaWZmbWJveHNlcmllcwoKaHR0cHM6Ly9wYXRj
aHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMTEzMjY2MS8KClNvIEknbGwgZHJvcCB0aGlzIHZlcnNp
b24uIFBhdGNoIHNldCB0byBTdXBlcnNlZGVkLgoKLS0gCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5l
bC5vcmcvcGF0Y2gvMTA5MDYwMDUvCgpodHRwczovL3dpcmVsZXNzLndpa2kua2VybmVsLm9yZy9l
bi9kZXZlbG9wZXJzL2RvY3VtZW50YXRpb24vc3VibWl0dGluZ3BhdGNoZXMKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0
CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
