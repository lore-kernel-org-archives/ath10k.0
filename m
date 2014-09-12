Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-we0-x230.google.com ([2a00:1450:400c:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XSNcI-0002e4-8C
 for ath10k@lists.infradead.org; Fri, 12 Sep 2014 09:58:11 +0000
Received: by mail-we0-f176.google.com with SMTP id q58so475027wes.7
 for <ath10k@lists.infradead.org>; Fri, 12 Sep 2014 02:57:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20140911203147.12514.84857.stgit@potku.adurom.net>
References: <20140911202926.12514.79908.stgit@potku.adurom.net>
 <20140911203147.12514.84857.stgit@potku.adurom.net>
Date: Fri, 12 Sep 2014 11:57:46 +0200
Message-ID: <CA+BoTQ=oj9SkaeWBbX2jsD2UHUknhb6f_-ZUBbVSmuWUXFvm-g@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] ath10k: add diag_read() to hif ops
From: Michal Kazior <michal.kazior@tieto.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMTEgU2VwdGVtYmVyIDIwMTQgMjI6MzEsIEthbGxlIFZhbG8gPGt2YWxvQHFjYS5xdWFsY29t
bS5jb20+IHdyb3RlOgo+IGRpYWdfcmVhZCgpIGlzIHVzZWQgZm9yIHJlYWRpbmcgZnJvbSBmaXJt
d2FyZSBtZW1vcnkgdmlhIHRoZSBkaWFnbm9zZSB3aW5kb3cuCj4gRmlyc3QgdXNlciB3aWxsIGJl
IGNhbF9kYXRhIGRlYnVnZnMgZmlsZS4KWy4uLl0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQv
d2lyZWxlc3MvYXRoL2F0aDEway9wY2kuYyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgx
MGsvcGNpLmMKPiBpbmRleCAxNTQ0NTFhYjNlM2MuLmQzYzUxMDc5MDM0ZSAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL3BjaS5jCj4gKysrIGIvZHJpdmVycy9u
ZXQvd2lyZWxlc3MvYXRoL2F0aDEway9wY2kuYwo+IEBAIC05NDEsNiArOTQxLDEzIEBAIGVycjoK
PiAgICAgICAgIHJldHVybiBlcnI7Cj4gIH0KPgo+ICtzdGF0aWMgaW50IGF0aDEwa19wY2lfaGlm
X2RpYWdfcmVhZChzdHJ1Y3QgYXRoMTBrICphciwgdTMyIGFkZHJlc3MsIHZvaWQgKmJ1ZiwKPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzaXplX3QgYnVmX2xlbikKPiArewo+
ICsgICAgICAgLyogRklYTUU6IGxvY2tpbmcgKi8KPiArICAgICAgIHJldHVybiBhdGgxMGtfcGNp
X2RpYWdfcmVhZF9tZW0oYXIsIGFkZHJlc3MsIGJ1ZiwgYnVmX2xlbik7CgpIbW0uLiBUaGlzIGNh
biBwb3RlbnRpYWxseSBjb2xsaWRlIHdpdGggZmlybXdhcmUgY3Jhc2ggYXMgaXQgdXNlcyBDRQpk
aWFnIHdpbmRvdyBhcyB3ZWxsLgoKSSdtIHRoaW5raW5nIGVudGlyZSBib2RpZXMgb2YgZGlhZ19y
ZWFkX21lbSgpL2RpYWdfd3JpdGVtZW0oKSBzaG91bGQKYmUgcHJvdGVjdGVkIGJ5IGFyX3BjaS0+
Y2VfbG9jay4gSXQgc2hvdWxkbid0IGJlIGhhcmQuIEFzIGZvcgpkaWFnX3JlYWRfbWVtKCk6Cgog
KiBzL2F0aDEwa19jZV9yeF9wb3N0X2J1Zi9fX2F0aDEwa19jZV9yeF9wb3N0X2J1Zi8KICogcy9h
dGgxMGtfY2Vfc2VuZC9hdGgxMGtfY2Vfc2VuZF9ub2xvY2svCiAqIHMvYXRoMTBrX2NlX2NvbXBs
ZXRlZF9zZW5kX25leHQvYXRoMTBrX2NlX2NvbXBsZXRlZF9zZW5kX25leHRfbm9sb2NrLwogKiBz
L2F0aDEwa19jZV9jb21wbGV0ZWRfcmVjdl9uZXh0L2F0aDEwa19jZV9jb21wbGV0ZWRfcmVjdl9u
ZXh0X25vbG9jay8KCk5vdGU6IE1vc3QgX25vbG9jayBzdHVmZiBpcyBzdGF0aWMgaW4gY2UuYyBz
byBpdCBuZWVkcyB0byBiZSBjaGFuZ2VkCnRvIGJlIGFjY2Vzc2libGUgaW4gcGNpLmMuCgoKTWlj
aGHFggoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRo
MTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
