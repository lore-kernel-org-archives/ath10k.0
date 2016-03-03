Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1abVnV-0007xU-OW
 for ath10k@lists.infradead.org; Thu, 03 Mar 2016 16:08:18 +0000
Message-ID: <1457021271.2044.34.camel@sipsolutions.net>
Subject: Re: [PATCH] cfg80211/nl80211: Add support for
 NL80211_STA_INFO_RX_DURATION
From: Johannes Berg <johannes@sipsolutions.net>
Date: Thu, 03 Mar 2016 17:07:51 +0100
In-Reply-To: <20160303160048.GA5243@atheros-ThinkPad-T61>
References: <1456927710-32073-1-git-send-email-mohammed@qca.qualcomm.com>
 <1457019983.2044.29.camel@sipsolutions.net>
 <20160303160048.GA5243@atheros-ThinkPad-T61>
Mime-Version: 1.0
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
Cc: linux-wireless@vger.kernel.org, kvalo@codeaurora.org, ath10k@lists.infradead.org, Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

T24gVGh1LCAyMDE2LTAzLTAzIGF0IDIxOjMwICswNTMwLCBNb2hhbW1lZCBTaGFmaSBTaGFqYWto
YW4gd3JvdGU6Cgo+IFtzaGFmaV0gVGhpcyBpcyBwYXJ0IG9mIHRoZSBQZXIgU3RhdGlvbiBzdGF0
aXN0aWNzIHJlcXVpcmVtZW50LAoKSGVoLiBXaG9zZSByZXF1aXJlbWVudHM/IDopCgo+IHRoZSBp
bmZvcm1hdGlvbiBmcm9tICdpdyBkZXYgd2xhbiNOIHN0YXRpb24gZHVtcCcgd2hpY2ggaGFzCj4g
cnhfZHVyYXRpb24KPiBmaWVsZCB3aWxsIGJlIHVzZWQgYnkgYXBwbGljYXRpb24gYXNzZXNpbmcg
dGhlIHN0YXRpc3RpY3MKPiAvcGVyZm9ybWFuY2Ugb2YgdmFyaW91cyBjbGllbnRzIGNvbm5lY3Rl
ZCB0byBvdXIgQVAuIFdlIHdpbGwgcGxvdAo+IGEgZ3JhcGggYmFzZWQgb24gdGhpcyBpbmZvcm1h
dGlvbiAoYXNzZXNpbmcgdGhlIHJ4IHRpbWUgc3BlbnQgYnkKPiBBUCBmb3IgdmFyaW91cyBjbGll
bnRzKS4KPiAKPiA+IAo+ID4gQXJlIHlvdSByZWFsbHkgc3VyZSB5b3UgbWVhbiAidW5pY2FzdCI/
IFdoYXQgaWYgdGhlIHN0YXRpb24gaXMgdGhlCj4gPiBBUD8gV2h5IHdvdWxkbid0IG11bHRpY2Fz
dCBmcmFtZXMgaXQgdHJhbnNtaXR0ZWQgYmUgYWNjb3VudGVkIGZvcj8KPiAKPiBbc2hhZmldIFRo
aXMgaXMgYmFzZWQgb24gdGhlIGltcGxlbWVudGF0aW9uIGJ5IHRoZSBkcml2ZXIvZmlybXdhcmUu
Cj4gV2UgYXJlIGZvY3VzZWQgb24gdGhlIEFQIHNpZGUgc28gdW5pY2FzdCBmcmFtZXMsIGlmIHlv
dSBhcmUgb2sgd2l0aAo+IHRoaXMgY2hhbmdlLCBpIGNhbiBjaGFuZ2UgdGhlIGRvY3VtZW50YXRp
b24gdG8gYmUgc3BlY2lmaWMgKGdlbmVyaWMKPiBmb3IgYWxsIHRoZSBkcml2ZXJzKSDCoHNvbWV0
aGluZyBsaWtlIGltcGxlbWVudGF0aW9uIHNwZWNpZmljIChwbGVhc2UKPiBhZHZpc2UpCgpPaywg
YnV0IGZvciBBUCBzaWRlIEkgZG9uJ3Qgc2VlIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gInVuaWNh
c3QiIGFuZAoiYWxsIGZyYW1lcyIsIHNpbmNlIGFsbCBmcmFtZXMgZnJvbSB0aGF0IHN0YXRpb24g
c2hvdWxkIGJlIHVuaWNhc3Q/CkFwYXJ0LCBwZXJoYXBzLCBmcm9tIHNvbWUgbWFuYWdlbWVudCBm
cmFtZXMgdGhlIHN0YXRpb24gbWlnaHQgc2VuZApvdXRzaWRlIHRoZSBCU1MsIGJ1dCB0aGF0J3Mg
bm90IGxpa2VseSB0byBtYXR0ZXIgbXVjaD8KCklPVywgd2h5IG5vdCBzcGVjaWZ5IGFsbCBmcmFt
ZXMsIGFuZCBsZXQgdGhpcyBtYWtlIHNvbWUgc2Vuc2UgZm9yIG90aGVyCmludGVyZmFjZSBtb2Rl
cz8KCmpvaGFubmVzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
