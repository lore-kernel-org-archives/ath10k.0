Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WS30a-0004iH-N2
 for ath10k@lists.infradead.org; Mon, 24 Mar 2014 11:25:37 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 3/3] ath10k:  add otp and firmware boot error messages.
References: <1395428150-31996-1-git-send-email-greearb@candelatech.com>
 <1395428150-31996-3-git-send-email-greearb@candelatech.com>
Date: Mon, 24 Mar 2014 13:25:09 +0200
In-Reply-To: <1395428150-31996-3-git-send-email-greearb@candelatech.com>
 (greearb@candelatech.com's message of "Fri, 21 Mar 2014 11:55:50
 -0700")
Message-ID: <87siq76dpm.fsf@kamboji.qca.qualcomm.com>
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
To: greearb@candelatech.com
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

greearb@candelatech.com writes:

> From: Ben Greear <greearb@candelatech.com>
>
> If OTP or firmware fails to load properly, print out some
> extra info in the kernel logs.
>
> Signed-off-by: Ben Greear <greearb@candelatech.com>

[...]

> @@ -597,12 +598,16 @@ static int ath10k_init_download_firmware(struct ath10k *ar)
>  		return ret;
>  
>  	ret = ath10k_download_and_run_otp(ar);
> -	if (ret)
> +	if (ret) {
> +		ath10k_err("boot otp execute result %d\n", ret);
>  		return ret;
> +	}

"failed to run otp: %d\n"

>  	ret = ath10k_download_fw(ar);
> -	if (ret)
> +	if (ret) {
> +		ath10k_err("boot download firmware result %d\n", ret);
>  		return ret;
> +	}

"failed to download firmware: %d\n"

And I think you should add the same for ath10k_download_board_data()
call before these two, it neither prints anything when an error happens.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
