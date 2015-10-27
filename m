Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zr6s2-00014i-5F
 for ath10k@lists.infradead.org; Tue, 27 Oct 2015 16:13:10 +0000
Subject: Re: Specific MAC address impact performance
References: <CAGJdtRAxPKvNZAZK=YMTGd0mJKP=e2gatyofPz-1KpPj_kU5Rw@mail.gmail.com>
 <562E42CB.4090809@candelatech.com>
 <CAGJdtRDAZzcJG1Cx7TTHL0iPa6GP1jq3eQNf9qTwhn=pnzKqMg@mail.gmail.com>
 <562E6727.3090504@candelatech.com>
 <CAGJdtRA7TRQ191U-U8z1K0rVRQQRAU6qBshVmhES--1kYGAayw@mail.gmail.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <562FA280.6060105@candelatech.com>
Date: Tue, 27 Oct 2015 09:12:48 -0700
MIME-Version: 1.0
In-Reply-To: <CAGJdtRA7TRQ191U-U8z1K0rVRQQRAU6qBshVmhES--1kYGAayw@mail.gmail.com>
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
To: Yu-Chieh <jay0607@gmail.com>
Cc: ath10k@lists.infradead.org

On 10/27/2015 08:51 AM, Yu-Chieh wrote:
> Hi Ben,
> i did some experiments today.
> 1. change the node C to AP mode (using same MAC),  performance of A to B is good
> 2. keep node C as adhoc mode but chaneg the cell-id and ssid.
> performance is deteriorated
> I am just wondering if any packet of adhoc mode(beacon? probe request?
> probe response) will screw up wifi network?

In general, I see lower throughput with IBSS.  Among other things,
it does not allow AMSDU in ath10k, apparently due to chipset bugs.

Aside from AMSDU, I'm not sure why else it might have issues.

Whenever you start talking performance (or specific bugs for that matter)
in ath10k, you should mention what firmware and driver you are using.

Thanks,
Ben


>
> Thanks,
> Jay
>
> 2015-10-27 1:47 GMT+08:00 Ben Greear <greearb@candelatech.com>:
>> On 10/26/2015 10:38 AM, Yu-Chieh wrote:
>>>
>>> Hi Ben,
>>> I also geuss that mignt be BSSID mask issue, however i have no idea
>>> about the patten
>>> I can find bssid_mask function in ath5k and ath9k but not in ath10k.
>>> Do your suggest me to use XX:XX:XX:YY:YY:XX, XX should be same and YY
>>> could be different?
>>
>>
>> Please try something that works properly with the way ath9k does it's
>> mask and see if that fixes your problem in ath10k.
>>
>> Basically, if your NIC has an address:  00 11 22 33 44 55, then change the
>> 33 and/or 44
>> octets when creating secondary vifs.  This assumes you buy your NICs in
>> batches and the
>> low octet is likely unique.
>>
>> As long as you have a unique octet among all of your radios in the local RF
>> environment, then you should be fine.
>>
>> Somewhere there was once a security related document on how to screw up
>> wifi networks by setting a mask to purposefully cause troubles....you might
>> try to find that and see if it provides some more precise details on
>> the masking algorithm.
>>
>> Thanks,
>> Ben
>>
>>>
>>> Thanks.
>>>
>>> Jay
>>>
>>> 2015-10-26 23:12 GMT+08:00 Ben Greear <greearb@candelatech.com>:
>>>>
>>>> Your probably have BSSID mask collision.  Rule of thumb is to leave
>>>> all octets the same except the second and third (from the right)
>>>> byte.  That usually gives you unique masks assuming the right-most
>>>> byte is unique for your radios.
>>>>
>>>> Thanks,
>>>> Ben
>>>>
>>>>
>>>>
>>>> On 10/26/2015 03:50 AM, Yu-Chieh wrote:
>>>>>
>>>>>
>>>>> Hi,
>>>>>
>>>>> I am working on IBSS mode by using ath10k. However i met some problem
>>>>> about the performance issue
>>>>> First of all, i set up two nodes, A (74:DA:38:19:19:DC) and B
>>>>> (74:DA:38:06:E1:96) and run iperf.
>>>>> i can get around 170 Mbps form A to B
>>>>>
>>>>> Then, i turn on the third node C(74:DA:38:06:E1:BE).
>>>>> The performance is deteriorated to around 30Mbps.
>>>>> If i turn off node C, the performance go back to 170 Mbps.
>>>>>
>>>>> At the same environment and same devices, i jsut change the mac of B
>>>>> to (74:DA:38:06:E1:B2)
>>>>> Everything is good.
>>>>> No matter node c is on or off, the performance always keep on 170Mbps.
>>>>>
>>>>> Anyone have any idea about this problem?
>>>>>
>>>>> Jay
>>>>>
>>>>> _______________________________________________
>>>>> ath10k mailing list
>>>>> ath10k@lists.infradead.org
>>>>> http://lists.infradead.org/mailman/listinfo/ath10k
>>>>>
>>>>
>>>> --
>>>> Ben Greear <greearb@candelatech.com>
>>>> Candela Technologies Inc  http://www.candelatech.com
>>>
>>>
>>
>>
>> --
>> Ben Greear <greearb@candelatech.com>
>> Candela Technologies Inc  http://www.candelatech.com
>>
>


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
