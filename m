Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XdafU-0001wp-HA
 for ath10k@lists.infradead.org; Mon, 13 Oct 2014 08:07:49 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 2/3] ath10k: expose hw restart via debugfs
References: <1412847527-25983-1-git-send-email-michal.kazior@tieto.com>
 <1412847527-25983-3-git-send-email-michal.kazior@tieto.com>
Date: Mon, 13 Oct 2014 11:07:14 +0300
In-Reply-To: <1412847527-25983-3-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Thu, 9 Oct 2014 11:38:46 +0200")
Message-ID: <87bnpg9yvh.fsf@kamboji.qca.qualcomm.com>
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

> Until now it was possible to simulate soft and
> hard fw crashes but it wasn't possible to trigger
> an immediately hw restart itself (without the fw
> crash).
>
> This can be useful when stress testing hw
> restarting stability, e.g. during heavy tx/rx
> traffic.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Nice idea!

> --- a/drivers/net/wireless/ath/ath10k/debug.c
> +++ b/drivers/net/wireless/ath/ath10k/debug.c
> @@ -694,7 +694,8 @@ static ssize_t ath10k_read_simulate_fw_crash(struct file *file,
>  		"To simulate firmware crash write one of the keywords to this file:\n"
>  		"`soft` - this will send WMI_FORCE_FW_HANG_ASSERT to firmware if FW supports that command.\n"
>  		"`hard` - this will send to firmware command with illegal parameters causing firmware crash.\n"
> -		"`assert` - this will send special illegal parameter to firmware to cause assert failure and crash.\n";
> +		"`assert` - this will send special illegal parameter to firmware to cause assert failure and crash.\n"
> +		"`request` - this will simply queue hw restart without fw/hw actually crashing.\n";

"request" is not really very descriptive command. Maybe call it
"hw-restart" because that's what it really does, right?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
