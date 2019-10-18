Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173]
 helo=mail3.candelatech.com)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iLRsl-00031Y-Jy
 for ath10k@lists.infradead.org; Fri, 18 Oct 2019 13:01:29 +0000
Subject: Re: [PATCH v2 1/4] mac80211: Rearrange ieee80211_tx_info to make room
 for tx_time_est
References: <157115993755.2500430.12214017471129215800.stgit@toke.dk>
 <157115993866.2500430.13989567853855880476.stgit@toke.dk>
 <CA+iem5t6xghBocck864nDX2snWQ5O+v6_M2Jc9aCdn_hE+mFCA@mail.gmail.com>
 <87sgnqe4wg.fsf@toke.dk>
 <4bc17c32337888a57a78a0e2c874abd462faef21.camel@sipsolutions.net>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <237a3110-69c1-6679-6ffb-892c3815049c@candelatech.com>
Date: Fri, 18 Oct 2019 06:01:23 -0700
MIME-Version: 1.0
In-Reply-To: <4bc17c32337888a57a78a0e2c874abd462faef21.camel@sipsolutions.net>
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
To: Johannes Berg <johannes@sipsolutions.net>, =?UTF-8?Q?Toke_H=c3=b8iland-J=c3=b8rgensen?= <toke@redhat.com>, Kan Yan <kyan@google.com>
Cc: Rajkumar Manoharan <rmanohar@codeaurora.org>, Kevin Hayes <kevinhayes@google.com>, make-wifi-fast@lists.bufferbloat.net, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, John Crispin <john@phrozen.org>, Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>

CgpPbiAxMC8xOC8yMDE5IDA1OjM1IEFNLCBKb2hhbm5lcyBCZXJnIHdyb3RlOgo+IE9uIEZyaSwg
MjAxOS0xMC0xOCBhdCAxMjoxNSArMDIwMCwgVG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2VuIHdyb3Rl
Ogo+PiBLYW4gWWFuIDxreWFuQGdvb2dsZS5jb20+IHdyaXRlczoKPj4KPj4+IFRoZSAidHhfdGlt
ZV9lc3QiIGZpZWxkLCBzaGFyZWQgYnkgY29udHJvbCBhbmQgc3RhdHVzLCBpcyBub3QgYWJsZSB0
bwo+Pj4gc3Vydml2ZSB1bnRpbCB0aGUgc2tiIHJldHVybnMgdG8gdGhlIG1hYzgwMjExIGxheWVy
IGluIHNvbWUKPj4+IGFyY2hpdGVjdHVyZXMuIFRoZSBzYW1lIHNwYWNlIGlzIGRlZmluZWQgYXMg
ZHJpdmVyX2RhdGEgYW5kIHNvbWUKPj4+IHdpcmVsZXNzIGRyaXZlcnMgdXNlIGl0IGZvciBvdGhl
ciBwdXJwb3NlcywgYXMgdGhlIGNiIGluIHRoZSBza19idWZmCj4+PiBpcyBmcmVlIHRvIGJlIHVz
ZWQgYnkgYW55IGxheWVyLgo+Pj4KPj4+IEluIHRoZSBjYXNlIG9mIGF0aDEwaywgdGhlIHR4X3Rp
bWVfZXN0IGdldCBjbG9iYmVyZWQgYnkKPj4+IHN0cnVjdCBhdGgxMGtfc2tiX2NiIHsKPj4+ICAg
ICAgICAgZG1hX2FkZHJfdCBwYWRkcjsKPj4+ICAgICAgICAgdTggZmxhZ3M7Cj4+PiAgICAgICAg
IHU4IGVpZDsKPj4+ICAgICAgICAgdTE2IG1zZHVfaWQ7Cj4+PiAgICAgICAgIHUxNiBhaXJ0aW1l
X2VzdDsKPj4+ICAgICAgICAgc3RydWN0IGllZWU4MDIxMV92aWYgKnZpZjsKPj4+ICAgICAgICAg
c3RydWN0IGllZWU4MDIxMV90eHEgKnR4cTsKPj4+IH0gX19wYWNrZWQ7Cj4+Cj4+IEFoLCBidWdn
ZXIsIG9mIGNvdXJzZSB0aGUgZHJpdmVyIHRoYXQgYWN0dWFsbHkgbmVlZHMgdGhpcyBpcyB1c2lu
ZyB0aGUKPj4gZnVsbCBkcml2ZXJfZGF0YSBzcGFjZSA6UAo+Cj4gTG9va3MgbGlrZSB5b3UgY291
bGQgc2hyaW5rICp0aGlzKiBmYWlybHkgZWFzaWx5IHRob3VnaC4KPgo+IEUuZy4gbW9zdCBsaWtl
bHkgdmlmID09IHR4cS0+dmlmIHVubGVzcyB0eHE9PU5VTEwsIHNvIGl0J3MgZG93biB0byAyMgo+
IGJ5dGVzIHBsdXMgYSBiaXQvZmxhZyBmb3Iga25vd2luZyB3aGV0aGVyIHRoZSBwb2ludGVyIGlz
IGEgdmlmIGRpcmVjdGx5Cj4gKGlmIG5vIFRYUSkgb3IgYSBUWFEuCgpBbmQgb2YgY291cnNlIHlv
dSBnZXQgdHdvIGJpdHMgaW4gZXZlcnkgcG9pbnRlciAoMHgzKSBhbmQgbGlrZWx5IHRoZQpkbWEg
YWRkciB0b28uICBQbGVudHkgb2Ygc3BhY2UhCgpUaGFua3MsCkJlbgoKLS0gCkJlbiBHcmVlYXIg
PGdyZWVhcmJAY2FuZGVsYXRlY2guY29tPgpDYW5kZWxhIFRlY2hub2xvZ2llcyBJbmMgIGh0dHA6
Ly93d3cuY2FuZGVsYXRlY2guY29tCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
