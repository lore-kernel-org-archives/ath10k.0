Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XtW3G-0006rj-M2
 for ath10k@lists.infradead.org; Wed, 26 Nov 2014 06:26:11 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 05/10] ath10k: apply chainmask settings to vdev on
 creation.
References: <1411507045-18973-1-git-send-email-greearb@candelatech.com>
 <1411507045-18973-5-git-send-email-greearb@candelatech.com>
Date: Wed, 26 Nov 2014 08:25:37 +0200
In-Reply-To: <1411507045-18973-5-git-send-email-greearb@candelatech.com>
 (greearb@candelatech.com's message of "Tue, 23 Sep 2014 14:17:20
 -0700")
Message-ID: <87bnnuzdem.fsf@kamboji.qca.qualcomm.com>
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
To: greearb@candelatech.com
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

greearb@candelatech.com writes:

> From: Ben Greear <greearb@candelatech.com>
>
> It appears it takes more than just setting the
> hardware's chainmask to make things work well.  Without
> this patch, a vdev would only use 1x1 rates when chainmask
> was set to 0x3.
>
> Setting the 'nss' (number of spatial streams) on the vdev
> helps the firmware's rate-control algorithm work properly.
>
> Tested on CT firmware, but probably this works (and
> is required) on normal firmware.
>
> Signed-off-by: Ben Greear <greearb@candelatech.com>
> ---
>
> v2:  Add warning if chainmask is set to probably-invalid configuration.
>   Also, from a quick test, it appears you cannot even set the chainmask
>   using 'iw' when vdevs are active.

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
