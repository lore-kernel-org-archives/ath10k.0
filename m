Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.toke.dk ([52.28.52.200])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fqd01-0007Za-Rf
 for ath10k@lists.infradead.org; Fri, 17 Aug 2018 11:33:03 +0000
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Subject: RE: [PATCH v2 2/2] ath10k: Set sk_pacing_shift to 6 for 11AC WiFi
 chips
In-Reply-To: <68d91488f58f4a449908fc7eeebb8b34@aptaiexm02f.ap.qualcomm.com>
References: <1533724802-30944-1-git-send-email-wgong@codeaurora.org>
 <1533724802-30944-3-git-send-email-wgong@codeaurora.org>
 <87sh3pdtpg.fsf@toke.dk>
 <f185ab8722e84c959b375e606d25a29b@aptaiexm02f.ap.qualcomm.com>
 <87mutue4y8.fsf@toke.dk>
 <ef7b317006964c0fa72763bbfc5149e5@aptaiexm02f.ap.qualcomm.com>
 <87600eecr7.fsf@toke.dk>
 <68d91488f58f4a449908fc7eeebb8b34@aptaiexm02f.ap.qualcomm.com>
Date: Fri, 17 Aug 2018 13:32:50 +0200
Message-ID: <87tvntb53x.fsf@toke.dk>
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
To: Wen Gong <wgong@qti.qualcomm.com>, Wen Gong <wgong@codeaurora.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "johannes@sipsolutions.net" <johannes@sipsolutions.net>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>

V2VuIEdvbmcgPHdnb25nQHF0aS5xdWFsY29tbS5jb20+IHdyaXRlczoKCj4+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tCj4+IEZyb206IFRva2UgSMO4aWxhbmQtSsO4cmdlbnNlbiA8dG9rZUB0
b2tlLmRrPgo+PiBTZW50OiBNb25kYXksIEF1Z3VzdCAxMywgMjAxOCA3OjE4IFBNCj4+IFRvOiBX
ZW4gR29uZyA8d2dvbmdAcXRpLnF1YWxjb21tLmNvbT47IFdlbiBHb25nCj4+IDx3Z29uZ0Bjb2Rl
YXVyb3JhLm9yZz47IGF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnOwo+PiBqb2hhbm5lc0BzaXBz
b2x1dGlvbnMubmV0Cj4+IENjOiBsaW51eC13aXJlbGVzc0B2Z2VyLmtlcm5lbC5vcmcKPj4gU3Vi
amVjdDogUkU6IFtQQVRDSCB2MiAyLzJdIGF0aDEwazogU2V0IHNrX3BhY2luZ19zaGlmdCB0byA2
IGZvciAxMUFDIFdpRmkKPj4gY2hpcHMKPj4gCj4+IFdlbiBHb25nIDx3Z29uZ0BxdGkucXVhbGNv
bW0uY29tPiB3cml0ZXM6Cj4+IAo+PiA+IEhpIFRva2UsCj4+ID4KPj4gPiBJIGhhdmUgdGVzdGVk
IHdpdGggeW91ciBtZXRob2QgZm9yIHNoaWZ0IDYvOC8xMC83IGFsbCB0d2ljZSB0aW1lIGluCj4+
ID4gb3BlbiBhaXIgZW52aXJvbm1lbnQuCj4+IAo+PiBHcmVhdCwgdGhhbmtzIQo+PiAKPj4gPiBT
aGlmdCA2Ogo+PiA+IHdnb25nQHdnb25nLUxhdGl0dWRlLUU1NDQwLTE6fi9mbGVudCQgZmxlbnQg
LUggMTkyLjE2OC4xLjcgLXQKPj4gPiAic2tfcGFjaW5nX3NoaWZ0NiIgdGNwX251cCAtLXRlc3Qt
cGFyYW1ldGVyIHVwbG9hZF9zdHJlYW1zPTEKPj4gCj4+IEp1c3QgdG8gYmUgc3VyZTogWW91IGFy
ZSBydW5uaW5nIHRoaXMgb24geW91ciBsYXB0b3A/IEFuZCB0aGF0IGxhcHRvcCBoYXMgdGhlCj4+
IGF0aDEwayBhbmQgdGhlIG1vZGlmaWVkIGtlcm5lbCB5b3UgYXJlIHRlc3Rpbmc/IElzIDE5Mi4x
NjguMS43IHRoZSBBUCBvcgo+PiBhbm90aGVyIGRldmljZT8KPiBIaSBUb2tlLAo+IFllcywgSSBy
dW4gb24gbXkgbGFwdG9wKERlbGwgTEFUSVRVREUgRTU0NDAgKyBRQ0E2MTc0IFBDSSB3aXJlbGVz
cyBjYXJkKSBpbiBvcGVuIGFpciBlbnZpcm9ubWVudCwKPiBLZXJuZWwgaXMgNC4xOC4wLXJjMi13
dC1hdGgrICMyIFNNUCB3aGljaCBpcyBidWlsdCBteXNlbGYuCj4gVGhlIG1hYzgwMjExLmtvL2F0
aDEwayBpcyBidWlsdCB3aXRoIHRoZSAyIHBhdGNoZXMuCj4gMTkyLjE2OC4xLjcgaXMgYW5vdGhl
ciBkZXZpY2UoUEMgaW5zdGFsbGVkIHdpdGggNC40LjAtMTE2LWdlbmVyaWMgIzE0MH4xNC4wNC4x
LVVidW50dSkKPj4gCj4+IEknZCBsaWtlIHRvIHNlZSB3aGF0IGhhcHBlbnMgd2hlbiB0aGUgbGlu
ayBpcyBmdWxseSBzYXR1cmF0ZWQgbXkgbXVsdGlwbGUKPj4gc3RyZWFtcyBhcyB3ZWxsLiBDb3Vs
ZCB5b3UgcmVwZWF0IHRoZSB0ZXN0cyB3aXRoIHVwbG9hZF9zdHJlYW1zPTUsIHBsZWFzZT8KPj4g
QW5kIGlmIHlvdSBjb3VsZCBzaGFyZSB0aGUgLmZsZW50Lmd6IGZpbGVzICh1cGxvYWQgdGhlbSBz
b21ld2hlcmUsIG9yIGVtYWlsCj4+IG1lIG9mZi1saXN0KSwgdGhhdCB3b3VsZCBiZSB1c2VmdWwg
YXMgd2VsbCA6KQo+Cj4gVGVzdCByZXN1bHQgd2l0aCB1cGxvYWRfc3RyZWFtcz01OgoKU29ycnkg
Zm9yIHRoZSBkZWxheSBpbiBsb29raW5nIGF0IHRoaXMsIEkndmUgYmVlbiB0ZXJyaWJseSBidXN5
IHRoaXMKd2Vlazsgd2lsbCBnZXQgYmFjayB0byBpdCBpbiBtb3JlIGRldGFpbCBuZXh0IHdlZWsu
CgpPbmUgcXVlc3Rpb24gZm9yIG5vdzogSW4gdGhlIHJlc3VsdHMgeW91IHF1b3RlIGJlbG93IHRo
ZSB0b3RhbAp0aHJvdWdocHV0IGlzIHdheSBsb3dlciB0aGFuIHRoZSB1cCB0byA2MDAgbWJwcyB5
b3UgcXVvdGVkIGluIHRoZSBwYXRjaApkZXNjcmlwdGlvbi4gSG93IGRpZCB5b3UgcnVuIHlvdXIg
b3JpZ2luYWwgdGVzdHMgdG8gYWNoaWV2ZSB0aGF0IGhpZ2ggYQp0aHJvdWdocHV0PwoKLVRva2UK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBt
YWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
