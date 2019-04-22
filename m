Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out-tai-01.qualcomm.com ([103.229.16.226])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hIQY0-0006GU-Kz
 for ath10k@lists.infradead.org; Mon, 22 Apr 2019 04:27:18 +0000
Subject: RE: [PATCH v2] ath10k: Remove ATH10K_STATE_RESTARTED in simulate fw
 crash
From: Wen Gong <wgong@qti.qualcomm.com>
Date: Mon, 22 Apr 2019 04:27:09 +0000
Message-ID: <8db13f128fc345a9a7d0a021d19cf9cf@aptaiexm02f.ap.qualcomm.com>
References: <1555059170-11988-1-git-send-email-wgong@codeaurora.org>
In-Reply-To: <1555059170-11988-1-git-send-email-wgong@codeaurora.org>
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
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Wen Gong <wgong@codeaurora.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>

> -----Original Message-----
> From: ath10k <ath10k-bounces@lists.infradead.org> On Behalf Of Wen Gong
> Sent: Friday, April 12, 2019 4:53 PM
> To: ath10k@lists.infradead.org
> Cc: linux-wireless@vger.kernel.org
> Subject: [EXT] [PATCH v2] ath10k: Remove ATH10K_STATE_RESTARTED in
> simulate fw crash
> @@ -554,6 +555,9 @@ static ssize_t ath10k_write_simulate_fw_crash(struct
> +	sscanf(buf, "%s %s", buf_cmd, buf_flag);
> +	ath10k_info(ar, "buf_cmd:%s, buf_flag:%s\n", buf_cmd, buf_flag);
> +
> +	wait_ready =3D !strcmp(buf_cmd, "wait-ready");
>  	mutex_lock(&ar->conf_mutex);
> =

> -	if (ar->state !=3D ATH10K_STATE_ON &&
> -	    ar->state !=3D ATH10K_STATE_RESTARTED) {
> +	if ((!wait_ready &&
> +	     ar->state !=3D ATH10K_STATE_ON &&
> +	     ar->state !=3D ATH10K_STATE_RESTARTED) ||
> +	    (wait_ready &&
> +	     ar->state !=3D ATH10K_STATE_ON)) {
>  		ret =3D -ENETDOWN;
>  		goto exit;
>  	}
> =


Hi Micha=B3,

Do you have any comments for the patch v2?

> 1.9.1
> =

> =

> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
