Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.bugwerft.de ([46.23.86.59])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f8JEI-0007IB-Io
 for ath10k@lists.infradead.org; Tue, 17 Apr 2018 05:32:36 +0000
Subject: Re: [ath6kl:pending 83/84]
 drivers/net/wireless/ath/wcn36xx/smd.c:634:22: error: 'vif_priv' undeclared;
 did you mean 'bio_prio'?
References: <201804170947.uUoZ4uiy%fengguang.wu@intel.com>
From: Daniel Mack <daniel@zonque.org>
Message-ID: <f1a50225-2740-4a79-cb32-a576a89586d9@zonque.org>
Date: Tue, 17 Apr 2018 07:32:20 +0200
MIME-Version: 1.0
In-Reply-To: <201804170947.uUoZ4uiy%fengguang.wu@intel.com>
Content-Language: en-US
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
To: kbuild test robot <lkp@intel.com>
Cc: Kalle Valo <kvalo@codeaurora.org>, kbuild-all@01.org, ath10k@lists.infradead.org

On Tuesday, April 17, 2018 03:35 AM, kbuild test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
> head:   bbb4ad4a1c141a8a4c2464d09cb4254640d824b1
> commit: 93d35c09471642344afafa4e848662d93459cb2b [83/84] wcn36xx: send bss_type in scan requests
> config: arm-allmodconfig (attached as .config)
> compiler: arm-linux-gnueabi-gcc (Debian 7.2.0-11) 7.2.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout 93d35c09471642344afafa4e848662d93459cb2b
>         # save the attached .config to linux build tree
>         make.cross ARCH=arm 
> 
> Note: the ath6kl/pending HEAD bbb4ad4a1c141a8a4c2464d09cb4254640d824b1 builds fine.
>       It only hurts bisectibility.
> 
> All errors (new ones prefixed by >>):
> 
>    drivers/net/wireless/ath/wcn36xx/smd.c: In function 'wcn36xx_smd_start_hw_scan':
>>> drivers/net/wireless/ath/wcn36xx/smd.c:634:22: error: 'vif_priv' undeclared (first use in this function); did you mean 'bio_prio'?

Ah, there's a hunk in 5/5 that should be in 4/5. That kills
bisectability. I'll reorder and resend.


Thanks,
Daniel




>      msg_body.bss_type = vif_priv->bss_type;
>                          ^~~~~~~~
>                          bio_prio
>    drivers/net/wireless/ath/wcn36xx/smd.c:634:22: note: each undeclared identifier is reported only once for each function it appears in
> 
> vim +634 drivers/net/wireless/ath/wcn36xx/smd.c
> 
>    619	
>    620	int wcn36xx_smd_start_hw_scan(struct wcn36xx *wcn, struct ieee80211_vif *vif,
>    621				      struct cfg80211_scan_request *req)
>    622	{
>    623		struct wcn36xx_hal_start_scan_offload_req_msg msg_body;
>    624		int ret, i;
>    625	
>    626		mutex_lock(&wcn->hal_mutex);
>    627		INIT_HAL_MSG(msg_body, WCN36XX_HAL_START_SCAN_OFFLOAD_REQ);
>    628	
>    629		msg_body.scan_type = WCN36XX_HAL_SCAN_TYPE_ACTIVE;
>    630		msg_body.min_ch_time = 30;
>    631		msg_body.max_ch_time = 100;
>    632		msg_body.scan_hidden = 1;
>    633		memcpy(msg_body.mac, vif->addr, ETH_ALEN);
>  > 634		msg_body.bss_type = vif_priv->bss_type;
>    635		msg_body.p2p_search = vif->p2p;
>    636	
>    637		msg_body.num_ssid = min_t(u8, req->n_ssids, ARRAY_SIZE(msg_body.ssids));
>    638		for (i = 0; i < msg_body.num_ssid; i++) {
>    639			msg_body.ssids[i].length = min_t(u8, req->ssids[i].ssid_len,
>    640							sizeof(msg_body.ssids[i].ssid));
>    641			memcpy(msg_body.ssids[i].ssid, req->ssids[i].ssid,
>    642			       msg_body.ssids[i].length);
>    643		}
>    644	
>    645		msg_body.num_channel = min_t(u8, req->n_channels,
>    646					     sizeof(msg_body.channels));
>    647		for (i = 0; i < msg_body.num_channel; i++)
>    648			msg_body.channels[i] = req->channels[i]->hw_value;
>    649	
>    650		PREPARE_HAL_BUF(wcn->hal_buf, msg_body);
>    651	
>    652		wcn36xx_dbg(WCN36XX_DBG_HAL,
>    653			    "hal start hw-scan (channels: %u; ssids: %u; p2p: %s)\n",
>    654			    msg_body.num_channel, msg_body.num_ssid,
>    655			    msg_body.p2p_search ? "yes" : "no");
>    656	
>    657		ret = wcn36xx_smd_send_and_wait(wcn, msg_body.header.len);
>    658		if (ret) {
>    659			wcn36xx_err("Sending hal_start_scan_offload failed\n");
>    660			goto out;
>    661		}
>    662		ret = wcn36xx_smd_rsp_status_check(wcn->hal_buf, wcn->hal_rsp_len);
>    663		if (ret) {
>    664			wcn36xx_err("hal_start_scan_offload response failed err=%d\n",
>    665				    ret);
>    666			goto out;
>    667		}
>    668	out:
>    669		mutex_unlock(&wcn->hal_mutex);
>    670		return ret;
>    671	}
>    672	
> 
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
> 


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
