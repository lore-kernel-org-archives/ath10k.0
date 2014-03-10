Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ob0-x234.google.com ([2607:f8b0:4003:c01::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WMuwG-0005Oa-If
 for ath10k@lists.infradead.org; Mon, 10 Mar 2014 07:47:57 +0000
Received: by mail-ob0-f180.google.com with SMTP id wn1so6428205obc.25
 for <ath10k@lists.infradead.org>; Mon, 10 Mar 2014 00:47:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHqTa-2Be3Whehq4tG1vSxBikLGuTeFMQmbYT5K3D1ui4hRumw@mail.gmail.com>
References: <CAHqTa-2NASvnpURqH=LbPMOi8GKHB23Xc3pxwULqnsXMrKHpow@mail.gmail.com>
 <5319EB80.4010608@candelatech.com>
 <CAHqTa-2Be3Whehq4tG1vSxBikLGuTeFMQmbYT5K3D1ui4hRumw@mail.gmail.com>
Date: Mon, 10 Mar 2014 08:47:32 +0100
Message-ID: <CA+BoTQn0kAojcm2goQUGZM3xj_2NT44-XDvudGHrmf7WUaJdjg@mail.gmail.com>
Subject: Re: Firmware crash when sending large numbers of forwarded packets
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
To: Avery Pennarun <apenwarr@gmail.com>
Cc: Ben Greear <greearb@candelatech.com>, ath10k <ath10k@lists.infradead.org>

T24gOCBNYXJjaCAyMDE0IDAxOjU0LCBBdmVyeSBQZW5uYXJ1biA8YXBlbndhcnJAZ21haWwuY29t
PiB3cm90ZToKClsuLi5dCgo+IE1pY2hhbCB3cm90ZToKPj4gQ2FuIHlvdSB0cnkgcmVwcm9kdWNp
bmcgdGhpcyB3aXRoIHRyYWNlcz8gQ29uc2lkZXJpbmcgdGhpcyBtaWdodCBnZXQKPj4gdG9vIGJp
ZyB0byBhdHRhY2ggdG8gYW4gZW1haWwgSSB0aGluayBpdCdzIG9rYXkgdG8gZXhjbHVkZQo+PiBh
dGgxMGs6YXRoMTBrX2xvZ19kYmdfZHVtcCBmcm9tIHRyYWNlcy4KPgo+IENhbiB5b3UgZ2l2ZSBt
ZSBhIGNsdWUgaG93IHRvIGdldCBzdGFydGVkIHdpdGggdHJhY2VzPyAgV2hhdCBkbyBJCj4gZW5h
YmxlLCBhbmQgd2hhdCBwYXJ0cyBkbyB5b3Ugd2FudCB0byBzZWU/CgpDT05GSUdfQVRIMTBLX1RS
QUNJTkc9eQoKdHJhY2UtY21kIHJlY29yZCAtZSBhdGgxMGs6YXRoMTBrX2xvZ19lcnIgLWUgYXRo
MTBrOmF0aDEwa19sb2dfd2FybiAtZQphdGgxMGs6YXRoMTBrX2xvZ19pbmZvIC1lIGF0aDEwazph
dGgxMGtfbG9nX2RiZyAtZQphdGgxMGs6YXRoMTBrX3dtaV9jbWQgLWUgYXRoMTBrOmF0aDEwa193
bWlfZXZlbnQgLWUKYXRoMTBrOmF0aDEwa19odHRfc3RhdHMgLWUgYXRoMTBrOmF0aDEwa193bWlf
ZGJnbG9nCgoodGhpcyBleGNsdWRlcyB0aGUgYXRoMTBrOmF0aDEwa19sb2dfZGJnX2R1bXApCgpJ
ZiBpdCdzIHRvbyBiaWcgdG8gYXR0YWNoL3Bhc3RlIHRoZSB0cmFjZS5kYXQgZmlsZSB0aGVuIGEg
cmVhc29uYWJsZQpvdXRwdXQgb2YgYmFja2xvZyBmcm9tIGB0cmFjZS1jbWQgcmVwb3J0YCBiZWZv
cmUgRlcgY3Jhc2hlcyBtaWdodApzdWZmaWNlLiBDb25zaWRlcmluZyB5b3VyIG90aGVyIG1haWwg
dGhpcyBtYXkgcHJldmVudCB0aGUgYnVnIGZyb20KYXBwZWFyaW5nIHRob3VnaC4KCgpNaWNoYcWC
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsg
bWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
