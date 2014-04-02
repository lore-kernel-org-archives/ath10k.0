Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WVFfq-0002sj-IO
 for ath10k@lists.infradead.org; Wed, 02 Apr 2014 07:33:27 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/1] ath10k:  add helper method to grab debug stats.
References: <1396374940-21453-1-git-send-email-greearb@candelatech.com>
Date: Wed, 2 Apr 2014 10:32:55 +0300
In-Reply-To: <1396374940-21453-1-git-send-email-greearb@candelatech.com>
 (greearb@candelatech.com's message of "Tue, 1 Apr 2014 10:55:40
 -0700")
Message-ID: <8738hwrxso.fsf@kamboji.qca.qualcomm.com>
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
> It can be nice to update the firmware's stats while
> debugging other bits of the driver, so add helper method
> to do this.
>
> Signed-off-by: Ben Greear <greearb@candelatech.com>

[...]

> --- a/drivers/net/wireless/ath/ath10k/debug.h
> +++ b/drivers/net/wireless/ath/ath10k/debug.h
> @@ -135,4 +135,6 @@ struct dbglog_hdr_s {
>  
>  void ath10k_dbg_print_fw_dbg_buffer(u8 *buffer, int len, const char* lvl);
>  
> +int ath10k_refresh_peer_stats(struct ath10k *ar);

I don't see anyone calling this. How are you planning to use it?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
