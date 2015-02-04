Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22f.google.com ([2a00:1450:400c:c05::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YIwNP-0004t2-PJ
 for ath10k@lists.infradead.org; Wed, 04 Feb 2015 09:36:04 +0000
Received: by mail-wi0-f175.google.com with SMTP id fb4so30385230wid.2
 for <ath10k@lists.infradead.org>; Wed, 04 Feb 2015 01:35:41 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87vbjit58l.fsf@kamboji.qca.qualcomm.com>
References: <54BECE4D.9020308@candelatech.com> <54BF0B42.7050101@dd-wrt.com>
 <54BF13AE.5010909@candelatech.com>
 <54BFF788.2000500@candelatech.com>
 <54C00239.7000008@candelatech.com>
 <54C166B8.7060405@candelatech.com>
 <CA+BoTQmF+z5+HW+=xis7LPSmq6sSxn2ZuiJHGM83dAAftkN_sA@mail.gmail.com>
 <54C26EB3.7050805@candelatech.com>
 <87vbjit58l.fsf@kamboji.qca.qualcomm.com>
Date: Wed, 4 Feb 2015 10:35:41 +0100
Message-ID: <CA+BoTQmGWLDHGa=GkhtDaSupsY-nd5e5nUuwg6iMAN4d8WjOTA@mail.gmail.com>
Subject: Re: More than one ath10k NIC will not load (bisected)
From: Michal Kazior <michal.kazior@tieto.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: Ben Greear <greearb@candelatech.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gNCBGZWJydWFyeSAyMDE1IGF0IDEwOjA3LCBLYWxsZSBWYWxvIDxrdmFsb0BxY2EucXVhbGNv
bW0uY29tPiB3cm90ZToKPiBCZW4gR3JlZWFyIDxncmVlYXJiQGNhbmRlbGF0ZWNoLmNvbT4gd3Jp
dGVzOgo+Cj4+PiBIbW0uLiBUaGlzIHJlbW92ZXMgd2FybV9yZXNldCBpbiBwcm9iZSBmdW5jdGlv
biBidXQgSSBmYWlsIHRvIHNlZSBob3cKPj4+IHRoaXMgY291bGQgZW5kIHVwIG5vdCBsb2FkaW5n
IG9uZSBvZiB0aGUgTklDICpzaWxlbnRseSo/Cj4+Pgo+Pj4gQW55d2F5IHRoZXJlJ3MgYSBwZW5k
aW5nIHBhdGNoIHdoaWNoIGFkZHMgdGhlIHJlc2V0IGJhY2s6Cj4+PiBodHRwczovL2dpdGh1Yi5j
b20va3ZhbG8vYXRoL2NvbW1pdC9iZGNkNmY0ZTRhYzVkMmQyYTU2ZGE0ODEzZjU2NjU1ZTZkYjBl
ZTQ1Cj4+PiAuIFlvdSBtaWdodCB3YW50IHRvIHRyeSBpdCBhbmQgc2VlIGlmIGl0IGhlbHBzLgo+
Pgo+PiBSZXZlcnRpbmcgdGhlIHBhdGNoIG1hZGUgaXQgd29yayBhZ2FpbiBmb3IgbWUuCj4+Cj4+
IEkgZG9uJ3QgdW5kZXJzdGFuZCB0aGF0IGNvZGUgd2VsbCwgYnV0IHBlcmhhcHMgeW91IGFyZSBk
aXNhYmxpbmcKPj4gYSBzaGFyZWQgaW50ZXJydXB0IHRoYXQgc2lsZW50bHkgc3RvcHMgdGhlIHNl
Y29uZCBOSUMgZnJvbQo+PiBiZWluZyBhYmxlIHRvIGRvIGl0J3MgdGhpbmc/Cj4+Cj4+IERvIHlv
dSBoYXZlIGEgUEMgd2l0aCAyIE5JQ3MgaW4gaXQgdGhhdCB5b3UgY291bGQgdHJ5IHlvdXJzZWxm
Pwo+Pgo+PiBJIGNhbiBncmFiIHlvdSB0aGUgbG9ncyBvZiBhIGZhaWx1cmUgdG8gYm9vdCBsYXRl
ciB0b2RheS4KPgo+IFdoYXQgc2hvdWxkIHdlIGRvIHdpdGggdGhpcyBvbmU/IEkgZGlkbid0IGxv
b2sgYXQgdGhlIGRldGFpbHMgeWV0LCBidXQKPiBkbyB3ZSBoYXZlIGFueSBvdGhlciBvcHRpb24g
dGhhbiB0byByZXZlcnQ/CgpJIGJlbGlldmUgdGhpcyBpcyBhbiBpc3N1ZSBpbiBCZW4ncyB1c2Vy
c3BhY2UgKGhlIHNlbnQgbWUgbG9ncwpwcml2YXRlbHkpIG9yIHNvbWUgc29ydCBvZiBrZXJuZWwg
ZXZlbnQgYnVnLiBJdCBiYXNpY2FsbHkgbG9va2VkIGxpa2UKdGhpczogYm90aCBkZXZpY2VzIHdl
cmUgZGV0ZWN0ZWQgYnkgYXRoMTBrIGFuZCBib3RoIHN0YXJ0ZWQKcmVnaXN0ZXJfd29yay4gT25l
IG9mIHRoZSBkZXZpY2VzIGxvYWRlZCBhbGwgdGhlIHdheSB3aGlsZSB0aGUgb3RoZXIKdHJpZWQg
dG8gbG9hZCBhIGZldyBub24tZXhpc3RpbmcgZmlybXdhcmUgZmlsZXMgYW5kIGl0IHN0b3BwZWQu
IEZldwptaW51dGVzIGxhdGVyIHRoZXJlIHdhcyBhIGh1bmcgdGFzayBzcGxhdCBwb2ludGluZyB0
bwpyZXF1ZXN0X2Zpcm13YXJlKCkgY2FsbGVkIGZyb20gYXRoMTBrIHN1Z2dlc3RpbmcgdXNlcnNw
YWNlIGRpZG4ndApoYW5kbGUgZmlybXdhcmUgcmVxdWVzdC4KClRoZSAib2ZmZW5kaW5nIiBwYXRj
aCBlZmZlY3RpdmVseSByZW1vdmVkIDIwMG1zIGZyb20gcHJvYmUoKSBpbgphdGgxMGsuIFRoaXMg
Y291bGQndmUgY2hhbmdlIHRpbWluZyBvbiByZXF1ZXN0X2Zpcm13YXJlKCkgY2FsbHMgb24KQmVu
J3Mgc3lzdGVtLiBCdHcuIHRoZSAyMDBtcyBpcyBiYWNrIGFnYWluIG5vdyB3aXRoCjFhN2ZlY2I3
NjZjODNkYWNlNzQ3ZjQyYjI1YmJiNTQ0YjAwYTAxNjMgKCJhdGgxMGs6IHJlc2V0IGNoaXAgYmVm
b3JlCnJlYWRpbmcgY2hpcF9pZCBpbiBwcm9iZSIpLgoKTWFyZWsgdHJpZWQgcnVubmluZyAyIHFj
YTk4OHggb24gaGlzIGxhcHRvcCBzb21lIHRpbWUgYWdvICh3aXRoIGFuZAp3aXRob3V0IHRoZSBl
eHRyYSB0aW1pbmcpIGFuZCBkaWRuJ3QgaGF2ZSBhbnkgaXNzdWVzLgoKCk1pY2hhxYIKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5n
IGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
