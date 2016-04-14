Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nm.newmedia-net.de ([217.113.179.122]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aqi0T-0004K5-Hk
 for ath10k@lists.infradead.org; Thu, 14 Apr 2016 14:12:35 +0000
References: <87mvuj585b.fsf@kamboji.qca.qualcomm.com>
 <1447826363-16818-1-git-send-email-michal.kazior@tieto.com>
 <1447826363-16818-10-git-send-email-michal.kazior@tieto.com>
 <564DE65C.9030407@dd-wrt.com> <564DEBBE.1040308@candelatech.com>
 <564DEC25.1030401@dd-wrt.com> <564DF53C.50009@candelatech.com>
 <564E02F1.3090306@dd-wrt.com> <564E130D.4080201@dd-wrt.com>
 <570E6774.9000301@candelatech.com>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <570FA549.7040808@dd-wrt.com>
Date: Thu, 14 Apr 2016 16:12:25 +0200
MIME-Version: 1.0
In-Reply-To: <570E6774.9000301@candelatech.com>
Subject: Re: QCA998X not working at all
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

Am 13.04.2016 um 17:36 schrieb Ben Greear:
> On 11/19/2015 10:21 AM, Sebastian Gottschall wrote:
>> simple solution.
>>
>> as for ath9k. otp must be ignored for various chipsets, since they 
>> wont return valid results
>>
>> --- core.c (Revision 2702)
>> +++ core.c (Arbeitskopie)
>> @@ -1735,9 +1735,8 @@
>>
>>    ret = ath10k_core_get_board_id_from_otp(ar);
>>    if (ret && ret != -EOPNOTSUPP) {
>> -  ath10k_err(ar, "failed to get board id from otp for qca99x0: %d\n",
>> +  ath10k_err(ar, "failed to get board id from otp for qca99x0: %d, 
>> ignore\n",
>>           ret);
>> -  return ret;
>>    }
>>
>>    ret = ath10k_core_fetch_board_file(ar);
>
> I received a report of the same problem reported below from someone 
> using an i7 processor
> on some random motherboard.
>
> Same NIC, kernel, and firmware works fine on my systems, so it appears 
> to be platform
> dependent somehow.
>
> Did you find a better solution other than just ignoring the OTP failure?
nope. thats the only way and applies to all SOC devices using QCA998X 
chipsets. (routers etc.)
they dont have a otp, so the call fails. all data is stored in local 
flash memory on this devices.
i also have never seen this call working. no matter which card i used
>
> Thanks,
> Ben
>
>>
>>
>>
>> Am 19.11.2015 um 18:12 schrieb Sebastian Gottschall:
>>> Am 19.11.2015 um 17:13 schrieb Ben Greear:
>>>>
>>>> git clone git://dmz2.candelatech.com/linux.ath
>>> same effect with yours
>>>
>>>     6.201141] ath10k_pci 0000:01:00.0: enabling device (0140 -> 0142)
>>> [    6.201593] ath10k_pci 0000:01:00.0: pci irq legacy interrupts 0 
>>> irq_mode 0 reset_mode 0
>>> [    8.578573] ath10k_pci 0000:01:00.0: unable to read from the device
>>> [    8.578605] ath10k_pci 0000:01:00.0: could not execute otp for 
>>> board id check: -110
>>> [    8.583648] ath10k_pci 0000:01:00.0: failed to get board id from 
>>> otp for qca99x0: -110
>>> [    8.591338] ath10k_pci 0000:01:00.0: could not probe fw (-110)
>>> [    8.600062] ath10k_pci 0001:01:00.0: enabling device (0140 -> 0142)
>>> [    8.605600] ath10k_pci 0001:01:00.0: pci irq legacy interrupts 0 
>>> irq_mode 0 reset_mode 0
>>> [   10.798574] ath10k_pci 0001:01:00.0: unable to read from the device
>>> [   10.798598] ath10k_pci 0001:01:00.0: could not execute otp for 
>>> board id check: -110
>>> [   10.803644] ath10k_pci 0001:01:00.0: failed to get board id from 
>>> otp for qca99x0: -110
>>> [   10.811346] ath10k_pci 0001:01:00.0: could not probe fw (-110)
>>>
>>>
>>> _______________________________________________
>>> ath10k mailing list
>>> ath10k@lists.infradead.org
>>> http://lists.infradead.org/mailman/listinfo/ath10k
>>>
>>
>>
>> _______________________________________________
>> ath10k mailing list
>> ath10k@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/ath10k
>>
>
>


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
