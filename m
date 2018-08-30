Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-eopbgr60054.outbound.protection.outlook.com ([40.107.6.54]
 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fvWJm-0007A5-Q1
 for ath10k@lists.infradead.org; Thu, 30 Aug 2018 23:25:40 +0000
Subject: Re: [PATCH v2 2/2] ath10k: Set sk_pacing_shift to 6 for 11AC WiFi
 chips
References: <1533724802-30944-1-git-send-email-wgong@codeaurora.org>
 <1533724802-30944-3-git-send-email-wgong@codeaurora.org>
 <87sh3pdtpg.fsf@toke.dk>
 <f185ab8722e84c959b375e606d25a29b@aptaiexm02f.ap.qualcomm.com>
 <87mutue4y8.fsf@toke.dk>
 <ef7b317006964c0fa72763bbfc5149e5@aptaiexm02f.ap.qualcomm.com>
 <87600eecr7.fsf@toke.dk>
 <68d91488f58f4a449908fc7eeebb8b34@aptaiexm02f.ap.qualcomm.com>
 <87tvntb53x.fsf@toke.dk>
From: Peter Oh <peter.oh@bowerswilkins.com>
Message-ID: <ae8d9891-b827-7ca5-1375-0280d8f5c194@bowerswilkins.com>
Date: Thu, 30 Aug 2018 16:25:11 -0700
MIME-Version: 1.0
In-Reply-To: <87tvntb53x.fsf@toke.dk>
Content-Language: en-US
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: =?UTF-8?Q?Toke_H=c3=b8iland-J=c3=b8rgensen?= <toke@toke.dk>, Wen Gong <wgong@qti.qualcomm.com>, Wen Gong <wgong@codeaurora.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "johannes@sipsolutions.net" <johannes@sipsolutions.net>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>

SGkgVG9rZSwKCgpPbiAwOC8xNy8yMDE4IDA0OjMyIEFNLCBUb2tlIEjDuGlsYW5kLUrDuHJnZW5z
ZW4gd3JvdGU6Cj4KPj4+PiBTaGlmdCA2Ogo+Pj4+IHdnb25nQHdnb25nLUxhdGl0dWRlLUU1NDQw
LTE6fi9mbGVudCQgZmxlbnQgLUggMTkyLjE2OC4xLjcgLXQKPj4+PiAic2tfcGFjaW5nX3NoaWZ0
NiIgdGNwX251cCAtLXRlc3QtcGFyYW1ldGVyIHVwbG9hZF9zdHJlYW1zPTEKPj4+CkRvZXMgZmxl
bnQgaGF2ZSBvcHRpb25zIHRvIHNldCBUT1Mgb3IgUW9TIHF1ZXVlIGZvciBUQ1Agb3IgVURQIHRl
c3Q/CklmIEkgYWRkICItLXRlc3QtcGFyYW1ldGUgYnVyc3RfdG9zPTB4ZTAiLCB3aWxsIGl0IHVz
ZSBjb3JyZXNwb25kaW5nIAptYWM4MDIxMSBRb1MgcXVldWU/CmZsZW50IC1IIHh4eHggLXQgInh4
eHgiIHRjcF9udXAgLS10ZXN0LXBhcmFtZXRlciB1cGxvYWRfc3RyZWFtcz0xIAotLXRlc3QtcGFy
YW1ldGUgYnVyc3RfdG9zPTB4ZTAKClRoYW5rcywKUGV0ZXIKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hdGgxMGsK
