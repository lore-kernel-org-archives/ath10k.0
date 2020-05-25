Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdAVd-0007AI-20
 for ath10k@lists.infradead.org; Mon, 25 May 2020 10:39:09 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 07/11] mmc: sdio: Move SDIO IDs from ath6kl driver to
 common include file
References: <20200522144412.19712-1-pali@kernel.org>
 <20200522144412.19712-8-pali@kernel.org>
Date: Mon, 25 May 2020 13:38:46 +0300
In-Reply-To: <20200522144412.19712-8-pali@kernel.org> ("Pali
 \=\?utf-8\?Q\?Roh\?\= \=\?utf-8\?Q\?\=C3\=A1r\=22's\?\= message
 of "Fri, 22 May 2020 16:44:08 +0200")
Message-ID: <87blmc9u4p.fsf@codeaurora.org>
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
To: Pali =?utf-8?Q?Roh=C3=A1r?= <pali@kernel.org>
Cc: brcm80211-dev-list.pdl@broadcom.com, Ulf Hansson <ulf.hansson@linaro.org>, libertas-dev@lists.infradead.org, Xinming Hu <huxinming820@gmail.com>, linux-wireless@vger.kernel.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Amitkumar Karwar <amitkarwar@gmail.com>, Marek =?utf-8?Q?Beh=C3=BAn?= <marek.behun@nic.cz>, Ganapathi Bhat <ganapathi.bhat@nxp.com>, ath10k@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, brcm80211-dev-list@cypress.com, b43-dev@lists.infradead.org

UGFsaSBSb2jDoXIgPHBhbGlAa2VybmVsLm9yZz4gd3JpdGVzOgoKPiBBbHNvIHJlcGxhY2UgZ2Vu
ZXJpYyBNQU5VRkFDVFVSRVIgbWFjcm9zIGJ5IHByb3BlciBTRElPIElEcyBtYWNyb3MuCj4KPiBD
aGVjayBmb3IgIkFSNjAwMyBvciBsYXRlciIgaXMgc2xpZ2h0bHkgbW9kaWZpZWQgdG8gdXNlIFNE
SU8gZGV2aWNlIElEcy4KPiBUaGlzIGFsbG93cyByZW1vdmFsIG9mIGFsbCBjdXN0b20gTUFOVUZB
Q1RVUkVSIG1hY3JvcyBmcm9tIGF0aDZrbC4KPgo+IFNpZ25lZC1vZmYtYnk6IFBhbGkgUm9ow6Fy
IDxwYWxpQGtlcm5lbC5vcmc+CgpBY2tlZC1ieTogS2FsbGUgVmFsbyA8a3ZhbG9AY29kZWF1cm9y
YS5vcmc+CgotLSAKaHR0cHM6Ly93aXJlbGVzcy53aWtpLmtlcm5lbC5vcmcvZW4vZGV2ZWxvcGVy
cy9kb2N1bWVudGF0aW9uL3N1Ym1pdHRpbmdwYXRjaGVzCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vYXRoMTBrCg==
