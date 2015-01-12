Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YAeYD-0005wd-2g
 for ath10k@lists.infradead.org; Mon, 12 Jan 2015 12:56:57 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: add additional fw build version to info print
References: <1420716572-23826-1-git-send-email-michal.kazior@tieto.com>
Date: Mon, 12 Jan 2015 14:56:23 +0200
In-Reply-To: <1420716572-23826-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Thu, 8 Jan 2015 12:29:32 +0100")
Message-ID: <87vbkccg3s.fsf@kamboji.qca.qualcomm.com>
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

Michal Kazior <michal.kazior@tieto.com> writes:

> The wmi-tlv firmware contains additional
> versioning info. It may help reporting/debugging.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

[...]

>  void ath10k_print_driver_info(struct ath10k *ar)
>  {
> -	ath10k_info(ar, "%s (0x%08x, 0x%08x) fw %s api %d htt %d.%d wmi %d cal %s max_sta %d\n",
> +	ath10k_info(ar, "%s (0x%08x, 0x%08x) fw %s api %d htt %d.%d wmi %d cal %s max_sta %d build %u.%u.%u.%u\n",
>  		    ar->hw_params.name,
>  		    ar->target_version,
>  		    ar->chip_id,
> @@ -134,7 +134,11 @@ void ath10k_print_driver_info(struct ath10k *ar)
>  		    ar->htt.target_version_minor,
>  		    ar->wmi.op_version,
>  		    ath10k_cal_mode_str(ar->cal_mode),
> -		    ar->max_num_stations);
> +		    ar->max_num_stations,
> +		    ar->fw_build_major,
> +		    ar->fw_build_minor,
> +		    ar->fw_build_si,
> +		    ar->fw_build_crm);

So now we print two different firmware versions to the user? That's just
confusing. It's ok to print this build id in debug level, but not in
info level. From user's point of view we should have only one firmware
version.

I would rather make sure that ATH10K_FW_IE_FW_VERSION always contains
the correct version string and then developers map whatever they need
from that string.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
