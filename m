Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aO8wJ-0007l4-Kn
 for ath10k@lists.infradead.org; Tue, 26 Jan 2016 19:06:08 +0000
Message-ID: <56A7C2ED.4010809@codeaurora.org>
Date: Tue, 26 Jan 2016 11:03:09 -0800
From: Peter Oh <poh@codeaurora.org>
MIME-Version: 1.0
Subject: Re: [PATCH 13/13] ath10k: implement push-pull tx
References: <1453384006-31907-1-git-send-email-michal.kazior@tieto.com>	<1453384006-31907-14-git-send-email-michal.kazior@tieto.com>	<56A1182A.4060309@codeaurora.org>	<CA+BoTQnOfc-obhJR7woqg1=ZWBeOEDSQsaXTF1-wqH8V-Z-eRg@mail.gmail.com>
 <CA+BoTQ=ujALZiD5njhd=4e6iASJpxUeL7Kh_Pe_1zbAe9hLYcw@mail.gmail.com>
In-Reply-To: <CA+BoTQ=ujALZiD5njhd=4e6iASJpxUeL7Kh_Pe_1zbAe9hLYcw@mail.gmail.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org

Ck9uIDAxLzI2LzIwMTYgMDI6MjggQU0sIE1pY2hhbCBLYXppb3Igd3JvdGU6Cj4gT24gMjIgSmFu
dWFyeSAyMDE2IGF0IDA4OjQ3LCBNaWNoYWwgS2F6aW9yIDxtaWNoYWwua2F6aW9yQHRpZXRvLmNv
bT4gd3JvdGU6Cj4+IE9uIDIxIEphbnVhcnkgMjAxNiBhdCAxODo0MCwgUGV0ZXIgT2ggPHBvaEBj
b2RlYXVyb3JhLm9yZz4gd3JvdGU6Cj4+PiBPbiAwMS8yMS8yMDE2IDA1OjQ2IEFNLCBNaWNoYWwg
S2F6aW9yIHdyb3RlOgo+IFsuLi5dCj4+Pj4gICAgLSAgICAgLyogVE9ETzogYXBwbHkgY29uZmln
dXJhdGlvbiAqLwo+Pj4+ICsgICAgICAgcmN1X3JlYWRfdW5sb2NrKCk7Cj4+Pj4gKwo+Pj4+ICsg
ICAgICAgc3Bpbl9sb2NrX2JoKCZhci0+aHR0LnR4X2xvY2spOwo+Pj4+ICsgICAgICAgYXRoMTBr
X21hY190eF9sb2NrKGFyLCBBVEgxMEtfVFhfUEFVU0VfUV9GTFVTSF9QRU5ESU5HKTsKPj4+PiAr
ICAgICAgIHNwaW5fdW5sb2NrX2JoKCZhci0+aHR0LnR4X2xvY2spOwo+Pj4+ICsKPj4+IElzbid0
IGl0IHByb3ZlZCBpdCBicmVhayBNZXNoIGZyb20gd29ya2luZz8KPj4gWWVzLCBnb29kIHBvaW50
LiBJJ20gc3RpbGwgd29ya2luZyBvbiB0aGlzIC0gSSBzaG91bGQndmUgbWVudGlvbmVkCj4+IHRo
YXQgaW4gdGhlIGNvdmVyIGxldHRlci4KPj4KPj4gTm9uZXRoZWxlc3MgSSB3YW50ZWQgdG8gZ2V0
IHRoZSByZXZpZXcgcHJvY2VzcyBnb2luZyBmb3IgdGhpcyBwYXRjaHNldC4KPj4KPj4gSSdsbCBh
ZGRyZXNzIHRoZSBtZXNoIHByb2JsZW0gaW4gdjIuCj4gRm9yIHRoZSByZWNvcmQgLSB0aGUgcHJv
YmxlbSB0dXJuZWQgb3V0IHRvIGJlIGEgYnVnIGluIG1hYzgwMjExIG1lc2gKPiBmd2RpbmcsIHNl
ZToKPgo+ICAgIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvODEwODcxMS8KSSd2
ZSB2ZXJpZmllZCB0aGF0IHRoZSBwYXRjaCBmaXhlZCB0aGUgbWVzaCBpc3N1ZS4KVGhhbmsgeW91
IE1pY2hhbC4KPgo+Cj4gTWljaGHFggoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
