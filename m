Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bqxy7-0005hZ-EV
 for ath10k@lists.infradead.org; Mon, 03 Oct 2016 07:47:23 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: cache calibration data when the core is stopped.
Date: Mon, 3 Oct 2016 07:46:54 +0000
Message-ID: <87fuodswlu.fsf@kamboji.qca.qualcomm.com>
References: <1473801118-103112-1-git-send-email-mfaltesek@google.com>
In-Reply-To: <1473801118-103112-1-git-send-email-mfaltesek@google.com> (Marty
 Faltesek's message of "Tue, 13 Sep 2016 17:11:58 -0400")
Content-Language: en-US
Content-ID: <E59F89E19B75314F8A1E6A300B9ED172@qualcomm.com>
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
To: Marty Faltesek <mfaltesek@google.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Marty Faltesek <mfaltesek@google.com> writes:

> Caching calibration data allows it to be accessed when the
> device is not active.
>
> Signed-off-by: Marty Faltesek <mfaltesek@google.com>

No comma in the title, please.

What tree did you use as the baseline? This doesn't seem to apply to
ath.git:

Applying: ath10k: cache calibration data when the core is stopped.
fatal: sha1 information is lacking or useless (drivers/net/wireless/ath/ath10k/core.c).
Repository lacks necessary blobs to fall back on 3-way merge.
Cannot fall back to three-way merge.
Patch failed at 0001 ath10k: cache calibration data when the core is stopped.

> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -1227,6 +1227,42 @@ success:
>  	return 0;
>  }
>  
> +int
> +ath10k_cal_data_alloc(struct ath10k *ar, void **buf)
> +{
> +	u32 hi_addr;
> +	__le32 addr;
> +	int ret;

I think this function should be in debug.c. That way the code is not
wasting memory if DEBUGFS is disabled. 

> +	vfree(*buf);
> +	*buf = vmalloc(QCA988X_CAL_DATA_LEN);
> +	if (!*buf) {
> +		return -EAGAIN;
> +	}

Is it really necessary to allocate memory every time? What if allocate
it only once when module is loaded, just like with
ar->debug.fw_crash_data?

Also please note that this patch (which I'm queuing to 4.9) touches the
same area:

ath10k: fix debug cal data file

https://patchwork.kernel.org/patch/9340953/

> +	hi_addr = host_interest_item_address(HI_ITEM(hi_board_data));
> +
> +	ret = ath10k_hif_diag_read(ar, hi_addr, &addr, sizeof(addr));
> +
> +	if (ret) {
> +		ath10k_warn(ar, "failed to read hi_board_data address: %d\n", ret);
> +	} else {
> +		ret = ath10k_hif_diag_read(ar, le32_to_cpu(addr), *buf,
> +					   QCA988X_CAL_DATA_LEN);
> +		if (ret) {
> +			ath10k_warn(ar, "failed to read calibration data: %d\n", ret);
> +		}
> +	}

We try to avoid using else branches so that only error handling is
indented and the main code flow is not.

> +	/*
> +	 * We are up now, so no need to cache calibration data.
> +	 */
> +	vfree(ar->cal_data);
> +        ar->cal_data = NULL;

Indentation looks wrongs here.

> @@ -1757,6 +1799,11 @@ void ath10k_core_stop(struct ath10k *ar)
>  	lockdep_assert_held(&ar->conf_mutex);
>  	ath10k_debug_stop(ar);
>  
> +	/*
> +	 * Cache caclibration data while stopped.
> +	 */
> +	ath10k_cal_data_alloc(ar, &ar->cal_data);

I like the idea that the calibration data is copied during stop(), but
can you do this from debug.c? For example, add ath10k_debug_stop() and
call it from there? I don't think any of this should be in core.c.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
