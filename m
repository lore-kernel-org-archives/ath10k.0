Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ya4nN-0003i5-Vq
 for ath10k@lists.infradead.org; Mon, 23 Mar 2015 16:01:43 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/2] ath10k: share board file loading code across FW APIs
References: <1427114301-18886-1-git-send-email-michal.kazior@tieto.com>
 <1427114301-18886-2-git-send-email-michal.kazior@tieto.com>
Date: Mon, 23 Mar 2015 18:01:08 +0200
In-Reply-To: <1427114301-18886-2-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Mon, 23 Mar 2015 12:38:20 +0000")
Message-ID: <87lhind7p7.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> There's no need to implement the same thing twice.
> Reduce code duplication.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

[...]

> @@ -730,6 +716,12 @@ static int ath10k_core_fetch_firmware_files(struct ath10k *ar)
>  	/* calibration file is optional, don't check for any errors */
>  	ath10k_fetch_cal_file(ar);
>  
> +	ret = ath10k_core_fetch_board_file(ar);
> +	if (ret) {
> +		ath10k_err(ar, "failed to fetch board file: %d\n", ret);
> +		return ret;
> +	}
> +
>  	ar->fw_api = 4;
>  	ath10k_dbg(ar, ATH10K_DBG_BOOT, "trying fw api %d\n", ar->fw_api);

There was a conflict here, please check the resolution in the pending
branch.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
