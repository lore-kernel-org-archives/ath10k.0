Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mx2.compex.com.sg ([116.12.130.103] helo=compex.com.sg)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cd9py-00029E-J8
 for ath10k@lists.infradead.org; Mon, 13 Feb 2017 06:10:19 +0000
Message-ID: <3C9391D91DC743D5B62BD959FF8251FF@PhyuThe>
From: "Phyu The" <pt_myat@compex.com.sg>
References: <20170110061217.096FD148A08@compex.com.sg>
 <63DDC83FD9364560ACBA60D17C3F5AD8@PhyuThe> <5874F1BC.80505@candelatech.com>
 <10981E9AB9EA46A1897BE3E5CF661C0F@PhyuThe>
 <f3ed8528-a9ab-fa33-e753-aa1fbebc969e@candelatech.com>
 <F468EA06CC7341849F013B51FFCC88E2@PhyuThe>
 <65c12489-6886-22c2-894b-cf0eab2bd51a@dd-wrt.com>
 <2f0e0277-b7fc-ccf6-1d23-1d9e8f9a8d4e@candelatech.com>
 <225C5D2515A949BABED9735260C92D73@PhyuThe>
 <935c16bb-518d-38ee-5713-531565333654@candelatech.com>
 <484EAAF01F5144198D128154D8FD85CA@PhyuThe>
 <6625357a-f466-e18c-6a3d-22ff2e0898ce@candelatech.com>
In-Reply-To: <6625357a-f466-e18c-6a3d-22ff2e0898ce@candelatech.com>
Subject: Re: QCA9880 3x3 80Mhz low performance
Date: Mon, 13 Feb 2017 14:09:46 +0800
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="----=_NextPart_000_212D_01D28602.D4A4C370"
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Sebastian Gottschall <s.gottschall@dd-wrt.com>, ath10k@lists.infradead.org, Ben Greear <greearb@candelatech.com>

This is a multi-part message in MIME format.

------=_NextPart_000_212D_01D28602.D4A4C370
Content-Type: text/plain;
	format=flowed;
	charset="iso-8859-1";
	reply-type=response
Content-Transfer-Encoding: 7bit

Dear Ben,

Kindly see attached that I run with Ixchariot used exact same configuration 
and set up environment.

thanks,
Phyuthe

-----Original Message----- 
From: Ben Greear
Sent: Monday, February 13, 2017 1:13 PM
To: Phyu The ; Sebastian Gottschall ; ath10k@lists.infradead.org
Subject: Re: QCA9880 3x3 80Mhz low performance

I would try to narrow down where the performance issue happens.

So, for instance, could you run the exact same ath10k firmware (and 
board.bin, etc) that you are using
in LEDE with the QCA driver?  That would determine if it is firmware related 
or not.

Can you compile just the QCA driver into LEDE to see if that makes a 
difference?

You are using the exact same networking setup in all cases?

Thanks,
Ben

On 02/12/2017 07:42 PM, Phyu The wrote:
> Dear Ben,
>
> I tested same set up with QCA driver, I can achieve 984Mbps. With Ath10k 
> driver, throughput stuck at 640Mpbs. Can you give me any suggestion?
>
> thanks,
> Phyuthe
>
> -----Original Message----- From: Ben Greear
> Sent: Saturday, February 11, 2017 12:14 AM
> To: Phyu The ; Sebastian Gottschall ; ath10k@lists.infradead.org
> Subject: Re: QCA9880 3x3 80Mhz low performance
>
> I don't know.  I would first suggest that you try an x86 platform with
> powerful CPU in your own test environment.  Possibly we are just using
> a better isolation chamber or have some other advantage in our environment
> or test setup.
>
> If you can reproduce our good results with x86 in your setup, then you can
> be more sure it is something to do with your particular platform.
>
> Thanks,
> Ben
>
> On 02/09/2017 11:11 PM, Phyu The wrote:
>> Dear Ben,
>>
>> According to your test result of QCA9880 3x3, what could be the low 
>> performance issue at my side IPQ8064+QCA9880 with Ath10k? Is it really 
>> CPU related problem
>> on WPQ864?
>>
>> thanks,
>> Phyuthe
>>
>> -----Original Message----- From: Ben Greear
>> Sent: Saturday, January 21, 2017 4:24 AM
>> To: Sebastian Gottschall ; Phyu The ; ath10k@lists.infradead.org
>> Subject: Re: QCA9880 3x3 80Mhz low performance
>>
>> Hello!
>>
>> We ran some more tests using our x86 based platforms with 9880 NICs and 
>> 9984 NICs
>> acting as both AP and Station.  This is in an isolation chamber, wired up 
>> with SMA cables
>> and variable attenuator, in as perfect of a condition as we can manage.
>>
>> First, here is LANforge acting as AP and station devices, using QCA9880 
>> 3x3 hardware:
>>
>> http://www.candelatech.com/images/data-comp-01-13-2017-144224-lf-ap.png
>>
>> And with 9984 systems:
>>
>> http://www.candelatech.com/images/data-comp-01-19-2017-1706-lf-ap-sta-9984.png
>>
>> In case you read closely and wonder, 'Armageddon' is our modified version 
>> of pktgen.
>>
>> Thanks,
>> Ben
>>
>>
>> On 01/12/2017 01:24 AM, Sebastian Gottschall wrote:
>>> @ben greear. it cannot be cpu related. the ipq8064 has 1.2 ghz and is a 
>>> very fast arm core. the platform handles 9984 with much higher speed.
>>> i got notice of the same issue reported by people on various cpu 
>>> platforms.
>>>
>>> Am 12.01.2017 um 09:15 schrieb Phyu The:
>>>> Dear Ben,
>>>>
>>>> Thanks for your reply and suggestion.
>>>>
>>>> I have tried as your suggestion to test IPQ8064+QCA9880 with Ath10k CT 
>>>> firmware/driver to run throughput UDP/TCP. Unfortunately, I could not 
>>>> be able to see
>>>> throughput improvement. Could you please suggest what may cause low 
>>>> throughput?
>>>>
>>>> thanks,
>>>> Phyuthe
>>>>
>>>> -----Original Message----- From: Ben Greear
>>>> Sent: Thursday, January 12, 2017 12:59 AM
>>>> To: Phyu The ; ath10k@lists.infradead.org
>>>> Subject: Re: QCA9880 3x3 80Mhz low performance
>>>>
>>>> We have not done a lot of testing in AP mode, but when using 9880 3x3 
>>>> compex NICs
>>>> in our 2U rackmounts (high end Intel E5 processors), and with CT 
>>>> firmware/drivers,
>>>> we see near 950Mbps UDP download in station mode.  I think we were a 
>>>> bit slower in
>>>> AP mode, but not that much.
>>>>
>>>> Are you testing TCP or UDP traffic?
>>>>
>>>> http://www.candelatech.com/images/data-comp-07-20-2016-1147-with-labels.png
>>>>
>>>> Have you tried normal STA/AP mode instead of WDS?
>>>>
>>>> Maybe you are CPU bound on your platform?
>>>>
>>>> Thanks,
>>>> Ben
>>>>
>>>> On 01/10/2017 05:09 PM, Phyu The wrote:
>>>>> Dear Ben,
>>>>>
>>>>> I configured AP_WDS and Sta_WDS mode, channel 149, 11ac, 3x3, 80MHz 
>>>>> and without encryption. I used 2 RF boxes with 3 adjustable 
>>>>> attenuators running throughput
>>>>> by Ixchairot to get best performance. However, throughput seems 
>>>>> limited to 640Mbps. Kindly see attached for your reference for more 
>>>>> details.
>>>>>
>>>>> thanks,
>>>>> Phyuthe
>>>>>
>>>>> -----Original Message----- From: Ben Greear
>>>>> Sent: Tuesday, January 10, 2017 10:37 PM
>>>>> To: Phyu The ; ath10k@lists.infradead.org
>>>>> Subject: Re: QCA9880 3x3 80Mhz low performance
>>>>>
>>>>> You should provide a lot more information about how you configured and 
>>>>> tested the system,
>>>>> including traffic generator and RF environment, etc.
>>>>>
>>>>> Thanks,
>>>>> Ben
>>>>>
>>>>> On 01/09/2017 10:19 PM, Phyu The wrote:
>>>>>> Dear Sir,
>>>>>>
>>>>>> I tested performance throughput test used WPQ864 + QCA9880 11ac 80MHz 
>>>>>> is 640Mbps that is very low since theoretical data rate is 1300Mbps. 
>>>>>> It should be at
>>>>>> least 866Mbps. Could you please suggest me how to get better 
>>>>>> performance?
>>>>>>
>>>>>> thanks,
>>>>>> Phyuthe
>>>>>>
>>>>>> _______________________________________________
>>>>>> ath10k mailing list
>>>>>> ath10k@lists.infradead.org
>>>>>> http://lists.infradead.org/mailman/listinfo/ath10k
>>>>>>
>>>>>
>>>>
>>>>
>>>
>>>
>>
>>
>
>

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k 

------=_NextPart_000_212D_01D28602.D4A4C370
Content-Type: image/png;
	name="throughput result table.png"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="throughput result table.png"

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

------=_NextPart_000_212D_01D28602.D4A4C370
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

------=_NextPart_000_212D_01D28602.D4A4C370--
