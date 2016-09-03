Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bgDun-0002cn-QF
 for ath10k@lists.infradead.org; Sat, 03 Sep 2016 16:35:34 +0000
Subject: Re: [PATCH] ath10k: fix memory leak on caldata on error exit path
References: <1471268785-11576-1-git-send-email-colin.king@canonical.com>
 <87r392z4ox.fsf@kamboji.qca.qualcomm.com>
From: Colin Ian King <colin.king@canonical.com>
Message-ID: <4e586d21-51cf-768c-4aee-9b0a147f1183@canonical.com>
Date: Sat, 3 Sep 2016 17:33:40 +0100
MIME-Version: 1.0
In-Reply-To: <87r392z4ox.fsf@kamboji.qca.qualcomm.com>
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
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 02/09/16 16:45, Valo, Kalle wrote:
> Colin King <colin.king@canonical.com> writes:
> 
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> caldata is not being free'd on the error exit path, causing
>> a memory leak. kfree it to fix the leak.
>>
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>  drivers/net/wireless/ath/ath10k/pci.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
>> index 9a22c47..886337c 100644
>> --- a/drivers/net/wireless/ath/ath10k/pci.c
>> +++ b/drivers/net/wireless/ath/ath10k/pci.c
>> @@ -2725,6 +2725,7 @@ static int ath10k_pci_hif_fetch_cal_eeprom(struct ath10k *ar, void **data,
>>  	return 0;
>>  
>>  err_free:
>> +	kfree(caldata);
>>  	kfree(data);
>>  
>>  	return -EINVAL;
> 
> I don't think we should free data at all:
> 
> static int ath10k_download_cal_eeprom(struct ath10k *ar)
> {
> 	size_t data_len;
> 	void *data = NULL;
> 	int ret;
> 
> 	ret = ath10k_hif_fetch_cal_eeprom(ar, &data, &data_len);
> 
> Instead we should free only caldata, right?
> 
Yep, good catch, I'll send V2 later.

Colin

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
