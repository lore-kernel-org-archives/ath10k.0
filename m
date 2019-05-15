Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtps.newmedia-net.de ([2a05:a1c0:0:de::167]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQlVE-0004Ma-Ir
 for ath10k@lists.infradead.org; Wed, 15 May 2019 04:26:54 +0000
Subject: Re: Problem with 9984 in routed mode with 512b frames.
References: <e11b8d7f-bc28-bc66-fb8c-ff4db22d7c46@candelatech.com>
From: Sebastian Gottschall <s.gottschall@newmedia-net.de>
Message-ID: <daaad6d3-cf60-4ddc-af20-279a0cbbbe0c@newmedia-net.de>
Date: Wed, 15 May 2019 06:26:33 +0200
MIME-Version: 1.0
In-Reply-To: <e11b8d7f-bc28-bc66-fb8c-ff4db22d7c46@candelatech.com>
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
To: Ben Greear <greearb@candelatech.com>, ath10k <ath10k@lists.infradead.org>

Y2FuIHlvdSBzZW5kIG1lIGEgZGV0YWlsZWQgaW5zdHJ1Y3Rpb24gZm9yIHRlc3RpbmcgdGhpcyBv
biBteSBkZXZpY2VzPyAKc28gd2hpY2ggY29tbWFuZHMgaGF2ZSBiZWVuIHVzZWQgZm9yIGdlbmVy
YXRpbmcgdGhlIHRyYWZmaWMgZXRjLiAoaXBlcmYzPykKClNlYmFzdGlhbgoKQW0gMTUuMDUuMjAx
OSB1bSAwMzo1MiBzY2hyaWViIEJlbiBHcmVlYXI6Cj4gSGVsbG8sCj4KPiBJIGZvdW5kIGEgc3Ry
YW5nZSBpc3N1ZSBhbmQgY3VyaW91cyBpZiBzb21lb25lIGhhcyBzZWVuIHNpbWlsYXIuCj4KPiBJ
IG1hZGUgYW4gQVAgd2hlcmUgdGhlIEFQIGludGVyZmFjZSBhY3RzIGFzIGEgcm91dGVkIGludGVy
ZmFjZS7CoCBJIAo+IGdlbmVyYXRlCj4gdHJhZmZpYyB0aHJvdWdoIGFub3RoZXIgaW50ZXJmYWNl
IGluIHRoZSByb3V0ZXIuwqAgV2hlbiBzZW5kaW5nIDMwME1icHMgCj4gb2YgNTEyIGJ5dGUKPiBV
RFAgcGF5bG9hZHMsIGluIHRoZSBkb3duc3RyZWFtIGRpcmVjdGlvbiwgYW5kIHdpdGggdGhlIHN0
YXRpb24gYmVpbmcgCj4gYSAxeDEgL0FDIGRldmljZSwKPiB0aGVuIHRoZSBBUCBOSUMgYXBwZWFy
cyB0byBtb3N0bHkgbG9jayB1cCB3aXRoaW4gYWJvdXQgMSBtaW51dGUuIEkgCj4gc3RpbGwgc2Vl
IGJlYWNvbnMsIGJ1dCBubwo+IGRhdGEgZnJhbWVzLsKgIEluIHNvbWUgY2FzZXMsIEkgcmVwcm9k
dWNlZCB3aXRoIHZlcnkgc2xvdyBzcGVlZCB0cmFmZmljIAo+IGFzIHdlbGwuCj4KPiBJIHRyaWVk
IHVzaW5nIGEgbW9zdGx5IHVuLW1vZGlmaWVkIGZpcm13YXJlIChpZSwgc2ltaWxhciB0byB1cHN0
cmVhbSAKPiBRQ0EpLCBhcyB3ZWxsIGFzIG15Cj4gaGFja2VkIHVwb24gZmlybXdhcmUsIGFuZCBh
bGwgYWN0IHNpbWlsYXJseS7CoCBJJ20gdXNpbmcgdGhlIDQuMjAgCj4ga2VybmVsLCBidXQgYXQg
bGVhc3QgZm9yIG5vdywKPiBpdCBkb2VzIG5vdCBhcHBlYXIgdG8gYmUgYSBrZXJuZWwgaXNzdWUu
Cj4KPiBJZiBJIHVzZSBsYXJnZXIgTVRVIHNpemVkIGZyYW1lcywgb3IgaGF2ZSBhIDJ4MiBzdGF0
aW9uIGluc3RlYWQgb2YgMXgxIAo+IHRoZW4gaXQgaXMgbXVjaCBoYXJkZXIKPiB0byByZXByb2R1
Y2UgKGFuZCBtYXliZSBjYW5ub3QgYmUgcmVwcm9kdWNlZCkuwqAgQWxzbywgd2hlbiBnZW5lcmF0
aW5nIAo+IHRyYWZmaWMgZGlyZWN0bHkgb24KPiB0aGUgQVAgZGV2aWNlIGluc3RlYWQgb2YgdXNp
bmcgdGhlIHJvdXRlZCBpbnRlcmZhY2UgYXMgYSB0cmFmZmljIAo+IHNvdXJjZSwgaXQgaXMgaGFy
ZGVyIHRvCj4gcmVwcm9kdWNlLgo+Cj4gVGhhbmtzLAo+IEJlbgo+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEw
a0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vYXRoMTBrCg==
