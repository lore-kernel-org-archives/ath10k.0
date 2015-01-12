Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22c.google.com ([2a00:1450:400c:c05::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YAf1M-0007WN-0z
 for ath10k@lists.infradead.org; Mon, 12 Jan 2015 13:27:04 +0000
Received: by mail-wi0-f172.google.com with SMTP id n3so14382363wiv.5
 for <ath10k@lists.infradead.org>; Mon, 12 Jan 2015 05:26:41 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87d26kdvt1.fsf@kamboji.qca.qualcomm.com>
References: <1420715550-16017-1-git-send-email-michal.kazior@tieto.com>
 <87d26kdvt1.fsf@kamboji.qca.qualcomm.com>
Date: Mon, 12 Jan 2015 14:26:34 +0100
Message-ID: <CA+BoTQ=3oY4hrotrNcNVP9AUMM1E_DayC25O0f_iD+oJ1d2LSQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] ath10k: implement beacon offload
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

T24gMTIgSmFudWFyeSAyMDE1IGF0IDEzOjMxLCBLYWxsZSBWYWxvIDxrdmFsb0BxY2EucXVhbGNv
bW0uY29tPiB3cm90ZToKPiBNaWNoYWwgS2F6aW9yIDxtaWNoYWwua2F6aW9yQHRpZXRvLmNvbT4g
d3JpdGVzOgpbLi4uXQo+PiBNaWNoYWwgS2F6aW9yICg1KToKPj4gICBhdGgxMGs6IGltcGxlbWVu
dCBuZXcgYmVhY29uIHR4IHN0YXR1cyBldmVudAo+PiAgIGF0aDEwazogaW1wbGVtZW50IGJlYWNv
biB0ZW1wbGF0ZSBjb21tYW5kCj4+ICAgYXRoMTBrOiBpbXBsZW1lbnQgcHJiIHRtcGwgd21pIGNv
bW1hbmQKPj4gICBhdGgxMGs6IGltcGxlbWVudCBwMnAgYmNuIGllIGNvbW1hbmQKPj4gICBhdGgx
MGs6IGltcGxlbWVudCBzdXBwb3J0IGZvciBhcCBiZWFjb24gb2ZmbG9hZGluZwo+Cj4gV2hpbGUg
YXBwbHlpbmcgdGhpcyBJIGhhZCBmZXcgdHJpdmlhbCBjb21taXRzIHdpdGggd21pIG9wcy4gQ2Fu
IHlvdQo+IGRvdWJsZSBjaGVjayBteSByZXNvbHV0aW9uIGZyb20gYXRoLW5leHQtdGVzdCwgcGxl
YXNlPyAoSXQgbWlnaHQgdGFrZSBhbgo+IGhvdXIgYmVmb3JlIEkgcHVzaCB0aGUgcGF0Y2hlcy4p
Cj4KPiBQdXNoaW5nIHBhdGNoICJhdGgxMGstaW1wbGVtZW50LW5ldy1iZWFjb24tdHgiIC4uLiBk
b25lCj4gUHVzaGluZyBwYXRjaCAiYXRoMTBrLWltcGxlbWVudC1iZWFjb24tdGVtcGxhIiAuLi4K
PiAgIENPTkZMSUNUIChjb250ZW50KTogTWVyZ2UgY29uZmxpY3QgaW4gZHJpdmVycy9uZXQvd2ly
ZWxlc3MvYXRoL2F0aDEway93bWkuYwo+ICAgQ09ORkxJQ1QgKGNvbnRlbnQpOiBNZXJnZSBjb25m
bGljdCBpbiBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL3dtaS10bHYuYwo+ICAgQ09O
RkxJQ1QgKGNvbnRlbnQpOiBNZXJnZSBjb25mbGljdCBpbiBkcml2ZXJzL25ldC93aXJlbGVzcy9h
dGgvYXRoMTBrL3dtaS1vcHMuaAo+IEVycm9yOiBUaGUgbWVyZ2UgZmFpbGVkIGR1cmluZyAicHVz
aCIuCj4gICAgICAgIFJldmVydCB0aGUgb3BlcmF0aW9uIHdpdGggInN0ZyB1bmRvIi4KPiBzdGcg
cmViYXNlOiAzIGNvbmZsaWN0KHMpCgpMb29rcyBnb29kLCB0aGFua3MhCgoKTWljaGHFggoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxp
bmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
