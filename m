Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-bk0-x231.google.com ([2a00:1450:4008:c01::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V7NCj-00067J-Am
 for ath10k@lists.infradead.org; Thu, 08 Aug 2013 10:12:25 +0000
Received: by mail-bk0-f49.google.com with SMTP id r7so922655bkg.22
 for <ath10k@lists.infradead.org>; Thu, 08 Aug 2013 03:12:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1375949813-10969-3-git-send-email-michal.kazior@tieto.com>
References: <1375949813-10969-1-git-send-email-michal.kazior@tieto.com>
 <1375949813-10969-3-git-send-email-michal.kazior@tieto.com>
Date: Thu, 8 Aug 2013 12:12:03 +0200
Message-ID: <CA+BoTQk4n=kiWhwvzieuvXp5Wou_QpkY=8iU474XPwG7P4KSiQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] ath10k: fix HTC endpoint worker starvation
From: Michal Kazior <michal.kazior@tieto.com>
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
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

On 8 August 2013 10:16, Michal Kazior <michal.kazior@tieto.com> wrote:
> HTC used a worker for each endpoint. This worked
> until a slow host machine was flooded with massive
> number of TX requests. HTT related worker would
> remain active while WMI worker was starved. This
> ended up with "could not send beacon" in AP mode.
> It was even possible to see userspace being
> starved.
>
> The patch switches from using workers to using
> tasklets for processing and submitting HTC frames
> to HIF.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
>
> (...)
>
> @@ -602,7 +602,8 @@ static void ath10k_htc_reset_endpoint_states(struct a=
th10k_htc *htc)
>                 skb_queue_head_init(&ep->tx_queue);
>                 ep->htc =3D htc;
>                 ep->tx_credit_flow_enabled =3D true;
> -               INIT_WORK(&ep->send_work, ath10k_htc_send_work);
> +               tasklet_init(&ep->send_task, ath10k_htc_send_task,
> +                             (unsigned long)ep);
>         }
>  }
>

Indentation is off by one here. Is it okay if I just resend this
single patch or is it easier for applying if I resend the whole
patchset?


Pozdrawiam / Best regards,
Micha=B3 Kazior.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
