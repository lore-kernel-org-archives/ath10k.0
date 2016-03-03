Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85 #2 (Red Hat Linux))
 id 1abXDG-0003p0-NW
 for ath10k@lists.infradead.org; Thu, 03 Mar 2016 17:38:59 +0000
Subject: Re: Per radio configuration
References: <56B3BCF0.7070408@candelatech.com>
 <877fhj3774.fsf@kamboji.qca.qualcomm.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <56D8694D.9040502@candelatech.com>
Date: Thu, 3 Mar 2016 08:41:49 -0800
MIME-Version: 1.0
In-Reply-To: <877fhj3774.fsf@kamboji.qca.qualcomm.com>
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
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: ath10k <ath10k@lists.infradead.org>

On 03/03/2016 07:35 AM, Valo, Kalle wrote:
> Ben Greear <greearb@candelatech.com> writes:
>
>> Hello!
>>
>> I'm considering a case where I have multiple ath10k NICs in
>> a system, possibly not all the same chipset.
>>
>> I may want to have one optimized for smaller number of vdevs and more
>> peers, and another many vdevs, fewer peers, etc.  Some chipsets
>>
>> Module options are not optimal for this since there is no easy way to
>> have different options for different NICs.
>>
>> I'm thinking about making a loadable 'firmware' file that has
>> text-based config, something like:
>>
>> # First radio
>> Device=05:00.0
>> 	vdev_count=8
>> 	peer_count=128
>>          firmware_name=firmware-5-b.bin
>> 	firmware_ver=5
>>
>> # Second radio
>> Device=06:00.0
>> 	vdev_count=4
>> 	peer_count=200
>>          firmware_name=firmware-2.bin
>> 	firmware_ver=2
>>
>> # End of file
>
> Ok, so basically an .ini file for the driver.
>
>> When parsing, Lines starting with # would be ignored.
>> Any un-known tokens would be ignored, for backwards/forwards compatibility.
>>
>> This file would be loaded and parsed before loading other firmware
>> images so that we can use particular firmware images per radio. This
>> further lets one optimize one radio for one thing, one for another.
>> For instance, if someone requires IBSS and wants to use stock QCA
>> firmware, they can use the 'main' firmware for that radio, and the
>> most recent one for another radio that needs to be a stable AP.
>>
>> In addition to this, we would need to store the vdev combinations
>> in RAM in the 'ar' struct, so we could get rid of all of the static,
>> hard-coded members and set the capabilities to match the requested
>> values.
>>
>> Any opinions on this?  Something that might be worthwhile for upstream?
>
> I have seen lots of out-of-tree drivers having something like this but I
> doubt that something like this would be acceptable in upstream. Anyway
> this is something which should be discussed in linux-wireless with a
> wider audience, maybe even in lkml.

You are the maintainer, so, do *you* like the idea?  If you don't, then
there is no use in me putting more effort into it for upstream use.

If you do, then I will work on cleaning up a patch for upstream and post
it to a wider audience.

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
