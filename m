Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28]
 helo=alexa-out-lv-02.qualcomm.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dpv6l-00018m-3L
 for ath10k@lists.infradead.org; Thu, 07 Sep 2017 11:36:33 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10: mark PM functions as __maybe_unused
Date: Thu, 7 Sep 2017 11:36:05 +0000
Message-ID: <87o9qmn3kr.fsf@kamboji.qca.qualcomm.com>
References: <20170906125904.2588620-1-arnd@arndb.de>
In-Reply-To: <20170906125904.2588620-1-arnd@arndb.de> (Arnd Bergmann's message
 of "Wed, 6 Sep 2017 14:58:53 +0200")
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
Cc: Govind Singh <govinds@qti.qualcomm.com>, Ryan Hsu <ryanhsu@qti.qualcomm.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Rajkumar Manoharan <rmanohar@qti.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Colin Ian King <colin.king@canonical.com>, Ben Greear <greearb@candelatech.com>, Ashok Raj Nagarajan <arnagara@qti.qualcomm.com>, "bartosz.markowski@tieto.com" <bartosz.markowski@tieto.com>

Arnd Bergmann <arnd@arndb.de> writes:

> When CONFIG_PM_SLEEP is disabled, we get a compile-time
> warning:
>
> drivers/net/wireless/ath/ath10k/pci.c:3417:12: error: 'ath10k_pci_pm_resume' defined but not used [-Werror=unused-function]
>  static int ath10k_pci_pm_resume(struct device *dev)
>             ^~~~~~~~~~~~~~~~~~~~
> drivers/net/wireless/ath/ath10k/pci.c:3401:12: error: 'ath10k_pci_pm_suspend' defined but not used [-Werror=unused-function]
>  static int ath10k_pci_pm_suspend(struct device *dev)
>
> Rather than fixing the #ifdef, this just marks both functions
> as __maybe_unused, which is a more robust way to do this.
>
> Fixes: 32faa3f0ee50 ("ath10k: add the PCI PM core suspend/resume ops")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks. But the title should have "ath10k:", I'll fix that.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
