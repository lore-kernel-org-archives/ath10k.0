Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtps.newmedia-net.de ([2a05:a1c0:0:de::167]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eH3Uh-0003UF-C1
 for ath10k@lists.infradead.org; Tue, 21 Nov 2017 08:01:30 +0000
Subject: Re: [PATCHv3 1/2] ath10k: add per peer htt tx stats support for 10.4
References: <1479227849-10042-1-git-send-email-akolli@qti.qualcomm.com>
 <2831996.nqnu04nqHR@bentobox> <87tvxocbcn.fsf@kamboji.qca.qualcomm.com>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <9ab6ffcf-0131-1fb1-13ef-076ec54bd582@dd-wrt.com>
Date: Tue, 21 Nov 2017 09:00:54 +0100
MIME-Version: 1.0
In-Reply-To: <87tvxocbcn.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>, Sven Eckelmann <sven.eckelmann@openmesh.com>
Cc: Yifeng Tu <yifeng@qti.qualcomm.com>, Daniel Jeang <dyjeong@qti.qualcomm.com>, Anilkumar Kolli <akolli@qti.qualcomm.com>, "akolli@codeaurora.org" <akolli@codeaurora.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

QW0gMjEuMTEuMjAxNyB1bSAwODo1OCBzY2hyaWViIEthbGxlIFZhbG86Cj4gU3ZlbiBFY2tlbG1h
bm4gPHN2ZW4uZWNrZWxtYW5uQG9wZW5tZXNoLmNvbT4gd3JpdGVzOgo+Cj4+IE9uIERpZW5zdGFn
LCAxNS4gTm92ZW1iZXIgMjAxNiAyMjowNzoyOSBDRVQgYWtvbGxpQHF0aS5xdWFsY29tbS5jb20g
d3JvdGU6Cj4+PiBGcm9tOiBBbmlsa3VtYXIgS29sbGkgPGFrb2xsaUBxdGkucXVhbGNvbW0uY29t
Pgo+Pj4KPj4+IFBlciBwZWVyIHR4IHN0YXRzIGFyZSBwYXJ0IG9mICdIVFRfMTBfNF9UMkhfTVNH
X1RZUEVfUEVFUl9TVEFUUycKPj4+IGV2ZW50LCBGaXJtd2FyZSBzZW5kcyBvbmUgSFRUIGV2ZW50
IGZvciBldmVyeSBmb3VyIFBQRFVzLgo+Pj4gSFRUIHBheWxvYWQgaGFzIHN1Y2Nlc3MgcGt0cy9i
eXRlcywgZmFpbGVkIHBrdHMvYnl0ZXMsIHJldHJ5Cj4+PiBwa3RzL2J5dGVzIGFuZCByYXRlIGlu
Zm8gcGVyIHBwZHUuCj4+PiBQZWVyIHN0YXRzIGFyZSBlbmFibGVkIHRocm91Z2ggJ1dNSV9TRVJW
SUNFX1BFRVJfU1RBVFMnLAo+Pj4gd2hpY2ggYXJlIG5vd2FkYXlzIGVuYWJsZWQgYnkgZGVmYXVs
dC4KPj4+Cj4+PiBQYXJzZSBwZWVyIHN0YXRzIGFuZCB1cGRhdGUgdGhlIHR4IHJhdGUgaW5mb3Jt
YXRpb24gcGVyIFNUQS4KPj4+Cj4+PiB0eCByYXRlLCBQZWVyIHN0YXRzIGFyZSB0ZXN0ZWQgb24g
UUNBNDAxOSB3aXRoIEZpcm13YXJlIHZlcnNpb24KPj4+IDEwLjQtMy4yLjEtMDAwMjguCj4+Pgo+
Pj4gU2lnbmVkLW9mZi1ieTogQW5pbGt1bWFyIEtvbGxpIDxha29sbGlAcXRpLnF1YWxjb21tLmNv
bT4KPj4gV2h5IGlzIHRoZSBzdXBwb3J0IGZvciAxMC4yLjQgZmlybXdhcmUgbm90IHVwc3RyZWFt
ZWQ/IEkgbWVhbiB0aGUgb25lIHdoaWNoIGlzCj4+IHVzaW5nIHBrdGxvZyB0byB0cmFuc2ZlciB0
aGUgUEVFUl9TVEFUUyBpbmZvcm1hdGlvbi4KPiBJJ20gbm90IHN1cmUgd2hhdCB5b3UgYXJlIGFz
a2luZy4gSWYgeW91IGFyZSBhc2tpbmcgdGhlIGZpcm13YXJlIHJlbGVhc2UKPiBtZW50aW9uZWQg
aW4gdGhlIGNvbW1pdCBsb2cgdGhhdCdzIGluIGF0aDEway1maXJtd2FyZToKPgo+IGh0dHBzOi8v
Z2l0aHViLmNvbS9rdmFsby9hdGgxMGstZmlybXdhcmUvdHJlZS9tYXN0ZXIvUUNBNDAxOS9odzEu
MC8zLjIuMQo+Cj4gQnV0IEknbSBzdXJlIHlvdSBrbm93IHRoYXQgYWxyZWFkeS4KCmkgYmVsaWV2
ZSBoZSBpcyBqdXN0IHRhbGtpbmcgYWJvdXQgYSBwYXRjaCB3aGljaCBhbGxvd3MgdG8gZ2V0IHN0
YXRpb24gCnN0YXRpc3RpY3MgbGlrZSByeCBhbmQgdHggcmF0ZSBvbiB0aGUgZmlybWFyZSAxMC4y
IHNlcmllcyB3aGljaCBpcyAKcWNhOTg4eCBtYWlubHkKCnRoaXMgcGF0Y2ggd2FzIHBvc3RlZCBo
ZXJlIG1vbnRocyBhZ28gYnV0IG5ldmVyIGdvdCB1cHN0cmVhbQoKPgoKLS0gCk1pdCBmcmV1bmRs
aWNoZW4gR3LDvHNzZW4gLyBSZWdhcmRzCgpTZWJhc3RpYW4gR290dHNjaGFsbCAvIENUTwoKTmV3
TWVkaWEtTkVUIEdtYkggLSBERC1XUlQKRmlybWVuc2l0ejogIFN0dWJlbndhbGRhbGxlZSAyMWEs
IDY0NjI1IEJlbnNoZWltClJlZ2lzdGVyZ2VyaWNodDogQW10c2dlcmljaHQgRGFybXN0YWR0LCBI
UkIgMjU0NzMKR2VzY2jDpGZ0c2bDvGhyZXI6IFBldGVyIFN0ZWluaMOkdXNlciwgQ2hyaXN0aWFu
IFNjaGVlbGUKaHR0cDovL3d3dy5kZC13cnQuY29tCmVtYWlsOiBzLmdvdHRzY2hhbGxAZGQtd3J0
LmNvbQpUZWwuOiArNDk2MjUxLTU4MjY1MCAvIEZheDogKzQ5NjI1MS01ODI2NTY1CgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcg
bGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
