Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a6gks-0004YJ-Jn
 for ath10k@lists.infradead.org; Wed, 09 Dec 2015 15:34:11 +0000
Message-ID: <566849DB.9040901@candelatech.com>
Date: Wed, 09 Dec 2015 07:33:47 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: ATH10K VLAN firmware issue
References: <773DB8A82AB6A046AE0195C68612A31901C5B293@sbs2003.acksys.local>
In-Reply-To: <773DB8A82AB6A046AE0195C68612A31901C5B293@sbs2003.acksys.local>
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
To: Cedric VONCKEN <cedric.voncken@acksys.fr>, ath10k@lists.infradead.org, linux-wireless <linux-wireless@vger.kernel.org>

This only happens when you use STA  + WDS, or is .1q broken
for you in other cases as well?

Thanks,
Ben

On 12/08/2015 06:29 AM, Cedric VONCKEN wrote:
> 	I'm testing to transmit frame with 802.1q tag (VLAN).
>
> 	My client is set in STA + WDS and the netdev is bridged with
> eth0.
> 	I have a computer with vlan configuration set connected to the
> STA eth0.
>
> 	If I try to transmit frames with 802.1q tag, the frames are not
> sent.
> 	I checked with wireless sniffer, and I don't see the frame with
> VLAN tag (the frames without VLAN tag are sent).
>
> 	I tested with firmware 10.2.4.70.14-2 from kale github,
> 10.1.467-ct-com-full-015 from candelatech and 10.2.4.70-2 from openwrt,
> and in all cases I have the same issue.
>
> 	Thanks for your help.
>
> 	
> --
> To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
