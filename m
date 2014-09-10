Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XRkDx-0007FC-Rx
 for ath10k@lists.infradead.org; Wed, 10 Sep 2014 15:54:27 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: Support firmware crash-by-assert.
References: <1409238957-30625-1-git-send-email-greearb@candelatech.com>
Date: Wed, 10 Sep 2014 18:53:39 +0300
In-Reply-To: <1409238957-30625-1-git-send-email-greearb@candelatech.com>
 (greearb@candelatech.com's message of "Thu, 28 Aug 2014 08:15:57
 -0700")
Message-ID: <87wq9b5v5o.fsf@kamboji.qca.qualcomm.com>
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
> 10.1 firmware does not have an official way to
> cause assert on purpose, but it can be done with
> carefully crafted WMI command.  This is a different
> kind of crash from the 'hard' crash, which is
> a bad memory dereference.
>
> Different crashes decode in different manners, so
> this will help the crash-report testing as well as
> offer better ways to test firmware failure and
> recovery.
>
> Signed-off-by: Ben Greear <greearb@candelatech.com>

[...]

> --- a/drivers/net/wireless/ath/ath10k/wmi.c
> +++ b/drivers/net/wireless/ath/ath10k/wmi.c
> @@ -3725,6 +3725,26 @@ int ath10k_wmi_vdev_install_key(struct ath10k *ar,
>  				   ar->wmi.cmd->vdev_install_key_cmdid);
>  }
>  
> +int ath10k_wmi_vdev_assert(struct ath10k *ar, u32 crashme)
> +{
> +	struct wmi_vdev_install_key_cmd *cmd;
> +	struct sk_buff *skb;
> +
> +	skb = ath10k_wmi_alloc_skb(ar, sizeof(*cmd) + 16);
> +	if (!skb)
> +		return -ENOMEM;
> +
> +	cmd = (struct wmi_vdev_install_key_cmd *)skb->data;
> +	memset(cmd, 0, sizeof(*cmd));
> +	cmd->vdev_id = __cpu_to_le32(crashme);
> +
> +	ath10k_info(ar,
> +		    "simulating firmware ASSERT with bad install_key vdev-id: 0x%x\n",
> +		    cmd->vdev_id);

cmd->vdev_id is in little endian here.

> +	return ath10k_wmi_cmd_send(ar, skb,
> +				   ar->wmi.cmd->vdev_install_key_cmdid);
> +}

As this is not a real WMI command, I would actually prefer to have this
in debug.c. With my patch "ath10k: make ath10k_wmi_cmd_send() public"
that's possible now.

I can do the changes and will send v2 shortly. Just need to test it
first.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
