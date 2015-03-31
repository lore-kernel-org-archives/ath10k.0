Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x231.google.com ([2a00:1450:400c:c05::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YctY9-0001BS-9E
 for ath10k@lists.infradead.org; Tue, 31 Mar 2015 10:37:37 +0000
Received: by wibgn9 with SMTP id gn9so20323531wib.1
 for <ath10k@lists.infradead.org>; Tue, 31 Mar 2015 03:37:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87iodi318p.fsf@kamboji.qca.qualcomm.com>
References: <1427200993-7550-1-git-send-email-michal.kazior@tieto.com>
 <1427200993-7550-3-git-send-email-michal.kazior@tieto.com>
 <87iodi318p.fsf@kamboji.qca.qualcomm.com>
Date: Tue, 31 Mar 2015 12:37:15 +0200
Message-ID: <CA+BoTQkouPcREDVpKx=iKs05aeoAUv8Qj-keO3FPVdOyojyDnQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/7] ath10k: implement chanctx API
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

T24gMzAgTWFyY2ggMjAxNSBhdCAxODoyMSwgS2FsbGUgVmFsbyA8a3ZhbG9AcWNhLnF1YWxjb21t
LmNvbT4gd3JvdGU6Cj4gTWljaGFsIEthemlvciA8bWljaGFsLmthemlvckB0aWV0by5jb20+IHdy
aXRlczoKPgo+PiBUaGUgY2hhbmN0eCBBUEkgd2lsbCBhbGxvdyBhdGgxMGsgdG8gc3VwcG9ydAo+
PiBtdWx0aS1jaGFubmVsIG9wZXJhdGlvbi4KPj4KPj4gU2lnbmVkLW9mZi1ieTogTWljaGFsIEth
emlvciA8bWljaGFsLmthemlvckB0aWV0by5jb20+Cj4KPiBrYnVpbGQgcmVwb3J0czoKPgo+IHNw
YXJzZSB3YXJuaW5nczogKG5ldyBvbmVzIHByZWZpeGVkIGJ5ID4+KQo+Cj4+PiBkcml2ZXJzL25l
dC93aXJlbGVzcy9hdGgvYXRoMTBrL21hYy5oOjcyOjU3OiBzcGFyc2U6IGluY29ycmVjdCB0eXBl
IGluIGluaXRpYWxpemVyIChkaWZmZXJlbnQgYWRkcmVzcyBzcGFjZXMpCj4gICAgZHJpdmVycy9u
ZXQvd2lyZWxlc3MvYXRoL2F0aDEway9tYWMuaDo3Mjo1NzogICAgZXhwZWN0ZWQgc3RydWN0IGll
ZWU4MDIxMV9jaGFuY3R4X2NvbmYgKmNvbmYKPiAgICBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgv
YXRoMTBrL21hYy5oOjcyOjU3OiAgICBnb3Qgc3RydWN0IGllZWU4MDIxMV9jaGFuY3R4X2NvbmYg
W25vZGVyZWZdIDxhc246ND4qY2hhbmN0eF9jb25mCj4+PiBkcml2ZXJzL25ldC93aXJlbGVzcy9h
dGgvYXRoMTBrL21hYy5oOjcyOjU3OiBzcGFyc2U6IGluY29ycmVjdCB0eXBlIGluIGluaXRpYWxp
emVyIChkaWZmZXJlbnQgYWRkcmVzcyBzcGFjZXMpClsuLi5dCgpUaGFua3MgZm9yIGNhdGNoaW5n
IHRoaXMhIEkndmUgc2VudCBhIHY2LgoKQnR3LiBJJ20gcHV6emxlZCB3aHkgbXkgc3BhcnNlIGlz
bid0IGhlbHBmdWwgbGlrZSB0aGlzLiBJZGVhcz8KCgpNaWNoYcWCCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEw
a0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vYXRoMTBrCg==
