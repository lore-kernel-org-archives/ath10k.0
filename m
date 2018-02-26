Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eqMOM-00071z-Ac
 for ath10k@lists.infradead.org; Mon, 26 Feb 2018 17:16:53 +0000
Subject: Re: Channel 169, 173 support in India
References: <SN2PR10MB00954E5167AB087BB26CC5F39DC10@SN2PR10MB0095.namprd10.prod.outlook.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <b7a221e7-7a94-76ac-98a6-77efe9307c67@candelatech.com>
Date: Mon, 26 Feb 2018 09:16:31 -0800
MIME-Version: 1.0
In-Reply-To: <SN2PR10MB00954E5167AB087BB26CC5F39DC10@SN2PR10MB0095.namprd10.prod.outlook.com>
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
To: "Shu, Nick" <Nick.Shu@spirent.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 02/26/2018 09:03 AM, Shu, Nick wrote:
> Hi, All:
> Does ath10k support UNII-4 band at channel 169 and channel 173 used in India?
> If yes, how to configure it? In terms of driver and firmware.
>
> Thank you in advance!
> Nick Shu

The firmware should work as is as far as I can tell.  You need at least
this driver patch:

https://patchwork.kernel.org/patch/10141515/

Thanks,
Ben

>
>
>
>
> Spirent Communications e-mail confidentiality.
> ------------------------------------------------------------------------
> This e-mail contains confidential and / or privileged information belonging to Spirent Communications plc, its affiliates and / or subsidiaries. If you are not the intended recipient, you are hereby notified that any disclosure, copying, distribution and / or the taking of any action based upon reliance on the contents of this transmission is strictly forbidden. If you have received this message in error please notify the sender by return e-mail and delete it from your system.
>
> Spirent Communications plc
> Northwood Park, Gatwick Road, Crawley, West Sussex, RH10 9XN, United Kingdom.
> Tel No. +44 (0) 1293 767676
> Fax No. +44 (0) 1293 767677
>
> Registered in England Number 470893
> Registered at Northwood Park, Gatwick Road, Crawley, West Sussex, RH10 9XN, United Kingdom.
>
> Or if within the US,
>
> Spirent Communications,
> 27349 Agoura Road, Calabasas, CA, 91301, USA.
> Tel No. 1-818-676- 2300
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
