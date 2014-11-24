Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22e.google.com ([2a00:1450:400c:c05::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XsuEn-0000QX-Kr
 for ath10k@lists.infradead.org; Mon, 24 Nov 2014 14:03:34 +0000
Received: by mail-wi0-f174.google.com with SMTP id h11so5766585wiw.7
 for <ath10k@lists.infradead.org>; Mon, 24 Nov 2014 06:03:10 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <871tos7lo0.fsf@kamboji.qca.qualcomm.com>
References: <1416656922-6645-1-git-send-email-yanbol@qti.qualcomm.com>
 <871tos7lo0.fsf@kamboji.qca.qualcomm.com>
Date: Mon, 24 Nov 2014 15:03:10 +0100
Message-ID: <CA+BoTQmdK1fYaWmPAd4GswKR7dKErD5MA2DtrNRZLEc-dFTYLA@mail.gmail.com>
Subject: Re: [PATCH] ath10k: Add the target register access and memory dump
 debugfs interface
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: Yanbo Li <yanbol@qti.qualcomm.com>, Yanbo Li <dreamfly281@gmail.com>, linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMjQgTm92ZW1iZXIgMjAxNCBhdCAxNDo1MCwgS2FsbGUgVmFsbyA8a3ZhbG9AcWNhLnF1YWxj
b21tLmNvbT4gd3JvdGU6Cj4gWWFuYm8gTGkgPHlhbmJvbEBxdGkucXVhbGNvbW0uY29tPiB3cml0
ZXM6ClsuLi5dCj4+ICsgICAgIHNwaW5fbG9ja19iaCgmYXItPmRhdGFfbG9jayk7Cj4+ICsgICAg
IHJlZ19hZGRyID0gYXItPmRlYnVnLnJlZ19hZGRyOwo+PiArICAgICBzcGluX3VubG9ja19iaCgm
YXItPmRhdGFfbG9jayk7Cj4KPiBbLi4uXQo+Cj4+ICsgICAgIHNwaW5fbG9ja19iaCgmYXItPmRh
dGFfbG9jayk7Cj4+ICsgICAgIGFyLT5kZWJ1Zy5yZWdfYWRkciA9IHJlZ19hZGRyOwo+PiArICAg
ICBzcGluX3VubG9ja19iaCgmYXItPmRhdGFfbG9jayk7Cj4KPiBbLi4uXQo+Cj4+ICsgICAgIHNw
aW5fbG9ja19iaCgmYXItPmRhdGFfbG9jayk7Cj4+ICsgICAgIHJlZ19hZGRyID0gYXItPmRlYnVn
LnJlZ19hZGRyOwo+PiArICAgICBzcGluX3VubG9ja19iaCgmYXItPmRhdGFfbG9jayk7Cj4KPiBb
Li4uXQo+Cj4+ICsgICAgIHNwaW5fbG9ja19iaCgmYXItPmRhdGFfbG9jayk7Cj4+ICsgICAgIHJl
Z19hZGRyID0gYXItPmRlYnVnLnJlZ19hZGRyOwo+PiArICAgICBzcGluX3VubG9ja19iaCgmYXIt
PmRhdGFfbG9jayk7Cj4KPiBJIGFkbWl0IHRoYXQgSSdtIGZhciBmcm9tIGEgbG9ja2luZyBleHBl
cnQsIGJ1dCBkb2VzIHRoYXQgbWFrZSBhbnkKPiBkaWZmZXJlbmNlIGluIHRoZSBmdW5jdGlvbmFs
aXR5PwoKSSBpbWFnaW5lIHJlZ19hZGRyIGNvdWxkIGVuZCB1cCBuZWVkaW5nIDIgaW5zdHJ1Y3Rp
b25zIHRvIGJlIHNldCBvbgpzb21lIHdlaXJkIGFyY2hpdGVjdHVyZStjb21waWxlciBjb21iaW5h
dGlvbiBpbiB3aGljaCBjYXNlIGxvY2tpbmcgaXMKZGVzaXJlZC4gV2l0aCBtdWx0aXBsZSBhY2Nl
c3MgdG8gd3JpdGUgcmVnX2FkZHIgeW91IGNvdWxkIGVuZCB1cApyZWFkaW5nIGFuIGFkZHJlc3Mg
dGhhdCBlaXRoZXIgaXNuJ3QgdGhlIG9sZCBub3IgdGhlIG5ldyBvbmUuIFNob3VsZApiZSBoYXJt
bGVzcyB0aG91Z2ggYW5kIHlvdSBjb3VsZCBhcmd1ZSB0aGF0IHlvdSBzaG91bGRuJ3QgYWNjZXNz
IHRoZQpyZWdfYWRkciBkZWJ1Z2ZzIGZpbGUgc2ltdWx0YW5lb3VzbHkgaW4gdGhlIGZpcnN0IHBs
YWNlLiBNYXliZSBJJ20KanVzdCBvdmVyLWV4YWdnZXJhdGluZz8gOi0pCgoKTWljaGHFggoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxp
bmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
