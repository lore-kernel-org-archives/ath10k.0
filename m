Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQCSe-0003ZI-GY
 for ath10k@lists.infradead.org; Wed, 19 Mar 2014 09:06:57 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2] ath10k: add soft/hard firmware crash option to
 simulate_fw_crash
References: <20140313082431.10798.10888.stgit@potku.adurom.net>
Date: Wed, 19 Mar 2014 11:06:19 +0200
In-Reply-To: <20140313082431.10798.10888.stgit@potku.adurom.net> (Kalle Valo's
 message of "Thu, 13 Mar 2014 10:24:31 +0200")
Message-ID: <87pplih81g.fsf@kamboji.qca.qualcomm.com>
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
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Hi Dan,

Kalle Valo <kvalo@qca.qualcomm.com> writes:

> From: Marek Puzyniak <marek.puzyniak@tieto.com>
>
> Command WMI_FORCE_FW_HANG_CMDID is not supported in firmware 10.1.
> In order to have firmware crash simulation functionality also
> in firmware 10.1 driver can force firmware crash by performing not allowed
> operation. Driver can deliberately crash firmware when setting vdev param for
> vdev id out of range.  This patch introduces two keywords to simulate_fw_crash:
>
> 'soft' which will cause firmware crash that is recoverable
>        by warm firmware reset but supported only in main firmware.
> 'hard' which will cause firmware crash recoverable by cold
>        firmware reset, this option works for both firmwares.
>
> Commands to trigger firmware soft/hard crash:
>
> echo 'soft' > /sys/kernel/debug/ieee80211/phyX/ath10k/simulate_fw_crash
> echo 'hard' > /sys/kernel/debug/ieee80211/phyX/ath10k/simulate_fw_crash
>
> kvalo: use strncmp(), remove '\n' before checking the command and
> document how buf is null terminated
>
> Signed-off-by: Marek Puzyniak <marek.puzyniak@tieto.com>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

[...]

> @@ -479,14 +488,30 @@ static ssize_t ath10k_write_simulate_fw_crash(struct file *file,
>  		goto exit;
>  	}
>  
> -	ath10k_info("simulating firmware crash\n");
> +	/* drop the possible '\n' from the end */
> +	if (buf[count - 1] == '\n') {
> +		buf[count - 1] = 0;
> +		count--;
> +	}
>  
> -	ret = ath10k_wmi_force_fw_hang(ar, WMI_FORCE_FW_HANG_ASSERT, 0);
> -	if (ret)
> -		ath10k_warn("failed to force fw hang (%d)\n", ret);
> +	if (!strncmp(buf, "soft", sizeof(buf))) {
> +		ath10k_info("simulating soft firmware crash\n");
> +		ret = ath10k_wmi_force_fw_hang(ar, WMI_FORCE_FW_HANG_ASSERT, 0);
> +	} else if (!strncmp(buf, "hard", sizeof(buf))) {
> +		ath10k_info("simulating hard firmware crash\n");
> +		ret = ath10k_wmi_vdev_set_param(ar, TARGET_NUM_VDEVS + 1,
> +					ar->wmi.vdev_param->rts_threshold, 0);
> +	} else {
> +		ret = -EINVAL;
> +		goto exit;
> +	}

Fengguan's buildbot got warnings here and I assume they are coming from
smatch:

drivers/net/wireless/ath/ath10k/debug.c:500 ath10k_write_simulate_fw_crash() error: strncmp() '"hard"' too small (5 vs 32)
drivers/net/wireless/ath/ath10k/debug.c:497 ath10k_write_simulate_fw_crash() error: strncmp() '"soft"' too small (5 vs 32)

I wanted to use strncmp() instead of strcmp(), but I'm not sure what to
do here. In my opinion it's guaranteed that the string "hard" is null
terminated, so it shouldn't matter even if strlen("soft") (5) is less
than sizeof(buf) (32), right? Or am I missing something here?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
