Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdBfT-0001TO-NS
 for ath10k@lists.infradead.org; Mon, 25 May 2020 11:53:22 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath10k: add SDIO firmware for QCA9377 WiFi
References: <20200524135933.1623-1-christianshewitt@gmail.com>
 <CA+5PVA5K0naJRhBvmDmArkBWQBCuA6p2yP+pYPMr3dZ47q53aQ@mail.gmail.com>
 <37BB0344-C9EB-41F5-87E7-D66DA45A488E@gmail.com>
Date: Mon, 25 May 2020 14:53:10 +0300
In-Reply-To: <37BB0344-C9EB-41F5-87E7-D66DA45A488E@gmail.com> (Christian
 Hewitt's message of "Mon, 25 May 2020 09:09:35 +0400")
Message-ID: <871rn89qop.fsf@codeaurora.org>
MIME-Version: 1.0
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
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Josh Boyer <jwboyer@kernel.org>, Linux Wireless <linux-wireless@vger.kernel.org>, Linux Firmware <linux-firmware@kernel.org>, ath10k@lists.infradead.org

Q2hyaXN0aWFuIEhld2l0dCA8Y2hyaXN0aWFuc2hld2l0dEBnbWFpbC5jb20+IHdyaXRlczoKCj4+
IE9uIDI0IE1heSAyMDIwLCBhdCA4OjM0IHBtLCBKb3NoIEJveWVyIDxqd2JveWVyQGtlcm5lbC5v
cmc+IHdyb3RlOgo+PiAKPj4gT24gU3VuLCBNYXkgMjQsIDIwMjAgYXQgOTo1OSBBTSBDaHJpc3Rp
YW4gSGV3aXR0Cj4+IDxjaHJpc3RpYW5zaGV3aXR0QGdtYWlsLmNvbT4gd3JvdGU6Cj4+PiAKPj4+
IFRoaXMgY29tbWl0IGFkZHMgdGhlIFNESU8gZmlybXdhcmUgZm9yIGF0aDEway9RQ0E5Mzc3IGNh
cmRzLiBUaGUgZmlsZQo+Pj4gaXMgZnJvbSB0aGUgQm91bmRhcnkgRGV2aWNlcyByZXBvIFsxXSBh
bmQgaGFzIHRoZSBzYW1lIGxpY2Vuc2UgYXMgdGhlCj4+PiBleGlzdGluZyBmaXJtd2FyZS01LmJp
biBmaWxlLiBTdXBwb3J0IGZvciBRQ0E5Mzc3IFdpRmkgd2FzIG1lcmdlZCBmb3IKPj4+IExpbnV4
IDUuNyBbMl0uCj4+PiAKPj4+IFsxXSBodHRwczovL2dpdGh1Yi5jb20vYm91bmRhcnlkZXZpY2Vz
L3FjYS1maXJtd2FyZS90cmVlL2JkLXNkbWFjLWF0aDEwawo+Pj4gWzJdCj4+PiBodHRwczovL2dp
dGh1Yi5jb20vdG9ydmFsZHMvbGludXgvY29tbWl0LzZlNTFiMGU0OTEzY2EyYzkzMDU5ZjczY2E0
NzdjYTMwZWE5NWI2YTAKPj4gCj4+IFRoYXQgcmVwbyBnb3QgaXQgZnJvbSBLYWxsZSdzIHVudGVz
dGVkIHJlcG8sIGFuZCBkaWRuJ3QgY2Fycnkgb3ZlciB0aGUKPj4gU2lnbmVkLW9mZi1ieS4gIFlv
dSBkaWRuJ3QgY2Fycnkgb3ZlciB0aGUgU2lnbmVkLW9mZi1ieSBmcm9tIHRoZSByZXBvCj4+IHlv
dSBnb3QgaXQgZnJvbS4gIDMgbGV2ZWxzIG9mIGluZGlyZWN0aW9uIHRvIGluY2x1ZGUgYSBmaWxl
IHdpdGggYQo+PiBnaWFudCBub3RpY2UgZnJvbSBhbiB1bnRlc3RlZCBzb3VyY2VzIGlzIGEgYml0
IHRvbyBtdWNoIGZvciBtZSB0byBmZWVsCj4+IGNvbWZvcnRhYmxlIHdpdGguCj4KPiBBcG9sb2dp
ZXMgSm9zaCwgSSBoYXZlIGJlZW4gdXNpbmcgbXkgb3duIHJlcGFjayBvZiB0aGUgQm91bmRhcnkg
RGV2aWNlcwo+IHJlcG8gYW5kIGhhZCBjb21wbGV0ZWx5IGZvcmdvdHRlbiBLYWxsZeKAmXMgcmVw
byBleGlzdGVkIGFuZCB3YXMgdGhlCj4gb3JpZ2luYWwgc291cmNlIG9mIHRoZSBmaWxlLgo+Cj4+
IEthbGxlLCBpcyB0aGVyZSBhIHJlYXNvbiB5b3UgZGlkbid0IHNlbmQgdGhpcyB1cHN0cmVhbSAz
IHllYXJzIGFnbz8KPgo+IFNESU8gc3VwcG9ydCBpcyBhIHJlbGF0aXZlbHkgcmVjZW50IGFkZGl0
aW9uIHRvIHRoZSBhdGgxMGsgZHJpdmVyIGFuZAo+IHRoZSBjb21taXQgbWVzc2FnZSBpbiB0aGlz
IFJGVCBbMV0gcHJvYmFibHkgZXhwbGFpbnMgd2h5IGhpcyByZXBvIGhhcwo+IGl0IGRlc2NyaWJl
ZCBhcyB1bnRlc3RlZC4KPgo+IEnigJltIGhhcHB5IHRvIHN1Ym1pdCB2MiB3aXRoIGNvcnJlY3Rl
ZCByZWZlcmVuY2VzIG9yIGxldCBLYWxsZSBoYW5kbGUKPiB0aGUgc3VibWlzc2lvbiwgd2hpY2hl
dmVyIGlzIGJlc3Qgb3IgZWFzaWVzdCBpcyBmaW5lIHdpdGggbWUuCgpJJ2xsIGluY2x1ZGUgdGhl
IFFDQTkzNzcgU0RJTyBpbWFnZSBpbiBteSBuZXh0IHB1bGwgcmVxdWVzdCB0byBKb3NoLgpJJ2xs
IGFsc28gaGF2ZSBRQ0E2MTc0IFNESU8gaW1hZ2VzIHBlbmRpbmcuCgotLSAKaHR0cHM6Ly93aXJl
bGVzcy53aWtpLmtlcm5lbC5vcmcvZW4vZGV2ZWxvcGVycy9kb2N1bWVudGF0aW9uL3N1Ym1pdHRp
bmdwYXRjaGVzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
