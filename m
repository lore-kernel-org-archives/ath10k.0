Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YE1FP-0003Lb-FY
 for ath10k@lists.infradead.org; Wed, 21 Jan 2015 19:47:27 +0000
Received: from [192.168.100.236] (unknown [50.251.239.81])
 (using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id 4D90940D7B5
 for <ath10k@lists.infradead.org>; Wed, 21 Jan 2015 11:47:06 -0800 (PST)
Message-ID: <54C00239.7000008@candelatech.com>
Date: Wed, 21 Jan 2015 11:47:05 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: More than one ath10k NIC in 3.19.0-rc5?
References: <54BECE4D.9020308@candelatech.com> <54BF0B42.7050101@dd-wrt.com>
 <54BF13AE.5010909@candelatech.com> <54BFF788.2000500@candelatech.com>
In-Reply-To: <54BFF788.2000500@candelatech.com>
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
To: ath10k@lists.infradead.org

On 01/21/2015 11:01 AM, Ben Greear wrote:
> On 01/20/2015 06:49 PM, Ben Greear wrote:
>> On 01/20/2015 06:13 PM, Sebastian Gottschall wrote:
>>> Am 20.01.2015 um 22:53 schrieb Ben Greear:
>>>> I tried running a patched version of 3.19.0-rc5 kernel, and it seems to work
>>>> fine when there is one ath10k NIC in the system, but when there is two it
>>>> doesn't try to load the firmware.
>>>>
>>>> Hacked 3.17.8+ works fine.
>>>>
>>>> Anyone tried more than one ath10k NIC in 3.19 kernel?
>>>>
>>>> Thanks,
>>>> Ben
>>> standard x86 system? i just can say that with 3.18 i have big troubles with the new pci bus code introduced on several embedded devices.
>>> so maybe the reason is here?
>>
>> Standard 64-bit x86.
> 
> Looks like 3.19.0-rc2 is OK, -rc5 is busted.  I'll bisect...

Err, no.  rc2 is busted too...sometimes first NIC loads, sometimes
second, but not both at once....doing bigger bisect...

Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
