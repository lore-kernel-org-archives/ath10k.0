Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-bk0-x234.google.com ([2a00:1450:4008:c01::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WG7GY-0000In-E9
 for ath10k@lists.infradead.org; Wed, 19 Feb 2014 13:32:47 +0000
Received: by mail-bk0-f52.google.com with SMTP id e11so205580bkh.11
 for <ath10k@lists.infradead.org>; Wed, 19 Feb 2014 05:32:21 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87y517xo7j.fsf@kamboji.qca.qualcomm.com>
References: <1392629563-31046-1-git-send-email-michal.kazior@tieto.com>
 <1392629563-31046-4-git-send-email-michal.kazior@tieto.com>
 <87y517xo7j.fsf@kamboji.qca.qualcomm.com>
Date: Wed, 19 Feb 2014 14:25:59 +0100
Message-ID: <CA+BoTQm3werwtNrWVLBFxN5QOvLxucu0crDXdAJJj4X0gSnXrw@mail.gmail.com>
Subject: Re: [RFC/RFT 3/7] ath10k: replace send_head() with tx_sg()
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMTkgRmVicnVhcnkgMjAxNCAxMzo0OCwgS2FsbGUgVmFsbyA8a3ZhbG9AcWNhLnF1YWxjb21t
LmNvbT4gd3JvdGU6Cj4gTWljaGFsIEthemlvciA8bWljaGFsLmthemlvckB0aWV0by5jb20+IHdy
aXRlczoKPgo+PiBQQ0kgaXMgY2FwYWJsZSBvZiBoYW5kbGluZyBzY2F0dGVyLWdhdGhlciBsaXN0
cy4KPj4gVGhpcyBjYW4gYmUgdXNlZCB0byBhdm9pZCBjb3B5aW5nIG1lbW9yeS4KPj4KPj4gQ2hh
bmdlIHRoZSBuYW1lIG9mIHRoZSBjYWxsYmFjayB3aGlsZSBhdCB0bwo+PiByZWZsZWN0IGl0cyBw
dXJwb3NlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWwgS2F6aW9yIDxtaWNoYWwua2F6aW9y
QHRpZXRvLmNvbT4KPgo+IFsuLi5dCj4KPj4gK3N0cnVjdCBhdGgxMGtfaGlmX3NnX2l0ZW0gewo+
PiArICAgICB1MTYgdHJhbnNmZXJfaWQ7Cj4+ICsgICAgIHZvaWQgKnRyYW5zZmVyX2NvbnRleHQ7
Cj4+ICsgICAgIHZvaWQgKnZhZGRyOyAvKiBmb3IgZGVidWdnaW5nIG1vc3RseSAqLwo+PiArICAg
ICB1MzIgcGFkZHI7Cj4+ICsgICAgIHUxNiBsZW47Cj4+ICt9Owo+Cj4gVGhpcyBpcyB0aGUgcGFy
dCBJIGRvbid0IGxpa2UuIEluc3RlYWQgb2YgYWRkaW5nIG91ciBvd24gc3RydWN0cyB3ZQo+IGlu
c3RlYWQgc2hvdWxkIGhhdmUgZXZlcnl0aGluZyBpbiBza2ItPmNiIGFuZCBwYXNzIHRoZSBza2Jz
IGFyb3VuZC4gVGhlCj4gc2FkIHBhcnQgd2FzIHRoYXQgbGFzdCBmYWxsIEkgd2FzIHdvcmtpbmcg
b24gY2xlYW5pbmcgdXAgdGhhdCBidXQgbmV2ZXIKPiBmb3VuZCB0aGUgdGltZSB0byBmaW5pc2gg
aXQgOigKClRoZXJlJ3Mgc2ltcGx5IG5vdCBlbm91Z2ggcm9vbSB0byBrZWVwIGl0IGFsbCBpbiBh
dGgxMGtfc2tiX2NiCmRpcmVjdGx5LiBJdCBkb2Vzbid0IHJlYWxseSBtYWtlIGFueSBzZW5zZSB0
byBrZWVwIGl0IHRoZXJlIGFueXdheQpiZWNhdXNlIHNnX2l0ZW0gaXMgdXNlZCBhcyBtZWFucyB0
byBwYXNzIGEgY29tcGxleCBmdW5jdGlvbiBhcmd1bWVudAp0byBzZ190eCgpLiBUaGUgc2dfaXRl
bSBsaXN0IGlzIG5ldmVyIHVzZWQgYWdhaW4uCgoKTWljaGHFggoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2F0aDEwawo=
