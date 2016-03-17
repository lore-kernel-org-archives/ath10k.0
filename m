Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x232.google.com ([2a00:1450:400c:c09::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1agWD4-00073V-HN
 for ath10k@lists.infradead.org; Thu, 17 Mar 2016 11:35:23 +0000
Received: by mail-wm0-x232.google.com with SMTP id p65so21752315wmp.1
 for <ath10k@lists.infradead.org>; Thu, 17 Mar 2016 04:35:02 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160317112022.GA27512@atheros-ThinkPad-T61>
References: <1458211740-6875-1-git-send-email-mohammed@qca.qualcomm.com>
 <CA+BoTQkk30nPEKiP-8FA2DcddJ_SL90txgHQeua7GCauR_M2dg@mail.gmail.com>
 <20160317112022.GA27512@atheros-ThinkPad-T61>
Date: Thu, 17 Mar 2016 12:35:00 +0100
Message-ID: <CA+BoTQ=DG=oixf2LtVbxvRL6WvnQDcyOHP=ayHbmNAsQrTPMvA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ath10k: Add support for ath10k_sta_statistics
 support
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
To: Mohammed Shafi Shajakhan <mohammed@codeaurora.org>
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless <linux-wireless@vger.kernel.org>, "kvalo@codeaurora.org" <kvalo@codeaurora.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

T24gMTcgTWFyY2ggMjAxNiBhdCAxMjoyMCwgTW9oYW1tZWQgU2hhZmkgU2hhamFraGFuCjxtb2hh
bW1lZEBjb2RlYXVyb3JhLm9yZz4gd3JvdGU6Cj4gSGkgTWljaGFsLAo+Cj4gT24gVGh1LCBNYXIg
MTcsIDIwMTYgYXQgMTI6MTI6MzFQTSArMDEwMCwgTWljaGFsIEthemlvciB3cm90ZToKPj4gT24g
MTcgTWFyY2ggMjAxNiBhdCAxMTo0OCwgTW9oYW1tZWQgU2hhZmkgU2hhamFraGFuCj4+IDxtb2hh
bW1lZEBxdGkucXVhbGNvbW0uY29tPiB3cm90ZToKPj4gWy4uLl0KPj4gPiArdm9pZCBhdGgxMGtf
c3RhX3N0YXRpc3RpY3Moc3RydWN0IGllZWU4MDIxMV9odyAqaHcsIHN0cnVjdCBpZWVlODAyMTFf
dmlmICp2aWYsCj4+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGllZWU4MDIx
MV9zdGEgKnN0YSwKPj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qgc3RhdGlv
bl9pbmZvICpzaW5mbykKPj4gPiArewo+PiA+ICsgICAgICAgc3RydWN0IGF0aDEwa19zdGEgKmFy
c3RhID0gKHN0cnVjdCBhdGgxMGtfc3RhICopc3RhLT5kcnZfcHJpdjsKPj4gPiArICAgICAgIHN0
cnVjdCBhdGgxMGsgKmFyID0gYXJzdGEtPmFydmlmLT5hcjsKPj4gPiArCj4+ID4gKyAgICAgICBt
dXRleF9sb2NrKCZhci0+Y29uZl9tdXRleCk7Cj4+ID4gKwo+PiA+ICsgICAgICAgaWYgKGFyLT5z
dGF0ZSAhPSBBVEgxMEtfU1RBVEVfT04gJiYKPj4gPiArICAgICAgICAgICBhci0+c3RhdGUgIT0g
QVRIMTBLX1NUQVRFX1JFU1RBUlRFRCkKPj4gPiArICAgICAgICAgICAgICAgZ290byBvdXQ7Cj4+
Cj4+IERvIHlvdSByZWFsbHkgbmVlZCBtdXRleCBhbmQgYXItPnN0YXRlIGNoZWNrIGluIHRoaXMg
ZnVuY3Rpb24/Cj4+Cj4KPiBbc2hhZmldIEJ5IGRlZmF1bHQgcGVlciBzdGF0cyB3aWxsIGJlIGRp
c2FibGVkLCB3ZSBhcmUgZW5hYmxpbmcgdGhpcyBieSBkZWJ1Z2ZzCj4gKGh3LXJlc3RhcnQpIHNv
IGkgdGhvdWdodCB0aGVzZSBjaGVja3MgYXJlIG5lZWRlZCAsIHBsZWFzZSBhZHZpc2UgLi4gRG8g
eW91IHNheQo+IHRoZXkgIHdpbGwgYmUgbmV2ZXIgaGl0CgpIbW0uLiBJIHRoaW5rIG1hYzgwMjEx
IHNob3VsZG4ndCBjYWxsIHN0YV9zdGF0aXN0aWNzKCkgYmVmb3JlCnN0YV9zdGF0ZSgpIGR1cmlu
ZyByZWNvdmVyeSAoaXQgbWFrZXMgbm8gc2Vuc2UpLiBJbiBwcmFjdGljZSBJIHRoaW5rCnRoaXMg
aXNuJ3QgZW5mb3JjZWQgaW4gd2hpY2ggY2FzZSBpdCdzIGEgbWFjODAyMTEgYnVnLgoKQW55d2F5
LCB0aGlzIGlzbid0IG11Y2ggb2YgYSBwcm9ibGVtIG5vdy4gWW91IG9ubHkgcmVhZCBvdXQgdTY0
IGZyb20KYGFyc3RhYCAoc3RhLT5kcnZfcHJpdikuIEV2ZW4gaWYgaXQncyB1bmluaXRpYWxpemVk
L3VuZGVmaW5lZCB0aGVyZSdzCm5vIHdheSBmb3IgeW91IHRvIGNyYXNoIHRoZSBzeXN0ZW0gKGl0
J3Mgbm90IGEgbGlzdCwgc3BpbmxvY2sgb3IgYW55Cm90aGVyIGNvbXBsZXggZGF0YSBzdHJ1Y3R1
cmUpLiBXb3JzdCBjYXNlIHVzZXJzcGFjZSB3aWxsIGdldCBnYXJiYWdlCnJ4X2R1cmF0aW9uIHZh
bHVlIGlmIGl0IGhhcHBlbnMgdG8gZ2V0X3N0YXRpb24oKSB3aGlsZSBody1yZXN0YXJ0IGlzCm9u
Z29pbmcuCgpJdCdkIGJlIGdvb2QgdG8gdmVyaWZ5IHRoaXMgaXMgYWN0dWFsbHkgYSBwcm9ibGVt
IGFuZCAtIGFzc3VtaW5nIHlvdQp3YW50IHRvIGd1YXJhbnRlZSBjb3JyZWN0IHJlYWRvdXRzIGF0
IGFsbCB0aW1lcyAtIHRvIGZpeCB0aGUgcHJvYmxlbQppbiBtYWM4MDIxMS4KCgpNaWNoYcWCCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFp
bGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
