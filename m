Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XG9un-0005I0-28
 for ath10k@lists.infradead.org; Sat, 09 Aug 2014 16:54:45 +0000
Message-ID: <53E6523F.1060001@candelatech.com>
Date: Sat, 09 Aug 2014 09:54:23 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH v5 6/7] ath10k: save firmware RAM and ROM BSS sections
 on crash
References: <20140808201815.20713.85582.stgit@potku.adurom.net>
 <20140808202920.20713.58726.stgit@potku.adurom.net>
 <53E550F2.1040209@candelatech.com> <87d2caw632.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87d2caw632.fsf@kamboji.qca.qualcomm.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: ath10k@lists.infradead.org



On 08/08/2014 11:05 PM, Kalle Valo wrote:
> Ben Greear <greearb@candelatech.com> writes:
>
>> On 08/08/2014 01:29 PM, Kalle Valo wrote:
>>>
>>> +/* estimated values, hopefully these are enough */
>>> +#define ATH10K_ROM_BSS_BUF_LEN 10000
>>> +#define ATH10K_RAM_BSS_BUF_LEN 30000
>>> +
>>>   /* used for crash-dump storage, protected by data-lock */
>>>   struct ath10k_fw_crash_data {
>>>   	bool crashed_since_read;
>>> @@ -301,6 +305,9 @@ struct ath10k_fw_crash_data {
>>>   	u32 reg_dump_values[REG_DUMP_COUNT_QCA988X];
>>>   	u8 stack_buf[ATH10K_FW_STACK_SIZE];
>>>   	u8 exc_stack_buf[ATH10K_FW_STACK_SIZE];
>>> +
>>> +	u8 rom_bss_buf[ATH10K_ROM_BSS_BUF_LEN];
>>> +	u8 ram_bss_buf[ATH10K_RAM_BSS_BUF_LEN];
>>>   };
>>
>> That (using estimates instead of allocating memory when we know the
>> true value and/or when we need it) is wasting quite a bit of RAM.
>> Doesn't matter on my systems, but AP manufacturers might be more
>> ticklish about RAM usage...
>
> Yeah, that is a problem bu this can be avoided by disabling
> CONFIG_ATH10K_DEBUGFS altogether. But on the other hand, there might be
> people who would still prefer to enable debugfs but not waste RAM on
> firmware crash dumps. For those we could add a module parameter or
> similar to disable firmware crash dumps, but is that overengineering
> already?
>
> Another option is that we do firmware crash memory allocation on the
> fly, when the crash happens. But as we are in atomic context it's pretty
> expensive. We cannot do huge kmalloc() call due to memory fragmentation
> and I doubt __vmalloc() is acceptable to call in atomic contexts (at
> least I didn't find use of that in the kernel).
>
> Third option is that we allocate crash dump buffers after the firmware
> has been loaded and FW IEs are read. That way we don't allocate any
> extra memory but the fundamental problem still persists.

I'd prefer this third option..seems more elegant all around.

I don't think you can do vmalloc in atomic context, btw.  But, can do it
on firmware load.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
