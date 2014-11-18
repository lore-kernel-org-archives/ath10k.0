Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x229.google.com ([2a00:1450:400c:c00::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XqcZ2-00004w-RP
 for ath10k@lists.infradead.org; Tue, 18 Nov 2014 06:47:01 +0000
Received: by mail-wg0-f41.google.com with SMTP id y19so7508603wgg.0
 for <ath10k@lists.infradead.org>; Mon, 17 Nov 2014 22:46:35 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87vbmdoo9q.fsf@kamboji.qca.qualcomm.com>
References: <1415110931-10945-1-git-send-email-michal.kazior@tieto.com>
 <1415110931-10945-5-git-send-email-michal.kazior@tieto.com>
 <87ppclq4mu.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQ=Ws0JGsVBd2J0fe2_JqAhCVpHmNkn10CJx6BCNG-r0cg@mail.gmail.com>
 <87vbmdoo9q.fsf@kamboji.qca.qualcomm.com>
Date: Tue, 18 Nov 2014 07:46:35 +0100
Message-ID: <CA+BoTQm1tzJhz7HtF941z8hrkOpyCpfJhqzmx1tifVFCMo=R1A@mail.gmail.com>
Subject: Re: [PATCH 4/7] ath10k: unify rx undecapping
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

T24gMTcgTm92ZW1iZXIgMjAxNCAxNjoxMSwgS2FsbGUgVmFsbyA8a3ZhbG9AcWNhLnF1YWxjb21t
LmNvbT4gd3JvdGU6Cj4gTWljaGFsIEthemlvciA8bWljaGFsLmthemlvckB0aWV0by5jb20+IHdy
aXRlczoKPj4gT24gMTcgTm92ZW1iZXIgMjAxNCAxNTozMiwgS2FsbGUgVmFsbyA8a3ZhbG9AcWNh
LnF1YWxjb21tLmNvbT4gd3JvdGU6ClsuLi5dCj4+PiBUaGlzIHBhdGNoIGhhZCBmZXcgY2hlY2tw
YXRjaCB3YXJuaW5ncy4gSSBmaXhlZCB0aGVtIHdpdGggdGhlIGZvbGRlZAo+Pj4gcGF0Y2ggYW5k
IGZ1bGwgcGF0Y2ggaGVyZToKPj4+Cj4+PiBodHRwczovL2dpdGh1Yi5jb20va3ZhbG8vYXRoL2Nv
bW1pdC83MWZiZDA3ZDQzZTU0ZjVmOWY0NDJiYzVmMmY0ZjllZjgzYWVhZDYzClsuLi5dCj4+PiBA
QCAtMTEzMiw3ICsxMTMzLDcgQEAgc3RhdGljIHZvaWQgYXRoMTBrX2h0dF9yeF9oX21wZHUoc3Ry
dWN0IGF0aDEwayAqYXIsCj4+PiAgICAgICAgIGJvb2wgaGFzX2Zjc19lcnI7Cj4+PiAgICAgICAg
IGJvb2wgaGFzX2NyeXB0b19lcnI7Cj4+PiAgICAgICAgIGJvb2wgaGFzX3RraXBfZXJyOwo+Pj4g
LSAgICAgICBib29sIGhhc19wZWVyX2lkeF9pbnZhbGlkOwo+Pj4gKyAgICAgICBib29sIGhhc19p
ZHhfaW52YWxpZDsKPj4+ICAgICAgICAgYm9vbCBpc19kZWNyeXB0ZWQ7Cj4+Cj4+IEkgZG9uJ3Qg
cmVhbGx5IGxpa2UgdGhlIGhhc19pZHhfaW52YWxpZC4gUGVyaGFwcyBoYXNfcGVlcl9lcnIgY29u
dmV5cwo+PiBhIGJpdCBtb3JlIG9mIHRoZSBvcmlnaW5hbCBtZWFuaW5nPwo+Cj4gV2hhdCBhYm91
dCBqdXN0IHBlZXJfaWR4X2ludmFsaWQ/IElNSE8gd2UgcmVhbGx5IGRvbid0IG5lZWQgdGhlIGhh
c18KPiBwcmVmaXggaW4gdGhhdCByZWxhdGl2ZWx5IHNtYWxsIGZ1bmN0aW9uLgoKR29vZCBwb2lu
dCBidXQgdGhlIGFzc2lnbm1lbnQgbGluZSB3aXRoIGBwZWVyX2lkeF9pbnZhbGlkYCB3aWxsIHN0
aWxsCmJlIG92ZXIgODAgY2hhcnMgbG9uZywgbm8/CgpTbyBwZXJoYXBzIGluc3RlYWQgb2YgZG9p
bmcgYHJ4ZC0+YXR0ZW50aW9uLmZsYWdzICYKX19jcHVfdG9fbGUzMihGTEFHKWAgaXQgY291bGQg
YmUgYGF0dGVudGlvbiA9Cl9fbGUzMl90b19jcHUocnhkLT5hdHRlbnRpb24uZmxhZ3MpYCBhbmQg
dGhlbiBgYXR0ZW50aW9uICYgRkxBR2AgPwpUaGlzIHdheSBpdCBzaG91bGRuJ3QgZXhjZWVkIHRo
ZSA4MCBjaGFyIGxpbWl0IGFuZCB2YXIgbmFtZXMgd29uJ3QKbmVlZCB0byBiZSBjaGFuZ2VkLiBI
b3BlZnVsbHkgY29tcGlsZXIgd2lsbCBvcHRpbWl6ZSBpdCBhd2F5LgoKCk1pY2hhxYIKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5n
IGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
