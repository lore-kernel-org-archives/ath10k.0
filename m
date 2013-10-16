Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VWNGX-0002ff-NN
 for ath10k@lists.infradead.org; Wed, 16 Oct 2013 09:19:42 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 2/7] ath10k: add sanity checks for monitor management
References: <1381858196-17000-1-git-send-email-michal.kazior@tieto.com>
 <1381858196-17000-3-git-send-email-michal.kazior@tieto.com>
Date: Wed, 16 Oct 2013 12:19:09 +0300
In-Reply-To: <1381858196-17000-3-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Tue, 15 Oct 2013 10:29:51 -0700")
Message-ID: <87siw17euq.fsf@kamboji.qca.qualcomm.com>
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

> Add a few checks and warnings to make it easier to
> track any kind of monitor vdev mismanagement.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

[...]

> +	if (!ar->monitor_present) {
> +		ath10k_warn("mac montor stop -- monitor is not present\n");
> +		return -EINVAL;
> +	}

[...]

> +	if (!ar->monitor_present) {
> +		ath10k_warn("mac montor stop -- monitor is not present\n");
> +		return -EINVAL;
> +	}
> +
> +	if (!ar->monitor_enabled) {
> +		ath10k_warn("mac montor stop -- monitor is not enabled\n");
> +		return -EINVAL;
> +	}

s/montor/monitor/

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
