Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XCxvL-0008GO-Sa
 for ath10k@lists.infradead.org; Thu, 31 Jul 2014 21:30:08 +0000
Received: from [192.168.100.236] (firewall.candelatech.com [70.89.124.249])
 (using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id 5770240AC0B
 for <ath10k@lists.infradead.org>; Thu, 31 Jul 2014 14:29:43 -0700 (PDT)
Message-ID: <53DAB547.3030700@candelatech.com>
Date: Thu, 31 Jul 2014 14:29:43 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: New CT firmware release is uploaded.
References: <53CD9C08.9090908@candelatech.com>
In-Reply-To: <53CD9C08.9090908@candelatech.com>
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

I've put up a new version (010) that fixes a crash bug in the 009
release.  64 stations (vdevs) have been fairly well tested at
this point (using my 3.14.14+ kernel).

http://www.candelatech.com/ath10k.php

Thanks,
Ben


On 07/21/2014 04:02 PM, Ben Greear wrote:
> Release notes:
> 
>       Improve RAM usage:  Re-organized, trimmed, and otherwise made better use
>       of RAM.  Allow compiling out swbmiss, beacon filtering, roaming code.
>       Images with 'full' in their name do NOT have the previously mentioned features
>       compiled out.
> 
>       Over-all, freed up about 80k of extra RAM, which can be used for more vdevs,
>       peers, buffers, etc.
> 
>       Supports 64 vdevs (one should be reserved for monitor interface, so
>       effectively 63 vdevs for current kernels.)
> 
> I have only lightly tested this on my 3.14 kernel so far.
> 
> A lot of these changes could potentially introduce run-time
> crashes due to extensive use of a different type of RAM for
> storing many structures.  Should be a quick fix should problems
> arise.
> 
> As always, let me know if you find any problems.
> 
> Thanks,
> Ben
> 


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
