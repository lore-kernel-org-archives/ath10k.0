Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XvLiX-0003Fj-6E
 for ath10k@lists.infradead.org; Mon, 01 Dec 2014 07:48:21 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 1/3] ath10k: create a chip revision whielist
References: <1416838646-18801-1-git-send-email-michal.kazior@tieto.com>
 <1417418266-21974-1-git-send-email-michal.kazior@tieto.com>
Date: Mon, 1 Dec 2014 09:47:33 +0200
In-Reply-To: <1417418266-21974-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Mon, 1 Dec 2014 08:17:44 +0100")
Message-ID: <8761dvreui.fsf@kamboji.qca.qualcomm.com>
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

> This will make it easier to extend and maintain
> list of supported hardware.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

I fixed a typo: s/whielist/whitelist/

> --- a/drivers/net/wireless/ath/ath10k/core.h
> +++ b/drivers/net/wireless/ath/ath10k/core.h
> @@ -479,7 +479,6 @@ struct ath10k {
>  		u32 id;
>  		const char *name;
>  		u32 patch_load_addr;
> -
>  		struct ath10k_hw_params_fw {
>  			const char *dir;
>  			const char *fw;

I removed this unnecessary change:

https://github.com/kvalo/ath/commit/bfa7b7948acaf7063cf4d664393b7f7a1c53b2e4

Because of my change there was also a simple conflict in patch 3:

https://github.com/kvalo/ath/commit/3487683c94495b6e0bbb1f3b19b3987b4ca2ff1f

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
