Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x22f.google.com ([2a00:1450:400c:c09::22f])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bPqWa-00012i-15
 for ath10k@lists.infradead.org; Wed, 20 Jul 2016 12:22:52 +0000
Received: by mail-wm0-x22f.google.com with SMTP id p129so535019wmp.0
 for <ath10k@lists.infradead.org>; Wed, 20 Jul 2016 05:22:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <900ae7541c5a4194a2f73479e1dd8bb2@aphydexm01b.ap.qualcomm.com>
References: <1466700001-4883-1-git-send-email-mohammed@qca.qualcomm.com>
 <1466700001-4883-2-git-send-email-mohammed@qca.qualcomm.com>
 <CA+BoTQnUvF2Zy7_WuEi0V+KjByRghVmoeR6yrs6hu6ag=KmBqQ@mail.gmail.com>
 <20160627143600.GA5292@atheros-ThinkPad-T61>
 <CA+BoTQn+HeishCMf4hjpWjLBmvFG2r0gosBv77RTyk7+uOAvPA@mail.gmail.com>
 <20160629094754.GA8867@atheros-ThinkPad-T61>
 <CAD2nsn3TOSaOCmm5YT6_D+aaoH9=pagQamDDz2VT+nKrFH0K8g@mail.gmail.com>
 <900ae7541c5a4194a2f73479e1dd8bb2@aphydexm01b.ap.qualcomm.com>
From: Michal Kazior <michal.kazior@tieto.com>
Date: Wed, 20 Jul 2016 14:22:29 +0200
Message-ID: <CA+BoTQmHW=uYompSLXUv2d+-Nr=11KYuA=VrmUz6X2T+D=-=Ag@mail.gmail.com>
Subject: Re: [PATCH 2/2] ath10k: Fix sending NULL/ Qos NULL data frames for
 QCA99X0 and later
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
To: "Shajakhan, Mohammed Shafi (Mohammed Shafi)" <mohammed@qti.qualcomm.com>
Cc: Mohammed Shafi Shajakhan <mohammed@codeaurora.org>, "Raja,
 Tamizh Chelvam" <c_traja@qti.qualcomm.com>, Mohammed Shafi <shafi.wireless@gmail.com>, linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMjAgSnVseSAyMDE2IGF0IDEzOjQzLCBTaGFqYWtoYW4sIE1vaGFtbWVkIFNoYWZpIChNb2hh
bW1lZCBTaGFmaSkKPG1vaGFtbWVkQHF0aS5xdWFsY29tbS5jb20+IHdyb3RlOgo+IE1pY2hhbCwK
Pgo+IENhbiB5b3UgcGxlYXNlIGxldCBtZSBrbm93IGlmIHRoaXMgY2hhbmdlIGlzIGZpbmUgb3Ig
bm90ID8KPiBJIGFtIHdhaXRpbmcgaW5maW5pdGVseSBmb3IgIHlvdXIgcmVwbHkgbG9uZyB0aW1l
CgpTb3JyeS4gSSB3YXMgYWJzZW50IGZvciBhIHdoaWxlIGFuZCB0aGlzIGVtYWlsIHNsaXBwZWQg
YnkuCgpRdW90aW5nIHlvdXIgb3RoZXIgZW1haWw6Cgo+IGlzIHRoaXMgcGF0Y2ggaXMgZ29vZCB0
byBnbyAob3IpIHNob3VsZCBpIHJlLXdvcmsgID8KPiBJIGhhZCByZXBsaWVkIHRvIE1pY2hhbCdz
IGNvbW1lbnQgb2YgaW50cm9kdWNpbmcgYSBuZXcgZmlybXdhcmUKPiBmZWF0dXJlIGZsYWcgd2ls
bCBub3QgYWRkcmVzcyB0aGUgaXNzdWUgaW4gb2xkZXIgZmlybXdhcmUgLyBjb2RlLgo+IExldCBt
ZSBrbm93IGlmIGkgaGFkIG1pc3NlZCBzb21ldGhpbmcgdmVyeSBvYnZpb3VzLgoKSSBjb3VsZG4n
dCByZWFsbHkgZmluZCBhbnkgY29uY2x1c2lvbiB0byB0aGlzIHRocmVhZCBpbiBteSBpbmJveC4K
ClRoZSBod19wYXJhbXMgYXBwcm9hY2ggaXMgZGVmaW5pdGVseSB3cm9uZy4gVGhlIEFDSyBwcm9i
bGVtIGlzCmZpcm13YXJlLXNwZWNpZmljLCBub3QgaGFyZHdhcmUtc3BlY2lmaWMuCgpJJ20gZmlu
ZSB3aXRoIHJlbW92aW5nIHRoZSB3b3JrYXJvdW5kIGNvbXBsZXRlbHkgaWYgNjM2IGlzIGd1YXJh
bnRlZWQKdG8gbm90IGJlIGJyb2tlbiwgaW5jbHVkaW5nIEFQIGFuZCBQMlAgR08gb3BlcmF0aW9u
LiBUaGUgY2xpZW50Cm9wZXJhdGlvbiB3aWxsIHByb2JhYmx5IHdvcmsgc2luY2Ugd21pLXJvYW0g
ZXZlbnQgaXMgdXNlZCBmb3IgSFcKY29ubmVjdGlvbiBtb25pdG9yaW5nLgoKTnVsbGZ1bmMgdHgt
c3RhdHVzIGFjay9ub2FjayByZXBvcnRzIGNvdWxkIGJlIHByb2JhYmx5IGZpeGVkIHVwIHVzaW5n
CnN0YSBraWNrb3V0IGV2ZW50cyAod2l0aCBzaG9ydCB0aW1lb3V0cykgYXMgYSBmYWxsYmFjay4g
VGhpcyB3b3VsZAptYWtlIGl0IGVhc2llciBmb3IgdXNlcnMgYmVjYXVzZSBvdGhlcndpc2UgdGhl
eSdkIG5lZWQgdG8gZW5hYmxlCmRpc2Fzc29jX2xvd19hY2sgaW4gaG9zdGFwZCAod2hpY2ggaXMg
cHJvYmFibHkgaW1wb3NzaWJsZSB3aXRoCndwYV9zdXBwbGljYW50IGZvciBwMnAsIG5vPykuCgoK
TWljaGHFggoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
