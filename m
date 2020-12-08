Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-15.mailgun.net ([69.72.43.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmYKA-0005ep-63
 for ath10k@lists.infradead.org; Tue, 08 Dec 2020 08:26:21 +0000
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCH v2] ath10k: skip the wait for completion to recovery in
 shutdown path
Date: Tue,  8 Dec 2020 13:55:24 +0530
Message-Id: <20201208082524.20451-1-saiprakash.ranjan@codeaurora.org>
In-Reply-To: <20201126171553.2097-1-youghand@codeaurora.org>
References: <20201126171553.2097-1-youghand@codeaurora.org>
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
To: youghand@codeaurora.org
Cc: kuabhs@chromium.org, Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>, briannorris@chromium.org, linux-wireless@vger.kernel.org, dianders@chromium.org, ath10k@lists.infradead.org, linux-kernel@vger.kernel.org, pillair@codeaurora.org

On Thu, Nov 26, 2020 at 9:16 AM Youghandhar Chintala
<youghand@codeaurora.org> wrote:
> --- a/drivers/net/wireless/ath/ath10k/snoc.c
> +++ b/drivers/net/wireless/ath/ath10k/snoc.c
> @@ -1790,9 +1790,6 @@ static int ath10k_snoc_remove(struct platform_device *pdev)
>
>         reinit_completion(&ar->driver_recovery);
>
> -       if (test_bit(ATH10K_SNOC_FLAG_RECOVERY, &ar_snoc->flags))
> -               wait_for_completion_timeout(&ar->driver_recovery, 3 * HZ);

You are skipping recovery in ath10k_snoc_remove() which is a remove callback
and also called in shutdown callback. So that means it is also called when
you unload the ath10k module and not just when the system reboots/shutdown.
While it makes sense to not skip recovery in shutdown/reboot sequence because
the system is going down, it might very well be needed in case of unloading
the module because we expect the system to be up and stable after unloading
the ath10k module and we should be able to reload the ath10k module smoothly.

If you remove that now and try to reload the ath10k module, won't that leave
the system in possibly an inconsistent state because we skipped recovery in
module remove and then we are trying to load the ath10k module when the
recovery is not yet complete? In other words, you need to test ath10k module
load/unload as well in addition to reboot tests to make sure this works as
expected or else you will need a separate shutdown callback which skips the
recovery part.

Thanks,
Sai
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
