Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-yk0-x232.google.com ([2607:f8b0:4002:c07::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2xBD-0003Xu-U8
 for ath10k@lists.infradead.org; Thu, 11 Jun 2015 07:45:40 +0000
Received: by ykfl8 with SMTP id l8so33578194ykf.1
 for <ath10k@lists.infradead.org>; Thu, 11 Jun 2015 00:45:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <557608ED.7070200@candelatech.com>
References: <5575BEB1.4010706@candelatech.com> <5575C6E4.6050809@dd-wrt.com>
 <5575F0E2.202@candelatech.com> <5575F4EE.9010700@candelatech.com>
 <557607BD.2040608@dd-wrt.com> <557608ED.7070200@candelatech.com>
Date: Thu, 11 Jun 2015 09:45:15 +0200
Message-ID: <CA+BoTQmsRffFsL3+X0v+hPG=E5THBpxk94CdYLHEOtb-vFVFcw@mail.gmail.com>
Subject: Re: Does the reg_addr/reg_value reading work?
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
To: Ben Greear <greearb@candelatech.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Sebastian Gottschall <s.gottschall@dd-wrt.com>

T24gOCBKdW5lIDIwMTUgYXQgMjM6MjgsIEJlbiBHcmVlYXIgPGdyZWVhcmJAY2FuZGVsYXRlY2gu
Y29tPiB3cm90ZToKPiBPbiAwNi8wOC8yMDE1IDAyOjIzIFBNLCBTZWJhc3RpYW4gR290dHNjaGFs
bCB3cm90ZToKPj4gQW0gMDguMDYuMjAxNSB1bSAyMjowMiBzY2hyaWViIEJlbiBHcmVlYXI6Cj4+
PiBPbiAwNi8wOC8yMDE1IDEyOjQ1IFBNLCBCZW4gR3JlZWFyIHdyb3RlOgo+Pj4+IE9uIDA2LzA4
LzIwMTUgMDk6NDYgQU0sIFNlYmFzdGlhbiBHb3R0c2NoYWxsIHdyb3RlOgpbLi4uXQo+Pj4+PiBl
Y2hvIDB4MjA4MGUwID4gL2RlYnVnL2llZWU4MDIxMS93aXBoeTAvYXRoMTBrL3JlZ19hZGRyCj4+
Pj4gVGhpcyBjcmFzaGVzIG15IGtlcm5lbC4uLi5JIGluc3RydW1lbnRlZCB0aGUgcGxhY2UgdGhh
dCBjcmFzaGVkIGluIGF0aDEway9wY2kuaDoKPj4+Pgo+Pj4+IFsgIDEwMC42NzYwMTNdIGF0aDEw
ay1wY2ktcmVhZDMyOiBhciBmZmZmODgwMjAyNzlhZTIwICBhcl9wY2kgZmZmZjg4MDIwMjc5ZGYw
OCAgb2Zmc2V0OiAweDIwODBlMAo+Pj4+IFsgIDEwMC42NzYwMTZdICAgYXJfcGNpLT5tZW06IDB4
ZmZmZmM5MDAxOWM4MDAwMAo+Pj4+IFsgIDEwMC42NzYwMzFdIEJVRzogdW5hYmxlIHRvIGhhbmRs
ZSBrZXJuZWwgcGFnaW5nIHJlcXVlc3QgYXQgZmZmZmM5MDAxOWU4ODBlMAo+Pj4+IFsgIDEwMC42
ODE3NTJdIElQOiBbPGZmZmZmZmZmODEzNjRhZDQ+XSBpb3JlYWQzMisweDkvMHgyZgo+Pj4+Cj4+
Pj4gSGF2ZSB5b3UgdHJpZWQgdGhpcyBvbiBhIDEwLjEuNDY3IGZpcm13YXJlPwo+Pj4+Cj4+Pj4g
QW5kLCB3aGF0IGtlcm5lbD8gIEknbSB0cnlpbmcgNC4wLjQrCj4+PiBJIHdhcyB1c2luZyB0aGUg
d3JvbmcgYWRkcmVzcyB2YWx1ZS4uaXQgc2hvdWxkIGJlIDB4MjgwZTAuICBNYXliZSB0aGUgZHJp
dmVyIHNob3VsZCBzdGlsbCBrZWVwIHVzIGZyb20KPj4+IGNyYXNoaW5nIHRoZSB3aG9sZSBrZXJu
ZWwgKHdoaWxlIGhvbGRpbmcgbG9ja3MhKSwgYnV0IGF0IGxlYXN0IGl0IHdvcmtzIHdoZW4gSSBw
dXQgaW4KPj4+IHRoZSByaWdodCB2YWx1ZS4KPj4gbm93IHRoYXQgeW91IHNheSBpdC4gaSBzZWUg
aXQgdG9vLiBidXQgcGxheWluZyBkaXJlY3QgcmVnaXN0ZXIgd3JpdGVzIGNhbiBhbHdheXMgbGVh
ZCB0byBwcm9ibGVtYXRpYyBzY2VuYXJpb3MuIGl0cyBhIGRlYnVnIHJlZ2lzdGVyLiBmcm9tIG15
IG9wcGluaW9uLCBhIGRlYnVnCj4+IHJlZ2lzdGVyIHNob3VsZCBhbGxvdwo+PiB3aGF0ZXZlciBp
cyBwb3NzaWJsZS4gZXZlbiBjcmFzaGluZyBzb21ldGhpbmcuIGl0cyBsaWtlIHVzaW5nIC9kZXYv
a21lbQo+Cj4gSSBhbSBndWVzc2luZyB0aGUgZHJpdmVyIGtub3dzIHRoZSBwY2kgYWRkcmVzcyBz
cGFjZSB0aGF0IGlzIGF2YWlsYWJsZS4uaXQgY291bGQgcHJvYmFibHkKPiBqdXN0IGxpbWl0IGFu
eSBhY2Nlc3Mgb3V0c2lkZSB0aG9zZSBib3VuZHMgc2luY2UgdGhleSBjYW4gbmV2ZXIgd29yayBh
bnl3YXkuCj4KPiBBbnl3YXksIEknbGwgbGV0IHNvbWVvbmUgZWxzZSBkZWFsIHdpdGggaXQgaWYg
dGhleSB3YW50LgoKWWVwLiBJJ3ZlIGp1c3Qgc2VudCBhIHBhdGNoIGZvciByZXZpZXcgd2hpY2gg
aW50cm9kdWNlcyBhIHNhbml0eSBjaGVjawp0byBwcmV2ZW50IG91dCBvZiBib3VuZHMgTU1JTyBh
Y2Nlc3MuCgoKTWljaGHFggoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
