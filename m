Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x22f.google.com ([2a00:1450:400c:c09::22f])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bPkE1-00088y-83
 for ath10k@lists.infradead.org; Wed, 20 Jul 2016 05:39:17 +0000
Received: by mail-wm0-x22f.google.com with SMTP id o80so51198782wme.1
 for <ath10k@lists.infradead.org>; Tue, 19 Jul 2016 22:38:56 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <578E5AFA.4000908@candelatech.com>
References: <20160614061728.570-1-rmanohar@qti.qualcomm.com>
 <e05dcb58-1cb1-a33a-31bb-b8ba1edf1363@dd-wrt.com>
 <fa3eab06-28f0-e5d4-2e92-770134b49dfa@dd-wrt.com>
 <1467218124941.40575@qti.qualcomm.com>
 <CA+BoTQkepLz55Vdr7OuMnPQPLKq_+vjZi=m2Y9rHLRgBZPsWOw@mail.gmail.com>
 <1468941948774.87860@qti.qualcomm.com>
 <CAJ-Vmon1duBNcWhjaNdANYFfd3hwQUYYHrmx7LRZvT-Ec2x1Cg@mail.gmail.com>
 <578E5AFA.4000908@candelatech.com>
From: Michal Kazior <michal.kazior@tieto.com>
Date: Wed, 20 Jul 2016 07:38:54 +0200
Message-ID: <CA+BoTQ=QMPUtY64ELCToZLcSrCPQdG=2Eg4FrsULeeDg9sFPYA@mail.gmail.com>
Subject: Re: [PATCH] ath10k: fix system hang at qca99x0 probe on x86 platform
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
To: Ben Greear <greearb@candelatech.com>
Cc: Adrian Chadd <adrian@freebsd.org>, Rajkumar Manoharan <rmanohar@codeaurora.org>, "Manoharan,
 Rajkumar" <rmanohar@qti.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "Valo,
 Kalle" <kvalo@qca.qualcomm.com>, Sebastian Gottschall <s.gottschall@dd-wrt.com>, "nbd@nbd.name" <nbd@nbd.name>

T24gMTkgSnVseSAyMDE2IGF0IDE4OjUzLCBCZW4gR3JlZWFyIDxncmVlYXJiQGNhbmRlbGF0ZWNo
LmNvbT4gd3JvdGU6Cj4gT24gMDcvMTkvMjAxNiAwOToxMyBBTSwgQWRyaWFuIENoYWRkIHdyb3Rl
OgpbLi4uXQo+PiBUcnkgYWxsb2NhdGluZyBXTUkgbWVtb3J5IHdpdGggR0ZQX0RNQTMyLiBUaGUg
d2F5IGl0IGN1cnJlbnRseSBpcwo+PiB3b3JraW5nIGluIGxpbnV4IGlzIHRoYXQgY2FsaW5nIGRt
YSBtYXAgZW5kcyB1cCBhbGxvY2F0aW5nIGlvbW11IHNsb3RzCj4+IHRvIG1hcCB0aGF0IDY0IGJp
dCBtZW1vcnkgYmFjayBpbnRvIDMyIGJpdCBzcGFjZSwgL29yLyBpdCB3aWxsIGVuZCB1cAo+PiBh
bGxvY2F0aW5nIGJvdW5jZSBidWZmZXJzLgo+Pgo+PiBUaGUgV01JIG1lbW9yeSBhbGxvYyByb3V0
aW5lIGlzIGJlaW5nIHVzZWQgZm9yIHRoZSBzd2FwIHNwYWNlIHRvbywKPj4gd2hpY2ggZW5kcyB1
cCB3aXRoIDcwMGtieXRlIG9yIG1vcmUgYWxsb2NhdGVkIHR3aWNlIC0gb25jZSBmb3IgdGhlCj4+
IGluaXRpYWwgYWxsb2MsIGFuZCBhbm90aGVyIGZvciB0aGUgZG1hIG1hcCBjYWxsLgo+Pgo+PiBZ
b3Ugc2hvdWxkIHRyeSBHRlBfRE1BMzIgYW5kIHNlZSBpZiB0aGF0IGZpeGVzIGl0LiBZb3UgbmVl
ZCBjb250aWcsIDwKPj4gMzIgYml0IHBoeXNpY2FsIG1lbW9yeSBhbGxvY2F0ZWQsIGFuZCBib3Vu
Y2UgYnVmZmVycyBhcmUgcmVhbGx5Cj4+IHN1cHBvc2VkIHRvIGJlIGVwaGVtZXJhbC4KPgo+Cj4g
SSBicmllZmx5IHRlc3RlZCB3aXRoIHRoZSBHRlBfRE1BMzIgYW5kIGl0IHdvcmtlZCBvbiBteSA5
OTg0IHRlc3QgcmlnLgoKRG9lc24ndCBHRlBfRE1BMzIgYWx0ZXIgdGhlIGFkZHJlc3Mgc3BhY2Ug
eW91ciBwb2ludGVycyByZWZlciB0byBpbiBhCnNpbWlsYXIgd2F5IGRtYS1jb2hlcmVudCBhbGxv
Y2F0aW9ucyBkbyAoY29tcGFyZWQgdG8gcmVndWxhcgprbWFsbG9jK2RtYS1tYXAtc2luZ2xlKT8g
VGhpcyB3b3VsZCBzdXBwb3J0IG15IHRoZW9yeSBhYm91dApmaXJtd2FyZS9oYXJkd2FyZSBnZXR0
aW5nIGNvbmZ1c2VkIGlmIGhvc3QgbWVtIGNodW5rcyBoYXZlIHNvbWUgTVNCcwpzZXQuCgoKTWlj
aGHFggoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRo
MTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
