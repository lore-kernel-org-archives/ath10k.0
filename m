Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XPvj4-0005d2-5K
 for ath10k@lists.infradead.org; Fri, 05 Sep 2014 15:47:02 +0000
Message-ID: <5409DADD.1050001@candelatech.com>
Date: Fri, 05 Sep 2014 08:46:37 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: WMI version handling
References: <1407261537-11308-1-git-send-email-greearb@candelatech.com>
 <87zjehjkmg.fsf@kamboji.qca.qualcomm.com> <54072D19.7010809@candelatech.com>
 <871trqgq0z.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <871trqgq0z.fsf@kamboji.qca.qualcomm.com>
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
Cc: ath10k@lists.infradead.org



On 09/05/2014 06:23 AM, Kalle Valo wrote:
> Ben Greear <greearb@candelatech.com> writes:
>
>>> Also I have been thinking that using firmware feature bits (for example
>>> ATH10K_FW_FEATURE_WMI_10_2 and ATH10K_FW_FEATURE_WMI_10X) for WMI
>>> version is not the best way. I think it's easier to manage all this if
>>> we have a u32 FW IE to provide WMI version. IIRC Ben was suggesting this
>>> at some point.
>>>
>>> Example:
>>>
>>> enum ath10k_fw_wmi_version {
>>> 	ATH10K_FW_WMI_VERSION_MAIN = 0,
>>> 	ATH10K_FW_WMI_VERSION_10_1 = 1,
>>> 	ATH10K_FW_WMI_VERSION_10_2 = 2,
>>> }
>>>
>>> And then wmi.c would set correct interface based on this version.
>>
>> I am happy with the current flags, it seems to work well enough.
>
> Yeah, there's no problem at the moment. But if we start adding more
> interfaces handling them through feature flags will become more
> difficult. That's why I think adding a separate enum will be better in
> the long run.

Worry about the long run when it gets here.  Prematurely engineering for
possible scenarios just wastes time.  We can always go back and
reorganize code later as the re-use patterns become more clear.

>> I'd leave policy out of the IEs as much as possible, as normal users
>> cannot modify it, and certainly it would be a problem if you wanted
>> different policy with different NICs in same system. IEs should
>> describe the minimum needed for the ath10k to enforce policy as best
>> as it can.
>
> The firmware IEs are not about policy. They are about advertising the
> capabilities of the firmware image so that ath10k can know how to
> configure the firmare.

More stations means less peers, less tx-buffers means more of other things.
Disabling some firmware offload features frees ram for other things.
RAM usage per item increment is not even linear in some cases, and you
would have to have intimate knowledge of the firmware to understand the
limits.

Firmware can only tell you the maximum stations it can support, but if
you configure too many peers or too many tx-buffers, or enable roaming
offload, you would have to decrease the number of stations actually allocated.

Some users may want lots of stations, others lots of peers, other less tx-buffers,
and others more.  Some might want to ensure skid-length handles worst-case
scenarios at cost of fewer peers or stations.

>> We have to assume that users tweaking station and peer count can deal
>> with fw crashes until they get the settings right.
>
> No way. In no circumstances ath10k should configure firmware out of
> bounds. If we do that, it's a bug in ath10k.

You are either going to have to fix firmware, cripple your driver, or
accept some risk and let users configure settings that work best for them
if they care to.  Make sure the driver defaults work and do not crash,
but don't be so conservative that you decrease usability for those that
actually care to tinker.

If you are not swayed by my arguments, then just go ahead and implement
it how you want and I will attempt to make my patches work with your
methods.  I am frustrated with endless discussions and no upstream
patches.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
