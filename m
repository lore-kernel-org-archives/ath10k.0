Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WuVzN-0005s1-IV
 for ath10k@lists.infradead.org; Wed, 11 Jun 2014 00:02:03 +0000
Received: from [192.168.100.236] (firewall.candelatech.com [70.89.124.249])
 (using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id 35A2240A9E6
 for <ath10k@lists.infradead.org>; Tue, 10 Jun 2014 17:01:38 -0700 (PDT)
Message-ID: <53979C61.4070108@candelatech.com>
Date: Tue, 10 Jun 2014 17:01:37 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: How to configure hostapd + ath10k for DFS channel?
References: <53978B53.8050501@candelatech.com>
 <53978CBD.3020404@candelatech.com>
In-Reply-To: <53978CBD.3020404@candelatech.com>
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
To: ath10k <ath10k@lists.infradead.org>

On 06/10/2014 03:54 PM, Ben Greear wrote:
> On 06/10/2014 03:48 PM, Ben Greear wrote:
>>
>> I'm trying to put an AP on a DFS channel (52) in order to test
>> my CT firmware in station mode on DFS channels.
>>
>> I have tried both CT and standard upstream 10.1.467-2.1 firmware on
>> the AP machine, with similar behaviour (hostapd will not start
>> because DFS cannot set channel, or something like that).
>>
>> Kernel is 'ath', fairly recent, with a bunch of my own ath10k
>> patches applied (though they should mostly not be doing anything
>> different from upstream when running standard firmware).
> 
> Actually, this was hacked upon 3.14.6+ kernel...will try with newer kernel...

Not much luck...I was using bad channel in hostapd conf, but when
I fixed that to use proper values for channel 52, it still won't
work because of regulatory, evidently:

[root@ath10k-2220 lanforge]# iw reg get
country 98: DFS-UNSET
	(2402 - 2472 @ 70), (N/A, 20)
	(2457 - 2472 @ 70), (N/A, 20), PASSIVE-SCAN
	(5170 - 5250 @ 80), (N/A, 17), PASSIVE-SCAN
	(5250 - 5330 @ 80), (N/A, 20), DFS, PASSIVE-SCAN
	(5735 - 5835 @ 80), (N/A, 20), PASSIVE-SCAN
	(57240 - 63720 @ 2160), (N/A, 0)

How frustrating!

Ben

> 
> Ben
> --
> Ben Greear <greearb@candelatech.com>
> Candela Technologies Inc  http://www.candelatech.com
> 
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
