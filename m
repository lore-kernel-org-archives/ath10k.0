Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vc0-x233.google.com ([2607:f8b0:400c:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XbqBU-0005Fy-9b
 for ath10k@lists.infradead.org; Wed, 08 Oct 2014 12:17:36 +0000
Received: by mail-vc0-f179.google.com with SMTP id im17so6658162vcb.10
 for <ath10k@lists.infradead.org>; Wed, 08 Oct 2014 05:17:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20141008111258.GD25666@qca.qualcomm.com>
References: <1412759786-10567-1-git-send-email-rmanohar@qti.qualcomm.com>
 <CA+BoTQ=K=F5TodrmuaEaJfErFx1=BL-bmPDrAaeMLjjb8c3fJQ@mail.gmail.com>
 <20141008103312.GA25666@qca.qualcomm.com>
 <CA+BoTQmVsyuxjvc_s-BC6ZwRWk3ACG0CvDYHJRnZ7OqY6W1Upw@mail.gmail.com>
 <20141008110842.GC25666@qca.qualcomm.com>
 <20141008111258.GD25666@qca.qualcomm.com>
Date: Wed, 8 Oct 2014 14:17:14 +0200
Message-ID: <CA+BoTQmub2V+smwVyRV-qr-6RZUs+=HQTdLX0+AUBp9wyUYw0g@mail.gmail.com>
Subject: Re: [PATCH] ath10k: fix kernel panic while shutting down AP
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
To: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gOCBPY3RvYmVyIDIwMTQgMTM6MTMsIFJhamt1bWFyIE1hbm9oYXJhbiA8cm1hbm9oYXJAcXRp
LnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4gT24gV2VkLCBPY3QgMDgsIDIwMTQgYXQgMDQ6Mzg6NDRQ
TSArMDUzMCwgUmFqa3VtYXIgTWFub2hhcmFuIHdyb3RlOgo+PiBPbiBXZWQsIE9jdCAwOCwgMjAx
NCBhdCAxMjo1MDoyOFBNICswMjAwLCBNaWNoYWwgS2F6aW9yIHdyb3RlOgo+PiA+IElmIGFueXRo
aW5nIHRoZSBvZmZlbmRlciBzaG91bGQgYmUgZG1hX3VubWFwX3NpbmdsZSgpIGJ1dCB0aGUgdGhp
bmcgaXMKPj4gPiBiZWFjb25fYnVmIGlzIGFsd2F5cyBhbGxvY2F0ZWQgZm9yIEFQL0lCU1Mgbm93
IHdoaWNoIG1lYW5zCj4+ID4gZG1hX3VubWFwX3NpbmdsZSgpIGlzIG5ldmVyIGNhbGxlZC4gRm9y
IG5vbi1BUC9JQlNTIGJvdGggYXJ2aWYtPmJlYWNvbgo+PiA+IGFuZCBhcnZpZi0+YmVhY29uX2J1
ZiBhcmUgYWx3YXlzIE5VTEwgc28gbmVpdGhlcgo+PiA+IGRtYV9hbGxvYy9mcmVlX2NvaGVyZW50
IG5vciBkbWFfbWFwL3VubWFwX3NpbmdsZSBhcmUgY2FsbGVkLgo+PiA+Cj4+IEFncmVlLiBXZSBu
ZWVkIG9uZSBtb3JlIGNoZWNrIGluIGF0aDEwa19tYWNfdmlmX2JlYWNvbl9mcmVlLgo+Cj4gTm8g
YWRkaXRpb25hbCBjaGVjayBpcyBuZWVkZWQuIEZvciBub24gYmVhY29uaW5nIG1vZGUsIGFydmlm
LT5iZWFjb24KPiBzaG91bGQgYmUgZmFsc2UuIGlzbid0IGl0PwoKQ29ycmVjdC4gTm8gZXh0cmEg
Y2hlY2tzIGFyZSBuZWNlc3NhcnkuCgoKTWljaGHFggoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2F0aDEwawo=
