Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdAUu-0007gO-Qz
 for ath10k@lists.infradead.org; Mon, 25 May 2020 10:38:23 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 03/11] mmc: sdio: Move SDIO IDs from mwifiex driver to
 common include file
References: <20200522144412.19712-1-pali@kernel.org>
 <20200522144412.19712-4-pali@kernel.org>
Date: Mon, 25 May 2020 13:38:07 +0300
In-Reply-To: <20200522144412.19712-4-pali@kernel.org> ("Pali
 \=\?utf-8\?Q\?Roh\?\= \=\?utf-8\?Q\?\=C3\=A1r\=22's\?\= message
 of "Fri, 22 May 2020 16:44:04 +0200")
Message-ID: <87ftbo9u5s.fsf@codeaurora.org>
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

UGFsaSBSb2jDoXIgPHBhbGlAa2VybmVsLm9yZz4gd3JpdGVzOgoKPiBBZGQgX1dMQU4gc3VmZml4
IHRvIG1hY3JvIG5hbWVzIGZvciBjb25zaXN0ZW5jeSB3aXRoIG90aGVyIE1hcnZlbGwgbWFjcm9z
Lgo+IFRoZXNlIElEcyByZXByZXNlbnRzIHdsYW4gZnVuY3Rpb24gb2YgY29tYm8gYnQvd2xhbiBj
YXJkcy4gT3RoZXIgZnVuY3Rpb25zCj4gb2YgdGhlc2UgY2FyZHMgaGF2ZSBkaWZmZXJlbnQgSURz
Lgo+Cj4gU2lnbmVkLW9mZi1ieTogUGFsaSBSb2jDoXIgPHBhbGlAa2VybmVsLm9yZz4KCkFja2Vk
LWJ5OiBLYWxsZSBWYWxvIDxrdmFsb0Bjb2RlYXVyb3JhLm9yZz4KCi0tIApodHRwczovL3dpcmVs
ZXNzLndpa2kua2VybmVsLm9yZy9lbi9kZXZlbG9wZXJzL2RvY3VtZW50YXRpb24vc3VibWl0dGlu
Z3BhdGNoZXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
