Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nat-hk.nvidia.com ([203.18.50.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHwNx-0005hK-Sf
 for ath10k@lists.infradead.org; Mon, 14 Sep 2020 21:51:58 +0000
From: Saeed Mahameed <saeedm@nvidia.com>
Subject: Re: [PATCH] ath10k: sdio: remove reduntant check in for loop
Date: Mon, 14 Sep 2020 21:51:32 +0000
Message-ID: <c2987351e3bdad16510dd35847991c2412a9db6b.camel@nvidia.com>
References: <20200914191925.24192-1-alex.dewar90@gmail.com>
In-Reply-To: <20200914191925.24192-1-alex.dewar90@gmail.com>
Content-Language: en-US
Content-ID: <DD61C5C93AC8A24C9E211633178BB564@namprd12.prod.outlook.com>
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
To: "alex.dewar90@gmail.com" <alex.dewar90@gmail.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "kuba@kernel.org" <kuba@kernel.org>, "davem@davemloft.net" <davem@davemloft.net>, "kvalo@codeaurora.org" <kvalo@codeaurora.org>

On Mon, 2020-09-14 at 20:19 +0100, Alex Dewar wrote:
> The for loop checks whether cur_section is NULL on every iteration,
> but
> we know it can never be NULL as there is another check towards the
> bottom of the loop body. Remove this unnecessary check.
> 
> Also change i to start at 1, so that we don't need an extra +1 wheno
> we
> use it.
> 
> Addresses-Coverity: 1496984 ("Null pointer dereferences)
> Signed-off-by: Alex Dewar <alex.dewar90@gmail.com>
> ---
>  drivers/net/wireless/ath/ath10k/sdio.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/sdio.c
> b/drivers/net/wireless/ath/ath10k/sdio.c
> index 81ddaafb6721..f31ab2ec2c48 100644
> --- a/drivers/net/wireless/ath/ath10k/sdio.c
> +++ b/drivers/net/wireless/ath/ath10k/sdio.c
> @@ -2308,7 +2308,7 @@ static int
> ath10k_sdio_dump_memory_section(struct ath10k *ar,
>  
>  	count = 0;
>  
> -	for (i = 0; cur_section; i++) {
> +	for (i = 1; ; i++) {
'i' is only referenced once inside the loop to check boundary,

the loop is actually iterating over cur_section, so i would make it
clear in the loop statement, e.g.:
Remove the break condition and the cur_section assignment at the end of
the loop and use the loop statement to do it for you

for (; cur_section; cur_section = next_section)


>  		section_size = cur_section->end - cur_section->start;
>  
>  		if (section_size <= 0) {
> @@ -2318,7 +2318,7 @@ static int
> ath10k_sdio_dump_memory_section(struct ath10k *ar,
>  			break;
>  		}
>  
> -		if ((i + 1) == mem_region->section_table.size) {

And for i you can just increment it inline:
if (++i == ...)
    

> +		if (i == mem_region->section_table.size) {
>  			/* last section */
>  			next_section = NULL;
>  			skip_size = 0;
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
