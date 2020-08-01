Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wout5-smtp.messagingengine.com ([64.147.123.21])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1orU-0000SM-Ks
 for ath10k@lists.infradead.org; Sat, 01 Aug 2020 10:35:33 +0000
Date: Sat, 1 Aug 2020 12:35:09 +0200
From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH] ath10k: enable transmit data ack RSSI for QCA9884
Message-ID: <20200801103509.GB3046974@kroah.com>
References: <20200731094416.5172-1-murugana@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200731094416.5172-1-murugana@codeaurora.org>
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
To: Sathishkumar Muruganandam <murugana@codeaurora.org>
Cc: Balaji Pothunoori <bpothuno@codeaurora.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Abhishek Ambure <aambure@codeaurora.org>, stable@vger.kernel.org, Kalle Valo <kvalo@codeaurora.org>

On Fri, Jul 31, 2020 at 03:14:16PM +0530, Sathishkumar Muruganandam wrote:
> From: Abhishek Ambure <aambure@codeaurora.org>
> 
> commit cc78dc3b790619aa05f22a86a9152986bd73698c upstream.
> 
> This commit fixes the regression caused by
> commit 6ddc3860a566 ("ath10k: add support for ack rssi value of data tx packets")
> in linux-5.4.y branch.
> 
> ath10k_is_rssi_enable() always returns 0 for QCA9984 and this will cause
> the ppdu_info_offset to hold invalid value in ath10k_htt_rx_tx_compl_ind().
> 
> This leads to CE corruption for HTC endpoints to cause WMI command failures
> with insufficient HTC credits. Below warnings are seen due to beacon
> command failure in QCA9984.
> 
> [  675.939638] ath10k_pci 0000:03:00.0: SWBA overrun on vdev 0, skipped old beacon
> [  675.947828] ath10k_pci 0000:04:00.0: SWBA overrun on vdev 1, skipped old beacon
> 
> Tested HW: QCA9984
> Tested FW: 10.4-3.10-00047
> Tested Kernel version: 5.4.22
> 
> Fixes: 6ddc3860a566 ("ath10k: add support for ack rssi value of data tx packets")
> Signed-off-by: Abhishek Ambure <aambure@codeaurora.org>
> Signed-off-by: Balaji Pothunoori <bpothuno@codeaurora.org>
> [kvalo@codeaurora.org: improve commit log]
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
> Signed-off-by: Sathishkumar Muruganandam <murugana@codeaurora.org>
> ---
>  drivers/net/wireless/ath/ath10k/hw.c | 1 +
>  1 file changed, 1 insertion(+)

Now queued up, thanks.

greg k-h

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
