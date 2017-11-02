Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eAHLj-0001E5-2n
 for ath10k@lists.infradead.org; Thu, 02 Nov 2017 15:24:20 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: move pci suspend/resume functions
Date: Thu, 2 Nov 2017 15:23:42 +0000
Message-ID: <87mv44ln5v.fsf@qca.qualcomm.com>
References: <20171102110903.2886660-1-arnd@arndb.de>
In-Reply-To: <20171102110903.2886660-1-arnd@arndb.de> (Arnd Bergmann's message
 of "Thu, 2 Nov 2017 12:08:53 +0100")
Content-Language: en-US
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Govind Singh <govinds@qti.qualcomm.com>, Ryan Hsu <ryanhsu@qti.qualcomm.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Brian Norris <briannorris@chromium.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Colin Ian King <colin.king@canonical.com>, Ben Greear <greearb@candelatech.com>, Ashok Raj Nagarajan <arnagara@qti.qualcomm.com>

Arnd Bergmann <arnd@arndb.de> writes:

> The combination of two patches has led to a build failure:
>
> drivers/net/wireless/ath/ath10k/pci.c: In function 'ath10k_pci_pm_suspend':
> drivers/net/wireless/ath/ath10k/pci.c:3416:8: error: implicit declaration of function 'ath10k_pci_suspend'; did you mean 'ath10k_pci_pm_suspend'? [-Werror=implicit-function-declaration]
> drivers/net/wireless/ath/ath10k/pci.c: In function 'ath10k_pci_pm_resume':
> drivers/net/wireless/ath/ath10k/pci.c:3428:8: error: implicit declaration of function 'ath10k_pci_resume'; did you mean 'ath10k_pci_pm_resume'? [-Werror=implicit-function-declaration]
>
> This moves the functions outside of the now incorrect #ifdef.
>
> Fixes: 96378bd2c6cd ("ath10k: fix core PCI suspend when WoWLAN is supported but disabled")
> Fixes: 6af1de2e4ec4 ("ath10k: mark PM functions as __maybe_unused")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Brian has already fixed this, please check that:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=ath-next&id=20665a9076d48e9abd9a2db13d307f58f7ef6647

But apparently I forgot to merge ath-next to wireless-drivers-next, will
do that soon.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
