Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZEE3-0001B0-VI
 for ath10k@lists.infradead.org; Tue, 18 Dec 2018 12:11:53 +0000
Message-ID: <5d46e8942ea151b211651588db3dacb97e6e5a53.camel@sipsolutions.net>
Subject: Re: [Make-wifi-fast] [PATCH v3 3/6] mac80211: Add airtime
 accounting and scheduling to TXQs
From: Johannes Berg <johannes@sipsolutions.net>
Date: Tue, 18 Dec 2018 13:11:27 +0100
In-Reply-To: <87va4ytgff.fsf@toke.dk> (sfid-20181115_181052_991185_C35CE6B3)
References: <1542063113-22438-1-git-send-email-rmanohar@codeaurora.org>
 <1542063113-22438-4-git-send-email-rmanohar@codeaurora.org>
 <CADMDV=zX4NuyDS+C==c8iq7FagGLFOoQ-Fjf=x-zmehJAz8=zQ@mail.gmail.com>
 <87va4ytgff.fsf@toke.dk> (sfid-20181115_181052_991185_C35CE6B3)
Mime-Version: 1.0
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
To: Toke =?ISO-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@toke.dk>, Louie Lu <me@louie.lu>, rmanohar@codeaurora.org
Cc: make-wifi-fast@lists.bufferbloat.net, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

T24gVGh1LCAyMDE4LTExLTE1IGF0IDA5OjEwIC0wODAwLCBUb2tlIEjDuGlsYW5kLUrDuHJnZW5z
ZW4gd3JvdGU6Cj4gTG91aWUgTHUgPG1lQGxvdWllLmx1PiB3cml0ZXM6Cj4gCj4gPiBIaSBSYWpr
dW1hciwgVG9rZSwKPiA+IAo+ID4gSSBmb3VuZCB0aGUgc2VyaWVzICh2Myw0LzYpIHJlbW92ZSB0
aGUgZGVidWdmcyByZW1vdmUgcmVzZXQgc3RhdGlvbidzCj4gPiBhaXJ0aW1lIG1ldGhvZCwgYW5k
IGRpZG4ndCBhZGRlZCBhdCBoZXJlLgo+ID4gCj4gPiBOb3Qgc3VyZSBob3cgdG8gaGVscCB0aGlz
IGtpbmQgb2Ygc2l0dWF0aW9uLCBkbyBJIG5lZWQgYSBzZXBhcmF0ZQo+ID4gcGF0Y2ggdG8gZml4
IHRoaXMsIG9yIHBvc3RpbmcgdGhlIHBhdGNoIGhlcmUgaXMgZmluZT8KPiAKPiBUaGlzIGlzIGZp
bmU7IHdlIGNhbiBmb2xkIGl0IGludG8gdGhlIG5leHQgdmVyc2lvbi4gVGhhbmtzIDopCgpKdXN0
IEZZSSAtIEknbSBnb2luZyB0byBhc3N1bWUsIGdpdmVuIHRoaXMgY29tbWVudCBhbmQgdGhlIGxv
bmcKZGlzY3Vzc2lvbiwgdGhhdCB0aGVyZSB3aWxsIGJlIGEgbmV4dCB2ZXJzaW9uIDopCgpqb2hh
bm5lcwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0
aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
