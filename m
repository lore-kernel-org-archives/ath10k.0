Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtps.newmedia-net.de ([2a05:a1c0:0:de::167]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e9Y95-00057i-4G
 for ath10k@lists.infradead.org; Tue, 31 Oct 2017 15:08:08 +0000
Subject: Re: [v3] ath10k: rebuild crypto header in rx data frames
References: <1509035774-26553-1-git-send-email-kvalo@qca.qualcomm.com>
 <59b2ec22dc9c4db0bd30a65dba660b1c@euamsexm01a.eu.qualcomm.com>
 <154f13b8-1e77-dbe5-4cb0-81c534dbc40b@dd-wrt.com>
 <52655c07-aba1-525e-8c81-e420eafc329f@dd-wrt.com>
 <8760av1hx8.fsf@kamboji.qca.qualcomm.com>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <5903661f-1276-5cca-7894-b489e062b78d@dd-wrt.com>
Date: Tue, 31 Oct 2017 16:07:37 +0100
MIME-Version: 1.0
In-Reply-To: <8760av1hx8.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

QW0gMzEuMTAuMjAxNyB1bSAxNjowMCBzY2hyaWViIEthbGxlIFZhbG86Cj4gU2ViYXN0aWFuIEdv
dHRzY2hhbGwgPHMuZ290dHNjaGFsbEBkZC13cnQuY29tPiB3cml0ZXM6Cj4KPj4gdGhlIGZvbGxv
d2luZyBwYXRjaGxpbmVzIGluIHRoZSB2MyBwYXRjaCBsb29rIHdyb25nCj4+Cj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIElDViAqLwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBpZiAoc3RhdHVzLT5mbGFnICYgUlhfRkxBR19JQ1ZfU1RSSVBQRUQgJiYKPj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlbmN0eXBlICE9IEhUVF9SWF9NUERV
X0VOQ1JZUFRfQUVTX0NDTV9XUEEyKQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgc2tiX3RyaW0obXNkdSwgbXNkdS0+bGVuIC0KPj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGF0aDEw
a19odHRfcnhfY3J5cHRvX3RhaWxfbGVuKGFyLAo+PiBlbmN0eXBlKSk7Cj4+Cj4+Cj4+IHRoZSBl
bmN0eXBlICE9IHdwYTIgaXNudCBlbm91Z2ggc2luY2UgaXQgYWxzbyBiZWxvbmdzIHRvIGNjbXAt
MjU2LAo+PiBnY21wIG1vZGVzIGV0Yy4KPiA0LjE0IGRvZXNuJ3Qgc3VwcG9ydCBDQ01QLTI1NiBu
b3IgR0NNUCBtb2RlcyB5ZXQuIERpZCB5b3UgY2hlY2sgdGhlCj4gc2VwYXJhdGUgcGF0Y2ggZm9y
IDQuMTU6Cgpmb3IgbWUgY2NtcC0yNTYgYW5kIGdjbXAgd29ya3MgYnV0IG15IGN1cnJlbnQgdHJl
ZSBpcyBiYXNlZCBvbiBhIHZlcnkgCnJlY2VudCBtYWM4MDIxMSB2ZXJzaW9uCgpidXQgZGlkIG5v
dCBjaGVjayBpZiB0aGlzIHN1cHBvcnQgaXMgaW5jbHVkZWQgaW4gNC4xNCBzaW5jZSBpJ20gCmRl
dmVsb3BpbmcgZW1iZWRkZWQgd2lyZWxlc3MgZmlybXdhcmVzIG9uIGRpZmZlcmVudCBrZXJuZWwg
dmVyc2lvbnMgCnVzaW5nIHdpcmVsZXNzIGJhY2twb3J0cyBiYXNlZCBvbiByZWNlbnQgbWFjODAy
MTEgL2F0aDEwayBldGMuIHZlcnNpb25zCgo+Cj4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9y
Zy9wYXRjaC8xMDAyOTA5Ny8KdGhhbmtzIGZvciBub3RpZnlpbmcgbWUuIGhhdmVudCBzZWVuIGl0
Cj4KCi0tIApNaXQgZnJldW5kbGljaGVuIEdyw7xzc2VuIC8gUmVnYXJkcwoKU2ViYXN0aWFuIEdv
dHRzY2hhbGwgLyBDVE8KCk5ld01lZGlhLU5FVCBHbWJIIC0gREQtV1JUCkZpcm1lbnNpdHo6ICBT
dHViZW53YWxkYWxsZWUgMjFhLCA2NDYyNSBCZW5zaGVpbQpSZWdpc3RlcmdlcmljaHQ6IEFtdHNn
ZXJpY2h0IERhcm1zdGFkdCwgSFJCIDI1NDczCkdlc2Now6RmdHNmw7xocmVyOiBQZXRlciBTdGVp
bmjDpHVzZXIsIENocmlzdGlhbiBTY2hlZWxlCmh0dHA6Ly93d3cuZGQtd3J0LmNvbQplbWFpbDog
cy5nb3R0c2NoYWxsQGRkLXdydC5jb20KVGVsLjogKzQ5NjI1MS01ODI2NTAgLyBGYXg6ICs0OTYy
NTEtNTgyNjU2NQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
