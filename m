Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-we0-x235.google.com ([2a00:1450:400c:c03::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YKhm9-0005GC-9e
 for ath10k@lists.infradead.org; Mon, 09 Feb 2015 06:24:54 +0000
Received: by mail-we0-f181.google.com with SMTP id w62so7320842wes.12
 for <ath10k@lists.infradead.org>; Sun, 08 Feb 2015 22:24:30 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <54D4E89A.7040602@candelatech.com>
References: <1423224354-24955-1-git-send-email-michal.kazior@tieto.com>
 <54D4E89A.7040602@candelatech.com>
Date: Mon, 9 Feb 2015 07:24:30 +0100
Message-ID: <CA+BoTQ=HqyGKOBdOmpWOn_VjH1UTWF9nN_PE0uanaGsdeJmB6Q@mail.gmail.com>
Subject: Re: [RFT] ath10k: restart fw on tx-credit timeout
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
To: Ben Greear <greearb@candelatech.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Matti Laakso <malaakso@elisanet.fi>

T24gNiBGZWJydWFyeSAyMDE1IGF0IDE3OjE1LCBCZW4gR3JlZWFyIDxncmVlYXJiQGNhbmRlbGF0
ZWNoLmNvbT4gd3JvdGU6Cj4gT24gMDIvMDYvMjAxNSAwNDowNSBBTSwgTWljaGFsIEthemlvciB3
cm90ZToKPj4KPj4gSXQgbWFrZXMgbGl0dGxlIHNlbnNlIHRvIGNvbnRpbnVlIGFuZCBsZXQKPj4g
ZmlybXdhcmUtaG9zdCBzdGF0ZSBiZWNvbWUgaW5jb25zaXN0ZW50IGlmIGEgV01JCj4+IGNvbW1h
bmQgY2FuJ3QgYmUgc3VibWl0dGVkIHRvIGZpcm13YXJlLgo+Pgo+PiBUaGlzIGVmZmVjdGl2ZWx5
IHByZXZlbnRzIGFmdGVyLWFmZmVjdHMgb2YKPj4gdHgtY3JlZGl0IHN0YXJ2YXRpb24gYnVnIHdo
aWNoIGluY2x1ZGUgc3B1cmlvdXMKPj4gc3RhIGtpY2tvdXQgZXZlbnRzIGFuZCBpbmFiaWxpdHkg
dG8gYXNzb2NpYXRlIG5ldwo+PiBzdGF0aW9ucyBhZnRlciBzb21lIHRpbWUgd2hlbiBhY3Rpbmcg
YXMgQVAuCj4+Cj4+IFRoaXMgc2hvdWxkIGFsc28gc3BlZWQgdXAgcmVjb3ZlcnkvdGVhcmRvd24g
aW4KPj4gc29tZSBjYXNlcyB3aGVuIGZpcm13YXJlIHN0b3BzIHJlc3BvbmRpbmcgZm9yIHNvbWUK
Pj4gcmVhc29uLgo+Cj4KPiBJIGhhdmUgbm90IHNlZW4gYSBXTUkgdGltZW91dCBzaW5jZSBJIGFk
ZGVkIGtlZXAtYWxpdmUKPiBhbmQgQ0UgcG9sbGluZyBpbiBteSBmaXJtd2FyZSwgYnV0IHRoZSBw
YXRjaCBsb29rcyBPSwo+IHRvIG1lLgoKVGhpcyBpcyBtYWlubHkgYWltZWQgYXQgdGhlIHR4LWNy
ZWRpdCBzdGFydmF0aW9uIGR1ZSB0byBtZ210LXR4IGJlaW5nCnN0dWNrIG9uIGNsaWVudCBwb3dl
cnNhdmUgYnVmZmVyaW5nLgoKCj4gWW91IG1pZ2h0IGFkZCBzb21ldGhpbmcgYWJvdXQgJ1dNSScg
aW4gdGhhdCB3YXJuaW5nCj4gbWVzc2FnZSB0byBtYWtlIGl0IG1vcmUgY2xlYXIgd2hhdCBpcyBu
b3QgYmVpbmcKPiByZXNwb25zaXZlLgoKR29vZCBwb2ludC4KCgo+IEF0IGxlYXN0IGluIG15IHRl
c3RzLCBJIGNvdWxkIGNvbnRpbnVlCj4gdG8gcmVjZWl2ZSBuZXR3b3JrIHRyYWZmaWMgd2hpbGUg
V01JIHdhcyBibG9ja2VkLgoKWWVhaC4gVHJhZmZpYyB3b3JrcyB3aXRoIHRoZSB0eC1jcmVkaXQg
c3RhcnZhdGlvbiBhcyB3ZWxsIGJ1dCB3aGF0Cmdvb2QgaXMgdGhpcyBpZiB5b3UgaGF2ZSBpbmNv
bnNpc3RlbnQgZHJpdmVyLWZpcm13YXJlIHN0YXRlIGFmdGVyCmZhaWxpbmcgdG8gc2VuZCBhIGZl
dyBjb21tYW5kcz8KCgpNaWNoYcWCCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
