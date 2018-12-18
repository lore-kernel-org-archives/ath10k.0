Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.toke.dk ([52.28.52.200])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZKwl-0002z8-To
 for ath10k@lists.infradead.org; Tue, 18 Dec 2018 19:22:29 +0000
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Subject: Re: [Make-wifi-fast] [PATCH v3 3/6] mac80211: Add airtime accounting
 and scheduling to TXQs
In-Reply-To: <5d46e8942ea151b211651588db3dacb97e6e5a53.camel@sipsolutions.net>
References: <1542063113-22438-1-git-send-email-rmanohar@codeaurora.org>
 <1542063113-22438-4-git-send-email-rmanohar@codeaurora.org>
 <CADMDV=zX4NuyDS+C==c8iq7FagGLFOoQ-Fjf=x-zmehJAz8=zQ@mail.gmail.com>
 <87va4ytgff.fsf@toke.dk>
 <5d46e8942ea151b211651588db3dacb97e6e5a53.camel@sipsolutions.net>
Date: Tue, 18 Dec 2018 20:19:18 +0100
Message-ID: <87a7l2hccp.fsf@toke.dk>
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
To: Johannes Berg <johannes@sipsolutions.net>, Louie Lu <me@louie.lu>, rmanohar@codeaurora.org
Cc: make-wifi-fast@lists.bufferbloat.net, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Sm9oYW5uZXMgQmVyZyA8am9oYW5uZXNAc2lwc29sdXRpb25zLm5ldD4gd3JpdGVzOgoKPiBPbiBU
aHUsIDIwMTgtMTEtMTUgYXQgMDk6MTAgLTA4MDAsIFRva2UgSMO4aWxhbmQtSsO4cmdlbnNlbiB3
cm90ZToKPj4gTG91aWUgTHUgPG1lQGxvdWllLmx1PiB3cml0ZXM6Cj4+IAo+PiA+IEhpIFJhamt1
bWFyLCBUb2tlLAo+PiA+IAo+PiA+IEkgZm91bmQgdGhlIHNlcmllcyAodjMsNC82KSByZW1vdmUg
dGhlIGRlYnVnZnMgcmVtb3ZlIHJlc2V0IHN0YXRpb24ncwo+PiA+IGFpcnRpbWUgbWV0aG9kLCBh
bmQgZGlkbid0IGFkZGVkIGF0IGhlcmUuCj4+ID4gCj4+ID4gTm90IHN1cmUgaG93IHRvIGhlbHAg
dGhpcyBraW5kIG9mIHNpdHVhdGlvbiwgZG8gSSBuZWVkIGEgc2VwYXJhdGUKPj4gPiBwYXRjaCB0
byBmaXggdGhpcywgb3IgcG9zdGluZyB0aGUgcGF0Y2ggaGVyZSBpcyBmaW5lPwo+PiAKPj4gVGhp
cyBpcyBmaW5lOyB3ZSBjYW4gZm9sZCBpdCBpbnRvIHRoZSBuZXh0IHZlcnNpb24uIFRoYW5rcyA6
KQo+Cj4gSnVzdCBGWUkgLSBJJ20gZ29pbmcgdG8gYXNzdW1lLCBnaXZlbiB0aGlzIGNvbW1lbnQg
YW5kIHRoZSBsb25nCj4gZGlzY3Vzc2lvbiwgdGhhdCB0aGVyZSB3aWxsIGJlIGEgbmV4dCB2ZXJz
aW9uIDopCgpZZXMuIEdvdCBjYXVnaHQgdXAgaW4gbW92aW5nIGJlZm9yZSBJIG1hbmFnZWQgdG8g
Z2V0IGFub3RoZXIgdmVyc2lvbgpvdXQuIFdpbGwgZ2V0IGFyb3VuZCB0byBpdCBldmVudHVhbGx5
LCBwcm9taXNlISA6KQoKLVRva2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
