Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x22a.google.com ([2a00:1450:400c:c00::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XhIJv-0001qk-FY
 for ath10k@lists.infradead.org; Thu, 23 Oct 2014 13:20:52 +0000
Received: by mail-wg0-f42.google.com with SMTP id z12so1087353wgg.25
 for <ath10k@lists.infradead.org>; Thu, 23 Oct 2014 06:20:28 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1413807758-30249-1-git-send-email-michal.kazior@tieto.com>
References: <1413807758-30249-1-git-send-email-michal.kazior@tieto.com>
Date: Thu, 23 Oct 2014 15:20:28 +0200
Message-ID: <CA+BoTQkrUQ6T60qztMuBbjy=vU-4Cho+yBXS051W=fNRTgNeig@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] ath10k: speed up recovery
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, Michal Kazior <michal.kazior@tieto.com>

T24gMjAgT2N0b2JlciAyMDE0IDE0OjIyLCBNaWNoYWwgS2F6aW9yIDxtaWNoYWwua2F6aW9yQHRp
ZXRvLmNvbT4gd3JvdGU6Cj4gUGF0Y2ggIzEgZml4ZXMgYSBidWcgSSd2ZSBmb3VuZCB3aGlsZSB0
ZXN0aW5nCj4gcGF0Y2hlcyAjMiBhbmQgIzMuIEl0J3Mgc2FmZSB0byBjaGVycnktcGljayBpdCBp
bgo+IGNhc2UgcGF0Y2hlcyAjMiBhbmQvb3IgIzMgYXJlbid0IGFjY2VwdGVkIG9yIG5lZWQKPiBh
IHJlLXNwaW4uCj4KPiBJJ3ZlIG1haW5seSB1c2VkIHBhdGNoICMyIHRvIHRlc3QgcmVzZXQgYW5k
Cj4gcmVjb3ZlcnkuIEl0J3MgcHJldHR5IGhhbmR5IGZvciAoc3RyZXNzLSl0ZXN0aW5nLgo+Cj4g
UGF0Y2ggIzMgc2hvdWxkIGltcHJvdmUgcmVjb3Zlcnkgc3BlZWQgaW4gc29tZQo+IGNhc2VzLiBO
b3RhYmx5IHdoZW4gdGhlcmUncyBhIGxvbmcgY2hhaW4gb2YgV01JCj4gY29tbWFuZHMgaW52b2x2
ZWQgd2hpY2ggdGFrZSBhIHBhaW5mdWxseSBsb25nIHRpbWUKPiB0byB0aW1lb3V0L2NvbXBsZXRl
IGlmIGZpcm13YXJlIGNyYXNoZXMgbWlkLXdheS4KPgo+IE5vdGU6IFBhdGNoZXMgIzIgYW5kICMz
IGRlcGVuZCBvbiBgYXRoMTBrOiBwY2kKPiByZWxhdGVkIGZpeGVzIDIwMTQtMTAtMDlgLiBXaXRo
b3V0IHRoZSBwYXRjaHNldAo+IHBhdGNoZXMgIzIgYW5kICMzIG11c3Qgbm90IGJlIGFwcGxpZWQu
IFBhdGNoICMxIGlzCj4gZmluZSB0aG91Z2guCgpEbyBub3QgYXBwbHkgdGhpcyBwYXRjaHNldCB5
ZXQsIHBsZWFzZS4gSSBuZWVkIHRvIGRvIGEgbWlub3IgZml4IGluCnRoZSAnYXRoMTBrOiBmaXgg
cG9zc2libGUgYm1pIGNyYXNoJyByZWdhcmRpbmcgd2FybSByZXNldCBwYXRjaCBmcm9tCnRoZSBv
dGhlciBwYXRjaHNldC4KCgpNaWNoYcWCCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBr
Cg==
