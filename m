Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtps.newmedia-net.de ([2a05:a1c0:0:de::167]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fAufa-0003Na-QU
 for ath10k@lists.infradead.org; Tue, 24 Apr 2018 09:55:51 +0000
Subject: Re: [PATCH] ath10k: add dynamic vlan support
References: <1524232653-22573-1-git-send-email-mpubbise@codeaurora.org>
 <87r2n5auvq.fsf@kamboji.qca.qualcomm.com>
 <aa04534d-9677-f42e-a239-b230093ef2f5@dd-wrt.com>
 <874lk1orsq.fsf@codeaurora.org>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <f3b67b23-8d6d-5bce-718e-d3e198e800d1@dd-wrt.com>
Date: Tue, 24 Apr 2018 11:55:17 +0200
MIME-Version: 1.0
In-Reply-To: <874lk1orsq.fsf@codeaurora.org>
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
Cc: Manikanta Pubbisetty <mpubbise@codeaurora.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

QW0gMjQuMDQuMjAxOCB1bSAxMTo1MiBzY2hyaWViIEthbGxlIFZhbG86Cj4gU2ViYXN0aWFuIEdv
dHRzY2hhbGwgPHMuZ290dHNjaGFsbEBkZC13cnQuY29tPiB3cml0ZXM6Cj4KPj4gY29uc2lkZXIg
bXkgY29tbWVudCByZWdhcmRpbmcgdmxhbl9hcC4KPiBJIGFtIGNvbnNpZGVyaW5nIGNvbW1lbnQs
IEkganVzdCBnbyBvbmUgaXNzdWUgYXQgYSB0aW1lIGFuZCBoYXZlbid0IGhhZAo+IGEgdGltZSB0
byBsb29rIGF0IHlvdXIgY29tbWVudC4gQnV0IFBMRUFTRSBkbyBub3QgdG9wIHBvc3QsIGl0J3Mg
dmVyeQo+IGFubm95aW5nIGFuZCBjcmVhdGVzIGEgbWVzcyBpbiBwYXRjaHdvcmsuCj4KPiBodHRw
czovL3dpcmVsZXNzLndpa2kua2VybmVsLm9yZy9lbi9kZXZlbG9wZXJzL2RvY3VtZW50YXRpb24v
c3VibWl0dGluZ3BhdGNoZXMjZG9fbm90X3RvcF9wb3N0X2FuZF9lZGl0X3lvdXJfcXVvdGVzCmkg
YWxtb3N0IGRvIHRvcCBwb3N0cyBmb3IgYSBzaW5nbGUgcmVhc29uLiB5b3UgaGF2ZSB0byBzY3Jv
bGwgZG93biBhIApsb25nIHRpbWUgc29tZXRpbWVzIHRvIGdldCB0aGUgZXNzZW50aWFsIGluZm9y
bWF0aW9uLgppIGRvbnQga25vdyB3aHkgbW9zdCBwZW9wbGUgaW4gbXkgY291bnRyeSBwcmVmZXIg
dG9wIHBvc3RpbmcuIGkgd2lsbCB0cnkgCnRvIHJlbWVtYmVyIGFuZCBjaGFuZ2UgaXQgaW4gZnV0
dXJlCj4KCi0tIApNaXQgZnJldW5kbGljaGVuIEdyw7xzc2VuIC8gUmVnYXJkcwoKU2ViYXN0aWFu
IEdvdHRzY2hhbGwgLyBDVE8KCk5ld01lZGlhLU5FVCBHbWJIIC0gREQtV1JUCkZpcm1lbnNpdHo6
ICBTdHViZW53YWxkYWxsZWUgMjFhLCA2NDYyNSBCZW5zaGVpbQpSZWdpc3RlcmdlcmljaHQ6IEFt
dHNnZXJpY2h0IERhcm1zdGFkdCwgSFJCIDI1NDczCkdlc2Now6RmdHNmw7xocmVyOiBQZXRlciBT
dGVpbmjDpHVzZXIsIENocmlzdGlhbiBTY2hlZWxlCmh0dHA6Ly93d3cuZGQtd3J0LmNvbQplbWFp
bDogcy5nb3R0c2NoYWxsQGRkLXdydC5jb20KVGVsLjogKzQ5NjI1MS01ODI2NTAgLyBGYXg6ICs0
OTYyNTEtNTgyNjU2NQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
