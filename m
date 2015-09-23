Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZeqnF-00031z-H5
 for ath10k@lists.infradead.org; Wed, 23 Sep 2015 20:37:34 +0000
Subject: Re: QCA9880/9890 rfkill
References: <019a01d0f631$6d01cf90$47056eb0$@wriba.com>
 <CAJ-VmomTFHgcfKghoYSe_8WJ9gwq+sZg_pYCv3HC2UVxVe2rnQ@mail.gmail.com>
 <019e01d0f636$a5b2f4e0$f118dea0$@wriba.com>
 <CAJ-VmonLFTRmrm66uyPaqmRaXNqHUVU_AkZgVhQf9iJwnGNPEg@mail.gmail.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <56030D78.2000105@candelatech.com>
Date: Wed, 23 Sep 2015 13:37:12 -0700
MIME-Version: 1.0
In-Reply-To: <CAJ-VmonLFTRmrm66uyPaqmRaXNqHUVU_AkZgVhQf9iJwnGNPEg@mail.gmail.com>
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
To: Adrian Chadd <adrian@freebsd.org>, William Riba <wriba@wriba.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

At least 10.1.467 era firmware ignores some of the OTP settings,
so you may have to go poking in the firmware source to be certain
of what can be configured and/or fix the limitations.

Thanks,
Ben

On 09/23/2015 01:25 PM, Adrian Chadd wrote:
> iirc otp.bin is the image used when you don't have one; it should be
> coming out of OTP or on-board flash.
>
>
> -a
>
>
> On 23 September 2015 at 12:32, William Riba <wriba@wriba.com> wrote:
>> Hi Adrian - thank you for the quick response. I assume you're referring the otp.bin firmware file? Is there a mapping of the OTP to EEPROM settings available? That would be an easy fix if I can make a modification there to activate RFKILL.
>>
>> -bill
>>
>>
>>
>>
>> -----Original Message-----
>> From: adrian.chadd@gmail.com [mailto:adrian.chadd@gmail.com] On Behalf Of Adrian Chadd
>> Sent: Wednesday, September 23, 2015 1:58 PM
>> To: William Riba
>> Cc: ath10k@lists.infradead.org
>> Subject: Re: QCA9880/9890 rfkill
>>
>> Hi,
>>
>> The GPIO line needs to be hooked in via the relevant EEPROM/OTP setting so the firmware programs things in correctly.
>>
>> Go dump the OTP and see what the rfkill firmware line is.
>>
>>
>>
>> -adrian
>>
>>
>> On 23 September 2015 at 11:55, William Riba <wriba@wriba.com> wrote:
>>> Does anybody know whether rfkill in its hard block flavor is supported
>>> in any QCA9880/9890 based device and/or firmware load? While vendors
>>> refer to the WiFi disable/GPIO line in their reference schematics, it
>>> is not functional.  What I see after testing multiple cards is if the
>>> line is asserted during operation, there seems to be no effect. If it
>>> is asserted at boot-up, the device does not enumerate on the PCI bus.
>>>
>>> If Qualcomm does not intend to support this functionality anymore it
>>> would be nice to know. Hard kills are a regulatory requirement for
>>> certain applications. While we would like to use a QCA9890 in a new
>>> application, there's no way it could make it through qualifications
>>> with its current operation.  Any additional information on this would be welcome. Thanks.
>>>
>>>
>>> _______________________________________________
>>> ath10k mailing list
>>> ath10k@lists.infradead.org
>>> http://lists.infradead.org/mailman/listinfo/ath10k
>>
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k
>


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
