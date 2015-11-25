Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nm.newmedia-net.de ([217.113.179.122]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a1aR5-0007lf-Lg
 for ath10k@lists.infradead.org; Wed, 25 Nov 2015 13:48:41 +0000
References: <20151125133654.25507.10863.stgit@potku.adurom.net>
 <20151125133804.25507.64575.stgit@potku.adurom.net>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <5655BC23.20105@dd-wrt.com>
Date: Wed, 25 Nov 2015 14:48:19 +0100
MIME-Version: 1.0
In-Reply-To: <20151125133804.25507.64575.stgit@potku.adurom.net>
Subject: Re: [PATCH 1/6] ath10k: fix otp board id error message
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
To: ath10k@lists.infradead.org

but consider to ignore the result. this code will still fail on all IPQ 
SOC's with embedded QCA99XX cards.
they do not contain any valid otp and this function will always fail. so 
the result must be ignored.
this problem has been seen on Linksys EA8500, Netgear R7500 and Trendnet 
TEW827
so far all router based solutions using QCA99XX are affected


Am 25.11.2015 um 14:38 schrieb Kalle Valo:
> We check board id from all board types, not just qca99x0, so the error message
> was misleading.
>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
> ---
>   drivers/net/wireless/ath/ath10k/core.c |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
> index f128adbae454..78fe1863ad04 100644
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -1753,7 +1753,7 @@ static int ath10k_core_probe_fw(struct ath10k *ar)
>   
>   	ret = ath10k_core_get_board_id_from_otp(ar);
>   	if (ret && ret != -EOPNOTSUPP) {
> -		ath10k_err(ar, "failed to get board id from otp for qca99x0: %d\n",
> +		ath10k_err(ar, "failed to get board id from otp: %d\n",
>   			   ret);
>   		return ret;
>   	}
>
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k
>


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
