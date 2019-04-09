Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hE07b-0000fR-GV
 for ath10k@lists.infradead.org; Tue, 09 Apr 2019 23:25:44 +0000
Received: by mail-lf1-x141.google.com with SMTP id h18so230804lfj.11
 for <ath10k@lists.infradead.org>; Tue, 09 Apr 2019 16:25:42 -0700 (PDT)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com.
 [209.85.167.45])
 by smtp.gmail.com with ESMTPSA id k2sm6675209lfb.62.2019.04.09.16.25.38
 for <ath10k@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Apr 2019 16:25:39 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id o199so271665lfo.1
 for <ath10k@lists.infradead.org>; Tue, 09 Apr 2019 16:25:38 -0700 (PDT)
MIME-Version: 1.0
References: <1542163824-795-1-git-send-email-wgong@codeaurora.org>
 <CABvG-CWg-VXAtoN8HZumW-ZdP6dX9cO_8fWJ58C22kD2yDcXdw@mail.gmail.com>
 <195f3bb0c88c43a6b1ca0ad336f947c0@aptaiexm02f.ap.qualcomm.com>
 <CABvG-CWAfB8jjCDW4ggjJ8_YC++CjttJOMOt4s24F3mymvNR9A@mail.gmail.com>
 <02904ba8682441e1a89668c1345cbec9@aptaiexm02f.ap.qualcomm.com>
 <54b4dab1191d41b8b329f3ceb7017626@aptaiexm02f.ap.qualcomm.com>
 <CABvG-CWz0rBCXfF7mX9L62=fmdcYhpOaO5JNLtvSE87o_XJFng@mail.gmail.com>
 <1fec49e1b6794860a1eff2330bcdea28@aptaiexm02f.ap.qualcomm.com>
In-Reply-To: <1fec49e1b6794860a1eff2330bcdea28@aptaiexm02f.ap.qualcomm.com>
From: Brian Norris <briannorris@chromium.org>
Date: Tue, 9 Apr 2019 16:25:27 -0700
Message-ID: <CA+ASDXP1Ftpi93p=Bp2w1rRd3xVtNn_+diwkKTMXbTqK0B3ahA@mail.gmail.com>
Subject: Re: [PATCH] ath10k: Remove ATH10K_STATE_RESTARTED in simulate fw crash
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
To: Wen Gong <wgong@qti.qualcomm.com>
Cc: =?UTF-8?Q?Micha=C5=82_Kazior?= <kazikcz@gmail.com>, linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Wen Gong <wgong@codeaurora.org>

T24gTW9uLCBBcHIgOCwgMjAxOSBhdCAxMDowOSBQTSBXZW4gR29uZyA8d2dvbmdAcXRpLnF1YWxj
b21tLmNvbT4gd3JvdGU6Cj4gPiBGcm9tOiBNaWNoYcWCIEthemlvciA8a2F6aWtjekBnbWFpbC5j
b20+Cj4gPiBUbyBzYXRpc2Z5IGJvdGggSSB3b3VsZCBzdWdnZXN0IHlvdSBlaXRoZXIgZXhwb3Nl
IGFyLT5zdGF0ZSB2aWEKPiA+IGRlYnVnZnMgYW5kIG1ha2UgeW91ciB0ZXN0IHByb2NlZHVyZSB3
YWl0IGZvciB0aGF0IHRvIGdldCBiYWNrIGludG8gT04KPiA+IHN0YXRlIGJlZm9yZSBzaW11bGF0
aW5nIGEgY3Jhc2ggYWdhaW4sIG9yIHRvIGV4dGVuZCB0aGUgc2V0IG9mIGN1cnJlbnQKPiA+IHNp
bXVsYXRlX2Z3X2NyYXNoIGNvbW1hbmRzIChjdXJyZW50bHkganVzdDogc29mdCwgaGFyZCwgYXNz
ZXJ0LAo+ID4gaHctcmVzdGFydCkgdG8gc29tZXRoaW5nIHRoYXQgYWxsb3dzIGV4cHJlc3Npbmcg
dGhlIGludGVudCB3aGV0aGVyCj4gPiBjcmFzaC1pbi1jcmFzaCBwcmV2ZW50aW9uIGlzIGludGVu
ZGVkICh5b3VyIGNhc2UpIG9yIG5vdCAobXkgb3JpZ2luYWwKPiA+IGNhc2UpLgo+ID4KPiA+IFRo
aXMgY291bGQgYmUgZm9yIGV4YW1wbGUgc29tZXRoaW5nIGxpa2UgdGhpczoKPiA+ICAgZWNobyBz
b2Z0IHdhaXQtcmVhZHkgPiBzaW11bGF0ZV9md19jcmFzaAo+ID4KPiA+IFRoZSAid2FpdC1yZWFk
eSIgZXh0cmEga2V5d29yZCB3b3VsZCBpbXBseSBjcmFzaC1pbi1jcmFzaCBwcmV2ZW50aW9uLgo+
ID4gVGhpcyB3b3VsZCBrZWVwIGV4aXN0aW5nIHRvb2xzIHdvcmtpbmcgKGJvdGggYmVoYXZpb3Ig
YW5kIHN5bnRheCkgYW5kCj4gPiB3b3VsZCBhbGxvdyB5b3VyIHRlc3QgY2FzZSB0byBiZSBpbXBs
ZW1lbnRlZC4KPiA+Cj4gSXMgaXQgZWFzeSB0byBjaGFuZ2UgeW91ciBleGlzdGluZyB0b29scz8K
PiBJIHdhbnQgdG8gY2hhbmdlIGl0IHRvOiBlY2hvIHNvZnQgc2tpcC1yZWFkeSA+IHNpbXVsYXRl
X2Z3X2NyYXNoCj4gVGhlICJza2lwLXJlYWR5IiBleHRyYSBrZXl3b3JkIHdvdWxkIGltcGx5IGNy
YXNoLWluLWNyYXNoLCAqbm90KiBwcmV2ZW50aW9uLgo+IE15IHRlc3QgdG9vbHMgaXMgaGFyZCB0
byBjaGFuZ2UuCgpJbiBjYXNlIHlvdSdyZSB0YWxraW5nIGFib3V0IHRoZSB0ZXN0IGZyYW1ld29y
ayB3ZSBydW4gZm9yIENocm9tZU9TCnZhbGlkYXRpb24sIG5vLCBpdCdzIG5vdCBoYXJkIGF0IGFs
bCB0byBjaGFuZ2UuIEFzIGxvbmcgYXMgdGhlcmUncyBhCmdvb2QgcmVhc29uLgoKSSBoYXZlbid0
IGNsb3NlbHkgZm9sbG93ZWQgdGhpcywgYnV0IGp1ZGdpbmcgYnkgdGhlIGFib3ZlIHN1bW1hcnks
Cml0J3MgcHJvYmFibHkgbW9yZSByZWFzb25hYmxlIGZvciBvdXIgdGVzdCBmcmFtZXdvcmsgdG8g
b25seSBzaW11bGF0ZQpGVyBjcmFzaGVzIGFmdGVyIHRoZSBkcml2ZXIgcmV0dXJucyB0byAicmVh
ZHkiIChvciBhdCBsZWFzdCwgaWYgd2UgZG8KY3Jhc2gtaW4tY3Jhc2gsIGRvbid0IGV4cGVjdCB0
aGUgZHJpdmVyIHRvIHJlY292ZXI/KS4gSSBleHBlY3Qgd2UgY2FuCndvcmsgd2l0aCB3aGF0ZXZl
ciBtZWNoYW5pc20geW91IGltcGxlbWVudCBmb3IgdGhhdCAoZXhwb3NpbmcgdGhlCiJzdGF0ZSIs
IG9yIHByb3ZpZGluZyBhIG5ldyBzaW11bGF0ZV9md19jcmFzaCBtb2RlKS4KCkJyaWFuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGlu
ZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
