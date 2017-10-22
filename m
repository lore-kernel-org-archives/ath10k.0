Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtps.newmedia-net.de ([2a05:a1c0:0:de::167]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e6DXf-0007yR-EO
 for ath10k@lists.infradead.org; Sun, 22 Oct 2017 10:31:47 +0000
Subject: Re: [PATCH] ath10k: rebuild crypto header in RX data frames
References: <150851690590.5158.11970481736247725763.stgit@potku.adurom.net>
 <c9bdd915-0667-eee0-3b52-1fdf15abf249@dd-wrt.com>
 <CAGyitvP0wquoo_8_ma3rcj+riJ5Wgfo7+pmbUOx9pQRwFcQHYA@mail.gmail.com>
 <87376dds5e.fsf@kamboji.qca.qualcomm.com>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <9407ed1f-2bd9-3fd0-981d-1a20452e8ba9@dd-wrt.com>
Date: Sun, 22 Oct 2017 12:31:18 +0200
MIME-Version: 1.0
In-Reply-To: <87376dds5e.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>, Jasmine Strong <jas@eero.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>

YWZ0ZXIgc29tZSB0ZXN0cyBpIGhhdmUgdG8gY29ycmVjdCBteSB0ZXN0Cgo4MDIuMTFuIHFjYSBj
aGlwc2V0cyBjYW4gY29ubmVjdCB0byB0aGUgYXAgd2l0aG91dCBpc3N1ZXMuIGJ1dCBhbm90aGVy
IAo5OTg0IGJhc2VkIGNoaXBzZXQgaW4gY2xpZW50IG1vZGUgaXMgYWJsZSB0byBjb25uZWN0LCBi
dXQgbm8gZGF0YSBpcyAKcGFzc2luZyB0aHJvdWdoLiB0aGVyZSBzZWVtcyB0byBiZSBhIGVuY3J5
cHRpb24gcHJvYmxlbQpBbSAyMS4xMC4yMDE3IHVtIDA2OjQ2IHNjaHJpZWIgS2FsbGUgVmFsbzoK
PiBKYXNtaW5lIFN0cm9uZyA8amFzQGVlcm8uY29tPiB3cml0ZXM6Cj4KPj4gLS05NGViMmMxYzFm
ZWFhM2FhZWEwNTVjMDNjMGNkCj4+IENvbnRlbnQtVHlwZTogdGV4dC9odG1sOyBjaGFyc2V0PSJV
VEYtOCIKPj4gQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogYmFzZTY0Cj4gQlRXLCBJIHRoaW5r
IHRoYXQgYm90aCBhdGgxMGsgYW5kIGxpbnV4LXdpcmVsZXNzIGxpc3RzIHJlamVjdCBIVE1MIG1h
aWxzCj4gc28gb25seSBtZSBhbmQgU2ViYXN0aWFuIHNhdyB5b3VyIGVtYWlsLgo+CgotLSAKTWl0
IGZyZXVuZGxpY2hlbiBHcsO8c3NlbiAvIFJlZ2FyZHMKClNlYmFzdGlhbiBHb3R0c2NoYWxsIC8g
Q1RPCgpOZXdNZWRpYS1ORVQgR21iSCAtIERELVdSVApGaXJtZW5zaXR6OiAgU3R1YmVud2FsZGFs
bGVlIDIxYSwgNjQ2MjUgQmVuc2hlaW0KUmVnaXN0ZXJnZXJpY2h0OiBBbXRzZ2VyaWNodCBEYXJt
c3RhZHQsIEhSQiAyNTQ3MwpHZXNjaMOkZnRzZsO8aHJlcjogUGV0ZXIgU3RlaW5ow6R1c2VyLCBD
aHJpc3RpYW4gU2NoZWVsZQpodHRwOi8vd3d3LmRkLXdydC5jb20KZW1haWw6IHMuZ290dHNjaGFs
bEBkZC13cnQuY29tClRlbC46ICs0OTYyNTEtNTgyNjUwIC8gRmF4OiArNDk2MjUxLTU4MjY1NjUK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsg
bWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
