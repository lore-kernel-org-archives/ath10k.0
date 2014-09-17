Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x22d.google.com ([2a00:1450:400c:c00::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XU8pf-0004dY-1W
 for ath10k@lists.infradead.org; Wed, 17 Sep 2014 06:35:16 +0000
Received: by mail-wg0-f45.google.com with SMTP id z12so866853wgg.4
 for <ath10k@lists.infradead.org>; Tue, 16 Sep 2014 23:34:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <541884AC.3020402@candelatech.com>
References: <541884AC.3020402@candelatech.com>
Date: Wed, 17 Sep 2014 08:34:44 +0200
Message-ID: <CA+BoTQkeSSp5K=Ov-Sce9tcKz5ARL1im615PckPgNK-X8O-c1Q@mail.gmail.com>
Subject: Re: Hard lockup during vif restart tests.
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
To: Ben Greear <greearb@candelatech.com>
Cc: ath10k <ath10k@lists.infradead.org>

T24gMTYgU2VwdGVtYmVyIDIwMTQgMjA6NDIsIEJlbiBHcmVlYXIgPGdyZWVhcmJAY2FuZGVsYXRl
Y2guY29tPiB3cm90ZToKPiBUaGlzIGlzIG9uIGEgMy4xNC4xNCsgaGFja2VkIGtlcm5lbCwgd2l0
aCBDVCBmaXJtd2FyZS4KPgo+IFRlc3QgY2FzZSBpcyB0byByZXN0YXJ0IHN0YXRpb25zIChhbmQg
dGhlIEFQCj4gb24gdGhlIG90aGVyIHNpZGUpIGV2ZXJ5IDEwLTMwIHNlY29uZHMuCj4gQWZ0ZXIg
YSBiaXQsIHRoZSBzdGF0aW9uIG1hY2hpbmUgbG9ja2VkIHVwIGhhcmQuCj4KPiBJIGhhdmUgbm8g
aWRlYSBob3cgdG8gdHJvdWJsZS1zaG9vdCB0aGlzIGJldHRlciwgc28gdGhpcyBpcwo+IGp1c3Qg
RllJLgo+ClsuLi5dCj4gYXRoMTBrOiBib290IHdhcm0gcmVzZXQgY29tcGxldGUKPiBhdGgxMGs6
IGZhaWxlZCB0byBwb3dlciB1cCB0YXJnZXQgdXNpbmcgd2FybSByZXNldDogLTExMAo+IGF0aDEw
azogdHJ5aW5nIGNvbGQgcmVzZXQKPiBhdGgxMGs6IGJvb3QgY29sZCByZXNldAo+IGF0aDEwazog
Ym9vdCBjb2xkIHJlc2V0IGNvbXBsZXRlCj4gW2hhbmcsIGV2ZW4gc3lzcnEgd2lsbCBub3Qgd29y
a10KClRoZXJlJ3MgYSBrbm93biBwcm9ibGVtIHdpdGggY29sZCByZXNldCBiZWluZyBjYXBhYmxl
IG9mIGxvY2tpbmcgdXAKZW50aXJlIHN5c3RlbSAoZGVwZW5kcyBvbiB0aGUgcGNpLWUgY29udHJv
bGxlciwgZS5nLiBBUDEzNSBzcGxhdHMgYQpEYXRhIEJ1cyBFcnJvciBpbnN0ZWFkKS4KCkFjdHVh
bGx5IHdhcm0gcmVzZXQgY2FuIGRvIHRoZSBzYW1lIGluIHNvbWUgY29ybmVyIGNhc2VzOiB0cnkg
cnVubmluZwpSeCB0cmFmZmljIGFuZCBqdXN0IHN0YXJ0IHRoZSByZWNvdmVyeSBzZXF1ZW5jZSAo
d2l0aG91dCBhY3R1YWxseQpjcmFzaGluZyB0aGUgZncpLiBNeSB4ODYgbG9ja3MgdXAgdmVyeSBl
YXNpbHkgd2l0aCB0aGlzLgoKSSBzdHJvbmdseSBzdWdnZXN0IHlvdSB1c2UgcmVzZXRfbW9kZT0x
IHdoZW4geW91IGxvYWQgYXRoMTBrX3BjaSBzbwpjb2xkIHJlc2V0IGlzbid0IHVzZWQuIFRoaXMg
bWF5IHJlc3VsdCBpbiBhdGgxMGsgYmVpbmcgdW5hYmxlIHRvIGJyaW5nCnVwIHRoZSBkZXZpY2Ug
aW4gc29tZSByYXJlIGNhc2VzIChlLmcuIGFmdGVyIGFuIElPTU1VIGZhdWx0IGlmIHlvdXIKc3lz
dGVtIHN1cHBvcnRzIGl0KSBidXQgSSBiZWxpZXZlIGl0J3MgZmFyIGJldHRlciB0aGFuIGhhdmlu
ZyB0aGUKd2hvbGUgc3lzdGVtIGxvY2sgdXAuCgpNeSBzdXNwaWNpb24gaXMgdHgvcnggcmluZ3Ms
IGRtYSB0cmFuc2ZlciBlbmdpbmVzLCBpbnRlcm5hbCBpcnFzCmFyZW4ndCBzdG9wcGVkIHByb3Bl
cmx5LiBJIGhhdmUgYSBwcm90b3R5cGUgcGF0Y2ggZm9yIHRoZSB3YXJtIHJlc2V0CnByb2JsZW0g
YnV0IGl0J3MgaW5jb21wbGV0ZSBhbmQgSSdtIG5vdCBzdXJlIGlmIEkgY2FuIHNoYXJlIGl0IHll
dC4KCgpNaWNoYcWCCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
