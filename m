Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iFYak-0006QO-Jh
 for ath10k@lists.infradead.org; Wed, 02 Oct 2019 06:58:32 +0000
Received: by mail-wm1-x344.google.com with SMTP id a6so5819430wma.5
 for <ath10k@lists.infradead.org>; Tue, 01 Oct 2019 23:58:29 -0700 (PDT)
Subject: Re: [PATCH] ath10k: Fix offchannel tx failure when no
 ath10k_mac_tx_frm_has_freq
References: <1508284992-3574-1-git-send-email-greearb@candelatech.com>
 <ba256006-b42b-0dee-4eb7-093da5885341@kaiwoo.ai>
 <87tv8r3cnm.fsf@kamboji.qca.qualcomm.com>
From: Antonio Quartulli <antonio.quartulli@kaiwoo.ai>
Message-ID: <d1719c78-1c40-22e1-bb84-a5aee0b41750@kaiwoo.ai>
Date: Wed, 2 Oct 2019 08:55:51 +0200
MIME-Version: 1.0
In-Reply-To: <87tv8r3cnm.fsf@kamboji.qca.qualcomm.com>
Content-Language: en-US
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: greearb@candelatech.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Hi,

On 02/10/2019 08:05, Kalle Valo wrote:
>> Tested-by: Antonio Quartulli <antonio.quartulli@kaiwoo.ai>
> 
> Thanks! What hardware did you test this? I'll add that to the commit
> log.
> 

It was tested on my AP equipped with and QCA4019 and QCA9888.

> The patch also had some conflicts which I fixed in the pending branch,
> please check:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=bdc657dd0c0cb7163fcf39b94e664e3d9409140e
> 

Looks good to me, thanks!

Regards,

-- 
Antonio Quartulli
Kaiwoo.ai

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
