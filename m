Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WntBV-0007Wc-G1
 for ath10k@lists.infradead.org; Fri, 23 May 2014 17:23:09 +0000
Message-ID: <537F83E7.2090504@candelatech.com>
Date: Fri, 23 May 2014 10:22:47 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: changing channel width
References: <CAPqRyK8WH14gjHGuBeCt3t8iz=cJLVbup_uoZgTpOi9vPd1NHA@mail.gmail.com>
In-Reply-To: <CAPqRyK8WH14gjHGuBeCt3t8iz=cJLVbup_uoZgTpOi9vPd1NHA@mail.gmail.com>
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
To: Phil Moora <phil.moora@gmail.com>
Cc: ath10k <ath10k@lists.infradead.org>

On 05/23/2014 10:03 AM, Phil Moora wrote:
> Hi all,
> 
> I am trying to change the channel width (20, 40 or 80 MHz) with ath10k
> using iw. I am not able to do so dynamically (while the radio is
> operating in managed or AP mode). In some cases, it is not possible to
> change channel width even when radio is off (ifconfig down). I always
> get "Device busy" error.
> 
> Is it true that with current Ath10k, we have to reset the radio to
> change the channel width? Is there a workaround?
> 
> I am using Compex WLE900N5-18 miniPCIe (hw2) with latest ath10k.

Can you just configure hostapd to use the proper channel width?

Thanks,
Ben


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
