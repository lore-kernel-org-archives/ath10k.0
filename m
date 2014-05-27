Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WpR1M-0003DH-PU
 for ath10k@lists.infradead.org; Tue, 27 May 2014 23:43:05 +0000
Received: from [192.168.100.236] (firewall.candelatech.com [70.89.124.249])
 (using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id A9EAC40BF83
 for <ath10k@lists.infradead.org>; Tue, 27 May 2014 16:42:42 -0700 (PDT)
Message-ID: <538522F2.1060803@candelatech.com>
Date: Tue, 27 May 2014 16:42:42 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: New version of CT firmware is available.
References: <5384E510.10109@candelatech.com>
In-Reply-To: <5384E510.10109@candelatech.com>
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

On 05/27/2014 12:18 PM, Ben Greear wrote:
> Just a quick note:  Our firmware should now work on standard kernels with
> no kernel modifications.  Just drop the firmware into the appropriate directory
> (and re-named firmware-2.bin), and reboot.
> 
> I did a quick test on Ubuntu 14.04 with kernel 3.13.0-24-generic:  Associated
> a station on an AP on channel 36 and obtained DHCP.  Used open authentication.
> 
> If you can crash this firmware or see any other bugs that could be firmware related,
> please send me the kernel firmware crash dump and/or bug report.
> 
> Please do not bother QCA about issues with my firmware image.
> 
> I am interested to know results if anyone tries this.
> 
> You can ignore most of this page linked below if not dealing with
> multiple station vifs, but it has a link to the firmware image, etc:
> 
> http://www.candelatech.com/vsta.php

And, as previously promised, there is now a 'community'
version that may be used commercially or otherwise, under
the same restrictions as that of the official QCA firmware.

The only difference is that the community version will not
allow multiple station vifs to connect to the same AP when
using encryption because it does not allow software-rx-crypt.
Multiple stations to same AP with open authentication works fine
if you are using our kernel patches or some proper subset thereof.

For normal use (single station, or single AP), both images should
act similar and should work on standard un-patched kernels.

See link above for more info...just see notes in bold at top, and
list item #3 for normal-use scenarios.

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
