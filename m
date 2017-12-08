Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eNEx9-0006J0-9k
 for ath10k@lists.infradead.org; Fri, 08 Dec 2017 09:28:21 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 2/2] ath10k: search DT for qcom, ath10k-calibration-variant
Date: Fri, 8 Dec 2017 09:27:52 +0000
Message-ID: <87fu8ltvqg.fsf@kamboji.qca.qualcomm.com>
References: <20170310080615.22958-1-sven.eckelmann@openmesh.com>
 <20170310080615.22958-2-sven.eckelmann@openmesh.com>
In-Reply-To: <20170310080615.22958-2-sven.eckelmann@openmesh.com> (Sven
 Eckelmann's message of "Fri, 10 Mar 2017 09:06:15 +0100")
Content-Language: en-US
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
To: Sven Eckelmann <sven.eckelmann@openmesh.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "ext.waldemar.rymarkiewicz@tieto.com" <ext.waldemar.rymarkiewicz@tieto.com>

Sven Eckelmann <sven.eckelmann@openmesh.com> writes:

> Board Data File (BDF) is loaded upon driver boot-up procedure. The right
> board data file is identified on QCA4019 using bus, bmi-chip-id and
> bmi-board-id.
>
> The problem, however, can occur when the (default) board data file cannot
> fulfill with the vendor requirements and it is necessary to use a different
> board data file.
>
> This problem was solved for SMBIOS by adding a special SMBIOS type 0xF8.
> Something similar has to be provided for systems without SMBIOS but with
> device trees. No solution was specified by QCA and therefore a new one has
> to be found for ath10k.
>
> The device tree requires addition strings to define the variant name
>
>     wifi@a000000 {
>     	status = "okay";
>     	qcom,ath10k-calibration-variant = "RT-AC58U";
>     };
>
>     wifi@a800000 {
>     	status = "okay";
>     	qcom,ath10k-calibration-variant = "RT-AC58U";
>     };
>
> This would create the boarddata identifiers for the board-2.bin search
>
>  *  bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=RT-AC58U
>  *  bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=RT-AC58U
>
> Signed-off-by: Sven Eckelmann <sven.eckelmann@openmesh.com>
> ---
> Since RFC:
>
>  - initialize variant pointer to have it initialized to NULL when
>    of_property_read_string fails (thanks Christian Lamparter)
>  - Only print warning that DT doesn't contain string ones (thanks Christian
>    Lamparter)
>  - Split patch in DT doc and ath10k part (thanks Christian Lamparter)
>  - Allow to overwrite the variant string via DT and ignore that SMBIOS had
>    written anything to it

[...]

> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -779,6 +779,25 @@ static int ath10k_core_check_smbios(struct ath10k *ar)
>  	return 0;
>  }
>  
> +static int ath10k_core_check_dt(struct ath10k *ar)
> +{
> +	struct device_node *node;
> +	const char *variant = NULL;
> +
> +	node = ar->dev->of_node;
> +	if (!node)
> +		return -ENOENT;
> +
> +	of_property_read_string(node, "qcom,ath10k-calibration-variant",
> +				&variant);
> +	if (!variant)
> +		return -ENODATA;
> +
> +	strscpy(ar->id.bdf_ext, variant, sizeof(ar->id.bdf_ext));

Kbuild bot found a warning here:

   drivers/net/wireless/ath/ath10k/core.c: In function 'ath10k_core_check_dt':
>> drivers/net/wireless/ath/ath10k/core.c:877:2: warning: ignoring return value of 'strscpy', declared with attribute warn_unused_result [-Wunused-result]
     strscpy(ar->id.bdf_ext, variant, sizeof(ar->id.bdf_ext));
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

I guess warn_unused_result in strscpy() is a recent addition and that's
why you didn't see it.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
