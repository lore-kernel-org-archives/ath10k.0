Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nm.newmedia-net.de ([217.113.179.122]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yx2PB-0000hI-Qk
 for ath10k@lists.infradead.org; Tue, 26 May 2015 00:07:38 +0000
References: <1431434736-7077-1-git-send-email-michal.kazior@tieto.com>
 <CA+BoTQ=dzJS447Gx+XAXPT6gZDDKZ__6scbxe0QC-iMA47bZmQ@mail.gmail.com>
 <874mn68jl7.fsf@kamboji.qca.qualcomm.com>
 <87oal83kv4.fsf@kamboji.qca.qualcomm.com> <5563577E.4020208@dd-wrt.com>
 <5563584A.80604@candelatech.com> <55636088.1080506@dd-wrt.com>
 <55636198.8020802@candelatech.com> <55637637.8020103@dd-wrt.com>
 <556378E3.7050707@candelatech.com> <55639395.6070207@dd-wrt.com>
 <5563A491.8070701@candelatech.com> <5563A990.5000606@dd-wrt.com>
 <5563B357.9060309@candelatech.com>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <5563B934.5050306@dd-wrt.com>
Date: Tue, 26 May 2015 02:07:16 +0200
MIME-Version: 1.0
In-Reply-To: <5563B357.9060309@candelatech.com>
Subject: Re: possible memory leak or memory waste
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
To: Ben Greear <greearb@candelatech.com>, ath10k@lists.infradead.org

Am 26.05.2015 um 01:42 schrieb Ben Greear:
> Can you test with ath9k to make sure it is actually ath10k related?
already tested. this device has 2 chipsets. one is ath9k based and the 
second is ath10k based. :-)
only if i kill the hostapd process which controls ath10k. the memory 
waste is gone
>
> And/or try traffic in RX direction only to see if that still uses
> lots of memory?

>
> Does memory come back after you just stop traffic (w/out stopping
> hostapd)?
yes. slowly. its fluctuating. so sometimes there is 30 mb free again and 
seconds later just 2 mb. so very heavy changes. on bigger routers with 
more than 64 mb (i have a second here with 128 mb)
the total consumption stabilizes at 45 - 50 mb for the driver only which 
is still too much for sure.  so it may not a leak. but ath10k or the 
firmware is wasting too much memory for embedded devices
and ar9880 is just used on embedded devices almost
>
> Thanks,
> Ben
>
>
> On 05/25/2015 04:00 PM, Sebastian Gottschall wrote:
>> Am 26.05.2015 um 00:39 schrieb Ben Greear:
>>> Default firmware has a hard-coded minimum number of tx buffers 
>>> (somewhere
>>> more than 1k buffers I think).  Maybe driver is allocating all this
>>> memory somehow?
>>>
>>> If you do one-way traffic tests (udp), I wonder if you can tell if 
>>> it is tx
>>> or rx that consumes the memory?
>> its tx. i have a ethernet over ip tunnel running on that link and i 
>> broadcast iptv in that way. (its my way to convert multicast to unicast)
>> the  tunnel itself is rfc ethernet over ip, which is somewhat like 
>> udp. so connectionless protocol
>>
>> Sebastian
>>>
>>> CT firmware can be configured to use any multiple-of-8 amount of tx
>>> buffers, though I have not tested below around 600.
>>>
>>> Thanks,
>>> Ben
>>>
>>> On 05/25/2015 02:26 PM, Sebastian Gottschall wrote:
>>>> today using the latest testing driver, i found out the memory 
>>>> consumption is unbelievable high.
>>>> my router here has 64 mb ram. this ram is fully taken after some 
>>>> minutes by ath10k. but only if data flow present.
>>>>
>>>> here the results of "free" after some minutes
>>>> root@DD-WRT:~# free
>>>> total         used         free       shared      buffers
>>>> Mem:         61636        58752         2884            0 2600
>>>> -/+ buffers:              56152         5484
>>>> Swap:            0            0            0
>>>>
>>>>
>>>> now i terminate hostapd which controls the ath10k chipset
>>>>
>>>>
>>>> root@DD-WRT:~# kill 902
>>>> root@DD-WRT:~# free
>>>> total         used         free       shared      buffers
>>>> Mem:         61636        23212        38424            0 2416
>>>> -/+ buffers:              20796        40840
>>>> Swap:            0            0            0
>>>>
>>>>
>>>> you see the difference?
>>>>
>>>>
>>>> regards,
>>>> Sebastian Gottschall
>>>>
>>>> _______________________________________________
>>>> ath10k mailing list
>>>> ath10k@lists.infradead.org
>>>> http://lists.infradead.org/mailman/listinfo/ath10k
>>>>
>>>
>>
>


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
