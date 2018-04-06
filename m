Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtps.newmedia-net.de ([2a05:a1c0:0:de::167]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f4MSZ-0001nq-58
 for ath10k@lists.infradead.org; Fri, 06 Apr 2018 08:11:01 +0000
Subject: Re: [PATCH v12] ath10k: add LED and GPIO controlling support for
 various chipsets
References: <20180226084406.2093-1-s.gottschall@dd-wrt.com>
 <871sftemru.fsf@kamboji.qca.qualcomm.com>
 <c4a1313a-73d2-a028-4fca-09f6fb6e56bd@dd-wrt.com>
 <de9c007f-26e3-a511-e944-91e90aac7787@dd-wrt.com>
 <87h8oosqpg.fsf@codeaurora.org>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <0d1827fa-497d-7cf2-5372-74c2d1f459b2@dd-wrt.com>
Date: Fri, 6 Apr 2018 10:10:42 +0200
MIME-Version: 1.0
In-Reply-To: <87h8oosqpg.fsf@codeaurora.org>
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
Cc: Sebastian Gottschall <s.gottschall@newmedia-net.de>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

QW0gMDYuMDQuMjAxOCB1bSAxMDowNyBzY2hyaWViIEthbGxlIFZhbG86Cj4gU2ViYXN0aWFuIEdv
dHRzY2hhbGwgPHMuZ290dHNjaGFsbEBkZC13cnQuY29tPiB3cml0ZXM6Cj4KPj4gaSBoYXZlIHNv
bWUgY29tbWVudHMgYWJvdXQgeW91ciBjaGVjayB3YXJuaW5ncy4KPj4gc29tZSBvZiB0aGVtIGFy
ZSBib2d1cy4gZm9yIGluc3RhbmNlIHRoZXkgYWR2aXNlIHRvIHVzZSAidW5zaWduZWQgaW50Igo+
PiBpbnN0ZWFkIG9mICJ1bnNpZ25lZCIuIHRoaXMgbWlnaHQgYmUgYmV0dGVyLCBidXQKPj4gdGhl
IG9yaWdpbmFsIGtlcm5lbCBoZWFkZXIgdXNlcyAidW5zaWduZWQiIGFzIGFwaSBkZWZpbml0aW9u
LiBzbyBpCj4+IGRlY2lkZWQgdG8gdXNlIHRoZSBzYW1lIGRlY2xhcmF0aW9ucyBoZXJlLgo+IFN1
cmUsIGJ1dCB1c2luZyAidW5zaWduZWQgaW50IiB3b24ndCBjcmVhdGUgYW55IGhhcm0gZWl0aGVy
Lgo+Cj4+IGZvciB0aGUgcmVzdCBsaWtlIHdoaXRlc3BhY2VzIGkgd2lsbCBtYWtlIGEgbmV3IHZl
cnNpb24gYW5kIHJlbW92ZSB0aGVtCj4gWW91IG1pc3NlZCBteSBjb21tZW50IGluIG15IGVhcmxp
ZXIgbWFpbCB0aGF0IEknbGwgc2VuZCB0aGUgbmV4dAo+IHZlcnNpb24uIEkgaGF2ZSBhbHJlYWR5
IGZpeGVkIGFsbCB0aGUgd2FybmluZ3Mgc28gbGV0IG1lIHN1Ym1pdCBpdC4gSSdsbAo+IGRvIGFs
c28gc29tZSBvdGhlciBjaGFuZ2VzLgoKb2ggb2theS4gdGhhbmsgeW91LiB0aGVuIGZvcmdldCBh
bGwgdGhlIHJlc3QuIGkgd2lsbCB0YWtlIGNhcmUgb2YgdGhlc2UgCmlzc3VlcyB3aXRoIHRoZSBu
ZXh0IHBhdGNoIGkgc3VibWl0Cgo+CgotLSAKTWl0IGZyZXVuZGxpY2hlbiBHcsO8c3NlbiAvIFJl
Z2FyZHMKClNlYmFzdGlhbiBHb3R0c2NoYWxsIC8gQ1RPCgpOZXdNZWRpYS1ORVQgR21iSCAtIERE
LVdSVApGaXJtZW5zaXR6OiAgU3R1YmVud2FsZGFsbGVlIDIxYSwgNjQ2MjUgQmVuc2hlaW0KUmVn
aXN0ZXJnZXJpY2h0OiBBbXRzZ2VyaWNodCBEYXJtc3RhZHQsIEhSQiAyNTQ3MwpHZXNjaMOkZnRz
ZsO8aHJlcjogUGV0ZXIgU3RlaW5ow6R1c2VyLCBDaHJpc3RpYW4gU2NoZWVsZQpodHRwOi8vd3d3
LmRkLXdydC5jb20KZW1haWw6IHMuZ290dHNjaGFsbEBkZC13cnQuY29tClRlbC46ICs0OTYyNTEt
NTgyNjUwIC8gRmF4OiArNDk2MjUxLTU4MjY1NjUKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
YXRoMTBrCg==
