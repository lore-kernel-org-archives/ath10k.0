Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-we0-x236.google.com ([2a00:1450:400c:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wnjc0-0000Dh-1A
 for ath10k@lists.infradead.org; Fri, 23 May 2014 07:09:52 +0000
Received: by mail-we0-f182.google.com with SMTP id t60so4377101wes.41
 for <ath10k@lists.infradead.org>; Fri, 23 May 2014 00:09:28 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87tx8hwyul.fsf@kamboji.qca.qualcomm.com>
References: <1400767955-16313-1-git-send-email-michal.kazior@tieto.com>
 <1400767955-16313-3-git-send-email-michal.kazior@tieto.com>
 <87tx8hwyul.fsf@kamboji.qca.qualcomm.com>
Date: Fri, 23 May 2014 09:09:28 +0200
Message-ID: <CA+BoTQ=WsP2HNBCGOb-Vem80sN7FvnPA_2B2=sShdgW_+fpvTg@mail.gmail.com>
Subject: Re: [PATCH 2/2] ath10k: make core registering async
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMjIgTWF5IDIwMTQgMTg6NDAsIEthbGxlIFZhbG8gPGt2YWxvQHFjYS5xdWFsY29tbS5jb20+
IHdyb3RlOgo+IE1pY2hhbCBLYXppb3IgPG1pY2hhbC5rYXppb3JAdGlldG8uY29tPiB3cml0ZXM6
Cj4KPj4gSWYgYXRoMTBrIHdhcyBidWlsdCBpbnRvIHRoZSBrZXJuZWwgaXQgY291bGQgc3RhbGwK
Pj4gYm9vdGluZyBmb3IgMTIwIHNlY29uZHMgYnkgZGVmYXVsdCAoNjAgc2Vjb25kcyBmb3IKPj4g
ZWFjaCBmaXJtd2FyZSBBUEkgdmFyaWFudCkgd2FpdGluZyBmb3IgZmlybXdhcmUKPj4gZmlsZXMg
YmVmb3JlIHVzZXJzcGFjZSB3YXMgcmVhZHkgb3IgZmlsZXN5c3RlbXMKPj4gbW91bnRlZC4KPj4K
Pj4gRml4IHRoaXMgYnkgbWFraW5nIHRoZSBjb3JlIHJlZ2lzdGVyaW5nCj4+IGFzeW5jaHJvbm91
cy4KPj4KPj4gVGhpcyBhbHNvIHNob3ZlcyBvZmYgYWJvdXQgMSBzZWNvbmQgZnJvbSBib290IHRp
bWUKPj4gb24gbW9zdCBzeXN0ZW1zIHNpbmNlIHRoZSBkcml2ZXIgaXMgbm93IG1vc3RseQo+PiBp
bml0aWFsaXplZCBpbiBhIHdvcmtlciBhbmQgbW9kcHJvYmUgdGFrZXMgdmVyeQo+PiBsaXR0bGUg
dGltZSB0byBjb21wbGV0ZS4KPj4KPj4gQXMgYSBzaWRlIGVmZmVjdCB0aGVyZSdzIG5vIHdheSB0
byBwcm9wYWdhdGUKPj4gcmVnaXN0ZXJpbmcgZXJyb3JzIHRvIHRoZSBwY2kgc3Vic3lzdGVtIGJ1
dCB0aGlzCj4+IHByb2JhYmx5IGlzbid0IHJlYWxseSBuZWNlc3NhcnkuCj4+Cj4+IFNpZ25lZC1v
ZmYtYnk6IE1pY2hhbCBLYXppb3IgPG1pY2hhbC5rYXppb3JAdGlldG8uY29tPgo+Cj4gSSBzZWUg
YSBuZXcgc3BhcnNlIHdhcm5pbmcgd2l0aCB0aGlzIHBhdGNoOgo+Cj4gZHJpdmVycy9uZXQvd2ly
ZWxlc3MvYXRoL2F0aDEway9jb3JlLmM6OTU2OjY6IHdhcm5pbmc6IHN5bWJvbCAnYXRoMTBrX2Nv
cmVfcmVnaXN0ZXJfd29yaycgd2FzIG5vdCBkZWNsYXJlZC4gU2hvdWxkIGl0IGJlIHN0YXRpYz8K
ClllYWguIEkgZm9yZ290IHRvIGFkZCBzdGF0aWMga2V5d29yZCBzaW5jZSBJJ3ZlIHBsYXllZCBh
IGxpdHRsZSBhcm91bmQKdGhlIGNvZGUgZWFsaWVyLiBJJ2xsIGZpeCBpdCwgdGhhbmtzIQoKCk1p
Y2hhxYIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0
aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
