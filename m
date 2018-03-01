Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1erO8F-00032f-BW
 for ath10k@lists.infradead.org; Thu, 01 Mar 2018 13:20:29 +0000
From: Govind Singh <govinds@qti.qualcomm.com>
Subject: RE: [PATCH] ath10k: Enable IOMMU support for WCN3990 target
Date: Thu, 1 Mar 2018 13:18:44 +0000
Message-ID: <588e4d951bd84ea29dfc1a68353505e7@aphydexm01b.ap.qualcomm.com>
References: <1518685448-15317-1-git-send-email-govinds@codeaurora.org>
 <877eqwqfml.fsf@kamboji.qca.qualcomm.com>
 <CAK8P3a1KomtVHMidxtmx_gRF+92MWdHmeG0eTbcfUpbAaDPe3g@mail.gmail.com>
In-Reply-To: <CAK8P3a1KomtVHMidxtmx_gRF+92MWdHmeG0eTbcfUpbAaDPe3g@mail.gmail.com>
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
To: Arnd Bergmann <arnd@arndb.de>, Kalle Valo <kvalo@codeaurora.org>
Cc: Govind Singh <govinds@codeaurora.org>, linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

>> The asm/dma-iommu.h header file exsists only on arm32, no other architecture.
>> I'm not sure about the purpose of the patch to start with:
>> it's normally up to the platform code to allocate IOMMU domains, device drivers should only need to manually interact with the IOMMU layer if they need more than one domain, but this ath10k patch appears to be using the default domain and should have no effect as long as the platform code works correctly.
Thanks Arnd, I have fixed this and migrated to  64bit API's(iommu_attach_device/iommu_detach_device/ iommu_get_domain_for_dev), will share the next revision.
I tried using the default domain by adding the stream ID and mask in dt and no manual interaction, but it is resulting in TZ error and unhandled context fault.
Seems I need to provide explicit mapping range(aperture_start/ aperture_end) as this is only working combination for me..

BR,
Govind

-----Original Message-----
From: ath10k [mailto:ath10k-bounces@lists.infradead.org] On Behalf Of Arnd Bergmann
Sent: Thursday, March 1, 2018 3:40 PM
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Govind Singh <govinds@codeaurora.org>; linux-wireless <linux-wireless@vger.kernel.org>; ath10k@lists.infradead.org
Subject: Re: [PATCH] ath10k: Enable IOMMU support for WCN3990 target

On Thu, Mar 1, 2018 at 11:01 AM, Kalle Valo <kvalo@codeaurora.org> wrote:
> Govind Singh <govinds@codeaurora.org> writes:
>
>> When an IOMMU device is available on the platform bus, allocate an 
>> IOMMU domain and attach the wlan target to it.
>> WCN3990 target can then attach an DMA I/O virtual address space to 
>> scan out of bound transactions.
>>
>> Signed-off-by: Govind Singh <govinds@codeaurora.org>
>> ---
>>  drivers/net/wireless/ath/ath10k/snoc.c | 100 ++++++++++++++++++++++++++++++++-
>>  drivers/net/wireless/ath/ath10k/snoc.h |   3 +
>>  2 files changed, 101 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/snoc.c 
>> b/drivers/net/wireless/ath/ath10k/snoc.c
>> index cd21b25..502263d 100644
>> --- a/drivers/net/wireless/ath/ath10k/snoc.c
>> +++ b/drivers/net/wireless/ath/ath10k/snoc.c
>> @@ -26,6 +26,10 @@
>>  #include <linux/platform_device.h>
>>  #include <linux/regulator/consumer.h>  #include <linux/clk.h>
>> +#include <asm/dma-iommu.h>
>> +#include <linux/iommu.h>
>> +#include <linux/dma-mapping.h>
>
> Kbuild bot reported a problem with arm64 but strangely I cannot find 
> the full report. Anyway, this was the warning:
>
> drivers/net/wireless/ath/ath10k/snoc.c:29:10: fatal error:
> asm/dma-iommu.h: No such file or directory
>
> Any ideas? Adding also Arnd, the grand master of compilation problems 
> :)
>
> Full patch here:
>
> https://patchwork.kernel.org/patch/10220719/
>

The asm/dma-iommu.h header file exsists only on arm32, no other architecture.

I'm not sure about the purpose of the patch to start with:
it's normally up to the platform code to allocate IOMMU domains, device drivers should only need to manually interact with the IOMMU layer if they need more than one domain, but this ath10k patch appears to be using the default domain and should have no effect as long as the platform code works correctly.

       Arnd

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
