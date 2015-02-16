Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-we0-x22d.google.com ([2a00:1450:400c:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YNFZu-0004Ru-5h
 for ath10k@lists.infradead.org; Mon, 16 Feb 2015 06:54:47 +0000
Received: by mail-we0-f173.google.com with SMTP id w55so27346912wes.4
 for <ath10k@lists.infradead.org>; Sun, 15 Feb 2015 22:54:17 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87mw4fgolp.fsf@kamboji.qca.qualcomm.com>
References: <1423749198-11346-1-git-send-email-michal.kazior@tieto.com>
 <87mw4fgolp.fsf@kamboji.qca.qualcomm.com>
Date: Mon, 16 Feb 2015 07:54:17 +0100
Message-ID: <CA+BoTQkZJLaAYy+PnoLiFn5S3sfJujgRRkWcMqgdxJbbf3FHeQ@mail.gmail.com>
Subject: Re: [PATCH] ath10k: fix AP/IBSS CSA with template based fw
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

T24gMTUgRmVicnVhcnkgMjAxNSBhdCAxNjo1MSwgS2FsbGUgVmFsbyA8a3ZhbG9AcWNhLnF1YWxj
b21tLmNvbT4gd3JvdGU6Cj4gTWljaGFsIEthemlvciA8bWljaGFsLmthemlvckB0aWV0by5jb20+
IHdyaXRlczoKPgo+PiBxY2E2MTc0IHdpdGggd21pLXRsdiBmaXJtd2FyZSB1c2VzIG9mZmxvYWRl
ZAo+PiBiZWFjb25pbmcgc2NoZW1lIChpLmUuIHRlbXBsYXRlcykuIFRoaXMgcmVxdWlyZXMgYQo+
PiBsaXR0bGUgZGlmZmVyZW50IGFwcHJvYWNoIHdoZW4gaW1wbGVtZW50aW5nIENTQS4KPj4KPj4g
QWRkIG1pc3NpbmcgY29kZSB0byB1cGRhdGUgQ1MgY291bnQgYW5kIHJlcG9ydCBDU0EKPj4gY29t
cGxldGlvbiB0byBtYWM4MDIxMS4gV2l0aG91dCBpdCBjaGFubmVsIHN3aXRjaAo+PiB3YXMgbmV2
ZXIgZmluaXNoZWQuCj4+Cj4+IFRvIGF2b2lkIHJhY2VzIGR1cmluZyBpbnRlcmZhY2UgdGVhcmRv
d24gZGF0YV9sb2NrCj4+IGhhcyBiZWVuIHVzZWQgdG8gcHJvdGVjdCBpc191cCBhbmQgaXNfc3Rh
cnRlZCBzbwo+PiB0aGV5IGNhbiBiZSBjb21wYXJlZCBhZ2FpbnN0IGJlZm9yZSBzY2hlZHVsaW5n
Cj4+IGNvdW50IGRvd24gd29yay4KPj4KPj4gU2lnbmVkLW9mZi1ieTogTWljaGFsIEthemlvciA8
bWljaGFsLmthemlvckB0aWV0by5jb20+Cj4+IC0tLQo+Pgo+PiBAS2FsbGU6IEknbSBkZWZlcnJp
bmcgdGhlIGNoYW5jdHggcGF0Y2hzZXQgdjQKPj4gdW50aWwgdGhpcyBnZXRzIGFwcGxpZWQuIEkn
ZCBsaWtlIHRvIGF2b2lkIHBvc3RpbmcKPj4gcGF0Y2hlcyB3aXRob3V0IGEgdmFsaWQgcGFyZW50
IGlkIGFuZCBsZWF2aW5nIHlvdQo+PiB3aXRoIHNvbWUgd2VpcmQgY29uZmxpY3RzIGFuZCBpbXBs
aWNpdCBkZXBuZGVuY2llcwo+PiBpbiB0aGUgY29kZSB0byBkZWFsIHdpdGguCj4KPiBPay4KPgo+
IEkgYWN0dWFsbHkgaGFkIHN0cmFuZ2UgY29uZmxpY3RzIGFscmVhZHkgd2l0aCB0aGlzIHBhdGNo
IChpbiBtYWMuYykuIEFzCj4gSSdtIHRyYXZlbGxpbmcsIHBsZWFzZSBjaGVjayBteSByZXNvbHV0
aW9uIGZyb20gdGhlIHBlbmRpbmcgYnJhbmNoIHZlcnkKPiBjYXJlZnVsbHkuIEkgbWlnaHQgaGF2
ZSBkb25lIHNvbWV0aGluZyBzdHVwaWQuCgpUaGVyZSdzIGEgbWlzdGFrZS4gT25seSBgYXJ2aWYt
PmlzX3VwYCBzaG91bGQgYmUgcHJvdGVjdGVkIGJ5CmBhci0+ZGF0YV9sb2NrYCBpbiBhdGgxMGtf
YnNzX2Fzc29jKCk6CgpAQCAtMTg1Miw3ICsxOTAxLDkgQEAgc3RhdGljIHZvaWQgYXRoMTBrX2Jz
c19hc3NvYyhzdHJ1Y3QgaWVlZTgwMjExX2h3ICpodywKICAgICAgICAgICAgICAgIHJldHVybjsK
ICAgICAgICB9CgorICAgICAgIHNwaW5fbG9ja19iaCgmYXJ2aWYtPmFyLT5kYXRhX2xvY2spOwog
ICAgICAgIGFydmlmLT5pc191cCA9IHRydWU7CisgICAgICAgc3Bpbl91bmxvY2tfYmgoJmFydmlm
LT5hci0+ZGF0YV9sb2NrKTsKCiAgICAgICAgLyogV29ya2Fyb3VuZDogU29tZSBmaXJtd2FyZSBy
ZXZpc2lvbnMgKHRlc3RlZCB3aXRoIHFjYTYxNzQKICAgKC4uLikKIH0KCgpNaWNoYcWCCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGlu
ZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
