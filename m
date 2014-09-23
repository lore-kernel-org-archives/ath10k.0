Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XWPcj-0002FI-M7
 for ath10k@lists.infradead.org; Tue, 23 Sep 2014 12:55:18 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/3] ath10k:  use 64-bit vdev map.
References: <1411149890-12618-1-git-send-email-greearb@candelatech.com>
Date: Tue, 23 Sep 2014 15:54:31 +0300
In-Reply-To: <1411149890-12618-1-git-send-email-greearb@candelatech.com>
 (greearb@candelatech.com's message of "Fri, 19 Sep 2014 11:04:48
 -0700")
Message-ID: <878ulaebug.fsf@kamboji.qca.qualcomm.com>
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
> This can allow more than 32 stations to be supported
> without over-running the bitmap.
>
> Signed-off-by: Ben Greear <greearb@candelatech.com>

[...]

> -	ar->monitor_vdev_id = bit - 1;
> +	ar->monitor_vdev_id = bit;

[...]

> -	arvif->vdev_id = bit - 1;
> +	ath10k_warn(ar, "Creating vdev id: %i  map: %llu\n",
> +		    bit, ar->free_vdev_map);
> +
> +	arvif->vdev_id = bit;

Why remove the "- 1"? Are you sure that's not going to break any
assumptions somewhere?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
