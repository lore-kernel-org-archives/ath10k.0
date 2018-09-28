Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g5ytH-0007yu-O6
 for ath10k@lists.infradead.org; Fri, 28 Sep 2018 19:57:33 +0000
Subject: Re: [RFC 2/2] ath10k: reporting estimated tx airtime for fairness
References: <1538008874-11692-1-git-send-email-rmanohar@codeaurora.org>
 <1538008874-11692-2-git-send-email-rmanohar@codeaurora.org>
 <87lg7lfxtw.fsf@toke.dk> <34bac7851e6c9d3194cef87bd952c388@codeaurora.org>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <25469b4a-219d-f941-15ad-a1c95308dd69@candelatech.com>
Date: Fri, 28 Sep 2018 12:57:13 -0700
MIME-Version: 1.0
In-Reply-To: <34bac7851e6c9d3194cef87bd952c388@codeaurora.org>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Rajkumar Manoharan <rmanohar@codeaurora.org>, =?UTF-8?Q?Toke_H=c3=b8iland-J=c3=b8rgensen?= <toke@toke.dk>
Cc: Kan Yan <kyan@google.com>, linux-wireless-owner@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

T24gMDkvMjgvMjAxOCAxMjo0NyBQTSwgUmFqa3VtYXIgTWFub2hhcmFuIHdyb3RlOgo+IE9uIDIw
MTgtMDktMjggMDg6MjUsIFRva2UgSMO4aWxhbmQtSsO4cmdlbnNlbiB3cm90ZToKPgo+PiBTbyB0
aGlzIGp1c3QgdXNlcyB0aGUgY2FsY3VsYXRlZCBhaXJ0aW1lIGJhc2VkIG9uIHJhdGUgYW5kIHNp
emU/IFdhc24ndAo+PiB0aGVyZSBzdXBwb3NlZCB0byBiZSBhbiBhaXJ0aW1lIHVzYWdlIHZhbHVl
IHJlcG9ydGVkIGJ5IHRoZSBmaXJtd2FyZT8gOikKPj4KPiBGaXJtd2FyZSBpbnRlcmZhY2UgY2hh
bmdlcyBhcmUgaW4gcHJvZ3Jlc3MuIEFpcnRpbWUgZm9yIHN0YS90aWQgd2lsbCBiZSByZXBvcnRl
ZCB2aWEKPiBodHQgdHgtY29tcGwgYW5kIHJ4IGluZCBtZXNzYWdlcy4gTWVhbnRpbWUgSSB0aG91
Z2h0IGl0IHdvdWxkIGJlIHVzZWZ1bCB0byB1c2UgS2FuJ3MgY2hhbmdlcwo+IGZvciBBVEYgdmFs
aWRhdGlvbiBpbiBhdGgxMGsgdXNpbmcgZXhpc3RpbmcgZmlybXdhcmUuIDopCgpNYXliZSB5b3Ug
Y2FuIGdldCB0aGUgZmlybXdhcmUgZ3V5cyB0byByZXBvcnQgdGhlIHR4IHJhdGUgaW4gdGhlIHR4
LWNvbXBsZXRpb24KKGxpa2UgSSBoYXZlIGJlZW4gZG9pbmcgZm9yIHllYXJzIGluIG15IGF0aDEw
ay1jdCBmaXJtd2FyZSk/ICBUaGVuIGxldCB0aGUgaG9zdApkbyB0aGUgYWlyLXRpbWUgY2FsY3Vs
YXRpbmc/CgpJJ2xsIGdpdmUgdGhlbSBmaXJtd2FyZSBwYXRjaGVzIGlmIHRoZSB3YW50IDopCgpU
aGFua3MsCkJlbgoKPgo+IC1SYWprdW1hcgo+CgoKLS0gCkJlbiBHcmVlYXIgPGdyZWVhcmJAY2Fu
ZGVsYXRlY2guY29tPgpDYW5kZWxhIFRlY2hub2xvZ2llcyBJbmMgIGh0dHA6Ly93d3cuY2FuZGVs
YXRlY2guY29tCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
