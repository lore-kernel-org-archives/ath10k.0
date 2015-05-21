Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22e.google.com ([2a00:1450:400c:c05::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YvJE4-0004De-SC
 for ath10k@lists.infradead.org; Thu, 21 May 2015 05:41:01 +0000
Received: by wicmx19 with SMTP id mx19so1895161wic.0
 for <ath10k@lists.infradead.org>; Wed, 20 May 2015 22:40:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1431434736-7077-1-git-send-email-michal.kazior@tieto.com>
References: <1431434736-7077-1-git-send-email-michal.kazior@tieto.com>
Date: Thu, 21 May 2015 07:40:38 +0200
Message-ID: <CA+BoTQ=dzJS447Gx+XAXPT6gZDDKZ__6scbxe0QC-iMA47bZmQ@mail.gmail.com>
Subject: Re: [PATCH] amth10k: fix promisc handling
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, Michal Kazior <michal.kazior@tieto.com>

T24gMTIgTWF5IDIwMTUgYXQgMTQ6NDUsIE1pY2hhbCBLYXppb3IgPG1pY2hhbC5rYXppb3JAdGll
dG8uY29tPiB3cm90ZToKPiBQYXRjaCBkZjE0MDQ2NTBjY2IgKCJtYWM4MDIxMTogcmVtb3ZlIHN1
cHBvcnQgZm9yCj4gSUZGX1BST01JU0MiKSByZW1vdmVkIHByb21pc2N1b3VzIGZsYWcgcHJvcGFn
YXRpb24KPiB0byBkcml2ZXJzLgo+Cj4gSG93ZXZlciB0aGUgcGF0Y2ggd2FzIGRlc2lnbmVkIGFn
YWluc3QgYXRoMTBrCj4gd2l0aG91dCA1NDg0NjIxMzNkOTggKCJhdGgxMGs6IGZpeCBpbnRlcnJ1
cHQKPiBzdG9ybSIpLgo+Cj4gQWZ0ZXIgbWVyZ2UgdGhlIGNvZGUgZHJpZnRlZCBpbnRvIGJlaW5n
IG5vIGxvbmdlcgo+IGNvcnJlY3QgYW5kIGR1ZSB0byBtb25pdG9yIHZkZXYgYmVpbmcKPiBvdmVy
emVhbG91c2x5IHN0YXJ0ZWQgY2F1c2VkIElCU1MgdG8gY3Jhc2ggb24KPiA5OTkuOTk5LjAuNjM2
IGZvciBRQ0E5ODhYICh0aGlzIGZpcm13YXJlIHJldmlzaW9uCj4gaXMga25vd24gdG8gaGF2ZSBp
c3N1ZXMgd2l0aCBtb25pdG9yIHZkZXYpLgo+Cj4gVGhpcyBwYXRjaCBrZWVwcyBleHBlY3RhdGlv
bnMgb2YgY29tbWl0Cj4gNTQ4NDYyMTMzZDk4IChpLmUuIHJlZHVjZSBpcnEgc3Rvcm0gYnkgbm90
Cj4gZW5hYmxpbmcgbW9uaXRvciB2ZGV2IGZvciBBUCkgYW5kIGRvZXNuJ3QgYnJlYWsKPiBleGlz
dGluZyAoa25vd24pIHNldHVwcyB0aGF0IGltcGx5IHByb21pc2N1b3VzCj4gbW9kZSBvbiBuZXR3
b3JrIGludGVyZmFjZXMuCj4KPiBDb250cmFyeSB0byB3aGF0IGl0IGxvb2tzIGxpa2UgNTQ4NDYy
MTMzZDk4Cj4gZnVuY3Rpb25hbGl0eSBpcyBub3QgcmV2ZXJ0ZWQgc2luY2UgdGhlIGludGVudGlv
bgo+IHdhcyBhIHN1YnNldCBvZiB3aGF0IGRmMTQwNDY1MGNjYiBkaWQuCj4KPiBGaXhlczogYzE3
Yzk5N2Q1NjEzICgiTWVyZ2UgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJu
ZWwvZ2l0L2t2YWxvL3dpcmVsZXNzLWRyaXZlcnMtbmV4dCIpCj4gU2lnbmVkLW9mZi1ieTogTWlj
aGFsIEthemlvciA8bWljaGFsLmthemlvckB0aWV0by5jb20+CgpBcHBhcmVudGx5IHRoaXMgYWxz
byBmaXhlcyBzb21lIHdlaXJkIGlzc3VlcyB3aXRoIHFjYTYxNzQgaHcyLjEgbm90YWJseToKIC0g
YXRoMTBrIGNhdXNpbmcgZGlzY29ubmVjdGluZyBvZiBvdGhlciBkZXZpY2VzIGluIGEgQlNTCiAt
IHJhbmRvbSBGdyBjcmFzaGVzCgpCb3RoIHByb2JsZW1zIHN0YXJ0ZWQgdG8gaGFwcGVuIGJlY2F1
c2UgYzE3Yzk5N2Q1NjEzIGVuYWJsZWQgbW9uaXRvcgp2ZGV2IGJ5IGRlZmF1bHQgb24gU1RBIGlu
dGVyZmFjZXMuIEl0IHNlZW1zIHRoYXQgcWNhNjE3NCBodzIuMQpmaXJtd2FyZSBoYXMgaXNzdWVz
IHNpbWlsYXIgdG8gdGhvc2Ugb2YgcWNhOTg4eCA5OTkuOTk5LjAuNjM2CnJlZ2FyZGluZyBtb25p
dG9yIHZkZXYgb3ByYXRpb24uCgpBbHNvLCBJJ3ZlIG1hZGUgYSB0eXBvIGluIHRoZSBzdWJqZWN0
LgoKSSdsbCBwb3N0IHYyIHdpdGggc3ViamVjdCBmaXhlZCBhbmQgZXh0ZW5kZWQgY29tbWl0IGxv
ZyBsYXRlci4KCgpNaWNoYcWCCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
