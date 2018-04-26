Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtps.newmedia-net.de ([2a05:a1c0:0:de::167]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fBbSM-00047i-OA
 for ath10k@lists.infradead.org; Thu, 26 Apr 2018 07:37:00 +0000
Subject: Re: 9984 with 10.4.3.5.3-0057 crashes
References: <1523966821-21903-1-git-send-email-pillair@codeaurora.org>
 <1523966821-21903-5-git-send-email-pillair@codeaurora.org>
 <946e582c-2438-872b-eec8-25d9dcb994d9@dd-wrt.com>
 <7a06a34a5fcb97e07a8d79b4d689e781@codeaurora.org>
 <87604oodt4.fsf@kamboji.qca.qualcomm.com>
 <a7dd1b94951725c61034f5be6744b725@codeaurora.org>
 <8736zrjgq6.fsf@kamboji.qca.qualcomm.com>
 <c48c1bae-04c9-55d0-fdb9-d9ae8f7cb843@dd-wrt.com>
 <5AD9A1DF.6060007@broadcom.com> <87wowxdirv.fsf@kamboji.qca.qualcomm.com>
 <dafff879-3630-9596-bcb6-eaf07289318d@dd-wrt.com>
 <87k1sxcgyh.fsf@kamboji.qca.qualcomm.com>
 <a58d42c2-84ca-1c17-8591-b20bfd91660c@dd-wrt.com>
 <87a7tr8g3z.fsf@kamboji.qca.qualcomm.com>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <4d620385-6726-27cd-7383-67473e1959bd@dd-wrt.com>
Date: Thu, 26 Apr 2018 09:36:29 +0200
MIME-Version: 1.0
In-Reply-To: <87a7tr8g3z.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org

QW0gMjUuMDQuMjAxOCB1bSAxNzoyMyBzY2hyaWViIEthbGxlIFZhbG86Cj4gU2ViYXN0aWFuIEdv
dHRzY2hhbGwgPHMuZ290dHNjaGFsbEBkZC13cnQuY29tPiB3cml0ZXM6Cj4KPj4gQW0gMjQuMDQu
MjAxOCB1bSAwNzoyNyBzY2hyaWViIEthbGxlIFZhbG86Cj4+PiBTZWJhc3RpYW4gR290dHNjaGFs
bCA8cy5nb3R0c2NoYWxsQGRkLXdydC5jb20+IHdyaXRlczoKPj4+Cj4+Pj4ganVzdCBmb3IgeW91
ciBub3RpY2UuIDEwLjQuMy41LjMtMDA1NyBvbiA5OTg0IHdoaWNoIHdhcyBqdXN0IHJlbGVhc2Vk
Cj4+Pj4gY3Jhc2hlcyBpbiB2aHQxNjAgb3BlcmF0aW9uIG1vZGUgaW1tZWRpYXRseSBhZnRlciBm
aXJzdCBzdGF0aW9uCj4+Pj4gYXNzb2NpYXRlcwo+Pj4+IGxhc3Qga25vd24gd29ya2luZyBzdGFi
bGUgZncgc28gZmFyIGlzIDEwLjQtMy40LTAwMTA0LiB0aGUgd2hvbGUKPj4+PiAxMC40LjMuNS4z
IHNlcmllcyBzZWVtIHRvIGJlIHNlcmlvdXNseSBicm9rZW4gb3IgdGhlIGFwaSBoYXMgYmVlbgo+
Pj4+IGNoYW5nZWQgaW4gYSB3YXkKPj4+PiB3aGljaCBpcyB1bnN1cHBvcnRlZCBieSBhdGgxMGsg
KHdoaWNoIGkgdGhpbmsgaXMgdGhlIGNhdXNlIG9mIHRoZQo+Pj4+IHByb2JsZW0pCj4+Pj4gaXQg
d291bGQgYmUgZ29vZCB0byBrbm93IHdoYXQgaGFzIGJlZW4gY2hhbmdlZC4KPj4+IEF0IGxlYXN0
IEkgd2FzIG5vdCBpbmZvcm1lZCBhbnkgY2hhbmdlcyBpbiB0aGUgZmlybXdhcmUgaW50ZXJmYWNl
LiBXaGF0Cj4+PiB2ZXJzaW9uIG9mIGF0aDEwayBhcmUgeW91IHVzaW5nPyBEbyB5b3UgaGF2ZSBh
bnkgY3VzdG9tIHBhdGNoZXMgb24KPj4+IGF0aDEwaz8KPj4gaSdtIHVzaW5nIGxhdGVzdCBnaXQg
dmVyc2lvbiBmb3IgdGVzdGluZyBoZXJlIGJ1dCB0aGVyZSBpcyBvbmUKPj4gcmVsZXZhbnQgcGF0
Y2ggcmVxdWlyZWQgZm9yIG1vcmUgcmVjZW50IGZpcm13YXJlcyBsaWtlIDMuNCBzZXJpZXMgKHNl
ZQo+PiBiZWxvdykgaSBwb3N0ZWQgYWxyZWFkeSBhIGxvbmcgdGltZSBhZ28sIHRoYXQgdmh0MTYw
IHdpbGwgbm90IHdvcmsKPj4gYW55bW9yZSB3aXRob3V0IHRoYXQgcGF0Y2ggaW4gbmV3ZXIgZmly
bXdhcmVzIHNpbmNlIHFjYSBjaGFuZ2VkIHRoZSBhcGkKPj4gZm9yIGNoYW5uZWwgbWFwcGluZyBp
biB2aHQxNjAuCj4gSSBkb24ndCByZW1lbWJlciB3aGF0IGhhcHBlbmVkIHRvIHRoYXQgcGF0Y2gs
IGJ1dCBwbGVhc2UgcmVzdWJtaXQgaXQKPiB3aXRoIGEgcHJvcGVyIGNvbW1pdCBsb2cgYW5kIFMt
by1iIGxpbmUuCj4KPiBJIHdhcyB0b2xkIHRoYXQgdGhlIGZpcm13YXJlIGNyYXNoIGlzIGFuIGFz
c2VydCB0cmlnZ2VyZWQgYnkgaG9zdCBub3QKPiBwb3B1bGF0aW5nIHRoZSBwYXJhbWV0ZXIgJ3Bl
ZXJfYndfcnhuc3Nfb3ZlcnJpZGUnIGluCj4gV01JX1BFRVJfQVNTT0NfQ01ESUQgd2hpY2ggaXMg
bmVlZGVkIGZvciAxNjAvODArODAgb3BlcmF0aW9uLgpnb29kIG5ld3MuIHlvdXIgaGludCBoZWxw
ZWQgbWUgdG8gZGV2ZWxvcCBhIGZpeC4gd2lsbCBwb3N0IHRoZSBwYXRjaCAKc29vbiBoZXJlCgoK
LS0gCk1pdCBmcmV1bmRsaWNoZW4gR3LDvHNzZW4gLyBSZWdhcmRzCgpTZWJhc3RpYW4gR290dHNj
aGFsbCAvIENUTwoKTmV3TWVkaWEtTkVUIEdtYkggLSBERC1XUlQKRmlybWVuc2l0ejogIFN0dWJl
bndhbGRhbGxlZSAyMWEsIDY0NjI1IEJlbnNoZWltClJlZ2lzdGVyZ2VyaWNodDogQW10c2dlcmlj
aHQgRGFybXN0YWR0LCBIUkIgMjU0NzMKR2VzY2jDpGZ0c2bDvGhyZXI6IFBldGVyIFN0ZWluaMOk
dXNlciwgQ2hyaXN0aWFuIFNjaGVlbGUKaHR0cDovL3d3dy5kZC13cnQuY29tCmVtYWlsOiBzLmdv
dHRzY2hhbGxAZGQtd3J0LmNvbQpUZWwuOiArNDk2MjUxLTU4MjY1MCAvIEZheDogKzQ5NjI1MS01
ODI2NTY1CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
