Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1byr0d-0001LQ-T1
 for ath10k@lists.infradead.org; Tue, 25 Oct 2016 01:58:37 +0000
Message-ID: <580EBC1F.7020305@candelatech.com>
Date: Mon, 24 Oct 2016 18:57:51 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Direct firmware load failed with error 2
References: <1477338959.93584918@apps.rackspace.com>
 <8642a7dd-3612-ce8b-8c08-f4bd8f746764@candelatech.com>
 <1477342762.945417468@apps.rackspace.com>
 <1d445cc5-1180-9d6f-9a52-d999096a8932@candelatech.com>
 <1477351326.570412506@apps.rackspace.com>
In-Reply-To: <1477351326.570412506@apps.rackspace.com>
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
To: cmckay@abineau.com
Cc: ath10k@lists.infradead.org

Please let us know 'lspci' or equiv, exactly what firmware you are loading,
kernel driver version, etc.

Maybe try LEDE if you can, it's likely more up to date.

Thanks,
Ben

On 10/24/2016 04:22 PM, cmckay@abineau.com wrote:
> Great, thanks Ben,
>
> That cleared up the firmware load error but I now have:
>
> [    6.997553] ath10k_pci 0000:01:00.0: BAR 0: assigned [mem 0x01000000-0x011ff]
> [    7.075559] ath10k: pci irq MSI
> [    9.753487] ath10k: ctl_resp never came in (-110)
> [    9.758281] ath10k: failed to connect to HTC: -110
> [    9.803633] ath10k: could not init core (-110)
> [    9.843495] ath10k: could not probe fw (-110)
> [    9.843499] ath10k: failed to register driver core: -110
> [    9.843681] ath10k_pci: probe of 0000:01:00.0 failed with error -110
>
> Any ideas? Let me know if I should post this new.
>
> Thanks a bunch
> Colin
>
>
> -----Original Message-----
> From: "Ben Greear" <greearb@candelatech.com>
> Sent: Monday, October 24, 2016 5:05pm
> To: cmckay@abineau.com
> Cc: ath10k@lists.infradead.org
> Subject: Re: Direct firmware load failed with error 2
>
> You need board.bin too.  Something like this if you want to
> use my firmware, or firmware-5.bin for upstream 10.2 firmware:
>
> [root@ben-ota-1 lanforge]# ls -l /lib/firmware/ath10k/QCA988X/hw2.0/
> total 1084
> -rw-r--r--. 1 root root   2116 Sep 27 14:43 board.bin
> -rw-r--r--. 1 root root 201324 Oct 13 18:48 firmware-2.bin
>
> Thanks,
> Ben
>
>
> On 10/24/2016 01:59 PM, cmckay@abineau.com wrote:
>> Thanks Ben,
>>
>> Got the location from the website:
>> root@apalis-imx6:/lib/firmware/ath10k/QCA988X/hw2.0# ls
>> firmware-2.bin         firmware-5.bin
>>
>> I'll figure out how to do some printk's (I'm a newbie).
>>
>> Thanks,
>> Colin
>>
>>
>> -----Original Message-----
>> From: "Ben Greear" <greearb@candelatech.com>
>> Sent: Monday, October 24, 2016 4:11pm
>> To: cmckay@abineau.com, ath10k@lists.infradead.org
>> Subject: Re: Direct firmware load failed with error 2
>>
>> Maybe add some printks in your driver to see exactly what it is trying to load?
>>
>> Maybe firmware is in wrong location?
>>
>> errno 2 == ENOENT, which probably means something like 'could not find file'.
>>
>> Thanks,
>> Ben
>>
>>
>> On 10/24/2016 12:55 PM, cmckay@abineau.com wrote:
>>> Hi,
>>>
>>> I'm attempting to add a Silex PCEAC or Compex WLE900VX (both QCA9880) mini PCIe card to a Toradex Apalis iMX6 SOM on their Ixora card. I added a BSP layer to Toradex's standard build, simply adding the ath10k and noting more.
>>> I keep running into the following error:
>>>
>>> [ 7.063663] ath10k_pci 0000:01:00.0: BAR 0: assigned [mem 0x01000000-0x011ff]
>>> [ 7.172118] ath10k: pci irq MSI
>>> [ 7.198024] ath10k_pci 0000:01:00.0: Direct firmware load failed with error 2
>>> [ 7.209646] ath10k_pci 0000:01:00.0: Falling back to user helper
>>> [ 8.626488] ath10k: could not fetch board data (-2)
>>> [ 8.648471] ath10k_pci 0000:01:00.0: Direct firmware load failed with error 2
>>> [ 8.693701] ath10k_pci 0000:01:00.0: Falling back to user helper
>>> [ 8.712302] ath10k: could not fetch board data (-2)
>>> [ 8.722757] ath10k: could not fetch firmware files (-2)
>>> [ 8.781868] ath10k: could not probe fw (-2)
>>> [ 8.781874] ath10k: failed to register driver core: -2
>>> [ 8.782041] ath10k_pci: probe of 0000:01:00.0 failed with error -2
>>>
>>> I've tried the firmware-2, firmware-5 and Candella firmware. I can't find any information on what this error means or how to debug this issue. And the vendors are struggling to get me a solution.
>>> Any help would be greatly appreciated.
>>>
>>> Colin McKay
>>>
>>>
>>>
>>> _______________________________________________
>>> ath10k mailing list
>>> ath10k@lists.infradead.org
>>> http://lists.infradead.org/mailman/listinfo/ath10k
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
