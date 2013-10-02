Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-bk0-x229.google.com ([2a00:1450:4008:c01::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VRKRw-0004zu-KL
 for ath10k@lists.infradead.org; Wed, 02 Oct 2013 11:18:37 +0000
Received: by mail-bk0-f41.google.com with SMTP id na10so270044bkb.28
 for <ath10k@lists.infradead.org>; Wed, 02 Oct 2013 04:18:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1380707467-30387-1-git-send-email-michal.kazior@tieto.com>
References: <1380707467-30387-1-git-send-email-michal.kazior@tieto.com>
Date: Wed, 2 Oct 2013 13:18:12 +0200
Message-ID: <CA+BoTQnQVE_YUrrtfFCeQSj4tmccbA9cG_ZMdHisx4C-mJfqkg@mail.gmail.com>
Subject: Re: [PATCH] ath10k: fix scheduling while atomic bug on config
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
To: ath10k@lists.infradead.org
Cc: linux-wireless <linux-wireless@vger.kernel.org>, Michal Kazior <michal.kazior@tieto.com>

T24gMiBPY3RvYmVyIDIwMTMgMTE6NTEsIE1pY2hhbCBLYXppb3IgPG1pY2hhbC5rYXppb3JAdGll
dG8uY29tPiB3cm90ZToKPiBSZWNlbnQgV01JL0hUQyBjaGFuZ2VzIGludHJvZHVjZXMgdGhpcyBi
dWcgYmVjYXVzZQo+IG5vdyBXTUkgY29tbWFuZHMgY2FuIHNsZWVwLgo+Cj4gVXNlIGFwcHJvcHJp
YXRlIGludGVyZmFjZSBpdGVyYXRpb24gZnVuY3Rpb24uCj4KPiBSZXBvcnRlZC1CeTogS2FsbGUg
VmFsbyA8a3ZhbG9AcWNhLnF1YWxjb21tLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWwgS2F6
aW9yIDxtaWNoYWwua2F6aW9yQHRpZXRvLmNvbT4KClNlbGYgTkFDSy4KCkkndmUgcG9zdGVkIHRo
aXMgdG9vIHNvb24uIFRoaXMgcGF0Y2ggY2FuIGxlYWQgdG8gZGVhZGxvY2tzIG9uCmlmbGlzdF9t
dHggaW4gc29tZSBjYXNlcy4KCgpNaWNoYcWCCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRo
MTBrCg==
