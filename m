Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XYdSD-0002DG-9l
 for ath10k@lists.infradead.org; Mon, 29 Sep 2014 16:05:37 +0000
Message-ID: <5429833C.60003@candelatech.com>
Date: Mon, 29 Sep 2014 09:05:16 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH v2 07/10] ath10k: add fw-powerup-fail to ethtool stats.
References: <1411507045-18973-1-git-send-email-greearb@candelatech.com>
 <1411507045-18973-7-git-send-email-greearb@candelatech.com>
 <87a95i3kcb.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87a95i3kcb.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 09/29/2014 01:24 AM, Kalle Valo wrote:
> greearb@candelatech.com writes:
> 
>> From: Ben Greear <greearb@candelatech.com>
>>
>> This gives user-space a normal-ish way to detect that
>> firmware has failed to start and that a reboot is
>> probably required.
>>
>> Signed-off-by: Ben Greear <greearb@candelatech.com>
> 
> [...]
> 
>> --- a/drivers/net/wireless/ath/ath10k/pci.c
>> +++ b/drivers/net/wireless/ath/ath10k/pci.c
>> @@ -1851,7 +1851,7 @@ static int ath10k_pci_hif_power_up(struct ath10k *ar)
>>  			    ret);
>>  
>>  		if (ath10k_pci_reset_mode == ATH10K_PCI_RESET_WARM_ONLY)
>> -			return ret;
>> +			goto out;
>>  
>>  		ath10k_warn(ar, "trying cold reset\n");
>>  
>> @@ -1859,11 +1859,17 @@ static int ath10k_pci_hif_power_up(struct ath10k *ar)
>>  		if (ret) {
>>  			ath10k_err(ar, "failed to power up target using cold reset too (%d)\n",
>>  				   ret);
>> -			return ret;
>> +			goto out;
>>  		}
>>  	}
>>  
>> -	return 0;
>> +out:
>> +	/* If we have failed to power-up, it may take a reboot to
>> +	 * get the NIC back online.
>> +	 * Set flag accordinly so that user-space can know.
>> +	 */
>> +	ar->fw_powerup_failed = !!ret;
>> +	return ret;
>>  }
> 
> Would it be better to use ATH10K_STATE_WEDGED for this and then just
> export the state value to user space? Or should we have two different
> states, like FW_WEDGED and HW_WEDGED?

I didn't want to mess with the state machine.  This counter
is just a clue to users that things might be badly wrong.  Some systems
might recover with another hard reset, some will hang the entire
system hard, and some will just stick in this state unable to
recover.  Some of my systems exhibit this last behaviour, so at
least with this patch I can warn the user that they need to
reboot to regain wifi functionality.

If you want to tie it to a state machine, that is OK with me, but
I don't want to mess with it because that code is already tricky
enough.

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
