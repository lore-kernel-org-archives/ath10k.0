Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ot0-x241.google.com ([2607:f8b0:4003:c0f::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eAHcN-0006V7-4P
 for ath10k@lists.infradead.org; Thu, 02 Nov 2017 15:41:21 +0000
Received: by mail-ot0-x241.google.com with SMTP id s88so1737761ota.4
 for <ath10k@lists.infradead.org>; Thu, 02 Nov 2017 08:40:58 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87mv44ln5v.fsf@qca.qualcomm.com>
References: <20171102110903.2886660-1-arnd@arndb.de>
 <87mv44ln5v.fsf@qca.qualcomm.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 2 Nov 2017 16:40:57 +0100
Message-ID: <CAK8P3a2xkh19gocctXf4gv1Km_SaYJPbSC5QkkZ0WMQQAXp83Q@mail.gmail.com>
Subject: Re: [PATCH] ath10k: move pci suspend/resume functions
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: Govind Singh <govinds@qti.qualcomm.com>, Ryan Hsu <ryanhsu@qti.qualcomm.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Brian Norris <briannorris@chromium.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Colin Ian King <colin.king@canonical.com>, Ben Greear <greearb@candelatech.com>, Ashok Raj Nagarajan <arnagara@qti.qualcomm.com>

On Thu, Nov 2, 2017 at 4:23 PM, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> Arnd Bergmann <arnd@arndb.de> writes:
>
>> The combination of two patches has led to a build failure:
>>
>> drivers/net/wireless/ath/ath10k/pci.c: In function 'ath10k_pci_pm_suspend':
>> drivers/net/wireless/ath/ath10k/pci.c:3416:8: error: implicit declaration of function 'ath10k_pci_suspend'; did you mean 'ath10k_pci_pm_suspend'? [-Werror=implicit-function-declaration]
>> drivers/net/wireless/ath/ath10k/pci.c: In function 'ath10k_pci_pm_resume':
>> drivers/net/wireless/ath/ath10k/pci.c:3428:8: error: implicit declaration of function 'ath10k_pci_resume'; did you mean 'ath10k_pci_pm_resume'? [-Werror=implicit-function-declaration]
>>
>> This moves the functions outside of the now incorrect #ifdef.
>>
>> Fixes: 96378bd2c6cd ("ath10k: fix core PCI suspend when WoWLAN is supported but disabled")
>> Fixes: 6af1de2e4ec4 ("ath10k: mark PM functions as __maybe_unused")
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> Brian has already fixed this, please check that:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=ath-next&id=20665a9076d48e9abd9a2db13d307f58f7ef6647
>
> But apparently I forgot to merge ath-next to wireless-drivers-next, will
> do that soon.

Yes, Brian's version is better. I considered the same, but wasn't sure
it was safe.

      Arnd

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
