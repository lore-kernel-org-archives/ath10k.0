Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x22c.google.com ([2a00:1450:400c:c00::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WdFaG-00021o-W2
 for ath10k@lists.infradead.org; Thu, 24 Apr 2014 09:04:45 +0000
Received: by mail-wg0-f44.google.com with SMTP id m15so1919769wgh.3
 for <ath10k@lists.infradead.org>; Thu, 24 Apr 2014 02:04:22 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1398329415.4154.1.camel@jlt4.sipsolutions.net>
References: <1398327250-12923-1-git-send-email-yeohchunyeow@gmail.com>
 <CA+BoTQkBCGyKYDaOMgdCi4Yw+SXeuRS+t0rGE8o=8+x2q5N74w@mail.gmail.com>
 <1398329415.4154.1.camel@jlt4.sipsolutions.net>
Date: Thu, 24 Apr 2014 11:04:22 +0200
Message-ID: <CA+BoTQkutgixefexBRcTcDBrWpXCy0YFzdDuoY1PdHc3J1Hejw@mail.gmail.com>
Subject: Re: [PATCH] ath10k: don't allow stand alone monitor mode for non-AP
 firmware
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
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Chun-Yeow Yeoh <yeohchunyeow@gmail.com>, linux-wireless <linux-wireless@vger.kernel.org>, Kalle Valo <kvalo@qca.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMjQgQXByaWwgMjAxNCAxMDo1MCwgSm9oYW5uZXMgQmVyZyA8am9oYW5uZXNAc2lwc29sdXRp
b25zLm5ldD4gd3JvdGU6Cj4gT24gVGh1LCAyMDE0LTA0LTI0IGF0IDEwOjQ0ICswMjAwLCBNaWNo
YWwgS2F6aW9yIHdyb3RlOgo+Cj4+IEkgdGhpbmsgTW9uaXRvciBvcGVyYXRpb24gc2hvdWxkIGJl
IHBlcmZvcm1lZCBvbiBhIGJlc3QgZWZmb3J0IGJhc2lzLgo+PiBUaGlzIG1lYW5zIG1vbml0b3Jf
c3RhcnQvc3RvcCBzaG91bGQgYmUgYXR0ZW1wdGVkIG9uY2UgbnVtYmVyIG9mCj4+IG5vbi1tb25p
dG9yIHZkZXZzIGNoYW5nZXMuCj4+Cj4+IFdlIHNob3VsZCBwcm9iYWJseSBpbnRyb2R1Y2UgYSBh
dGgxMGtfcmVjYWxjX21vbml0b3IoKSBmb3IgdGhhdCBwdXJwb3NlLgo+Cj4gRG9lc24ndCBtYWM4
MDIxMSBkbyB0aGF0IGZvciB5b3U/Cj4KPiBTZWUgSUVFRTgwMjExX0hXX1dBTlRfTU9OSVRPUl9W
SUYuCgpUaGlzIGlzIG5vdCBzdWZmaWNpZW50IGluIHRoaXMgY2FzZS4KCkUuZy4gSWYgeW91IGFk
ZCBhIGRpc2Nvbm5lY3RlZCA0YWRkciBzdGEgaW50ZXJmYWNlIHRvIGJyaWRnZSB0aGUKaW50ZXJm
YWNlIGVudGVycyBwcm9taXNjIG1vZGUuIFRoaXMgYXR0ZW1wdHMgdG8gc3RhcnQgbW9uaXRvciB2
ZGV2IGluCmF0aDEwayBiZWZvcmUgc3RhIHZkZXYgaXMgc3RhcnRlZCBpbnRlcm5hbGx5LiBXZSBj
b3VsZCBwcm9iYWJseSBtYWtlCml0IHN0YXJ0IGVhcmxpZXIgKGluIGFkZF9pbnRlcmZhY2UpIGJ1
dCB0aGVyZSBzdGlsbCByZW1haW5zIGEgcHJvYmxlbQp3aGVuIHlvdSBzdG9wIGxhc3Qgbm9uLW1v
bml0b3IgaW50ZXJmYWNlIChtb25pdG9yIHZpZiB3aWxsIGJlIGNyZWF0ZWQKX2FmdGVyXyBsYXN0
IG5vbi1tb25pdG9yIGlzIHJlbW92ZWQgd2hpY2ggaXMgdG9vIGxhdGUpLgoKCk1pY2hhxYIKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWls
aW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
