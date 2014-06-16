Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WwYI3-00014n-VW
 for ath10k@lists.infradead.org; Mon, 16 Jun 2014 14:53:44 +0000
Message-ID: <539F04E2.9090807@candelatech.com>
Date: Mon, 16 Jun 2014 07:53:22 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: fetching calibration data from flash
References: <5396B9F9.2070107@stackframe.org>
 <5396C39A.9080402@elisanet.fi>	<87wqcpb0w1.fsf@kamboji.qca.qualcomm.com>	<5396C8EC.4090105@elisanet.fi>	<87sindb0gj.fsf@kamboji.qca.qualcomm.com>	<53972A91.1080600@candelatech.com>	<87egyvalj0.fsf@kamboji.qca.qualcomm.com>	<53985C61.5000201@candelatech.com>
 <87ioo111pr.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87ioo111pr.fsf@kamboji.qca.qualcomm.com>
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
Cc: ath10k@lists.infradead.org, Matti Laakso <malaakso@elisanet.fi>



On 06/16/2014 05:24 AM, Kalle Valo wrote:
> Ben Greear <greearb@candelatech.com> writes:
>
>> On 06/11/2014 01:38 AM, Kalle Valo wrote:
>>> Ben Greear <greearb@candelatech.com> writes:
>>>
>>>> Another nice feature would be to allow configuring the number of
>>>> vdevs, peers, etc per NIC.  That way, you could have one NIC
>>>> tuned to be one big AP with lots of peers, and a second could
>>>> be several small APs with fewer peers and some stations, etc.
>>>>
>>>> Maybe this could be a separate file, or maybe it would be worth
>>>> adding this to a TLV type file with cal.bin being part of the
>>>> data?
>>>
>>> So basically you want a configuration (".ini") file for ath10k, right? I
>>> have seen those in out-of-tree drivers, but not in upstream drivers.
>>>
>>> If I'm guessing right what these configuration items would do in ath10k,
>>> I think instead of static configuration it would be much more flexible
>>> to have this stuff configurable dynamically. But how, that's the
>>> question. A sysfs file to set different profiles (or modes) was the
>>> first one which came to my mind, but that's ugly.
>>
>> You also need this info before you do the initial firmware configuration,
>> otherwise you are going to have to restart firmware again later to apply
>> the new config (and advertise different interface combinations up the
>> stack, etc).
>
> Ok.
>
>> Maybe a kernel module option to point to a file-name would work
>> (with some way to give different options to different nics in the
>> same system).
>
> Over years I have seen these .ini suggestions few times and I never have
> been very fund of the idea. For example, that would mean yet another
> layer of configuration and more things to support. I would prefer to
> find a more automatic way of doing the same.
>
> And I'm not sure if kernel maintainers would even accept this.

I think you could do a decent job of inferring most values with
a single module-param that requests the number of vdevs to support.
This is more of a hack though, and will not satisfy all needs I
think.

I also think that we will want to be able to configure firmware on
a per-nic basis instead of per-machine.  If we did that, we could poke
any special config into the firmware images using the existing meta-data
api.  Should be easy enough to write a small program that prepended
the config to a generic firmware..then those that care can create their
own customized firmware images quickly and easily.

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
