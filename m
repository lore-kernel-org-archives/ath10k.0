Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YAdQ4-0005W9-KF
 for ath10k@lists.infradead.org; Mon, 12 Jan 2015 11:44:29 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 7/8] ath10k: add support to send addba response
References: <1419407949-32367-1-git-send-email-rmanohar@qti.qualcomm.com>
 <1419407949-32367-8-git-send-email-rmanohar@qti.qualcomm.com>
Date: Mon, 12 Jan 2015 13:43:46 +0200
In-Reply-To: <1419407949-32367-8-git-send-email-rmanohar@qti.qualcomm.com>
 (Rajkumar Manoharan's message of "Wed, 24 Dec 2014 13:29:08 +0530")
Message-ID: <87y4p8dy19.fsf@kamboji.qca.qualcomm.com>
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

> This per-station debugfs entry helps to send addba response in
> manual mode for debugging purpose. It accepts tid and status code
> as input arguments.
>
> To send addba response,
>
> echo 0 25 >/sys/kernel/debug/ieee80211/phyX/netdev:wlanX/
> 	   stations/XX:XX:XX:XX:XX:XX/addba_resp
>
> Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>

Same here:

--- a/drivers/net/wireless/ath/ath10k/debugfs_sta.c
+++ b/drivers/net/wireless/ath/ath10k/debugfs_sta.c
@@ -148,16 +148,12 @@ static ssize_t ath10k_dbg_sta_write_addba_resp(struct file *file,
        buf[sizeof(buf) - 1] = '\0';
 
        ret = sscanf(buf, "%u %u", &tid, &status);
-       if (ret != 2) {
-               ath10k_warn(ar, "ex: echo <tid> <status code> >addba_resp\n");
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
