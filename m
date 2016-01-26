Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aO0re-0004Zf-7v
 for ath10k@lists.infradead.org; Tue, 26 Jan 2016 10:28:50 +0000
Received: by mail-wm0-x22d.google.com with SMTP id n5so122412029wmn.0
 for <ath10k@lists.infradead.org>; Tue, 26 Jan 2016 02:28:21 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CA+BoTQnOfc-obhJR7woqg1=ZWBeOEDSQsaXTF1-wqH8V-Z-eRg@mail.gmail.com>
References: <1453384006-31907-1-git-send-email-michal.kazior@tieto.com>
 <1453384006-31907-14-git-send-email-michal.kazior@tieto.com>
 <56A1182A.4060309@codeaurora.org>
 <CA+BoTQnOfc-obhJR7woqg1=ZWBeOEDSQsaXTF1-wqH8V-Z-eRg@mail.gmail.com>
Date: Tue, 26 Jan 2016 11:28:20 +0100
Message-ID: <CA+BoTQ=ujALZiD5njhd=4e6iASJpxUeL7Kh_Pe_1zbAe9hLYcw@mail.gmail.com>
Subject: Re: [PATCH 13/13] ath10k: implement push-pull tx
From: Michal Kazior <michal.kazior@tieto.com>
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
To: Peter Oh <poh@codeaurora.org>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMjIgSmFudWFyeSAyMDE2IGF0IDA4OjQ3LCBNaWNoYWwgS2F6aW9yIDxtaWNoYWwua2F6aW9y
QHRpZXRvLmNvbT4gd3JvdGU6Cj4gT24gMjEgSmFudWFyeSAyMDE2IGF0IDE4OjQwLCBQZXRlciBP
aCA8cG9oQGNvZGVhdXJvcmEub3JnPiB3cm90ZToKPj4gT24gMDEvMjEvMjAxNiAwNTo0NiBBTSwg
TWljaGFsIEthemlvciB3cm90ZToKWy4uLl0KPj4+ICAgLSAgICAgLyogVE9ETzogYXBwbHkgY29u
ZmlndXJhdGlvbiAqLwo+Pj4gKyAgICAgICByY3VfcmVhZF91bmxvY2soKTsKPj4+ICsKPj4+ICsg
ICAgICAgc3Bpbl9sb2NrX2JoKCZhci0+aHR0LnR4X2xvY2spOwo+Pj4gKyAgICAgICBhdGgxMGtf
bWFjX3R4X2xvY2soYXIsIEFUSDEwS19UWF9QQVVTRV9RX0ZMVVNIX1BFTkRJTkcpOwo+Pj4gKyAg
ICAgICBzcGluX3VubG9ja19iaCgmYXItPmh0dC50eF9sb2NrKTsKPj4+ICsKPj4KPj4gSXNuJ3Qg
aXQgcHJvdmVkIGl0IGJyZWFrIE1lc2ggZnJvbSB3b3JraW5nPwo+Cj4gWWVzLCBnb29kIHBvaW50
LiBJJ20gc3RpbGwgd29ya2luZyBvbiB0aGlzIC0gSSBzaG91bGQndmUgbWVudGlvbmVkCj4gdGhh
dCBpbiB0aGUgY292ZXIgbGV0dGVyLgo+Cj4gTm9uZXRoZWxlc3MgSSB3YW50ZWQgdG8gZ2V0IHRo
ZSByZXZpZXcgcHJvY2VzcyBnb2luZyBmb3IgdGhpcyBwYXRjaHNldC4KPgo+IEknbGwgYWRkcmVz
cyB0aGUgbWVzaCBwcm9ibGVtIGluIHYyLgoKRm9yIHRoZSByZWNvcmQgLSB0aGUgcHJvYmxlbSB0
dXJuZWQgb3V0IHRvIGJlIGEgYnVnIGluIG1hYzgwMjExIG1lc2gKZndkaW5nLCBzZWU6CgogIGh0
dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvODEwODcxMS8KCgpNaWNoYcWCCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGlu
ZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
