Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VEcnb-00074H-TY
 for ath10k@lists.infradead.org; Wed, 28 Aug 2013 10:16:28 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: implement per-VDEV FW statistics
References: <1377592996-21934-1-git-send-email-bartosz.markowski@tieto.com>
Date: Wed, 28 Aug 2013 13:15:45 +0300
In-Reply-To: <1377592996-21934-1-git-send-email-bartosz.markowski@tieto.com>
 (Bartosz Markowski's message of "Tue, 27 Aug 2013 10:43:16 +0200")
Message-ID: <87k3j6glym.fsf@kamboji.qca.qualcomm.com>
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

> The WMI_REQUEST_PEER_STAT command with latst (1.0.0.716) FW
> can return per-VDEV statistics. Using debugfs we can fetch this info now.
>
> This is a backward compatible change. In case of older FW the VDEV
> statistics are simply not returned.
>
> Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>

[...]

>  		for (i = 0; i < num_peer_stats; i++) {
> -			peer_stats = (struct wmi_peer_stats *)tmp;
> +			peer_stats = (struct wmi_peer_stats_1 *)tmp;

Oh yeah, you assume here that _v2 struct starts with _v1. That's a bit
dangerous, at least add a comment here saying that.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
