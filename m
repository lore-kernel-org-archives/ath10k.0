Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1erLAU-0007wn-7U
 for ath10k@lists.infradead.org; Thu, 01 Mar 2018 10:11:45 +0000
Received: by mail-qt0-x242.google.com with SMTP id l25so6827469qtj.1
 for <ath10k@lists.infradead.org>; Thu, 01 Mar 2018 02:10:19 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <877eqwqfml.fsf@kamboji.qca.qualcomm.com>
References: <1518685448-15317-1-git-send-email-govinds@codeaurora.org>
 <877eqwqfml.fsf@kamboji.qca.qualcomm.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 1 Mar 2018 11:10:18 +0100
Message-ID: <CAK8P3a1KomtVHMidxtmx_gRF+92MWdHmeG0eTbcfUpbAaDPe3g@mail.gmail.com>
Subject: Re: [PATCH] ath10k: Enable IOMMU support for WCN3990 target
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Govind Singh <govinds@codeaurora.org>, linux-wireless <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org

On Thu, Mar 1, 2018 at 11:01 AM, Kalle Valo <kvalo@codeaurora.org> wrote:
> Govind Singh <govinds@codeaurora.org> writes:
>
>> When an IOMMU device is available on the platform bus, allocate
>> an IOMMU domain and attach the wlan target to it.
>> WCN3990 target can then attach an DMA I/O virtual address
>> space to scan out of bound transactions.
>>
>> Signed-off-by: Govind Singh <govinds@codeaurora.org>
>> ---
>>  drivers/net/wireless/ath/ath10k/snoc.c | 100 ++++++++++++++++++++++++++++++++-
>>  drivers/net/wireless/ath/ath10k/snoc.h |   3 +
>>  2 files changed, 101 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
>> index cd21b25..502263d 100644
>> --- a/drivers/net/wireless/ath/ath10k/snoc.c
>> +++ b/drivers/net/wireless/ath/ath10k/snoc.c
>> @@ -26,6 +26,10 @@
>>  #include <linux/platform_device.h>
>>  #include <linux/regulator/consumer.h>
>>  #include <linux/clk.h>
>> +#include <asm/dma-iommu.h>
>> +#include <linux/iommu.h>
>> +#include <linux/dma-mapping.h>
>
> Kbuild bot reported a problem with arm64 but strangely I cannot find the
> full report. Anyway, this was the warning:
>
> drivers/net/wireless/ath/ath10k/snoc.c:29:10: fatal error:
> asm/dma-iommu.h: No such file or directory
>
> Any ideas? Adding also Arnd, the grand master of compilation problems :)
>
> Full patch here:
>
> https://patchwork.kernel.org/patch/10220719/
>

The asm/dma-iommu.h header file exsists only on arm32, no other architecture.

I'm not sure about the purpose of the patch to start with:
it's normally up to the platform code to allocate IOMMU domains,
device drivers should only need to manually interact with the
IOMMU layer if they need more than one domain, but this ath10k
patch appears to be using the default domain and should have
no effect as long as the platform code works correctly.

       Arnd

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
