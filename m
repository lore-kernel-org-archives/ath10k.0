Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VGkg7-0007nk-Do
 for ath10k@lists.infradead.org; Tue, 03 Sep 2013 07:05:32 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v3 1/2] ath10k: update wal_dbg_tx_stats structure with
 missing parameter.
References: <1377778061-22331-1-git-send-email-bartosz.markowski@tieto.com>
 <1377778061-22331-2-git-send-email-bartosz.markowski@tieto.com>
Date: Tue, 3 Sep 2013 10:05:04 +0300
In-Reply-To: <1377778061-22331-2-git-send-email-bartosz.markowski@tieto.com>
 (Bartosz Markowski's message of "Thu, 29 Aug 2013 14:07:39 +0200")
Message-ID: <87eh961j33.fsf@kamboji.qca.qualcomm.com>
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
To: Bartosz Markowski <bartosz.markowski@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Bartosz Markowski <bartosz.markowski@tieto.com> writes:

> It's very imporatant to keep these structs up to date with FW abi,
> due to the arithmetic we use while read the fw_stats.
>
> Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>
> ---
>  drivers/net/wireless/ath/ath10k/wmi.h |    3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
> index 08860c4..5b94707 100644
> --- a/drivers/net/wireless/ath/ath10k/wmi.h
> +++ b/drivers/net/wireless/ath/ath10k/wmi.h
> @@ -1767,6 +1767,9 @@ struct wal_dbg_tx_stats {
>  	/* wal pdev resets  */
>  	__le32 pdev_resets;
>  
> +	/* frames dropped due to non-availability of stateless TIDs */
> +	__le32 stateless_tid_alloc_failure;
> +
>  	__le32 phy_underrun;

I still wonder if this needs a feature bit. At least you should mention
in the commit log why it's not needed.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
