Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bhAzM-0002fO-DF
 for ath10k@lists.infradead.org; Tue, 06 Sep 2016 07:40:13 +0000
From: "Manoharan, Rajkumar" <rmanohar@qti.qualcomm.com>
Subject: Re: [PATCH] ath10k:  ensure pdev sta kickout threshold is set.
Date: Tue, 6 Sep 2016 07:39:42 +0000
Message-ID: <1473147582638.99419@qti.qualcomm.com>
References: <1472843202-12428-1-git-send-email-greearb@candelatech.com>
In-Reply-To: <1472843202-12428-1-git-send-email-greearb@candelatech.com>
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
To: "greearb@candelatech.com" <greearb@candelatech.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Rajkumar Manoharan <rmanohar@codeaurora.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>

[...]

> +int ath10k_mac_set_pdev_kickout(struct ath10k *ar)
> +{
> +       u32 param = ar->wmi.pdev_param->sta_kickout_th;
> +       int rv;
> +
> +       rv = ath10k_wmi_pdev_set_param(ar, param,
> +                                      ar->sta_xretry_kickout_thresh);
> +       if (rv) {
> +               ath10k_warn(ar, "failed to set sta kickout threshold to %d: %d\n",
> +                           ar->sta_xretry_kickout_thresh, rv);
> +       }
> +       return rv;
> +}
>
Ben,

I plan to get rid of setting station kickout threshold from host. Each firmware revision (i.e qca988x, qca99x0, ipq4019)  follows different logic based on hw capability for station kickout and follows different default paramters. So configuring common threshold will affect firmware logic. Better to get rid of these configuration from host driver and let firmware to work with default parameters.

Also I could not find out sta_xretry_kickout_thresh definition in upstream driver. Have you posted any changes for the same?

-Rajkumar
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
