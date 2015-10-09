Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZkYkL-0005yF-Ex
 for ath10k@lists.infradead.org; Fri, 09 Oct 2015 14:34:10 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: Enable adaptive CCA
References: <1444210033-25901-1-git-send-email-c_mkenna@qti.qualcomm.com>
Date: Fri, 9 Oct 2015 17:33:28 +0300
In-Reply-To: <1444210033-25901-1-git-send-email-c_mkenna@qti.qualcomm.com> (c.
 mkenna's message of "Wed, 7 Oct 2015 14:57:13 +0530")
Message-ID: <87io6gqfgn.fsf@kamboji.qca.qualcomm.com>
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
To: c_mkenna@qti.qualcomm.com
Cc: Manikanta Pubbisetty <c_mpubbi@qti.qualcomm.com>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

<c_mkenna@qti.qualcomm.com> writes:

> From: Maharaja Kennadyrajan <c_mkenna@qti.qualcomm.com>
>
> European Union has made it mandatory that all devices working in 2.4 GHz
> has to adhere to the ETSI specification (ETSI EN 300 328 V1.9.1)
> beginnig this year. The standard basically speaks about interferences
> in 2.4Ghz band.
> For example, when 802.11 device detects interference, TX must be stopped
> as long as interference is present.
>
> Adaptive CCA is a feature, when enabled the device learns from the
> environment and configures CCA levels adaptively. This will improve
> detecting interferences and the device can stop trasmissions till the
> interference is present eventually leading to good performances in
> varying interference conditions.
>
> The patch includes code for enabling adaptive CCA for 10.2.4 firmware on
> QCA988X.
>
> Signed-off-by: Maharaja Kennadyrajan <c_mkenna@qti.qualcomm.com>
> Signed-off-by: Manikanta Pubbisetty <c_mpubbi@qti.qualcomm.com>

There are conflicts, please rebase and resend:

Applying: ath10k: Enable adaptive CCA
Using index info to reconstruct a base tree...
Falling back to patching base and 3-way merge...
Auto-merging drivers/net/wireless/ath/ath10k/wmi.h
Auto-merging drivers/net/wireless/ath/ath10k/wmi.c
CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath10k/wmi.c
Auto-merging drivers/net/wireless/ath/ath10k/wmi-ops.h
CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath10k/wmi-ops.h
Auto-merging drivers/net/wireless/ath/ath10k/mac.c
Auto-merging drivers/net/wireless/ath/ath10k/core.h
Failed to merge in the changes.
Patch failed at 0001 ath10k: Enable adaptive CCA

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
