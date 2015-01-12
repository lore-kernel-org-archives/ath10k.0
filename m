Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YAdS4-0007ey-5J
 for ath10k@lists.infradead.org; Mon, 12 Jan 2015 11:46:32 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 8/8] ath10k: add support to send delba
References: <1419407949-32367-1-git-send-email-rmanohar@qti.qualcomm.com>
 <1419407949-32367-9-git-send-email-rmanohar@qti.qualcomm.com>
Date: Mon, 12 Jan 2015 13:45:59 +0200
In-Reply-To: <1419407949-32367-9-git-send-email-rmanohar@qti.qualcomm.com>
 (Rajkumar Manoharan's message of "Wed, 24 Dec 2014 13:29:09 +0530")
Message-ID: <87twzwdxxk.fsf@kamboji.qca.qualcomm.com>
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

> This per-station debugfs entry helps to send delba in manual mode
> for debugging purpose. It accepts tid, initiator and reason code
> as inputs.
>
> To send delba,
>
> echo 0 1 37 >/sys/kernel/debug/ieee80211/phyX/netdev:wlanX/
> 	     stations/XX:XX:XX:XX:XX:XX/delba
>
> Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>

[...]

> +	ret = sscanf(buf, "%u %u %u", &tid, &initiator, &reason);
> +	if (ret != 3) {
> +		ath10k_warn(ar, "ex: echo <tid> <initiator> <reason code> >delba\n");
> +		return -EINVAL;
> +	}
> +
> +	/* Valid TID values are 0 through 15 */
> +	if (tid > HTT_DATA_TX_EXT_TID_MGMT - 2) {
> +		ath10k_warn(ar, "Invalid TID %u\n", tid);
> +		return -EINVAL;
> +	}

And I did the same here as well.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
