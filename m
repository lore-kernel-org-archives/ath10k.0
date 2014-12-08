Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xy0Uv-0004Gp-AM
 for ath10k@lists.infradead.org; Mon, 08 Dec 2014 15:45:17 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 0/2] ath10k: NF calibration period debugfs file
References: <20141202110443.14817.85639.stgit@potku.adurom.net>
Date: Mon, 8 Dec 2014 17:44:10 +0200
In-Reply-To: <20141202110443.14817.85639.stgit@potku.adurom.net> (Kalle Valo's
 message of "Tue, 2 Dec 2014 13:06:31 +0200")
Message-ID: <87sigqywmt.fsf@kamboji.qca.qualcomm.com>
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
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

Kalle Valo <kvalo@qca.qualcomm.com> writes:

> Hi,
>
> here are some changes I made to Peter's NF calibdation period patches. Please
> review.
>
> v2:
>
> * add _MAX define
>
> * support firmware restart
>
> * set cal_period in wmi_tlv_pdev_param_map
>
> * simplify ar->state check
>
> * rename debugfs file to nf_cal_period to not confuse with cal_data
>   file (which is about calibration data)
>
> * WMI_10X_PDEV_PEER_STA_PS_STATECHG_ENABLE -> WMI_10X_PDEV_PARAM_PEER_STA_PS_STATECHG_ENABLE
>
> ---
>
> Peter Oh (2):
>       ath10k: add new pdev parameters for fw 10.2
>       ath10k: add new wmi interface of NF cal period

Both patches applied. Thanks Peter.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
