Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fzjxC-0002bh-RX
 for ath10k@lists.infradead.org; Tue, 11 Sep 2018 14:47:48 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [for -stable] commit "c82919888064 ath10k: fix scan crash due to
 incorrect length calculation"
References: <20180906213620.GA72542@ban.mtv.corp.google.com>
Date: Tue, 11 Sep 2018 17:47:31 +0300
In-Reply-To: <20180906213620.GA72542@ban.mtv.corp.google.com> (Brian Norris's
 message of "Thu, 6 Sep 2018 14:36:22 -0700")
Message-ID: <87lg88t7jw.fsf@codeaurora.org>
MIME-Version: 1.0
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
Cc: Zhi Chen <zhichen@codeaurora.org>, ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org

Brian Norris <briannorris@chromium.org> writes:

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

FWIW:

Acked-by: Kalle Valo <kvalo@codeaurora.org>

Thanks Brian!

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
