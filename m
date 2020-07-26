Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzedT-00063e-VC
 for ath10k@lists.infradead.org; Sun, 26 Jul 2020 11:16:09 +0000
From: David Laight <David.Laight@ACULAB.COM>
Subject: RE: [RFC 0/7] Add support to process rx packets in thread
Date: Sun, 26 Jul 2020 11:16:00 +0000
Message-ID: <cb54c2746a3d4ce695e3bda8b576b40e@AcuMS.aculab.com>
References: <1595351666-28193-1-git-send-email-pillair@codeaurora.org>
 <20200721172514.GT1339445@lunn.ch> <20200725081633.7432-1-hdanton@sina.com>
 <8359a849-2b8a-c842-a501-c6cb6966e345@dd-wrt.com>
 <20200725145728.10556-1-hdanton@sina.com>
 <2664182a-1d03-998d-8eff-8478174a310a@dd-wrt.com>
In-Reply-To: <2664182a-1d03-998d-8eff-8478174a310a@dd-wrt.com>
Content-Language: en-US
MIME-Version: 1.0
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
To: 'Sebastian Gottschall' <s.gottschall@dd-wrt.com>, Hillf Danton <hdanton@sina.com>
Cc: Andrew Lunn <andrew@lunn.ch>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "dianders@chromium.org" <dianders@chromium.org>, Rakesh Pillai <pillair@codeaurora.org>, "evgreen@chromium.org" <evgreen@chromium.org>, "kuba@kernel.org" <kuba@kernel.org>, Markus Elfring <Markus.Elfring@web.de>, "johannes@sipsolutions.net" <johannes@sipsolutions.net>, "davem@davemloft.net" <davem@davemloft.net>, "kvalo@codeaurora.org" <kvalo@codeaurora.org>

RnJvbTogU2ViYXN0aWFuIEdvdHRzY2hhbGwgPHMuZ290dHNjaGFsbEBkZC13cnQuY29tPg0KPiBT
ZW50OiAyNSBKdWx5IDIwMjAgMTY6NDINCj4gPj4gaSBhZ3JlZS4gaSBqdXN0IGNhbiBzYXkgdGhh
dCBpIHRlc3RlZCB0aGlzIHBhdGNoIHJlY2VudGx5IGR1ZSB0aGlzDQo+ID4+IGRpc2N1c3Npb24g
aGVyZS4gYW5kIGl0IGNhbiBiZSBjaGFuZ2VkIGJ5IHN5c2ZzLiBidXQgaXQgZG9lc250IHdvcmsg
Zm9yDQo+ID4+IHdpZmkgZHJpdmVycyB3aGljaCBhcmUgbWFpbmx5IHVzaW5nIGR1bW15IG5ldGRl
diBkZXZpY2VzLiBmb3IgdGhpcyBpDQo+ID4+IG1hZGUgYSBzbWFsbCBwYXRjaCB0byBnZXQgdGhl
bSB3b3JraW5nIHVzaW5nIG5hcGlfc2V0X3RocmVhZGVkIG1hbnVhbGx5DQo+ID4+IGhhcmRjb2Rl
ZCBpbiB0aGUgZHJpdmVycy4gKHNlZSBwYXRjaCBiZWxsb3cpDQoNCj4gPiBCeSBDT05GSUdfVEhS
RUFERURfTkFQSSwgdGhlcmUgaXMgbm8gbmVlZCB0byBjb25zaWRlciB3aGF0IHlvdSBkaWQgaGVy
ZQ0KPiA+IGluIHRoZSBuYXBpIGNvcmUgYmVjYXVzZSBkZXZpY2UgZHJpdmVycyBrbm93IGJldHRl
ciBhbmQgYXJlIHJlc3BvbnNpYmxlDQo+ID4gZm9yIGl0IGJlZm9yZSBjYWxsaW5nIG5hcGlfc2No
ZWR1bGUobikuDQoNCj4geWVhaC4gYnV0IHRoYXQgYXBwcm9hY2ggd2lsbCBub3Qgd29yayBmb3Ig
c29tZSBjYXNlcy4gc29tZSBzdHVwaWQNCj4gZHJpdmVycyBhcmUgdXNpbmcgbG9ja2luZyBjb250
ZXh0IGluIHRoZSBuYXBpIHBvbGwgZnVuY3Rpb24uDQo+IGluIHRoYXQgY2FzZSB0aGUgcGVyZm9y
bWFuY2Ugd2lsbCBydW50byBzaGl0LiBpIGRpc2NvdmVyZWQgdGhpcyB3aXRoIHRoZQ0KPiBtdm5l
dGEgZXRoIGRyaXZlciAobWFydmVsbCkgYW5kIG10NzYgdHggcG9sbGluZyAocnjCoCB3b3JrcykN
Cj4gZm9yIG12bmV0YSBpcyB3aWxsIGNhdXNlIHZlcnkgaGlnaCBsYXRlbmNpZXMgYW5kIHBhY2tl
dCBkcm9wcy4gZm9yIG10NzYNCj4gaXQgY2F1c2VzIHBhY2tldCBzdG9wLiBkb2VzbnQgd29yayBz
aW1wbHkgKG9uIGFsbCBjYXNlcyBubyBjcmFzaGVzKQ0KPiBzbyB0aGUgdGhyZWFkaW5nIHdpbGwg
b25seSB3b3JrIGZvciBkcml2ZXJzIHdoaWNoIGFyZSBjb21wYXRpYmxlIHdpdGgNCj4gdGhhdCBh
cHByb2FjaC4gaXQgY2Fubm90IGJlIHVzZWQgYXMgZHJvcCBpbiByZXBsYWNlbWVudCBmcm9tIG15
IHBvaW50IG9mDQo+IHZpZXcuDQo+IGl0cyBhbGwgYSBxdWVzdGlvbiBvZiB0aGUgZHJpdmVyIGRl
c2lnbg0KDQpXaHkgc2hvdWxkIGl0IG1ha2UgKG11Y2gpIGRpZmZlcmVuY2Ugd2hldGhlciB0aGUg
bmFwaSBjYWxsYmFja3MgKGV0YykNCmFyZSBkb25lIGluIHRoZSBjb250ZXh0IG9mIHRoZSBpbnRl
cnJ1cHRlZCBwcm9jZXNzIG9yIHRoYXQgb2YgYQ0Kc3BlY2lmaWMga2VybmVsIHRocmVhZC4NClRo
ZSBwcm9jZXNzIGZsYWdzIChvciB3aGF0ZXZlcikgY2FuIGV2ZW4gYmUgc2V0IHNvIHRoYXQgaXQg
YXBwZWFycw0KdG8gYmUgdGhlIGV4cGVjdGVkICdzb2Z0aW50JyBjb250ZXh0Lg0KDQpJbiBhbnkg
Y2FzZSBydW5uaW5nIE5BUEkgZnJvbSBhIHRocmVhZCB3aWxsIGp1c3Qgc2hvdyB1cCB0aGUgbmV4
dA0KcGllY2Ugb2YgY29kZSB0aGF0IHJ1bnMgZm9yIGFnZXMgaW4gc29mdGludCBjb250ZXh0Lg0K
SSB0aGluayBJJ3ZlIHNlZW4gdGhlIHRhaWwgZW5kIG9mIG1lbW9yeSBiZWluZyBmcmVlZCB1bmRl
ciByY3UNCmZpbmFsbHkgaGFwcGVuaW5nIHVuZGVyIHNvZnRpbnQgYW5kIHRha2luZyBhYnNvbHV0
ZWx5IGFnZXMuDQoNCglEYXZpZA0KDQotDQpSZWdpc3RlcmVkIEFkZHJlc3MgTGFrZXNpZGUsIEJy
YW1sZXkgUm9hZCwgTW91bnQgRmFybSwgTWlsdG9uIEtleW5lcywgTUsxIDFQVCwgVUsNClJlZ2lz
dHJhdGlvbiBObzogMTM5NzM4NiAoV2FsZXMpDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRo
MTBrCg==
