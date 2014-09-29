Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XYdXs-0005ph-2o
 for ath10k@lists.infradead.org; Mon, 29 Sep 2014 16:11:28 +0000
Message-ID: <5429848D.6000706@candelatech.com>
Date: Mon, 29 Sep 2014 09:10:53 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Possible issue with firmware crash reporting.
References: <5421B67D.8060508@candelatech.com>
 <87wq8m1ydg.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87wq8m1ydg.fsf@kamboji.qca.qualcomm.com>
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
Cc: ath10k <ath10k@lists.infradead.org>

On 09/29/2014 04:04 AM, Kalle Valo wrote:
> Ben Greear <greearb@candelatech.com> writes:
> 
>> This kernel is basically linux-ath from a few days ago
>> plus a bunch of my patches, including my versions of the firmware
>> BSS and stack dump patches.
>> Problem could be mine alone, but likely the patches Kalle
>> is working on would be susceptible to the same sort of problem.
>>
>> I produced this by purposefully crashing the firmware during
>> station registration while debugging some firmware issues.
>>
>> This is just FYI, but if someone cares to do similar
>> testing, I can build a special firmware that crashes
>> in the same way and make it available.
>>
>>
>> =================================
>> [ INFO: inconsistent lock state ]
>> 3.17.0-rc6+ #3 Not tainted
>> ---------------------------------
>> inconsistent {SOFTIRQ-ON-W} -> {IN-SOFTIRQ-W} usage.
>> swapper/2/0 [HC0[0]:SC1[1]:HE1:SE0] takes:
>>  (uevent_sock_mutex){+.?.+.}, at: [<ffffffff8133d402>]
>> kobject_uevent_env+0x2b8/0x5d7
> 
> [...]
> 
>> {SOFTIRQ-ON-W} state was registered at:
>>   [<ffffffff81111f34>] __lock_acquire+0x352/0xe48
>>   [<ffffffff81112ef6>] lock_acquire+0xd2/0x120
>>   [<ffffffff8165c77c>] mutex_lock_nested+0x4f/0x3c7
>>   [<ffffffff8133d402>] kobject_uevent_env+0x2b8/0x5d7
>>   [<ffffffff8133d72c>] kobject_uevent+0xb/0xd
>>   [<ffffffff8133c970>] kset_register+0x30/0x3e
>>   [<ffffffff81431a7a>] bus_register+0xae/0x292
>>   [<ffffffff81d69174>] platform_bus_init+0x29/0x41
>>   [<ffffffff81d69202>] driver_init+0x27/0x33
>>   [<ffffffff81d1e0d9>] kernel_init_freeable+0x155/0x263
>>   [<ffffffff8164e95a>] kernel_init+0x9/0xda
>>   [<ffffffff8165f0bc>] ret_from_fork+0x7c/0xb0
> 
> [...]
> 
>>  <IRQ>  [<ffffffff81657366>] dump_stack+0x4e/0x71
>>  [<ffffffff81653c50>] print_usage_bug+0x1ec/0x1fd
>>  [<ffffffff8101bcae>] ? save_stack_trace+0x27/0x44
>>  [<ffffffff81111457>] ? check_usage_backwards+0xa0/0xa0
>>  [<ffffffff81111aeb>] mark_lock+0x11b/0x212
>>  [<ffffffff81111ebe>] __lock_acquire+0x2dc/0xe48
>>  [<ffffffff81113215>] ? mark_held_locks+0x54/0x76
>>  [<ffffffff811904f3>] ? __free_pages_ok+0xb3/0xca
>>  [<ffffffff811133c9>] ? trace_hardirqs_on_caller+0x192/0x1a1
>>  [<ffffffff81112ef6>] lock_acquire+0xd2/0x120
>>  [<ffffffff8133d402>] ? kobject_uevent_env+0x2b8/0x5d7
>>  [<ffffffff8165c77c>] mutex_lock_nested+0x4f/0x3c7
>>  [<ffffffff8133d402>] ? kobject_uevent_env+0x2b8/0x5d7
>>  [<ffffffff8133d402>] ? kobject_uevent_env+0x2b8/0x5d7
>>  [<ffffffff81430f16>] ? dev_uevent+0x1d4/0x274
>>  [<ffffffff8133c147>] ? kobject_get_path+0x8c/0xdb
>>  [<ffffffff8133d402>] kobject_uevent_env+0x2b8/0x5d7
>>  [<ffffffff811133c9>] ? trace_hardirqs_on_caller+0x192/0x1a1
>>  [<ffffffffa069c70f>] ath10k_pci_fw_crashed_dump+0x456/0x535 [ath10k_pci]
>>  [<ffffffff81006432>] ? xen_set_domain_pte+0x37/0xe1
>>  [<ffffffffa069c854>] ath10k_pci_tasklet+0x27/0x5a [ath10k_pci]
>>  [<ffffffff810dcd4d>] tasklet_action+0xcb/0xdd
> 
> If I'm reading this right, uevent_sock_mutex is by both
> platform_bus_init() and and ath10k tasklet in
> ath10k_pci_fw_crashed_dump() tries to acquire the same lock via
> kobject_uevent_evn(). But I don't understand is how
> ath10k_pci_fw_crashed_dump() ends up calling kobject_uevent_env(), I
> just can't find a code path to do that.
> 
> Are you sure you don't have some custom patches which cause this, like
> sending a uevent whenever firmware crashes?

Well yes, I do have that patch in this kernel I think.

I'll remove it, I can key off of the ethtool stats for
firmware crash counts instead.

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
