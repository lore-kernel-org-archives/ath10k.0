Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iT24u-0002B0-Ok
 for ath10k@lists.infradead.org; Fri, 08 Nov 2019 11:05:22 +0000
Message-ID: <e7c7ad18d83eaf24809ac1a41604f38098e9bd57.camel@sipsolutions.net>
Subject: Re: [PATCH v6 4/4] mac80211: Use Airtime-based Queue Limits (AQL)
 on packet dequeue
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 08 Nov 2019 12:05:12 +0100
In-Reply-To: <877e4afx83.fsf@toke.dk>
References: <157182473951.150713.7978051149956899705.stgit@toke.dk>
 <157182474399.150713.16380222749144410045.stgit@toke.dk>
 <0b43c4822ab83ea4d33a5a32d8ff6c7a56eff6c5.camel@sipsolutions.net>
 <877e4afx83.fsf@toke.dk>
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
To: Toke =?ISO-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@redhat.com>
Cc: Kan Yan <kyan@google.com>, Rajkumar Manoharan <rmanohar@codeaurora.org>, Kevin Hayes <kevinhayes@google.com>, make-wifi-fast@lists.bufferbloat.net, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, John Crispin <john@phrozen.org>, Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>

T24gRnJpLCAyMDE5LTExLTA4IGF0IDEyOjAxICswMTAwLCBUb2tlIEjDuGlsYW5kLUrDuHJnZW5z
ZW4gd3JvdGU6Cj4gCj4gTXkgcmVhc29uaW5nIGZvciBkb2luZyBpdCB0aGlzIHdheSB3YXMgdGhh
dCB3ZSBoYXZlIGFub3RoZXIgc2V0IG9mIEFQSXMKPiBkZWFsaW5nIHdpdGggYWlydGltZSB3aGlj
aCBkb2Vzbid0IGRvIGFueSBzaGlmdGluZzsgc28ga2VlcGluZyB0aGUgQVBJcwo+IGluIHRoZSBz
YW1lIHVuaXQgKHN0cmFpZ2h0IGFpcnRpbWUpIHNlZW1lZCBsZXNzIGNvbmZ1c2luZy4KCkZhaXIg
ZW5vdWdoLgoKPiBXZSBjb3VsZCBhZGQgKGlubGluZSkgc2V0dGVyIGFuZCBnZXR0ZXIgZnVuY3Rp
b25zIGZvciB0aGUgdHhfdGltZV9lc3QKPiBmaWVsZCBpbnN0ZWFkIHRvIGF2b2lkIHNwcmlua2xp
bmcgc2hpZnRzIGFsbCBvdmVyIHRoZSBwbGFjZT8gOikKCkl0IGRvZXNuJ3QgcmVhbGx5IGJvdGhl
ciBtZSB0aGF0IG11Y2gsIGJ1dCB5ZWFoLCBwZXJoYXBzIHRoYXQncyBlYXNpZXIuCgpqb2hhbm5l
cwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEw
ayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
