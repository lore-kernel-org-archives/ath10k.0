Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YE0XG-0001BW-Rw
 for ath10k@lists.infradead.org; Wed, 21 Jan 2015 19:01:51 +0000
Message-ID: <54BFF788.2000500@candelatech.com>
Date: Wed, 21 Jan 2015 11:01:28 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: More than one ath10k NIC in 3.19.0-rc5?
References: <54BECE4D.9020308@candelatech.com> <54BF0B42.7050101@dd-wrt.com>
 <54BF13AE.5010909@candelatech.com>
In-Reply-To: <54BF13AE.5010909@candelatech.com>
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
To: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Cc: ath10k@lists.infradead.org

On 01/20/2015 06:49 PM, Ben Greear wrote:
> On 01/20/2015 06:13 PM, Sebastian Gottschall wrote:
>> Am 20.01.2015 um 22:53 schrieb Ben Greear:
>>> I tried running a patched version of 3.19.0-rc5 kernel, and it seems to work
>>> fine when there is one ath10k NIC in the system, but when there is two it
>>> doesn't try to load the firmware.
>>>
>>> Hacked 3.17.8+ works fine.
>>>
>>> Anyone tried more than one ath10k NIC in 3.19 kernel?
>>>
>>> Thanks,
>>> Ben
>> standard x86 system? i just can say that with 3.18 i have big troubles with the new pci bus code introduced on several embedded devices.
>> so maybe the reason is here?
> 
> Standard 64-bit x86.

Looks like 3.19.0-rc2 is OK, -rc5 is busted.  I'll bisect...

Thanks,
Ben

> 
> Thanks,
> Ben
> 
> 


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
