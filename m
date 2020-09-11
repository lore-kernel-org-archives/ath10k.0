Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-11.smtp-out.us-west-2.amazonses.com ([54.240.27.11])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGeWw-0000Yh-8e
 for ath10k@lists.infradead.org; Fri, 11 Sep 2020 08:35:39 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: lockdep splat in kvallo ath tree
References: <0ef69472-9613-c265-0635-ff2ef0cf274f@candelatech.com>
Date: Fri, 11 Sep 2020 08:35:35 +0000
In-Reply-To: <0ef69472-9613-c265-0635-ff2ef0cf274f@candelatech.com> (Ben
 Greear's message of "Wed, 2 Sep 2020 15:54:31 -0700")
Message-ID: <010101747c4e39cd-2ed5e782-30e9-4382-bbae-01db2f296c7c-000000@us-west-2.amazonses.com>
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
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org, Wen Gong <wgong@codeaurora.org>

+ ath10k

Ben Greear <greearb@candelatech.com> writes:

> The patch below adds a call to ath10k_debug_fw_stats_request(ar),
> which expects ar->conf_mutex to be held, but it is *not* held in
> this code path.  This leads to warnings when lockdep is enabled.
>
>
> greearb@bendt7 ath10k]$ git show 4913e675630ec
> commit 4913e675630ec1a15c92651f426a63755c71b91b
> Author: Wen Gong <wgong@codeaurora.org>
> Date:   Thu Apr 23 10:27:58 2020 +0800
>
>     ath10k: enable rx duration report default for wmi tlv
>
>     When run command "iw dev wlan0 station dump", the rx duration is 0.
>     When firmware indicate WMI_UPDATE_STATS_EVENTID, extended flag of
>     statsis not set by default, so firmware do not report rx duration.

Wen, please investigate this.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
