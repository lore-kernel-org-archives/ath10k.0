Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V9xK8-0005RE-7O
 for ath10k@lists.infradead.org; Thu, 15 Aug 2013 13:10:47 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/3] ath10k: clean up HTT tx tid handling
References: <1375949298-7159-1-git-send-email-michal.kazior@tieto.com>
 <1376036014-29707-1-git-send-email-michal.kazior@tieto.com>
 <1376036014-29707-2-git-send-email-michal.kazior@tieto.com>
Date: Thu, 15 Aug 2013 16:07:28 +0300
In-Reply-To: <1376036014-29707-2-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Fri, 9 Aug 2013 10:13:32 +0200")
Message-ID: <87haer14rz.fsf@kamboji.qca.qualcomm.com>
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

> The tids weren't mapped really properly. This
> doesn't fix any known bug but seems the right
> thing to do.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

[...]

>  enum htt_data_tx_ext_tid {
> -	HTT_DATA_TX_EXT_TID_NON_QOS_MCAST_BCAST = 16,
> -	HTT_DATA_TX_EXT_TID_MGMT                = 17,
> +	HTT_DATA_TX_EXT_TID_NON_QOS_UNICAST     = 16,
> +	HTT_DATA_TX_EXT_TID_UNUSED              = 17,
> +	HTT_DATA_TX_EXT_TID_NON_QOS_MCAST_BCAST = 18,
> +	HTT_DATA_TX_EXT_TID_MGMT                = 19,
>  	HTT_DATA_TX_EXT_TID_INVALID             = 31
>  };

This doesn't seem to match what firmware uses. We need to investigate
more about this so I drop the patch for now.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
