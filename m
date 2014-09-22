Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-we0-x234.google.com ([2a00:1450:400c:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XW0wU-0000Mv-M1
 for ath10k@lists.infradead.org; Mon, 22 Sep 2014 10:34:03 +0000
Received: by mail-we0-f180.google.com with SMTP id u56so2643711wes.11
 for <ath10k@lists.infradead.org>; Mon, 22 Sep 2014 03:33:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87oau8m1hg.fsf@kamboji.qca.qualcomm.com>
References: <1411046487-19544-1-git-send-email-michal.kazior@tieto.com>
 <1411046487-19544-7-git-send-email-michal.kazior@tieto.com>
 <87a95wngzt.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQmsVqvGgu_fUqKGqhEKXV7E_w0KdcH_GFoPhAvyjtVdDA@mail.gmail.com>
 <87oau8m1hg.fsf@kamboji.qca.qualcomm.com>
Date: Mon, 22 Sep 2014 12:33:39 +0200
Message-ID: <CA+BoTQmNx2BaJB5b0irmZUi14xAhBeAtVZAcQU_K=M6QnZXHHQ@mail.gmail.com>
Subject: Re: [PATCH 6/9] ath10k: deduplicate wmi service ready logic
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

T24gMjIgU2VwdGVtYmVyIDIwMTQgMTE6NDYsIEthbGxlIFZhbG8gPGt2YWxvQHFjYS5xdWFsY29t
bS5jb20+IHdyb3RlOgo+IE1pY2hhbCBLYXppb3IgPG1pY2hhbC5rYXppb3JAdGlldG8uY29tPiB3
cml0ZXM6ClsuLi5dCj4gTGlrZSBkaXNjdXNzZWQgaW4gSVJDLCB5b3UgZG9uJ3QgbmVlZCB0byBy
ZXNlbnQgdGhlIHdob2xlIHBhdGNoc2V0IGp1c3QKPiBiZWNhdXNlIG9mIHRoaXMuIEkgaGF2ZSBu
b3cgZm9sZGVkIHRoZSBwYXRjaCBiZWxvdyBvbnRvIHlvdXIgcGF0Y2ggaW4KPiBhdGgtbmV4dC10
ZXN0LCBwbGVhc2UgcmV2aWV3Ogo+Cj4gaHR0cHM6Ly9naXRodWIuY29tL2t2YWxvL2F0aC9jb21t
aXQvMWQxM2FiNGEzYmRmZDM0MmVkOGZiZWFkODU5ZGUzOThiMzc5NDM1YwoKTG9va3MgZ29vZC4g
VGhhbmtzIQoKCk1pY2hhxYIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
