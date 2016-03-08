Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x22f.google.com ([2a00:1450:400c:c09::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1adGwi-0000Eo-0G
 for ath10k@lists.infradead.org; Tue, 08 Mar 2016 12:41:06 +0000
Received: by mail-wm0-x22f.google.com with SMTP id l68so129592478wml.0
 for <ath10k@lists.infradead.org>; Tue, 08 Mar 2016 04:40:43 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1457438096-20071-1-git-send-email-rmanohar@qti.qualcomm.com>
References: <1457438096-20071-1-git-send-email-rmanohar@qti.qualcomm.com>
Date: Tue, 8 Mar 2016 13:40:41 +0100
Message-ID: <CA+BoTQ=Huzf7WoXMXcyj8yrykrJOd5BMc1EnmccqZgt7M1M_uA@mail.gmail.com>
Subject: Re: [PATCH v3] ath10k: move mgmt descriptor limit handle under mgmt_tx
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
To: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, Rajkumar Manoharan <rmanohar@codeaurora.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gOCBNYXJjaCAyMDE2IGF0IDEyOjU0LCBSYWprdW1hciBNYW5vaGFyYW4gPHJtYW5vaGFyQHF0
aS5xdWFsY29tbS5jb20+IHdyb3RlOgpbLi4uXQo+ICtpbnQgYXRoMTBrX2h0dF90eF9tZ210X2lu
Y19wZW5kaW5nKHN0cnVjdCBhdGgxMGtfaHR0ICpodHQsIGJvb2wgaXNfbWdtdCwKPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJvb2wgaXNfcHJlc3ApCj4gIHsKPiAgICAgICAg
IHN0cnVjdCBhdGgxMGsgKmFyID0gaHR0LT5hcjsKPgo+ICAgICAgICAgbG9ja2RlcF9hc3NlcnRf
aGVsZCgmaHR0LT50eF9sb2NrKTsKPgo+ICsgICAgICAgaWYgKCFpc19tZ210KQo+ICsgICAgICAg
ICAgICAgICByZXR1cm4gMDsKPiArCgo+ICAgICAgICAgaWYgKGh0dC0+bnVtX3BlbmRpbmdfdHgg
Pj0gaHR0LT5tYXhfbnVtX3BlbmRpbmdfdHgpCj4gICAgICAgICAgICAgICAgIHJldHVybiAtRUJV
U1k7CgpUaGlzIGJ1c3kgaGVyZSB3aWxsIGJlIGhpdCB3aGVuIHlvdSB1c2UgbGFzdCB0eCBzbG90
IGJlY2F1c2UKdHhfaW5jX3BlbmRpbmcoKSBpcyBjYWxsZWQgYmVmb3JlIHR4X21nbXRfaW5jX3Bl
bmRpbmcoKS4KCgpbLi4uXQo+ICAgICAgICAgc2tiX2NiID0gQVRIMTBLX1NLQl9DQihtc2R1KTsK
PiAgICAgICAgIHR4cSA9IHNrYl9jYi0+dHhxOwo+ICAgICAgICAgYXJ0eHEgPSAodm9pZCAqKXR4
cS0+ZHJ2X3ByaXY7Cj4KPiAtICAgICAgIGlmICh1bmxpa2VseShza2JfY2ItPmZsYWdzICYgQVRI
MTBLX1NLQl9GX01HTVQpICYmCj4gLSAgICAgICAgICAgYXItPmh3X3BhcmFtcy5tYXhfcHJvYmVf
cmVzcF9kZXNjX3RocmVzKQo+IC0gICAgICAgICAgICAgICBsaW1pdF9tZ210X2Rlc2MgPSB0cnVl
Owo+IC0KCk9oIHdhaXQuLiBJIGRpZG4ndCBwYXkgYXR0ZW50aW9uIGJlZm9yZSwgYnV0IHRoaXMg
bG9va3MgcmF0aGVyIHVnbHkuCldpdGggdGhpcyB5b3Ugd2lsbCBhY3R1YWxseSBtYWtlIHRoZSBu
dW1fcGVuZGluZ19tZ210X3R4IHNwaW4KZW5kbGVzc2x5IHVwd2FyZHMgb24gZmlybXdhcmUgd2l0
aCBIVFQgMy4wIChhbmQgdXNlcyBUWF9GUk0gZm9yIG1nbXQKdHggYW5kIFRYX0NPTVBMX0lORCBm
b3IgY29tcGxldGlvbnMpLCBubz8KCgpNaWNoYcWCCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
YXRoMTBrCg==
