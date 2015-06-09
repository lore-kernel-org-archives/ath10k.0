Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2HAL-0005dX-3n
 for ath10k@lists.infradead.org; Tue, 09 Jun 2015 10:53:57 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2] ath10k: remove unused variable 'id' in
 ath10k_pci_tx_pipe_cleanup()
References: <1433230455-11644-1-git-send-email-rmani@qti.qualcomm.com>
Date: Tue, 9 Jun 2015 13:53:31 +0300
In-Reply-To: <1433230455-11644-1-git-send-email-rmani@qti.qualcomm.com> (Raja
 Mani's message of "Tue, 2 Jun 2015 13:04:15 +0530")
Message-ID: <87k2vdf904.fsf@kamboji.qca.qualcomm.com>
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
To: Raja Mani <rmani@qti.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Raja Mani <rmani@qti.qualcomm.com> writes:

> mete_data is extracted from ce descriptor and stored in variable 'id'.
> later, id is not used anywhere in the same function.
>
> Fixes: d84a512dca23 ("ath10k: remove transfer_id from
> ath10k_hif_cb::tx_completion")
>
> Signed-off-by: Raja Mani <rmani@qti.qualcomm.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
