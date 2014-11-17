Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x234.google.com ([2a00:1450:400c:c00::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XqNhX-0000gV-Qq
 for ath10k@lists.infradead.org; Mon, 17 Nov 2014 14:54:49 +0000
Received: by mail-wg0-f52.google.com with SMTP id a1so1410687wgh.11
 for <ath10k@lists.infradead.org>; Mon, 17 Nov 2014 06:54:24 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87ppclq4mu.fsf@kamboji.qca.qualcomm.com>
References: <1415110931-10945-1-git-send-email-michal.kazior@tieto.com>
 <1415110931-10945-5-git-send-email-michal.kazior@tieto.com>
 <87ppclq4mu.fsf@kamboji.qca.qualcomm.com>
Date: Mon, 17 Nov 2014 15:54:23 +0100
Message-ID: <CA+BoTQ=Ws0JGsVBd2J0fe2_JqAhCVpHmNkn10CJx6BCNG-r0cg@mail.gmail.com>
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

T24gMTcgTm92ZW1iZXIgMjAxNCAxNTozMiwgS2FsbGUgVmFsbyA8a3ZhbG9AcWNhLnF1YWxjb21t
LmNvbT4gd3JvdGU6Cj4gTWljaGFsIEthemlvciA8bWljaGFsLmthemlvckB0aWV0by5jb20+IHdy
aXRlczoKPgo+PiBUaGlzIGNyZWF0ZXMgYSBzaW5nbGUsIGNvbW1vbiBwYXRoIGZvciBNU0RVLAo+
PiBBLU1TRFUgYW5kIGZyYWdtZW50ZWQgUnguCj4+Cj4+IEhvcGVmdWxseSB0aGlzIHdpbGwgbWFr
ZSBpdCBlYXNpZXIgdG8gdW5kZXJzdGFuZAo+PiBSeCBwYXRoIGFuZCBtYWtlIGl0IGVhc2llciB0
byB3b3JrIHdpdGguCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IE1pY2hhbCBLYXppb3IgPG1pY2hhbC5r
YXppb3JAdGlldG8uY29tPgo+Cj4gVGhpcyBwYXRjaCBoYWQgZmV3IGNoZWNrcGF0Y2ggd2Fybmlu
Z3MuIEkgZml4ZWQgdGhlbSB3aXRoIHRoZSBmb2xkZWQKPiBwYXRjaCBhbmQgZnVsbCBwYXRjaCBo
ZXJlOgo+Cj4gaHR0cHM6Ly9naXRodWIuY29tL2t2YWxvL2F0aC9jb21taXQvNzFmYmQwN2Q0M2U1
NGY1ZjlmNDQyYmM1ZjJmNGY5ZWY4M2FlYWQ2MwoKVGhhbmtzIQoKWy4uLl0KPiBAQCAtMTEzMiw3
ICsxMTMzLDcgQEAgc3RhdGljIHZvaWQgYXRoMTBrX2h0dF9yeF9oX21wZHUoc3RydWN0IGF0aDEw
ayAqYXIsCj4gICAgICAgICBib29sIGhhc19mY3NfZXJyOwo+ICAgICAgICAgYm9vbCBoYXNfY3J5
cHRvX2VycjsKPiAgICAgICAgIGJvb2wgaGFzX3RraXBfZXJyOwo+IC0gICAgICAgYm9vbCBoYXNf
cGVlcl9pZHhfaW52YWxpZDsKPiArICAgICAgIGJvb2wgaGFzX2lkeF9pbnZhbGlkOwo+ICAgICAg
ICAgYm9vbCBpc19kZWNyeXB0ZWQ7CgpJIGRvbid0IHJlYWxseSBsaWtlIHRoZSBoYXNfaWR4X2lu
dmFsaWQuIFBlcmhhcHMgaGFzX3BlZXJfZXJyIGNvbnZleXMKYSBiaXQgbW9yZSBvZiB0aGUgb3Jp
Z2luYWwgbWVhbmluZz8KCkFzIG11Y2ggYXMgSSdkIGxpa2UgdG8gbGVhdmUgdGhlIG9yaWdpbmFs
IHZhciBuYW1lIEknZCBsaWtlIHRvIGJlCmNoZWNrcGF0Y2ggd2FybmluZyBmcmVlLiBTaWdoLi4K
CgpNaWNoYcWCCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
