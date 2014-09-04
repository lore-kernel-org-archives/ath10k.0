Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XPXeb-0003Kn-Hm
 for ath10k@lists.infradead.org; Thu, 04 Sep 2014 14:04:50 +0000
Message-ID: <54087165.1090305@candelatech.com>
Date: Thu, 04 Sep 2014 07:04:21 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: WMI version handling
References: <1407261537-11308-1-git-send-email-greearb@candelatech.com>	<87zjehjkmg.fsf@kamboji.qca.qualcomm.com>	<54072D19.7010809@candelatech.com>
 <CA+BoTQkbLRpAvmjVEvjCqwTnk9XqFeWOxhr1cpQSuvtVm898tw@mail.gmail.com>
In-Reply-To: <CA+BoTQkbLRpAvmjVEvjCqwTnk9XqFeWOxhr1cpQSuvtVm898tw@mail.gmail.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>



On 09/03/2014 11:56 PM, Michal Kazior wrote:
> On 3 September 2014 17:00, Ben Greear <greearb@candelatech.com> wrote:
>> On 09/02/2014 11:14 PM, Kalle Valo wrote:
>>> Hi,
> [...]
>>> Also I have been thinking that using firmware feature bits (for example
>>> ATH10K_FW_FEATURE_WMI_10_2 and ATH10K_FW_FEATURE_WMI_10X) for WMI
>>> version is not the best way. I think it's easier to manage all this if
>>> we have a u32 FW IE to provide WMI version. IIRC Ben was suggesting this
>>> at some point.
>>>
>>> Example:
>>>
>>> enum ath10k_fw_wmi_version {
>>>        ATH10K_FW_WMI_VERSION_MAIN = 0,
>>>        ATH10K_FW_WMI_VERSION_10_1 = 1,
>>>        ATH10K_FW_WMI_VERSION_10_2 = 2,
>>> }
>>>
>>> And then wmi.c would set correct interface based on this version.
>>
>> I am happy with the current flags, it seems to work well enough.
>
> I'm actually okay with this but I'd actually throw out the "wmi"
> string from it and leave out just "ath10k_fw_version". I've recently
> discovered some minor HTT discrepancies between fw branches so we
> might want to use the version tag to pick HTT "backend" as well..
>
>
>> I'd leave policy out of the IEs as much as possible, as normal users
>> cannot modify it, and certainly it would be a problem if you wanted
>> different policy with different NICs in same system.
>> IEs should describe the minimum needed for the
>> ath10k to enforce policy as best as it can.  We have to assume that
>> users tweaking station and peer count can deal with fw crashes until
>> they get the settings right.
>>
>> My CT firmware will print out available RAM once booted, so it is
>> fairly easy to utilize maximum amount of resources with a bit of
>> trial and error.  It would be trivial to make upstream firmware do
>> the same, of course, but upstream firmware may crash for other
>> reasons as you change resource config...
>
> IOW You're okay if ath10k applies default/hardcoded configuration
> values of 10.1 for your firmware (as your firmware is going to
> advertise as a 10.1) - is that correct? You just want to be able to
> tune these values per-device in runtime. I think debugfs is the best
> candidate here then.
>
> ath10k would need to have a separate debugfs entry for that then, i.e.
> one that is independent from wiphy. You could have, e.g.
> /sys/kernel/debug/ath10k/pci/0000:04:00.0/num_peers which re-registers
> to mac80211 upon modification.

That would be fine for the number of stations and peers, but there are other
features more specific to my firmware that should be enabled by default
if my firmware is loaded.  These include better tx-status, for instance.
I figured might as well also auto-tune the stations higher at the same time.

Also, some of the logic that auto-calculates skid-len, for instance, really
should be done for all firmware that can handle it to protect against malicious
hashing attacks.


>>> We would still use feature bits to enable and disable smaller changes
>>> like ATH10K_FW_FEATURE_HAS_WMI_MGMT_TX does. But for bigger WMI changes
>>> we would change the WMI version, for example if we have a new firmware
>>> branch with significant changes or similar.
>>>
>>> And for backwards comptability we need to do so that
>>> ATH10K_FW_FEATURE_WMI_10X sets ATH10K_FW_WMI_VERSION_10_1 and
>>> ATH10K_FW_FEATURE_WMI_10_2 sets ATH10K_FW_WMI_VERSION_10_2.
>>
>> I was able to do all of my changes w/out needing new a new WMI version,
>> and I think that is the right approach.  I do not like large amounts of
>> duplicated code and table lookups, which is what new WMI versions appear
>> to imply.
>
> It's actually really simple to update WMI in an ABI-safe way.
> Unfortunately official firmware updates break it fairly often and we
> have to deal with that. Aaand there's going to be another WMI backend
> soon most likely.
>
>
> [...]
>> If QCA goes to more of a rolling release for firmware, like I do for CT
>> firmware, then we may want to add IEs a bit more often, to notify things like
>> "can-support-feature-foo".  10.2 v/s 10.1 can still determine the
>> over-all WMI api, perhaps, but at specific points we can take advantage of
>> specific firmware features based on IE flag.
>
> This is what WMI bitmap service is actually for. ath10k is ignoring
> this now and exposes it via debugfs only. It's possible to, e.g. pick
> "max num of stations" configuration values based on the "iram tids"
> being set or not.

I guess I haven't looked into WMI bitmap, but I was hoping for minimal
code changes when adding my firmware, and I want to keep my firmware
backwards compat with existing kernels.  With regard to max-num-of-stations,
I don't think you will will be able to reliably calculate the exact resource
limits combinations from ath10k driver.
Every configurable (peers, tx-buffers, stations, skid-limit, etc)
affects RAM and/or IRAM and there are various
upper limits on various items in the firmware that may only be hit at
unlucky times during runtime.

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
