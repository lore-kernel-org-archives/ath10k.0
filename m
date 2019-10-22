Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMone-0001jv-HC
 for ath10k@lists.infradead.org; Tue, 22 Oct 2019 07:41:52 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v4 0/2] Implement Airtime-based Queue Limit (AQL)
References: <20191011022413.176208-1-kyan@google.com>
 <87wod7y9ui.fsf@kamboji.qca.qualcomm.com>
 <87sgnvy9c2.fsf@kamboji.qca.qualcomm.com>
 <CA+iem5uLYFVQjPaE1QDKc6c+eKz8Xd4LbwczYXOBKP3q+HHdBg@mail.gmail.com>
 <87r236tbgz.fsf@kamboji.qca.qualcomm.com> <878speqh75.fsf@toke.dk>
Date: Tue, 22 Oct 2019 10:41:43 +0300
In-Reply-To: <878speqh75.fsf@toke.dk> ("Toke \=\?utf-8\?Q\?H\=C3\=B8iland-J\?\=
 \=\?utf-8\?Q\?\=C3\=B8rgensen\=22's\?\= message of
 "Mon, 21 Oct 2019 16:57:50 +0200")
Message-ID: <87zhhtjkg8.fsf@codeaurora.org>
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
To: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Cc: Kan Yan <kyan@google.com>, make-wifi-fast@lists.bufferbloat.net, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Yibo Zhao <yiboz@codeaurora.org>, Johannes Berg <johannes@sipsolutions.net>, Felix Fietkau <nbd@nbd.name>

VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2VuIDx0b2tlQHJlZGhhdC5jb20+IHdyaXRlczoKCj4gS2Fs
bGUgVmFsbyA8a3ZhbG9AY29kZWF1cm9yYS5vcmc+IHdyaXRlczoKPgo+PiAocGxlYXNlIGRvbid0
IHRvcCBwb3N0KQo+Pgo+PiBLYW4gWWFuIDxreWFuQGdvb2dsZS5jb20+IHdyaXRlczoKPj4KPj4+
IEkgYmVsaWV2ZSBUb2tlIHdpbGwgaW50ZWdyYXRlIHRoaXMgd2l0aCBoaXMgdmVyc2lvbiBhbmQg
bW92ZSB0aGUKPj4+IGVzdGltYXRpbmcgcGVuZGluZyBhaXJ0aW1lIHBhcnQgdG8gbWFjODAyMTEs
IHNvIG1heWJlIGluIHRoZSBuZXh0Cj4+PiB2ZXJzaW9uLCBhdGgxMGsgY2hhbmdlIGlzIG5vIGxv
bmdlciByZXF1aXJlZC4KPj4KPj4gV2hhdCBkbyB5b3UgbWVhbj8gQXJlIHlvdSBzYXlpbmcgdGhh
dCBJIGNhbiBkcm9wIHRoaXMgcGF0Y2g6Cj4+Cj4+IFt2NCwyLzJdIGF0aDEwazogRW5hYmxlIEFp
cnRpbWUtYmFzZWQgUXVldWUgTGltaXQgKEFRTCkKPj4KPj4gaHR0cHM6Ly9wYXRjaHdvcmsua2Vy
bmVsLm9yZy9wYXRjaC8xMTE4NDc4My8KPgo+IFllcywgd2UncmUgdHJ5aW5nIHRvIGRvIGl0IGFs
bCBpbiBtYWM4MDIxMS4gU2VlCj4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0
L2xpbnV4LXdpcmVsZXNzL2xpc3QvP3Nlcmllcz0xOTAzMzMKClRoYW5rcywgSSBkcm9wcGVkIHRo
aXMgcGF0Y2ggbm93LgoKLS0gCkthbGxlIFZhbG8KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
dGgxMGsK
