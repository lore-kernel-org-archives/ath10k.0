Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nm.newmedia-net.de ([217.113.179.122]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bUyF1-0004IX-MJ
 for ath10k@lists.infradead.org; Wed, 03 Aug 2016 15:38:01 +0000
References: <1470046905-17449-1-git-send-email-benjamin@sipsolutions.net>
 <1470046905-17449-3-git-send-email-benjamin@sipsolutions.net>
 <CA+BoTQ=cwMMQXWOd8TocVcUeV5+_0-HNFO=9a5KNr=q2vWDfgA@mail.gmail.com>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <29736815-4728-181c-6656-527eb85c8fb3@dd-wrt.com>
Date: Wed, 3 Aug 2016 17:37:25 +0200
MIME-Version: 1.0
In-Reply-To: <CA+BoTQ=cwMMQXWOd8TocVcUeV5+_0-HNFO=9a5KNr=q2vWDfgA@mail.gmail.com>
Subject: Re: [PATCHv2 2/2] ath10k: Allow setting coverage class
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
To: Michal Kazior <michal.kazior@tieto.com>, Benjamin Berg <benjamin@sipsolutions.net>
Cc: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>, Mathias Kretschmer <mathias.kretschmer@fit.fraunhofer.de>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Simon Wunderlich <sw@simonwunderlich.de>

Cj4+ICsgICAgICAgaWYgKHZhbHVlIDwgMCkKPj4gKyAgICAgICAgICAgICAgIHZhbHVlID0gYXIt
PmZ3X2NvdmVyYWdlLmNvdmVyYWdlX2NsYXNzOwo+PiArCj4+ICsgICAgICAgLyogQnJlYWsgb3V0
IGlmIHRoZSBjb3ZlcmFnZSBjbGFzcyBhbmQgcmVnaXN0ZXJzIGhhdmUgdGhlIGV4cGVjdGVkCj4+
ICsgICAgICAgICogdmFsdWUuCj4+ICsgICAgICAgICovCj4+ICsgICAgICAgaWYgKHZhbHVlID09
IGFyLT5md19jb3ZlcmFnZS5jb3ZlcmFnZV9jbGFzcyAmJgo+PiArICAgICAgICAgICBzbG90dGlt
ZV9yZWcgPT0gYXItPmZ3X2NvdmVyYWdlLnJlZ19zbG90dGltZV9jb25mICYmCj4+ICsgICAgICAg
ICAgIHRpbWVvdXRfcmVnID09IGFyLT5md19jb3ZlcmFnZS5yZWdfYWNrX2N0c190aW1lb3V0X2Nv
bmYpCj4+ICsgICAgICAgICAgICAgICBnb3RvIHVubG9jazsKPiBJIHdvdWxkIG1vdmUgdGhpcyBw
YXJ0IHRvIHRoZSBjYWxsZXIgYW5kIGtlZXAgdGhlIGhhcmR3YXJlLXNwZWNpZmljCj4gZnVuY3Rp
b24ganVzdCBjb21wdXRlIGFuZCBzZXQgcmVnaXN0ZXJzLCBlLmcuIGhhdmUKPiBhdGgxMGtfbWFj
X3NldF9jb3ZlcmFnZV9jbGFzcyAoYXMgb3Bwb3NlZCB0bwo+IGF0aDEwa19tYWNfb3Bfc2V0X2Nv
dmVyYWdlX2NsYXNzKS4gSXQgc2hvdWxkIGFsc28gcmVkdWNlIHNvbWUgY29kZQo+IGR1cGxpY2F0
aW9uLgpkb2VzbnQgbWFrZSBzZW5zZS4gaSBhbHJlYWR5IGVuaGFuY2VkIHRoaXMgY29kZSB0byBz
dXBwb3J0IGJlZWxpbmVyIAooOTl4eCkgYW5kIG5ld2Vycy4KdGhlIGNvZGUgaXMgdGhhdCBtdWNo
IGRpZmZlcmVudCB0aGF0IHRoaXMgY2hlY2sgbmVlZCB0byBiZSB0cmVhZGVkIGluIGEgCmluZGl2
dWR1YWwgd2F5CnJlZ19zbG90dGltZV9jb25mIGlzIGhhcmR3YXJlIGRlZmFjdG8gc3BlY2lmaWMg
c2luY2UgdGhlIHZhbHVlIGlzIHRha2VuIApmcm9tIGEgaGFyZHdhcmUgc3BlY2lmaWMgcmVnaXN0
ZXIuCnlvdSBjYW5ub3QgaGFuZGxlIHRoaXMgb3V0c2lkZSB0aGlzIGZ1bmN0aW9uIHNpbmNlIG90
aGVyIGNoaXBzIGhhdmUgCmRpZmZlcmVudCByZWdpc3RlcnMuCgoKCi0tIApNaXQgZnJldW5kbGlj
aGVuIEdyw7xzc2VuIC8gUmVnYXJkcwoKU2ViYXN0aWFuIEdvdHRzY2hhbGwgLyBDVE8KCk5ld01l
ZGlhLU5FVCBHbWJIIC0gREQtV1JUCkZpcm1lbnNpdHo6ICBCZXJsaW5lciBSaW5nIDEwMSwgNjQ2
MjUgQmVuc2hlaW0KUmVnaXN0ZXJnZXJpY2h0OiBBbXRzZ2VyaWNodCBEYXJtc3RhZHQsIEhSQiAy
NTQ3MwpHZXNjaMOkZnRzZsO8aHJlcjogUGV0ZXIgU3RlaW5ow6R1c2VyLCBDaHJpc3RpYW4gU2No
ZWVsZQpodHRwOi8vd3d3LmRkLXdydC5jb20KZW1haWw6IHMuZ290dHNjaGFsbEBkZC13cnQuY29t
ClRlbC46ICs0OTYyNTEtNTgyNjUwIC8gRmF4OiArNDk2MjUxLTU4MjY1NjUKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0
CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
