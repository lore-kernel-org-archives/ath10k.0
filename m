Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gAbjd-0004kH-3l
 for ath10k@lists.infradead.org; Thu, 11 Oct 2018 14:14:42 +0000
Date: Thu, 11 Oct 2018 16:14:22 +0200
From: Greg KH <greg@kroah.com>
Subject: Re: [for -stable] commit "c82919888064 ath10k: fix scan crash due to
 incorrect length calculation"
Message-ID: <20181011141422.GD9507@kroah.com>
References: <20180906213620.GA72542@ban.mtv.corp.google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180906213620.GA72542@ban.mtv.corp.google.com>
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
To: Brian Norris <briannorris@chromium.org>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Zhi Chen <zhichen@codeaurora.org>, stable@vger.kernel.org, Kalle Valo <kvalo@codeaurora.org>

On Thu, Sep 06, 2018 at 02:36:22PM -0700, Brian Norris wrote:
> Hi Greg / stable maintainer(s),
> 
> IIUC, this commit is a good candidate for -stable. I just hit the bug on
> 4.14, because of new vendor firmware that noticed the mismatched length
> (an internal "assert"), but it seems like this is equally problematic
> from the kernel side for as long as this code existed [1]:
> 
> commit c8291988806407e02a01b4b15b4504eafbcc04e0
> Author: Zhi Chen <zhichen@codeaurora.org>
> Date:   Mon Jun 18 17:00:39 2018 +0300
> 
>     ath10k: fix scan crash due to incorrect length calculation
> 
> Thanks,
> Brian
> 
> [1] I guess that would be:
> 
> Fixes: ca996ec56608 ("ath10k: implement wmi-tlv backend")
> 
> which was in v4.0.

Thanks, now queued up.

greg k-h

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
