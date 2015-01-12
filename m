Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YAdOY-0004kt-6j
 for ath10k@lists.infradead.org; Mon, 12 Jan 2015 11:42:54 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 6/8] ath10k: add support to send addba request
References: <1419407949-32367-1-git-send-email-rmanohar@qti.qualcomm.com>
 <1419407949-32367-7-git-send-email-rmanohar@qti.qualcomm.com>
Date: Mon, 12 Jan 2015 13:42:20 +0200
In-Reply-To: <1419407949-32367-7-git-send-email-rmanohar@qti.qualcomm.com>
 (Rajkumar Manoharan's message of "Wed, 24 Dec 2014 13:29:07 +0530")
Message-ID: <87387gfco3.fsf@kamboji.qca.qualcomm.com>
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
To: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Rajkumar Manoharan <rmanohar@qti.qualcomm.com> writes:

> This per-station debugfs entry helps to send addba request in manual
> mode. Need to pass two configuration parameters (tid, buffer size)
> as input.
>
> To send addba,
>
> echo 1 32 >/sys/kernel/debug/ieee80211/phyX/netdev:wlanX/
> 	   stations/XX:XX:XX:XX:XX:XX/addba
>
> Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>

[...]

> +	ret = sscanf(buf, "%u %u", &tid, &buf_size);
> +	if (ret != 2) {
> +		ath10k_warn(ar, "ex: echo <tid> <buffer size> >addba\n");
> +		return -EINVAL;
> +	}
> +
> +	/* Valid TID values are 0 through 15 */
> +	if (tid > HTT_DATA_TX_EXT_TID_MGMT - 2) {
> +		ath10k_warn(ar, "Invalid TID %u\n", tid);
> +		return -EINVAL;
> +	}

It's preferred that the driver doesn't print anything based on wrong
user input, so I removed these two warning messages:

--- a/drivers/net/wireless/ath/ath10k/debugfs_sta.c
+++ b/drivers/net/wireless/ath/ath10k/debugfs_sta.c
@@ -97,16 +97,12 @@ static ssize_t ath10k_dbg_sta_write_addba(struct file *file,
        buf[sizeof(buf) - 1] = '\0';
 
        ret = sscanf(buf, "%u %u", &tid, &buf_size);
-       if (ret != 2) {
-               ath10k_warn(ar, "ex: echo <tid> <buffer size> >addba\n");
+       if (ret != 2)
                return -EINVAL;
-       }
 
        /* Valid TID values are 0 through 15 */
-       if (tid > HTT_DATA_TX_EXT_TID_MGMT - 2) {
-               ath10k_warn(ar, "Invalid TID %u\n", tid);
+       if (tid > HTT_DATA_TX_EXT_TID_MGMT - 2)
                return -EINVAL;
-       }
 
        mutex_lock(&ar->conf_mutex);
        if ((ar->state != ATH10K_STATE_ON) ||

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
