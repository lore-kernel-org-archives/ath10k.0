Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x231.google.com ([2a00:1450:400c:c00::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wkq2G-000514-7E
 for ath10k@lists.infradead.org; Thu, 15 May 2014 07:25:01 +0000
Received: by mail-wg0-f49.google.com with SMTP id m15so2967810wgh.8
 for <ath10k@lists.infradead.org>; Thu, 15 May 2014 00:24:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <53727C12.2060100@candelatech.com>
References: <1396611464-5940-1-git-send-email-michal.kazior@tieto.com>
 <1397040531-6224-1-git-send-email-michal.kazior@tieto.com>
 <1397040531-6224-5-git-send-email-michal.kazior@tieto.com>
 <53727C12.2060100@candelatech.com>
Date: Thu, 15 May 2014 09:24:31 +0200
Message-ID: <CA+BoTQ=05fULptYqAecf-9jsq_aun_NsNT=c2-ZFxm96ymgQdg@mail.gmail.com>
Subject: Re: [RFTv2 4/5] ath10k: wait for mgmt tx when flushing too
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
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMTMgTWF5IDIwMTQgMjI6MDksIEJlbiBHcmVlYXIgPGdyZWVhcmJAY2FuZGVsYXRlY2guY29t
PiB3cm90ZToKPiBPbiAwNC8wOS8yMDE0IDAzOjQ4IEFNLCBNaWNoYWwgS2F6aW9yIHdyb3RlOgo+
PiBUaGUgMTAuMSBmaXJtd2FyZSB1c2VzIFdNSSB0byBUeCBtYW5hZ2VtZW50IGZyYW1lcwo+PiBi
dXQgYXRoMTBrX2ZsdXNoKCkgZGlkbid0IGNhcmUuIFRoaXMgY291bGQgbGVhZCB0bwo+PiBzb21l
IGZyYW1lcyBub3QgYmVpbmcgc2VudC4KPj4KPj4gQWx0aG91Z2ggdGhlcmUgYXJlIG5vIFR4IGNv
bXBsZXRpb25zIGZvciBXTUkKPj4gbWFuZ2VtZW50IGZyYW1lcyBpdCdzIHN0aWxsIGJldHRlciB0
byBhdCBsZWFzdAo+PiB3YWl0IGZvciBhdGgxMGsgcXVldWUgdG8gYmUgZHJhaW5lZC4KPgo+IFRo
aXMgYW5kIG90aGVycyBpbiB0aGlzIHNlcmllcyBkbyBub3QgYXBwZWFyIHRvIGJlIGluIEthbGxl
J3MKPiB0cmVlIHlldC4gIEFyZSB0aGVzZSB0byBiZSBkcm9wcGVkLCBvciBhcmUgdGhleSBzdGls
bCBwZW5kaW5nPwoKQ29uc2lkZXIgaXQgZHJvcHBlZCBmb3Igbm93LCBwbGVhc2UuIFRoaXMgbmVl
ZHMgZmlybXdhcmUgY2hhbmdlcyB0byBiZQpkZWFsdCB3aXRoIHByb3Blcmx5LgoKSW4gdGhlIG1l
YW50aW1lIGlmIHlvdSB3YW50IHRvIGhhc3RlbiB0eCBxdWV1ZSBwcyBleHBpcmF0aW9uIHlvdSBj
YW4KdHJ5IHRvIHNldCBgYXBfZGV0ZWN0X291dF9vZl9zeW5jX3NsZWVwaW5nX3N0YV90aW1lX3Nl
Y3NgIHZkZXYgcGFyYW0KdG8gMSBzZWNvbmQgKGRlZmF1bHQgaXMgMTAgc2V0IGluIGZpcm13YXJl
IGlmIEknbSBub3QgbWlzdGFrZW4pLiBJCmhhdmVuJ3QgdGVzdGVkIGl0IGJ1dCB0aGlzIHNob3Vs
ZCBpbiB0aGVvcnkgc2hvcnRlbiB0eCBjcmVkaXQKc3RhcnZhdGlvbiBkdXJhdGlvbiBhbmQgYXZv
aWQgY2FzY2FkZSBvZiB3bWkgdGltZW91dHMgKHdtaSB0aW1lb3V0PTMKc2Vjb25kcywgbWF4IG1n
bXQgdHggcGVuZGluZz0yIHggMSBzZWNvbmQgZWFjaD0ycyB3b3JzdCBjYXNlKSBhcyB3ZWxsCmFz
IHNob3VsZCBwcmV2ZW50IHR4IGZsdXNoaW5nIGZyb20gZmFpbGluZyAodGltZW91dD01KS4gVGhp
cyB3aWxsIG5vdApwcmV2ZW50IGZyb20gYmVhY29uIFNXQkEgb3ZlcnJ1bnMgYmVjYXVzZSB0eCBz
dGFydmF0aW9uIGlzIHN0aWxsCnBvc3NpYmxlIGFsdGhvdWdoIGl0IHNob3VsZCBiZSBmYXN0ZXIg
dG8gcmVjb3Zlci4KCkkgd29uZGVyIGlmIGl0J3MgcmVhc29uYWJsZSB0byBzZXQgdGhpcyB2ZGV2
IHBhcmFtIGV4cGxpY2l0bHkgaW4KdXBzdHJlYW0gZHJpdmVyLiBXZSBzaG91bGQgcHJvYmFibHkg
Y29uc2lkZXIgbG9uZ2VzdCBiZWFjb24gaW50ZXJ2YWwKaW4gZWZmZWN0IHdoZW4gY2FsY3VsYXRp
b24gdGhlIHZhbHVlIHRvIHNldC4gVGhvdWdodHMsIGFueW9uZT8KCgpNaWNoYcWCCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBs
aXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
