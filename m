Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XFg8O-0003Gr-HK
 for ath10k@lists.infradead.org; Fri, 08 Aug 2014 09:06:48 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: Reporting firmware stats to ethtool
References: <53E3F65D.8080102@candelatech.com>
Date: Fri, 8 Aug 2014 12:06:15 +0300
In-Reply-To: <53E3F65D.8080102@candelatech.com> (Ben Greear's message of "Thu, 
 07 Aug 2014 14:57:49 -0700")
Message-ID: <87wqajz6yg.fsf@kamboji.qca.qualcomm.com>
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
To: Ben Greear <greearb@candelatech.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>

Ben Greear <greearb@candelatech.com> writes:

> I'm working on a patch to report the stats seen in debugfs/...ath10k/fw_stats
> as ethtool stats, somewhat similar to how ath9k does it.
>
> I notice that my user-space tool is reporting huge numbers because
> the stats are reset to zero when firmware restarts, and so my tool
> thinks the stats wrapped.
>
> I can fix my tool easily enough, but I first wanted to see if
> anyone had strong feelings about keeping the stats from resetting
> to zero by storing history and calculating diffs in the driver.
>
> I think my preference is to punt this to user-space, but if
> someone feels otherwise, please let me know sooner than later.

I also prefer to have this in user space, but how does user space know
when the stats have been zeroed?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
