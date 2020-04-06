Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLUZO-0002rC-1W
 for ath10k@lists.infradead.org; Mon, 06 Apr 2020 16:25:56 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/2] ath10k: enable VHT160 and VHT80+80 modes
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1585574792-719-1-git-send-email-ssreeela@codeaurora.org>
References: <1585574792-719-1-git-send-email-ssreeela@codeaurora.org>
Message-Id: <20200406162548.4EF63C433BA@smtp.codeaurora.org>
Date: Mon,  6 Apr 2020 16:25:48 +0000 (UTC)
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
To: Sowmiya Sree Elavalagan <ssreeela@codeaurora.org>
Cc: Lei Wang <leiwa@codeaurora.org>, Rick Wu <rwu@codeaurora.org>, linux-wireless@vger.kernel.org, Sebastian Gottschall <s.gottschall@dd-wrt.com>, ath10k@lists.infradead.org

U293bWl5YSBTcmVlIEVsYXZhbGFnYW4gPHNzcmVlZWxhQGNvZGVhdXJvcmEub3JnPiB3cm90ZToK
Cj4gU2V0IHJpZ2h0IGNoYW5uZWwgZnJlcXVlbmNpZXMgaW4gVkhUMTYwIG1vZGUgYWNjb3JkaW5n
IHRvIHRoZSBWSFQxNjAKPiBpbnRlcm9wZXJhYmlsaXR5IHdvcmthcm91bmQgYWRkZWQgYXMgcGFy
dCBvZiBJRUVFIFN0ZCA4MDIuMTHihKItMjAxNiBpbgo+ICJUYWJsZSA5LTI1MuKAlFZIVCBPcGVy
YXRpb24gSW5mb3JtYXRpb24gc3ViZmllbGRzIiwgYmFuZF9jZW50ZXJfZnJlcTIKPiBjb3JyZXNw
b25kcyB0byBDQ0ZTMSBpbiBUYWJsZSA5LTI1My4gUHJldmlvdXMgaW1wbGVtZW50YXRpb24KPiAo
YmFuZF9jZW50ZXJfZnJlcTIgPSAwIGZvciBWSFQxNjApIGlzIG9ubHkgZGVwcmVjYXRlZC4KPiAK
PiBFbmFibGUgVkhUODArODAgbW9kZSBhbmQgc2V0IHRoZSBwcm9wZXIgcGVlciBSWCBuc3MgdmFs
dWUgZm9yIFZIVDE2MCBhbmQKPiBWSFQ4MCs4MCBtb2RlLgo+IAo+IEJhc2VkIG9uIHBhdGNoZXMg
YnkgU2ViYXN0aWFuIEdvdHRzY2hhbGw6Cj4gCj4gaHR0cHM6Ly9sa21sLmtlcm5lbC5vcmcvci8y
MDE4MDcwNDA5NTQ0NC42NjItMS1zLmdvdHRzY2hhbGxAZGQtd3J0LmNvbQo+IAo+IGh0dHBzOi8v
bGttbC5rZXJuZWwub3JnL3IvMjAxODA3MDQxMjA1MTkuNjQ3OS0xLXMuZ290dHNjaGFsbEBkZC13
cnQuY29tCj4gCj4gVGVzdGVkOiBxY2E5OTg0IHdpdGggZmlybXdhcmUgdmVyIDEwLjQtMy4xMC0w
MDA0Nwo+IAo+IENvLWRldmVsb3BlZC1ieTogU2ViYXN0aWFuIEdvdHRzY2hhbGwgPHMuZ290dHNj
aGFsbEBkZC13cnQuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFNlYmFzdGlhbiBHb3R0c2NoYWxsIDxz
LmdvdHRzY2hhbGxAZGQtd3J0LmNvbT4KPiBDby1kZXZlbG9wZWQtYnk6IFJpY2sgV3UgPHJ3dUBj
b2RlYXVyb3JhLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBSaWNrIFd1IDxyd3VAY29kZWF1cm9yYS5v
cmc+Cj4gU2lnbmVkLW9mZi1ieTogTGVpIFdhbmcgPGxlaXdhQGNvZGVhdXJvcmEub3JnPgo+IFNp
Z25lZC1vZmYtYnk6IFNvd21peWEgU3JlZSBFbGF2YWxhZ2FuIDxzc3JlZWVsYUBjb2RlYXVyb3Jh
Lm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBLYWxsZSBWYWxvIDxrdmFsb0Bjb2RlYXVyb3JhLm9yZz4K
CjIgcGF0Y2hlcyBhcHBsaWVkIHRvIGF0aC1uZXh0IGJyYW5jaCBvZiBhdGguZ2l0LCB0aGFua3Mu
CgozZGIyNDA2NWMyYzggYXRoMTBrOiBlbmFibGUgVkhUMTYwIGFuZCBWSFQ4MCs4MCBtb2Rlcwo3
OTVkZWY4YjE0ZmYgYXRoMTBrOiBlbmFibGUgcmFkYXIgZGV0ZWN0aW9uIGluIHNlY29uZGFyeSBz
ZWdtZW50CgotLSAKaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMTQ2NTUwNS8K
Cmh0dHBzOi8vd2lyZWxlc3Mud2lraS5rZXJuZWwub3JnL2VuL2RldmVsb3BlcnMvZG9jdW1lbnRh
dGlvbi9zdWJtaXR0aW5ncGF0Y2hlcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
