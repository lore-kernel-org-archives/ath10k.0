Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yzl1l-0008Dj-KZ
 for ath10k@lists.infradead.org; Tue, 02 Jun 2015 12:10:42 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2] ath10k: Debugfs entry to enable/disable WLAN&Blutooth
 Coexist feature
References: <1432840745-21725-1-git-send-email-yanbol@qca.qualcomm.com>
 <20150602113901.2da3542d@north>
Date: Tue, 2 Jun 2015 15:10:08 +0300
In-Reply-To: <20150602113901.2da3542d@north> ("Jakub =?utf-8?Q?Kici=C5=84s?=
 =?utf-8?Q?ki=22's?= message of "Tue, 2 Jun 2015 11:39:01 +0200")
Message-ID: <87bngyux9b.fsf@kamboji.qca.qualcomm.com>
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
To: Jakub =?utf-8?Q?Kici=C5=84ski?= <moorray3@wp.pl>
Cc: dreamfly281@gmail.com, Yanbo Li <yanbol@qca.qualcomm.com>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

SmFrdWIgS2ljacWEc2tpIDxtb29ycmF5M0B3cC5wbD4gd3JpdGVzOgoKPiBPbiBUaHUsIDI4IE1h
eSAyMDE1IDEyOjE5OjA1IC0wNzAwLCBZYW5ibyBMaSB3cm90ZToKPj4gQXMgc29tZSByYWRpbyBo
YXZlIG5vIGNvbm5lY3Rpb24gd2l0aCBCVCBtb2R1bGVzLCBlbmFibGUgdGhlIFdMQU4vQmx1ZXRv
b3RoCj4+IGNvZXhpc3QoQlRDKSBmZWF0dXJlIHdpbGwgaGFzIHNvbWUgc2lkZSBlZmZlY3QgaWYg
dGhlIHJhZGlvJ3MgR1BJTyBjb25uZWN0Cj4+IHdpdGggYW55IG90aGVyIEhXIG1vZHVsZXMuIEFk
ZCB0aGUgY29udHJvbCBzd2l0Y2hlciAiYnRjX2ZlYXR1cmUiIGF0Cj4+IGRlYnVnZnMgYW5kIHNl
dCB0aGUgZmVhdHVyZSBhcyBkaXNhYmxlIGJ5IGRlZmF1bHQgdG8gYXZvaWQgc3VjaCBjYXNlLgo+
Pgo+PiBUbyBlbmFibGUgdGhpcyBmZWF0dXJlLCBleGVjdXRlOgo+PiBlY2hvIDEgPiAvc3lzL2tl
cm5lbC9kZWJ1Zy9pZWVlODAyMTEvcGh5WC9hdGgxMGsvYnRjX2ZlYXR1cmUKPj4gVG8gZGlzYWJs
ZToKPj4gZWNobyAwID4gL3N5cy9rZXJuZWwvZGVidWcvaWVlZTgwMjExL3BoeVgvYXRoMTBrL2J0
Y19mZWF0dXJlCj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiBZYW5ibyBMaSA8eWFuYm9sQHFjYS5xdWFs
Y29tbS5jb20+Cj4KPiBJTUhPIGNvbW1vbiBBUEkgZm9yIGRpc2FibGluZy9lbmFibGluZyBidGNv
ZXggaXMgc29tZXRoaW5nIHdlIHdvdWxkIGFsbAo+IGJlbmVmaXQgZnJvbSBhbmQgZWFzeSBlbm91
Z2ggdG8gaW1wbGVtZW50IHByb3Blcmx5LiAgQnVyeWluZyBpdCBpbgo+IGRyaXZlci1zcGVjaWZp
YyBkZWJ1Z2ZzIGlzIGxlc3MgdGhhbiBhcHByb3ByaWF0ZS4KPgo+IEkgc2VlbSB0byByZWNhbGwg
dGhlcmUgd2VyZSBwbGFucyB0byBkaXNjdXNzIGJ0Y29leCBhdCBvbmUgb2YgdGhlCj4gbGludXgt
d2lyZWxlc3Mgc3VtbWl0cy4gIElmIHRoZSBjb25zZW5zdXMgd2FzIHRvIGxlYXZlIGl0IGluIGRl
YnVnZnMKPiB0aGVuIEkgYXBvbG9naXplIGZvciB0aGUgbm9pc2UgOykKCkkgYWdyZWUuIEkgZG9u
J3QgcmVjYWxsIGFueW1vcmUgdGhlIGRpc2N1c3Npb24gaW4gdGhlIHN1bW1pdCBidXQgSSB0aGlu
awp0aGF0IGFkZGluZyBidGNvZXggc3VwcG9ydCB0byBubDgwMjExIHdvdWxkIGJlIHRoZSByaWdo
dCB0aGluZyB0byBkby4KSXQncyBhIGNvbW1vbiBzZXR0aW5nIGZvciBtYW55IGRyaXZlcnMuIEJ1
dCBiZWZvcmUgd2UgaGF2ZSB0aGF0LCBhdGgxMGsKc3RpbGwgaGFzIHRvIHVzZSBkZWJ1Z2ZzLgoK
LS0gCkthbGxlIFZhbG8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
