Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qt0-x22a.google.com ([2607:f8b0:400d:c0d::22a])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dGA7F-0000sT-1W
 for ath10k@lists.infradead.org; Wed, 31 May 2017 20:21:14 +0000
Received: by mail-qt0-x22a.google.com with SMTP id f55so21462843qta.3
 for <ath10k@lists.infradead.org>; Wed, 31 May 2017 13:20:52 -0700 (PDT)
Subject: Re: [PATCH] ath10k: add configurable debugging.
References: <20170510211925.17468-1-adrian@freebsd.org>
 <87y3tdmdbo.fsf@kamboji.qca.qualcomm.com>
From: Arend van Spriel <arend.vanspriel@broadcom.com>
Message-ID: <2a6a2af2-29c7-6b74-ead1-c5ae8688a87c@broadcom.com>
Date: Wed, 31 May 2017 22:20:45 +0200
MIME-Version: 1.0
In-Reply-To: <87y3tdmdbo.fsf@kamboji.qca.qualcomm.com>
Content-Language: en-US
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
To: Kalle Valo <kvalo@qca.qualcomm.com>, Adrian Chadd <adrian@freebsd.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 31-05-17 14:16, Kalle Valo wrote:
> Adrian Chadd <adrian@freebsd.org> writes:
> 
>> This adds a few configurable debugging options:
>>
>> * driver debugging and tracing is now configurable per device
>> * driver debugging and tracing is now configurable at runtime
>> * the debugging / tracing is not run at all (besides a mask check)
>>   unless the specific debugging bitmap field is configured.
>>
>> Signed-off-by: Adrian Chadd <adrian@FreeBSD.org>
> 
> [...]
> 
>> --- a/drivers/net/wireless/ath/ath10k/core.c
>> +++ b/drivers/net/wireless/ath/ath10k/core.c
>> @@ -2444,6 +2444,8 @@ struct ath10k *ath10k_core_create(size_t priv_size, struct device *dev,
>>  	ar->hw_rev = hw_rev;
>>  	ar->hif.ops = hif_ops;
>>  	ar->hif.bus = bus;
>> +	ar->debug_mask = ath10k_debug_mask;
>> +	ar->trace_debug_mask = ath10k_debug_mask;
> 
> Until now tracing has been always enabled, irrespective what debug_mask
> has contained. Now you are changing that and by default log messages are
> not delivered through tracing until user enables them. So I think to
> keep the old behaviour trace_debug_mask should be ATH10K_DBG_ANY
> (0xffffffff) by default and the user can modify the mask per device via
> the debugfs file.
> 
> But is it really needed to be able to filter trace messages? debug_mask
> I understand, but not sure about trace_debug_mask.

FWIW, in brcmfmac I decided not to filter trace messages. The overhead
is relatively small and if needed you can pass filter expressions with
trace-cmd record.

Regards,
Arend

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
