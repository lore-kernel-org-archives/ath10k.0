Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XYzkE-0000oG-66
 for ath10k@lists.infradead.org; Tue, 30 Sep 2014 15:53:42 +0000
Message-ID: <542AD1F0.8070308@candelatech.com>
Date: Tue, 30 Sep 2014 08:53:20 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH v2 07/10] ath10k: add fw-powerup-fail to ethtool stats.
References: <1411507045-18973-1-git-send-email-greearb@candelatech.com>
 <1411507045-18973-7-git-send-email-greearb@candelatech.com>
 <87a95i3kcb.fsf@kamboji.qca.qualcomm.com> <5429833C.60003@candelatech.com>
 <CA+BoTQ=NG9to+Tv4Ci+Vu_dOGRgGVzxJUyb1bydWCc-EeWc_9g@mail.gmail.com>
In-Reply-To: <CA+BoTQ=NG9to+Tv4Ci+Vu_dOGRgGVzxJUyb1bydWCc-EeWc_9g@mail.gmail.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 09/30/2014 05:27 AM, Michal Kazior wrote:
> On 29 September 2014 18:05, Ben Greear <greearb@candelatech.com> wrote:
>> On 09/29/2014 01:24 AM, Kalle Valo wrote:
>>> greearb@candelatech.com writes:
>>>
>>>> From: Ben Greear <greearb@candelatech.com>
>>>>
>>>> This gives user-space a normal-ish way to detect that
>>>> firmware has failed to start and that a reboot is
>>>> probably required.
>>>>
>>>> Signed-off-by: Ben Greear <greearb@candelatech.com>
> [...]
>>>> -    return 0;
>>>> +out:
>>>> +    /* If we have failed to power-up, it may take a reboot to
>>>> +     * get the NIC back online.
>>>> +     * Set flag accordinly so that user-space can know.
>>>> +     */
>>>> +    ar->fw_powerup_failed = !!ret;
>>>> +    return ret;
>>>>  }
>>>
>>> Would it be better to use ATH10K_STATE_WEDGED for this and then just
>>> export the state value to user space? Or should we have two different
>>> states, like FW_WEDGED and HW_WEDGED?
> 
> Current WEDGED state is more like ON. It assumes mac80211 will call
> ath10k_stop().
> 
> Adding another state just for the sake of handling power up / reset
> issues seems like an overkill to me.
> 
> 
>> I didn't want to mess with the state machine.  This counter
>> is just a clue to users that things might be badly wrong.  Some systems
>> might recover with another hard reset, some will hang the entire
>> system hard, and some will just stick in this state unable to
>> recover.  Some of my systems exhibit this last behaviour, so at
>> least with this patch I can warn the user that they need to
>> reboot to regain wifi functionality.
> 
> If power up fails the error should propagate to `ifconfig wlanX up`
> (or whatever calling drv_start) eventually so I don't see the point in
> having this counter.

Supplicant manages this, and programatically it is not at all easy to
figure out that the network is failing to come up because the firmware
is broken-and-can't-be-fixed-without-reboot.

The counter I added can be queried by a management tool and propagate a
clear error to the end user.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
