Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XGBJm-0005Mb-L7
 for ath10k@lists.infradead.org; Sat, 09 Aug 2014 18:24:39 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 2/6] ath10k: remove target soc ps code
References: <1407402212-29809-1-git-send-email-michal.kazior@tieto.com>
 <1407402212-29809-3-git-send-email-michal.kazior@tieto.com>
 <87ha1lttgh.fsf@kamboji.qca.qualcomm.com>
Date: Sat, 9 Aug 2014 21:24:09 +0300
In-Reply-To: <87ha1lttgh.fsf@kamboji.qca.qualcomm.com> (Kalle Valo's message
 of "Sat, 09 Aug 2014 21:21:18 +0300")
Message-ID: <87d2c9ttbq.fsf@kamboji.qca.qualcomm.com>
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

Kalle Valo <kvalo@qca.qualcomm.com> writes:

>> @@ -1915,7 +1870,6 @@ static int ath10k_pci_warm_reset(struct ath10k *ar)
>>  
>>  	ath10k_dbg(ATH10K_DBG_BOOT, "boot warm reset complete\n");
>>  
>> -	ath10k_do_pci_sleep(ar);
>>  	return ret;
>>  }
>
> For some reason I don't get all kbuild emails, and I don't know if you
> got it either, but smatch found a style error here:
>
>>> drivers/net/wireless/ath/ath10k/pci.c:1797:5-8: Unneeded variable: "ret". Return "0" on line 1873

Forgot the link to the mail:

https://lists.01.org/pipermail/kbuild/2014-August/001684.html

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
