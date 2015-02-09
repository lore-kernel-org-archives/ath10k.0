Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YKxEq-0007Br-63
 for ath10k@lists.infradead.org; Mon, 09 Feb 2015 22:55:32 +0000
Message-ID: <54D93A88.8090609@codeaurora.org>
Date: Mon, 09 Feb 2015 14:54:00 -0800
From: Peter Oh <poh@codeaurora.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/2] ath10k: Increase copy engine entries for rx wmi
References: <1423460814-2767-1-git-send-email-rmanohar@qti.qualcomm.com>
 <1423460814-2767-2-git-send-email-rmanohar@qti.qualcomm.com>
In-Reply-To: <1423460814-2767-2-git-send-email-rmanohar@qti.qualcomm.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org


On 02/08/2015 09:46 PM, Rajkumar Manoharan wrote:
> Having lower number of copy engine entries for target to host
> WMI ring is causing drops in receiving management frames. This
> issue is observed during max clients (128 clients) stress testing.
> While bursting deauthentication frames from simulated clients,
> approx. 70% of frames are getting dropped due to lower ring entries.
>
> Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
> ---
>   drivers/net/wireless/ath/ath10k/pci.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/pci.c
> b/drivers/net/wireless/ath/ath10k/pci.c
> index e6972b0..f3174a6 100644
> --- a/drivers/net/wireless/ath/ath10k/pci.c
> +++ b/drivers/net/wireless/ath/ath10k/pci.c
> @@ -113,7 +113,7 @@ static const struct ce_attr host_ce_config_wlan[] = {
>   		.flags = CE_ATTR_FLAGS,
>   		.src_nentries = 0,
>   		.src_sz_max = 2048,
> -		.dest_nentries = 32,
> +		.dest_nentries = 128,
>   	},
>   
>   	/* CE3: host->target WMI */
> @@ -183,7 +183,7 @@ static const struct ce_pipe_config
> target_ce_config_wlan[] = {
>   	{
>   		.pipenum = __cpu_to_le32(2),
>   		.pipedir = __cpu_to_le32(PIPEDIR_IN),
> -		.nentries = __cpu_to_le32(32),
> +		.nentries = __cpu_to_le32(64),
Could you explain why the value of nentries are different?
>   		.nbytes_max = __cpu_to_le32(2048),
>   		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
>   		.reserved = __cpu_to_le32(0),
Thanks,
Peter

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
