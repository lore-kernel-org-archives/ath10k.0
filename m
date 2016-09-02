Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bfqet-00073j-Hb
 for ath10k@lists.infradead.org; Fri, 02 Sep 2016 15:45:37 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: fix memory leak on caldata on error exit path
Date: Fri, 2 Sep 2016 15:45:09 +0000
Message-ID: <87r392z4ox.fsf@kamboji.qca.qualcomm.com>
References: <1471268785-11576-1-git-send-email-colin.king@canonical.com>
In-Reply-To: <1471268785-11576-1-git-send-email-colin.king@canonical.com>
 (Colin King's message of "Mon, 15 Aug 2016 14:46:25 +0100")
Content-Language: en-US
Content-ID: <B6808281641328458EF5B7FC91C3B26E@qualcomm.com>
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
To: Colin King <colin.king@canonical.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Colin King <colin.king@canonical.com> writes:

> From: Colin Ian King <colin.king@canonical.com>
>
> caldata is not being free'd on the error exit path, causing
> a memory leak. kfree it to fix the leak.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/net/wireless/ath/ath10k/pci.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
> index 9a22c47..886337c 100644
> --- a/drivers/net/wireless/ath/ath10k/pci.c
> +++ b/drivers/net/wireless/ath/ath10k/pci.c
> @@ -2725,6 +2725,7 @@ static int ath10k_pci_hif_fetch_cal_eeprom(struct ath10k *ar, void **data,
>  	return 0;
>  
>  err_free:
> +	kfree(caldata);
>  	kfree(data);
>  
>  	return -EINVAL;

I don't think we should free data at all:

static int ath10k_download_cal_eeprom(struct ath10k *ar)
{
	size_t data_len;
	void *data = NULL;
	int ret;

	ret = ath10k_hif_fetch_cal_eeprom(ar, &data, &data_len);

Instead we should free only caldata, right?

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
