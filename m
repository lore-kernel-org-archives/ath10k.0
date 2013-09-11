Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-bk0-x22e.google.com ([2a00:1450:4008:c01::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VJce1-0002B1-B6
 for ath10k@lists.infradead.org; Wed, 11 Sep 2013 05:07:14 +0000
Received: by mail-bk0-f46.google.com with SMTP id 6so3366025bkj.33
 for <ath10k@lists.infradead.org>; Tue, 10 Sep 2013 22:06:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20130910141413.GE29385@localhost>
References: <1378821003-22925-1-git-send-email-michal.kazior@tieto.com>
 <1378821003-22925-2-git-send-email-michal.kazior@tieto.com>
 <20130910141413.GE29385@localhost>
Date: Wed, 11 Sep 2013 07:06:46 +0200
Message-ID: <CA+BoTQ=E6NpACFWkgFthbY4AjNp_nbfF1kKkQb9iPrAkD6SBfw@mail.gmail.com>
Subject: Re: [PATCH 1/7] ath10k: simplify HTC credits calculation
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
To: Bob Copeland <me@bobcopeland.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org

T24gMTAgU2VwdGVtYmVyIDIwMTMgMTY6MTQsIEJvYiBDb3BlbGFuZCA8bWVAYm9iY29wZWxhbmQu
Y29tPiB3cm90ZToKPiBPbiBUdWUsIFNlcCAxMCwgMjAxMyBhdCAwMzo0OTo1N1BNICswMjAwLCBN
aWNoYWwgS2F6aW9yIHdyb3RlOgo+PiArICAgICAgICAgICAgIHNrYiA9IF9fc2tiX2RlcXVldWUo
JmVwLT50eF9xdWV1ZSk7Cj4+ICsKPj4gKyAgICAgICAgICAgICBpZiAoZXAtPnR4X2NyZWRpdF9m
bG93X2VuYWJsZWQpIHsKPj4gKyAgICAgICAgICAgICAgICAgICAgIC8qIGludGVnZXIgZGl2aXNp
b24gdy8gcm91bmQtdXAgKi8KPj4gKyAgICAgICAgICAgICAgICAgICAgIGNyZWRpdHMgPSAoc2ti
LT5sZW4gKyBodGMtPnRhcmdldF9jcmVkaXRfc2l6ZSAtIDEpIC8KPj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBodGMtPnRhcmdldF9jcmVkaXRfc2l6ZTsKPgo+IFRoZXJlJ3MgYSBt
YWNybyBmb3IgdGhhdC4uLgo+Cj4gICAgICAgICAgICAgY3JlZGl0cyA9IERJVl9ST1VORF9VUChz
a2ItPmxlbiwgaHRjLT50YXJnZXRfY3JlZGl0X3NpemUpOwoKSSBkaWRuJ3Qga25vdyB0aGF0LiBU
aGFua3MhCgoKTWljaGHFgi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
