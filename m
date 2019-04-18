Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ed1-f67.google.com ([209.85.208.67])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hH2CX-0003tb-Uc
 for ath10k@lists.infradead.org; Thu, 18 Apr 2019 08:15:23 +0000
Received: by mail-ed1-f67.google.com with SMTP id i13so1035914edf.11
 for <ath10k@lists.infradead.org>; Thu, 18 Apr 2019 01:15:21 -0700 (PDT)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Subject: Re: [PATCH v2] ath10k: fix different tx duration output
In-Reply-To: <298a645b17aac0f5c466f011225533b0@codeaurora.org>
References: <1555489045-18070-1-git-send-email-leiwa@codeaurora.org>
 <87mukprnie.fsf@toke.dk> <298a645b17aac0f5c466f011225533b0@codeaurora.org>
Date: Thu, 18 Apr 2019 09:07:45 +0100
Message-ID: <875zrbrb1q.fsf@toke.dk>
MIME-Version: 1.0
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
To: leiwa@codeaurora.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

bGVpd2FAY29kZWF1cm9yYS5vcmcgd3JpdGVzOgoKPiBPbiAyMDE5LTA0LTE3IDE3OjI2LCBUb2tl
IEjDuGlsYW5kLUrDuHJnZW5zZW4gd3JvdGU6Cj4+IExlaSBXYW5nIDxsZWl3YUBjb2RlYXVyb3Jh
Lm9yZz4gd3JpdGVzOgo+PiAKPj4+IFRYIGR1cmF0aW9uIG91dHB1dCBvZiB0eF9zdGF0cyBpbiBk
ZWJ1Z2ZzIGFuZCBzdGF0aW9uIGR1bXAgaGFkIGJpZwo+Pj4gZGlmZmVyZW5jZSBiZWNhdXNlIHRo
ZXkgZ290IHR4IGR1cmF0aW9uIHZhbHVlIGZyb20gZGlmZmVyZW50IHN0YXRpc3RpYwo+Pj4gZGF0
YS4gV2Ugc2hvdWxkIHVzZSB0aGUgc2FtZSBzdGF0aXN0aWMgZGF0YS4KPj4gCj4+IFNvIGFyZSB5
b3Ugc3VyZSB5b3UgcGlja2VkIHRoZSBtb3N0IGFjY3VyYXRlIG9uZSBvZiB0aGUgdHdvPyA6KQo+
PiAKPj4gLVRva2UKPgo+IEhpIFRva2UsCj4KPiBZZXMuCj4gTm93IGZvciBhdGgxMGssIHRoZXJl
IGFyZSB0d28gd2F5cyB0byBnZXQgdHggZHVyYXRpb24gb3V0cHV0Lgo+IE9uZSBpcyBnb3QgZnJv
bSB0eF9zdGF0cyBpbiBkZWJ1Z2ZzIHJlcG9ydGVkIGJ5IGZpcm13YXJlLiBJdCBpcyBhIHRvdGFs
IAo+IHZhbHVlIGluY2x1ZGluZyBhbGwgdGhlIGZyYW1lcyB3aGljaCBjcmVhdGVkIGJ5IGhvc3Qg
YW5kIGZpcm13YXJlIHNlbnQgCj4gdG8gdGhlIHBlZXIuCj4gQW5kIHRoZSBzZWNvbmQgaXMgY2Fs
Y3VsYXRlZCBmcm9tIAo+IGF0aDEwa19odHRfcnhfdHhfY29tcGxfaW5kKCktLT5pZWVlODAyMTFf
c3RhX3JlZ2lzdGVyX2FpcnRpbWUoKSwgaGVyZSAKPiB0aGUgdHggZHVyYXRpb24ganVzdCBpbmNs
dWRlcyB0aGUgZGF0YSBmcmFtZXMgc2VudCBmcm9tIGhvc3QgdG8gdGhlIAo+IHBlZXIuCgpTbyB0
aGUgZGlmZmVyZW5jZSBpcyB0aGF0IHRoZSBmb3JtZXIgaW5jbHVkZXMgY29udHJvbCBmcmFtZXMg
YXMgd2VsbD8gSXMKdGhhdCB0aGUgb25seSBkaWZmZXJlbmNlPyBBbmQgd2hhdCBleGFjdGx5IGlz
IGEgImJpZyBkaWZmZXJlbmNlIiAoZnJvbQp0aGUgY29tbWl0IG1lc3NhZ2UpPwoKPiBTbyB0aGUg
Zmlyc3QgdmFsdWUgaXMgcHJlZmVyYWJsZSBmb3Igc3RhdGlvbiBkdW1wLgoKSG1tLCBJJ20gbm90
IHN1cmUgaWYgSSBhZ3JlZSB3aXRoIHRoaXMuIEkgc3BlY2lmaWNhbGx5IGFkZGVkIHRoZQp0eF9k
dXJhdGlvbiB0byB0aGUgc3RhdGlvbiBkdW1wIHRvIGJlIGFibGUgdG8gZ2V0IHRoZSB2YWx1ZXMg
dXNlZCBieSB0aGUKYWlydGltZSBzY2hlZHVsZXIuIFRoaXMgYnJlYWtzIHdpdGggdGhpcyBwYXRj
aC4KCi1Ub2tlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
