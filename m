Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VPAqh-0005kq-BQ
 for ath10k@lists.infradead.org; Thu, 26 Sep 2013 12:39:15 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 05/13] ath10k: split ath10k_wmi_service_ready_event_rx
References: <1380187792-25626-1-git-send-email-bartosz.markowski@tieto.com>
 <1380187792-25626-6-git-send-email-bartosz.markowski@tieto.com>
Date: Thu, 26 Sep 2013 15:38:39 +0300
In-Reply-To: <1380187792-25626-6-git-send-email-bartosz.markowski@tieto.com>
 (Bartosz Markowski's message of "Thu, 26 Sep 2013 11:29:44 +0200")
Message-ID: <8761tnrc4w.fsf@kamboji.qca.qualcomm.com>
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
To: Bartosz Markowski <bartosz.markowski@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Bartosz Markowski <bartosz.markowski@tieto.com> writes:

> Since the both firmwares we are going to support,
> have significantly different APIs (WMI and shared
> structures), it's easier to actually split the whole
> event handling functions, instead cutting them inside.
>
> The fork starts now on ath10k_wmi_process_rx().
>
> Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>

[...]

> +	complete(&ar->wmi.service_ready);
> +}
> +
> +
>  static int ath10k_wmi_ready_event_rx(struct ath10k *ar, struct sk_buff *skb)

Only one empty line between functions.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
