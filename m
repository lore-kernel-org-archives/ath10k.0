Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cDuld-0000bP-Da
 for ath10k@lists.infradead.org; Mon, 05 Dec 2016 15:01:22 +0000
Message-ID: <1480950054.31788.36.camel@sipsolutions.net>
Subject: Re: [PATCH 1/2] mac80211: do not iterate active interfaces when in
 re-configure
From: Johannes Berg <johannes@sipsolutions.net>
Date: Mon, 05 Dec 2016 16:00:54 +0100
In-Reply-To: <58458058.5020008@candelatech.com>
References: <1480645800-2148-1-git-send-email-greearb@candelatech.com>
 <CA+BoTQkEaC-ZSbeK=JB=q+ucF1PWcEQXkJEp6JYv4pfOf35cHg@mail.gmail.com>
 (sfid-20161205_092619_855272_0854B225)
 <1480945950.31788.4.camel@sipsolutions.net>
 <58458058.5020008@candelatech.com>
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
To: Ben Greear <greearb@candelatech.com>, Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gTW9uLCAyMDE2LTEyLTA1IGF0IDA2OjU3IC0wODAwLCBCZW4gR3JlZWFyIHdyb3RlOgoKPiBJ
IHRoaW5rIGNsZWFyaW5nIHNkYXRhLWluLWRyaXZlciB3b3VsZCBmaXggdGhlIGF0aDEwayBwcm9i
bGVtLCBhdAo+IGxlYXN0LCBidXQgSSB3YXMgYWZyYWlkIGl0IHdvdWxkIGJyZWFrIHNvbWV0aGlu
ZyBlbHNlIGluIG1hYzgwMjExIG9yCj4gbWF5YmUgaW4gb3RoZXIgdGhpY2sgZmlybXdhcmUgZHJp
dmVycy4KCkl0J3MgcHJldHR5IG11Y2ggYW4gaW50ZXJuYWwgdGhpbmcgLSBub3Qgc3VyZSB3aGF0
IGl0J2QgYnJlYWsuIE9UT0gsCnNvbWUgZHJpdmVycyBtaWdodCBhY3R1YWxseSBhc3N1bWUgdGhh
dCBpdGVyYXRpbmcgZmluZHMgdGhlbSBhbGwsIGlmCnRoZXkgbmV2ZXIgY2xlYXIgdGhlIGRhdGEg
ZXZlbiBhY3Jvc3MgYSByZXN0YXJ0PwoKPiBPbmUgd2F5IG9yIGFub3RoZXIsIHdlIGNhbm5vdCBi
ZSBpdGVyYXRpbmcgb3ZlciBpbnRlcmZhY2VzIHdoaWxlCj4gdGhlIGludGVyZmFjZXMgYXJlIGF0
IHRoZSBzYW1lIHRpbWUgYmVpbmcgKHJlKWFkZGVkLgoKV2VsbCwgd2Ugb2J2aW91c2x5ICpjYW4q
IGJlLCBhbmQgd2UgZG8gaW4gZmFjdCBkbyB0aGF0IC0gaXQncyBqdXN0IHRoYXQKYXRoMTBrIHNw
ZWNpZmljYWxseSBoYXMgaXNzdWVzIHdpdGggdGhlIGRhdGEgaXQncyBwdXR0aW5nIHRoZXJlLCBu
bz8KCj4gTWF5YmUgbWFjODAyMTEgc2hvdWxkIGV4cGxpY2l0bHkgcmVtb3ZlIGFsbCBpbnRlcmZh
Y2VzIGZyb20gdGhlCj4gZHJpdmVyIGR1cmluZyBjcmFzaCByZWNvdmVyeT/CoMKgCgpJIGRvbid0
IHRoaW5rIHRoYXQnbGwgd29yay4gUmVtb3ZpbmcgdGhlbSB3b3VsZCBpbnRlcmFjdCB3aXRoIHRo
ZQpmaXJtd2FyZSwgd2hpY2ggaXMgZGVhZCwgZXRjLiBUaGF0J2QganVzdCBjYXVzZSB0cm91Ymxl
LgoKPiBBbmQgdGhlIGJlaGF2aW91ciBuZWVkcyB0byBiZSBjbGVhcmx5IGRvY3VtZW50ZWQgc29t
ZXdoZXJlCj4gZWFzeSB0byBmaW5kIHNvIHRoYXQgd2UgY2FuIHRoaW5rIGFib3V0IGFuZCBwcm9n
cmFtIHRvIHRoZSBjb3JyZWN0Cj4gQVBJIGJlaGF2aW91ci4KCldlIGFzc3VtZSB0aGF0IHRoZSBk
cml2ZXIgcmVzZXRzIGFsbCBpdHMgaW50ZXJuYWwgc3RhdGUgLSB0aGlzIHdob2xlCmludGVyZmFj
ZSBpdGVyYXRpb24gaXMgYSBjb3JuZXIgY2FzZSB3ZSBoYWRuJ3QgY29uc2lkZXJlZCwgSSBzdXBw
b3NlLgoKam9oYW5uZXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
