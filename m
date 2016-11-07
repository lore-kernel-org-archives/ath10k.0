Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c3tFa-0000C3-C7
 for ath10k@lists.infradead.org; Mon, 07 Nov 2016 23:22:51 +0000
Message-ID: <58210A18.5040604@candelatech.com>
Date: Mon, 07 Nov 2016 15:11:20 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: QCA988X firmware crash when sending in monitor mode
References: <D7E3E963-AA63-439A-AE90-E029409D3520@equus-tech.com>
 <CA+BoTQm0fE6DAd1wNXnZ_M1r_PbitQETwV+ku8Ue5h6kW67SCw@mail.gmail.com>
In-Reply-To: <CA+BoTQm0fE6DAd1wNXnZ_M1r_PbitQETwV+ku8Ue5h6kW67SCw@mail.gmail.com>
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
To: Michal Kazior <michal.kazior@tieto.com>, Ouri Lipner <lipner@equus-tech.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMTEvMDcvMjAxNiAwMzowMyBQTSwgTWljaGFsIEthemlvciB3cm90ZToKPiBPbiA3IE5vdmVt
YmVyIDIwMTYgYXQgMTU6MjIsIE91cmkgTGlwbmVyIDxsaXBuZXJAZXF1dXMtdGVjaC5jb20+IHdy
b3RlOgo+PiBIaSBhbGwsCj4+IEnigJltIGNvbnNpc3RlbnRseSBlbmNvdW50ZXJpbmcgaXNzdWVz
IHdpdGggcmF3IHdpZmkgcGFja2V0IGluamVjdGlvbi4KPj4KPj4gU2VuZGluZyBhIHJhdyBwYWNr
ZXQgaW4gbW9uaXRvciBtb2RlIGtlZXBzIGNyYXNoaW5nIHRoZSBmaXJtd2FyZS4KPj4gVGhpcyBo
YXBwZW5zIGNvbnNpc3RlbnRseSB3aXRoIGV2ZXJ5IGZpcm13YXJlIHRoYXQgc3VwcG9ydHMgcmF3
IG1vZGUuCj4+IEN1cnJlbnRseSBvbiBrZXJuZWwgNC45LXJjMiBidXQgb2xkZXIgZHJpdmVycyBi
ZWhhdmUgdGhlIHNhbWUuCj4+IElzIHRoaXMgYW4gaXNzdWVzIHdpdGggYSBtaXNzaW5nIHBhcmFt
ZXRlciAoZS5nLiBpbiBSYWRpb1RhcCkgb3IgYSByZWFsIHByb2JsZW0gd2l0aCB0aGUgZmlybXdh
cmU/Cj4KPiBUbyB0aGUgYmVzdCBvZiBteSBrbm93bGVkZ2UgZmlybXdhcmUgZG9lcyBub3Qgc3Vw
cG9ydCBmcmFtZSBpbmplY3Rpb24KPiBvbiBtb25pdG9yIHZkZXYuIFRoZXJlZm9yZSB0aGlzIGlz
IGV4cGVjdGVkLiBNb3Jlb3ZlciB0aGlzIGxpbWl0YXRpb24KPiBpcyBtZW50aW9uZWQgb24gYXRo
MTBrIHdpa2k6Cj4gaHR0cHM6Ly93aXJlbGVzcy53aWtpLmtlcm5lbC5vcmcvZW4vdXNlcnMvZHJp
dmVycy9hdGgxMGsKPgo+Cj4+IEFueSBpZGVhcz8KPgo+IFlvdSBjb3VsZCBwcm9iYWJseSBoYWNr
IHVwIHRoZSBkcml2ZXIgdG8gY3JlYXRlIGFuZCB1c2UgQVAgb3IgU1RBIHZkZXYKPiBhbG9uZ3Np
ZGUgbW9uaXRvciB2ZGV2IHRvIHVzZSBpdCdzIHZkZXZfaWQgZm9yIGZyYW1lIGluamVjdGlvbi4g
SSdtCj4gbm90IGF3YXJlIG9mIGFueW9uZSB0cnlpbmcgdGhhdCBvdXQgc28gZmFyIHRob3VnaC4K
CkkgaGFkIHRoaXMgc29ydCBvZiBoYWxmLWFyc2VkIHdvcmtpbmcgYXQgb25lIHBvaW50LCBidXQg
aXQgd2FzIHZlcnkgbGltaXR0ZWQKYW5kIGNvdWxkIG9ubHkgc2VuZCBsZWdhY3kgcmF0ZSBmcmFt
ZXMuCgpPdXJpOiAgV2hhdCBhcmUgeW91ciBnb2FscyBmb3Igc2VuZGluZyByYXcgZnJhbWVzPwoK
VGhhbmtzLApCZW4KCgotLSAKQmVuIEdyZWVhciA8Z3JlZWFyYkBjYW5kZWxhdGVjaC5jb20+CkNh
bmRlbGEgVGVjaG5vbG9naWVzIEluYyAgaHR0cDovL3d3dy5jYW5kZWxhdGVjaC5jb20KCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGlu
ZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
