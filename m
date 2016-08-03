Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x22c.google.com ([2a00:1450:400c:c09::22c])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bUqJN-0005KA-IX
 for ath10k@lists.infradead.org; Wed, 03 Aug 2016 07:09:54 +0000
Received: by mail-wm0-x22c.google.com with SMTP id o80so321531624wme.1
 for <ath10k@lists.infradead.org>; Wed, 03 Aug 2016 00:09:33 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <579B71B4.7080206@candelatech.com>
References: <1469608424-11370-1-git-send-email-benjamin@sipsolutions.net>
 <5798EEC3.5040008@candelatech.com>
 <1469803947.7306.139.camel@sipsolutions.net>
 <579B71B4.7080206@candelatech.com>
From: Michal Kazior <michal.kazior@tieto.com>
Date: Wed, 3 Aug 2016 09:09:31 +0200
Message-ID: <CA+BoTQkbM8uQoOWhXnKp+qJXxnnvHXeW4rV_fSuy3ftzLgMsww@mail.gmail.com>
Subject: Re: [PATCH] ath10k: Allow setting coverage class
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
Cc: Simon Wunderlich <sw@simonwunderlich.de>, Benjamin Berg <benjamin@sipsolutions.net>, linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Kalle Valo <kvalo@qca.qualcomm.com>, Sebastian Gottschall <s.gottschall@dd-wrt.com>, Mathias Kretschmer <mathias.kretschmer@fit.fraunhofer.de>

T24gMjkgSnVseSAyMDE2IGF0IDE3OjA5LCBCZW4gR3JlZWFyIDxncmVlYXJiQGNhbmRlbGF0ZWNo
LmNvbT4gd3JvdGU6Cj4gT24gMDcvMjkvMjAxNiAwNzo1MiBBTSwgQmVuamFtaW4gQmVyZyB3cm90
ZToKWy4uLl0KPj4gWWVhaCwgSSBhbSBhd2FyZSBvZiB0aGUgZmFjdCB0aGF0IHRoZSBmaXJtd2Fy
ZSBtYXkgZG8gaW50ZXJuYWwgcmVzZXRzCj4+IGZyb20gdGltZSB0byB0aW1lLiBUaGUgaW50ZXJl
c3RpbmcgcXVlc3Rpb24gKGFuZCBvbmUgZm9yIHdoaWNoIEkgZG8gbm90Cj4+IGtub3cgdGhlIGFu
c3dlcikgaXMgd2hldGhlciB3ZSBnZXQgYSB3bWkgb3Igb3RoZXIgZXZlbnQgdW5kZXIgYWxsCj4+
IGNvbmRpdGlvbnMgd2hlcmUgdGhlIHJlZ2lzdGVyIG1heSBiZSByZXdyaXR0ZW4gZHVlIHRvIGEg
cmVzZXQuCj4+Cj4+IFRoZSBjdXJyZW50IGNvZGUgd2lsbCByZS1zZXQgdGhlIHJlZ2lzdGVyIHZh
bHVlIGFmdGVyIGFueSB3bWkgZXZlbnQKPj4gaW5jbHVkaW5nIGRlYnVnIG1lc3NhZ2VzLiBJZiB0
aGlzIGlzIG5vdCBlbm91Z2gsIHRoZW4gdGhlIG9ubHkgc29sdXRpb24KPj4gbWlnaHQgYmUgdG8g
cGVyaW9kaWNhbGx5IHBvbGwgdGhlIHJlZ2lzdGVyIHZhbHVlcyBpbnN0ZWFkIG9mIHJlbHlpbmcg
b24KPj4gYSByZWNlaXZlZCBldmVudC4KPgo+IFlvdSB3aWxsIGdldCBhIGRiZ2xvZyBldmVudCBh
dCBsZWFzdCBtb3N0IG9mIHRoZSB0aW1lLCBzbyBtYXliZSB0aGF0Cj4gd2lsbCBiZSBnb29kIGVu
b3VnaC4KCkJ1dCB5b3UgbmVlZCB0byByZW1lbWJlciB5b3UgbmVlZCB0byBlbmFibGUgZGJnbG9n
IGZpcnN0IHRvIGdldCB0aGVzZQpldmVudHMuIEkgZ3Vlc3Mgd2hlbiBjb3ZlcmFnZSBjbGFzcyBp
cyBzZXQgdGhlIGRyaXZlciBjb3VsZCwKaW50ZXJuYWxseSwgb3ZlcnJpZGUgZGJnbG9nIG1hc2sg
c28gdGhhdCB0aGVzZSBldmVudHMgYXJlIGd1YXJhbnRlZWQKdG8gYmUgcmVwb3J0ZWQgZm9yIHRo
ZSBwdXJwb3NlIG9mIHByb3Blcmx5IHJlZnJlc2hpbmcgcmVnaXN0ZXJzIG9uCmNoYW5uZWwgcHJv
Z3JhbW1pbmcuCgpBdCB0aGF0IHBvaW50IEkgZ3Vlc3MgdGhlIHVwZGF0ZSBob29rIGNvdWxkIGJl
IGp1c3QgcGxhY2VkIGluIGRiZ2xvZwpoYW5kbGVyIGFsb25lIGluc3RlYWQgb2YgYWxsIG92ZXIg
d21pX3J4IHZhcmlhbnRzLgoKCk1pY2hhxYIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgx
MGsK
