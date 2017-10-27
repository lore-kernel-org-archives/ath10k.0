Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e8127-0006AK-Tj
 for ath10k@lists.infradead.org; Fri, 27 Oct 2017 09:34:34 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 2/2] ath10k: search DT for qcom, ath10k-calibration-variant
Date: Fri, 27 Oct 2017 09:34:03 +0000
Message-ID: <87bmkt53zp.fsf@kamboji.qca.qualcomm.com>
References: <20170310080615.22958-1-sven.eckelmann@openmesh.com>
 <20170310080615.22958-2-sven.eckelmann@openmesh.com>
 <3853747.Q0JJmSnsYM@debian64> <3114796.44GtYcDsBs@bentobox>
In-Reply-To: <3114796.44GtYcDsBs@bentobox> (Sven Eckelmann's message of "Mon, 
 21 Aug 2017 09:11:40 +0200")
Content-Language: en-US
Content-ID: <5F66099C3F7DC44B913CA2CC7C3439BE@qualcomm.com>
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
To: Sven Eckelmann <sven.eckelmann@openmesh.com>
Cc: Adrian Chadd <adrian@freebsd.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Aeolus Yang <aeolus@qti.qualcomm.com>, Christian Lamparter <chunkeey@googlemail.com>, "ext.waldemar.rymarkiewicz@tieto.com" <ext.waldemar.rymarkiewicz@tieto.com>

U3ZlbiBFY2tlbG1hbm4gPHN2ZW4uZWNrZWxtYW5uQG9wZW5tZXNoLmNvbT4gd3JpdGVzOg0KDQo+
IE9uIEZyZWl0YWcsIDEwLiBNw6RyeiAyMDE3IDE5OjIwOjU0IENFU1QgQ2hyaXN0aWFuIExhbXBh
cnRlciB3cm90ZToNCj4gWy4uLl0NCj4+IEBBZW9sdXMgWWFuZyAvIEthbGxlIC8gUUNBOiBXb3Vs
ZCBpdCBiZSBwb3NzaWJsZSB0byBhc3NpZ24gYSB2YXJpYW50IHN0cmluZyB0bw0KPj4gdGhlIEFz
dXMgUlQtQUM1OFU/DQo+PiANCj4+IEkndmUgYXR0YWNoZWQgdGhlIG5lY2Vzc2FyeSBibWktYm9h
cmQtaWQ9MTYgYW5kIGJtaS1ib2FyZC1pZD0xNyBib2FyZCANCj4+IGZpbGVzIHRvIHRoaXMgbWFp
bCBhcyB3ZWxsLiBTbywgYWxsIHRoYXQgbmVlZHMgdG8gYmUgZG9uZSBpcyB0byBhZGQNCj4+IHRo
ZW0gdG8gdGhlIGJvYXJkLTIuYmluIG9uIHlvdXIgY29kZWF1cm9yYSAvIGF0aDEway1maXJtd2Fy
ZSBwcm9qZWN0Lg0KPj4gDQo+PiBLYWxsZTogQ2FuIHlvdSBwbGVhc2UgdXBkYXRlIHRoZSBib2Fy
ZC0yLmJpbiBmb3IgdGhlIElQUTQwWFggb24geW91cg0KPj4gYXRoMTBrLWZpcm13YXJlIHByb2pl
Y3Qgb24gZ2l0aHViPw0KPj4gDQo+PiBodHRwczovL3NvdXJjZS5jb2RlYXVyb3JhLm9yZy9xdWlj
L3FzZGsvb3NzL2Zpcm13YXJlL2F0aDEway1maXJtd2FyZS9wbGFpbi9hdGgxMGsvUUNBNDBYWC9o
dzEuMC9ib2FyZC0yLmJpbg0KPj4gSXQgbG9va3MgbGlrZSB0aGlzIGJvYXJkLTIuYmluIGhhcyBz
dXBwb3J0IGZvciBhIGZldyBtb3JlIGJvYXJkcy4NCj4NCj4gQW55IHVwZGF0ZXMgb24gdGhhdD8N
Cg0KU29ycnksIEkgaGFkIG1pc3NlZCB0aGVzZSBzb21laG93LiBJIHB1dCB0aGVtIG5vdyBiYWNr
IHRvIG15IHF1ZXVlOg0KDQpodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzk2MTUx
ODMvDQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvOTYxNTE4NS8NCg0KLS0g
DQpLYWxsZSBWYWxvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
