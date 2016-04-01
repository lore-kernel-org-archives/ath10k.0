Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x233.google.com ([2a00:1450:400c:c09::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1alsPs-0008BK-IJ
 for ath10k@lists.infradead.org; Fri, 01 Apr 2016 06:18:45 +0000
Received: by mail-wm0-x233.google.com with SMTP id 20so9558394wmh.1
 for <ath10k@lists.infradead.org>; Thu, 31 Mar 2016 23:18:23 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1459457986-29222-2-git-send-email-greearb@candelatech.com>
References: <1459457986-29222-1-git-send-email-greearb@candelatech.com>
 <1459457986-29222-2-git-send-email-greearb@candelatech.com>
Date: Fri, 1 Apr 2016 08:18:21 +0200
Message-ID: <CA+BoTQmR_ziondh_bdEfQMC1jezGO6ioVSiMB3G4uGXvr5eKaw@mail.gmail.com>
Subject: Re: [PATCH 2/3] ath10k: Ensure peer_map references are cleaned up.
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMzEgTWFyY2ggMjAxNiBhdCAyMjo1OSwgIDxncmVlYXJiQGNhbmRlbGF0ZWNoLmNvbT4gd3Jv
dGU6ClsuLi5dCj4gQEAgLTgxMiw2ICs4MTMsMTUgQEAgc3RhdGljIHZvaWQgYXRoMTBrX3BlZXJf
Y2xlYW51cChzdHJ1Y3QgYXRoMTBrICphciwgdTMyIHZkZXZfaWQpCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgYXItPnBlZXJfbWFwW3BlZXJfaWRdID0gTlVMTDsKPiAgICAgICAgICAgICAgICAg
fQo+Cj4gKyAgICAgICAgICAgICAgIC8qIERvdWJsZSBjaGVjayB0aGF0IHBlZXIgaXMgcHJvcGVy
bHkgdW4tcmVmZXJlbmNlZCBmcm9tIHRoZSBwZWVyX21hcCAqLwo+ICsgICAgICAgICAgICAgICBm
b3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShhci0+cGVlcl9tYXApOyBpKyspIHsKPiArICAgICAg
ICAgICAgICAgICAgICAgICBpZiAoYXItPnBlZXJfbWFwW2ldID09IHBlZXIpIHsKPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGF0aDEwa193YXJuKGFyLCAiRVJST1I6ICBGYWlsZSB0
byBwcm9wZXJseSBjbGVhbiB1cCBwZWVyOiAlcCAlcE0sIGlkeDogJWQsIHdpbGwgZml4LlxuIiwK
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBlZXIsIHBlZXIt
PmFkZHIsIGkpOwoKVGhlIG1lc3NhZ2UgZG9lc24ndCBmaXQgdGhlIHN0eWxlIGFuZCBoYXMgdHlw
b3MuIEkgdGhpbmsgaXQncyBtb3JlCmluLWxpbmUgd2l0aCB0aGUgcHJlY2VlZGluZyB3YXJuaW5n
IHRvOgogICJyZW1vdmluZyBzdGFsZSBwZWVyX21hcCBlbnRyeSBmb3IgJXBNIChwdHIgJXAgaWR4
ICVkKSIKCgpbLi4uXQo+IEBAIC04NTAsNiArODYxLDExIEBAIHN0YXRpYyB2b2lkIGF0aDEwa19w
ZWVyX2NsZWFudXBfYWxsKHN0cnVjdCBhdGgxMGsgKmFyKQo+ICAgICAgICAgICAgICAgICBsaXN0
X2RlbCgmcGVlci0+bGlzdCk7Cj4gICAgICAgICAgICAgICAgIGtmcmVlKHBlZXIpOwo+ICAgICAg
ICAgfQo+ICsKPiArICAgICAgIC8qIENsZWFuIHVwIHBlZXItbWFwICovCgpObyBuZWVkIGZvciB0
aGUgY29tbWVudC4KCj4gKyAgICAgICBmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShhci0+cGVl
cl9tYXApOyBpKyspCj4gKyAgICAgICAgICAgICAgIGFyLT5wZWVyX21hcFtpXSA9IE5VTEw7CgpD
b3VsZCB1c2UgbWVtc2V0KCkgYXMgd2VsbD8KCgpBbnl3YXksIHRoYW5rcyBmb3IgY2F0Y2hpbmcg
dGhlc2UhIDopCgoKTWljaGHFggoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
