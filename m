Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22d.google.com ([2a00:1450:400c:c05::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZJwYT-0003ZZ-9R
 for ath10k@lists.infradead.org; Tue, 28 Jul 2015 04:31:54 +0000
Received: by wibxm9 with SMTP id xm9so138963124wib.0
 for <ath10k@lists.infradead.org>; Mon, 27 Jul 2015 21:31:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAMQd7mbWC7rj8-eU7Jv21ehT8KrpC=L=xWxzDQxHEU_ePNSdUg@mail.gmail.com>
References: <CAMQd7mbWC7rj8-eU7Jv21ehT8KrpC=L=xWxzDQxHEU_ePNSdUg@mail.gmail.com>
Date: Tue, 28 Jul 2015 06:31:27 +0200
Message-ID: <CA+BoTQmd0Uoi=2MNMsDXYe1yKsYa3P8uvVzWwXoMynQGtjeD4w@mail.gmail.com>
Subject: Re: QCA6174 hw2.1 irq_mode=0 broken on 4.2-rc3, working on 4.1.2
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
To: Enrico Tagliavini <enrico.tagliavini@gmail.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMjcgSnVseSAyMDE1IGF0IDIyOjA4LCBFbnJpY28gVGFnbGlhdmluaSA8ZW5yaWNvLnRhZ2xp
YXZpbmlAZ21haWwuY29tPiB3cm90ZToKPiBIZWxsbyB0aGVyZSwKPgo+IEkgZ2F2ZSA0LjIgcmMz
IGEgc2hvdCBhbmQgSSBkaXNjb3ZlcmVkIHRoZSB3aXJlbGVzcyB3YXMgbm90IHdvcmtpbmcKPiBh
bnltb3JlIHdpdGggaXQuIEkgdHJpZWQgYWRkaW5nIGlycV9tb2RlPTEgYWxvbmdzaWRlIHNraXBf
b3RwPXkgaW4KPiBhdGgxMGtfY29yZSAoSSBhc3N1bWUgeW91IG5lZWQgZncgYXBpIDUgdG8gcmVt
b3ZlIHRoaXMsIGlzIHRoYXQKPiBjb3JyZWN0PywgSSBzdGlsbCBoYXZlIGZ3IDQgb25seSkuCj4K
PiBMb2FkaW5nIHdpdGggaXJxX21vZGU9MAo+Cj4gWyAgIDIxLjEzMDIyNF0gYXRoMTBrX3BjaSAw
MDAwOjAzOjAwLjA6IGVuYWJsaW5nIGRldmljZSAoMDAwMCAtPiAwMDAyKQo+IFsgICAyMS4xMzA3
MzRdIGF0aDEwa19wY2kgMDAwMDowMzowMC4wOiBwY2kgaXJxIG1zaS14IGludGVycnVwdHMgOAo+
IGlycV9tb2RlIDAgcmVzZXRfbW9kZSAwCgpUaGVyZSB3YXMgYWxyZWFkeSBhIHNpbWlsYXIgcmVw
b3J0WzFdLiBKdXN0IGZvciB0aGUgcmVjb3JkOiB3aGF0Cm51bWJlciBvZiBpbnRlcnJ1cHRzIGRp
ZCB5b3UgaGF2ZSBiZWZvcmUgNC4yLXJjMz8gSSBhc3N1bWUgaXQgd2FzICJwY2kKaXJxIG1zaSBp
bnRlcnJ1cHRzIDEgaXJxX21vZGUgMCByZXNldF9tb2RlIDAiLgoKTXkgc3VzcGljaW9uIGlzIHRo
YXQgZWl0aGVyIHRoZSBmaXJtd2FyZSBpcyBidWdneSBhbmQgZG9lc24ndCBwbGF5CndlbGwgd2l0
aCBtdWx0aXBsZSBNU0kgaW50ZXJydXB0cyBvciB0aGUgTVNJIGludGVycnVwdCBiZWhhdmlvdXIK
Y2hhbmdlZCBzaWduaWZpY2FudGx5IChjb21wYXJlZCB0byBxY2E5ODh4KSBhbmQgdGhpcyByZW1h
aW5lZCBoaWRkZW4KYmVjYXVzZSBub3QgYW4gYXdmdWwgbG90IG9mIG1hY2hpbmVzIHNlZW1lZCB0
byBoYXZlIHByb3ZpZGVkIG1vcmUgdGhhbgoxIG1zaSBpbnRlcnJ1cHQgZm9yIGF0aDEway4KClsx
XTogaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvcGlwZXJtYWlsL2F0aDEway8yMDE1LUp1bHkv
MDA1Njk1Lmh0bWwKCgpNaWNoYcWCCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
