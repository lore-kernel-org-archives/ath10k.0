Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YYVoU-0005V8-MF
 for ath10k@lists.infradead.org; Thu, 19 Mar 2015 08:28:23 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: fix htt t2h message conflicts among firmware
 revisions
References: <1426066382-481-1-git-send-email-rmanohar@qti.qualcomm.com>
Date: Thu, 19 Mar 2015 10:27:52 +0200
In-Reply-To: <1426066382-481-1-git-send-email-rmanohar@qti.qualcomm.com>
 (Rajkumar Manoharan's message of "Wed, 11 Mar 2015 15:03:02 +0530")
Message-ID: <878uetl7cn.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>, ath10k@lists.infradead.org

Rajkumar Manoharan <rmanohar@qti.qualcomm.com> writes:

> Target to host HTT messages are conflicting between 10.x and other
> firmware revisions. By maintaining separate HTT T2H tables for each
> firmware revisions (main, 10x and tlv) similar to WMI abstraction,
> solves the conflicts.
>
> Cc: Michal Kazior <michal.kazior@tieto.com>
> Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>

So this is needed to get managements frames over HTT working, right?
It's good to mention that in the commit log, does this look ok:

Author: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Date:   Wed Mar 11 15:03:02 2015 +0530

    ath10k: fix htt t2h message conflicts among firmware revisions
    
    Target to host HTT messages are conflicting between 10.x and other
    firmware revisions. By maintaining separate HTT T2H tables for each
    firmware revisions (main, 10x and tlv) similar to WMI abstraction,
    solves the conflicts.
    
    This fix is needed to get management frames over HTT (ie.
    ATH10K_FW_FEATURE_HAS_WMI_MGMT_TX disabled) working with 10.2.4.48-2 firmware.
    Otherwise there will be unknown htt events and nothing works:
    
    [30087.438343] ath10k_pci 0000:02:00.0: htt event (19) not handled
    [30087.448691] ath10k_pci 0000:02:00.0: htt event (19) not handled
    [30149.032974] ath10k_pci 0000:02:00.0: htt event (19) not handled
    
    Cc: Michal Kazior <michal.kazior@tieto.com>
    Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
    Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

> @@ -66,6 +146,26 @@ int ath10k_htt_init(struct ath10k *ar)
>  		8 + /* llc snap */
>  		2; /* ip4 dscp or ip6 priority */
>  
> +	switch (ar->wmi.op_version) {
> +	case ATH10K_FW_WMI_OP_VERSION_MAIN:
> +		ar->htt.t2h_msg_types = htt_main_t2h_msg_types;
> +		ar->htt.t2h_msg_types_max = HTT_MAIN_T2H_NUM_MSGS;
> +		break;
> +	case ATH10K_FW_WMI_OP_VERSION_10_1:
> +	case ATH10K_FW_WMI_OP_VERSION_10_2:
> +	case ATH10K_FW_WMI_OP_VERSION_10_2_4:
> +		ar->htt.t2h_msg_types = htt_10x_t2h_msg_types;
> +		ar->htt.t2h_msg_types_max = HTT_10X_T2H_NUM_MSGS;
> +		break;
> +	case ATH10K_FW_WMI_OP_VERSION_TLV:
> +		ar->htt.t2h_msg_types = htt_tlv_t2h_msg_types;
> +		ar->htt.t2h_msg_types_max = HTT_TLV_T2H_NUM_MSGS;
> +		break;
> +	case ATH10K_FW_WMI_OP_VERSION_UNSET:
> +	case ATH10K_FW_WMI_OP_VERSION_MAX:
> +		WARN_ON(1);
> +		return -EINVAL;
> +	}
>  	return 0;

When I was adding WMI_OP_VERSION, my idea was that we will add similar
version for HTT as well once we need it. But I guess this is good enough
for now, we can add HTT_OP_VERSION later if more changes are needed.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
