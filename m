Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fy1x7-0001qU-IY
 for ath10k@lists.infradead.org; Thu, 06 Sep 2018 21:36:39 +0000
Received: by mail-pf1-x42c.google.com with SMTP id k19-v6so5930632pfi.1
 for <ath10k@lists.infradead.org>; Thu, 06 Sep 2018 14:36:26 -0700 (PDT)
Date: Thu, 6 Sep 2018 14:36:22 -0700
From: Brian Norris <briannorris@chromium.org>
Subject: [for -stable] commit "c82919888064 ath10k: fix scan crash due to
 incorrect length calculation"
Message-ID: <20180906213620.GA72542@ban.mtv.corp.google.com>
MIME-Version: 1.0
Content-Disposition: inline
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
To: stable@vger.kernel.org
Cc: Zhi Chen <zhichen@codeaurora.org>, ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, Kalle Valo <kvalo@codeaurora.org>

Hi Greg / stable maintainer(s),

IIUC, this commit is a good candidate for -stable. I just hit the bug on
4.14, because of new vendor firmware that noticed the mismatched length
(an internal "assert"), but it seems like this is equally problematic
from the kernel side for as long as this code existed [1]:

commit c8291988806407e02a01b4b15b4504eafbcc04e0
Author: Zhi Chen <zhichen@codeaurora.org>
Date:   Mon Jun 18 17:00:39 2018 +0300

    ath10k: fix scan crash due to incorrect length calculation

Thanks,
Brian

[1] I guess that would be:

Fixes: ca996ec56608 ("ath10k: implement wmi-tlv backend")

which was in v4.0.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
