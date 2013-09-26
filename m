Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VP7V9-0007lr-9V
 for ath10k@lists.infradead.org; Thu, 26 Sep 2013 09:04:47 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 07/13] ath10k: implement host memory chunks
References: <1380101891-18312-1-git-send-email-bartosz.markowski@tieto.com>
 <1380101891-18312-8-git-send-email-bartosz.markowski@tieto.com>
Date: Thu, 26 Sep 2013 12:04:12 +0300
In-Reply-To: <1380101891-18312-8-git-send-email-bartosz.markowski@tieto.com>
 (Bartosz Markowski's message of "Wed, 25 Sep 2013 11:38:05 +0200")
Message-ID: <87k3i4rm2b.fsf@kamboji.qca.qualcomm.com>
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

> 10.X firmware can request a memory pool from host to offload
> it's own resources. This is a feature designed especially
> for AP mode where the target has to deal with large number
> of peers.
>
> So we allocate and map a consistent DMA memory which FW can
> use to store e.g. peer rate contol maps.
>
> Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>

[...]

> +		if (num_unit_info) {
> +			if (num_unit_info & NUM_UNITS_IS_NUM_PEERS)
> +				/* number of units to allocate is number of
> +				 * peers, 1 extra for self peer on target */
> +				/* this needs to be tied, host and target
> +				 * can get out of sync */
> +				num_units = TARGET_NUM_PEERS + 1;
> +			if (num_unit_info & NUM_UNITS_IS_NUM_VDEVS)
> +				num_units = TARGET_NUM_VDEVS + 1;
> +		}

The outer if test looks useless. I think this can be simplified to just:

if (num_unit_info & NUM_UNITS_IS_NUM_PEERS)
        ....
else if (num_unit_info & NUM_UNITS_IS_NUM_VDEVS)
        ...

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
