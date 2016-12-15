Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cHd16-0008OK-6v
 for ath10k@lists.infradead.org; Thu, 15 Dec 2016 20:52:41 +0000
Received: by mail-wm0-x244.google.com with SMTP id m203so480785wma.3
 for <ath10k@lists.infradead.org>; Thu, 15 Dec 2016 12:52:18 -0800 (PST)
Subject: Re: [RFC v2 11/11] ath10k: Added sdio support
References: <1479496971-19174-1-git-send-email-erik.stromdahl@gmail.com>
 <1479496971-19174-12-git-send-email-erik.stromdahl@gmail.com>
 <87oa0duow8.fsf@kamboji.qca.qualcomm.com>
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Message-ID: <4d9b8000-47c1-3537-1e76-12c0dfa7d382@gmail.com>
Date: Thu, 15 Dec 2016 21:52:16 +0100
MIME-Version: 1.0
In-Reply-To: <87oa0duow8.fsf@kamboji.qca.qualcomm.com>
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
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>



On 12/15/2016 05:40 PM, Valo, Kalle wrote:
> Erik Stromdahl <erik.stromdahl@gmail.com> writes:
> 
>> Initial HIF sdio/mailbox implementation.
>>
>> Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
>> ---
>>  drivers/net/wireless/ath/ath10k/Kconfig  |    6 +
>>  drivers/net/wireless/ath/ath10k/Makefile |    3 +
>>  drivers/net/wireless/ath/ath10k/sdio.c   | 1860 ++++++++++++++++++++++++++++++
>>  drivers/net/wireless/ath/ath10k/sdio.h   |  276 +++++
>>  4 files changed, 2145 insertions(+)
>>  create mode 100644 drivers/net/wireless/ath/ath10k/sdio.c
>>  create mode 100644 drivers/net/wireless/ath/ath10k/sdio.h
> 
> AFAIK the sdio firmware binary is different from pci and usb. And as all
> the firmware images need to coexist in the same repository I suspect we
> can't continue to use firmware-N.bin for both pcie and sdio (and in
> future usb). So should we somehow rename the sdio firmware filename to
> something else, like firmware-sdio-N.bin?
> 
I suppose you are right. I would be surprised if the firmware images
were the same for sdio, usb and pci. Hopefully all sdio chipsets sharing
the same device id and BMI version will use the same firmware image.
Currently, these two params are the only two that are used when
selecting firmware.

struct bmi_target_info also has a type parameter, but I can't see it
being used anywhere in the code.

If it turns out that several sdio chipsets uses the same BMI version and
device id, this parameter might be used (together with the other two) to
select hw params.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
