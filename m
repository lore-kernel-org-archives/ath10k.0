Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.toke.dk ([2001:470:dc45:1000::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fvlTy-0005rA-O2
 for ath10k@lists.infradead.org; Fri, 31 Aug 2018 15:37:12 +0000
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Subject: Re: [PATCH v2 2/2] ath10k: Set sk_pacing_shift to 6 for 11AC WiFi
 chips
In-Reply-To: <ae8d9891-b827-7ca5-1375-0280d8f5c194@bowerswilkins.com>
References: <1533724802-30944-1-git-send-email-wgong@codeaurora.org>
 <1533724802-30944-3-git-send-email-wgong@codeaurora.org>
 <87sh3pdtpg.fsf@toke.dk>
 <f185ab8722e84c959b375e606d25a29b@aptaiexm02f.ap.qualcomm.com>
 <87mutue4y8.fsf@toke.dk>
 <ef7b317006964c0fa72763bbfc5149e5@aptaiexm02f.ap.qualcomm.com>
 <87600eecr7.fsf@toke.dk>
 <68d91488f58f4a449908fc7eeebb8b34@aptaiexm02f.ap.qualcomm.com>
 <87tvntb53x.fsf@toke.dk>
 <ae8d9891-b827-7ca5-1375-0280d8f5c194@bowerswilkins.com>
Date: Fri, 31 Aug 2018 17:36:55 +0200
Message-ID: <87wos61rag.fsf@toke.dk>
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
To: Peter Oh <peter.oh@bowerswilkins.com>, Wen Gong <wgong@qti.qualcomm.com>, Wen Gong <wgong@codeaurora.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "johannes@sipsolutions.net" <johannes@sipsolutions.net>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>

UGV0ZXIgT2ggPHBldGVyLm9oQGJvd2Vyc3dpbGtpbnMuY29tPiB3cml0ZXM6Cgo+IEhpIFRva2Us
Cj4KPgo+IE9uIDA4LzE3LzIwMTggMDQ6MzIgQU0sIFRva2UgSMO4aWxhbmQtSsO4cmdlbnNlbiB3
cm90ZToKPj4KPj4+Pj4gU2hpZnQgNjoKPj4+Pj4gd2dvbmdAd2dvbmctTGF0aXR1ZGUtRTU0NDAt
MTp+L2ZsZW50JCBmbGVudCAtSCAxOTIuMTY4LjEuNyAtdAo+Pj4+PiAic2tfcGFjaW5nX3NoaWZ0
NiIgdGNwX251cCAtLXRlc3QtcGFyYW1ldGVyIHVwbG9hZF9zdHJlYW1zPTEKPj4+Pgo+IERvZXMg
ZmxlbnQgaGF2ZSBvcHRpb25zIHRvIHNldCBUT1Mgb3IgUW9TIHF1ZXVlIGZvciBUQ1Agb3IgVURQ
IHRlc3Q/Cj4gSWYgSSBhZGQgIi0tdGVzdC1wYXJhbWV0ZSBidXJzdF90b3M9MHhlMCIsIHdpbGwg
aXQgdXNlIGNvcnJlc3BvbmRpbmcgCj4gbWFjODAyMTEgUW9TIHF1ZXVlPwoKWWVzLCBmb3Igc29t
ZSB0ZXN0czoKCi0gVGhlIFJSVUwgdGVzdCB3aWxsIHJ1biBmb3VyIFRDUCBmbG93cyBpbiBlYWNo
IGRpcmVjdGlvbiwgb25lIG1hcmtlZCBmb3IKICBlYWNoIDgwMi4xMSBRb1MgcXVldWUuCgotIEZv
ciB0aGUgcnR0X2ZhaXIqIHRlc3RzIHlvdSBjYW4gc2V0IHRoZW0gd2l0aCBhIHRlc3QgcGFyYW1l
dGVyOgotLXRlc3QtcGFyYW1ldGVyIG1hcmtpbmdzPUJFLENTMSB0byBzZXQgZmxvd3MgMSBhbmQg
MiB0byBCRSBhbmQgQ1MxCnJlc3BlY3RpdmVseS4gWW91IGNhbiB1c2UgdGhlIHJ0dF9mYWlyX3Zh
ciogdGVzdHMgdG8gZ2V0IGEgdmFyaWFibGUKbnVtYmVyIG9mIGZsb3dzICh0aGUgc2FtZSBob3N0
IGNhbiBiZSBzcGVjaWZpZWQgbXVsdGlwbGUgdGltZXMgYnkgaGF2aW5nCmRpZmZlcmVudCBob3N0
bmFtZXMgcmVzb2x2ZSB0byB0aGUgc2FtZSBJUCkuCgotVG9rZQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2F0aDEwawo=
