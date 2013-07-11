Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UxIR5-0002rF-2k
 for ath10k@lists.infradead.org; Thu, 11 Jul 2013 15:05:35 +0000
Message-ID: <51DEC9A7.2080207@candelatech.com>
Date: Thu, 11 Jul 2013 08:05:11 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [ath9k-devel] [PATCH] ath10k:  Fix crash when using v1 hardware.
References: <1372804925-1701-1-git-send-email-greearb@candelatech.com>
 <87y59d5tgu.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87y59d5tgu.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 07/11/2013 02:36 AM, Kalle Valo wrote:
> greearb@candelatech.com writes:
>
>> From: Ben Greear <greearb@candelatech.com>
>>
>> I put a v1 NIC from an TP-LINK AC 1750 AP in
>> a 64-bit PC, and the OS crashes on bootup.  I'm not
>> sure how broken my hardware is (possibly completely non
>> functional), but at least with this patch it will no longer
>> crash the OS.  Not sure it ever got far enough to try,
>> but I also do not have firmware for the NIC.
>>
>> With this patch I get this info on module load:
>>
>> ath10k_pci 0000:05:00.0: BAR 0: assigned [mem 0xf4400000-0xf45fffff 64bit]
>> ath10k_pci 0000:05:00.0: BAR 0: error updating (0xf4400004 != 0xffffffff)
>> ath10k_pci 0000:05:00.0: BAR 0: error updating (high 0x000000 != 0xffffffff)
>> ath10k_pci 0000:05:00.0: Refused to change power state, currently in D3
>> ath10k: MSI-X interrupt handling (8 intrs)
>> ath10k: Unable to wakeup target
>> ath10k: target takes too long to wake up (awake count 1)
>> ath10k: src_ring ffff88020c0d0a00:  write_index is out of bounds: 4294967295  nentries_mask: 15.
>> ath10k: dest_ring ffff88020db2c000:  write_index is out of bounds: 4294967295  nentries_mask: 511.
>> ath10k: dest_ring ffff880210d56400:  write_index is out of bounds: 4294967295  nentries_mask: 31.
>> ath10k: src_ring ffff880210d57600:  write_index is out of bounds: 4294967295  nentries_mask: 31.
>> ath10k: src_ring ffff88020fe70000:  write_index is out of bounds: 4294967295  nentries_mask: 2047.
>> ath10k: src_ring ffff880212989b40:  write_index is out of bounds: 4294967295  nentries_mask: 1.
>> ath10k: dest_ring ffff880212989960:  write_index is out of bounds: 4294967295  nentries_mask: 1.
>> ath10k: Failed to get pcie state addr: -5
>> ath10k: early firmware event indicated
>> ------------[ cut here ]------------
>> WARNING: at /home/greearb/git/linux.wireless-testing/drivers/net/wireless/ath/ath10k/ce.c:771 ath10k_ce_per_engine_service+0x53/0x1b4 [ath10k_pci]()
>> ....
>> (it hits the warning case about 5-6 times and then seems to quiesce OK).
>
> I haven't seen this myself so it might be a hw problem, but difficult to
> say.
>
>> +	/* On v1 hardware at least, setup can fail, causing ce_id_state to
>> +	 * be cleaned up, but this method is still called a few times.  Check
>> +	 * for NULL here so we don't crash.  Probably a better fix is to stop
>> +	 * the ath10k_pci_ce_tasklet sooner.
>> +	 */
>> +	if (WARN_ONCE(!ce_state, "ce_id_to_state[%i] is NULL\n", ce_id))
>> +		return;
>> +
>> +	ctrl_addr = ce_state->ctrl_addr;
>> +
>
> The tests you add look like workarounds. I would prefer to try fix these
> by going to the source of the problem. Maybe we should add
> ath10k_pci_wake() and ath10k_do_pci_wake()?

These are work-arounds, but you should not let a bad piece of hardware/firmware crash
the entire OS just because you don't want to do sanity checking on the
values you get from the firmware.  Perhaps there is a better fix for the
code above, but the warning splat should still provide incentive to get
it right, while not crashing the OS in the meantime.


> Can you enable few debug logs, like ATH10K_DBG_PCI, and post them? That
> would give more hint there things are going wrong.


Yes, I can do that.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
