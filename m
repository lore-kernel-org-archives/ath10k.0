Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x233.google.com ([2a00:1450:400c:c05::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XtBxv-00011h-9i
 for ath10k@lists.infradead.org; Tue, 25 Nov 2014 08:59:19 +0000
Received: by mail-wi0-f179.google.com with SMTP id ex7so630651wid.12
 for <ath10k@lists.infradead.org>; Tue, 25 Nov 2014 00:58:57 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87vbm31xno.fsf@kamboji.qca.qualcomm.com>
References: <20141124164037.29422.14033.stgit@potku.adurom.net>
 <20141124164159.29422.98462.stgit@potku.adurom.net>
 <87vbm31xno.fsf@kamboji.qca.qualcomm.com>
Date: Tue, 25 Nov 2014 09:58:57 +0100
Message-ID: <CA+BoTQmZ=xa=z3237E55cejfOOZM3GYp8OstJobF7NHe=8wTHA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ath10k: add register access debugfs interface
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

T24gMjUgTm92ZW1iZXIgMjAxNCBhdCAwOTozOSwgS2FsbGUgVmFsbyA8a3ZhbG9AcWNhLnF1YWxj
b21tLmNvbT4gd3JvdGU6Cj4gS2FsbGUgVmFsbyA8a3ZhbG9AcWNhLnF1YWxjb21tLmNvbT4gd3Jp
dGVzOgo+Cj4+ICtzdGF0aWMgc3NpemVfdCBhdGgxMGtfcmVnX3ZhbHVlX3JlYWQoc3RydWN0IGZp
bGUgKmZpbGUsCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY2hhciBfX3Vz
ZXIgKnVzZXJfYnVmLAo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNpemVf
dCBjb3VudCwgbG9mZl90ICpwcG9zKQo+PiArewo+PiArICAgICBzdHJ1Y3QgYXRoMTBrICphciA9
IGZpbGUtPnByaXZhdGVfZGF0YTsKPj4gKyAgICAgdTggYnVmWzQ4XTsKPj4gKyAgICAgdW5zaWdu
ZWQgaW50IGxlbjsKPj4gKyAgICAgdTMyIHJlZ19hZGRyLCByZWdfdmFsOwo+PiArCj4+ICsgICAg
IHNwaW5fbG9ja19iaCgmYXItPmRhdGFfbG9jayk7Cj4+ICsgICAgIHJlZ19hZGRyID0gYXItPmRl
YnVnLnJlZ19hZGRyOwo+PiArICAgICBzcGluX3VubG9ja19iaCgmYXItPmRhdGFfbG9jayk7Cj4+
ICsKPj4gKyAgICAgcmVnX3ZhbCA9IGF0aDEwa19oaWZfcmVhZDMyKGFyLCByZWdfYWRkcik7Cj4+
ICsgICAgIGxlbiA9IHNjbnByaW50ZihidWYsIHNpemVvZihidWYpLCAiMHglMDh4OjB4JTA4eFxu
IiwgcmVnX2FkZHIsIHJlZ192YWwpOwo+PiArCj4+ICsgICAgIHJldHVybiBzaW1wbGVfcmVhZF9m
cm9tX2J1ZmZlcih1c2VyX2J1ZiwgY291bnQsIHBwb3MsIGJ1ZiwgbGVuKTsKPj4gK30KPgo+IEkg
anVzdCByZWFsaXNlZCB0aGF0IHdlIG5lZWQgdG8gY2hlY2sgYXItPnN0YXRlIHRvIG1ha2Ugc3Vy
ZSB0aGF0Cj4gZmlybXdhcmUgaXMgcnVubmluZy4gQmVjYXVzZSBvZiB0aGF0IEknbGwgbmVlZCB0
byBjaGFuZ2UgdGhlIGRhdGFfbG9jawo+IHRvIGNvbmZfbXV0ZXggYXMgd2VsbC4KCkhtbS4uIEl0
IGNvdWxkIGFjdHVhbGx5IHdvcmsgd2l0aG91dCBmaXJtd2FyZSBydW5uaW5nLiBJdCBqdXN0IHJl
YWRzIE1NSU8uCgpUaGUgcHJvYmxlbSBJIHNlZSBub3cgaXMgdGhlIHRhcmdldCBtYXkgbm90IGJl
IGF3YWtlIChCYXJ0b3N6IHJlY2VudGx5CmZpeGVkIHN1c3BlbmQgYnVnIGJ5IG1vdmluZyBhdGgx
MGtfcGNpX3dha2Uvc2xlZXAgYmFjayB0bwpoaWZfcG93ZXJfdXApIGFuZCBhY2Nlc3NpbmcgdGFy
Z2V0IHJlZ2lzdGVycyB3aXRob3V0IGl0IGJlaW5nIGZ1bGx5CmF3YWtlIGNhbiBsZWFkIHRvIGhv
c3QgbWVtb3J5IGNvcnJ1cHRpb24uIEkgZ3Vlc3MgYXItPnN0YXRlIHdpbGwgZG8KZm9yIG5vdyBi
ZWNhdXNlIGdldHRpbmcgdGhpcyB0byB3b3JrIG90aGVyd2lzZSBpcyBnb2luZyB0byBiZSBhIGxp
dHRsZQp0cmlja3kuCgoKTWljaGHFggoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
